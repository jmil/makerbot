//Eagle3D 1.05 INC-File  capwima.inc
//created by: INC SRC Compiler v1.06
//created on: 13.11.2006 19:31:48
//(c) 2002-2004 by M. Weisser
//or the author of the macro

#ifndef(__cap_wima_inc)
#declare __cap_wima_inc = true;

#ifndef(inc_testmode)
#declare inc_testmode=true;
#include "tools.inc"
#undef inc_testmode
#end

/********************************************************************************************************************************************
//Wimakondenstor Grundmakro
//by Andreas Rebmann <A.Rebmann-Elektrotechnik(replace with at)t-online.de>
//Grundmacro - Breite=B , Tiefe = T, Hoehe = H, Raster = Ra
********************************************************************************************************************************************/
#macro CAP_DIS_WIMA_GRND(B,T,H,Ra)
union{

box{<-B/2+0.2, 0,     T/2>     <B/2-0.2,H-0.2,-T/2>      rotate<0,0,0> translate<0,0,0>} //Grundkoerper
box{<-B/2,     0,    -T/2+0.2> <B/2,    H-0.2, T/2-0.2>  rotate<0,0,0> translate<0,0,0>} //Kleine Box innen
box{<-B/2+0.2, H-0.2,-T/2+0.2> <B/2-0.2,H    , T/2-0.2>  rotate<0,0,0> translate<0,0,0>} //Kleine Box oben

cylinder{<-B/2+0.2,0,0> <-B/2+0.2, H-0.2> 0.20  rotate<0,0,0> translate <0, 0,  T/2-0.2>} //Rundungen rechts
cylinder{<-B/2+0.2,0,0> <-B/2+0.2, H-0.2> 0.20  rotate<0,0,0> translate <0, 0,-T/2+0.2>} //Rundungen rechts
cylinder{< B/2-0.2,0,0> < B/2-0.2, H-0.2> 0.20  rotate<0,0,0> translate <0, 0,  T/2-0.2>} //Rundungen links
cylinder{< B/2-0.2,0,0> < B/2-0.2, H-0.2> 0.20  rotate<0,0,0> translate <0, 0, -T/2+0.2>} //Rundungen links

sphere{< B/2-0.2, H-0.2, T/2-0.2> 0.2 scale <1,1,1>  translate<0,0,0>}  //Rundungen oben
sphere{< B/2-0.2, H-0.2,-T/2+0.2> 0.2 scale <1,1,1>  translate<0,0,0>}  //Rundungen oben
sphere{<-B/2+0.2, H-0.2, T/2-0.2> 0.2 scale <1,1,1>  translate<0,0,0>}  //Rundungen oben
sphere{<-B/2+0.2, H-0.2,-T/2+0.2> 0.2 scale <1,1,1>  translate<0,0,0>}  //Rundungen oben

cylinder{<-B/2+0.2,  H-0.2> < B/2-0.2, H-0.2> 0.20 rotate<0,0,0> translate <0, 0, T/2-0.2>}   //Rundungen vorne
cylinder{<-B/2+0.2,  H-0.2> < B/2-0.2, H-0.2> 0.20 rotate<0,0,0> translate <0, 0,-T/2+0.2>}   //Rundungen hinten
cylinder{<-T/2+0.2,  H-0.2> < 0, H-0.2> 0.20 rotate<0, 90,0> translate <-B/2+0.2, 0, 0>}  //Rundungen rechts kurz
cylinder{<-T/2+0.2,  H-0.2> < 0, H-0.2> 0.20 rotate<0,-90,0> translate <-B/2+0.2, 0, 0>}  //Rundungen rechts kurz
cylinder{<-T/2+0.2,  H-0.2> < 0, H-0.2> 0.20 rotate<0, 90,0> translate < B/2-0.2, 0, 0>}  //Rundungen links kurz
cylinder{<-T/2+0.2,  H-0.2> < 0, H-0.2> 0.20 rotate<0,-90,0> translate < B/2-0.2, 0, 0>}  //Rundungen links kurz

//Drahtdurchmesser und Beschriftung an die Kondensatorgroesse anpassen

#if(pin_short=on)
#local wima_pin_length = -1*(pin_length+pcb_height);
#else
#local wima_pin_length = -5;
#end

#if (Ra=2.54)    //d=0.4mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.20 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.20 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<1.0,1.0,1.0> pigment {Black} rotate<0,180,0> translate<B/2-0.6, H-4.3, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<1.4,1.4,1.4> pigment {Black} rotate<0,180,0> translate<B/2-0.6, H-2.8, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=5.08)    //d=0.5mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.25 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.25 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<1.4,1.4,1.4> pigment {Black} rotate<0,180,0> translate<B/2-1.2, H-4.3, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<2.0,2.0,2.0> pigment {Black} rotate<0,180,0> translate<B/2-1.2, H-2.8, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=7.50)    //d=0.7mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.35 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.35 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<2.0,2.0,2.0> pigment {Black} rotate<0,180,0> translate<B/2-1.8, H-5.5, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<2.7,2.7,2.7> pigment {Black} rotate<0,180,0> translate<B/2-1.8, H-3.3, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=10.0)    //d=0.7mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.35 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.35 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<2.4,2.4,2.4> pigment {Black} rotate<0,180,0> translate<B/2-2.5, H-6.0, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<3.1,3.1,3.1> pigment {Black} rotate<0,180,0> translate<B/2-2.5, H-3.5, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=15.0)    //d=0.8mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.40 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.40 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<3.0,3.0,3.0> pigment {Black} rotate<0,180,0> translate<B/2-4.0, H-7.0, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<3.7,3.7,3.7> pigment {Black} rotate<0,180,0> translate<B/2-4.0, H-4.0, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=22.5)    //d=0.8mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.40 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.40 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<3.5,3.5,3.5> pigment {Black} rotate<0,180,0> translate<B/2-6.5, H-9.0, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<4.2,4.2,4.2> pigment {Black} rotate<0,180,0> translate<B/2-6.5, H-6.0, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=27.5)    //d=1.0mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.50 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.50 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<4.0,4.0,4.0> pigment {Black} rotate<0,180,0> translate<B/2-10.0, H-12.0, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<4.7,4.7,4.7> pigment {Black} rotate<0,180,0> translate<B/2-10.0, H- 8.0, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

#if (Ra=37.5)    //d=1.0mm
cylinder{<-Ra/2 ,0> <-Ra/2,wima_pin_length,0> 0.50 texture{col_silver}}   // Draht rechts senkrecht
cylinder{< Ra/2 ,0> < Ra/2,wima_pin_length,0> 0.50 texture{col_silver}}   // Draht links senkrecht
text {ttf besch_font  value   0.1, 0 scale<4.5,4.5,4.5> pigment {Black} rotate<0,180,0> translate<B/2-15.0, H-15.0, T/2+0.1> rotate<0,0,0>} //Beschriftung Value
text {ttf besch_font "WIMA"   0.1, 0 scale<5.2,5.2,5.2> pigment {Black} rotate<0,180,0> translate<B/2-15.0, H-10.0, T/2+0.1> rotate<0,0,0>} //Beschriftung WIMA
#else
#end

pigment {Red}}
#end

// Raster 2.54
#macro CAP_DIS_WIMA_25_025_046_075(value)
object{CAP_DIS_WIMA_GRND(4.6,2.5,7.5,2.54,)}
#end
#macro CAP_DIS_WIMA_25_030_046_075(value)
object{CAP_DIS_WIMA_GRND(4.6,3.0,7.5,2.54,)}
#end
#macro CAP_DIS_WIMA_25_040_046_090(value)
object{CAP_DIS_WIMA_GRND(4.6,4.6,9.0,2.54,)}
#end
#macro CAP_DIS_WIMA_25_050_046_100(value)
object{CAP_DIS_WIMA_GRND(4.6,5.5,10.0,2.54,)}
#end
#macro CAP_DIS_WIMA_25_060_046_100(value)
object{CAP_DIS_WIMA_GRND(4.6,6.5,10.0,2.54,)}
#end
//Raster 5.08
#macro CAP_DIS_WIMA_5_025_072_065(value)
object{CAP_DIS_WIMA_GRND(7.2,2.5,6.5,5.08,)}
#end
#macro CAP_DIS_WIMA_5_030_072_075(value)
object{CAP_DIS_WIMA_GRND(7.2,3.0,7.5,5.08,)}
#end
#macro CAP_DIS_WIMA_5_035_072_085(value)
object{CAP_DIS_WIMA_GRND(7.2,3.5,8.5,5.08,)}
#end
#macro CAP_DIS_WIMA_5_045_072_095(value)
object{CAP_DIS_WIMA_GRND(7.2,4.5,9.5,5.08)}
#end
#macro CAP_DIS_WIMA_5_050_072_100(value)
object{CAP_DIS_WIMA_GRND(7.2,5.0,10.0,5.08)}
#end
#macro CAP_DIS_WIMA_5_055_072_115(value)
object{CAP_DIS_WIMA_GRND(7.2,5.5,11.5,5.08)}
#end
#macro CAP_DIS_WIMA_5_072_072_130(value)
object{CAP_DIS_WIMA_GRND(7.2,7.2,13.0,5.08)}
#end
#macro CAP_DIS_WIMA_5_085_072_140(value)
object{CAP_DIS_WIMA_GRND(7.2,8.5,14.0,5.08)}
#end
//Raster 7.5
#macro CAP_DIS_WIMA_75_030_100_085(value)
object{CAP_DIS_WIMA_GRND(10.0,3.0,8.5,7.5)}
#end
#macro CAP_DIS_WIMA_75_040_100_090(value)
object{CAP_DIS_WIMA_GRND(10.0,4.0,9.0,7.5)}
#end
#macro CAP_DIS_WIMA_75_050_103_105(value)
object{CAP_DIS_WIMA_GRND(10.3,5.0,10.5,7.5)}
#end
#macro CAP_DIS_WIMA_75_057_100_125(value)
object{CAP_DIS_WIMA_GRND(10.3,5.7,12.5,7.5)}
#end
//Raster 10
#macro CAP_DIS_WIMA_100_040_130_095(value)
object{CAP_DIS_WIMA_GRND(13.0,4.0,9.5,10.0)}
#end
#macro CAP_DIS_WIMA_100_050_130_110(value)
object{CAP_DIS_WIMA_GRND(13.0,5.0,11.0,10.0)}
#end
#macro CAP_DIS_WIMA_100_060_130_120(value)
object{CAP_DIS_WIMA_GRND(13.0,6.0,12.0,10.0)}
#end
//Raster 15
#macro CAP_DIS_WIMA_150_050_180_110(value)
object{CAP_DIS_WIMA_GRND(18.0,5.0,11.0,15.0)}
#end
#macro CAP_DIS_WIMA_150_060_180_125(value)
object{CAP_DIS_WIMA_GRND(18.0,6.0,12.5,15.0)}
#end
#macro CAP_DIS_WIMA_150_070_180_140(value)
object{CAP_DIS_WIMA_GRND(18.0,7.0,14.0,15.0)}
#end
#macro CAP_DIS_WIMA_150_080_180_150(value)
object{CAP_DIS_WIMA_GRND(18.0,8.0,15.0,15.0)}
#end
#macro CAP_DIS_WIMA_150_090_180_160(value)
object{CAP_DIS_WIMA_GRND(18.0,9.0,16.0,15.0)}
#end
//Raster 22.5
#macro CAP_DIS_WIMA_225_060_265_150(value)
object{CAP_DIS_WIMA_GRND(26.5,6.0,15.0,22.5)}
#end
#macro CAP_DIS_WIMA_225_070_265_165(value)
object{CAP_DIS_WIMA_GRND(26.5,7.0,16.5,22.5)}
#end
#macro CAP_DIS_WIMA_225_085_265_185(value)
object{CAP_DIS_WIMA_GRND(26.5,8.5,18.5,22.5)}
#end
#macro CAP_DIS_WIMA_225_105_265_190(value)
object{CAP_DIS_WIMA_GRND(26.5,10.5,19.0,22.5)}
#end
#macro CAP_DIS_WIMA_225_110_265_210(value)
object{CAP_DIS_WIMA_GRND(26.5,11.0,21.0,22.5)}
#end
//Raster 27.5
#macro CAP_DIS_WIMA_275_090_315_210(value)
object{CAP_DIS_WIMA_GRND(31.5,9.0,21.0,27.5)}
#end
#macro CAP_DIS_WIMA_275_110_315_210(value)
object{CAP_DIS_WIMA_GRND(31.5,11.0,21.0,27.5)}
#end
#macro CAP_DIS_WIMA_275_130_315_240(value)
object{CAP_DIS_WIMA_GRND(31.5,13.0,24.0,27.5)}
#end
#macro CAP_DIS_WIMA_275_150_315_260(value)
object{CAP_DIS_WIMA_GRND(31.5,15.0,26.0,27.5)}
#end
#macro CAP_DIS_WIMA_275_170_315_345(value)
object{CAP_DIS_WIMA_GRND(31.5,17.0,34.5,27.5)}
#end
#macro CAP_DIS_WIMA_275_200_315_395(value)
object{CAP_DIS_WIMA_GRND(31.5,20.0,39.5,27.5)}
#end
//Raster 37.5
#macro CAP_DIS_WIMA_375_150_415_260(value)
object{CAP_DIS_WIMA_GRND(41.5,15.0,26.0,37.5)}
#end
#macro CAP_DIS_WIMA_375_190_415_320(value)
object{CAP_DIS_WIMA_GRND(41.5,19.0,32.0,37.5)}
#end
#macro CAP_DIS_WIMA_375_200_415_395(value)
object{CAP_DIS_WIMA_GRND(41.5,20.0,39.5,37.5)}
#end

//End of Macros

/**********************************************************************
Testing
**********************************************************************/
#ifndef(inc_testmode)
          
//Size of the Grid Plane (+/- span)
#local XYZ_span=20;

//Orientation axes
cylinder{<-XYZ_span,0,0><XYZ_span,0,0>0.1 pigment{Blue}}	//X
cylinder{<0,-XYZ_span,0><0,XYZ_span,0>0.1 pigment{Red}}		//Y
cylinder{<0,0,-XYZ_span><0,0,XYZ_span>0.1 pigment{Yellow}}	//Z

// Useful GRIDS:
#local XYZ_step= 1 ;          // axis increment
#local XYZ_cnt = 0;           //  loop counter
#local xyz_thick = 0.05;     // grid line thickness

// GRID PLANES: Remove comment begin/end to activate & select PLANES:
#while (XYZ_cnt <= XYZ_span)

	cylinder{<-XYZ_span,0,XYZ_cnt><XYZ_span,0,XYZ_cnt>xyz_thick pigment{Blue}}		// Positive Z-Lines
	cylinder{<-XYZ_span,0,-XYZ_cnt><XYZ_span,0,-XYZ_cnt>xyz_thick pigment{Blue}}	// Negative Z-Lines
	
	//cylinder{<0,XYZ_cnt,-XYZ_span><0,XYZ_cnt,XYZ_span>xyz_thick pigment{Red}}		// Positive Y-Z Plane Lines
	//cylinder{<0,-XYZ_cnt,-XYZ_span><0,-XYZ_cnt,XYZ_span>xyz_thick pigment{Red}}	// Negative Y-Z Plane Lines
	
	//cylinder{<-XYZ_span,XYZ_cnt,0><XYZ_span,XYZ_cnt,0>xyz_thick pigment{Red}}		// Positive Y-X Plane Lines
	//cylinder{<-XYZ_span,-XYZ_cnt,0><XYZ_span,-XYZ_cnt,0>xyz_thick pigment{Red}}	// Negative Y-X Plane Lines
	
	cylinder{<XYZ_cnt,0,-XYZ_span><XYZ_cnt,0,XYZ_span>xyz_thick pigment{Yellow}}	// Positive X-Lines
	cylinder{<-XYZ_cnt,0,-XYZ_span><-XYZ_cnt,0,XYZ_span>xyz_thick pigment{Yellow}}	// Negative X-Lines

	#local XYZ_cnt = XYZ_cnt+XYZ_step;
#end

camera
{       
	#local tt = 40;				//let's you change the distance easily
	location <-tt,tt,-tt>
	//location<0,5,-50>			//alternate location
	look_at <0,0,0>				//best to select the approximate centre of the object
	angle 30
}

light_source { <100, 100, -100> White}
light_source { <-100, 100, -100> White }
light_source { <-100, 100, 100> White }
light_source { <100, 100, 100> White }
//light_source { <-tt,tt,-tt> White }
//light_source { <-tt,tt,-tt> White }
//light_source { <-tt,tt,-tt> White }
background{Grey}

#end

#end

