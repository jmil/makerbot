//Eagle3D 1.05 INC-File  transistor.inc
//created by: INC SRC Compiler v1.06
//created on: 13.11.2006 19:31:48
//(c) 2002-2004 by M. Weisser
//or the author of the macro

#ifndef(__transistor_inc)
#declare __transistor_inc = true;

#ifndef(inc_testmode)
#declare inc_testmode=true;
#include "tools.inc"
#undef inc_testmode
#end

/********************************************************************************************************************************************
// Author      : Sven-Mortem Resch (sven-mortem.resch(replace with at)gmx.de
// Name        : Macro TR_SOT93_GRND - SOT93 Transistor package
// Created     : 18.03.2006
// Modified    : 18.03.2006 by Sven-Mortem Resch
// Version     : 1.0
// Arguments   : M = Montagelage (mounting position) => H = horizontal, V = vertikal
//               O = Offset des Bauteils bezueglich 0 auf der Z-Achse (Z-Offset)
//               S = Offset des Bauteils bezueglich = auf der Y-Achse (Y-Separation)
//               B = Position des Knicks der Pins auf der Z-Achse (Bend position)
//               V = Beschriftung (Value)
// Description : Dieses Macro generiert ein SOT93 Package fuer horizontale und vertikale Montage.
//               This macro generates a SOT93 package for horizontal and vertical mounting.
********************************************************************************************************************************************/
#macro TR_SOT93_GRND(M, O, S, B, V)
#local Horizontal =! (strcmp(strupr(M), "H") );
#local ww = 1.3; 
#local wt = 0.78;

union {
 difference {
  union {
   box {<-7.5, 0, -2.45><7.5, 12.2, 2.45>} //Koerper
   pigment{Gray30}
  }
  union {
   cylinder{<0, 3, -2><0, 3, -2.5> 1.2} //Vertiefung in der Mitte
   cone {<-7, 3, 1.08>, 1, <-7, 3, -2.5>, 1.2} //Aussparung links
   cone {<7, 3, 1.08>, 1, <7, 3, -2.5>, 1.2} //Aussparung rechts
   box {<-8, 0, 0><8, 1, -4> rotate <-7,0,0> translate <0, 12.1, 1.08>} //Abschraegung Gehaeuse oben
   box {<-7.6, 0, 0><7.6, 1, -2.6> rotate <7,0,0> translate <0, -1, 0>} //Abschraegung Gehaeuse unten vorn
   box {<-7.6, 0, 0><7.6, 1, -2.6> rotate <-7,0,0> translate <0, -0.65, 2.6>} //Abschraegung Gehaeuse unten hinten
   box {<-0.5, 0, -2.6><0.5, 12.2, 2.5> rotate <0,-7,0> translate <-7.87, 0, 0>} //Abschraegung Gehaeuse links
   box {<-0.5, 0, -2.6><0.5, 12.2, 2.5> rotate <0,7,0> translate <7.87, 0, 0>} //Abschraegung Gehaeuse rechts
   pigment{Gray30}
  }
 } 
 difference {
  box {<-7.5, 12.2, 2.45><7.5, 20.35, 1.08>}  //Kuehlfahne
  cylinder {<0, 16.2, 2.5><0, 16.2, 0>, 2} //Bohrung Kuehlfahne
  box {<0, 0, 0><3, 3, 3> rotate <0,0,45> translate <-7.5,18.23,0>} //Abschraegung links Kuehlfahne
  box {<0, 0, 0><3, 3, 3> rotate <0,0,45> translate <7.5,18.23,0>} //Abschraegung rechts Kuehlfahne
  texture {col_silver}
 }
 //Pins
 #if(pin_short=off)
   #local p_height = 8.85;
  #else
   #local p_height = pcb_height+S;
  #end 
 //Pins vertikale Version
 #if (Horizontal = no)
  union {
   union {
    box{<0, 0, 0><1.8, -1.8, wt>}
    box{<0, -1.8, 0><1.3, -p_height, wt>}
    texture {col_silver}
   } 
   union {
    box{<0, 0, 0><1.8, -1.8, wt>}
    box{<0.25, -1.8, 0><1.55, -p_height, wt>}
    texture {col_silver}
    translate <5.55, 0, 0>
   }
   union {
    box{<0, 0, 0><1.8, -1.8, wt>}
    box{<0.5, -1.8, 0><1.8, -p_height, wt>}
    texture {col_silver}
    translate <11.1, 0, 0>
   }
   translate <-6.45,0,-wt/2>
  }
 #else
  //Pins horizontale Version
  union {
   difference {
    union {
     box{<0, 0, 0><1.8, -1.8, wt>}
     box{<0, -1.8, 0><ww, -B-wt, wt>}
     box{<0, -B-(wt/2),wt/2><ww, -B-(wt/2)-wt, 4+S>}
     box{<0, -B, wt/2><1.3, -B-0.9, (wt/2)+0.9>} 
     cylinder{<0, -B-wt, wt/2><1.3, -B-wt, wt/2>, wt/2}
    }
     cylinder{<-0.1, -B, wt+(wt/2)><1.4, -B, wt+(wt/2)>, wt/2}
   }
   difference {
    union {
     box{<0, 0, 0><1.8, -1.8, wt>}
     box{<0.25, -1.8, 0><ww+0.25, -B-wt, wt>}
     box{<0.25, -B-(wt/2),wt/2><ww+0.25, -B-(wt/2)-wt, 4+S>}
     box{<0.25, -B, wt/2><1.55, -B-0.9, (wt/2)+0.9>} 
     cylinder{<0.25, -B-wt, wt/2><1.55, -B-wt, wt/2>, wt/2}
    }
     cylinder{<0.24, -B, wt+(wt/2)><1.55, -B, wt+(wt/2)>, wt/2}
     translate <5.55, 0, 0>
   }  
   difference {
    union {
     box{<0, 0, 0><1.8, -1.8, wt>}
     box{<0.5, -1.8, 0><ww+0.5, -B-wt, wt>}
     box{<0.5, -B-(wt/2),wt/2><ww+0.5, -B-(wt/2)-wt, 4+S>}
     box{<0.5, -B, wt/2><1.8, -B-0.9, (wt/2)+0.9>} 
     cylinder{<0.5, -B-wt, wt/2><1.8, -B-wt, wt/2>, wt/2}
    }
     cylinder{<0.49, -B, wt+(wt/2)><1.81, -B, wt+(wt/2)>, wt/2}
     translate <11.1, 0, 0>
   }
   texture {col_silver}
   translate <-6.45,0,-wt/2>
  }
 #end 
 //Beschriftung
 text {ttf global_fontfile_arial V 1, 0 scale 2.5 translate <-4.5,6,-2.455> pigment{Gray70}}
 
 //In endgueltige Position bringen
 #if (Horizontal = yes)
  rotate <90,0,0>
  translate <0,2.45+S, O>
 #else
  translate <0,1.8+S, 0>
 #end
}
#end



#macro TR_SOT93_H(value) 
object{TR_SOT93_GRND("H",-3.3,0,3.6,value)}
#end
#macro TR_SOT93_V(value) 
object{TR_SOT93_GRND("V",-3.18,0,0,value)}
#end

/********************************************************************************************************************************************
//TO18D metal cup
//daniel cardona dancardona50(replace with at)hotmail.com
********************************************************************************************************************************************/
#macro TR_TO18D_GRND(value)
union{
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<-0.8,0,-0.8>}                                          //linker Pin
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<1,0,1>}                                            //hinterer Pin Gehaeuse
union{                                                                                                          //Transitorkoerper
torus{1.6 0.8 pigment {Silver} translate <0.12,19.3,0>}

cylinder{<0,14,0><0,19.3,0>2.4 pigment{ Silver}translate<0.12,0,0>}
cylinder{<0,19.3,0><0,20.1,0>1.6 pigment{ Silver}translate<0.12,0,0>}
cylinder{<0,13.9,0><0,14,0>2.9 pigment{ Silver}translate<0.12,0,0>}}
box {<-0.56,0,2.6><0.56,0.1,4.2> pigment {Silver}  translate <0.12,13.9,0> rotate <0,-90,0> }
text {ttf besch_font value 1, 0 pigment { Black } scale <0.7,1,0.7> rotate <90,135,0> translate<1,20.101,0.5>}                                //Beschriftung
translate<0,-11,-0.22> rotate <0,-135,0> }
#end

#macro TR_TO18D(value)
object{TR_TO18D_GRND(value)}
#end

/********************************************************************************************************************************************
//TO18 Gehaeuse stehend
//Robert Eckelmann <dc6xs(replace with at)dc6xs.de>
********************************************************************************************************************************************/
#macro TR_TO18_GRND(value)
union{
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<-1.27,0,-1.27>}                                          //linker Pin
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<1.27,0,1.27>}                                            //hinterer Pin Gehaeuse
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<1.27,0,-1.27>}                                           //rechter Pin
union{                                                                                                          //Transitorkoerper
torus{1.6 0.8 pigment {Silver} translate <0.12,19.3,0>}
cylinder{<0,14,0><0,19.3,0>2.4 pigment{ Silver}translate<0.12,0,0>}
cylinder{<0,19.3,0><0,20.1,0>1.6 pigment{ Silver}translate<0.12,0,0>}
cylinder{<0,13.9,0><0,14,0>2.9 pigment{ Silver}translate<0.12,0,0>}}
box {<-0.56,0,2.6><0.56,0.1,4.2> pigment {Silver}  translate <0.12,13.9,0> rotate <0,-90,0> }
text {ttf besch_font value 1, 0 pigment { Black } scale <0.7,1,0.7> rotate <90,0,0> translate<-1.5,20.101,-.5>}                                //Beschriftung
translate<-0.24,-11,-0.22>}
#end

#macro TR_TO18(value)
object{TR_TO18_GRND(value)}
#end

/********************************************************************************************************************************************
//TO220 Gehaeuse liegend (kurz Beine bis zur Biegung)
//Tobias Mueller <Tobias_Mueller(replace with at)twam.info>
********************************************************************************************************************************************/
#macro TR_TO220_L2_GRND(value)
union{
union{
union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}
translate <0,0,2.54>}
union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}
translate<-2.54,0,2.54>}
union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}
translate<2.54,0,2.54>}
translate<0,-6.58,-4>}
union{
difference{
box{<-5.1,22.6,4.5><5.1,29,4.5-1.27>}
cylinder{<0,0,0><0,0,2>1.9 translate<0,26.2,2.6>}
box{<0,0,0><1,3,3> rotate<0,0,20> translate<5.1,26.5,2>}
box{<0,0,0><-1,3,3> rotate<0,0,-20> translate<-5.1,26.5,2>}}
box{<-4,22.6,4.5><4,16,4.501>}
difference{
box{<-5.1,13.5,0><5.1,22.6,4.5>}
box{<-5.5,0,0><5.5,3,-2> rotate<45,0,0> translate<0,22.6-1.8,0> }
box{<-5.5,0,0><5.5,-1,2> rotate<-20,0,0> translate<0,13.5,3.7> }
cylinder{<0,14.5,0.1><0,14.5,-0.05>0.7}
pigment{Gray30}}
text{ttf besch_font value 0.5,0 pigment{White} scale<1.7,2,1.7>
translate<-3.5,18,-0.01>}
box{<0,2,0><1.5,3.7,0.6> translate<-0.75,9.8,1.5>}
box{<0,2,0><1.5,3.7,0.6> translate<-0.75,0,1.5>
translate<2.54,9.8,0>}
box{<0,2,0><1.5,3.7,0.6> translate<-0.75,0,1.5>
translate<-2.54,9.8,0>}
translate<-0,-13.5,0>rotate<90,0,0>translate<-0,4,1.3>}
translate<0,0.6,-2.7>
texture{col_silver}}
#end

#macro TR_TO220_L2(value)
object{TR_TO220_L2_GRND(value)}
#end

/********************************************************************************************************************************************
//TO220 Gehaeuse liegend
********************************************************************************************************************************************/
#macro TR_TO220_L_GRND(value)
union{union{union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}}
union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}translate<-2.54,0,0>}
union{
difference{
box{<-0.375,0,0><0.375,8.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45-0.375,0,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3-0.375,0,-0.2>}}
difference{
cylinder{<-0.375,8.5,0.6><0.375,8.5,0.6>0.6}
cylinder{<-0.38,8.0,1.1><0.38,8.0,1.1>0.5}}
box{<-0.375,8.5,0.6><0.375,9.1,4.0>}translate<2.54,0,0>}
translate<0,-6.58,-4>}
union{
difference{
box{<-5.1,22.6,4.5><5.1,29,4.5-1.27>}
cylinder{<0,0,0><0,0,2>1.9 translate<0,26.2,2.6>}
box{<0,0,0><1,3,3> rotate<0,0,20> translate<5.1,26.5,2>}
box{<0,0,0><-1,3,3> rotate<0,0,-20> translate<-5.1,26.5,2>}}
box{<-4,22.6,4.5><4,16,4.501>}
difference{
box{<-5.1,13.5,0><5.1,22.6,4.5>}
box{<-5.5,0,0><5.5,3,-2> rotate<45,0,0> translate<0,22.6-1.8,0> }
box{<-5.5,0,0><5.5,-1,2> rotate<-20,0,0> translate<0,13.5,3.7> }
cone{<-5.4,16.5,-0.01>1.4<-5.4,16.5,3.23>1.2}
cone{<5.4,16.5,-0.01>1.4<5.4,16.5,3.23>1.2}
cylinder{<0,14.5,0.1><0,14.5,-0.05>0.7}
pigment{Gray30}}
text{ttf besch_font value 0.5,0 pigment{White} scale<1.7,2,1.7> translate<-3.5,18,-0.01>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.75,9.8,1.5>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.75,0,1.5> translate<2.54,9.8,0>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.75,0,1.5> translate<-2.54,9.8,0>}
translate<-0,-13.5,0>rotate<90,0,0>translate<-0,4,1.3>}
translate<0,0.6,-2.7>
texture{col_silver}}
#end

#macro TR_TO220_L(value)
object{TR_TO220_L_GRND(value)}
#end

/********************************************************************************************************************************************
//TO220 Gehaeuse stehend
********************************************************************************************************************************************/
#macro TR_TO220_S_GRND(value)
union{union{union{
#if(pin_short=off)
#local tr_to220_s_pin = 9.5;
#else
#local tr_to220_s_pin = 9.5-(pcb_height+pin_length);
#end
difference{
box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}}
difference{
box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
translate<-2.54,0,0>}
difference{
box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
translate<2.54,0,0>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.375,9.8,0>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<2.54,9.8,0>}
box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<-2.54,9.8,0>}
translate<-0.75/2,0,1.6>}
difference{
box{<-5.1,22.6,4.5><5.1,29,4.5-1.27>}
cylinder{<0,0,0><0,0,2>1.9 translate<0,26.2,2.6>}
box{<0,0,0><1,3,3> rotate<0,0,20> translate<5.1,26.5,2>}
box{<0,0,0><-1,3,3> rotate<0,0,-20> translate<-5.1,26.5,2>}}
box{<-4,22.6,4.5><4,16,4.501>}
texture{col_silver}}
difference{
box{<-5.1,13.5,0><5.1,22.6,4.5>}
box{<-5.5,0,0><5.5,3,-2> rotate<45,0,0> translate<0,22.6-1.8,0> }
box{<-5.5,0,0><5.5,-1,2> rotate<-20,0,0> translate<0,13.5,3.7> }
cone{<-5.4,16.5,-0.01>1.4<-5.4,16.5,3.23>1.2}
cone{<5.4,16.5,-0.01>1.4<5.4,16.5,3.23>1.2}
cylinder{<0,14.5,0.1><0,14.5,-0.05>0.7}
pigment{Gray30}}
text{ttf besch_font value 0.5,0 pigment{White} scale<1.7,2,1.7> translate<-3.5,18,-0.01>}
translate<0,-9.5,-4.5>}
#end

#macro TR_TO220_S(value)
object{TR_TO220_S_GRND(value)}
#end

/********************************************************************************************************************************************
//TO220 5-Pin Gehaeuse mit geraden Pins, stehend
//dahamm(replace with at)gmx.net
********************************************************************************************************************************************/
#macro TR_TO220_T05A_S_GRND(value)
union{	
	union{
		union{
			#if(pin_short=off)
				#local tr_to220_s_pin = 9.5;
			#else
				#local tr_to220_s_pin = 9.5-(pcb_height+pin_length);
			#end
			difference{
				box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
				box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
				box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
			}
			difference{
				box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
				box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
				box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
				translate<-1.778,0,0>
			}
			difference{
				box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
				box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
				box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
				translate<1.778,0,0>
			}
			difference{
				box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
				box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
				box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
				translate<3.556,0,0>
			}
			difference{
				box{<0,tr_to220_s_pin,0><0.75,13.5,0.6>}
				box{<0,0,0><1,1,1> rotate<0,0,-25> translate<0.45,tr_to220_s_pin,-0.2>}
				box{<0,0,0><-1,1,1> rotate<0,0,25> translate<0.3,tr_to220_s_pin,-0.2>}
				translate<-3.556,0,0>
			}
			box{<0,0,0><1.5,3.7,0.6> translate<-0.375,9.8,0>}
			box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<1.778,9.8,0>}
			box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<-1.778,9.8,0>}
			box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<3.556,9.8,0>}
			box{<0,0,0><1.5,3.7,0.6> translate<-0.375,0,0> translate<-3.556,9.8,0>}
			translate<-0.75/2,0,1.6>
		}
		difference{
			box{<-5.1,22.6,4.5><5.1,29,4.5-1.27>}
			cylinder{<0,0,0><0,0,2>1.9 translate<0,26.2,2.6>}
			box{<0,0,0><1,3,3> rotate<0,0,20> translate<5.1,26.5,2>}
			box{<0,0,0><-1,3,3> rotate<0,0,-20> translate<-5.1,26.5,2>}
		}
		box{<-4,22.6,4.5><4,16,4.501>}
		texture{col_silver}
	}
	difference{
		box{<-5.1,13.5,0><5.1,22.6,4.5>}
		box{<-5.5,0,0><5.5,3,-2> rotate<45,0,0> translate<0,22.6-1.8,0> }
		box{<-5.5,0,0><5.5,-1,2> rotate<-20,0,0> translate<0,13.5,3.7> }
		cone{<-5.4,16.5,-0.01>1.4<-5.4,16.5,3.23>1.2}
		cone{<5.4,16.5,-0.01>1.4<5.4,16.5,3.23>1.2}
		cylinder{<0,14.5,0.1><0,14.5,-0.05>0.7}
		pigment{Gray30}
	}
	text{ttf besch_font value 0.5,0 pigment{White} scale<1.7,2,1.7> translate<-3.5,18,-0.01>}
	translate<0,-9.5,-4.5>
}
#end

#macro TR_TO220_T05A_S(value)
object{TR_TO220_T05A_S_GRND(value)}
#end

/********************************************************************************************************************************************
//TO39 metal cup
//daniel cardona<dancardona50(replace with at)hotmail.com>
********************************************************************************************************************************************/
#macro TR_TO39_GRND(value)
union{
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<0,0,-2.54>}      //linker Pin
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate<0,0, 2.54>}      //hinterer Pin Gehaeuse
cylinder{<0,0,0><0,14,0>0.24 texture{col_silver} translate< 2.54,0,0>}      //rechter Pin
union{                                                                                                          //Transitorkoerper
torus{4.2 0.8 pigment {P_Silver3} translate <0.12,19.3,0>}
cylinder{<0,14,0><0,19.3,0>5 pigment{ P_Silver3}translate<0.12,0,0>}
cylinder{<0,19.3,0><0,20.1,0>4.2 pigment{ P_Silver3}translate<0.12,0,0>}
cylinder{<0,13.9,0><0,14,0>5.6  pigment{P_Silver3}translate<0.12,0,0>}}
box {<-0.56,0,2.6><0.56,0.1,6.2> pigment{P_Silver3}  translate <0.12,13.9,0> rotate <0,-135,0> }
text {ttf besch_font value 1, 0 pigment { Black } scale <1,1,1> rotate <90,0,0> translate<-1.5,20.2,-.5>}                                //Beschriftung
finish {
    ambient 0.25
    brilliance 4
    diffuse 0.5
    metallic
    specular 0.80
    roughness 1/80
    reflection 0.5
}
pigment{ P_Silver3}
translate<-0.24,-11,-0.22>}
#end

#macro TR_TO39(value)
object{TR_TO39_GRND(value)}
#end

/********************************************************************************************************************************************
//TO3 metal cup
//daniel cardona<dancardona50(replace with at)hotmail.com>
********************************************************************************************************************************************/
#macro TR_TO3_GRND(value)
union{
union{
difference{
   cylinder { <0, 0, 0>, <0, 1, 0>, 5   }
    cylinder { <0, -0.5, 0>, <0, 1.1, 0>, 2.3   }
translate <15,0,0>
} 
difference{
   cylinder { <0, 0, 0>, <0, 1, 0>, 5   }
    cylinder { <0, -0.5, 0>, <0, 1.1, 0>, 2.3   } 
translate <-15,0,0> 
}    
translate<0,0,0>}
union{  
box {<0, 0, 0> < 13,  1,  3> translate <-11.8,0,9.5>rotate <0,-30,0>}
box {<0, 0, 0> < 13,  1,  3> translate <0.2,0,-12.7>rotate <0,-30,0>}
box {<0, 0, 0> < 13,  1,  3> translate <-2,0,9.4>rotate <0,30,0>}
box {<0, 0, 0> < 13,  1,  3> translate <-13.2,0,-12.7>rotate <0,30,0>}
 cylinder{<0,0,0><0,4,0>0.6 translate<-1.8,-3,-5.4>} 
 cylinder{<0,0,0><0,4,0>0.6 translate<-1.8,-3,5.4>} 
cylinder{<0,0,0><0,1,0>12.7}
  cylinder{<0,1,0><0,2,0>11.6}
   cylinder{<0,2,0><0,8,0>10} 
    torus{9.2 0.8  translate <0,8,0>}
     cylinder{<0,8,0><0,8.8,0>9.2} 
text {ttf besch_font value 0.5, 0 pigment { Black } scale <5,1,5> rotate <90,0,0> translate<-5,8.81,0>} 
translate<0,0,0>} 


pigment{P_Chrome5}

finish {
    ambient 0.25
    brilliance 4
    diffuse 0.5
    metallic
    specular 0.80
    roughness 1/80
    reflection 0.5
}

}
#end

#macro TR_TO3(value)
object{TR_TO3_GRND(value)}
#end

/********************************************************************************************************************************************
//TO52 metal case
//Designed by Philippe Boucheny <philippe.boucheny(replace with at)free.fr>
//Rev. 1.1  20/12/05
********************************************************************************************************************************************/
#macro TR_TO32_GRND(value,npin)
union{
    //case
    cylinder{<0,0,0><0,3.5-0.3,0>2.35 pigment{P_Silver3} }                                      
    cylinder{<0,3.5-0.3,0><0,3.5,0>2.05 pigment{P_Silver3}}   
    torus{2.05 0.3 pigment {P_Silver3} translate (3.5-0.3)*y}
    torus{2.45 0.3 pigment {P_Silver3} translate 0.3*y}
    cylinder{<0,0,0><0,0.6,0>2.45 pigment{P_Silver3}}   
    box {<-0.5,0,0><0.5,0.6,3.3> pigment{P_Silver3}  translate <0,0,0> rotate <0,135,0> }
    text {ttf besch_font value 1, 0 pigment { Black } scale <1,1,1> rotate <90,0,0> translate<-1.5,3.52,-.4>}
    //pins
    #if(npin=2)
        #if(pin_short=off)
            cylinder{<+1.27,0,0><+1.27,-12.7,0>0.2 pigment{ P_Silver3}}   
            cylinder{<-1.27,0,0><-1.27,-12.7,0>0.2 pigment{ P_Silver3}}   
        #else
            cylinder{<+1.27,0,0><+1.27,-(pin_length+pcb_height),0>0.2 pigment{ P_Silver3}}   
            cylinder{<-1.27,0,0><-1.27,-(pin_length+pcb_height),0>0.2 pigment{ P_Silver3}}   
        #end
    #else
        #if(pin_short=off)
            cylinder{<+1.27,0,0><+1.27,-12.7,0>0.2 pigment{ P_Silver3}}   
            cylinder{<-1.27,0,0><-1.27,-12.7,0>0.2 pigment{ P_Silver3}}   
            cylinder{<0,0,+1.27><0,-12.7,+1.27>0.2 pigment{ P_Silver3}}   
        #else
            cylinder{<+1.27,0,0><+1.27,-(pin_length+pcb_height),0>0.2 pigment{ P_Silver3}}   
            cylinder{<-1.27,0,0><-1.27,-(pin_length+pcb_height),0>0.2 pigment{ P_Silver3}}   
            cylinder{<0,0,+1.27><0,-(pin_length+pcb_height),+1.27>0.2 pigment{ P_Silver3}}   
        #end
    #end
    }
    translate<0,1,0>
#end

#macro TR_TO51(value)
object{TR_TO32_GRND(value,2)}
#end
#macro TR_TO52(value)
object{TR_TO32_GRND(value,3)}
#end
#macro TR_TO52A(value)
object{TR_TO32_GRND(value,3)}
#end

/********************************************************************************************************************************************
//TO66 metal cup
//daniel cardona<dancardona50(replace with at)hotmail.com>
********************************************************************************************************************************************/
#macro TR_TO66_GRND(value)
union{
union{
difference{
   cylinder { <0, 0, 0>, <0, 1, 0>, 3.6   }
    cylinder { <0, -0.5, 0>, <0, 1.1, 0>, 1.8   }
translate <12,0,0>
} 
difference{
   cylinder { <0, 0, 0>, <0, 1, 0>, 3.6   }
    cylinder { <0, -0.5, 0>, <0, 1.1, 0>, 1.8   } 
translate <-12,0,0> 
}    
translate<0,0,0>}
union{  
box {<0, 0, 0> < 10,  1,  3.7> translate <-9,0,5.>rotate <0,-25,0>}
box {<0, 0, 0> < 10,  1,  3.7> translate <-1.4,0,-8.7>rotate <0,-25,0>}
box {<0, 0, 0> < 10,  1,  3.7> translate <-1,0,4.6>rotate <0,25,0>}
box {<0, 0, 0> < 10,  1,  3.7> translate <-9.4,0,-8.7>rotate <0,25,0>}
 cylinder{<0,0,0><0,4,0>0.6 translate<-2.6,-3,-2.8>} 
 cylinder{<0,0,0><0,4,0>0.6 translate<-2.6,-3,2.8>} 
cylinder{<0,0,0><0,1,0>8.6}
  cylinder{<0,1,0><0,2,0>7.6}
   cylinder{<0,2,0><0,8,0>6} 
    torus{5.2 0.8  translate <0,8,0>}
     cylinder{<0,8,0><0,8.8,0>5.2} 
text {ttf besch_font value 0.5, 0 pigment { Black } scale <2,1,2> rotate <90,0,0> translate<-4,8.81,0>} 
translate<0,0,0>} 


pigment{P_Chrome5}

finish {
    ambient 0.25
    brilliance 4
    diffuse 0.5
    metallic
    specular 0.80
    roughness 1/80
    reflection 0.5
}

}
#end

#macro TR_TO66(value)
object{TR_TO66_GRND(value)}
#end

/********************************************************************************************************************************************
//TO92 Gehaeuse stehend mittlerer Pin gebogen
********************************************************************************************************************************************/
#macro TR_TO92_G_GRND(value)
union{

	#if(pin_short=off)
		box{<0,0,0><0.48,14,0.44> texture{col_silver} translate<-1.27,0,0>}                                               //linker Pin
		box{<0,0,0><0.48,11.5,0.44> texture{col_silver} translate <0,0,1.905> }                                            //mittlerer Pin unten
		box{<0,0,0><0.48,14,0.44> texture{col_silver} translate<1.27,0,0>}                                              //rechter Pin
	#else
		box{<0,11-(pcb_height+pin_length),0><0.48,14,0.44> texture{col_silver} translate<-1.27,0,0>}                                               //linker Pin
		box{<0,11-(pcb_height+pin_length),0><0.48,11.5,0.44> texture{col_silver} translate <0,0,1.905> }                                            //mittlerer Pin unten
		box{<0,11-(pcb_height+pin_length),0><0.48,14,0.44> texture{col_silver} translate<1.27,0,0>}                                                //rechter Pin
	#end

	box{<0,13.15,0><0.48,14,0.44> texture{col_silver} }                                                                //mittlerer Pin Gehaeuse
	box{<0,0,0><0.48,2.8,0.44> texture{col_silver} rotate -45*x translate <0,11.18,1.35+0.665> }                            //mittlerer Pin Schraege
	box{<-0.1,12,0><0.58,13,0.44> texture{col_silver} translate<-1.27,0,0>}                                           //Abstandhalter links
	box{<-0.1,12,0><0.58,13,0.44> texture{col_silver} translate<1.27,0,0>}                                            //Abstandhalter rechts
	difference{                                                                                             //Transitorkoerper
	cylinder{<0,14,0><0,19.2,0>2.4 pigment{ Gray30}translate<0.12,0,0>}
	box{<-3,13.9,-1><3,20,-3> pigment{ Gray30}}}
	text {ttf besch_font value 1, 0 pigment { White } translate<-1.8,17,-1.01>}                            //Beschriftung
	translate<-0.24,-11,-0.22>
}
#end

#macro TR_TO92_G(value)
object{TR_TO92_G_GRND(value)}
#end

/********************************************************************************************************************************************
//TO92 Gehaeuse stehend mittlerer Pin nicht gebogen
********************************************************************************************************************************************/
#macro TR_TO92_L_GRND(value)
union{

	#if(pin_short=off)
		box{<0,0,0><0.48,10,0.44> translate<-2.54,0,0>}                                               //linker Pin
		box{<0,0,0><0.48,14,0.44> }                                                                   //mittlerer Pin
		box{<0,0,0><0.48,10,0.44> translate<2.54,0,0>}                                                //rechter Pin
	#else
		box{<0,9.5-(pcb_height+pin_length),0><0.48,10,0.44> translate<-2.54,0,0>}                                               //linker Pin
		box{<0,9.5-(pcb_height+pin_length),0><0.48,14,0.44> }                                                                   //mittlerer Pin
		box{<0,9.5-(pcb_height+pin_length),0><0.48,10,0.44> translate<2.54,0,0>}                                                //rechter Pin
	#end

	box{<-0.24,0,0><0.24,2,0.44> rotate<0,0,-40> translate<-2.30,9.85,0>}
	box{<-0.24,0,0><0.24,2,0.44> rotate<0,0,40> translate< 2.78,9.85,0>}
	box{<0,11.25,0><0.48,14,0.44> translate<-1.27,0,0>}                                               //linker Pin
	box{<0,11.25,0><0.48,14,0.44> translate<1.27,0,0>}                                                //rechter Pin
	box{<-0.1,12,0><0.58,13,0.44> translate<-1.27,0,0>}                                           //Abstandhalter links
	box{<-0.1,12,0><0.58,13,0.44> }                                                               //Abstandhalter mitte
	box{<-0.1,12,0><0.58,13,0.44> translate<1.27,0,0>}                                            //Abstandhalter rechts
	difference{                                                                                             //Transitorkoerper
	cylinder{<0,14,0><0,19.2,0>2.4 pigment{ Gray30}translate<0.12,0,0>}
	box{<-3,13.9,-1><3,20,-3> pigment{ Gray30}}}
	text {ttf besch_font value 1, 0 pigment { White } translate<-1.8,17,-1.01>}                            //Beschriftung
	texture{col_silver}
	translate<-0.24,-9.5,-1.5>
}
#end

#macro TR_TO92_L(value)
object{TR_TO92_L_GRND(value)}
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

