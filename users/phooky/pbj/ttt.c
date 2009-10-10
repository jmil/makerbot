/*
This file is part of TTT.  TTT is free software; you can redistribute
it and/or modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2 of the
License, or (at your option) any later version.  TTT is distributed in
the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with TTT; if not, write to the Free Software Foundation, Inc.,
59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

Copyright © 2005 Chris Radek
<chris@timeguy.com>

This source gets compiled into 2 executables. The first, ttt generates
G-code from a true type font and a text string. The second executable
is ttt_dxf which generates an autocad dxf file from a true type font
and a text string.

example commandline:
ttt "Hello World" > hw.ngc
ttt_dxf "Hello World" > hw.dxf

MANY THANKS go to Lawrence Glaister <ve7it@shaw.ca> for updates based
on the new FreeType FT_Outline API and .pfb support!
*/

#include <stdio.h>
#include <getopt.h>
#include <locale.h>
#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_OUTLINE_H

#undef __FTERRORS_H__
#define FT_ERRORDEF( e, v, s )  { e, s },
#define FT_ERROR_START_LIST     {
#define FT_ERROR_END_LIST       { 0, 0 } };

const struct ftError
{
  int          err_code;
  const char*  err_msg;
} ft_errors[] =
#include FT_ERRORS_H

// define the number of linear segments we use to approximate beziers
// in the gcode and the number of polyline control points for dxf code.
#define CSTEPS 10

#define NEQ(a,b) ((a).x != (b).x || (a).y != (b).y)
#define SQ(a) ((a)*(a))
#define CUBE(a) ((a)*(a)*(a))

// this is the default font used if not specified on commandline
#define TTFONT "/usr/share/fonts/truetype/freefont/FreeSans.ttf"

#ifdef DXF
static int bootstrap = 1;
#endif
static FT_Vector last_point;
static int debug = 0;

double scale_factor = 1.0/100.0;
double feedrate = 40000.0;
int invert_y = 1;

double scale(double d) {
  return d * scale_factor;
}

double scale_y(double d) {
  return scale(d) * (invert_y?-1.0:1.0);
}

// routine to print out hopefully-useful error messages
void handle_ft_error(char *where, int f, int x) 
{
    const struct ftError *e = &ft_errors[0];
    for(;e->err_msg && e->err_code != f;e++) ;
    if(e->err_msg) {
        fprintf(stderr, "Fatal error in %s: %s (%d) at line:%d\n", where, e->err_msg, f, x);
    } else {
        fprintf(stderr, "Fatal error in %s: %d at line:%d\n", where, f,x);
    }
    exit(x);
}

// start: M106
// stop: M107
// M126
// G4 P100
// M127

void write_stop() {
  printf("M107\n");
  printf("M126\n");
  printf("G4 P100\n");
  printf("M127\n");
}

void write_start() {
  printf("M106\n");
}

// move with 'pen up' to a new position and then put 'pen down' 
int my_move_to( FT_Vector* to, void* user )
{
#ifdef DXF
    /* every move but the first one means we are starting a new polyline */
    /* make sure we terminate previous polyline with a seqend */
    if(bootstrap == 0) printf("  0\nSEQEND\n");
    bootstrap=0;
    printf("  0\nPOLYLINE\n  8\n0\n 66\n     1\n 10\n0.0\n 20\n0.0\n 30\n0.0\n");
    printf("  0\nVERTEX\n  8\n0\n 10\n%ld.000\n 20\n%ld.000\n 30\n0.0\n",
           to->x, to->y);
#else
    if (debug) printf("(moveto %.2f,%.2f)\n", scale(to->x), scale_y(to->y));
    write_stop();
    printf("G00 X%.2f Y%.2f\n", scale(to->x), scale_y(to->y));
    write_start();
#endif
    last_point.x = to->x;
    last_point.y = to->y;

    return 0;
}

// plot with pen down to a new endpoint drawing a line segment 
// Linear Bézier curves (a line)
// B(t)=(1-t)P0 + tP1,  t in [0,1]. 
int my_line_to( FT_Vector* to, void* user )
{
#ifdef DXF
	printf("  0\nVERTEX\n  8\n0\n 10\n%ld.000\n 20\n%ld.000\n 30\n0.0\n",
           to->x,to->y);
#else
	if (debug) printf("(lineto %.2f,%.2f)\n",scale(to->x),scale_y(to->y));
	printf("G01 X%.2f Y%.2f\n",  scale(to->x),scale_y(to->y));
#endif
    last_point.x = to->x;
    last_point.y = to->y;

    return 0;
}

// draw a second order curve from current pos to 'to' using control
// Quadratic Bézier curves (a curve)
// B(t) = (1 - t)^2A + 2t(1 - t)B + t^2C,  t in [0,1]. 
int my_conic_to( FT_Vector* control, FT_Vector* to, void* user )
{
	int t;
    double x,y;        

#ifndef DXF
    /*
    if (debug) printf("(conicto %.2f,%.2f via %d,%d)\n",
		      scale(to->x),scale(to->y),control->x,control->y);
    */
#endif
	for(t=1; t<=CSTEPS; t++) {
		float tf = (float)t/(float)CSTEPS;
        x = SQ(1-tf) * last_point.x + 2*tf*(1-tf) * control->x + SQ(tf) * to->x;
        y = SQ(1-tf) * last_point.y + 2*tf*(1-tf) * control->y + SQ(tf) * to->y;
#ifdef DXF
		printf("  0\nVERTEX\n  8\n0\n 10\n%f\n 20\n%f\n 30\n0.0\n",x,y);
#else
		printf("G01 X%.2f Y%.2f\n",scale(x),scale_y(y));
#endif
	}

    last_point.x = to->x;
    last_point.y = to->y;
    return 0;
}

// draw a cubic spline from current pos to 'to' using control1,2
// Cubic Bézier curves ( a compound curve )
// B(t)=A(1-t)^3 + 3Bt(1-t)^2 + 3Ct^2(1-t) + Dt^3 , t in [0,1]. 
int my_cubic_to(FT_Vector* control1, FT_Vector* control2,
                                 FT_Vector *to, void* user)
{
	int t;
    double x,y;

#ifndef DXF
    /*
    if (debug) printf("(cubicto %d,%d via %d,%d and %d,%d)\n",
                       to->x,to->y,control1->x,control1->y,
                       control2->x,control2->y);
    */
#endif

	for(t=1; t<=CSTEPS; t++) {
		float tf = (float)t/(float)CSTEPS;
        x = CUBE(1-tf)*last_point.x     + 
            SQ(1-tf)*3*tf*control1->x   +
            SQ(tf)*(1-tf)*3*control2->x +
            CUBE(tf)*to->x;
        y = CUBE(1-tf)*last_point.y     + 
            SQ(1-tf)*3*tf*control1->y   +
            SQ(tf)*(1-tf)*3*control2->y +
            CUBE(tf)*to->y;;
#ifdef DXF
		printf("  0\nVERTEX\n  8\n0\n 10\n%f\n 20\n%f\n 30\n0.0\n",x,y);
#else
		printf("G01 X%.2f Y%.2f\n",scale(x),scale_y(y));
#endif
	}

    last_point.x = to->x;
    last_point.y = to->y;

    return 0;
}

// lookup glyph and extract all the shapes required to draw the outline
static long int render_char(FT_Face face, wchar_t c, long int offset) {
	int error;
	int glyph_index;
	FT_Outline outline;
    FT_Outline_Funcs func_interface;

    /* lookup glyph */
	glyph_index = FT_Get_Char_Index(face, (FT_ULong)c);
	if(!glyph_index) handle_ft_error("FT_Get_Char_Index", 0, __LINE__);

    /* load glyph */
	error = FT_Load_Glyph(face, glyph_index, FT_LOAD_NO_BITMAP);
	if(error) handle_ft_error("FT_Load_Glyph", error, __LINE__);

    /* shortcut to the outline for our desired character */
	outline = face->glyph->outline;

    /* set up entries in the interface used by FT_Outline_Decompose() */
    func_interface.shift = 0;
    func_interface.delta = 0;
    func_interface.move_to = my_move_to;
    func_interface.line_to = my_line_to;
    func_interface.conic_to = my_conic_to;
    func_interface.cubic_to = my_cubic_to;

    /* offset the outline to the correct position in x */
    FT_Outline_Translate( &outline, offset, 0L );

    /* plot the current character */
    error = FT_Outline_Decompose( &outline, &func_interface, NULL);
	if(error) handle_ft_error("FT_Outline_Decompose", error, __LINE__);

    /* offset will get bumped up by the x size of the char just plotted */
	return face->glyph->advance.x;
}

int main(int argc, char **argv) {
	FT_Library library;
	FT_Face face;
	int error;
	int i, l;
	long int offset;
    int unicode = 0;
	char *s;
    char *ttfont = TTFONT;

    while((i = getopt(argc, argv, "udf:?")) != -1) {
        switch(i) {
        case 'd':
            debug=1;
            break;
        case 'f':
            ttfont = optarg;
            break;
        case 'u':
            unicode = 1;
            break;
        case '?':
            fprintf(stderr, "%s [-?] [-u] [-f /some/file.ttf] 'The Text'\n", 
                    argv[0]);
        default:
            return 99;
        }
    }

	error = FT_Init_FreeType(&library);
	if(error) handle_ft_error("FT_Init_FreeType", error, __LINE__);

	error = FT_New_Face(library, ttfont, 0, &face);
	if(error) handle_ft_error("FT_New_Face", error, __LINE__);

    /* An error can occur with a fixed-size font format (like FNT or PCF) 
      when trying to set the pixel size to a value that is not listed in the 
      face->fixed_sizes array.
    */
#define MYFSIZE 64
	error = FT_Set_Pixel_Sizes(face, 0, MYFSIZE);     
	if(error) handle_ft_error("FT_Set_Pixel_Sizes", error, __LINE__);

    if(unicode) {
        setlocale(LC_CTYPE, "");
    }
	
    /* grab the text string to plot or use default string */
	if(optind < argc )
		s=argv[optind];
	else
		s="Hello world.";

    /* write out preamble */
#ifdef DXF
	printf("  0\nSECTION\n  2\nENTITIES\n");
#else
    printf("(font: %s)\n",ttfont);
    if(!unicode) {
        printf("(text: ");
        for ( i=0; i<strlen(s); i++)
            if(isalnum(s[i]))
                printf("%c", s[i]);
            else
                printf("*");
        printf(")\n");
    }
    //printf("#1=0.1   (SafeHeight)\n#2=0.01  (Depth of CUT)\n#3=0.0003 (Scale)\n#4=10.0  (Feed)\n");
    printf("G21\n"); // metric like a fucking unicorn
    printf("G90\n"); // absolute positioning like a goddamn griffin
    printf("G92 X0 Y0 Z0\n"); // go to zero like a goddamn loser
    printf("G00 Z0 F%.2f\n",feedrate); // go to zero like a goddamn loser
    write_start();
#endif

	offset = 0;

    /* loop through rendering all the chars in the string */
    l = strlen(s);
    while(*s) {
        wchar_t wc;
        int r = mbtowc(&wc, s, l);
        if(r==-1) { s++; continue; }
    
#ifndef DXF
        if(!unicode) {
            /* comment gcode at start of each letter               */
            /* to keep out of trouble, only print numbers/letters, */
            /* The rest get hex representation                     */
            if(isalnum(s[i]))
                printf("(start of symbol %c)\n", wc);
            else
                printf("(start of symbol 0x%02X)\n", wc);
        }
#endif
		offset += render_char(face, wc, offset);
        s += r; l -= r;
	}

    /* write out the post amble stuff */
#ifdef DXF
	printf("  0\nSEQEND\n");
	printf("  0\nENDSEC\n  0\nEOF\n");
#else
	write_stop();
	printf("M107\n");
	printf("M126\n");
	printf("G00 Z10 F150\n");
	printf("M127\n");
	printf("M18\n"); // you may go
#endif
	return 0;
}

// vim: ts=4


