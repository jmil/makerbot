//Eagle3D 1.05 INC-File  connector.inc
//created by: INC SRC Compiler v1.06
//created on: 13.11.2006 19:31:48
//(c) 2002-2004 by M. Weisser
//or the author of the macro

#ifndef(__connector_inc)
#declare __connector_inc = true;

#ifndef(inc_testmode)
#declare inc_testmode=true;
#include "tools.inc"
#undef inc_testmode
#end

/********************************************************************************************************************************************
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
********************************************************************************************************************************************/
#macro ARK_PIN()
union{
	cylinder{<0,-3,0><0,1.1,0>0.4 texture{col_silver}}
	cone{<0,-3,0>0.4<0,-3.5,0>0.1 texture{col_silver}}
	difference{
		box{<-2.54,0,-4><2.54,10,4>}
		box{<-2.04,1,-4.01><2.04,6,3>}
		box{<-0.75,-0.1,-4.01><0.75,1.1,1>}
		box{<-2.6,5,0><2.6,0,-3> rotate<30,0,0> translate<0,7,-4>}
		box{<-2.6,5,0><2.6,0,3> rotate<-30,0,0> translate<0,7,4>}
		cylinder{<0,5.9,0><0,10.1,0>1.4}
		cone{<0,9,0>1.4<0,10.1,0>1.8}
	}
	superellipsoid{<1,0.1> rotate<90,0,0> scale<1,2.3,1> texture{col_silver} translate<0,7,0>}
	difference{
		superellipsoid{<1,0.1> rotate<90,0,0> scale<1.3,0.5,1.3> texture{col_silver} translate<0,9.5,0>}
		box{<0.25,0,-2><-0.25,1,2>rotate<0,rand(global_seed)*180,0> translate<0,9.8,0>}
	}
	difference{
		box{<-2,1.1,-2.5><2,5.9,2.5>}
		cylinder{<0,3.5,-2.6><0,3.5,2.6>1.4}
		cylinder{<0,3.5,0><0,6,0>1.4}
		texture{col_silver}
	}
	pigment{Gray60}
	translate<0,0.2,0>
}
#end


/********************************************************************************************************************************************
//MOSES <iloff(replace with at)mosesele.de>
//Jumper
********************************************************************************************************************************************/
#macro CON_JUMPER()
union{
difference{
box{<0,0,0><2.54,6.0,2.00> translate<-1.27,2.5,-1.27>}
box{<0,0,0><0.635,10.0,0.635> translate<-0.3175,2.5,-0.3175>}
pigment{MediumBlue}translate<-1.27,0,0>}
difference{
box{<0,0,0><2.54,6.0,2.00> translate<-1.27,2.5,-1.27>}
box{<0,0,0><0.635,10.0,0.635> translate<-0.3175,2.5,-0.3175>}
pigment{MediumBlue} translate<1.27,0,0>}}                                        
#end


/********************************************************************************************************************************************
//Pin fuer Buchsenleiste (flache Bauform), hinzugefuegt von B.Redemann www.b-redemann.de
********************************************************************************************************************************************/
#macro CON_PBL_F()
union{

difference{
	box{<0,0,0><0.5,3,0.3> translate<-0.25,-3,-0.15>}
	box{<0,0,-0.5><0.5,0.5,0.5> rotate<0,0,-30> translate<0.1,-3,0>}
	box{<0,0,-0.5><-0.5,0.5,0.5> rotate<0,0,30> translate<-0.1,-3,0>}
	box{<-0.5,0,0><0.5,0.5,0.5> rotate<30,0,0> translate<0,-3,0.05>}
	box{<-0.5,0,0><0.5,0.5,-0.5> rotate<-30,0,0> translate<0,-3,-0.05>}
	texture{col_gold}
}                                
difference{
	difference{
		box{<-1.27,0,-1.27><1.27,3,1.27>}
		box{<-1.27,-0.1,-1.27><1.27,3.1,1.27> rotate<0,45,0> translate<-1.95,0,-1.95> }
		box{<-1.27,-0.1,-1.27><1.27,3.1,1.27> rotate<0,45,0> translate< 1.95,0,-1.95> }
		box{<-1.27,-0.1,-1.27><1.27,3.1,1.27> rotate<0,45,0> translate<-1.95,0, 1.95> }
		box{<-1.27,-0.1,-1.27><1.27,3.1,1.27> rotate<0,45,0> translate< 1.95,0, 1.95> }
	}
	cylinder{<0,1,0><0,3.1,0>1.0}
}

difference{
	cylinder{<0,2.5,0><0,3.03,0>1.0}
	cylinder{<0,1.9,0><0,3.2,0>0.9}	
	texture{col_silver}
}

difference{
	cylinder{<0,0.5,0><0,2.55,0>0.9}
	cylinder{<0,0.4,0><0,2.6,0>0.7}	
	texture{col_gold}
}
pigment{Gray30}}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Phoenix - Grund-Gehaeuse Kunststoff
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGH()
union{
	difference{ 
		box{<-1,0,-1.905><8,7,1.905> }
		cylinder{<-1.1,5,0><0.6,5,0>0.65 }
		box{<-1.1,6,-1.4><-0.8,6.5,1.4> }
		box{<-1.1,-0.1,-1.4><-0.8,4,1.4> }
		box{<-1.1,-0.1,-0.5><-0.2,3,0.5> }
		box{<-1.1,-0.1,-1.4><1.2,1.3,1.4> }
		box{<-1.1,-0.1,-1.4><2.4,0.3,1.4> }
		box{<2,0.6,-1.7><8.1,5.5,1.7> }
		box{<2,5.4,-0.6><8.1,6,0.6> }
		box{<2,5.9,-1.5><8.1,6.7,1.5> }
		pigment{ForestGreen}
	}
	//Rundung unten
	difference{ 
		cylinder{<2,-1.0,0><8,-1.0,0>2.0 }
		box{<1.9,-3.1,-2.1><8.1,0.1,2.1> }
		pigment{ForestGreen} 
	}
	//Oben auf
	cylinder{<5,7,-1.905><5,7,1.905>0.2 pigment{ForestGreen}}
	//Links
	box{<6,2,-1.9><8,3.3,-2.1> pigment{ForestGreen}}
	box{<7.5,0.5,-1.9><8,6.5,-2.1> pigment{ForestGreen}}
	//Rechts
	box{<6,2,1.9><8,3.3,2.1> pigment{ForestGreen}}
	box{<7.5,0.5,1.9><8,6.5,2.1> pigment{ForestGreen}}
}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Phoenix - Gegenstecker Kunststoff MC 1,5/xx-ST-381  
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGSG()
union{
   difference { 
   merge{
      box{<0,0,-1.905><9,9.5,1.905> }
      box{<4,9.5,-1.905><9,11,1.905> }
      box{<-6.2,4,-1.5><0,8,1.5> }
      box{<-6.1,8,-0.4><-4,9,0.4> }
      sphere { <2.05, 9.5, 0>, 0.5 }
      cylinder{<4,9.5,0><4,11,0>1.905 }
      cylinder{<9,7.1,-1.905><9,7.1,1.905>0.3 }

   }
      box{<0.3,0.8,-0.75><9.5,5.5,0.75> }
      box{<8.5,0.5,-1.2><9.5,6.5,1.2> }
      box{<6.3,10.5,-0.9><7,11.1,0.9> }
      box{<-2,-2,-2><2,2,2> rotate<0,0,12> translate<9.9,9.5,0>}
      cylinder{<4,7,0><4,11.1,0>1.4 }
      cylinder{<-6.3,6.5,0><1.5,6.5,0>0.5}
      cylinder{<-6.3,6.5,0><-5.8,6.5,0>0.9}
      cylinder{<-6.3,2.5,0><0,2.5,0>2.0}
   }
   cylinder{<7.5,10.70,-1.905><7.5,10.70,1.905>0.3 }
   pigment{ForestGreen}
}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Phoenix - Gegenstecker MCVW 1,5/xx-ST-381 (type =0)
// und MCVR 1,5/xx-ST-381 (type =1) Kunststoffteil
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGSRW(typ)
union{
	difference{
	union{
		box{<-1.5,0,-1.9><1.5,-6.6,2.2>}
		box{<-0.4,-6.5,-1.9><0.4,-4,-3.2> }
	}
	cylinder{<0,0.1,3.7><0,-6.7,3.7>2.0}
	cylinder{<0,0.1,0><0,-6.7,0>0.5}
	cylinder{<0,-6.0,0><0,-6.7,0>0.9}
	#if (typ = 1) //MVCR
	   rotate <0,180,0>
	#end
	}
	difference{
		union{
			box{<-1.905,0,3.7><1.905,11.6,-4.6>}
			cylinder{<-1.905,7.3,4.9><1.905,7.3,4.9>0.3 }      
			box{<-1.905,0,3.7><1.905,7.3,5.2>}
			box{<-1.905,7.3,3.7><1.905,7.6,4.9>}
			box{<-1.905,0,-4.6><1.905,2.45,-5.2>}
		}
		box{<-1.95,0,-2.2><1.95,2.0,2.2> rotate <70,0,0> translate <0,9.7,2.9>}
		box{<-0.9,2.7,5.3><0.9,5.5,-4>}
		box{<-1.5,2.5,5.3><1.5,6.6,4>}      
	}
	difference{
		union{
			cylinder{<-1.905,12.2,2.7><1.905,12.2,2.7>0.3 }
			cylinder{<-1.905,12.2,-1.65><1.905,12.2,-1.65>0.3 }
			box{<-1.905,11.9,2.7><1.905,12.5,-1.65>}
			cylinder{<-1.905,11.9,-4.9><1.905,11.9,-4.9>0.3 }
			box{<-1.905,11.6,2.1><1.905,12.2,-4.9>}
		}
		cylinder{<0,10.6,0><0,12.6,0>1.4}
	}   
	pigment{ForestGreen}   
}      
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Nummer
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHNR(n)
union{
	box{<-1.905,0,-1.75><1.905,0.1,1.75> pigment{White}}
	box{<-1.89,0,-1.75><-1.905,0.25,1.75> pigment{Gray20}}
	box{<1.905,0,-1.75><1.89,0.25,1.75> pigment{Gray20}}
	#if (n < 10) 
		text {ttf besch_font str(n,0,0) 0.2,0  scale<3.5,3.5,3.5> pigment{Gray20} rotate<90,180,0> translate<0.8,0.2,1.2> }
	#else
		text {ttf besch_font str(n,0,0) 0.2,0  scale<3.0,3.5,3.5> pigment{Gray20} rotate<90,180,0> translate<1.5,0.2,1.2> }
	#end
}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Phoenix - Kontakt (gerade)   
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHPIN()
difference{
	box{<-0.35,-3.5,-0.35><0.35,7.5,0.35>}
	// anspitzen oben
	box{<0,0,-0.7><0.7,0.7,0.7> rotate<0,0,30> translate<0.4,7,0>}
	box{<0,0,-0.7><-0.7,0.7,0.7> rotate<0,0,-30> translate<-0.4,7,0>}
	box{<-0.7,0,0><0.7,0.7,0.7> rotate<-30,0,0> translate<0,7,0.4>}
	box{<-0.7,0,0><0.7,0.7,-0.7> rotate<30,0,0> translate<0,7,-0.4>}
	// anspitzen unten      
	box{<0,0,-0.7><0.7,0.7,0.7> rotate<0,0,-30> translate<0.1,-3.5,0>}
	box{<0,0,-0.7><-0.7,0.7,0.7> rotate<0,0,30> translate<-0.1,-3.5,0>}
	box{<-0.7,0,0><0.7,0.7,0.7> rotate<30,0,0> translate<0,-3.5,0.1>}
	box{<-0.7,0,0><0.7,0.7,-0.7> rotate<-30,0,0> translate<0,-3.5,-0.1>}     
	texture{col_silver}
}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Phoenix - Kontakt Winkel   
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHPINW()
difference{
	//#macro RECT_BOGEN(i_radius,winkel,dicke,breite,laenge1,laenge2)
	object {TOOLS_RECT_BOGEN(0.1,90,0.7,0.7,6,7)}
	//laenge1 anspitzen
	box{<0,0,-0.7><0.7,0.7,0.7> rotate<0,0,30> translate<0.4,7,0>}
	box{<0,0,-0.7><-0.7,0.7,0.7> rotate<0,0,-30> translate<-0.4,7,0>}
	box{<-0.7,0,0><0.7,0.7,0.7> rotate<-30,0,0> translate<0,7,0.4>}
	box{<-0.7,0,0><0.7,0.7,-0.7> rotate<30,0,0> translate<0,7,-0.4>}
	//laenge2 anspitzen
	box{<0,0,-0.7><0.7,0.7,0.7> rotate<0,0,-30> translate<6,0.4,0>}
	box{<0,0,-0.7><0.7,-0.7,0.7> rotate<0,0,30> translate<6,-0.4,0>}
	box{<0,-0.7,0><0.7,0.7,0.7> rotate<0,30,0> translate<6,0,0.4>}
	box{<0,-0.7,0><0.7,0.7,-0.7> rotate<0,-30,0> translate<6,0,-0.4>}
	texture{col_silver} rotate<0,0,-90> translate<0,3.0,0>
}
#end


/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Schraubenkopf
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_SCREWHEAD()
difference{
	superellipsoid{<1,0.1> rotate<90,0,0> scale<1.4,0.5,1.4> translate<0,0,0>}
	box{<0.25,0,-2><-0.25,1,2>rotate<0,30,0> translate<0,0,0>}
	texture{col_silver}
}
#end


/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de> 
// Grundmakro: Kunststoffkoerper von geraden und abgewinkelten Molex-Stiftleisten RM 2.54.
// Parameter: Anzahl Pins. (-> Breite. Hoehe/Tiefe sind konstant fuer alle Groessen.)
// Bezugspunkt: Mitte der Pins in Auflageflaeche (gerade Ausfuehrung).
********************************************************************************************************************************************/
#macro MOLEX254(Pins)
union{
difference{
box{<0,0,-2.5><Pins*2.54,3,3>}
#local i=0; #while (i<Pins) box{<0.77+i*2.54,-0.1,-3><1.77+i*2.54,0.8,4>} #local i=i+1; #end }
box{<1.27,2,-2.5><(Pins-0.5)*2.54,11.3,-1.7>}
box{<1.27,5.8,-2><(Pins-0.5)*2.54,7.5,-1.4>}
translate <-Pins*1.27,0,0> texture {col_Molex}}
#end


/********************************************************************************************************************************************
//Pin fuer Buchsenleiste
********************************************************************************************************************************************/
#macro PBL()
union{

difference{
	box{<0,0,0><0.5,3,0.3> translate<-0.25,-3,-0.15>}
	box{<0,0,-0.5><0.5,0.5,0.5> rotate<0,0,-30> translate<0.1,-3,0>}
	box{<0,0,-0.5><-0.5,0.5,0.5> rotate<0,0,30> translate<-0.1,-3,0>}
	box{<-0.5,0,0><0.5,0.5,0.5> rotate<30,0,0> translate<0,-3,0.05>}
	box{<-0.5,0,0><0.5,0.5,-0.5> rotate<-30,0,0> translate<0,-3,-0.05>}
	texture{col_gold}
}                                
difference{
	difference{
		box{<-1.27,0,-1.27><1.27,8,1.27>}
		box{<-1.27,-0.1,-1.27><1.27,8.1,1.27> rotate<0,45,0> translate<-1.95,0,-1.95> }
		box{<-1.27,-0.1,-1.27><1.27,8.1,1.27> rotate<0,45,0> translate< 1.95,0,-1.95> }
		box{<-1.27,-0.1,-1.27><1.27,8.1,1.27> rotate<0,45,0> translate<-1.95,0, 1.95> }
		box{<-1.27,-0.1,-1.27><1.27,8.1,1.27> rotate<0,45,0> translate< 1.95,0, 1.95> }
	}
	cylinder{<0,1,0><0,8.1,0>1.0}
}

difference{
	cylinder{<0,7.5,0><0,8.03,0>1.0}
	cylinder{<0,6.9,0><0,8.2,0>0.9}	
	texture{col_silver}
}

difference{
	cylinder{<0,0.5,0><0,7.55,0>0.9}
	cylinder{<0,0.4,0><0,7.6,0>0.7}	
	texture{col_gold}
}

pigment{Gray30}}
#end


/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// Grundmakro: Kunststoffkoerper von Pfostenwannen.
// Verwendung fuer gerade und abgewinkelte Bauform jeweils in Verbindung mit entspr. Pinreihen.
// Parameter: Breite. (Hoehe/Tiefe sind konstant fuer alle Groessen.)
// Bezugspunkt: Mitte der Auflageflaeche (gerade Ausfuehrung).
********************************************************************************************************************************************/
#macro PFOSTENWANNE(B)
union{
difference{
box{<-B/2,0.3,-4.2><B/2,9,4.5>}
box{<-B/2+1,2.5,-3.2><B/2-1,10,3.5>}
box{<-2.2,2,2.5><2.2,10,5>}
box{<B/2-1.1,0,-1.75><B/2+0.1,6.5,1.75>}
box{<-B/2+1.1,0,-1.75><-B/2-0.1,6.5,1.75>}}
difference{
box{<B/2-6.08,6,4><B/2-4.08,8,4.6>}
box{<0,0,0><2,3,0.7> rotate<0,0,-30> translate<B/2-5.08,6,4>}
box{<0,0,0><-2,3,0.7> rotate<0,0,30> translate<B/2-5.08,6,4>}}
cylinder{<0,0.3,-4.2><0,8.5,-4.2> 0.3}
sphere{<0,0.3,-3.2> 0.3}
sphere{<0,0.3,3.2> 0.3}
#local xc=7.62;
#while (xc<B/2-1)
cylinder{<xc,0.3,-4.2><xc,8.5,-4.2> 0.3}
cylinder{<-xc,0.3,-4.2><-xc,8.5,-4.2> 0.3}
sphere{<xc,0.3,-3.2> 0.3}
sphere{<xc,0.3,3.2> 0.3}
sphere{<-xc,0.3,-3.2> 0.3}
sphere{<-xc,0.3,3.2> 0.3}
#local xc=xc+7.62;
#end
texture {col_Wannen}}
#end


/********************************************************************************************************************************************
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Pin fuer Stiftleisten Winkel
********************************************************************************************************************************************/
#macro PHW()
union{
//PIN Loetseite
difference{
box{<0,0,0><0.6,3,0.6> texture{col_gold} translate<-0.3,0,-0.3>}
box{<0,0,-0.5><0.5,0.5,0.5> texture{col_gold} rotate<0,0,-30> translate<0.1,0,0>}
box{<0,0,-0.5><-0.5,0.5,0.5> texture{col_gold} rotate<0,0,30> translate<-0.1,0,0>}
box{<-0.5,0,0><0.5,0.5,0.5> texture{col_gold} rotate<30,0,0> translate<0,0,0.1>}
box{<-0.5,0,0><0.5,0.5,-0.5> texture{col_gold} rotate<-30,0,0> translate<0,0,-0.1>}
translate<0,-2.22,0>}
//PIN Steckseite
difference{
box{<0,0,0><0.6,9,0.6> texture{col_gold} translate<-0.3,0,-0.3>}
box{<0,0,-0.5><0.5,0.5,0.5> texture{col_gold} rotate<0,0,-60> translate<0.1,9,0>}
box{<0,0,-0.5><-0.5,0.5,0.5> texture{col_gold} rotate<0,0,60> translate<-0.1,9,0>}
box{<-0.5,0,0><0.5,0.5,0.5> texture{col_gold} rotate<60,0,0> translate<0,9,0.1>}
box{<-0.5,0,0><0.5,0.5,-0.5> texture{col_gold} rotate<-60,0,0> translate<0,9,-0.1>}
rotate<0,0,-90> translate<0.5,1.27,0>}
//PIN Bogen
difference{
box{<0,0,0><0.6,0.4,0.4> texture{col_gold} translate<0,0.0,0.0>}
cylinder{<-0.1,0,0><0.8,0,0>0.2 texture{col_gold} translate<0,0.0,0.0>}
rotate<0,-90,0> translate<0.5,0.77,-0.3>}
difference{
cylinder{<0,0,0><0.6,0,0>0.8 texture{col_gold} translate<0,0,0> }
box{<0,0,0><2,2.2,-2> texture{col_gold} translate<-0.1,0,-0.1>}
box{<0,0,0><2,2.2,-2> texture{col_gold} translate<-0.1,-1.8,0.4>}
rotate<0,-90,0> translate<0.5,0.77,-0.3>} 
//Kunststoff
difference{ 
box{<0,-1.27,-1.27><2,1.27,1.27> pigment{Gray30} translate<0,0,0>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,1.76,1.76>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,1.76,-1.76>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,-1.76,-1.76>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,-1.76,1.76>}
translate<1.5,1.27,0>}
rotate<0,-90,0> 
}
#end


/********************************************************************************************************************************************
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Pin fuer Stiftleisten Winkel obere Reihe
********************************************************************************************************************************************/
#macro PHW2()
union{
//PIN Loetseite
difference{
box{<0,0,0><0.6,5.54,0.6> texture{col_gold} translate<-0.3,0,-0.3>}
box{<0,0,-0.5><0.5,0.5,0.5> texture{col_gold} rotate<0,0,-30> translate<0.1,0,0>}
box{<0,0,-0.5><-0.5,0.5,0.5> texture{col_gold} rotate<0,0,30> translate<-0.1,0,0>}
box{<-0.5,0,0><0.5,0.5,0.5> texture{col_gold} rotate<30,0,0> translate<0,0,0.1>}
box{<-0.5,0,0><0.5,0.5,-0.5> texture{col_gold} rotate<-30,0,0> translate<0,0,-0.1>}
translate<0,-2.22,0>}
//PIN Steckseite
difference{
box{<0,0,0><0.6,11.54,0.6> texture{col_gold} translate<-0.3,0,-0.3>}
box{<0,0,-0.5><0.5,0.5,0.5> texture{col_gold} rotate<0,0,-60> translate<0.1,11.54,0>}
box{<0,0,-0.5><-0.5,0.5,0.5> texture{col_gold} rotate<0,0,60> translate<-0.1,11.54,0>}
box{<-0.5,0,0><0.5,0.5,0.5> texture{col_gold} rotate<60,0,0> translate<0,11.54,0.1>}
box{<-0.5,0,0><0.5,0.5,-0.5> texture{col_gold} rotate<-60,0,0> translate<0,11.54,-0.1>}
rotate<0,0,-90> translate<0.5,3.81,0>}
//PIN Bogen
difference{
box{<0,0,0><0.6,0.4,0.4> texture{col_gold} translate<0,0.0,0.0>}
cylinder{<-0.1,0,0><0.8,0,0>0.2 texture{col_gold} translate<0,0.0,0.0>}
rotate<0,-90,0> translate<0.5,3.31,-0.3>}
difference{
cylinder{<0,0,0><0.6,0,0>0.8 texture{col_gold} translate<0,0,0> }
box{<0,0,0><2,2.2,-2> texture{col_gold} translate<-0.1,0,-0.1>}
box{<0,0,0><2,2.2,-2> texture{col_gold} translate<-0.1,-1.8,0.4>}
rotate<0,-90,0> translate<0.5,3.31,-0.3>} 
//Kunststoff
difference{ 
box{<0,-2,-1.27><2,1.27,1.27> pigment{Gray30} translate<0,0,0>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,1.76,1.76>}
box{<-0.5,-1,-1><2.5,1,1> pigment{Gray30} rotate<45,0,0> translate<0,1.76,-1.76>}
translate<4.04,3.81,0>}
rotate<0,-90,0> 
}
#end


/********************************************************************************************************************************************
// Grundmakro: Um 90° gebogener, quadratischer Stift eines Steckverbinders.
// Verwendung fuer abgewinkelte Pfostenwannen sowie z.B. Wago-Steckerleisten.
// Parameter: Staerke, Biegeradius (Mitte), Hoehe ueber/unter PCB-Oberkante, Laenge nach vorn (-Z), Farbe
********************************************************************************************************************************************/
#macro PIN_BENDED(D,R,HO,HU,L,col)
union{
difference{
cylinder{<0,-D/2,0><0,D/2,0> R+D/2}
cylinder{<0,-D,0><0,D,0> R-D/2}
box{<-R-D,-D,-R-D><0,D,R+D>}
box{<-R-D,-D,-R-D><R+D,D,0>}
rotate<0,0,90> translate<0,HO-R,-R>}
difference{
box{<-D/2,-HU,-D/2><D/2,HO-R,D/2>}
box{<0,0,-0.6*D><0.6*D,0.6*D,0.6*D> rotate<0,0,-45> translate<D/4,-HU,0>}
box{<0,0,-0.6*D><-0.6*D,0.6*D,0.6*D> rotate<0,0,45> translate<-D/4,-HU,0>}
box{<-0.6*D,0,0><0.6*D,0.6*D,0.6*D> rotate<45,0,0> translate<0,-HU,D/4>}
box{<-0.6*D,0,0><0.6*D,0.6*D,-0.6*D> rotate<-45,0,0> translate<0,-HU,-D/4>}}
difference{
box{<-D/2,HO-D/2,-L><D/2,HO+D/2,-R>}
box{<0,-0.6*D,0><0.6*D,0.6*D,0.6*D> rotate<0,45,0> translate<D/4,HO,-L>}
box{<0,-0.6*D,0><-0.6*D,0.6*D,0.6*D> rotate<0,-45,0> translate<-D/4,HO,-L>}
box{<-0.6*D,0,0><0.6*D,-0.6*D,-0.6*D> rotate<-45,0,0> translate<0,HO-D/4,-L>}
box{<-0.6*D,0,0><0.6*D,0.6*D,-0.6*D> rotate<45,0,0> translate<0,HO+D/4,-L>}}
texture{col}} 
#end


/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// Grundmakro: Gerader, quadratischer Stift eines Steckverbinders.
// Verwendung fuer gerade Pfostenwannen sowie z.B. Wago-Steckerleisten.
// Parameter: Staerke, Hoehe ueber/unter PCB-Oberkante, Farbe
********************************************************************************************************************************************/
#macro PIN_STRAIGHT(D,HO,HU,col)
difference{
box{<-D/2,-HU,-D/2><D/2,HO,D/2>}
box{<-0.6*D,0,0><0.6*D,0.6*D,0.6*D> rotate<45,0,0> translate<0,HO,D/4>}
box{<-0.6*D,0,0><0.6*D,0.6*D,-0.6*D> rotate<-45,0,0> translate<0,HO,-D/4>}
box{<0,0,-0.6*D><0.6*D,0.6*D,0.6*D> rotate<0,0,-45> translate<D/4,HO,0>}
box{<0,0,-0.6*D><-0.6*D,0.6*D,0.6*D> rotate<0,0,45> translate<-D/4,HO,0>}
box{<0,0,-0.6*D><0.6*D,0.6*D,0.6*D> rotate<0,0,-45> translate<D/4,-HU,0>}
box{<0,0,-0.6*D><-0.6*D,0.6*D,0.6*D> rotate<0,0,45> translate<-D/4,-HU,0>}
box{<-0.6*D,0,0><0.6*D,0.6*D,0.6*D> rotate<45,0,0> translate<0,-HU,D/4>}
box{<-0.6*D,0,0><0.6*D,0.6*D,-0.6*D> rotate<-45,0,0> translate<0,-HU,-D/4>}
texture{col}} 
#end


/********************************************************************************************************************************************
//Threads for SMA
//Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro SMA_THREADS(od,id,pitch,len)
difference
{
  #local ParAMin = id/2;
  #local ParAMax = od/2;
  #local ParBMin = 0;
  #local ParBMax = 2*pi;
  #local ParCMin = 0;
  #local ParCMax = 1;
  #local td = ParAMax-ParAMin; // thread depth
  #local threads = len/pitch;

  union
  {
    #local i = 0;
    #while(i<threads)
      cone{<0,0,i*pitch> id/2 <0,0,(i+0.5)*pitch> od/2}
      cone{<0,0,(i+0.5)*pitch> od/2 <0,0,(i+1)*pitch> id/2}
      #local i = i+1;
    #end
  }
  
  // trim the left end
  difference
  {
    cylinder{<0,0,-1.1*pitch><0,0,td*0.99> 1.1*od/2}
    cone{<0,0,0> id/2 <0,0,td> id/1.99+td}
  }
  // trim the right end
  difference
  {
    cylinder{<0,0,len-0.99*td><0,0,len+pitch*2> 1.1*od/2}
    cone{<0,0,len-td> id/1.99+td <0,0,len> id/2}
  }
}
#end


/********************************************************************************************************************************************
//Pin fuer Stiftleisten
********************************************************************************************************************************************/
#macro PH()
union{
object{PIN_STRAIGHT(0.5,9,3,col_gold)}
difference{
box{<0,0,0><2.54,2,2.54> pigment{Gray30} translate<-1.27,0,-1.27>}
box{<0,-0.5,0><1,2.5,1> pigment{Gray30} rotate<0,45,0> translate<0.635,0,1.27>}
box{<0,-0.5,0><1,2.5,1> pigment{Gray30} rotate<0,-45,0> translate<-1.27,0,0.635>}
box{<0,-0.5,0><1,2.5,1> pigment{Gray30} rotate<0,45,0> translate<0.635,0,-1.27>}
box{<0,-0.5,0><1,2.5,1> pigment{Gray30} rotate<0,-135,0> translate<-0.635,0,-1.27>}
box{<-0.635,-0.1,-1.3><0.635,0.5,1.3> pigment{Gray30} rotate<0,0,0> translate<0,0,0>}
box{<-1.3,-0.1,-0.635><1.3,0.5,0.635> pigment{Gray30} rotate<0,0,0> translate<0,0,0>}
}}
#end


/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// Grundmakro: Reihe gebogener quadratischer Stifte z.B. fuer Pfostenwannen oder Wago-Stecker.
// Parameter: Anzahl Pins, Pitch, Staerke, Radius, Hoehen ueber/unter PCB, Laenge, Farbe.
// Bezugspunkt: Mitte der Pinreihe.
********************************************************************************************************************************************/
#macro PIN_BENDED_ROW(Pins,Pitch,D,R,HO,HU,L,col)
union{
#local i=0;
#while(i<Pins) object{PIN_BENDED (D,R,HO,HU,L,col) translate<i*Pitch,0,0>} #local i=i+1; #end
translate<-(Pins-1)*Pitch/2,0,0>}
#end


/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// Grundmakro: Reihe gerader quadratischer Stifte z.B. fuer Pfostenwannen oder Wago-Stecker.
// Parameter: Anzahl Pins, Pitch, Staerke, Hoehen ueber/unter PCB, Farbe.
// Bezugspunkt: Mitte der Pinreihe.
********************************************************************************************************************************************/
#macro PIN_STRAIGHT_ROW(Pins,Pitch,D,HO,HU,col)
union{
#local i=0;
#while(i<Pins) object{PIN_STRAIGHT (D,HO,HU,col) translate<i*Pitch,0,0>} #local i=i+1; #end
translate<-(Pins-1)*Pitch/2,0,0>}
#end


/********************************************************************************************************************************************
//Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro SMA_JACK(l)
union
{
  difference
  {
    union
    {
      object{SMA_THREADS(6.35,5.38,0.71,3.56) 
        rotate<0,0,-90> 
        translate<0,0,0.76>
      }
      cylinder{<0,0,0> <0,0,l> 2.69 }
    }
    cylinder{<0,0,-0.1> <0,0,l+0.1> 2.3 }
  }
  difference
  {
    cylinder{<0,0,1.93> <0,0,4> 2.3 pigment{White}}
    cylinder{<0,0,1.9> <0,0,3.9> 0.92 pigment{White}}
  }
  difference
  {
    cylinder{<0,0,1.95> <0,0,3.6> 0.90}
    cylinder{<0,0,1.9> <0,0,3.5> 0.70}
  }
  texture{col_gold}
}
#end


/********************************************************************************************************************************************
//AK-700 Klemme ohne Mittelanschluss RM 5.0 Uwe Lorenz <u.lorenz(replace with at)er-dresden.net>
********************************************************************************************************************************************/
#macro AK700_3_10_GRND()
union{
//***** Loetstift
cylinder{<-5,-4,0><-5,1.1,0>0.6 texture{col_silver}}
cylinder{<5,-4,0><5,1.1,0>0.6 texture{col_silver}}
//***** Ende Loetstifte
//
//***** Grundkoerper
difference{
box{<-7.5,0,-5><7.5,19,5>}
//*****mittlerer Anschluss
box{<-2,3.9,-5.01><2,9.5,3.5>}
//*****linker Anschluss
box{<-6.5,3.9,-5.01><-2.5,9.5,3.5>}
//*****rechter Anschluss
box{<2.5,3.9,-5.01><6.5,9.5,3.5>}
//***** vordere Schraege
box{<-7.6,9,-6.0><7.6,25,-1.1> rotate<20,0,0> translate<0,0,-8.7>}
//box{<-7.6,12,-5.1><7.6,12.5,-4.6>}
//***** hintere Kante
box{<-7.6,10,3><7.6,19.1,5.1> }
//***** Aussparungen hinten
box{<-1.4,6,3.4><1.4,10.1,5.1> }
box{<-6.2,6,3.4><-3.1,10.1,5.1> }
box{<3.1,6,3.4><6.2,10.1,5.1> }
//***** mittleres Borhloch
cylinder{<0,15.9,0><0,19.1,0>1.8}
//cone{<0,18,0>1.5<0,19.1,0>1.8}
//***** linkes Borhloch
cylinder{<-5,15.9,0><-5,19.1,0>1.8}
//cone{<-5,18,0>1.5<-5,19.1,0>1.8}
//***** rechtes Borhloch
cylinder{<5,15.9,0><5,19.1,0>1.8}
//cone{<5,18,0>1.5<5,19.1,0>1.8}
//***** Nut an der rechten Seite
box{<7.0,0.0,-3.4><7.6,13.0,-4.0> }
}
//***** Ende Grundkoerper
//
//***** Steg an der linken Seite
box{<-7.4,1.0,-3.4><-8.0,13.0,-4.0> }
//***** Silberfahnen hinten
box{<-6.0,6,3.8><-3.4,9.1,4.5> texture{col_silver} }
box{<3.4,6,3.8><6.0,9.1,4.5> texture{col_silver} }
//Silberknubbeln an den Silberfahnen
box{<-5.4,6.3,3.8><-4.0,7.3,4.8> texture{col_silver} }
box{<4.0,6.3,3.8><5.4,7.3,4.8> texture{col_silver} }
//***** Ende hintere Silberfahnen
//
//***** rechter Schraubenkopf
difference{
superellipsoid{<1,0.1> rotate<90,0,0> scale<1.5,0.5,1.5> texture{col_silver} translate<-5,18.2,0>}
box{<0.25,0,-2><-0.25,1,2>rotate<0,30,0> texture{col_silver} translate<-5,18.2,0>}}
//***** linker Schraubenkopf
difference{
superellipsoid{<1,0.1> rotate<90,0,0> scale<1.5,0.5,1.5> texture{col_silver} translate<5,18.2,0>}
box{<0.25,0,-2><-0.25,1,2>rotate<0,30,0> texture{col_silver} translate<5,18.2,0>}}
//***** Ende Schraubenkoepfe
//
//***** linke Zugbuegelklemme
difference{
box{<-6.4,4.1,-3.5><-2.6,9.4,2.5>}
box{<-6.2,4.2,-3.6><-2.8,9.4,2.6>}
texture{col_silver}}
cylinder{<-5.8,9.0,-3.3><-3.1,9.0,-3.3>1.0 texture{col_silver}}
//***** rechte Zugbuegelklemme
difference{
box{<2.6,4.1,-3.5><6.4,9.4,2.5>}
box{<2.8,4.2,-3.6><6.2,9.4,2.6>}
texture{col_silver}}
cylinder{<3.2,9.0,-3.3><5.8,9.0,-3.3>1.0 texture{col_silver}}
//***** Ende Zugbuegelklemme
//
pigment{LimeGreen} translate<0,0.2,0>}
#end

#macro AK700_3_10()
object{AK700_3_10_GRND()}
#end

/********************************************************************************************************************************************
//Grundmakro fuer Anreiklemme 3,50mm; Modified by Carsten Koegler, FTZ-Leipzig <koegler(replace with at)ftz-leipzig.de>
********************************************************************************************************************************************/
#macro ARK_3MM_GRND(j)
// Makro fuer einpolige Reihenklemme -> siehe ARK_350MM_GRND
// Based on Macro "ARK_PIN", Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp@lenord.de>
// Modified by Carsten Koegler, FTZ-Leipzig <koegler@ftz-leipzig.de>
// Vorlage: RIA Anschlussklemme AKL 059-xx
#macro ARK_PIN_350MM()
union{

// Einloetstift
	cylinder{<0,-3.0,0><0,1.0,0>0.45 texture{col_silver}}
	cone{<0,-3.0,0>0.45<0,-3.4,0>0.1 texture{col_silver}}

// Plastikkoerper
	difference{
		box{<-1.75,0,-3.7><1.75,8.2,2.8>}               // Hauptbox
		box{<-1.4 ,0.6,-4><1.4 ,5.1,2.2>}               // Loch fuer Drahteinfuehrung
		box{<-0.75,-0.1,-4.01><0.75,1.1,1>}             // Schlitz in der unteren Mitte
		box{<-1.5 ,-0.1,-1.5><1.5,0.7,1.5> rotate<0,45,0> translate<0,0,-4.8>}         // Schlitz etwas abrunden
                box{<-2.6,5,0><2.6,0,-3> rotate<30,0,0> translate<0,4.6,-4>}      // Klemme vorne oben abschraegen
		cylinder{<0,5.2,0><0,10,0>1.5}                  // Senkrechte Loecher fuer die Schraube - oben etwas weiter
		cylinder{<0,2.2,0><0,5.2,0>1.1}                 //                                    - unten kleiner

	}

// Abgeschraegten Innenteil hinzufuegen (siehe Datenblatt)
	box{<-1.4 , 4.6,-1.9><1.4,5.1,2.8>}
        difference{
        	box{<-1.4 , -0.25,-0.25><1.4,0.25,0.25>}
          	box{<-1.5 , -0.35,-0.35><1.5,0.35,0.35>rotate<45,0,0> translate<0,-0.25,-0.25>}
                translate<0,4.85,-2.15>
        }
        
// Schraube
	superellipsoid{<1,0.1> rotate<90,0,0> scale<0.9,2.0,1> texture{col_silver} translate<0,5.0,0>}
	difference{
		superellipsoid{<1,0.1> rotate<90,0,0> scale<1.3,0.5,1.3> texture{col_silver} translate<0,7.3,0>}
		box{<0.25,0,-2><-0.25,1,2>rotate<0,rand(global_seed)*180,0> translate<0,7.6,0>}
	}

// metallenes Innenleben
	difference{
		box{<-1.35,0.65,-1.9><1.35,4.4,2.5>}   // Hauptkoerper
		cylinder{<0,2.2,-2.0><0,2.2,2.6>1.1}    // Loch
		cylinder{<0,2.2,0><0,5.2,0>1.1}
		texture{col_silver}
	}

// Drahtschutz
	box{<-0.95,4.45,-2.0><0.95,4.5,2.5>texture{col_silver}}    // oberer Teil
        difference{                                                // oberer Bogen
                cylinder {<-0.95,-0.1 ,0>,< 0.95,-0.1 ,0>,0.1 }
                cylinder {<-1.0 ,-0.1 ,0>,< 1.0 ,-0.1 ,0>,0.05}
                box{<-1,-1.0,-2><1,-0.1,2>}
                box{<-1,-1.0,0><1, 1.0,1>}
                texture{col_silver}
                rotate<0,0,0>
                translate<0,4.5,-2.0 >
        }
	box{<-0.95,2.2,-2.1><0.95,4.4,-2.05>texture{col_silver}}   // vorderer Teil
        difference{                                                // unterer Bogen
                cylinder {<-0.95,-0.1 ,0>,< 0.95,-0.1 ,0>,0.1 }
                cylinder {<-1.0 ,-0.1 ,0>,< 1.0 ,-0.1 ,0>,0.05}
                box{<-1,-1.0,-2><1,-0.1,2>}
                box{<-1,-1.0,0><1, 1.0,1>}
                texture{col_silver}
                rotate<0,0,180>
                translate<0,2.1,-2.0 >
        }
	box{<-0.95,2.1,-2.0><0.95,2.15,2>texture{col_silver}}    // unterer Teil



	pigment{Gray30}
}
#end

union{
	#local i = 0;
	#while(i<j)
		object{ARK_PIN_350MM() translate<i*3.5,0,0>}
		#local i=i+1;
	#end
	
	union{
		#local i = 0;
		#while(i<j)
			text {ttf besch_font str(j-i,0,0) 0.2,0  scale<2,2,2> rotate<30,0,0> translate<-i*3.5-1.27,6.1,-3> translate<0,0.3,0.1> pigment{Black}}
			#local i=i+1;
		#end
		translate<(i-1)*3.5,0,0>
	}
	translate<-j*1.75+1.75,0,0>
}
#end

#macro ARK_350MM_2()
object{ARK_3MM_GRND(2)}
#end
#macro ARK_350MM_3()
object{ARK_3MM_GRND(3)}
#end
#macro ARK_350MM_4()
object{ARK_3MM_GRND(4)}
#end
#macro ARK_350MM_5()
object{ARK_3MM_GRND(5)}
#end
#macro ARK_350MM_6()
object{ARK_3MM_GRND(6)}
#end
#macro ARK_350MM_7()
object{ARK_3MM_GRND(7)}
#end
#macro ARK_350MM_8()
object{ARK_3MM_GRND(8)}
#end
#macro ARK_350MM_9()
object{ARK_3MM_GRND(9)}
#end
#macro ARK_350MM_10()
object{ARK_3MM_GRND(10)}
#end
#macro ARK_350MM_11()
object{ARK_3MM_GRND(11)}
#end
#macro ARK_350MM_12()
object{ARK_3MM_GRND(12)}
#end

/********************************************************************************************************************************************
//Grundmakro fuer Anreiklemme 5mm
********************************************************************************************************************************************/
#macro ARK_5MM_GRND(j)
union{
	#local i = 0;
	#while(i<j)
		object{ARK_PIN() translate<i*5.08,0,0>}
		#local i=i+1;
	#end
	
	union{
		#local i = 0;
		#while(i<j)
			text {ttf besch_font str(j-i,0,0) 0.2,0  scale<3,3,3> rotate<30,0,0> translate<-i*5.08-1.27,7.21,-4> translate<0,0.3,0.1> pigment{Black}}
			#local i=i+1;
		#end
		translate<(i-1)*5.08,0,0>
	}
	translate<-j*2.54+2.54,0,0>
}
#end

#macro ARK_5MM_2()
object{ARK_5MM_GRND(2)}
#end
#macro ARK_5MM_3()
object{ARK_5MM_GRND(3)}
#end
#macro ARK_5MM_4()
object{ARK_5MM_GRND(4)}
#end
#macro ARK_5MM_5()
object{ARK_5MM_GRND(5)}
#end
#macro ARK_5MM_6()
object{ARK_5MM_GRND(6)}
#end
#macro ARK_5MM_7()
object{ARK_5MM_GRND(7)}
#end
#macro ARK_5MM_8()
object{ARK_5MM_GRND(8)}
#end
#macro ARK_5MM_9()
object{ARK_5MM_GRND(9)}
#end
#macro ARK_5MM_10()
object{ARK_5MM_GRND(10)}
#end
#macro ARK_5MM_11()
object{ARK_5MM_GRND(11)}
#end
#macro ARK_5MM_12()
object{ARK_5MM_GRND(12)}
#end

/********************************************************************************************************************************************
//Grundmakro fuer Buchsenleisten
********************************************************************************************************************************************/
#macro BL_GRND(pin,row)
union{
#local i=0;
#while(i<pin)
object{PBL() translate<i*2.54,0,0>}
#local i=i+1;
#end
#if(row=2)
#local i=0;
#while(i<pin)
object{PBL() translate<i*2.54,0,-2.54>}
#local i=i+1;
#end
translate<0,0,1.27>
#end
translate<pin*-1.27+1.27,0,0>}
#end

#macro BL_1X5()
object{BL_GRND(5,1)}
#end
#macro BL_1X6()
object{BL_GRND(6,1)}
#end
#macro BL_1X7()
object{BL_GRND(7,1)}
#end
#macro BL_1X8()
object{BL_GRND(8,1)}
#end
#macro BL_1X9()
object{BL_GRND(9,1)}
#end
#macro BL_1X10()
object{BL_GRND(10,1)}
#end
#macro BL_1X12()
object{BL_GRND(12,1)}
#end
#macro BL_1X13()
object{BL_GRND(13,1)}
#end
#macro BL_1X15()
object{BL_GRND(15,1)}
#end
#macro BL_1X17()
object{BL_GRND(17,1)}
#end
#macro BL_1X18()
object{BL_GRND(18,1)}
#end
#macro BL_1X20()
object{BL_GRND(20,1)}
#end
#macro BL_2X5()
object{BL_GRND(5,2)}
#end
#macro BL_2X6()
object{BL_GRND(6,2)}
#end
#macro BL_2X7()
object{BL_GRND(7,2)}
#end
#macro BL_2X8()
object{BL_GRND(8,2)}
#end
#macro BL_2X9()
object{BL_GRND(9,2)}
#end
#macro BL_2X10()
object{BL_GRND(10,2)}
#end
#macro BL_2X12()
object{BL_GRND(12,2)}
#end
#macro BL_2X13()
object{BL_GRND(13,2)}
#end
#macro BL_2X15()
object{BL_GRND(15,2)}
#end
#macro BL_2X17()
object{BL_GRND(17,2)}
#end
#macro BL_2X18()
object{BL_GRND(18,2)}
#end
#macro BL_2X20()
object{BL_GRND(20,2)}
#end

/********************************************************************************************************************************************
//Grundmakro fuer Buchsenleisten (flach)
********************************************************************************************************************************************/
#macro CON_BL_F_GRND(pin,row)
union{
#local i=0;
#while(i<pin)
object{CON_PBL_F() translate<i*2.54,0,0>}
#local i=i+1;
#end
#if(row=2)
#local i=0;
#while(i<pin)
object{CON_PBL_F() translate<i*2.54,0,-2.54>}
#local i=i+1;
#end
translate<0,0,1.27>
#end
translate<pin*-1.27+1.27,0,0>}
#end

#macro CON_BL_F_1X5()
object{CON_BL_F_GRND(5,1)}
#end
#macro CON_BL_F_1X6()
object{CON_BL_F_GRND(6,1)}
#end
#macro CON_BL_F_1X7()
object{CON_BL_F_GRND(7,1)}
#end
#macro CON_BL_F_1X8()
object{CON_BL_F_GRND(8,1)}
#end
#macro CON_BL_F_1X9()
object{CON_BL_F_GRND(9,1)}
#end
#macro CON_BL_F_1X10()
object{CON_BL_F_GRND(10,1)}
#end
#macro CON_BL_F_1X12()
object{CON_BL_F_GRND(12,1)}
#end
#macro CON_BL_F_1X13()
object{CON_BL_F_GRND(13,1)}
#end
#macro CON_BL_F_1X15()
object{CON_BL_F_GRND(15,1)}
#end
#macro CON_BL_F_1X17()
object{CON_BL_F_GRND(17,1)}
#end
#macro CON_BL_F_1X18()
object{CON_BL_F_GRND(18,1)}
#end
#macro CON_BL_F_1X20()
object{CON_BL_F_GRND(20,1)}
#end
#macro CON_BL_F_2X5()
object{CON_BL_F_GRND(5,2)}
#end
#macro CON_BL_F_2X6()
object{CON_BL_F_GRND(6,2)}
#end
#macro CON_BL_F_2X7()
object{CON_BL_F_GRND(7,2)}
#end
#macro CON_BL_F_2X8()
object{CON_BL_F_GRND(8,2)}
#end
#macro CON_BL_F_2X9()
object{CON_BL_F_GRND(9,2)}
#end
#macro CON_BL_F_2X10()
object{CON_BL_F_GRND(10,2)}
#end
#macro CON_BL_F_2X12()
object{CON_BL_F_GRND(12,2)}
#end
#macro CON_BL_F_2X13()
object{CON_BL_F_GRND(13,2)}
#end
#macro CON_BL_F_2X15()
object{CON_BL_F_GRND(15,2)}
#end
#macro CON_BL_F_2X17()
object{CON_BL_F_GRND(17,2)}
#end
#macro CON_BL_F_2X18()
object{CON_BL_F_GRND(18,2)}
#end
#macro CON_BL_F_2X20()
object{CON_BL_F_GRND(20,2)}
#end

/********************************************************************************************************************************************
//Macro fuer Praezisions Buchsenleisten
//franz.riedmueller(replace with at)web.de
********************************************************************************************************************************************/
#macro CON_BL_PRECISION_GRND(pin,row)
//Single Pin
#macro CON_BL_PRECISION_PIN()
union{
  difference{
             box{<0,0,0><2.54,2,2.54> pigment{Gray10} translate<-1.27,0,-1.27>}
             box{<0,-0.5,0><1,2.5,1> pigment{Gray10} rotate<0,45,0> translate<0.635,0,1.27>}
             box{<0,-0.5,0><1,2.5,1> pigment{Gray10} rotate<0,-45,0> translate<-1.27,0,0.635>}
             box{<0,-0.5,0><1,2.5,1> pigment{Gray10} rotate<0,45,0> translate<0.635,0,-1.27>}
             box{<0,-0.5,0><1,2.5,1> pigment{Gray10} rotate<0,-135,0> translate<-0.635,0,-1.27>} 
             cylinder{<0,-0.5,0> <0,2.5,0> 0.7 pigment{Gray10} }
  translate<0,5.10,0>
  }
  
 difference{
  union{
        cylinder{<0,0,0><0,2.95,0>0.25}
        sphere{<0,0,0>0.25}
        cone{<0,2.95,0>0.25<0,3.45,0>0.6}
        cylinder{<0,3.45,0><0,7.15,0>0.6}
        cylinder{<0,6.4,0><0,7.15,0>0.85}}
        cylinder{<0,4,0><0,7.16,0>0.5}
        texture{col_silver}
  }
  translate<0,-2.95,0>
 } 
#end

union{
	#local i=0;
	#while(i<pin)
		object{CON_BL_PRECISION_PIN() translate<i*2.54,0,0>}
		#local i=i+1;
	#end
	
	#if(row=2)
		#local i=0;
		#while(i<pin)
			object{CON_BL_PRECISION_PIN() translate<i*2.54,0,-2.54>}
		#local i=i+1;
		#end
		translate<0,0,1.27>
	#end
	translate<pin*-1.27+1.27,0,0>}
#end

#macro CON_BL_PRECISION_1X1()
object{CON_BL_PRECISION_GRND(1,1)}
#end
#macro CON_BL_PRECISION_1X2()
object{CON_BL_PRECISION_GRND(2,1)}
#end
#macro CON_BL_PRECISION_1X3()
object{CON_BL_PRECISION_GRND(3,1)}
#end
#macro CON_BL_PRECISION_1X4()
object{CON_BL_PRECISION_GRND(4,1)}
#end
#macro CON_BL_PRECISION_1X5()
object{CON_BL_PRECISION_GRND(5,1)}
#end
#macro CON_BL_PRECISION_1X6()
object{CON_BL_PRECISION_GRND(6,1)}
#end
#macro CON_BL_PRECISION_1X7()
object{CON_BL_PRECISION_GRND(7,1)}
#end
#macro CON_BL_PRECISION_1X8()
object{CON_BL_PRECISION_GRND(8,1)}
#end
#macro CON_BL_PRECISION_1X9()
object{CON_BL_PRECISION_GRND(9,1)}
#end
#macro CON_BL_PRECISION_1X10()
object{CON_BL_PRECISION_GRND(10,1)}
#end
#macro CON_BL_PRECISION_1X11()
object{CON_BL_PRECISION_GRND(11,1)}
#end
#macro CON_BL_PRECISION_1X12()
object{CON_BL_PRECISION_GRND(12,1)}
#end
#macro CON_BL_PRECISION_2X2()
object{CON_BL_PRECISION_GRND(2,2)}
#end
#macro CON_BL_PRECISION_2X3()
object{CON_BL_PRECISION_GRND(3,2)}
#end
#macro CON_BL_PRECISION_2X4()
object{CON_BL_PRECISION_GRND(4,2)}
#end
#macro CON_BL_PRECISION_2X5()
object{CON_BL_PRECISION_GRND(5,2)}
#end
#macro CON_BL_PRECISION_2X6()
object{CON_BL_PRECISION_GRND(6,2)}
#end
#macro CON_BL_PRECISION_2X7()
object{CON_BL_PRECISION_GRND(7,2)}
#end
#macro CON_BL_PRECISION_2X8()
object{CON_BL_PRECISION_GRND(8,2)}
#end
#macro CON_BL_PRECISION_2X9()
object{CON_BL_PRECISION_GRND(9,2)}
#end
#macro CON_BL_PRECISION_2X10()
object{CON_BL_PRECISION_GRND(10,2)}
#end
#macro CON_BL_PRECISION_2X11()
object{CON_BL_PRECISION_GRND(11,2)}
#end
#macro CON_BL_PRECISION_2X12()
object{CON_BL_PRECISION_GRND(12,2)}
#end

/********************************************************************************************************************************************
//Makro fuer BNC-Buchse, gewinckelt von Felix Schad <felix_schad(replace with at)gmx.de>
********************************************************************************************************************************************/
#macro CON_BNC_W_GRND()
  union{
        union { // Korpus
                difference {
                        box {
                                <0,0,0><14.5,12.5,14>
                                pigment{Gray70}
                                clipped_by {
                                        plane { <1,0,0>,0 rotate<0,0,45> translate<0,25,0> }
                                        plane { <-1,0,0>,0 rotate<0,0,-45>translate<0,10.5,0>}
                                }
                        }

                        cylinder { // Mittlerer Ausschnitt fuer Anschlusspins
                                <0,0,0>,<0,2,0>,3
                                open
                                rotate<90,0,0>
                                translate <7.5,6.25,0>
                                pigment{Gray50}
                        }
                        box { // unterer Aussschnitt fuer Anschlusspins
                                <0,0,-1><5,3.8,2>
                                translate <4.75,0,0>
                                pigment{Gray70}
                        }

                }


                // freigeschnittene Aussenbereiche der Box fuellen
                box {
                        <0,0,0><4,2.9,14>
                        rotate<0,0,45>
                        translate<11.65,7.65,0>
                        pigment{Gray70}
                }

                box {
                        <0,0,0><4,2.9,14>
                        rotate<0,0,-45>
                        translate<0,10.4,0>
                        pigment{Gray70}
                }

                // freigeschnittenen Innenbereich der Box fuellen
                box{ <0,0,0><5,3.8,2> translate <4.75,0,0.5> pigment{Gray70}}


                disc {
                        <0,0,0>, <0,0,-1>, 3
                        translate <7.5,6.25,2>
                        texture{T_Silver_1A}

                }

                cylinder {
                        <0,0,0>,<0,2,0>,1.6
                        rotate<90,0,0>
                        translate <7.5,6.25,1.8>
                        pigment{Gray70}
                }

        } // Ende Korpus

        //TOOLS_RECT_BOGEN(i_radius,winkel,dicke,breite,laenge1,laenge2)
        object { // Massepin
                TOOLS_RECT_BOGEN(1,90,0.8,0.8,7,1)
                rotate<90,0,-90>
                translate<5.2,6.5,-0.5>
                texture { col_silver finish { phong 1 }}
        }
        #include "metals.inc"
        object { // Signalpin
                TOOLS_RECT_BOGEN(1,90,0.8,0.8,7,1)
                rotate<90,0,-90>
                translate<5.2+2.54,6.5,-0.5>
                texture{col_gold}


        }

        union { // Haltebolzen 1
                cylinder {
                        <0,1,0><0,-4,0>,1
                        translate<2.75,0,4.45>
                }
                sphere {
                        <0,0,0>,1
                        translate<2.75,-3.5,4.45>

                }
                texture{T_Silver_1A finish {phong 1.0}}
        }

        union { // Haltebolzen 2
                cylinder {
                        <0,1,0><0,-4,0>,1
                        translate<2.75+10.2,0,4.45>
                }
                sphere {
                        <0,0,0>,1
                        translate<2.75+10.2,-3.5,4.45>

        }
        texture{T_Silver_1A finish {phong 1.0}}
}


        difference {
                union {
                        cylinder { // Verschraubung
                                <0,0,0>,<0,0,9>,5.5
                                translate<7.25,6.25,14>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,16>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,17>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,18>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,19>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,20>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,21>
                        }

                        cylinder { // 'Schraubenlinien'
                                <0,0,0>,<0,0,0.2>,5.7
                                translate<7.25,6.25,22>
                        }
                        pigment{Gray70}

                } // end inner union

                box {
                        <0,0,0>,<16,3.3,9>
                        translate<2.25,11.5,14>
                        pigment{Gray70}
                }
        } // end difference


        cylinder { // aeusserer Anschluss
                <0,0,0>,<0,0,12>,4.7
                open
                translate<7.25,6.25,5.5+14>
                texture{T_Silver_1A finish { phong 1}}
        }

        difference{
                cylinder { // innerer Anschluss A
                        <0,0,0>,<0,0,1>,3.8
                        translate<7.25,6.25,29>
                        pigment{Gray70}
                }

                cylinder { // innerer Anschluss B
                        <0,0,0>,<0,0,1>,1
                        translate<7.25,6.25,29.1>
                        texture{col_gold}
                }

                cylinder { // innerer Anschluss C
                        <0,0,0>,<0,0,1>,0.5
                        translate<7.25,6.25,29>
                        pigment{Black}
                }
        }
        cylinder { // Einrastpunkt 1
                <0,0,0>,<0,0,1>,1
                rotate<90,0,0>
                translate<7.25,12,29>
                texture { col_silver finish { phong 1 }}
        }

        cylinder { // Einrastpunkt 2
                <0,0,0>,<0,0,1>,1
                rotate<90,0,0>
                translate<7.25,1.5,29>
                texture { col_silver finish { phong 1 }}
        }


  translate <-7.25,0,-7>
  rotate <0,180,0>
  }
#end

#macro CON_BNC_W()
object{CON_BNC_W_GRND()}
#end

/********************************************************************************************************************************************
// CF card+ holder
********************************************************************************************************************************************/
#macro CON_CF_AND_CARD_GRND(value)
union{
      union {
         box{<0,0,0><43,3.5,36.4> pigment{Gray10}} // Card
         box{<0,-0.6,0><43,3.5,0.7> pigment{Gray10}} // Card
                                                   
         // Label                                                  
         box{<2,3.50,2><41,3.51,36> pigment{Gray70}}
         text {ttf besch_font "COMPACT FLASH CARD" 0.1, 0 pigment{Gray10} scale 3  rotate<90,0,0> translate<4,3.511,23>}
         box{<4,3.5,21><21,3.51,21.5> pigment{Red}}
         text {ttf besch_font value 0.1, 0 pigment{Gray20} scale 24  rotate<90,0,0> translate<20,3.511,4>}
         translate <1.7,2.7,-17.5>
      } 


      difference {
          union {
                box{<0,0,0> <1.8,6.7,2.5> pigment{Wheat}} // Left
                box{<0,0,0> <1.8,6.7,2.5> translate <44.7,0,0> pigment{Wheat}} // Right

                box{<0,0,0> <5.7,2,7.5> translate <0,0,19> pigment{Wheat}} // Right
                box{<0,0,0> <5.7,2,7.5> translate <40.6,0,19> pigment{Wheat}} // Right


                box{<0,0,0> <46.3,5,22.6> translate <0,1.7,0> pigment{Wheat}} // main
          }
         
         box{<0,0,0> <36,2,11.4> translate <5,5.0,-0.1> }
         box{<0,0,0> <13,2.7,4.3> translate <3.2,4.7,15.1>}
         box{<0,0,0> <13,2.7,4.3> translate <30.2,4.7,15.1> }

         box{<0,0,0> <50,2,10> translate <-0.01,6,19.3> }
         
         box{<0,0,0> <3,4,10> translate <3.1,3.4,18.5> }
         box{<0,0,0> <3,4,10> translate <39.8,3.4,18.5> }
         
         cylinder{<0,0,0><0,3,0> 1 translate <3,0,23.5> }
         cylinder{<0,0,0><0,3,0> 1 translate <43.5,0,23.5> }
      }

}
pigment{color red 0.847059 green 0.847059 blue 0.54902}
translate<-23.15,0,-15>
#end

#macro CON_CF_AND_CARD(value)
object{CON_CF_AND_CARD_GRND(value)}
#end

/********************************************************************************************************************************************
//rogerlight(replace with at)gmail.com
********************************************************************************************************************************************/
#macro CON_COAX_B35N61_GRND()
union {
	cylinder { <0,0,0>, <0,-4.9,0>, 0.48 texture{col_gold}} // Centre contact
	cylinder { <-3.13, 0, -3.13>, <-3.13, -4.5, -3.13>, 0.58 texture{col_silver}}
	cylinder { <-3.13, 0, 3.13>, <-3.13, -4.5, 3.13>, 0.58 texture{col_silver}}
	cylinder { <3.13, 0, -3.13>, <3.13, -4.5, -3.13>, 0.58 texture{col_silver}}
	cylinder { <3.13, 0, 3.13>, <3.13, -4.5, 3.13>, 0.58 texture{col_silver}}

	cylinder { <0,0,0>, <0,2,0>, 5.5 texture{col_silver}}

	// This is the main body of the socket
  	difference {
		difference {
			merge {
				cylinder { <0,0,0>, <0,13.7,0>, 4.8 }
				cylinder { <5.5, 13.7-3.3-1,0>, <-5.5, 13.7-3.30-1,0>, 1.0 }
			}
			cylinder { <0,5.3,0>, <0,14.0,0>, 4.2 }
		}
		cone { <0,13.8,0> 4.9 <0,10,0>, 2.4 }
		texture{col_silver}
	}

	difference {
		cylinder { <0,1,0>, <0,13.7-3.3,0>, 1.5}
		cylinder { <0,1,0>, <0,13.7,0>, 1.0}
		texture{pigment{ rgb <1,1,1> }}
	}

	difference {
		cylinder { <0,1,0>, <0,13.7-3.3,0>, 1.0}
		cylinder { <0,1,0>, <0,13.7,0>, 0.6}
		texture{col_gold}
	}
}
#end

#macro CON_COAX_B35N61()
object{CON_COAX_B35N61_GRND()}
#end

/********************************************************************************************************************************************
//Macro fuer Hohlstecker-Printeinbau (HEBO 13 - Reichelt.de)
//franz.riedmueller(replace with at)web.de
********************************************************************************************************************************************/
#macro CON_DC_JACK_HEBO_13_GRND()
union{ 
 //Stift 
 union{
       cylinder{<0, 4.5, 0><5.5, 4.5, 0> 0.65}
       cylinder{<0, 4.5, 0><0.2, 4.5, 0> 0.9} 
       sphere {<5.5, 4.5, 0> 0.65}
       texture{col_silver}
       translate<-0.7, 0, 0>
 } 
 //Gehaeuse
 difference{
        union{
        box{<-5.75,0,-2.5><5.75,4.5,2.5>}
        cylinder{<-5.75, 4.5, 0><5.75, 4.5, 0> 2.5}
  }
  box{<-5.25,2.5,-10><-10, 20, 10>}
  box{<-0.75,2.5,-10><10, 20, 10>}
 } 
 //PIN
 union{
       box{<0,0,0.9><3.6-0.9, 0.3,-0.9>}
       cylinder{<3.6-0.9, 0,0><3.6-0.9, 0.3,0> 0.9}
       rotate<0,0,-90>
       translate<-1.05,0,0>
       texture{col_silver}
 }
 //PIN
 union{
       box{<0,0,0.9><3.6-0.9, 0.3,-0.9>}
       cylinder{<3.6-0.9, 0,0><3.6-0.9, 0.3,0> 0.9}
       rotate<0,0,-90>
       translate<-5.75,0,0>
       texture{col_silver}
 }
 //PIN
 union{
       box{<0,0,0.9><3.6-0.9, 0.3,-0.9>}
       cylinder{<3.6-0.9, 0,0><3.6-0.9, 0.3,0> 0.9}
       rotate<-90,0,-90>
       translate<-3.2,0,3.25>
       texture{col_silver}
 } 
 difference{
            cylinder{<0,0,0><1.8,0,0>0.75}
            cylinder{<-1,0,0><2.8,0,0>0.45} 
            box{<-10,0,-10><10,-10,10>}
            box{<-10,-10,0><10,10,-10>}
            texture{col_silver}
            translate<-4.1,0,2.5>
 }
 //Feder
 union{ 
       difference{
                  cylinder{<0,0,0><2.6,0,0>0.75}
                  cylinder{<-1,0,0><3.6,0,0>0.45} 
                  box{<-10,0,-10><10,-10,10>}
                  box{<-10,-10,0><10,10,-10>}
       }
       box{<2.6,0,0.45><0,-3,0.75>}
       box{<0,0.45,0><2.6,0.75,-3>}
       texture{col_silver}
       rotate<0,90,45>
       translate<2.5,3,1.3>
 }
 //Heckplatte
 difference{
           union{
                 cylinder{<0,0,0><0,0.3,0>1.5}
                 cylinder{<0,0,0><0,0.4,0>0.75}
                 box{<0,0,-1.5><2.5,0.3,1.5>}
                 texture{col_silver}
           }
           cylinder{<0,-1,0><0,1,0>0.3}
           rotate<0,180,90>
           translate<-5.45,4.5,0>
 }
 //translate<0,3.6,0>
 translate<0,0.2,0>
}
#end

#macro CON_DC_JACK_HEBO_13()
object{CON_DC_JACK_HEBO_13_GRND()}
#end

/********************************************************************************************************************************************
// Wolfgang Moser <womo (a) d81.de>
// DIN-Buchse(n) Hirschmann MAx-XX
// 10.02.2006 ... 21.02.2006
********************************************************************************************************************************************/
#macro CON_DIN_MA_XX_GRND(MA_Typ, MA_Subtyp)

#macro CON_DIN_MA_Inlet_Kontaktfeder(Oesenlaenge, Verschraenkungsart, VSchraenkungwinkel)
	// Oesenlaenge:        Laenge der Kontaktoese oder des Kontaktpins,
	//                     bei Buchsen mit direktem Drahtanschluss
	// Verschraenkungsart: Art der "Verriegelung" der Kontaktfeder in
	//                     der Buchse. Ende gedreht oder abgewinkelt
	// VSchraenkungwinkel: Drehwinkel der Verschraenkung fuer beide
	//                     Arten

union{

	#local Federdicke=0.5;
		// Hauptteil der Kontaktfeder
	union{
		difference{
				// Basis: box
			box { <1.7,Federdicke/2,0>, <-1.7,-Federdicke/2,8.4> }
				// Ausschnitt: box 45 Grad gedreht, Einfuehrung fuer Stift vom Stecker
 			box { <1,Federdicke/2+0.01,1>, <-1,-(Federdicke/2+0.01),-1> rotate<0,45,0>}
				// Ausschnitt: Freihaltung Innenbereich, Abrundung
			cylinder { <0,Federdicke/2+0.01,2.5> <0,-(Federdicke/2+0.01),2.5> 0.75 }
				// Ausschnitt: Freihaltung fuer Stift vom Stecker, Innenbereich
			box { <0.75,Federdicke/2+0.01,2.5>, <-0.75,-(Federdicke/2+0.01),7>}
				// Ausschnitt: Freihaltung Innenbereich, Abrundung
			cylinder { <0,Federdicke/2+0.01,7> <0,-(Federdicke/2+0.01),7> 0.75 }
				// Ausschnitt: Freihaltung fuer Stift vom Stecker im Kontaktbereich
			box { <0.5,Federdicke/2+0.01,0>, <-0.5,-(Federdicke/2+0.01),2.5>}
			}
			// Ergaenzung: box, Fuehrung der Kontaktfeder im Durchsteckbereich
		box { <1.15,Federdicke/2,8.0>, <-1.15,-Federdicke/2,10.5> }
			// Ergaenzung: box, Stummel des Oesenanschlusses im Durchsteckbereich
		box { <0.35,Federdicke/2,8.0>, <-0.35,-Federdicke/2,11.85> }
		}

		// Endstueck der Kontaktfeder

	difference{
		union{
				// Ergaenzung: box, Weiterfuehrung des Stummels (ohne Ueberschneidung!)
			box { <0.35,Federdicke/2,0>, <-0.35,-Federdicke/2,1.15> }
				// Ergaenzung: box, Koerper der Oese, variable Laenge
			box { <1.15,Federdicke/2,1.15>, <-1.15,-Federdicke/2,2.15+Oesenlaenge> }
				// Ergaenzung: cylinder, Abschluss der Oese, variable Position
			cylinder { <0,Federdicke/2,2.15+Oesenlaenge> <0,-Federdicke/2,2.15+Oesenlaenge> 1.15 }
			}
				// Ausschnitt: Freihaltung Innenbereich Oese, Abrundung
		cylinder { <0,Federdicke/2+0.01,2.15> <0,-(Federdicke/2+0.01),2.15> 0.5 }
				// Ausschnitt: Freihaltung fuer Oesenanschluss, Innenbereich
		box { <0.5,Federdicke/2+0.01,2.15>, <-0.5,-(Federdicke/2+0.01),2.15+Oesenlaenge>}
				// Ausschnitt: Freihaltung Innenbereich Oese, Abrundung
		cylinder { <0,Federdicke/2+0.01,2.15+Oesenlaenge> <0,-(Federdicke/2+0.01),2.15+Oesenlaenge> 0.5 }


		#switch(Verschraenkungsart)                                                         
			#case(0)	// Verdrehung (Schraube)
				translate<0,0, 11.85>
				rotate <0,0,VSchraenkungwinkel>
			#break
			#case(4)	// sowohl Abwinkelung als auch zusaetzlich zweifache Verdrehung
				rotate <-VSchraenkungwinkel,0,0>
				rotate <0,0,2*VSchraenkungwinkel>
				translate<0,0, 11.85>
			#break
			#case(3)	// sowohl Abwinkelung als auch zusaetzlich Verdrehung (invers)
				rotate <-VSchraenkungwinkel,0,0>
				rotate <0,0,-VSchraenkungwinkel>
				translate<0,0, 11.85>
			#break
			#case(2)	// sowohl Abwinkelung als auch zusaetzlich Verdrehung
				rotate <-VSchraenkungwinkel,0,0>
				rotate <0,0,VSchraenkungwinkel>
				translate<0,0, 11.85>
			#break
			#case(1)	// Abwinkelung
				rotate <-VSchraenkungwinkel,0,0>
				// translate<0,0, 11.85>
			// #break	// fall through and execute the  #else  following
			#else
				translate<0,0, 11.85>
		#end
		}

	#switch(Verschraenkungsart)                                                         
		#range(1, 4)	// Abwinkelung (nicht perfekt bei cases 2 und 3)
				// bei Abwinkelung noch zusaetzlich Abrundung und Auffuellen des "Biegeloches"
			cylinder { <0.35,0,11.85> <-0.35,0,11.85> Federdicke/2 }
		#break
	#end

	translate <0,0,1.0>
	#ifdef(CON_DIN_MA_Debug_Viewmode)
		pigment{Yellow}
	#else
		texture {col_silver}
	#end
	}
#end

#macro CON_DIN_MA_Inlet_Basebody(Einsatzart)
		// Einsatzart: Auspraegung des "Wulstes" am Ende zwecks Befestigung
		//             in einem Metallbecher oder zwei Metallhalbschalen
		//             einer Kupplung
#local Gesamtlaenge=13;
difference{
	union{
		cylinder { <0,0,0>  <0,0,Gesamtlaenge> 5.85 }

		#switch(Einsatzart)
			#case(0)	// Scheibenwulst fuer Metallbechermontage
				cylinder { <0,0,Gesamtlaenge-3>  <0,0,Gesamtlaenge-2> 7 }
					// Stuetzwulst in Durchfuehrung von Metallbecher
				cylinder { <0,0,Gesamtlaenge-2.001>  <0,0,Gesamtlaenge> 6.15 }
			#break
			#case(1)	// unterteilter Wulst fuer Metallhalbschalenmontage
						// in Kupplungen (wie auch Steckern)
					// "duenner" Stuetzwulst
				cylinder { <0,0,Gesamtlaenge-4>  <0,0,Gesamtlaenge> 6 }

				difference{
						// "dickerer" Haltewulst
					cylinder { <0,0,Gesamtlaenge-3>  <0,0,Gesamtlaenge-1> 6.55 }

						// "gerade" Begrenzug des Wulstes fuer abnehmbare Metallabschirmung
					box      { < 5.5, 2.5,Gesamtlaenge-3.001>, <    7,-4,Gesamtlaenge-0.999>}
					box      { <-5.5, 2.5,Gesamtlaenge-3.001>, <   -7,-4,Gesamtlaenge-0.999>}

						// "abgeschraegte" Begrenzug des Wulstes fuer die nicht abnehmbare
						// Metallabschirmung mit der aufgenieteten Massekontaktzunge
					box      { <0.75,   0,Gesamtlaenge-3.001>, <-0.75,-3,Gesamtlaenge-0.999>
						translate< -6.25,0,0>
						rotate   < 0,0,-30>
						}
					box      { <0.75,   0,Gesamtlaenge-3.001>, <-0.75,-3,Gesamtlaenge-0.999>
						translate<  6.25,0,0>
						rotate   < 0,0, 30>
						}
					}
			#break
			#else		// keine Veraenderung
					// Dummy: duenner Stuetzwulst fuer Metallhalbschalenmontage
				cylinder { <0,0,Gesamtlaenge-4>  <0,0,Gesamtlaenge> 6 }
		#end
		}

	#switch(Einsatzart)
		#case(0)
				// Ausschnitt fuer Massefederkontakt (etwas kuerzer)
			box { <1.3,3.4,-0.01>, <-1.3,7.001,Gesamtlaenge-1.998> }
					// Breiterer Ausschnitt fuer Befestigung des
					// Massefederkontaktes am Metallbecher
			box { <2.1,3.45,Gesamtlaenge-1.999>, <-2.1,6.201,Gesamtlaenge+0.01> }
		#break
		#else
				// Ausschnitt fuer Massefederkontakt
			box { <1.3,3.4,-0.01>, <-1.3,7.001,Gesamtlaenge+0.01> }
	#end

	#ifdef(CON_DIN_MA_Debug_Viewmode)
		texture {col_Kerko}
	#else
		//	texture {pigment{Gray85} finish{F_MetalB}}
		texture {pigment{Gray15} finish{F_MetalB}}
	#end
	}
#end

#macro CON_DIN_MA_Inlet_Millbody()
#local Gesamtlaenge=13;
#local Stanzlochbreite=3.9;
union{
		// Basisbox bis 3mm vor Grund
	box { <Stanzlochbreite/2,0.4,-0.001>, <-Stanzlochbreite/2,-0.4,Gesamtlaenge-3> }
		// Roehre fuer Pin vom Stecker
	cylinder { <  0,  0,-0.001>  <   0,   0,Gesamtlaenge-3> 0.8 }
		// Durchbruch fuer Pinanschluss
	box { <1.25,0.4,Gesamtlaenge-3.001>, <-1.25,-0.4,Gesamtlaenge+0.001> }

	#ifdef(CON_DIN_MA_Debug_Viewmode)
		texture {col_Kerko}
	#else
		//	texture {pigment{Gray85} finish{F_MetalB}}
		texture {pigment{Gray15} finish{F_MetalB}}
	#end
	}
#end

#macro TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(Major Minor, Dicke, Quadrant)
	// Parametrisierung aehnlich zu der eines Torus
	// Major:    Radius des Ringes zur gedachten Mittellinie des zu
	//           einem Viertel aufgeschnittenen Ringtoruses
	// Minor:    Radius zur Aussenkante des zu einem Viertel
	//           aufgeschnittenen Torusringes
	// Dicke:    Die Blechdicke bestimmt abhaengig vom Minor-Aussenradius
	//           in der Folge den Innenradius des zu einem Viertel
	//           aufgeschnittenen Torusringes. Dicke sollte im Bereich
	//           0<=Dicke<=Minor  liegen.
	//           Ist  Dicke<0  oder  Dicke>2*Minor, dann wird kein
	//           Torus dargestellt, weil die Schnittmenge leer wird.
	// Quadrant: Wahl des Viertels des Torusringes (1, 2, 3, 4)

#local SelectioningCylinder1 = cylinder { <0,0,0>   <0,Minor+0.001,0> Major+Minor+0.001 }
#local SelectioningCylinder2 = cylinder { <0,Minor+0.001,0>  <0,-(Minor+0.001),0> Major }
#if(Quadrant=3)
	object{
#else
	intersection{
#end
		difference{
			torus{Major, Minor}
			torus{Major, Minor-Dicke}

			#if(Quadrant=4 | Quadrant=3)
				SelectioningCylinder1
			#end
			#if(Quadrant=2 | Quadrant=3)
				SelectioningCylinder2
			#end
			}

		#if(Quadrant=1 | Quadrant=2)
			SelectioningCylinder1
		#end
		#if(Quadrant=1 | Quadrant=4)
			SelectioningCylinder2
		#end
		}
#end

#macro CON_DIN_MA_Outlet_BecherBase()
#local Gesamtlaenge=13;
union{
		// Hauptteil des Metallbechers, aufgebaut aus
		// ausgeschnittenen Ringtori und Zylinderringen
	difference{
		union{
			cylinder { <0,1,0>  <0,Gesamtlaenge-2,0> 7.4 }
			cylinder { <0,Gesamtlaenge-1.4,0>  <0,Gesamtlaenge-1,0> 6.4 }
			}
		cylinder { <0, 0.999,0>  <0,Gesamtlaenge-1.999,0> 7.0 }
		cylinder { <0,Gesamtlaenge-1.4001,0>  <0,Gesamtlaenge-0.999,0> 6.2 }
		}

	object{ TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(8.0, 1.0, 0.4, 4) translate<0,1,0> }
	object{ TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(6.4, 1.0, 0.4, 2) translate<0,Gesamtlaenge-2,0> }

		// Winkelstueck zur Befestigung der Massekontakzunge
	union{
			// Viertelrohr als Biegeradius des Winkelstueckes
		intersection{
			cylinder { <2,0.5,-0.5>  <-2,0.5,-0.5> 0.5 }
			cylinder { <2.001,0.5,-0.5>  <-2.001,0.5,-0.5> 0.1 inverse}
			box{<2.001,-0.001,-0.001>, <-2.001,0.5,-0.5>}
			}

			// Anschluss an den Metallbecher inklusive radialer Begrenzung
		intersection{
			box{<2,0,-0.5>, <-2,0.4,-2.5> }
			cylinder { <0,-0.001,0>  <0,0.401,0> 6.201 translate<0,0,4.0> }
			}

			// Kombination der Konstruktion von abgewinkeltem Anschlussstueck
			// und der Massekontaktzunge in einer difference/union-Sektion,
			// was ein paar Anweisungen spart, die ganze Beschreibung
			// allerdings etwas unuebersichtlich macht.
		difference{
			union{
					// Haltezunge fuer Niet
				box{<2,3.5,-0.4>, <-2,0.5,0>}

					// Kontaktzunge fuer Massekontaktierung als Cubic-Spline
				prism {
					linear_sweep cubic_spline
					-1.15, 1.15, 14, // the number of points making up the shape ...
					<2.45-Gesamtlaenge,-4.0>, < 2.45-Gesamtlaenge,0.5>,
					
					<5.4-Gesamtlaenge,-1.65>,

					<11.4-Gesamtlaenge,-0.02>, <12.4-Gesamtlaenge,0.2>, <13.4-Gesamtlaenge,0.2>, <16.4-Gesamtlaenge,0.175>,
					<16.4-Gesamtlaenge, 0.025>, <13.4-Gesamtlaenge,0.0>, <12.4-Gesamtlaenge,0.0>, <11.4-Gesamtlaenge,-0.22>,

					<5.4-Gesamtlaenge,-1.85>,
					
					< 2.45-Gesamtlaenge,0.5>, <6.95-Gesamtlaenge,0.5>
					rotate<0,0,90>
					}
					// Ergaenzung des Cubic-Spline am hinteren Ende
				box  { <-1.15,13.30-(Gesamtlaenge),0.2>, <1.15,19.65-Gesamtlaenge,0> }
				cylinder { <0,19.65-(Gesamtlaenge),0.2>     <0,19.65-Gesamtlaenge,0> 1.15 }
	#ifdef(CON_DIN_MA_Debug_Viewmode)
		pigment{White}
	#end		
				}

				// Abschraegen der Haltezunge
			box{< 2.05,-0.501,0.001>, < 3.0,3.075,-0.401> rotate <0,0, 15> }
			box{<-2.05,-0.501,0.001>, <-3.0,3.075,-0.401> rotate <0,0,-15> }

				// Ausschneiden des Langloches in der Massekontaktzunge			
			box   { <-0.5,18.15-Gesamtlaenge,0.201>, <0.5,19.65-Gesamtlaenge,-0.001> }
			cylinder { <0,19.65-Gesamtlaenge,0.201>  <0,  19.65-Gesamtlaenge,-0.001> 0.5 }
			cylinder { <0,18.15-Gesamtlaenge,0.201>  <0,  18.15-Gesamtlaenge,-0.001> 0.5 }
	#ifdef(CON_DIN_MA_Debug_Viewmode)
		pigment{Red}
	#end		
			}

			// Messingniet zur Verbindung von Haltezunge und Massekontaktzunge
		cylinder { <0,2,0.25>  <0,2,-0.45> 0.875 texture {T_Gold_5E}} 	// Messing!

		translate<0,Gesamtlaenge-1.4,-4.0>
		}
	}
#end

#macro CON_DIN_MA_Outlet_FrontHlpr1(Winkel, Bauteil)
	#local ZielLaenge = (2*(Winkel>=0)-1)*9.138 ;
	#local ZielWinkel = Winkel+(2*(Winkel>=0)-1)*34.58078 ;
	#switch(Bauteil)
		#case(0)	// Boxen fuer "difference" der Viertel-Torusse, allerdings
					// nur oberhalb Blechdicke, nicht (mehr) komplett
			box {
				<0, -0.001,  -5.0   >, <ZielLaenge,1.001,0.001>
				#ifdef(CON_DIN_MA_Debug_Viewmode)
					pigment{Green}
				#end		
		#break

			// Teile zur Konstruktion der geraden Randboegen vom Tiefziehen
			// intersection{ 1 object{2 inverse} 3 }
		#case(1)	// Zylinder als Blechkante fuer Montagefluegel
			cylinder{
				<0,1,-1>, <ZielLaenge,1,  -1  > 1.0
				#ifdef(CON_DIN_MA_Debug_Viewmode)
					pigment{Red}
				#end		
		#break
		#case(2)	// Innenzylinder fuer "intersection" mit Modifizierer
					// "inverse", Radius weniger Blechdicke (0.4)
					//
					// Realisierung der Ueberstaende fuer "difference" (aka
					// inverse intersection) hier nicht absolut (+/- 0.001),
					// sondern relativ:  +/- FinLen * 0.001
			cylinder{
				<-ZielLaenge*0.001,1,-1>, <ZielLaenge*1.001,1,-1> 0.6
				#ifdef(CON_DIN_MA_Debug_Viewmode)
					pigment{Yellow}
				#end		
		#break
		#case(3)	// Box fuer "intersection" zum Freischneiden des richtigen Viertels
					// inklusive Ueberstaende fuer Nicht-Schnittflaechen
			box {
				<-0.001,0,  -1.001  >, <ZielLaenge+0.001,1.001,  0  >
				#ifdef(CON_DIN_MA_Debug_Viewmode)
					pigment{Pink}
				#end		
		#break

		#else
		// #case(4)	// Box zum Ausfuellen mit Blechdicke bis zur Biegekante
			box {
				<0,0,-7.5>, <ZielLaenge,0.4,-1>
	#end

				translate <0,0,   9.5  >
				rotate <0,ZielWinkel,0>
				}
#end

#macro CON_DIN_MA_Outlet_FrontHlpr2(Winkel)
intersection{
	CON_DIN_MA_Outlet_FrontHlpr1(Winkel, 1)
	object{ CON_DIN_MA_Outlet_FrontHlpr1(Winkel, 2) inverse }
	CON_DIN_MA_Outlet_FrontHlpr1(Winkel, 3)
	}
#end

#macro CON_DIN_MA_Outlet_FrontFlansch()
	// Dazu kommt die Frontplatte mit den beiden Flansch"ohren", welche
	// wiederum die beiden Befestigungsloecher enthalten
difference{
	union{
			// Der vorne ueberstehende Ring
		cylinder { <0,0,0>  <0,0.4,0> 8.5 }

			// Das Freischneiden der Ringtori an den Uebergaengen zu
			// den geraden Randstuecken kann "schlierenfrei" nur
			// durch eine weitere explizite difference/union-
			// Beschreibung durchgefuehrt werden
		difference{
			union{
					// Der vorne ueberstehende Torus am Ring
				object{TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(8.5, 1.0, 0.4, 3) translate<0,1,0> }
			
					// Die Flanschohren
				object{ TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(2.2, 1.0, 0.4, 3) translate< 11.1,1,0> }
				object{ TIEFZIEH_ABRUNDUNG_VIERTELTORTORUS(2.2, 1.0, 0.4, 3) translate<-11.1,1,0> }
				}

				// Abschneiden der Tori an den Uebergaengen
				// zu den geraden Kantenverbindern
			CON_DIN_MA_Outlet_FrontHlpr1(   0, 0)
			CON_DIN_MA_Outlet_FrontHlpr1( 180, 0)
			CON_DIN_MA_Outlet_FrontHlpr1(-180, 0)
			CON_DIN_MA_Outlet_FrontHlpr1(-360, 0)
			#ifdef(CON_DIN_MA_Debug_Viewmode)
				pigment{Magenta}
			#end		
			}

			// Ausfuellung der Ohrentori
		object{ cylinder { <0,0,0>  <0,0.4,0> 2.2 } translate< 11.1,0,0> }
		object{ cylinder { <0,0,0>  <0,0.4,0> 2.2 } translate<-11.1,0,0> }

			// Die gebogenen Raender zu den Ohren hin
		CON_DIN_MA_Outlet_FrontHlpr2(   0)
		CON_DIN_MA_Outlet_FrontHlpr2( 180)
		CON_DIN_MA_Outlet_FrontHlpr2(-180)
		CON_DIN_MA_Outlet_FrontHlpr2(-360)
		
			// Verlaengerung der gebogenen Raender zu den Ohren mit Blech
		CON_DIN_MA_Outlet_FrontHlpr1(   0, 4)
		CON_DIN_MA_Outlet_FrontHlpr1( 180, 4)
		CON_DIN_MA_Outlet_FrontHlpr1(-180, 4)
		CON_DIN_MA_Outlet_FrontHlpr1(-360, 4)
		#ifdef(CON_DIN_MA_Debug_Viewmode)
			pigment{Cyan}
		#end		
		}

		// Ausschneiden des grossen Loches in der Mitte
	cylinder { <0,-0.001,0>  <0,0.401,0> 8.0 }

		// Ausschneiden der beiden kleinen Befestigungsbohrloecher in den Ohren
	object{ cylinder { <0,-0.001,0>  <0,0.401,0> 1.6 } translate< 11.1,0,0> }
	object{ cylinder { <0,-0.001,0>  <0,0.401,0> 1.6 } translate<-11.1,0,0> }
	}
#end

#macro CON_DIN_MA_Outlet_Becher(Flansch)
	// Flansch: on/off

#if(Flansch=on)
	union{
			// Hauptbecher
		CON_DIN_MA_Outlet_BecherBase()
			// Frontflansch
		CON_DIN_MA_Outlet_FrontFlansch()
#else
	object{
		CON_DIN_MA_Outlet_BecherBase()
#end
	
			// Hier lediglich noch Positionierarbeiten
		rotate<90,0,0>
	
		#ifdef(CON_DIN_MA_Debug_Viewmode)
			// pigment{Green}
			texture {col_gold}
		#else
			texture {col_silver}
		#end
		}
#end

/*##########################################################################*/
/*##########################################################################*/
/*# Ende der Bauteildefinitionen, Anwendung durch Gruppierungen und Muster #*/
/*##########################################################################*/
/*##########################################################################*/

#macro CON_DIN_MA_InletAction(Typ, LochRotWinkel, LochPosWinkel)
	// Typ:           Art der Bearbeitung, derzeit definiert sind:
	//                0 - Fraesen bzw. Ausstanzen des kontaktfederloches
	//                1 - Kontaktfedereinsatz, Anschluss gebogen, Oese lang
	//                2 - Kontaktfedereinsatz, Anschluss gedreht, Oese lang
	//                3 - Kontaktfedereinsatz, Anschluss gedreht, Oese kurz
	//                4 - Kontaktfedereinsatz, Anschluss gebogen und
	//                    gedreht, Oese lang
	//                5 - Kontaktfedereinsatz, Anschluss gebogen und
	//                    invers gedreht, Oese lang
	//                6 - Kontaktfedereinsatz, Anschluss gebogen und
	//                    zweifach gedreht (60° statt 30°), Oese lang
	//
	// LochRotWinkel: Rotation des Stanzloches um die eigene Achse
	//                (dieser wird gegen "LochPosWinkel" kompensiert
	// LochPosWinkel: Rotation des Loches auf einem Radius von 3.5
	//                innerhalb des Buchseninlets
	//
	// Spezialfall: Wenn  LochPosWinkel=180  dann wird das Stanzloch
	// Mitelloch    genau in der Mitte des Inlets positioniert. Da
	//              das Loch ansonsten im Ausschnitt fuer den
	//              Massekontakt zu liegen kaeme, ist das "Fehlen" des
	//              180'er Winkels daher nicht tragisch.
	//
#local PositionRadius=3.5;
object{
	#switch(Typ)
		#case(6)	// Anschluss gebogen und zweifach verdreht, Oese lang
			CON_DIN_MA_Inlet_Kontaktfeder(3, 4, 30)
		#break
		#case(5)	// Anschluss gebogen und invers verdreht, Oese lang
			CON_DIN_MA_Inlet_Kontaktfeder(3, 3, 30)
		#break
		#case(4)	// Anschluss gebogen und verdreht, Oese lang
			CON_DIN_MA_Inlet_Kontaktfeder(3, 2, 30)
		#break
		#case(1)	// Anschluss gebogen, Oese lang
			CON_DIN_MA_Inlet_Kontaktfeder(3, 1, 30)
		#break
		#case(2)	// Anschluss gedreht, Oese lang
			CON_DIN_MA_Inlet_Kontaktfeder(3, 0,-30)
		#break
		#case(3)	// Anschluss gedreht, Oese kurz
			CON_DIN_MA_Inlet_Kontaktfeder(1, 0,-30)
		#break
		#else		// wie #case(0), Fraesen bzw. Ausstanzen der Loecher
			CON_DIN_MA_Inlet_Millbody()
	#end

 	rotate<0,0,90+LochRotWinkel-LochPosWinkel>
	#if(LochPosWinkel!=180)
	 	translate<0,-3.5,0>
	 	rotate<0,0,LochPosWinkel>
	#end
	}
#end

#macro CON_DIN_MA_InletPinComposition(MA_Typ, PinAction, MidPinAct)
	// MA_Typ:    Selektion der Buchsenart, Anzahl der Pins,
	//            Winkelstellung der Pins usw. ueber Typcodes.
	//
	//		Derzeit definitiert:
	//			30 - Anordnung wie bei:				MAB_3_S
	//			40 - Anordnung wie bei:				MAB_4
	//			51 - Anordnung wie bei:				MAB_5_S
	//			52 - Anordnung wie bei:				MAB_5
	//			53 - Anordnung wie bei:	(kreuzfoermig, nicht Hirschmann)
	//			61 - Anordnung wie bei:				MAB_6
	//			62 - Anordnung wie bei (exklusiv):	MAB_6_V
	//			63 - Anordnung wie bei (exklusiv):	MAB_6_H
	//			71 - Anordnung wie bei (exklusiv):	MAB_7_SH
	//			72 - Anordnung wie bei:				MAB_7_S
	//			81 - Anordnung wie bei:				MAB_8_S
	//			82 - Anordnung wie bei:				MAB_8_SN
	//
	//			39 - Fuer rekursive Aufrufe benoetigt
	//			58 - Fuer rekursive Aufrufe benoetigt
	//			59 - Fuer rekursive Aufrufe benoetigt
	//
	//		"Vererbungshierarchien":
	//				30 <|-- 51 <|-- 81
	//				59 <|-- 72 <|-- 82
	//				39 <|-- 58 <|-- 61
	//				ohne: 40, 52, 53, 62, 63, 71
	//
	// PinAction: Art der Bearbeitung, derzeit definiert sind:
	//            0 - Fraesen bzw. Ausstanzen des Kontaktfederloches
	//            1 - Kontaktfedereinsatz, Anschluss gebogen, Oese lang
	//            2 - Kontaktfedereinsatz, Anschluss gedreht, Oese lang
	//            3 - Kontaktfedereinsatz, Anschluss gedreht, Oese kurz
	//
	// MidPinAct: Gesondert definierbare Bearbeitungsart fuer das Mittelloch
	//
	// ACHTUNG: Der aeussere aufrufende Kontext sollte diesem Makro eine
	//          klammernde Struktur umstellen, wie z.B.:  union{}
	//

	#switch(MA_Typ)
		#case(81)
				// Mittelloch ausstanzen, exzentrisch (0.9 mm) positioniert
			object{CON_DIN_MA_InletAction(MidPinAct, 0,180) translate<0,0.9,0>}
				// Die beiden speziell ausgerichteten Kontaktbohrungen unten
			object{CON_DIN_MA_InletAction((PinAction!=1?PinAction:4), -45,-135) translate<-1, 0.5, 0>}
			object{CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-135, 135) translate< 1, 0.5, 0>}
			// fall through to next case, adding more pins
		#case(51)
				// 45° links
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4), -45,-45)
				// 45° rechts
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-135, 45)
		#case(30)
				// 90° links
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4), -45,-90)
				// 90° rechts
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-135, 90)
				// center
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:6),   0,  0)
		#break;
		//############################################

		#case(82)
				// Mittelloch ausstanzen, exzentrisch (0.7 mm) positioniert
			object{CON_DIN_MA_InletAction(MidPinAct, 0,180) translate<0,0.7,0>}

		#case(72)
				// Kontakte 6 und 7 unten ergaenzen
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:6),-135,-135)
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4), 135, 135)

		#case(59)
				// virtuelle 5'er Buchse, da nicht nach Norm
			#local Rotator=-90;
			#while (Rotator<=90)
				CON_DIN_MA_InletAction((PinAction!=1?PinAction:6), Rotator, Rotator)
				#local Rotator=Rotator+45;
			#end
		#break;
		//############################################

		#case(61)
				// Loch rechts unten ausstanzen und befuellen
			CON_DIN_MA_InletAction(PinAction, 300,-120)
		#case(58)
				// Mittelloch ausstanzen (6'er Buchse)
			CON_DIN_MA_InletAction(MidPinAct,  60, 180)
				// Loch rechts unten ausstanzen und befuellen
			CON_DIN_MA_InletAction(PinAction, 240, 120)
		#case(39)
				// 3 Loecher mit 60°-"Abstaenden" ausstanzen (fuer 6'er Buchse)
			#local Rotator=-60;
			#while (Rotator<=60)
				CON_DIN_MA_InletAction(PinAction, Rotator+120, Rotator)
				#local Rotator=Rotator+60;
			#end
		#break;
		//############################################

		#case(40)
				// Loch links unten ausstanzen und befuellen
			CON_DIN_MA_InletAction(PinAction, -18,-108)
				// Links oben
			CON_DIN_MA_InletAction(PinAction,  72, -36)
				// Rechts oben
			CON_DIN_MA_InletAction(PinAction, 108,  36)
				// Loch rechts unten ausstanzen und befuellen
			CON_DIN_MA_InletAction(PinAction, 198, 108)
		#break;
		//############################################

		#case(52)
				// rekursives "Holen" der 3'er Basis
			CON_DIN_MA_InletPinComposition(39, (PinAction!=1?PinAction:5), MidPinAct)
				// Loch rechts unten ausstanzen und befuellen
				//   diese Ausrichtung (nach Spec!!!) kann so nicht
				//   sein (Ueberschneidungen), muesste eigentlich einer
				//   62'er ohne Mittelpin entsprechen, bzw. der Anw.:
				//     CON_DIN_MA_InletAction(PinAction, 240, 120)
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:6), 120, 120)
				// Loch links unten ausstanzen und befuellen
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),   0,-120)
		#break;
		//############################################

		#case(53)
				// Mittelloch ausstanzen (5'er Kreuz-Buchse)
			CON_DIN_MA_InletAction(MidPinAct,  0, 180)
				// 2 Loecher oben mit 90°-"Abstand" ausstanzen
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4), -45, -45)
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-135,  45)
				// 2 Loecher unten mit 90°-"Abstand" ausstanzen
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4),-82.5,-135)
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-97.5, 135)
		#break;
		//############################################

		#case(62)
				// rekursives "Holen" der 5'er Basis
			CON_DIN_MA_InletPinComposition(58, PinAction, MidPinAct)
				// Loch links unten ausstanzen und befuellen
			CON_DIN_MA_InletAction(PinAction, 0,-120)
		#break;
		//############################################

		#case(63)
				// Mittelloch ausstanzen (6'er Buchse)
			CON_DIN_MA_InletAction(MidPinAct,  90, 180)


				// 5 Loecher mit 60°-"Abstaenden" ausstanzen (fuer 6'er Buchse)
			CON_DIN_MA_InletAction(PinAction,   0, -120)
			CON_DIN_MA_InletAction(PinAction, 120,   60)
			CON_DIN_MA_InletAction(PinAction, 180,  120)

				// bei Abwinkelung zusaetzlich Verdrehung
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:6),   0,    0)
				// bei Abwinkelung zusaetzlich inverse Verdrehung
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),  60,  -60)
		#break;
		//############################################

		#case(71)
				// rekursives "Holen" der 5'er Basis
			CON_DIN_MA_InletPinComposition(59, PinAction, MidPinAct)
				// Ergaenzen der beiden Pins 6 und 7
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:4),-90,-135)
			CON_DIN_MA_InletAction((PinAction!=1?PinAction:5),-90, 135)
		#break;
		//############################################
	#end
#end

	// MA_Typ:    Selektion der Buchsenart, Anzahl der Pins,
	//            Winkelstellung der Pins usw. ueber Typcodes.
	//            Die Typcodes sind derzeit noch nicht mit dem
	//            DIN-Standard abgestimmt
	//
	// MA_Subtyp: Selektion der weiteren Auspraegung, derzeit definiert:
	//            0 - Buchse im Metallbecher mit Flansch
	//                 (es fehlt noch der Masseanschluss)
	//            1 - Buchse im Metallbecher ohne Flansch
	//                (nicht fertiggestellt, Oesen statt Pins)
	//            2 - Kupplung (nicht fertiggestellt, Metallabschirmung
	//                [Becher] und Ummantelung fehlen noch komplett)

union{
	#local AllParts=3;
	#switch(MA_Subtyp)
		#case(1)
			#if(AllParts>=3)
				CON_DIN_MA_Outlet_Becher(off)
				#end

			#local Wulst=0;		// Metallbechermontage

				// die folgenden Definitionen verlangen eigentlich
				// einen Pin. Leider ist anhand der Specs nicht
				// ersichtlich, wie die Verankerung im Gehaeuse
				// stattfindet, noch wie gross der Offset des
				// Anschlusspins vom Mittelpunkt ist.
				// Daher zunaechst Verwendung langer Oesen mit
				// Verriegelung durch Verdrehen.
			#local PinEnde=2;		// Oese lang, verdreht
			#local MLPEnde=2;		// Oese lang, verdreht
		#break
		#case(2)
			// Makro fuer Kupplungs-/Steckergehaeuse fehlt (noch)
			#if(AllParts>=3)
				#end

			#local Wulst=1;		// Halbschalenmontage
			#local PinEnde=3;		// Oese kurz, verdreht
			#local MLPEnde=2;		// Oese lang, verdreht
		#break
		#else	// selbe wie case(0)
			#if(AllParts>=3)
				CON_DIN_MA_Outlet_Becher(on)
				#end

			#local Wulst=0;		// Metallbechermontage
			#local PinEnde=1;		// Oese lang, abgebogen
			#local MLPEnde=2;		// Oese lang, verdreht
		#end

		// noch eine extra union, damit nur ein Objekt
		// "translationiert" (verschoben) werden braucht
	union{
		#if(AllParts>=2)
			difference{
				CON_DIN_MA_Inlet_Basebody(Wulst)
					// Ausfraesungen fuer die Kontaktfedern: 0,0
				CON_DIN_MA_InletPinComposition(MA_Typ, 0, 0)
				}
			#end

		#if(AllParts>=1)
				// Einbringen der Kontaktfedern
			CON_DIN_MA_InletPinComposition(MA_Typ, PinEnde, MLPEnde)
			#end

			// Gesamtlaenge ueber alles ohne Pins laut Hirschmann-Spec: 13.6
			// Body ist aber nur 13.0, wobei jenes Inlet aber etwas im
			// Gehaeuse (Becher) versenkt ist. Daher Positionierung desselben
		translate<0,0,0.6>
		}
	}
#end

#macro CON_DIN_MAB_3S()
object{CON_DIN_MA_XX_GRND(30, 0)}
#end
#macro CON_DIN_MAB_4()
object{CON_DIN_MA_XX_GRND(40, 0)}
#end
#macro CON_DIN_MAB_5()
object{CON_DIN_MA_XX_GRND(52, 0)}
#end
#macro CON_DIN_MAB_5S()
object{CON_DIN_MA_XX_GRND(51, 0)}
#end
#macro CON_DIN_MAB_6()
object{CON_DIN_MA_XX_GRND(61, 0)}
#end
#macro CON_DIN_MAB_7S()
object{CON_DIN_MA_XX_GRND(72, 0)}
#end
#macro CON_DIN_MAB_8S()
object{CON_DIN_MA_XX_GRND(81, 0)}
#end
#macro CON_DIN_MAB_8SN()
object{CON_DIN_MA_XX_GRND(82, 0)}
#end
// (noch) keine richtigen Pinanschluesse
#macro CON_DIN_MAB_5SV()	
object{CON_DIN_MA_XX_GRND(51, 1)}
#end
// (noch) keine richtigen Pinanschluesse
#macro CON_DIN_MAB_6V()		
object{CON_DIN_MA_XX_GRND(62, 1)}
#end
// (noch) keine richtigen Pinanschluesse
#macro CON_DIN_MAB_7SV()	
object{CON_DIN_MA_XX_GRND(72, 1)}
#end
// (noch) keine richtigen Pinanschluesse
#macro CON_DIN_MAB_8SV()	
object{CON_DIN_MA_XX_GRND(81, 1)}
#end
// (noch) keine richtigen Pinanschluesse
#macro CON_DIN_MAB_8SNV()
object{CON_DIN_MA_XX_GRND(82, 1)}
#end

/********************************************************************************************************************************************
// Grundmakro: Stiftleiste nach DIN41617.
// J.Bartels(replace with at)arcor.de, www.mec-krefeld.de
********************************************************************************************************************************************/
#macro CON_DIS_DIN41617_GRND(Pins)
// Grundmakro: Um 90° gebogener, runder Stift eines Steckverbinders nach DIN41617.
// Parameter: Staerke ueber/unter PCB, Biegeradius (Mitte), Hoehe ueber/unter PCB-Oberkante, Laenge nach vorn (-Z), Farbe
// J.Bartels@arcor.de, www.mec-krefeld.de
#macro PIN41617 (DO,DU,R,HO,HU,L,col)
union{
	intersection{ 
		torus{ R, DO/2 rotate<0,0,90> translate<0,HO-R,-R> }
		box{ <DO/2,HO-R,DO/2><-DO/2,HO+DO/2,-R> }
	}
	cylinder{<0,-HU,0><0,HO-R-0.1,0> DU/2}
	cone{ <0,HO-R-0.1,0> DU/2 <0,HO-R,0> DO/2 }
	cylinder{<0,HO,-L+1><0,HO,-R> DO/2}
	cone{ <0, HO,-L+1>,DO/2,<0,HO,-L>,DO/2-0.3}
	texture{col}
} 
#end

// Grundmakro: Reihe von Stiften eines Steckverbinders nach DIN41617.
// J.Bartels@arcor.de, www.mec-krefeld.de
#macro PIN41617_ROW (Pins)
union{
	#local i=0;
	#while(i<Pins) 
		object{PIN41617 (1,0.8,1.2,1.6,3.3,13.9,col_gold) translate<i*2.5,0,-1.25>} 
		#local i=i+2; 
	#end
	#local i=1;
	#while(i<Pins) 
		object{PIN41617 (1,0.8,1.2,1.6+3.8,3.3,13.9+2.5,col_gold) translate<i*2.5,0,1.25>} 
		#local i=i+2; 
	#end
	translate<-(Pins/2)*2.5+1.25,0,4.5/2+2.5>
}
#end

#local A=(Pins-1)*2.5+15.6;
#local D=(Pins-1)*2.5+10;
#local E=Pins*2.5;
union{
 PIN41617_ROW( Pins )
 box{ <-E/2,0,-4.5/2><E/2,8.5,4.5/2> }
 //Befestigungs-Ohr
difference{ 
 box{ <A/2,0,-4.5/2><E/2,4.2,8.1-4.5/2> }
 intersection{
   cylinder{<D/2,-1,4.5/2><D/2,1+4.2,4.5/2>,1.6}
   box{ <D/2-1.6,-1,4.5/2-1.4><D/2+1.6,1+4.2,4.5/2+1.4>}
 }  
 box{ <-(A-E-5)/2,-1,0><0,1+4.2,8.1-4.5+10> rotate<0,20,0> translate<E/2,0,4.5/2> }
}
 //Befestigungs-Ohr
difference{ 
 box{ <-A/2,0,-4.5/2><-E/2,4.2,8.1-4.5/2> }
 intersection{
   cylinder{<-D/2,-1,4.5/2><-D/2,1+4.2,4.5/2>,1.6}
   box{ <-D/2+1.6,-1,4.5/2-1.4><-D/2-1.6,1+4.2,4.5/2+1.4>}
 }  
 box{ <(A-E-5)/2,-1,0><0,1+4.2,8.1-4.5+10> rotate<0,-20,0> translate<-E/2,0,4.5/2> }
}
pigment{Gray80}
}
#end

#macro CON_DIS_DIN41617_13()
object{CON_DIS_DIN41617_GRND(13)}
#end
#macro CON_DIS_DIN41617_21()
object{CON_DIS_DIN41617_GRND(21)}
#end
#macro CON_DIS_DIN41617_31()
object{CON_DIS_DIN41617_GRND(31)}
#end

/********************************************************************************************************************************************
//Macros for connector MATE-N-LOK vertical 9263 serie from AMP
//Designed by Philippe Boucheny <philippe.boucheny(replace with at)free.fr>
//Rev. 1.0 31-12-05
********************************************************************************************************************************************/
#macro CON_DIS_MATNLOK_9263_GRND(n,c)
#switch(c)
#case(1)
#local col=Gray90;
#break
#case(2)
#local col=Gray10;
#break
#case(3)
#local col=Brown;
#break
#case(4)
#local col=Gray90;
#break
#case(5)
#local col=Orange;
#break
#end

union{
    
    difference{
        merge{
            //body
        	box{<-6.35*n/2-.5,-3.8,0><6.35*n/2+.5,3.8,14>}

        	
        	//lateral grips
        	box{<-6.35*n/2,-1.5,6><-6.35*n/2-2.5,1.5,13.99>}
        	box{<6.35*n/2,-1.5,6><6.35*n/2+2.5,1.5,13.99>}
        	

        	//little blocs	
            #local i=0; #while (i<n+1) box{<-(6.35*n/2)+(i*6.35)-.5,-3.8,0><-(6.35*n/2)+(i*6.35)+.5,-4.6,2> } #local i=i+1; #end
         }
         
         merge{
            //Cylindrical holes
            #local i=0; #while (i<n) cylinder{<-(6.35/2*(n-1))+(i*6.35),0,1><-(6.35/2*(n-1))+(i*6.35),0,15> 3 } #local i=i+1; #end
            //Half square holes in the first hole
            #local i=0; 
            box{<-(6.35/2*(n-1))+(i*6.35)+3,0,1><-(6.35/2*(n-1))+(i*6.35)-3,-3,15> }
            //Half square holes in the last hole
            #local i=n-1;
            box{<-(6.35/2*(n-1))+(i*6.35)+3,0,1><-(6.35/2*(n-1))+(i*6.35)-3,-3,15> }
                        
        	//lateral grips
        	box{<-6.35*n/2-1.5,-1.6,5><-6.35*n/2-3.5,1.6,7.5> }
        	box{<+6.35*n/2+1.5,-1.6,5><+6.35*n/2+3.5,1.6,7.5> }
        	
        	box{<-2.5,-1.6,5><+2.5,1.6,20>  rotate -25*y translate +(6.35*n/2+9.8)*x}
        	box{<-2.5,-1.6,5><+2.5,1.6,20>  rotate +25*y translate -(6.35*n/2+9.8)*x}
         }
        #if(c=1)
             texture{
               pigment { rgbf <1,1,1,0.3> }
               normal{
                 agate 0.05
                 scale 0.1
               }
               finish{ phong 0.8 phong_size 200}
             }
        #else
            pigment{col}
        #end
    }
    #local i=0; #while (i<n)
        difference{
            union{
                //Pin
                cylinder{<-(6.35/2*(n-1))+(i*6.35),0,-2><-(6.35/2*(n-1))+(i*6.35),0,4> 0.85  }
                cylinder{<-(6.35/2*(n-1))+(i*6.35),0,4><-(6.35/2*(n-1))+(i*6.35),0,10.5> 1.05  }
                //Top
                cone {<-(6.35/2*(n-1))+(i*6.35),0,+10.5>, 1.05, <-(6.35/2*(n-1))+(i*6.35),0,+12>, 0.3 }
                //Base
                cone {<-(6.35/2*(n-1))+(i*6.35),0,-2>, 0.85, <-(6.35/2*(n-1))+(i*6.35),0,-4>, 0.5 }
                
                texture { pigment{P_Silver2}}
            }
            //gap
            box{<+1,-0.1,7><-1,+0.1,14> texture{pigment{P_Silver2}} rotate(rand(global_seed)*180)*z translate<-(6.35/2*(n-1))+(i*6.35),0,0>   }
        }
    #local i=i+1; #end
    rotate <-90, 180,0>
       
}
#end

// 2 pins Nature
#macro CON_DIS_MATNLOK_9263_10_1() 
object{CON_DIS_MATNLOK_9263_GRND(2,1)}
#end
// Black
#macro CON_DIS_MATNLOK_9263_10_2() 
object{CON_DIS_MATNLOK_9263_GRND(2,2)}
#end
// BrickRed
#macro CON_DIS_MATNLOK_9263_10_3() 
object{CON_DIS_MATNLOK_9263_GRND(2,3)}
#end
// White
#macro CON_DIS_MATNLOK_9263_10_4() 
object{CON_DIS_MATNLOK_9263_GRND(2,4)}
#end
// Orange
#macro CON_DIS_MATNLOK_9263_10_5() 
object{CON_DIS_MATNLOK_9263_GRND(2,5)}
#end
// 3 pins
#macro CON_DIS_MATNLOK_9263_11_1()
object{CON_DIS_MATNLOK_9263_GRND(3,1)}
#end
#macro CON_DIS_MATNLOK_9263_11_2()
object{CON_DIS_MATNLOK_9263_GRND(3,2)}
#end
#macro CON_DIS_MATNLOK_9263_11_3()
object{CON_DIS_MATNLOK_9263_GRND(3,3)}
#end
#macro CON_DIS_MATNLOK_9263_11_4()
object{CON_DIS_MATNLOK_9263_GRND(3,4)}
#end
#macro CON_DIS_MATNLOK_9263_11_5()
object{CON_DIS_MATNLOK_9263_GRND(3,5)}
#end
//4 pins
#macro CON_DIS_MATNLOK_9263_12_1()
object{CON_DIS_MATNLOK_9263_GRND(4,1)}
#end
#macro CON_DIS_MATNLOK_9263_12_2()
object{CON_DIS_MATNLOK_9263_GRND(4,2)}
#end
#macro CON_DIS_MATNLOK_9263_12_3()
object{CON_DIS_MATNLOK_9263_GRND(4,3)}
#end
#macro CON_DIS_MATNLOK_9263_12_4()
object{CON_DIS_MATNLOK_9263_GRND(4,4)}
#end
#macro CON_DIS_MATNLOK_9263_12_5()
object{CON_DIS_MATNLOK_9263_GRND(4,5)}
#end
// 5 pins
#macro CON_DIS_MATNLOK_9263_13_1()
object{CON_DIS_MATNLOK_9263_GRND(5,1)}
#end
#macro CON_DIS_MATNLOK_9263_13_2()
object{CON_DIS_MATNLOK_9263_GRND(5,2)}
#end
#macro CON_DIS_MATNLOK_9263_13_3()
object{CON_DIS_MATNLOK_9263_GRND(5,3)}
#end
#macro CON_DIS_MATNLOK_9263_13_4()
object{CON_DIS_MATNLOK_9263_GRND(5,4)}
#end
#macro CON_DIS_MATNLOK_9263_13_5()
object{CON_DIS_MATNLOK_9263_GRND(5,5)}
#end
// 6 pins
#macro CON_DIS_MATNLOK_9263_14_1()
object{CON_DIS_MATNLOK_9263_GRND(6,1)}
#end
#macro CON_DIS_MATNLOK_9263_14_2()
object{CON_DIS_MATNLOK_9263_GRND(6,2)}
#end
#macro CON_DIS_MATNLOK_9263_14_3()
object{CON_DIS_MATNLOK_9263_GRND(6,3)}
#end
#macro CON_DIS_MATNLOK_9263_14_4()
object{CON_DIS_MATNLOK_9263_GRND(6,4)}
#end
#macro CON_DIS_MATNLOK_9263_14_5()
object{CON_DIS_MATNLOK_9263_GRND(6,5)}
#end
// 8 pins
#macro CON_DIS_MATNLOK_9263_15_1()
object{CON_DIS_MATNLOK_9263_GRND(8,1)}
#end
#macro CON_DIS_MATNLOK_9263_15_2()
object{CON_DIS_MATNLOK_9263_GRND(8,2)}
#end
#macro CON_DIS_MATNLOK_9263_15_3()
object{CON_DIS_MATNLOK_9263_GRND(8,3)}
#end
#macro CON_DIS_MATNLOK_9263_15_4()
object{CON_DIS_MATNLOK_9263_GRND(8,4)}
#end
#macro CON_DIS_MATNLOK_9263_15_5()
object{CON_DIS_MATNLOK_9263_GRND(8,5)}
#end
// 10 pins
#macro CON_DIS_MATNLOK_9263_16_1()
object{CON_DIS_MATNLOK_9263_GRND(10,1)}
#end
#macro CON_DIS_MATNLOK_9263_16_2()
object{CON_DIS_MATNLOK_9263_GRND(10,2)}
#end
#macro CON_DIS_MATNLOK_9263_16_3()
object{CON_DIS_MATNLOK_9263_GRND(10,3)}
#end
#macro CON_DIS_MATNLOK_9263_16_4()
object{CON_DIS_MATNLOK_9263_GRND(10,4)}
#end
#macro CON_DIS_MATNLOK_9263_16_5()
object{CON_DIS_MATNLOK_9263_GRND(10,5)}
#end

/********************************************************************************************************************************************
//Makro fuer DSUB Andreas Fecht <info(replace with at)vetter-und-fecht.de>
//modifiziert und erweitert von Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro CON_DSUB(pin, female)
#macro DSHELL(ps, vc)
  // the dshell offset is (body size - dshell size)/2 + radius
  #local do = 8.33;    // dshell offset
  #local ds = 11.61;   // do + dshell size - ps - (radius*2)
  union
  {
    cylinder{<do,vc+3,0><do,vc+3,-5.8> 1 }
    cylinder{<ds+ps,vc+3,0><ds+ps,vc+3,-5.8> 1 }
    cylinder{<do+1,vc-3,0><do+1,vc-3,-5.8> 1 }
    cylinder{<ds+ps-1,vc-3,0><ds+ps-1,vc-3,-5.8> 1 }
    box{<do,vc+2,-0.5><ds+ps,vc+4,-5.8>}
    box{<do+1,vc-2,-0.5><ds+ps-1,vc-4,-5.8>}
    box{<0,vc+3,-0.5><1.5,vc-3,-5.8> rotate<0,0,-9.62> translate<ds+ps-2.10,0,0> }
    box{<0,vc+3,-0.5><1.5,vc-3,-5.8> rotate<0,0,9.62> translate<do+0.55,0,0> }
  }
#end

union
{
  #local j = (pin-1)/2; // number of pins in bottom row
  #local hs = 2.758;    // horizontal pin spacing
  #local hc = 9.525;    // vertical centerline
  #local vs = 2.845;    // vertical pin spacing
  #local vc = 6.274;    // vertical centerline
  #local po = 9.97;     // offset to first pin
  #local ps = j*hs;     // total pin spacing
  #local bo = 20;       // body offset = body size - ps
  #local so = 3;        // screwlock offset from body sides

  // the D shaped shell
  difference
  {
    object
    {
      DSHELL(ps, vc)
      translate<-0.5,-0.25,0>
      scale<1.04-(0.0015*j),1.04,1>
      texture{col_silver}
    }

    object
    {
      DSHELL(ps, vc)
      scale<1,1,1.1>
      texture{col_silver}
    }
  }

  #if (female)
    // the plastic piece inside the female dshell
    DSHELL(ps, vc)

    // dshell sockets
    difference
    {
      box{<po-1,vc-4,-0.5><po+ps+1,vc+4,-5.8>}
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,-2><po+hs*i,vc+vs/2,-10> 0.5 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,-2><po+hs*(i+0.5),vc-vs/2,-10> 0.5 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,-2><po+hs*i,vc+vs/2,-10> 0.5 texture{col_gold} }
    }
  #else
    // dshell pins
    union
    {
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,-0.5><po+hs*i,vc+vs/2,-5.8> 0.5 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,-0.5><po+hs*(i+0.5),vc-vs/2,-5.8> 0.5 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,-0.5><po+hs*i,vc+vs/2,-5.8> 0.5 texture{col_gold} }
    }
  #end

  // board pins
  union
  {
    #local i = 0;
    #while(i<j)
      cylinder{<po+hs*i,0,hc+vs/2><po+hs*i,-3,hc+vs/2> 0.5 texture{col_gold} }
      cylinder{<po+hs*(i+0.5),0,hc-vs/2><po+hs*(i+0.5),-3,hc-vs/2> 0.5 texture{col_gold} }
      #local i = i+1;
    #end
    cylinder{<po+hs*i,0,hc+vs/2><po+hs*i,-3,hc+vs/2> 0.5 texture{col_gold} }
  }

  // screwlock backplates
  box{<bo+ps-5.5,3,4><bo+ps-0.5,9.5,4.5> texture{col_silver} }
  box{<0.5,3,4><5.5,9.5,4.5> texture{col_silver} }
  // lower plates
  box{<bo+ps-4.5,3,4><bo+ps-1.5,3.25,hc> texture{col_silver} }
  box{<1.5,3,4><4.5,3.25,hc> texture{col_silver} }
  // mounting tabs
  box{<bo+ps-4.5,0,hc-1><bo+ps-3.5,3.25,hc> texture{col_silver} }
  box{<3.5,0,hc-1><4.5,3.25,hc> texture{col_silver} }

  box{<bo+ps-2.5,0,hc-1><bo+ps-1.5,3.25,hc> texture{col_silver} }
  box{<1.5,0,hc-1><2.5,3.25,hc> texture{col_silver} }

  // the main plastic body
  difference
  {
    box{<0,0,0><bo+ps,10.5,12.6>}
    box{<bo-7+ps,3,4><bo+0.1+ps,12.5,12.7>}
    box{<-0.1,3,4><7,12.5,12.7>}
    cylinder{<bo-7+ps,10.5,4><bo-7+ps,10.5,12.7> 1}
    cylinder{<7,10.5,4><7,10.5,12.7> 1}
    cylinder{<bo-3+ps,3.1,hc><bo-3+ps,-0.1,hc> 1.5}
    cylinder{<3,3.1,hc><3,-0.1,hc> 1.5}
  }

  // upper radius on plastic body
  cylinder{<bo-8+ps,9.5,4><bo-8+ps,9.5,12> 1}
  cylinder{<8,9.5,4><8,9.5,12> 1}

  // thin part of plastic body against the front
  box{<2,12.5,0><bo+ps-2,10.5,2>}
  cylinder{<bo-2+ps,10.5,0><bo-2+ps,10.5,2> 2}
  cylinder{<2,10.5,0><2,10.5,2> 2}

  // thin metal plate backing D shell
  box{<0,1.5,0><bo+ps,11,-0.5>  texture{col_silver} }

  box{<1.5,12.5,0><bo+ps-1.5,10.5,-0.5> texture{col_silver} }
  cylinder{<bo+ps-1.5,11,0><bo+ps-1.5,11,-0.5> 1.5 texture{col_silver} }
  cylinder{<1.5,11,0><1.5,11,-0.5> 1.5 texture{col_silver} }

  box{<1.5,0,0><bo+ps-1.5,1.5,-0.5> texture{col_silver} }
  cylinder{<bo+ps-1.5,1.5,0><bo+ps-1.5,1.5,-0.5> 1.5 texture{col_silver} }
  cylinder{<1.5,1.5,0><1.5,1.5,-0.5> 1.5 texture{col_silver} }

  // screwlocks
  difference
  {
    prism { 0, 5, 7, <3,5>, <-3,5>, <-5,0>, <-3,-5>, <3, -5>, <5,0>, <3,5>  texture{col_silver}
    scale<0.5,1,0.5>
    rotate<90,0,0> }

    cylinder{<0,0,-1><0,0,5> 1.5 texture{col_silver}  }
    translate<so,vc,-5.5>
  }


  difference
  {
    prism { 0, 5, 7, <3,5>, <-3,5>, <-5,0>, <-3,-5>, <3, -5>, <5,0>, <3,5>  texture{col_silver}
    scale<0.5,1,0.5>
    rotate<90,0,0> }

    cylinder{<0,0,-1><0,0,5> 1.5 texture{col_silver}  }
    translate<bo+ps-so,vc,-5.5>
  }

  // internal threads of the screwlocks
  #local i = 0;
    #while(i<12)
      torus { 1.5, 0.25  rotate <90,10,0>  texture{col_silver}
        translate<so,vc, 0.5-i/2> }
      torus { 1.5, 0.25  rotate <90,10,0>  texture{col_silver}
        translate<bo+ps-so,vc,0.5-i/2> }
    #local i = i+1;
  #end

  // screwlock mounting threads (in back)
  #local i = 5;
    #while(i<12)
      torus { 1.2, 0.25  rotate <90,10,0>  texture{col_silver}
        translate<so,vc, 10-i/2> }
      torus { 1.2, 0.25  rotate <90,10,0>  texture{col_silver}
        translate<bo+ps-so,vc,10-i/2> }
    #local i = i+1;
  #end


  cylinder{<0,0,-1><0,0,2.4> 1.2 texture{col_silver} translate<so,vc,5.5> }
  cylinder{<0,0,-1><0,0,2.4> 1.2 texture{col_silver} translate<bo+ps-so,vc,5.5> }

  translate<0-po-ps/2,0,0-hc>
  rotate<0,180,0>
  pigment{Gray30}
}
#end

#macro CON_DSUB_F9()
object{CON_DSUB(9, true)}
#end
#macro CON_DSUB_F15()
object{CON_DSUB(15, true)}
#end
#macro CON_DSUB_F25()
object{CON_DSUB(25, true)}
#end
#macro CON_DSUB_F37()
object{CON_DSUB(37, true)}
#end
#macro CON_DSUB_M9()
object{CON_DSUB(9, false)}
#end
#macro CON_DSUB_M15()
object{CON_DSUB(15, false)}
#end
#macro CON_DSUB_M25()
object{CON_DSUB(25, false)}
#end
#macro CON_DSUB_M37()
object{CON_DSUB(37, false)}
#end

/********************************************************************************************************************************************
//Makro fuer DSUBD Andreas Fecht <info(replace with at)vetter-und-fecht.de>
//modifiziert und erweitert von Duane Clark <dclark(replace with at)akamail.com>
//etwas missbraucht zur Kantenmontage durch USER_Ma(China)
//Modifikation zur exakten Ausrichtung auf halbe Platinenhoehe: Wolfgang Moser <womo (a) d81.de>
//Erweitert fuer stehende print Montage von Stefan Seegel
********************************************************************************************************************************************/
#macro CON_DSUBD(pin, female, print)

#macro DSHELLD(ps, vc)
  // the dshell offset is (body size - dshell size)/2 + radius
  #local do = 8.33;    // dshell offset
  #local ds = 11.61;   // do + dshell size - ps - (radius*2)
  union
  {
    cylinder{<do,vc+3,4><do,vc+3,0> 1 }
    cylinder{<ds+ps,vc+3,4><ds+ps,vc+3,0> 1 }
    cylinder{<do+1,vc-3,4><do+1,vc-3,0> 1}
    cylinder{<ds+ps-1,vc-3,4><ds+ps-1,vc-3,0> 1 }
    box{<do,vc+2,4><ds+ps,vc+4,0>}
    box{<do+1,vc-2,4><ds+ps-1,vc-4,0>}
    box{<0,vc+3,4><1.5,vc-3,0> rotate<0,0,-9.62> translate<ds+ps-2.10,0,0> }
    box{<0,vc+3,4><1.5,vc-3,0> rotate<0,0,9.62> translate<do+0.55,0,0> }
  }
#end
 
#macro DSHELL(ps, vc)
  // the dshell offset is (body size - dshell size)/2 + radius
  #local do = 8.33;    // dshell offset
  #local ds = 11.61;   // do + dshell size - ps - (radius*2)
  union
  {
    cylinder{<do,vc+3,0><do,vc+3,-5.8> 1 }
    cylinder{<ds+ps,vc+3,0><ds+ps,vc+3,-5.8> 1 }
    cylinder{<do+1,vc-3,0><do+1,vc-3,-5.8> 1 }
    cylinder{<ds+ps-1,vc-3,0><ds+ps-1,vc-3,-5.8> 1 }
    box{<do,vc+2,-0.5><ds+ps,vc+4,-5.8>}
    box{<do+1,vc-2,-0.5><ds+ps-1,vc-4,-5.8>}
    box{<0,vc+3,-0.5><1.5,vc-3,-5.8> rotate<0,0,-9.62>
translate<ds+ps-2.10,0,0> }
    box{<0,vc+3,-0.5><1.5,vc-3,-5.8> rotate<0,0,9.62> translate<do+0.55,0,0>
}
  }
#end
 
union
{
  #local j = (pin-1)/2; // number of pins in bottom row
  #local hs = 2.758;    // horizontal pin spacing
  #local hc = 0;//9.525;    // horizontal centerline
  #local vs = 2.845;    // vertical pin spacing
  #local vc = 6.274;    // vertical centerline
  #local po = 9.97;     // offset to first pin
  #local ps = j*hs;     // total pin spacing
  #local bo = 20;       // body offset = body size - ps
  #local so = 3;        // screwlock offset from body sides
  #local pin_col=col_silver;         //Color of pins
 
  // the D shaped shell
  difference
  {
    object
    {
      DSHELLD(ps, vc)   
      //DSHELLD(ps, vc)
      translate<-0.5,-0.25,0>
      scale<1.04-(0.0015*j),1.04,1>
      texture{col_silver}
    }
 
    object
    {
      DSHELLD(ps, vc)
      //DSHELLD(ps, vc)
      scale<1,1,1.1>
      texture{col_silver}
    }  
  } 
  
    difference
  {
    object
    {
      DSHELL(ps, vc)   
      //DSHELLD(ps, vc)
      translate<-0.5,-0.25,0>
      scale<1.04-(0.0015*j),1.04,1>
      texture{col_silver}
    }
 
    object
    {
      DSHELL(ps, vc)
      //DSHELLD(ps, vc)
      scale<1,1,1.1>
      texture{col_silver}
    }  
    
 
  } 
 
  #if (female)
    // the plastic piece inside the female dshell
    DSHELLD(ps, vc)
     DSHELL(ps, vc)
    // dshell sockets
    difference
    {
      box{<po-1,vc-4,-0.5><po+ps+1,vc+4,-5.8>}
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,-2><po+hs*i,vc+vs/2,-10> 0.5 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,-2><po+hs*(i+0.5),vc-vs/2,-10> 0.5 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,-2><po+hs*i,vc+vs/2,-10> 0.5 texture{col_gold} }
      
    } 
    difference
    {
      box{<po-1.0,vc-4,0.5><po+ps+1,vc+4,4.8>}
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,3.8> 0.8 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,0.5><po+hs*(i+0.5),vc-vs/2,3.8> 0.8 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,3.8> 0.8 texture{col_gold} }
        
    }
    
  #else
    DSHELLD(ps, vc)
    // dshell pins
   union
    {
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,-5.8> 0.5 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,0.5><po+hs*(i+0.5),vc-vs/2,-5.8> 0.5 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,-5.8> 0.5 texture{col_gold} }
    }
    difference
    {
      box{<po-1.0,vc-4,0.5><po+ps+1,vc+4,4.8>}
      #local i = 0;
      #while(i<j)
        cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,3.8> 0.8 texture{col_gold} }
        cylinder{<po+hs*(i+0.5),vc-vs/2,0.5><po+hs*(i+0.5),vc-vs/2,3.8> 0.8 texture{col_gold} }
        #local i = i+1;
      #end
      cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,3.8> 0.8 texture{col_gold} }        
    }
  
  #end 
  
 
  // board pins
  
  #if (!print) 
                        #local pin_l = 7.8;   // Pin length (from plate)
            #local pin_diao = 1.4;    //Pin outer diameter
            #local pin_diai = 1.2;     //Pin inner diameter
            
            union
            {
            #local i = 0;
            #while(i<j)
                        difference{
            cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,pin_l> pin_diao/2}
            cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,pin_l+1> pin_diai/2}
 
			cylinder{<po-hs,vc+vs/2+pin_diao/2,pin_l-1.5><po+ps+hs,vc+vs/2+pin_diao/2,pin_l-1.5> pin_diao/2}
            box{<po-hs,vc+vs/2, pin_l><po+ps+hs,vc+vs/2+pin_diao,pin_l+3> translate<0,0,-1.5>} 
            texture{pin_col} 
            }
      
                  difference{
 
				cylinder{<po+hs*(i+0.5),vc-vs/2,0.5><po+hs*(i+0.5),vc-vs/2,pin_l> pin_diao/2}
 
				cylinder{<po+hs*(i+0.5),vc-vs/2,0.5><po+hs*(i+0.5),vc-vs/2,pin_l+1> pin_diai/2}
 
				cylinder{<po-hs,vc-vs/2-pin_diao/2,pin_l-1.5><po+ps+hs,vc-vs/2-pin_diao/2,pin_l-1.5> pin_diao/2}
            
                        box{<po-hs,vc-vs/2,pin_l><po+ps+hs,vc-vs/2-pin_diao,pin_l+3> translate<0,0,-1.5>} 
            
                        texture{pin_col}
            }
      
                  #local i = i+1;
            #end
    
    
                                   difference{    
 
					cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,pin_l> pin_diao/2}
					 
					cylinder{<po+hs*i,vc+vs/2,0.5><po+hs*i,vc+vs/2,pin_l+1> pin_diai/2}
					 
					cylinder{<po-hs,vc+vs/2+pin_diao/2,pin_l-1.5><po+ps+hs,vc+vs/2+pin_diao/2,pin_l-1.5> pin_diao/2}
					            box{<po-hs,vc+vs/2, pin_l><po+ps+hs,vc+vs/2+pin_diao,pin_l+3>translate<0,0,-1.5>} 
					                        texture{pin_col}
                                   }
            } 
  #end
 
  
  // thin metal plate backing D shell
difference
{
 
 box{<0,1.5,0><bo+ps,11,-0.5>  texture{col_silver} }
 cylinder{<0,0,0><0,0,-0.5> 1.5 open texture{col_silver} translate<so,vc,0>
}
 cylinder{<0,0,0><0,0,-0.5> 1.5 open texture{col_silver}
translate<bo+ps-so,vc,0> }
 
 }
 box{<1.5,12.5,0><bo+ps-1.5,10.5,-0.5> texture{col_silver} }
 cylinder{<bo+ps-1.5,11,0><bo+ps-1.5,11,-0.5> 1.5 texture{col_silver} }
 cylinder{<1.5,11,0><1.5,11,-0.5> 1.5 texture{col_silver} }
 
 box{<1.5,0,0><bo+ps-1.5,1.5,-0.5> texture{col_silver} }
 cylinder{<bo+ps-1.5,1.5,0><bo+ps-1.5,1.5,-0.5> 1.5 texture{col_silver} }
 cylinder{<1.5,1.5,0><1.5,1.5,-0.5> 1.5 texture{col_silver} }
  
  translate<0-po-ps/2,-6.8,-1-hc>
  rotate<0,180,0>
  pigment{Gray30}
}
#end

#macro CON_DSUB_F9D()
object{CON_DSUBD(9, true, false)}
#end
#macro CON_DSUB_F15D()
object{CON_DSUBD(15, true, false)}
#end
#macro CON_DSUB_F25D()
object{CON_DSUBD(25, true, false)}
#end
#macro CON_DSUB_F37D()
object{CON_DSUBD(37, true, false)}
#end
#macro CON_DSUB_M9D()
object{CON_DSUBD(9, false, false)}
#end
#macro CON_DSUB_M15D()
object{CON_DSUBD(15, false, false)}
#end
#macro CON_DSUB_M25D()
object{CON_DSUBD(25, false, false)}
#end
#macro CON_DSUB_M37D()
object{CON_DSUBD(37, false, false)}
#end
#macro CON_DSUB_F9DV()
object{CON_DSUBD(9,true,true)}
#end
#macro CON_DSUB_F15DV()
object{CON_DSUBD(15,true,true)}
#end
#macro CON_DSUB_F25DV()
object{CON_DSUBD(25,true,true)}
#end
#macro CON_DSUB_F37DV()
object{CON_DSUBD(37,true,true)}
#end
#macro CON_DSUB_M9DV()
object{CON_DSUBD(9,false,true)}
#end
#macro CON_DSUB_M15DV()
object{CON_DSUBD(15,false,true)}
#end
#macro CON_DSUB_M25DV()
object{CON_DSUBD(25,false,true)}
#end
#macro CON_DSUB_M37DV()
object{CON_DSUBD(37,false,true)}
#end

/********************************************************************************************************************************************
//Eurocard Verbinder
//Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro CON_EUROCARD(pins, rows)
union
{
  #local j = pins/rows;   // number of pins in row
  #local hs = 2.54;       // horizontal pin spacing
  #local hc = 0.9;        // horizontal centerline
  #local vs = 2.54;       // vertical pin spacing
  #local vc = 5.475;      // vertical centerline
  #local po = 7.63;       // offset to first pin
  #local ps = (j-1)*hs;   // total pin spacing
  #local mo = 2.55;       // offset to first mounting hole
  #local d = hc+10.1;     // overall body depth
  #local id = 6.4;        // inside depth
  #local w = ps+po*2;     // overall body width
  #local h = 10.95;       // overall body height
  #local io = 4.4;        // inner housing offset
  #local r = 0.5;         // pin inner radius
  #local pw = 0.60;       // pin width
  #local ph = 0.60;       // pin height
  #local pl = 8.5+vs;     // length of lower pins
  #local pcb = 1.625;     // pc board cutout height
  #local kh = 0.4;        // key height
  
  difference
  {
    union {
      box{<0,0,0><d,h,w> }
      // mounting hole tabs
      box{<d-12.5,0,0><0,7.125,5.1> }
      box{<d-12.5,0,w><0,7.125,w-5.1> }
    }
    // mounting hole cutouts
    box{<d-12.6,7.126,-0.1><d-7,h+0.1,5.1> }
    box{<d-12.6,7.126,-0.1><d-7,h+0.1,5.1> translate<0,0,w-5> }
    // mounting holes
    cylinder{<hc,-0.1,mo><hc,h,mo>1.4 }
    cylinder{<hc,-0.1,w-mo><hc,h,w-mo>1.4 }
    // pc board cutout
    box{<d-12.6,-0.1,-0.1><d-id-0.7,pcb,w+0.1> }
    // pin area cutout
    box{<d-id-0.001,1.125,io><d+0.1,h-3.625,w-io> }
    box{<d-id,2,io+1><d+0.1,h-1.125,w-io-1> }
    // upper side key outer cutouts
    box{<d-5.601,8.45,-0.1><d+0.1,h+0.1,4.275> }
    box{<d-5.601,8.45,-0.1><d+0.1,h+0.1,4.275> translate<0,0,w-4.175> }
    // front side cutouts
    box{<d-5.6,-0.1,-0.1><d+0.1,h+0.1,3.275> }
    box{<d-5.6,-0.1,-0.1><d+0.1,h+0.1,3.275> translate<0,0,w-3.175> }
    // front notches
    box{<d-1,-0.1,po+hs*0.5><d+0.1,h+0.1,po+hs*2.5> }
    box{<d-1,-0.1,po+hs*6.5><d+0.1,h+0.1,po+hs*8.5> }
    box{<d-1,-0.1,po+hs*16.5><d+0.1,h+0.1,po+hs*18.5> }
    box{<d-1,-0.1,po+ps-hs*6.5><d+0.1,h+0.1,po+ps-hs*8.5> }
    box{<d-1,-0.1,po+ps-hs*0.5><d+0.1,h+0.1,po+ps-hs*2.5> }
    // lower keys
    box{<d-id,1.126,po+hs*1><d,1.125-kh,po+hs*2> }
    box{<d-id,1.126,po+hs*7><d,1.125-kh,po+hs*8> }
    box{<d-id,1.126,po+hs*17><d,1.125-kh,po+hs*18> }
    box{<d-id,1.126,po+ps-hs*7><d,1.125-kh,po+ps-hs*8> }
    box{<d-id,1.126,po+ps-hs*1><d,1.125-kh,po+ps-hs*2> }
    // upper keys
    box{<d-id,h-1.126,po+hs*1><d,h-1.125+kh,po+hs*2> }
    box{<d-id,h-1.126,po+hs*7><d,h-1.125+kh,po+hs*8> }
    box{<d-id,h-1.126,po+hs*17><d,h-1.125+kh,po+hs*18> }
    box{<d-id,h-1.126,po+ps-hs*7><d,h-1.125+kh,po+ps-hs*8> }
    box{<d-id,h-1.126,po+ps-hs*1><d,h-1.125+kh,po+ps-hs*2> }
    pigment{Gray85}
  }
  
  // pins
  union                               
  {
    #local k = 0;
    #while(k<rows)
      #if (rows<3)
        #if (k>0)
          // if only two rows, then the center row is the one that is missing
          #local k = k+1;
        #end
      #end
      #local i = 0;
      #while(i<j)
        // horizontal pin
        box{<r+ph/2-pl-k*vs,0-ph/2,0-pw/2><0,ph/2,pw/2> translate<hc+8.5,vc+(k-1)*vs,po+i*hs>}
        // pin radius
        difference {
          cylinder{<0,0,0><0,0,pw>r+ph}
          cylinder{<0,0,-0.1><0,0,pw+0.1>r}
          box{<0,-2,-0.1><2,2,pw+0.1>}
          box{<-2,-2,-0.1><2,0,pw+0.1>}
          translate<hc-(k+1)*vs+r+ph/2,vc+(k-1)*vs-r-ph/2,po+i*hs-pw/2>
        }
        // vertical pin
        box{<-ph/2,-2,-pw/2><ph/2,vc+(k-1)*vs-r-ph/2,pw/2> translate<hc-(k+1)*vs,0,po+i*hs>}
        #local i = i+1;
      #end 
      #local k = k+1;
    #end
    texture{col_gold}
  }
  
  translate<0-hc,0-pcb,0-w/2>
  translate<0,2,0>
}
#end

#macro CON_EUROCARD_96M_3_L()
object{CON_EUROCARD(96,3)}
#end
#macro CON_EUROCARD_64M_2_L()
object{CON_EUROCARD(64,2)}
#end

/********************************************************************************************************************************************
//Macros for 6.35 Faston terminal
//Designed by Philippe Boucheny <philippe.boucheny(replace with at)free.fr>
//Rev. 1.1 du 09/01/06
********************************************************************************************************************************************/
#macro CON_FASTON_GRND ()
union{
    difference{
        union{
            box{<-0.4,0,-3.175><+0.4,+15.8,+3.175>  rotate<0,0,0> translate<0,0,0> } 
            box{<-0.4,0,-3.75><+0.4,+6.8,+3.75>     rotate<0,0,0> translate<0,0,0> }
        }
        
        union{  
            box{<-1,-1,-3.2><+1,+1,+3.2>    rotate<0,0,45> translate<-1.5,16,0> }
            box{<-1,-1,-3.2><+1,+1,+3.2>    rotate<0,0,45> translate<+1.5,16,0> }
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,16,3.8> }
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,16,-3.8> }
            
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,6.9,4.6> }
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,6.9,-4.6> }
            box{<-0.8,-0.1,-2><+0.8,+3,+2>  rotate<0,0,0>  translate<0,0,0> } 
            box{<-0.8,-0.1,-4><+0.8,+3,-3>  rotate<0,0,0>  translate<0,0,0> } 
            box{<-0.8,-0.1,+4><+0.8,+3,+3>  rotate<0,0,0>  translate<0,0,0> } 
            cylinder { -2*x, +2*x, 1  translate <0, 12, 0> }
            text {ttf global_fontfile_arial_bold "AMP" 0.1, 0  scale 1.5 scale <1,0.6,1> rotate<180,+90,0> translate<0.45,4.8,1.55>}  // Marking
            text {ttf global_fontfile_arial_bold "AMP" 0.1, 0  pigment{Silver} scale 1.5 scale <1,0.6,1> rotate<180,-90,0> translate<-0.45,4.8,-1.55>}  // Marking
        }
    }
    texture{ col_silver }
    translate -3*y
    rotate 90*y
}
#end

#macro CON_FASTON_V()
object{CON_FASTON_GRND ()}
#end

/********************************************************************************************************************************************
//Macros for L115 100 junction bloc by LMI
//Designed by Philippe Boucheny <philippe.boucheny(replace with at)free.fr>
//Rev. 1.1 du 04/01/06
********************************************************************************************************************************************/
#macro CON_LMI_L115_GRND(n)
// Macro for pin
#local CosseL115 =
union{
    difference{
        union{
            box{<-0.25,-4.5,-1.4><+0.25,+15,+1.4>  } 
            box{<-0.25,-4.5,-1.8><+0.25,+6.8,+1.4> }
        }
        
        union{  
            //connexion side pin bisel
            //length bisel
            box{<-1,-1,-3><+1,+1,+3>        rotate<0,0,45> translate<-1.1,15.4,0> }
            box{<-1,-1,-3><+1,+1,+3>        rotate<0,0,45> translate<+1.1,15.4,0> }
            //width bisel
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,15,+2.5> }
            box{<-1,-1,-1><+1,+1,+1>        rotate<45,0,0> translate<0,15,-2.5> }
            //solder side pin bisel
            box{<-0.8,0,-0.65><+0.8,-5,-5>  rotate<0,0,0>  translate<0,0,0> } 
            box{<-0.8,0,+0.65><+0.8,-5,+5>  rotate<0,0,0>  translate<0,0,0> } 
            box{<-1,-1,-1><+1,+1,+1>        rotate<120,0,0> translate<0,-4.5,+1.3> }
            box{<-1,-1,-1><+1,+1,+1>        rotate<60,0,0> translate<0,-4.55,-1.3> }
            //holes
            cylinder { -2*x, +2*x, .4       translate <0, 12, 0> }
            cylinder { -2*x, +2*x, 1.1      translate <0, 3, 0> }
        }
    }
    texture{ pigment{P_Silver2} }
    rotate 90*y
}

#local PAS = 5.08;
union{
    //terminals
    #local i=0; 
    #while (i<n)
        //Pins
        object{CosseL115 translate<0,0,-(PAS/2*(n-1))+(i*PAS)>}
    #local i=i+1; #end
    //body
    difference{
        union{
            difference{
                box{<2.75,5,-PAS*n/2><-2.75,6,+PAS*n/2> }
                box{<1.6,5.6,-PAS*n/2-0.01><-2.0,6.01,+PAS*n/2+0.01> }
            }
            box{<-2.75,0,-PAS*n/2><-1.8,5,+PAS*n/2> }
        }  
        #local i=1; 
        #while (i<n)
            //rectangular holes
            box{<-1.2,4,-0.25><+0.8,7,+0.25> translate<0,0,-(PAS/2*(n-1))+(i*PAS)-PAS/2>}
        #local i=i+1; #end
    }
    pigment{Gray80}
    rotate 90*y

}
#end

#macro CON_LMI_L115_2()
object{CON_LMI_L115_GRND(2)}
#end
#macro CON_LMI_L115_3()
object{CON_LMI_L115_GRND(3)}
#end
#macro CON_LMI_L115_5()
object{CON_LMI_L115_GRND(5)}
#end
#macro CON_LMI_L115_10()
object{CON_LMI_L115_GRND(10)}
#end
#macro CON_LMI_L115_20()
object{CON_LMI_L115_GRND(20)}
#end

/********************************************************************************************************************************************
// Makro fuer AMP-tyco MicroMatch-Federleiste SMD-Ausfuehrung
// pin  - Anzahl Kontakte
********************************************************************************************************************************************/
#macro CON_MICROMATCH_SMD_GRND(pin)
#local CON_MMTCH_PLASTIC_TEXTURE = texture {pigment{Red*0.6}};
#local pitch=1.27;
#local plastic_z=5;
#local plastic_x=pitch*pin+2; // formula is a good match to the table in the datasheet

union   {
        difference{
                union   {
                        box{<-plastic_x/2+0.5,0,-plastic_z/2+0.5><plastic_x/2-0.5,5.3,plastic_z/2-0.5>}
                        difference {
                                box{<-plastic_x/2,1.9,-plastic_z/2>      <plastic_x/2    ,3.3,plastic_z/2>}
                                #local i=0;
                                #while(i<(pin/2))
                                        box{<-0.5,2.4,0><0.5,3.5,5> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                                        box{<-0.5,2.4,-5><0.5,3.5,0> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                                        #local i=i+1;
                                #end
                                box{<0,0,-plastic_z/4><plastic_x+1,5,plastic_z/4>}
                                }
                        }
                #local i=0;
                #while(i<(pin/2))
                        box{<-0.18,-1,-5><0.18,1.8,5> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.18,-1,-5><0.18,1.8,5> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                        #local i=i+1;
                #end
                #local i=0;
                #while(i<(pin/2))
                        box{<-0.2,-1,0><0.2,6,1.5> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.35,-1,0.5><0.35,6,1> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.4,-1,-0.4><0.4,6,-0.9> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                        cylinder{<0,-1,-1.4><0,6,-1.4> 0.2 translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.2,-1,0><0.2,6,-1.5> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.35,-1,-0.5><0.35,6,-1> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                        box{<-0.4,-1,0.4><0.4,6,0.9> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                        cylinder{<0,-1,1.4><0,6,1.4> 0.2 translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0>}
                        #local i=i+1;
                #end
                texture{CON_MMTCH_PLASTIC_TEXTURE}
                }
        #local i=0;
        #while(i<(pin/2))
                object{TOOLS_PCB_SMD(1,6,0.25,8) translate<0.5,-0.125,0.5> rotate<0,0,90> translate<-(pin/2-0.5)*pitch+pitch*i*2,0,0> texture{col_silver}}
                object{TOOLS_PCB_SMD(1,6,0.25,8) translate<-0.5,-0.125,-0.5> rotate<0,0,-90> translate<-(pin/2-1.5)*pitch+pitch*i*2,0,0> texture{col_silver}}        
                #local i=i+1;
        #end
        }
        
#end

#macro CON_MICROMATCH_SMD_4()
object{CON_MICROMATCH_SMD_GRND(4)}
#end
#macro CON_MICROMATCH_SMD_6()
object{CON_MICROMATCH_SMD_GRND(6)}
#end
#macro CON_MICROMATCH_SMD_8()
object{CON_MICROMATCH_SMD_GRND(8)}
#end
#macro CON_MICROMATCH_SMD_10()
object{CON_MICROMATCH_SMD_GRND(10)}
#end
#macro CON_MICROMATCH_SMD_12()
object{CON_MICROMATCH_SMD_GRND(12)}
#end
#macro CON_MICROMATCH_SMD_14()
object{CON_MICROMATCH_SMD_GRND(14)}
#end
#macro CON_MICROMATCH_SMD_16()
object{CON_MICROMATCH_SMD_GRND(16)}
#end
#macro CON_MICROMATCH_SMD_18()
object{CON_MICROMATCH_SMD_GRND(16)}
#end
#macro CON_MICROMATCH_SMD_20()
object{CON_MICROMATCH_SMD_GRND(20)}
#end

/********************************************************************************************************************************************
//Molex 53047 ( 1.25 pitch, vertical feeding, through holes )
//antoine.drouin(replace with at)free.fr
//n		Number of Pins
********************************************************************************************************************************************/
#macro CON_MOLEX_53047_GRND(n)
union{
  #local L = n * 1.25 + 1.75;
  #local l = 3.2;
  #local h = 4.2;
   difference {
     box {<-L/2, 0, -l/2><L/2, h, l/2> }
     box {<-L/2+0.6, 1.3, -l/2+0.45><L/2-0.6, h+0.1, l/2-0.45>}
     box {<-L/2+1, 2.7, 0><L/2-1, h+0.1, l/2+0.1>}
     box {<-L/2+0.35, 1.31, -0.35><L/2-0.35, h+0.1, 0.35>}
     box {<-L/2-0.1, 3.21, l/2-0.46><L/2+0.1, h+0.1, l/2+0.1>}
     #local j = 0;
     #while(j<n)
     box {<-0.35, -0.1, -l/2-0.1><0.35, 0.3, l/2+0.1>  translate< -(n-1)*1.25/2+j*1.25, 0, 0> }
     #local j = j + 1;
     #end
     box {<-L/2+1.6, 1.6, -l/2+0.46><-L/2+2.9, 2.9, -l/2-0.1>}
     box {<L/2-1.6, 1.6, -l/2+0.46><L/2-2.9, 2.9, -l/2-0.1>}
     pigment{White}
   }
  #local pin =
  union{
    cylinder {<0, 0, -0.5> <0, -2, -0.5> 0.18}
    box{<-0.2, 0 , -1 > <0.2, 3.1, 0 > }
    cylinder {<0, 1.555, -1.> <0, 1.555, 0.> 0.2 scale < 1, 2, 1>}
    texture{col_gold}
  }  
  #local i = 0;
  #while(i<n)
    object{pin translate< -(n-1)*1.25/2+i*1.25, 0, 0>}
  #local i = i + 1;
  #end

}
#end

#macro CON_MOLEX_53047_2()
object{CON_MOLEX_53047_GRND(2)}
#end
#macro CON_MOLEX_53047_3()
object{CON_MOLEX_53047_GRND(3)}
#end
#macro CON_MOLEX_53047_4()
object{CON_MOLEX_53047_GRND(4)}
#end
#macro CON_MOLEX_53047_5()
object{CON_MOLEX_53047_GRND(5)}
#end
#macro CON_MOLEX_53047_6()
object{CON_MOLEX_53047_GRND(6)}
#end
#macro CON_MOLEX_53047_7()
object{CON_MOLEX_53047_GRND(7)}
#end
#macro CON_MOLEX_53047_8()
object{CON_MOLEX_53047_GRND(8)}
#end
#macro CON_MOLEX_53047_9()
object{CON_MOLEX_53047_GRND(9)}
#end
#macro CON_MOLEX_53047_10()
object{CON_MOLEX_53047_GRND(10)}
#end
#macro CON_MOLEX_53047_11()
object{CON_MOLEX_53047_GRND(11)}
#end
#macro CON_MOLEX_53047_12()
object{CON_MOLEX_53047_GRND(12)}
#end
#macro CON_MOLEX_53047_13()
object{CON_MOLEX_53047_GRND(13)}
#end
#macro CON_MOLEX_53047_14()
object{CON_MOLEX_53047_GRND(14)}
#end
#macro CON_MOLEX_53047_15()
object{CON_MOLEX_53047_GRND(15)}
#end

/********************************************************************************************************************************************
// Molex 53048 ( 1.25 pitch, horizontal feeding, through holes )
//antoine.drouin(replace with at)free.fr
//n		Number of Pins
********************************************************************************************************************************************/
#macro CON_MOLEX_53048_GRND(n)
union{
  #local L = n * 1.25 + 1.75;
  #local l = 5.5;
  #local h = 3.5;
  difference {
    box {<-L/2, 0, -2.3><L/2, h, 3.2> }
    box {<-L/2+0.6, 0.8, 0.3><L/2-0.6, h-0.4, 3.3>}
    box {<-L/2+1, h-0.5, 1.6><L/2-1, h+0.1, 3.3>}
    box {<-L/2-0.1, h-0.41, 2.3><L/2+0.1, h+0.1, 3.3>}
    box {<-L/2+0.6, -0.1, -2.4><L/2-0.6, 0.3, 3.3>}
    box {<-L/2+0.8, -0.1, -2.4><L/2-0.8, h+0.1, -1.58>}
    box {<-L/2+0.81, 1.3, -2.4><L/2-0.81, h+0.1, -1.>}
    box {<-L/2-0.1, h-1, -2.4><L/2+0.1, h+0.1, -1.01>}
    #local j = 0;
    #while(j<n)
        box {<-0.3, h-0.6, -1.1><0.3, h+0.1, -0.7>  translate< -(n-1)*1.25/2+j*1.25, 0, 0> }
	cylinder {<0, -0.1, -1.3> <0, h+0.1, -1.3> 0.3  translate< -(n-1)*1.25/2+j*1.25, 0, 0> }
    #local j = j + 1;
    #end
        box {<-L/2+1.6, 0, 2.7><-L/2+2.9, 0.9, 1.1>}
        box {<L/2-1.6, 0, 2.7><L/2-2.9, 2.9, 1.1>}
    pigment{White}
  }
  #local pin =
  union{
    cylinder {<0, -2.3, -1.25> <0, 1.27, -1.25> 0.18}
    cylinder {<0, 1.52, -1> <0, 1.52, -0.75> 0.18}
    intersection {
      torus { 0.25 0.18 rotate < 0, 0, 90> }
      box { < 1, 0, 0> <-1, 1, -11> }
      translate < 0, 1.27, -1>
    }
    union {
      box{<-0.2, 1.2 , -0.75 > <0.2, 2, 1.95 > }
      cylinder {<0, 1.2, 1.02> <0, 2., 1.02> 0.2 scale < 1, 1, 2>}
    }
    texture{col_gold}
  }  
  #local i = 0;
  #while(i<n)
    object{pin translate< -(n-1)*1.25/2+i*1.25, 0, 0>}
  #local i = i + 1;
  #end

}
#end

#macro CON_MOLEX_53048_2()
object{CON_MOLEX_53048_GRND(2)}
#end
#macro CON_MOLEX_53048_3()
object{CON_MOLEX_53048_GRND(3)}
#end
#macro CON_MOLEX_53048_4()
object{CON_MOLEX_53048_GRND(4)}
#end
#macro CON_MOLEX_53048_5()
object{CON_MOLEX_53048_GRND(5)}
#end
#macro CON_MOLEX_53048_6()
object{CON_MOLEX_53048_GRND(6)}
#end
#macro CON_MOLEX_53048_7()
object{CON_MOLEX_53048_GRND(7)}
#end
#macro CON_MOLEX_53048_8()
object{CON_MOLEX_53048_GRND(8)}
#end
#macro CON_MOLEX_53048_9()
object{CON_MOLEX_53048_GRND(9)}
#end
#macro CON_MOLEX_53048_10()
object{CON_MOLEX_53048_GRND(10)}
#end
#macro CON_MOLEX_53048_11()
object{CON_MOLEX_53048_GRND(11)}
#end
#macro CON_MOLEX_53048_12()
object{CON_MOLEX_53048_GRND(12)}
#end
#macro CON_MOLEX_53048_13()
object{CON_MOLEX_53048_GRND(13)}
#end
#macro CON_MOLEX_53048_14()
object{CON_MOLEX_53048_GRND(14)}
#end
#macro CON_MOLEX_53048_15()
object{CON_MOLEX_53048_GRND(15)}
#end

/********************************************************************************************************************************************
// PC power connector male
********************************************************************************************************************************************/
#macro CON_PCPWR514M_GRND()
union{
        difference {
        box{<0,0,0><23.2,10,8.4> translate <-11.6,0.5,-4.20> }
        box{<0,0,0><21,8,6.4> translate <-10.5,2.6,-3.20> }
        }
     box{<0,0,0><1,3,3> translate <-12.6,0.5,-1.5> }
     box{<0,0,0><1,3,3> translate <11.6,0.5,-1.5> }

     box{<0,0,0><3,10,1.5> rotate <0,-45,0> translate <-10.5,0.5,1> }
     box{<0,0,0><3,10,1.5> rotate <0,45,0> translate <8.5,0.5,3.1> }


     #local p = 0;
     #while(p<5)    
        box{<0,0,0><1.5,3,1> translate <-11.6+p*5,0.5,-5.2> }
     #local p = p+1;
     #end


     #local p = 0;
     #while(p<4)    
             cylinder {<0,0,0><0,12.5,0> 0.8 translate <-7.5+p*5.08,-3.5,0> texture{col_gold}}
             sphere {<-7.5+p*5.08,9,0> 0.8 texture{col_gold}}   
     #local p = p+1;
     #end
 }        

 pigment{VLightGray}
 rotate <0,-90,0>
 
#end

#macro CON_PCPWR514M()
object{CON_PCPWR514M_GRND()}
#end

/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmacro fuer Phoenix Mini-Combicon 3.81mm Klemmen MCV 1,5/xx-G-381 (vertical)
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGGH(j)
union{
	#local i = 0;
	#while(i<j)   
		object {CON_PHOENIX_381_PHPIN() translate<0,0,i*3.81>}
		object {CON_PHOENIX_381_PHGH()rotate<0,0,90> translate<3,0,i*3.81>}
		#local i=i+1;
	#end    
	translate<0,1,-j*1.905+1.905> 
	rotate<0,90,0>
}
#end

#macro CON_PHOENIX_381_MCV_2()
object{CON_PHOENIX_381_PHGGH(2)}
#end
#macro CON_PHOENIX_381_MCV_3()
object{CON_PHOENIX_381_PHGGH(3)}
#end
#macro CON_PHOENIX_381_MCV_4()
object{CON_PHOENIX_381_PHGGH(4)}
#end
#macro CON_PHOENIX_381_MCV_5()
object{CON_PHOENIX_381_PHGGH(5)}
#end
#macro CON_PHOENIX_381_MCV_6()
object{CON_PHOENIX_381_PHGGH(6)}
#end
#macro CON_PHOENIX_381_MCV_7()
object{CON_PHOENIX_381_PHGGH(7)}
#end
#macro CON_PHOENIX_381_MCV_8()
object{CON_PHOENIX_381_PHGGH(8)}
#end
#macro CON_PHOENIX_381_MCV_9()
object{CON_PHOENIX_381_PHGGH(9)}
#end
#macro CON_PHOENIX_381_MCV_10()
object{CON_PHOENIX_381_PHGGH(10)}
#end
#macro CON_PHOENIX_381_MCV_11()
object{CON_PHOENIX_381_PHGGH(11)}
#end
#macro CON_PHOENIX_381_MCV_12()
object{CON_PHOENIX_381_PHGGH(12)}
#end
#macro CON_PHOENIX_381_MCV_13()
object{CON_PHOENIX_381_PHGGH(13)}
#end

/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmacro fuer Phoenix Mini-Combicon 3.81mm Klemmen Winkel MC 1,5/xx-G-381 (horizontal)
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGGHW(j)
union{
	#local i = 0;
	#while(i<j)
		object {CON_PHOENIX_381_PHPINW() translate<0,0,i*3.81>}
		object {CON_PHOENIX_381_PHGH() translate<0,0,i*3.81>} 
		#local i=i+1;
	#end    
	translate<0,0,-j*1.905+1.905> rotate<0,90,0>
}
#end

#macro CON_PHOENIX_381_MC_2()
object{CON_PHOENIX_381_PHGGHW(2)}
#end
#macro CON_PHOENIX_381_MC_3()
object{CON_PHOENIX_381_PHGGHW(3)}
#end
#macro CON_PHOENIX_381_MC_4()
object{CON_PHOENIX_381_PHGGHW(4)}
#end
#macro CON_PHOENIX_381_MC_5()
object{CON_PHOENIX_381_PHGGHW(5)}
#end
#macro CON_PHOENIX_381_MC_6()
object{CON_PHOENIX_381_PHGGHW(6)}
#end
#macro CON_PHOENIX_381_MC_7()
object{CON_PHOENIX_381_PHGGHW(7)}
#end
#macro CON_PHOENIX_381_MC_8()
object{CON_PHOENIX_381_PHGGHW(8)}
#end
#macro CON_PHOENIX_381_MC_9()
object{CON_PHOENIX_381_PHGGHW(9)}
#end
#macro CON_PHOENIX_381_MC_10()
object{CON_PHOENIX_381_PHGGHW(10)}
#end
#macro CON_PHOENIX_381_MC_11()
object{CON_PHOENIX_381_PHGGHW(11)}
#end
#macro CON_PHOENIX_381_MC_12()
object{CON_PHOENIX_381_PHGGHW(12)}
#end
#macro CON_PHOENIX_381_MC_13()
object{CON_PHOENIX_381_PHGGHW(13)}
#end

/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmacro fuer Phoenix Mini-Combicon 3.81mm Klemmen Winkel (horizontal) mit Gegenstecker
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHGGHWS(j)
union{
	#local i = 0;
	#while(i<j)
		object {CON_PHOENIX_381_PHPINW() translate<0,0,i*3.81>}
		object {CON_PHOENIX_381_PHGH() translate<0,0,i*3.81>}
		object {CON_PHOENIX_381_PHGSG() translate<8,-2.9,i*3.81>}
		object {CON_PHOENIX_381_SCREWHEAD()rotate<0,i*75,0> translate<12,7.2,i*3.81> texture{col_silver}}
		object {CON_PHOENIX_381_PHNR(i+1) rotate <78,0,0> translate <0,5.9,16.0> translate<-i*3.81,0,0> rotate<0,90,0> }
	#local i=i+1;
	#end    
	translate<0,0,-j*1.905+1.905> rotate<0,90,0>
}
#end

#macro CON_PHOENIX_381_MC_2G()
object{CON_PHOENIX_381_PHGGHWS(2)}
#end
#macro CON_PHOENIX_381_MC_3G()
object{CON_PHOENIX_381_PHGGHWS(3)}
#end
#macro CON_PHOENIX_381_MC_4G()
object{CON_PHOENIX_381_PHGGHWS(4)}
#end
#macro CON_PHOENIX_381_MC_5G()
object{CON_PHOENIX_381_PHGGHWS(5)}
#end
#macro CON_PHOENIX_381_MC_6G()
object{CON_PHOENIX_381_PHGGHWS(6)}
#end
#macro CON_PHOENIX_381_MC_7G()
object{CON_PHOENIX_381_PHGGHWS(7)}
#end
#macro CON_PHOENIX_381_MC_8G()
object{CON_PHOENIX_381_PHGGHWS(8)}
#end
#macro CON_PHOENIX_381_MC_9G()
object{CON_PHOENIX_381_PHGGHWS(9)}
#end
#macro CON_PHOENIX_381_MC_10G()
object{CON_PHOENIX_381_PHGGHWS(10)}
#end
#macro CON_PHOENIX_381_MC_11G()
object{CON_PHOENIX_381_PHGGHWS(11)}
#end
#macro CON_PHOENIX_381_MC_12G()
object{CON_PHOENIX_381_PHGGHWS(12)}
#end
#macro CON_PHOENIX_381_MC_13G()
object{CON_PHOENIX_381_PHGGHWS(13)}
#end

/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmacro fuer Phoenix Mini-Combicon 3.81mm Gegenstecker (vertikal)
// MCVW 1,5/xx-ST-381 (k=0) und MCVR 1,5/xx-ST-381 (k=1)
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHMCVRW(j,k)
union{
	#local i = 0;
	#while(i<j)
		object {CON_PHOENIX_381_PHGSRW(k) translate<-i*3.81,0,0>}
		object {CON_PHOENIX_381_SCREWHEAD()rotate<0,i*75,0> translate<-i*3.81,11.7,0> texture{col_silver}}
		object {CON_PHOENIX_381_PHNR(i+1) rotate <70,0,0> translate <0,9.5,3.0> translate<-i*3.81,0,0> }
		#local i=i+1;
	#end
	
	#if (k = 1) //MVCR
		translate<j*1.905-1.905,9.0,0> rotate<0,0,0>}
	#else
		translate<j*1.905-1.905,9.0,0> rotate<0,180,0>}
	#end 
#end

//Phoenix Mini-Combicon 3.81mm Gegenstecker MCVW 1,5/xx-ST-381
#macro CON_PHOENIX_381_MCVW_2()
object{CON_PHOENIX_381_PHMCVRW(2,0)}
#end
#macro CON_PHOENIX_381_MCVW_3()
object{CON_PHOENIX_381_PHMCVRW(3,0)}
#end
#macro CON_PHOENIX_381_MCVW_4()
object{CON_PHOENIX_381_PHMCVRW(4,0)}
#end
#macro CON_PHOENIX_381_MCVW_5()
object{CON_PHOENIX_381_PHMCVRW(5,0)}
#end
#macro CON_PHOENIX_381_MCVW_6()
object{CON_PHOENIX_381_PHMCVRW(6,0)}
#end
#macro CON_PHOENIX_381_MCVW_7()
object{CON_PHOENIX_381_PHMCVRW(7,0)}
#end
#macro CON_PHOENIX_381_MCVW_8()
object{CON_PHOENIX_381_PHMCVRW(8,0)}
#end
#macro CON_PHOENIX_381_MCVW_9()
object{CON_PHOENIX_381_PHMCVRW(9,0)}
#end
#macro CON_PHOENIX_381_MCVW_10()
object{CON_PHOENIX_381_PHMCVRW(10,0)}
#end
#macro CON_PHOENIX_381_MCVW_11()
object{CON_PHOENIX_381_PHMCVRW(11,0)}
#end
#macro CON_PHOENIX_381_MCVW_12()
object{CON_PHOENIX_381_PHMCVRW(12,0)}
#end
#macro CON_PHOENIX_381_MCVW_13()
object{CON_PHOENIX_381_PHMCVRW(13,0)}
#end
//Phoenix Mini-Combicon 3.81mm Gegenstecker MCVR 1,5/xx-ST-381
#macro CON_PHOENIX_381_MCVR_2()
object{CON_PHOENIX_381_PHMCVRW(2,1)}
#end
#macro CON_PHOENIX_381_MCVR_3()
object{CON_PHOENIX_381_PHMCVRW(3,1)}
#end
#macro CON_PHOENIX_381_MCVR_4()
object{CON_PHOENIX_381_PHMCVRW(4,1)}
#end
#macro CON_PHOENIX_381_MCVR_5()
object{CON_PHOENIX_381_PHMCVRW(5,1)}
#end
#macro CON_PHOENIX_381_MCVR_6()
object{CON_PHOENIX_381_PHMCVRW(6,1)}
#end
#macro CON_PHOENIX_381_MCVR_7()
object{CON_PHOENIX_381_PHMCVRW(7,1)}
#end
#macro CON_PHOENIX_381_MCVR_8()
object{CON_PHOENIX_381_PHMCVRW(8,1)}
#end
#macro CON_PHOENIX_381_MCVR_9()
object{CON_PHOENIX_381_PHMCVRW(9,1)}
#end
#macro CON_PHOENIX_381_MCVR_10()
object{CON_PHOENIX_381_PHMCVRW(10,1)}
#end
#macro CON_PHOENIX_381_MCVR_11()
object{CON_PHOENIX_381_PHMCVRW(11,1)}
#end
#macro CON_PHOENIX_381_MCVR_12()
object{CON_PHOENIX_381_PHMCVRW(12,1)}
#end
#macro CON_PHOENIX_381_MCVR_13()
object{CON_PHOENIX_381_PHMCVRW(13,1)}
#end

/********************************************************************************************************************************************
//Macros fuer Phoenix Mini-Combicon 3.81mm Klemmen und Gegenstecker
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmacro fuer Phoenix Mini-Combicon 3.81mm Gegenstecker MC 1,5/xx-ST-381 (horizontal)
********************************************************************************************************************************************/
#macro CON_PHOENIX_381_PHWS(j)
union{
	#local i = 0;
	#while(i<j)
		object {CON_PHOENIX_381_PHGSG() translate<8,-2.9,i*3.81>}
		object {CON_PHOENIX_381_SCREWHEAD()rotate<0,i*75,0> translate<12,7.2,i*3.81> texture{col_silver}}
		object {CON_PHOENIX_381_PHNR(i+1) rotate <78,0,0> translate <0,5.9,16.0> translate<-i*3.81,0,0> rotate<0,90,0> }   
		#local i=i+1;
	#end    
	translate<0,0,-j*1.905+1.905> rotate<0,90,0>
}
#end

#macro CON_PHOENIX_381_MC_2ST()
object{CON_PHOENIX_381_PHWS(2)}
#end
#macro CON_PHOENIX_381_MC_3ST()
object{CON_PHOENIX_381_PHWS(3)}
#end
#macro CON_PHOENIX_381_MC_4ST()
object{CON_PHOENIX_381_PHWS(4)}
#end
#macro CON_PHOENIX_381_MC_5ST()
object{CON_PHOENIX_381_PHWS(5)}
#end
#macro CON_PHOENIX_381_MC_6ST()
object{CON_PHOENIX_381_PHWS(6)}
#end
#macro CON_PHOENIX_381_MC_7ST()
object{CON_PHOENIX_381_PHWS(7)}
#end
#macro CON_PHOENIX_381_MC_8ST()
object{CON_PHOENIX_381_PHWS(8)}
#end
#macro CON_PHOENIX_381_MC_9ST()
object{CON_PHOENIX_381_PHWS(9)}
#end
#macro CON_PHOENIX_381_MC_10ST()
object{CON_PHOENIX_381_PHWS(10)}
#end
#macro CON_PHOENIX_381_MC_11ST()
object{CON_PHOENIX_381_PHWS(11)}
#end
#macro CON_PHOENIX_381_MC_12ST()
object{CON_PHOENIX_381_PHWS(12)}
#end
#macro CON_PHOENIX_381_MC_13ST()
object{CON_PHOENIX_381_PHWS(13)}
#end

/********************************************************************************************************************************************
//Macros for connector PHOENIX type MINICONNEC 5.08
//Designed by Philippe Boucheny <philippe.boucheny(replace with at)free.fr>
//Rev. 1.1  06/01/06
********************************************************************************************************************************************/
#macro CON_PHOENIX_508_GRND(n,vertical,a)
// n = pins ; Vertical = 1 if yes ; With border a = 1 / Whithout border a = 0
union{
    difference{
        union{
            #local PAS = 5.08;
            //body
        	box{<-PAS*n/2-a,-4.15,0><+PAS*n/2+a,4.15,12> }
        	//up additional thickness
        	box{<-PAS*n/2-a,+4.15,9><+PAS*n/2+a,4.15+0.5,12> }
         }
         
         union{
            
            #local i=0; 
            #while (i<n)
                //Half Cylindrical holes
                intersection{
                    cylinder{<-(PAS/2*(n-1))+(i*PAS),0.35,2.5><-(PAS/2*(n-1))+(i*PAS),0.35,12.1> 4 }
                    box{<-(PAS/2*(n-1))+(i*PAS)+2.541,+0.1,2.51><-(PAS/2*(n-1))+(i*PAS)-2.541,-5.1,12.1> }
                }
                //Crenels at the top
                box{<-(PAS/2*(n-1))+(i*PAS)+1,3,11><-(PAS/2*(n-1))+(i*PAS)-1,6,12.5> }
                //Crenels for pins
                box{<-(PAS/2*(n-1))+(i*PAS)+0.5,0,-0.1><-(PAS/2*(n-1))+(i*PAS)-0.5,-6,2> }
                box{<-(PAS/2*(n-1))+(i*PAS)+1.5,-4,-0.1><-(PAS/2*(n-1))+(i*PAS)-1.5,-6,3> }
             #local i=i+1; #end
          
             //Half squared hole               
             box{<-PAS*n/2-0.01,0,2.5><+PAS*n/2+0.01,3.25,12.1> }
                                     
            //bisel   
        	box{<-PAS*n/2-a-0.1,+4.15,9><+PAS*n/2+a+0.1,4.15+0.7,12> rotate 20*x translate 4*y}
        	
         }
         pigment{ForestGreen}
    }
    #if(vertical)
        #local i=0; #while (i<n)
            union{
                //pin body
                box{<-(PAS/2*(n-1))+(i*PAS)-0.4,-0.4,-4><-(PAS/2*(n-1))+(i*PAS)+0.4,+0.4,9> }
                //pin top
                intersection{
                    box{<-(PAS/2*(n-1))+(i*PAS)-0.4,-0.4,9><-(PAS/2*(n-1))+(i*PAS)+0.4,+0.4,10> }
                    cone{<-(PAS/2*(n-1))+(i*PAS),0,9>, 0.565, <-(PAS/2*(n-1))+(i*PAS),0,10.01>, 0.25}
                }
                texture { pigment{P_Silver2} }
            }
        #local i=i+1; #end
        rotate <-90,180,0>
    #else
        #local i=0; #while (i<n)
            //inside part pin
            union{
                //pin body
                box{<-(PAS/2*(n-1))+(i*PAS)-0.4,-0.4,2><-(PAS/2*(n-1))+(i*PAS)+0.4,+0.4,9> texture { pigment{P_Silver2} }}
                //pin top
                intersection{
                    box{<-(PAS/2*(n-1))+(i*PAS)-0.4,-0.4,9><-(PAS/2*(n-1))+(i*PAS)+0.4,+0.4,10> }
                    cone{<-(PAS/2*(n-1))+(i*PAS),0,9>, 0.565, <-(PAS/2*(n-1))+(i*PAS),0,10.01>, 0.25}
                }
                texture { pigment{P_Silver2} }
            }


            //outside part pin
            box{<-(PAS/2*(n-1))+(i*PAS)-0.4,0,1.1><-(PAS/2*(n-1))+(i*PAS)+0.4,-7.5,1.9> texture { pigment{P_Silver2} }}
        #local i=i+1; #end
        translate <0,4.1,-5.08-1.5> //-1.5>
        rotate 180*y
    #end
}
#end

// Vertical whithout border
#macro CON_PHOENIX_508_MSTBV_2()
object{CON_PHOENIX_508_GRND(2,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_3()
object{CON_PHOENIX_508_GRND(3,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_4()
object{CON_PHOENIX_508_GRND(4,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_5()
object{CON_PHOENIX_508_GRND(5,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_6()
object{CON_PHOENIX_508_GRND(6,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_7()
object{CON_PHOENIX_508_GRND(7,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_8()
object{CON_PHOENIX_508_GRND(8,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_9()
object{CON_PHOENIX_508_GRND(9,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_10()
object{CON_PHOENIX_508_GRND(10,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_11()
object{CON_PHOENIX_508_GRND(11,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_12()
object{CON_PHOENIX_508_GRND(12,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_13()
object{CON_PHOENIX_508_GRND(13,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_14()
object{CON_PHOENIX_508_GRND(14,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_15()
object{CON_PHOENIX_508_GRND(15,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_16()
object{CON_PHOENIX_508_GRND(16,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_17()
object{CON_PHOENIX_508_GRND(17,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_18()
object{CON_PHOENIX_508_GRND(18,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_19()
object{CON_PHOENIX_508_GRND(19,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_20()
object{CON_PHOENIX_508_GRND(20,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_21()
object{CON_PHOENIX_508_GRND(21,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_22()
object{CON_PHOENIX_508_GRND(22,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_23()
object{CON_PHOENIX_508_GRND(23,1,0)}
#end
#macro CON_PHOENIX_508_MSTBV_24()
object{CON_PHOENIX_508_GRND(24,1,0)}
#end
// Horizontal whithout border
#macro CON_PHOENIX_508_MSTB_2()
object{CON_PHOENIX_508_GRND(2,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_3()
object{CON_PHOENIX_508_GRND(3,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_4()
object{CON_PHOENIX_508_GRND(4,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_5()
object{CON_PHOENIX_508_GRND(5,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_6()
object{CON_PHOENIX_508_GRND(6,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_7()
object{CON_PHOENIX_508_GRND(7,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_8()
object{CON_PHOENIX_508_GRND(8,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_9()
object{CON_PHOENIX_508_GRND(9,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_10()
object{CON_PHOENIX_508_GRND(10,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_11()
object{CON_PHOENIX_508_GRND(11,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_12()
object{CON_PHOENIX_508_GRND(12,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_13()
object{CON_PHOENIX_508_GRND(13,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_14()
object{CON_PHOENIX_508_GRND(14,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_15()
object{CON_PHOENIX_508_GRND(15,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_16()
object{CON_PHOENIX_508_GRND(16,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_17()
object{CON_PHOENIX_508_GRND(17,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_18()
object{CON_PHOENIX_508_GRND(18,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_19()
object{CON_PHOENIX_508_GRND(19,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_20()
object{CON_PHOENIX_508_GRND(20,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_21()
object{CON_PHOENIX_508_GRND(21,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_22()
object{CON_PHOENIX_508_GRND(22,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_23()
object{CON_PHOENIX_508_GRND(23,0,0)}
#end
#macro CON_PHOENIX_508_MSTB_24()
object{CON_PHOENIX_508_GRND(24,0,0)}
#end
// Vertical whith border
#macro CON_PHOENIX_508_MSTBVA_2()
object{CON_PHOENIX_508_GRND(2,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_3()
object{CON_PHOENIX_508_GRND(3,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_4()
object{CON_PHOENIX_508_GRND(4,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_5()
object{CON_PHOENIX_508_GRND(5,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_6()
object{CON_PHOENIX_508_GRND(6,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_7()
object{CON_PHOENIX_508_GRND(7,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_8()
object{CON_PHOENIX_508_GRND(8,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_9()
object{CON_PHOENIX_508_GRND(9,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_10()
object{CON_PHOENIX_508_GRND(10,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_11()
object{CON_PHOENIX_508_GRND(11,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_12()
object{CON_PHOENIX_508_GRND(12,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_13()
object{CON_PHOENIX_508_GRND(13,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_14()
object{CON_PHOENIX_508_GRND(14,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_15()
object{CON_PHOENIX_508_GRND(15,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_16()
object{CON_PHOENIX_508_GRND(16,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_17()
object{CON_PHOENIX_508_GRND(17,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_18()
object{CON_PHOENIX_508_GRND(18,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_19()
object{CON_PHOENIX_508_GRND(19,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_20()
object{CON_PHOENIX_508_GRND(20,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_21()
object{CON_PHOENIX_508_GRND(21,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_22()
object{CON_PHOENIX_508_GRND(22,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_23()
object{CON_PHOENIX_508_GRND(23,1,1)}
#end
#macro CON_PHOENIX_508_MSTBVA_24()
object{CON_PHOENIX_508_GRND(24,1,1)}
#end
// Horizontal whith border
#macro CON_PHOENIX_508_MSTBA_2()
object{CON_PHOENIX_508_GRND(2,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_3()
object{CON_PHOENIX_508_GRND(3,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_4()
object{CON_PHOENIX_508_GRND(4,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_5()
object{CON_PHOENIX_508_GRND(5,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_6()
object{CON_PHOENIX_508_GRND(6,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_7()
object{CON_PHOENIX_508_GRND(7,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_8()
object{CON_PHOENIX_508_GRND(8,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_9()
object{CON_PHOENIX_508_GRND(9,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_10()
object{CON_PHOENIX_508_GRND(10,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_11()
object{CON_PHOENIX_508_GRND(11,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_12()
object{CON_PHOENIX_508_GRND(12,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_13()
object{CON_PHOENIX_508_GRND(13,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_14()
object{CON_PHOENIX_508_GRND(14,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_15()
object{CON_PHOENIX_508_GRND(15,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_16()
object{CON_PHOENIX_508_GRND(16,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_17()
object{CON_PHOENIX_508_GRND(17,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_18()
object{CON_PHOENIX_508_GRND(18,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_19()
object{CON_PHOENIX_508_GRND(19,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_20()
object{CON_PHOENIX_508_GRND(20,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_21()
object{CON_PHOENIX_508_GRND(21,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_22()
object{CON_PHOENIX_508_GRND(22,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_23()
object{CON_PHOENIX_508_GRND(23,0,1)}
#end
#macro CON_PHOENIX_508_MSTBA_24()
object{CON_PHOENIX_508_GRND(24,0,1)}
#end

/********************************************************************************************************************************************
//ChristophGraf(replace with at)web.de
********************************************************************************************************************************************/
#macro CON_PHONE_JACK_GRND(value)

union{
        #if(pin_short=off)
                #local pp=7.0;
        #else
                #local pp=pcb_height+pin_length;
        #end
        
        difference{
                box{<-7.1882,-0.1,5.9182><7.1882,5,-5.9182> pigment{Black}}
                box{<-6.4882,-0.2,5.2182><6.4882,6,-5.2182> pigment{Black}}}

               box{<-7.1882,5,5.9182><7.1882,6,-5.9182> pigment{White filter 0.91}}
               box{<-7.1882,0,5.9182><7.1882,1,-5.9182> pigment{Black}}
           

        
        difference{
        cylinder { < -7.1882 , 3 , 0 >,< -10.7442, 3 , 0 >,2.6  pigment{White}}
        cylinder { < -7.1882 , 3 , 0 >,< -11.7442, 3 , 0 >,1.75  pigment{White}}
          }
        union{
                lathe { linear_spline 13,<2.6, -10.7442>,<2.9, -10.4442>, <2.6, -10.1442>,<2.9, -9.8442>,<2.6, -9.5442>,
                <2.9, -9.2442>,<2.6, -8.9442>,<2.9, -8.6442>,<2.6, -8.3442>,<2.9, -8.0442>,
                <2.6, -7.7442>,<2.9, -7.4442>,<2.6, -7.1442>pigment {Silver} } 
                rotate<0,0,-90>
                translate<0,3,0> 
             }

        
        union{
                cylinder{<2.8494,2,4.8996>,<2.8494,-pp,4.8996>,0.25 }
                cylinder{<-4.9979,2,-0.2035>,<-4.9979,-pp,-0.2035>,0.25 }
                cylinder{<1.4575,2,2.3985>,<1.4575,-pp,2.3985>,0.25 }  
                cylinder{<-1.75,2,-4.9032>,<-1.75,-pp,-4.9032>,0.25 }
                cylinder{<5.7543,2,-4.3787>,<5.7543,-pp,-4.3787>,0.25 }
                pigment{Silver}
        }
        union{
               box{<3.5543,1,-1.3><5.85,5,-1.6> pigment{Silver}}
               box{<5.5543,1,-4.3787><5.85,5,-0.4787> pigment{Silver}} 
               prism{linear_sweep 0,5,11,            // segment "A"
                <-1.45,-4.6032>,<-5.55,-4.6032>,<-1.25,-0.5332>,<-0.55,-2.1332>,<4.75,-2.1332>,
                <4.75,-1.8332>,<-0.35,-1.8332>,<-1.1436,-0.0194>,<-5.9492,-4.568>,<-5.8324,-4.9032>,<-1.45,-4.9032>
                pigment{Silver}}
               prism{linear_sweep 0,5,13,            // segment "A"
                <2.8494,5.1996>,<6.6829,5.1996>,<6.6829,2.8981>,<-2.2639,2.812>,<-3.2967,0.7465>,
                <-4.5539,3.0096>,<-4.2139,3.0152>,<-3.3106,1.3894>,<-2.4502,3.1104>,<6.2829,3.1954>,<6.2829,4.8996>,<2.8494,4.8996>,<2.8494,5.1996>
                pigment{Silver}} 
                 prism{linear_sweep 0,5,5,            // segment "A"
                <-2.2125,2.3985>,<2.5575,2.3985>,<2.5575,2.6985>,<-2.2125,2.6985>,<-2.2125,2.3985>
                pigment{Silver}}
        }

}
#end

#macro CON_PHONE_JACK(value)
object{CON_PHONE_JACK_GRND(value)}
#end

/********************************************************************************************************************************************
// Makro fuer geschirmte Ethernet-Buchse RJ-45 8-polig
// Designed by Carsten Koegler, FTZ-Leipzig <koegler(replace with at)ftz-leipzig.de>
// Vorlage: MEBP 8-8PG Reichelt Elektronik
********************************************************************************************************************************************/
#macro CON_RJ45_GRND()
//#local tex_rj45_metal = texture { T_Chrome_3D } ;
#local tex_rj45_metal = texture { T_Chrome_5B } ;
#local tex_rj45_pastic = texture { pigment{White*0.3} finish {specular 1 roughness 0.001 reflection 0.07} } ;

#macro body(B,H,T,R)
union {

    // Grundkoerper
    box{<-B/2+R,0  , T/2  > <B/2-R,H-R,-T/2  >}
    box{<-B/2  ,0  ,-T/2+R> <B/2  ,H-R, T/2-R>}
    box{<-B/2+R,0  ,-T/2+R> <B/2-R,H    , T/2-R>}


    // senkrechte Seiten als Zylinder
    // linke hintere Ecke
    cylinder{<-B/2+R, 0, 0> <-B/2+R, H-R> R
             translate <0, 0, T/2-R>}
    // linke vordere Ecke
    cylinder{<-B/2+R, 0, 0> <-B/2+R, H-R> R
             translate <0, 0,-T/2+R>}
    // rechte hintere Ecke
    cylinder{< B/2-R, 0, 0> < B/2-R, H-R> R
             translate <0, 0, T/2-R>}
    // rechte vordere Ecke
    cylinder{< B/2-R, 0, 0> < B/2-R, H-R> R
             translate <0, 0,-T/2+R>}

    sphere{< B/2-R, H-R, T/2-R> R scale <1,1,1>}
    sphere{< B/2-R, H-R,-T/2+R> R scale <1,1,1>}
    sphere{<-B/2+R, H-R, T/2-R> R scale <1,1,1>}
    sphere{<-B/2+R, H-R,-T/2+R> R scale <1,1,1>}


    cylinder{<-B/2+R,  H-R> < B/2-R, H-R> R
             translate <0, 0, T/2-R>}

    cylinder{<-B/2+R,  H-R> < B/2-R, H-R> R
             translate <0, 0,-T/2+R>}
    cylinder{<-T/2+R,  H-R> < T/2-R, H-R> R rotate<0, 90,0>
             translate < B/2-R, 0, 0>}
    cylinder{<-T/2+R,  H-R> < T/2-R, H-R> R rotate<0, 90,0>
             translate < -B/2+R, 0, 0>}
  }
#end 

// Ausbruch in der metallenen Vorderseite
#local stecker1 = 
      difference
      {
         box{<1.5,0.5,-1><15.8-1.5,11.5,15.0>}
         box{<0  ,0  ,-2><3.0     ,3.3 ,15.0>}
         box{<16 ,0  ,-2><15.8-3.0,3.3 ,15.0>}
         box{<0  ,0  ,-2><5.5     ,2.1 ,15.0>}
         box{<16 ,0  ,-2><15.8-5.5,2.1 ,15.0>}
      };

// Ausbruch im Kunststoff
#local stecker2 = 
      difference
      {
         union
         {
            box{<1.5, 3.7, -1><15.8-1.5, 11.5, 15.5>}
            box{<3.1, 2.5, -1><15.8-3.1, 11.5, 15.5>}
            box{<5.6, 0.7, -1><15.8-5.6, 11.5, 15.5>}
            box{<-1,-1,-2><16,1  ,2>rotate<-30,0,0>translate<0,4.4,0> pigment{White*0.5}}
            box{<-1,0 ,-1><16,0.5,1>rotate<-30,0,0>translate<0,2.0,0> pigment{White*0.5}}
         }
         box{<-1      ,-1  ,15.0><16  ,15 ,16.0>}
         box{<-1      ,-1  ,-1  ><1.6 ,15 ,16.0>}
         box{<15.8-1.6,-1  ,-1  ><16  ,15 ,16.0>}
      };

#local pin_intern =
   sphere_sweep {
      b_spline
      6,
      <15.8/2-0.635, 14.0, 6>,   0.2
      <15.8/2-0.635, 12.7, 6>,   0.2
      <15.8/2-0.635, 12.0, 6.5>, 0.2
      <15.8/2-0.635, 11.3, 10>,  0.2
      <15.8/2-0.635, 11.0, 16>,  0.2
      <15.8/2-0.635, 11.0, 18>,  0.2
      texture{col_gold}
   }

union
{
   difference
   {
      // Aussenabmasse : 15.8  x  13.0  x  21.4 mm
      union
      {
         object {body(15.8,13.0,21.4,0.3) translate<7.9,0,10.7>  }
         box{<0,12.0,0.2><0.5,13,7.7> }
         box{<15.5,12.0,0.2><15.8,13,7.7>}
      }
      // das Ganze aushoehlen
      box{<0.25 ,-1 , 0.2><15.8-0.25 ,13.0-0.25,21.4-0.25>}
      
      // Vorne typischer Ausbruch fuer Stecker
      stecker1

      // kleiner Schlitz hinten oben
      box{<3.5,13-0.35,21.4-0.35><15.8-3.5,13+0.35,21.4+0.35> }

      // Schlitze an den Seiten
      // Schraegen hinten (links und rechts)
      box{<-0.3,-0.1,-1.64><0.3,0.1,2.0> rotate<-45,0,0> translate<0,10.5+1.15+0.04,10-1.15+0.02+11.2>}
      box{<15.8-0.3,-0.1,-1.64><16,0.1,2.0> rotate<-45,0,0> translate<0,10.5+1.15+0.04,10-1.15+0.02+11.2>}
      // Senkrechten
      box{<-1,-1,18.8><20,10.6,19.00>}
      // waagerechte hinten
      box{<-1,10.45,10><20,10.65,18.8> }
      // Schraegen vorne
      box{<-1,-0.1,-1.52><20,0.1,1.64> rotate<45,0,0> translate<0,10.5+1.15+0.04,10-1.15+0.02> }
      // waagerechte vorn
      box{<-1,12.6,0.2><20,12.8,7.82>}

      // Verbindungspunkte hinten
      box{<-1,1,19.7><20,1.8,20.5>}
      box{<-1,8,19.7><20,8.8,20.5>}
      texture{tex_rj45_metal}
   }

   // Verbindungspunkte hinten
   superellipsoid{<0.3,0.3> scale<0.35,0.35,0.35> translate<     0.35,1.4,20.1> texture{tex_rj45_metal}}
   superellipsoid{<0.3,0.3> scale<0.35,0.35,0.35> translate<     0.35,8.4,20.1> texture{tex_rj45_metal}}
   superellipsoid{<0.3,0.3> scale<0.35,0.35,0.35> translate<15.8-0.35,1.4,20.1> texture{tex_rj45_metal}}
   superellipsoid{<0.3,0.3> scale<0.35,0.35,0.35> translate<15.8-0.35,8.4,20.1> texture{tex_rj45_metal}}

   // Schirmanschluesse
   box     {<0   , 1, 14-0.75><0.2     , -4,14+0.75> texture{tex_rj45_metal}}
   cylinder{<0   ,-4, 14     ><0.2     , -4,14     > 0.75 texture{tex_rj45_metal}}
   box     {<15.8, 1, 14-0.75><15.8-0.2, -4,14+0.75> texture{tex_rj45_metal}}
   cylinder{<15.8,-4, 14     ><15.8-0.2, -4,14     > 0.75 texture{tex_rj45_metal}}

   // Plastikinnenleben
   difference
   {
      box{<0.4 ,0 , 0.3><15.8-0.4 ,13.0-0.4,21.4-0.4>}
      stecker2

      texture{tex_rj45_pastic}
    }
 
   // Plastikfuesse zur Befestigung
   difference
   {
      cylinder{<2,-3.5,14-3.05><2,1,14-3.05> 1.5}
      box{<2-0.3,-4,0><2+0.3,-0.5,20>}
      texture{tex_rj45_pastic}
   }
   difference
   {
      cylinder{<15.8-2,-3.5,14-3.05><15.8-2,1,14-3.05> 1.5}
      box{<15.8-2-0.3,-4,0><15.8-2+0.3,-0.5,20>}
      texture{tex_rj45_pastic}
   }
   cylinder{<2,0,5><2,0,15> 0.5 texture{tex_rj45_pastic}}
   cylinder{<15.8-2,0,5><15.8-2,0,15> 0.5 texture{tex_rj45_pastic}}
   
      
   object {TOOLS_RECT_BOGEN(0.2, // i_radius
                            90 , // winkel
                            0.2, // dicke
                            2  , // breite
                            1 , // laenge1
                            5)  // laenge2
                            rotate<90,0,0>
                            translate <15.8-1.5-0.2,7,0.1>
                            texture{tex_rj45_metal}}
   object {TOOLS_RECT_BOGEN(0.2, // i_radius
                            90 , // winkel
                            0.2, // dicke
                            2  , // breite
                            5 , // laenge1
                            1)  // laenge2
                            rotate<90,0,0>
                            rotate<0,-90,0>
                            translate <1.5+0.2,7,0.1>
                            texture{tex_rj45_metal}}

   // Pins (8)
   cylinder{<15.8/2-0.635     ,1,14-3.05+8.89     ><15.8/2-0.635     ,-3.5,14-3.05+8.89     > 0.25 texture{col_gold}}
   cylinder{<15.8/2-0.635+2.54,1,14-3.05+8.89     ><15.8/2-0.635+2.54,-3.5,14-3.05+8.89     > 0.25 texture{col_gold}}
   cylinder{<15.8/2-0.635-2.54,1,14-3.05+8.89     ><15.8/2-0.635-2.54,-3.5,14-3.05+8.89     > 0.25 texture{col_gold}}
   cylinder{<15.8/2-0.635+5.08,1,14-3.05+8.89     ><15.8/2-0.635+5.08,-3.5,14-3.05+8.89     > 0.25 texture{col_gold}}

   cylinder{<15.8/2+0.635     ,1,14-3.05+8.89-2.54><15.8/2+0.635     ,-3.5,14-3.05+8.89-2.54> 0.25 texture{col_gold}}
   cylinder{<15.8/2+0.635+2.54,1,14-3.05+8.89-2.54><15.8/2+0.635+2.54,-3.5,14-3.05+8.89-2.54> 0.25 texture{col_gold}}
   cylinder{<15.8/2+0.635-2.54,1,14-3.05+8.89-2.54><15.8/2+0.635-2.54,-3.5,14-3.05+8.89-2.54> 0.25 texture{col_gold}}
   cylinder{<15.8/2+0.635-5.08,1,14-3.05+8.89-2.54><15.8/2+0.635-5.08,-3.5,14-3.05+8.89-2.54> 0.25 texture{col_gold}}
   
   object { pin_intern }
   object { pin_intern  translate< 2.54,0,0>}
   object { pin_intern  translate<-2.54,0,0>}
   object { pin_intern  translate<+5.08,0,0>}
   
   object { pin_intern  translate<+1.27,0,0>}
   object { pin_intern  translate<+1.27+2.54,0,0>}
   object { pin_intern  translate<+1.27-2.54,0,0>}
   object { pin_intern  translate<+1.27-5.08,0,0>}
 
   translate<0,0.5,0>  // Anhebung um hoehe der Plastikrollen
   translate<-15.8/2,0,-21.4/2>  // 0-Punkt in die Mitte der Buchse platzieren
}
#end

#macro CON_RJ45()
object{CON_RJ45_GRND()}
#end

/********************************************************************************************************************************************
//Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro CON_SMA_JH_GRND()
union
{
  union
  {
    object{
      SMA_JACK(8.25) 
      rotate<0,180,0> 
      translate<0,0,11.68>
    }
    cone{<0,0,3.43> 3.19 <0,0,3.93> 2.68 }
    translate<0,6.35,0>
  }
  
  // the body piece
  object
  {
    intersection
    {
      box{<-3.43,-3.43,4.75><3.43,3.43,13.47> }
      sphere{<0,0,9.2>,5.85 }
      cylinder{<0,0,4> <0,0,14> 4.7 }
      cylinder{<-4,0,9.11> <4,0,9.11> 5.35 }
      cylinder{<0,-4,9.11> <0,4,9.11> 5.35 }
    }
    translate<0,0,-2.79>
    rotate<-90,0,0>
  }
  
  // the base piece
  union
  {
    difference{
      cylinder{<0,0,2.79> <0,0,4.25> 4.10 }
      cylinder{<0,0,2.7> <0,0,3.3> 3.08 }
      box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<4.6,0,1.3>}
      box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<0,4.6,1.3>}
      box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<-4.6,0,1.3>}
      box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<0,-4.6,1.3>}
    }
    box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<2.54,2.54,0> }
    box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<-2.54,2.54,0> }
    box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<2.54,-2.54,0> }
    box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<-2.54,-2.54,0> }
    cylinder{<0,0,0.25> <0,0,4.25> 0.635 }
    cone{<0,0,0> 0.5 <0,0,0.25> 0.635 }
    cone{<0,0,4.25> 4.10 <0,0,4.75> 3.60 }
    translate<0,0,-2.79>
    rotate<-90,0,0>
  }
  texture{col_gold}
  rotate<0,90,0>
}
#end

#macro CON_SMA_JH()
object{CON_SMA_JH_GRND()}
#end

/********************************************************************************************************************************************
//Duane Clark <dclark(replace with at)akamail.com>
********************************************************************************************************************************************/
#macro CON_SMA_JV_GRND()
union
{
  object{
    SMA_JACK(8.06) 
    rotate<0,180,0> 
    translate<0,0,12.31>
  }
  cone{<0,0,4.24> 3.19 <0,0,4.75> 2.68 }
  difference{
    cylinder{<0,0,2.79> <0,0,4.25> 4.10 }
    cylinder{<0,0,2.7> <0,0,3.3> 3.08 }
    box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<4.6,0,1.3>}
    box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<0,4.6,1.3> }
    box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<-4.6,0,1.3>}
    box{<-2,-2,-2><2,2,2> rotate<0,0,45> translate<0,-4.6,1.3>}
  }
  box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<2.54,2.54,0>}
  box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<-2.54,2.54,0>}
  box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<2.54,-2.54,0>}
  box{<-0.51,-0.51,0><0.51,0.51,2.79> rotate<0,0,45> translate<-2.54,-2.54,0>}
  cylinder{<0,0,0.25> <0,0,4.25> 0.635}
  cone{<0,0,0> 0.5 <0,0,0.25> 0.635}
  translate<0,0,-2.79>
  texture{col_gold}
  rotate<-90,0,0>
}
#end

#macro CON_SMA_JV()
object{CON_SMA_JV_GRND()}
#end

/********************************************************************************************************************************************
//AMP 147323
//n		Number of Pins
********************************************************************************************************************************************/
#macro CON_SMD_AMP_147323_GRND(n)
union{

	#local pin =
	union{
		object{TOOLS_RECT_BOGEN(0.5,90,0.64,0.64,2.5,1.5) rotate<0,90,0> translate<0,0.32,0>}
		object{TOOLS_RECT_BOGEN(0.5,90,0.64,0.64,10,1.5) rotate<0,90,0> rotate<180,0,0> translate<0,3.32,0>}
	
	}

	//Pins
	union{
		#local i = 0;
		#while(i<n)
			object{pin translate<-(n-1)*2.54/2+i*2.54,0,0>}
			#local i = i + 1;
		#end
		
		box{<(n+3)*2.54/2-0.4,0,7.3><(n+3)*2.54/2-3.5,0.3,3.7>}
		box{<-(n+3)*2.54/2+0.4,0,7.3><-(n+3)*2.54/2+3.5,0.3,3.7>}
		
		texture{col_silver}
	}

	//Plastikkoerper
	union{
		difference{
			union{
				object{Round_Box_Union(<(n+3)*2.54/2-0.8,0.2,0>,<-(n+3)*2.54/2+0.8,5.3,13.6>,0.1)}
				object{Round_Box_Union(<-1.27*2-0.5,5,10.6>,<1.27*2+0.5,6.9,13.6>,0.1)}
				
			}
			object{Round_Box_Union(<(n+3)*2.54/2-2.8,1.2,4.6>,<-(n+3)*2.54/2+2.8,4.3,13.7>,0.1)}
			box{<-1.27,4.2,4.6><1.27,5.4,13.7>}
			box{<-1.27*2,4.2,10.6><1.27*2,6.2,13.7>}
			

			#local i = 0;
			#while(i<n+2)
				box{<-0.3,0,-0.1> <0.3,5.4,0.6> translate<-(n+1)*2.54/2+i*2.54,0,0>}
				#local i = i + 1;
			#end
		}

		texture{pigment{Gray30}}
	}
}
#end

#macro CON_SMD_AMP_147323_2()
object{CON_SMD_AMP_147323_GRND(2)}
#end
#macro CON_SMD_AMP_147323_3()
object{CON_SMD_AMP_147323_GRND(3)}
#end
#macro CON_SMD_AMP_147323_4()
object{CON_SMD_AMP_147323_GRND(4)}
#end
#macro CON_SMD_AMP_147323_5()
object{CON_SMD_AMP_147323_GRND(5)}
#end
#macro CON_SMD_AMP_147323_6()
object{CON_SMD_AMP_147323_GRND(6)}
#end
#macro CON_SMD_AMP_147323_7()
object{CON_SMD_AMP_147323_GRND(7)}
#end
#macro CON_SMD_AMP_147323_8()
object{CON_SMD_AMP_147323_GRND(8)}
#end
#macro CON_SMD_AMP_147323_9()
object{CON_SMD_AMP_147323_GRND(9)}
#end
#macro CON_SMD_AMP_147323_10()
object{CON_SMD_AMP_147323_GRND(10)}
#end

/********************************************************************************************************************************************
//Molex 53261
//n		Number of Pins
********************************************************************************************************************************************/
#macro CON_SMD_MOLEX_53261_GRND(n)
union{

	#local pin =
	union{
		box{<-0.18,-0.35,0><0.18,0.35,3.6> translate<0,1.375,0>}
		box{<-0.18,0.8,0><0.18,1.375,-0.3> }
		box{<-0.18,0.0,-0.3><0.18,1.375,-1.0> }
	}

	//Pins
	union{
		#local i = 0;
		#while(i<n)
			object{pin translate<-(n-1)*1.25/2+i*1.25,0,0>}
			#local i = i + 1;
		#end
		
		object{ TOOLS_RECT_BOGEN(0.5,90,0.25,2.2,1.2,1) rotate<0,180,0> translate<-(4.25+(n-2)*1.25)/2-0.2,0.125,2.1>  }
		object{ TOOLS_RECT_BOGEN(0.5,90,0.25,2.2,1.2,1) rotate<0,0,0> translate<(4.25+(n-2)*1.25)/2+0.2,0.125,2.1>  }
		texture{col_silver}
	}

	//Plastikkoerper
	union{
		difference{
			box{<-(4.25+(n-2)*1.25)/2,0,0.01><(4.25+(n-2)*1.25)/2,3.4,4.2>}
			box{<-(3.05+(n-2)*1.25)/2,0.6,0.8><(3.05+(n-2)*1.25)/2,3.0,4.3>}
			box{<-(4.3+(n-2)*1.25)/2,2.99,3.2><(4.3+(n-2)*1.25)/2,3.41,4.3>}
			box{<-(2.5+(n-2)*1.25)/2,2.99,2.8><(2.5+(n-2)*1.25)/2,3.41,4.3>}

			#local i = 0;
			#while(i<n+2)
				box{<-0.3,2.8,0> <0.3,3.41,0.6> translate<-(n+1)*1.25/2+i*1.25,0,0>}
				#local i = i + 1;
			#end
		}
		
		box{<-(4.25+(n-2)*1.25)/2,0.25,0.9><-(4.25+(n-2)*1.25)/2-1.5,2,3.8>}
		box{<(4.25+(n-2)*1.25)/2,0.25,0.9><(4.25+(n-2)*1.25)/2+1.5,2,3.8>}

		texture{pigment{Gray30}}
	}

}
#end

#macro CON_SMD_MOLEX_53261_2()
object{CON_SMD_MOLEX_53261_GRND(2)}
#end
#macro CON_SMD_MOLEX_53261_3()
object{CON_SMD_MOLEX_53261_GRND(3)}
#end
#macro CON_SMD_MOLEX_53261_4()
object{CON_SMD_MOLEX_53261_GRND(4)}
#end
#macro CON_SMD_MOLEX_53261_5()
object{CON_SMD_MOLEX_53261_GRND(5)}
#end
#macro CON_SMD_MOLEX_53261_6()
object{CON_SMD_MOLEX_53261_GRND(6)}
#end
#macro CON_SMD_MOLEX_53261_7()
object{CON_SMD_MOLEX_53261_GRND(7)}
#end
#macro CON_SMD_MOLEX_53261_8()
object{CON_SMD_MOLEX_53261_GRND(8)}
#end
#macro CON_SMD_MOLEX_53261_9()
object{CON_SMD_MOLEX_53261_GRND(9)}
#end
#macro CON_SMD_MOLEX_53261_10()
object{CON_SMD_MOLEX_53261_GRND(10)}
#end
#macro CON_SMD_MOLEX_53261_11()
object{CON_SMD_MOLEX_53261_GRND(11)}
#end
#macro CON_SMD_MOLEX_53261_12()
object{CON_SMD_MOLEX_53261_GRND(12)}
#end
#macro CON_SMD_MOLEX_53261_13()
object{CON_SMD_MOLEX_53261_GRND(13)}
#end
#macro CON_SMD_MOLEX_53261_14()
object{CON_SMD_MOLEX_53261_GRND(14)}
#end
#macro CON_SMD_MOLEX_53261_15()
object{CON_SMD_MOLEX_53261_GRND(15)}
#end

/********************************************************************************************************************************************
// Small stereo 3.5mm
********************************************************************************************************************************************/
#macro CON_STEREO35_GRND()
union{
difference {       
union{
  box{<0,0,0><7,5,12> translate <-3.5,1,2>}
  box{<0,0,0><5,1,10> translate <-2.5,1,2>}
  cylinder {<0,0,0><0,0,2> 3 translate <0,3,0>}
 }
 cylinder {<0,0,12><0,0,-0.1> 1.75 translate <0,3,0>}
 box{<0,0,0><3.5,2.5,3.5> translate <-1.75,3.6,8>}
 box{<0,0,0><6,4.5,10.5> translate <-3,1,4>}

}

 cylinder {<0,0,0><0,1,0> 0.5 translate <0,0,4.5>}
 cylinder {<0,0,0><0,1,0> 0.5 translate <0,0,11.5>}

union{ 
  // Legs front
  box{<0,0,0><0.3,8.5,1.1> translate <-3.65,-2.5,4>}
  box{<0,0,0><0.3,8.5,1.1> translate <3.35,-2.5,4>}
               
  // legs rear
  box{<0,0,0><0.3,8.4,1.1> translate <-3.5,-2.5,12.9>}
  box{<0,0,0><0.3,8.4,1.1> translate <3.2,-2.5,12.9>}
     
  // left,right side
  box{<0,0,0><0.3,5,3.5> translate <-3.65,1,2.7>}
  box{<0,0,0><0.3,5,3.5> translate <3.35,1,2.7>}
    
  // top  
  box{<0,0,0><7,0.3,3.5> translate <-3.65,5.8,2.7>}
  box{<0,0,0><2.5,0.3,8> translate <-1.25,5.8,2.7>}

  box{<0,0,0><2.5,0.3,5> translate <-1.25,3.8,8>}

  texture{T_Chrome_5A} 
}


}
pigment{Gray20} 
translate <0,0,-8>
#end




#macro CON_STEREO35()
object{CON_STEREO35_GRND()}
#end

/********************************************************************************************************************************************
//Macro fuer USB-Buchse USB-787616 aus der con-amp.lib
//12.10.2004
//Designed by hebel23 <hebel(replace with at)hebel23.de> 
********************************************************************************************************************************************/
#macro CON_USB_A_001_GRND()
union{
        /* Blechgehaeuse  */               
        difference{
                box { <-7,2,0>,<7,8,14>} // Aussenhuelle
                box { <-6.5, 2.5, -1>, <6.5, 7.5, 14> } // Aussparung in der Mitte
                box { <-6.5, 0, 12>, <6.5, 7.5, 15> }  // Aussparung hinten
                difference{                                      // Feder links oben                                      
                           cone {<-3,8,8> , 1.5 , <-3,8,1> , 1.0}
                           cone {<-3,8,8> , 1 , <-3,8,2> , 0.5}
                          }
                difference{                                      // Feder rechts oben                                      
                           cone {<3,8,8> , 1.5 , <3,8,1> , 1.0}
                           cone {<3,8,8> , 1 , <3,8,2> , 0.5}
                          }
                difference{                                      // Feder links unten                                     
                           cone {<-3,2,8> , 1.5 , <-3,2,1> , 1.0}
                           cone {<-3,2,8> , 1 , <-3,2,2> , 0.5}
                          }
                difference{                                      // Feder rechts unten                                      
                           cone {<3,2,8> , 1.5 , <3,2,1> , 1.0}
                           cone {<3,2,8> , 1 , <3,2,2> , 0.5}
                          }
                difference{                                      // Feder links                                      
                           cone {<-7,5,8> , 1.5 , <-7,5,1> , 1.0}
                           cone {<-7,5,8> , 1 , <-7,5,2> , 0.5}
                          }
                difference{                                      // Feder rechts                                      
                           cone {<7,5,8> , 1.5 , <7,5,1> , 1.0}
                           cone {<7,5,8> , 1 , <7,5,2> , 0.5}
                          }
                texture{col_silver}
                } 
        union{
                box { <-7, -2, 9.5>, <-6.5, 3, 11> }            // linke Loetlasche
                box { <7, -2, 9.5>, <6.5, 3, 11> }              // rechte Loetasche
                texture{col_silver}
               }
        union{       
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,0,0>translate<6.75,5,-0.5>}
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,270,0>translate<-6.75,5,-0.5>}
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,0,90>translate<-3.5,7.75,-0.5>}
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,0,90>translate<3.5,7.75,-0.5>}
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,0,270>translate<-3.5,2.25,-0.5>}
                union{TOOLS_RECT_BOGEN(0.5,90,0.5,4,0,0)rotate<90,0,270>translate<3.5,2.25,-0.5>}
                texture{col_silver}
               }
        /* weisser Kontakttraeger */
        difference{
                box { <-5,4,1>,<5,6,12>} // Quader in der Mitte
                union{
                      box{<-6,5.3,0>,<6,7,5>}
                      rotate <-10, 0, 0>        // Abflachung oben
                      }
                union{
                      box{<-6,4.3,0>,<6,3.5,5>}
                      rotate <10, 0, 0>        // Abflachung unten
                     }
                 texture{pigment{color White}}
                }  
        /* Kontakte */
        difference{    
                  union{
                        box { <-3.8,3.5,3>,<-3,4,8>} // Kontakt 1
                        box { <-1.8,3.5,3>,<-0.8,4,8>} // Kontakt 2
                        box { <1.8,3.5,3>,<0.8,4,8>} // Kontakt 3
                        box { <3.8,3.5,3>,<3,4,8>} // Kontakt 4
                        texture{col_gold}
                        }   
                  union{
                        box{<-4,4,1>,<4,3.5,5>}
                        rotate <5, 0, 0> // Abflachung der Kontakte
                        }
                }
        union{
                box { <-3.8,-2,12.5>,<-3.2,5,13>} // Kontakt 1 hinten
                box { <-1.3,-2,12.5>,<-0.7,5,13>} // Kontakt 2 hinten
                box { <0.7,-2,12.5>,<1.3,5,13>} // Kontakt 3 hinten
                box { <3.2,-2,12.5>,<3.8,5,13>} // Kontakt 4 hinten
                texture{col_gold}
             }
        /* weisser Sockel */
        union{      
                difference{
                        box { <-6,0,2>,<6,2,12>} // Sockel links
                        box { <-1,0,1>,<1,2,12>} // Sockel rechts
                        union{
                                box{<1.5,0,0>,<7,2,12>}
                                rotate <-10, 0, 0>        // Abflachung links
                                }
                         union{
                                box{<-1.5,0,0>,<-7,2,12>}
                                rotate <-10, 0, 0>        // Abflachung links
                                }
                               }                
                        difference{
                        box { <-6.5, 0.5, 12>, <6.5, 7.5, 14> } // Sockel hinten
                        box { <-6, 2.5, 12.5>, <6, 8, 15> }  // Aussparung fuer Kontakte
                        box { <-3.8,-2,12>,<-3.2,5,15> }  // Aussparung fuer Kontakte
                        box { <-1.3,-2,12>,<-0.7,5,15> }  // Aussparung fuer Kontakte
                        box { <0.7,-2,12>,<1.3,5,15> }  // Aussparung fuer Kontakte
                        box { <3.2,-2,12>,<3.8,5,15> }  // Aussparung fuer Kontakte
                texture{pigment{color White}}
                                }
             }  
}
#end

#macro CON_USB_A_001()
object{CON_USB_A_001_GRND()}
#end

/********************************************************************************************************************************************
// Desc: USB Connector Type B, AMP 787780
// Date: 22.03.2004
// Auth: Friedrich Bleikamp, <fbleikamp(replace with at)web.de>
********************************************************************************************************************************************/
#macro CON_USB_B_001_GRND()
union {

#macro SHELL_PIN_USB_B()
   merge{
      difference {
         box { <-0.2,-3.5,-1.15> <0.2,0.5,1.15>}
         box { <-0.21,-4,-1.15> <0.21,1,1.15> translate <0,0,2.3> rotate<6.5,0,0>}
         box { <-0.21,-4,-1.15> <0.21,1,1.15> translate <0,0,-2.3> rotate<-6.5,0,0>}
      }
      cylinder { <-0.2,0,0> <0.2,0,0>, 0.75 translate <0,-3.5,0>}
   }texture{col_silver}
#end

   //Metall shell
   union {
      difference {
         union {
            box { <0,0.5,-5.6> <0.4,10.7,5.6>}                 // front
            box { <0.6,0.5,5.8> <11.5,10.8,6.2>}               // left side
            box { <0.6,0.5,-5.8> <11.5,10.8,-6.2>}             // right side
            object{ TOOLS_RECT_BOGEN(0.2,90,0.4,10.0,0,0) rotate<0,90,-90> translate<0.2,5.5,6.0>}      
            object{ TOOLS_RECT_BOGEN(0.2,90,0.4,10.0,0,0) rotate<0,-90,-90> translate<0.2,5.5,-6.0>}      
         }    
         box { <-1,-1,-6.5> <1,1,6.5> translate<8.5,3.6,0>}       // cutout bottom
         box { <-1,-1,-6.5> <1,1,6.5> translate<8.5,7.6,0>}       // cutout top
         box { <-0.4,-0.25,-6.5> <0.4,0.25,6.5> translate<0.35,2.75,0>}// cutout front
         cylinder { <0,0,-6.5> <0,0,6.5>, 0.25 translate <0.75,2.75,0>} 
         box { <-0.4,-0.25,-6.5> <0.4,0.25,6.5> translate<0.35,6.25,0>}// cutout front
         cylinder { <0,0,-6.5> <0,0,6.5>, 0.25 translate <0.75,6.25,0>} 
         prism {linear_sweep linear_spline 0, 0.6, 7,             // cutout front
         < 0,-4.85>, < 6,-4.85>, < 7.85,-3.0>, < 7.85,3.0>, < 6,4.85>, <0,4.85>,< 0,-4.85>
         rotate<0,0,90> translate <0.5,1.5,0>}
      }
   box { <0.6,10.9,-5.8> <11.5,11.3,5.8>}                      // top
   object{ TOOLS_RECT_BOGEN(0.2,90,0.4,11.2,0,0) rotate<0,0,-90> translate<0.2,11.1,0>}      
   object{ TOOLS_RECT_BOGEN(0.2,90,0.4,3,3,1) rotate<90,0,0> translate<0.2,4.5,4.2>}      
   object{ TOOLS_RECT_BOGEN(0.2,90,0.4,3,3,1) rotate<-90,0,0> translate<0.2,4.5,-4.2>}      
   object{ SHELL_PIN_USB_B() rotate<0,90,0> translate<10.3,0.5,6.0>}
   object{ SHELL_PIN_USB_B() rotate<0,90,0> translate<10.3,0.5,-6.0>}   
   texture{col_silver}
   }
   
   //Housing: Thermoplastic, glass filled (UL94V-0)
   union { 
      difference {
         TOOLS_ROUNDED_BAR(<-5.5,0.4,0>,<5.5,10.9,15.3>,0.5)
         box { <-4.0,1.5,-0.1> <4.0,8.5,3.5> } 
         box { <-1.7,0,-0.1> <-0.8,8.5,4.5> }
         box { <0.8,0,-0.1> <1.7,8.5,4.5> }
         box { <-5.6,4.2,-0.1> <5.6,7.7,3.4> }   
         object{ TOOLS_ROUNDED_BAR(<-4.25,2.0,8.5>,<4.25,7.0,16.1>,0.5)} 
         object{ TOOLS_ROUNDED_BAR(<-2.90,7.0,8.5>,<2.90,8.5,16.1>,0.5)} 
         object{ TOOLS_ROUNDED_BAR( <-1.41,-1.41,8.5> <1.41,1.41,16.1>,0.5) rotate<0,0,45> translate<2.45,6.6,0>}
         object{ TOOLS_ROUNDED_BAR( <-1.41,-1.41,8.5> <1.41,1.41,16.1>,0.5) rotate<0,0,45> translate<-2.45,6.6,0>}
      }
   object{ Round_Box_Union( <-2.8,3.7,8.5> <2.8,6.7,15.5>,0.5)}
   box { <-0.25,-0.6,0> <0.25,0.6,4> translate<5.7,2.0,0>}
   box { <-0.25,-0.6,0> <0.25,0.6,4> translate<-5.7,2.0,0>}
   box { <-0.25,-0.6,0> <0.25,0.6,4> translate<5.7,9.75,0>}
   box { <-0.25,-0.6,0> <0.25,0.6,4> translate<-5.7,9.75,0>} 
   box { <-6.0,-0.7,-1> <6.0,0.7,0.6> translate<0,3.5,7>}
   box { <-6.0,-0.7,-1> <6.0,0.7,0.6> translate<0,7.5,7>}
   pigment{Gray25} rotate<0,-90,0> translate<15.7,0,0>
   } 

   //Contacts
   union {
      object{ TOOLS_RECT_BOGEN(0.2,90,0.25,0.7,12.2,7.25) rotate<0,0,180> translate<13.0,3.6,-1.25>}      
      object{ TOOLS_RECT_BOGEN(0.2,90,0.25,0.7,12.2,7.25) rotate<0,0,180> translate<13.0,3.6,1.25>}      
      object{ TOOLS_RECT_BOGEN(0.2,90,0.25,0.7,14.2,10.25) rotate<0,0,180> translate<15.0,6.8,-1.25>}      
      object{ TOOLS_RECT_BOGEN(0.2,90,0.25,0.7,14.2,10.25) rotate<0,0,180> translate<15.0,6.8,1.25>}
      texture{col_gold}     
   }
}     
#end

#macro CON_USB_B_001()
object{CON_USB_B_001_GRND()}
#end

/********************************************************************************************************************************************
//Macro fuer USB-Mini-Buchse MOLEX 54919-0578 (RS-Components Artikel: 418-0172)
//Designed by hebel23 <hebel(replace with at)hebel23.de>
//24.10.2004
********************************************************************************************************************************************/
#macro CON_USB_B_002_GRND()
union{
    union{      
     // Blechgehaeuse                    
    difference{      
    union{      
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,4,0)translate<-3.355,0.15,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,4,0)rotate<0,180,0>translate<3.355,0.15,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,0,1)translate<-3.85,2.15,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,0,1)rotate<0,180,0>translate<3.85,2.15,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,0,1.3)rotate<0,0,180>translate<-3.35,2.2,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,0,1.3)rotate<0,180,180>translate<3.35,2.2,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,4,0)rotate<0,0,180>translate<3.85,3.85,-4>}
          union{TOOLS_RECT_BOGEN(0.25,90,0.25,8,4,0)rotate<0,180,180>translate<-3.85,3.85,-4>}
         }     
          box { <-4.5, -0.1, -2.9>, <4.5,2.75,-9> }       
             difference{                                                                           
             cone {<-2.5,4,-4.5> , 0.75 , <-2.5,4,-1> , 0.5}
             cone {<-2.5,4,-4.5> , 0.5 , <-2.5,4,-2> , 0.25}
                }
             difference{                                                                          
             cone {<2.5,4,-4.5> , 0.75 , <2.5,4,-1> , 0.5}
             cone {<2.5,4,-4.5> , 0.5 , <2.5,4,-2> , 0.25}
                }
             difference{                                                                           
             box { <-0.75, 3, -1>, <0.75,5,-6> }      
             box { <-0.5, 3, -1>, <0.5,5,-5> }      
                }
          }
     // Loetfahnen
     difference{     
     union{
          union{TOOLS_RECT_BOGEN(0.5,90,0.25,5.5,0.5,2.5)translate<3.85,0.1,-5.75>}
          union{TOOLS_RECT_BOGEN(0.5,90,0.25,5.5,0.5,2.5)rotate<0,180,0>translate<-3.85,0.1,-5.75>}
          }
                box { <-4.01, -0.1, -5>, <-5.1,1,-7> }     
                box { <4.01, -0.1, -5>, <5.1,1,-7> }       
          }
          texture{col_silver}
         }
     // schwarzer Kontakttraeger in der Mitte
        difference{
                box { <-2.5,1,-1>,<2.5,2,-7>} 
                box { <-0.25,1.25,0>,<0.25,1.75,-8>} 
                box { <-1.00,1.25,0>,<-0.50,1.75,-8>} 
                box { <-1.75,1.25,0>,<-1.25,1.75,-8>} 
                box { <1.00,1.25,0>,<0.50,1.75,-8>} 
                box { <1.75,1.25,0>,<1.25,1.75,-8>} 
                texture{pigment{color rgb <0.1, 0.1, 0.1>}}
                }
     // schwarzer Kontakttraeger Hinten
         difference{
                box { <-3.75,0,-6>,<3.75,3.75,-8.5>} 
                box { <-2,1.9,-7>,<3,4,-8.6>} 
                box { <-4,3,-8>,<4,4,-8.6>} 
                box { <-3,-0.1,-7.5>,<3,4,-8.6>} 
                box { <-0.25,-0.1,0>,<0.25,2,-8.6>} 
                box { <-1.00,-0.1,0>,<-0.50,2,-8.6>} 
                box { <-1.75,-0.1,0>,<-1.25,2,-8.6>} 
                box { <1.00,-0.1,0>,<0.50,2,-8.6>} 
                box { <1.75,-0.1,0>,<1.25,2,-8.6>} 
                texture{pigment{color rgb <0.1, 0.1, 0.1>}}
                }                
        // Kontakte
                difference{
                union{
                      union{TOOLS_RECT_BOGEN(0.25,90,0.25,3.5,1,0.65)rotate<0,90,0>translate<0,0.125,-7.3>}
                      union{TOOLS_RECT_BOGEN(0.25,90,0.25,3.5,0,0)rotate<180,270,0>translate<0,1.5,-7.3>}
                      box { <-0.25,1.5,-1>,<0.25,1.75,-7>rotate<7,0,0>} 
                      box { <-1.00,1.5,-1>,<-0.50,1.75,-7>rotate<7,0,0>} 
                      box { <-1.25,1.5,-1>,<-1.75,1.75,-7>rotate<7,0,0>} 
                      box { <1.00,1.5,-1>,<0.50,1.75,-7>rotate<7,0,0>} 
                      box { <1.25,1.5,-1>,<1.75,1.75,-7>rotate<7,0,0>} 
                     }   
                box { <-0.5,-0.1,-7>,<-0.25,1.25,-9.5>}      
                box { <0.5,-0.1,-7>,<0.25,1.25,-9.5>}      
                box { <-1.0,-0.1,-7>,<-1.25,1.25,-9.5>}      
                box { <1.0,-0.1,-7>,<1.25,1.25,-9.5>}      
                texture{col_silver}
                }
        // Aufkleber
                union{
                box{<-3.2,3.9,-0.5><3.2,4.05,-7>}
                pigment{color rgbf <1, 0, 0, 0.9>}
               }
}
#end

#macro CON_USB_B_002()
object{CON_USB_B_002_GRND()}
#end

/********************************************************************************************************************************************
//DC-Power-Connector by Nigel Eke
********************************************************************************************************************************************/
#macro DCPOWERCONNECTOR_GRND()
  #local endcutaway = union { cylinder { <10,5,3> <11.01,5,3> 3.01 }
                              box { <10,1.99,-.01> <11.01,5,6.01> }
                              box { <10,-.01,2> <11.01,2.01,4> }
                              pigment { Gray20} }
  #local innercutaway = cylinder { <-.01,5,3> <9,5,3> 2 pigment { Gray75} }
  #local housing_rough = union { box { <0,0,0> <2,8,6> }
                                 cylinder { <2,5,3> <11,5,3> 3 }
                                 box { <2,0,0> <11,5,6> }
                                 pigment { Gray20 }
                                 finish { Shiny } }
  #local housing_refined = difference { object { housing_rough }
                                        object { endcutaway }
                                        object { innercutaway } }
  #local innerconnector = union { cylinder { <1,5,3> <8.5,5,3> .25 }
                                  cylinder { <8.5,5,3> <9,5,3> .75 }
                                   texture { Silver_Metal } }
  #local pin = box { <-1,-4,-.25> <1,3.5,.25> texture { Silver_Metal } }
  #local endconnector = difference { union { cylinder { <0,0,-.25><0,0,.25> 2 }
                                             cylinder { <0,0,-.99><0,0,.7> .8 } }
                                     cylinder { <0,0,-1> <0,0,.71> .6 }
                                     texture { Silver_Metal }
                                     translate <0,5,0> }

  union { object { housing_refined }
          object { innerconnector }
          object { pin rotate<0,90,0> translate<6,0,3> }
          object { pin translate<8,0,1> }
          union { difference { object { pin }
                               cylinder { <0,2,-.26> <0,2,.26> .2
texture { Silver_Metal} } }
                  object { endconnector }
                  rotate<0,90,0>
                  translate<10,0,3> } }

  translate<-5.5,0,-3>
  rotate<0,-90,0>
  scale 2.54/2
#end

#macro DCPOWERCONNECTOR()
object{DCPOWERCONNECTOR_GRND()}
#end

/********************************************************************************************************************************************
//FEMALE PRINT CONNECTOR DIN 45323 (34V/3A), ROKA, distributor Conrad
// Friedrich Bleikamp <fbleikamp(replace with at)web.de>
********************************************************************************************************************************************/
#macro FPCON65_GRND()
union { 
//Kunstoff
difference {
merge {
cylinder{<0,6.5,0><10.5,6.5,0>4.25}
box {<0,0,-6>,<5.2,6.2,6>}
box {<0,0,-4>,<1.6,13,4> translate<-1.6,0,0>}
box {<0,0,-6>,<1.1,14,6> translate<-2.7,0,0>}
cylinder{<10.0,6.5,0><14.0,6.5,0>2.5}
}
cylinder{<-3,6.5,0><8.7,6.5,0>3.25}
cylinder{<8.5,6.5,0><14.6,6.5,0>2.25}
box {<0.1,-0.1,-3>,<9,14,3>}
box {<0.1,-0.1,-4.5>,<9,4.5,-5.5>}
box {<0.1,-0.1,4.5>,<9,4.5,5.5>}
pigment{Gray30}}

difference {
merge {
cylinder{<12.6,6.5,0><14,6.5,0>4.5}
box {<12.6,0,-4.5>,<14,6.5,4.5>}
box {<14,0,-4.5>,<15.5,2.5,4.5>}
}
cylinder{<12.5,6.5,0><14.1,6.5,0>2.55}
box {<0,0,-4.6>,<2,3.5,4.6> rotate <0, 0, 20> translate<15.4,-0.2,0>}
pigment{Gray30}} 

//Mittenkontakt
difference {
merge {
sphere { <0, 6.5, 0>, 1.05}
cylinder{<0,6.5,0><6,6.5,0>1.05}
cylinder{<6,6.5,0><6.6,6.5,0>3}
cylinder{<6.6,6.5,0><12.1,6.5,0>2.1}
//Vernietung
difference {
torus { 2.1, 0.5 }
box {<-10,0,-10>,<10,-2.5,10> }
rotate <0, 0, -90> translate<12.0,6.5,0>}
translate<2.6,0,0> }
cone { <14.01, 6.5, 0>, 1.7, <13, 6.5, 0>, 0.0 }
cylinder{<14.0,6.5,0><18,6.5,0>1.7 }
texture{col_silver}}

//Loetanschluss Mitte
difference {
merge {
cylinder{<14,6.5,0><14.5,6.5,0>4}
box {<14,2.5,-4>,<14.5,6.5,4>}
//#macro TOOLS_RECT_BOGEN(i_radius,winkel,dicke,breite,laenge1,laenge2)
object {TOOLS_RECT_BOGEN(0.2,90,0.5,2,0.8,13.25) rotate <90,90,180> translate<14.25,3.5,5.25>}
cylinder{<0.5,3.5,5><0.5,3.5,5.5>1 }
box {<1.25,0,5>,<3.75,2.5,5.5> }
object {TOOLS_RECT_BOGEN(0.2,90,0.5,2,0.8,13.25) rotate <-90,-90,180> translate<14.25,3.5,-5.25>}
box {<2,-2.5,5>,<3,0,5.5> }
cylinder{<0,3.5,-5><0,3.5,-5.5>1 translate<0.5,0,0>}
box {<1.25,0,-5>,<3.75,2.5,-5.5> }
box {<2,-2.5,-5>,<3,0,-5.5> }
}
cylinder{<13.9,6.5,0><14.6,6.5,0>2 }
texture{col_silver} } 

//Loetanschluss Schalter
difference {
merge {
cylinder{<10.5,6.5,0><11.0,6.5,0>4 }
//#macro TOOLS_RECT_BOGEN(i_radius,winkel,dicke,breite,laenge1,laenge2)
object {TOOLS_RECT_BOGEN(0.3,85,0.5,4,3,5) rotate <0,180,90> translate<10.75,11.75,0>}
sphere { <6.5, 11.6, 0>, 0.5 translate<0,0,0>}
object {TOOLS_RECT_BOGEN(0.3,125,0.5,3,3,2.2) rotate <0,0.0,90> translate<10.75,1.8,0>}
object {TOOLS_RECT_BOGEN(0.3,125,0.51,1,2.5,0.3) rotate <0,0,-90> translate<8.4,0.6,0>}
}
cylinder{<10.4,6.5,0><11.1,6.5,0>2.55}
texture{col_silver}}

//Isolierscheibe
difference {
cylinder{<11.0,6.5,0><11.5,6.5,0>4.5 }
cylinder{<10.9,6.5,0><11.6,6.5,0>2.51 }
pigment{Sienna}}

//Federkontakt Aussen
difference {          
merge {
cylinder{<11.5,6.5,0><12.0,6.5,0>4 }
box {<11.5,4.5,-3.25>,<12.0,1.0,3.25>}
}
cylinder{<11.4,6.5,0><12.1,6.5,0>2.55 }
texture{col_silver}}  

//Loetanschluss Aussen u. Schalter
difference {          
merge {
cylinder{<12.05,6.5,0><12.6,6.5,0>4 }
object {TOOLS_RECT_BOGEN(0.75,39.85,0.5,4,4,0) rotate <0,180,90> translate<12.3,13.5,0>} 
object {TOOLS_RECT_BOGEN(0.3,132.0,0.5,4,7.98,0) rotate <0,180,7.5> translate<10.7,13,0>}
object {TOOLS_RECT_BOGEN(0.3,90,0.5,4,0,1.65) rotate <180,0,7.5> translate<1.8,11.83,0>}
object {TOOLS_RECT_BOGEN(0.3,125,0.5,4,2,0) rotate <0,0,-27.5> translate<1.88,9.52,0>}
object {TOOLS_RECT_BOGEN(0.5,125,0.5,4,2,0) rotate <0,0,22.5> translate<4.08,8.03,0>}
box {<12.05,4.5,-1.5>,<12.6,0,1.5>} 
box {<12.05,0,-0.5>,<12.5,-2.5,0.5>}
}
cylinder{<11.9,6.5,0><12.7,6.5,0>2.55 }
texture{col_silver}} 
}
#end

#macro FPCON65()
object{FPCON65_GRND()}
#end

/********************************************************************************************************************************************
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Loetoese 1.0mm Drill fuer Drahtanschluss oder Testklemme
********************************************************************************************************************************************/
#macro LSP_GRND(s)
union {
	difference{
		box { <-0.8,0,-0.2>,<0.8,5,0.2> texture{col_silver} translate<0,0,0>}
		box { <-0.8,-0.2,-0.3>,<0.8,5.2,0.3> texture{col_silver} rotate<0,0,-3> translate<1.1,0,0>}
		box { <-0.8,-0.2,-0.3>,<0.8,5.2,0.3> texture{col_silver} rotate<0,0,3> translate<-1.1,0,0>}
		translate<0,-5.0,0>
	}
	difference{
		box { <-1.5,0,-0.2>,<1.5,3,0.2> texture{col_silver} translate<0,0,0>}
		box { <-0.5,1.5,-0.3>,<0.5,3.1,0.3> texture{col_silver} translate<0,0,0>}
		cylinder{<0,0,-0.3><0,0,0.3>0.5 texture{col_silver} translate<0,1.5,0>}
	}
	difference{
		cylinder{<0,0,-0.2><0,0,0.2>1.5 texture{col_silver} translate<0,3,0>}
		cylinder{<0,0,-0.3><0,0,0.3>0.5 texture{col_silver} translate<0,3,0>}
		box { <-1.5,0,-0.3>,<1.5,3,0.3> texture{col_silver} translate<0,0,0>}
	}
	scale (s/13)
}
#end

#macro LSP_10()
object{LSP_GRND(10)}
#end
#macro LSP_11()
object{LSP_GRND(11)}
#end
#macro LSP_13()
object{LSP_GRND(13)}
#end

/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// gerade Molex-Stiftleisten RM 2.54.
// Bezugspunkt: Mitte der Pins auf PCB-Oberflaeche
********************************************************************************************************************************************/
#macro MOLEX_PSL_XX_G(Pins)
union{
object{MOLEX254(Pins)}
object{PIN_STRAIGHT_ROW (Pins,2.54,0.635,11,3,col_silver)}}
#end

#macro MOLEX_PSL2G()
object{MOLEX_PSL_XX_G(2)}
#end
#macro MOLEX_PSL3G()
object{MOLEX_PSL_XX_G(3)}
#end
#macro MOLEX_PSL4G()
object{MOLEX_PSL_XX_G(4)}
#end
#macro MOLEX_PSL5G()
object{MOLEX_PSL_XX_G(5)}
#end
#macro MOLEX_PSL6G()
object{MOLEX_PSL_XX_G(6)}
#end
#macro MOLEX_PSL7G()
object{MOLEX_PSL_XX_G(7)}
#end
#macro MOLEX_PSL8G()
object{MOLEX_PSL_XX_G(8)}
#end
#macro MOLEX_PSL9G()
object{MOLEX_PSL_XX_G(9)}
#end
#macro MOLEX_PSL10G()
object{MOLEX_PSL_XX_G(10)}
#end

/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// abgewinkelte Molex-Stiftleisten RM 2.54.
// Bezugspunkt: Mitte der Pins auf PCB-Oberflaeche
********************************************************************************************************************************************/
#macro MOLEX_PSL_XX_W(Pins)
union{
object{MOLEX254(Pins) rotate<-90,0,0> translate<0,2.5,-1.8>}
object{PIN_BENDED_ROW (Pins,2.54,0.635,0.8,2.5,3,12.5,col_silver) translate<0,0,0>}}
#end


#macro MOLEX_PSL2W()
object{MOLEX_PSL_XX_W(2)}
#end
#macro MOLEX_PSL3W()
object{MOLEX_PSL_XX_W(3)}
#end
#macro MOLEX_PSL4W()
object{MOLEX_PSL_XX_W(4)}
#end
#macro MOLEX_PSL5W()
object{MOLEX_PSL_XX_W(5)}
#end
#macro MOLEX_PSL6W()
object{MOLEX_PSL_XX_W(6)}
#end
#macro MOLEX_PSL7W()
object{MOLEX_PSL_XX_W(7)}
#end
#macro MOLEX_PSL8W()
object{MOLEX_PSL_XX_W(8)}
#end
#macro MOLEX_PSL9W()
object{MOLEX_PSL_XX_W(9)}
#end
#macro MOLEX_PSL10W()
object{MOLEX_PSL_XX_W(10)}
#end

/********************************************************************************************************************************************
//Designed by Friedrich Bleikamp, Lenord, Bauer & Co. Gmbh <fbleikamp(replace with at)lenord.de> 
//Privat: <fbleikamp(replace with at)web.de>
//Grundmakro Stiftleisten Winkel (Macro aus connector.inc abgewandelt)
//a = Reihen
//b = Pins
********************************************************************************************************************************************/
#macro PHW_GRND(a,b)
union{
#if(a=1)
#local i=0;
        #while(i<b)
                object{PHW() translate<i*2.54,0,0>}
                #local i=i+1;
        #end
        translate<-(b-1)*1.27,0,0>
#else
        #local i=0;
        #while(i<b)
                object{PHW() translate<i*2.54,0,1.27>}
                object{PHW2() translate<i*2.54,0,-1.27>}
                #local i=i+1;
        #end
        translate<-(b-1)*1.27,0,0>
#end
}
#end

#macro PHW_1X1()
object{PHW_GRND(1,1)}
#end
#macro PHW_1X2()
object{PHW_GRND(1,2)}
#end
#macro PHW_1X3()
object{PHW_GRND(1,3)}
#end
#macro PHW_1X4()
object{PHW_GRND(1,4)}
#end
#macro PHW_1X5()
object{PHW_GRND(1,5)}
#end
#macro PHW_1X6()
object{PHW_GRND(1,6)}
#end
#macro PHW_1X7()
object{PHW_GRND(1,7)}
#end
#macro PHW_1X8()
object{PHW_GRND(1,8)}
#end
#macro PHW_1X9()
object{PHW_GRND(1,9)}
#end
#macro PHW_1X10()
object{PHW_GRND(1,10)}
#end
#macro PHW_1X11()
object{PHW_GRND(1,11)}
#end
#macro PHW_1X12()
object{PHW_GRND(1,12)}
#end
#macro PHW_1X13()
object{PHW_GRND(1,13)}
#end
#macro PHW_1X14()
object{PHW_GRND(1,14)}
#end
#macro PHW_1X15()
object{PHW_GRND(1,15)}
#end
#macro PHW_1X16()
object{PHW_GRND(1,16)}
#end
#macro PHW_1X17()
object{PHW_GRND(1,17)}
#end
#macro PHW_1X18()
object{PHW_GRND(1,18)}
#end
#macro PHW_1X19()
object{PHW_GRND(1,19)}
#end
#macro PHW_1X20()
object{PHW_GRND(1,20)}
#end
#macro PHW_1X21()
object{PHW_GRND(1,21)}
#end
#macro PHW_1X22()
object{PHW_GRND(1,22)}
#end
#macro PHW_1X23()
object{PHW_GRND(1,23)}
#end
#macro PHW_1X24()
object{PHW_GRND(1,24)}
#end
#macro PHW_1X25()
object{PHW_GRND(1,25)}
#end
#macro PHW_1X26()
object{PHW_GRND(1,26)}
#end
#macro PHW_1X27()
object{PHW_GRND(1,27)}
#end
#macro PHW_1X28()
object{PHW_GRND(1,28)}
#end
#macro PHW_1X29()
object{PHW_GRND(1,29)}
#end
#macro PHW_1X30()
object{PHW_GRND(1,30)}
#end
//Zweireihige Stiftleisten Winkel
#macro PHW_2X2()
object{PHW_GRND(2,2)}
#end
#macro PHW_2X3()
object{PHW_GRND(2,3)}
#end
#macro PHW_2X4()
object{PHW_GRND(2,4)}
#end
#macro PHW_2X5()
object{PHW_GRND(2,5)}
#end
#macro PHW_2X6()
object{PHW_GRND(2,6)}
#end
#macro PHW_2X7()
object{PHW_GRND(2,7)}
#end
#macro PHW_2X8()
object{PHW_GRND(2,8)}
#end
#macro PHW_2X9()
object{PHW_GRND(2,9)}
#end
#macro PHW_2X10()
object{PHW_GRND(2,10)}
#end
#macro PHW_2X11()
object{PHW_GRND(2,11)}
#end
#macro PHW_2X12()
object{PHW_GRND(2,12)}
#end
#macro PHW_2X13()
object{PHW_GRND(2,13)}
#end
#macro PHW_2X14()
object{PHW_GRND(2,14)}
#end
#macro PHW_2X15()
object{PHW_GRND(2,15)}
#end
#macro PHW_2X16()
object{PHW_GRND(2,16)}
#end
#macro PHW_2X17()
object{PHW_GRND(2,17)}
#end
#macro PHW_2X18()
object{PHW_GRND(2,18)}
#end
#macro PHW_2X19()
object{PHW_GRND(2,19)}
#end
#macro PHW_2X20()
object{PHW_GRND(2,20)}
#end
#macro PHW_2X21()
object{PHW_GRND(2,21)}
#end
#macro PHW_2X22()
object{PHW_GRND(2,22)}
#end
#macro PHW_2X23()
object{PHW_GRND(2,23)}
#end
#macro PHW_2X24()
object{PHW_GRND(2,24)}
#end
#macro PHW_2X25()
object{PHW_GRND(2,25)}
#end
#macro PHW_2X26()
object{PHW_GRND(2,26)}
#end
#macro PHW_2X27()
object{PHW_GRND(2,27)}
#end
#macro PHW_2X28()
object{PHW_GRND(2,28)}
#end
#macro PHW_2X29()
object{PHW_GRND(2,29)}
#end
#macro PHW_2X30()
object{PHW_GRND(2,30)}
#end

/********************************************************************************************************************************************
//Grundmakro Stiftleisten
//a = Rows
//b = Pins
//j = (0=no Jumper, 1=open, 2=closed)
//pitch = The space between two pins
********************************************************************************************************************************************/
#macro PH_GRND(a,b,j,pitch)
#if((a>1)|(b>1))
union{
#else
object{
#end
#if(a=1)
#local i=0;
        #while(i<b)
                object{PH() translate<i*2.54,0,0>}
                #local i=i+1;
        #end
        translate<-(b-1)*(2.54/2),0,0>
#else
        #local i=0;
        #while(i<b)
                object{PH() translate<i*2.54,0,-(2.54/2)>}
                object{PH() translate<i*2.54,0,(2.54/2)>}

                #if(j=1)
                object{CON_JUMPER() rotate<0,90,0> translate<i*2.54,0,(2.54)>}
                #end

                #if(j=2)
                object{CON_JUMPER() rotate<0,90,0> translate<i*2.54,0,0>}
                #end

                #local i=i+1;
        #end
        translate<-(b-1)*(2.54/2),0,0>
#end
scale (pitch/2.54)
}
#end

//Stiftleisten (2,54mm)
#macro PH_1X1()
object{PH_GRND(1,1,0,2.54)}
#end
#macro PH_1X2()
object{PH_GRND(1,2,0,2.54)}
#end
#macro PH_1X3()
object{PH_GRND(1,3,0,2.54)}
#end
#macro PH_1X4()
object{PH_GRND(1,4,0,2.54)}
#end
#macro PH_1X5()
object{PH_GRND(1,5,0,2.54)}
#end
#macro PH_1X6()
object{PH_GRND(1,6,0,2.54)}
#end
#macro PH_1X7()
object{PH_GRND(1,7,0,2.54)}
#end
#macro PH_1X8()
object{PH_GRND(1,8,0,2.54)}
#end
#macro PH_1X9()
object{PH_GRND(1,9,0,2.54)}
#end
#macro PH_1X10()
object{PH_GRND(1,10,0,2.54)}
#end
#macro PH_1X11()
object{PH_GRND(1,11,0,2.54)}
#end
#macro PH_1X12()
object{PH_GRND(1,12,0,2.54)}
#end
#macro PH_1X13()
object{PH_GRND(1,13,0,2.54)}
#end
#macro PH_1X14()
object{PH_GRND(1,14,0,2.54)}
#end
#macro PH_1X15()
object{PH_GRND(1,15,0,2.54)}
#end
#macro PH_1X16()
object{PH_GRND(1,16,0,2.54)}
#end
#macro PH_1X17()
object{PH_GRND(1,17,0,2.54)}
#end
#macro PH_1X18()
object{PH_GRND(1,18,0,2.54)}
#end
#macro PH_1X19()
object{PH_GRND(1,19,0,2.54)}
#end
#macro PH_1X20()
object{PH_GRND(1,20,0,2.54)}
#end
#macro PH_1X21()
object{PH_GRND(1,21,0,2.54)}
#end
#macro PH_1X22()
object{PH_GRND(1,22,0,2.54)}
#end
#macro PH_1X23()
object{PH_GRND(1,23,0,2.54)}
#end
#macro PH_1X24()
object{PH_GRND(1,24,0,2.54)}
#end
#macro PH_1X25()
object{PH_GRND(1,25,0,2.54)}
#end
#macro PH_1X26()
object{PH_GRND(1,26,0,2.54)}
#end
#macro PH_1X27()
object{PH_GRND(1,27,0,2.54)}
#end
#macro PH_1X28()
object{PH_GRND(1,28,0,2.54)}
#end
#macro PH_1X29()
object{PH_GRND(1,29,0,2.54)}
#end
#macro PH_1X30()
object{PH_GRND(1,30,0,2.54)}
#end
//Zweireihige Stiftleisten (2,54mm)
#macro PH_2X2()
object{PH_GRND(2,2,0,2.54)}
#end
#macro PH_2X3()
object{PH_GRND(2,3,0,2.54)}
#end
#macro PH_2X4()
object{PH_GRND(2,4,0,2.54)}
#end
#macro PH_2X5()
object{PH_GRND(2,5,0,2.54)}
#end
#macro PH_2X6()
object{PH_GRND(2,6,0,2.54)}
#end
#macro PH_2X7()
object{PH_GRND(2,7,0,2.54)}
#end
#macro PH_2X8()
object{PH_GRND(2,8,0,2.54)}
#end
#macro PH_2X9()
object{PH_GRND(2,9,0,2.54)}
#end
#macro PH_2X10()
object{PH_GRND(2,10,0,2.54)}
#end
#macro PH_2X11()
object{PH_GRND(2,11,0,2.54)}
#end
#macro PH_2X12()
object{PH_GRND(2,12,0,2.54)}
#end
#macro PH_2X13()
object{PH_GRND(2,13,0,2.54)}
#end
#macro PH_2X14()
object{PH_GRND(2,14,0,2.54)}
#end
#macro PH_2X15()
object{PH_GRND(2,15,0,2.54)}
#end
#macro PH_2X16()
object{PH_GRND(2,16,0,2.54)}
#end
#macro PH_2X17()
object{PH_GRND(2,17,0,2.54)}
#end
#macro PH_2X18()
object{PH_GRND(2,18,0,2.54)}
#end
#macro PH_2X19()
object{PH_GRND(2,19,0,2.54)}
#end
#macro PH_2X20()
object{PH_GRND(2,20,0,2.54)}
#end
#macro PH_2X21()
object{PH_GRND(2,21,0,2.54)}
#end
#macro PH_2X22()
object{PH_GRND(2,22,0,2.54)}
#end
#macro PH_2X23()
object{PH_GRND(2,23,0,2.54)}
#end
#macro PH_2X24()
object{PH_GRND(2,24,0,2.54)}
#end
#macro PH_2X25()
object{PH_GRND(2,25,0,2.54)}
#end
#macro PH_2X26()
object{PH_GRND(2,26,0,2.54)}
#end
#macro PH_2X27()
object{PH_GRND(2,27,0,2.54)}
#end
#macro PH_2X28()
object{PH_GRND(2,28,0,2.54)}
#end
#macro PH_2X29()
object{PH_GRND(2,29,0,2.54)}
#end
#macro PH_2X30()
object{PH_GRND(2,30,0,2.54)}
#end
//Zweireihige Stiftleisten (2,54) mit Jumper
#macro PH_2X1J(j)
object{PH_GRND(2,1,j,2.54)}
#end
#macro PH_2X2J(j)
object{PH_GRND(2,2,j,2.54)}
#end
#macro PH_2X3J(j)
object{PH_GRND(2,3,j,2.54)}
#end
#macro PH_2X4J(j)
object{PH_GRND(2,4,j,2.54)}
#end
#macro PH_2X5J(j)
object{PH_GRND(2,5,j,2.54)}
#end
#macro PH_2X6J(j)
object{PH_GRND(2,6,j,2.54)}
#end
#macro PH_2X7J(j)
object{PH_GRND(2,7,j,2.54)}
#end
#macro PH_2X8J(j)
object{PH_GRND(2,8,j,2.54)}
#end
#macro PH_2X9J(j)
object{PH_GRND(2,9,j,2.54)}
#end
#macro PH_2X10J(j)
object{PH_GRND(2,10,j,2.54)}
#end
//one row pinheader (2mm)
#macro PH_2MM_1X1()
object{PH_GRND(1,1,0,2.00)}
#end
#macro PH_2MM_1X2()
object{PH_GRND(1,2,0,2.00)}
#end
#macro PH_2MM_1X3()
object{PH_GRND(1,3,0,2.00)}
#end
#macro PH_2MM_1X4()
object{PH_GRND(1,4,0,2.00)}
#end
#macro PH_2MM_1X5()
object{PH_GRND(1,5,0,2.00)}
#end
#macro PH_2MM_1X6()
object{PH_GRND(1,6,0,2.00)}
#end
#macro PH_2MM_1X7()
object{PH_GRND(1,7,0,2.00)}
#end
#macro PH_2MM_1X8()
object{PH_GRND(1,8,0,2.00)}
#end
#macro PH_2MM_1X9()
object{PH_GRND(1,9,0,2.00)}
#end
#macro PH_2MM_1X10()
object{PH_GRND(1,10,0,2.00)}
#end
#macro PH_2MM_1X11()
object{PH_GRND(1,11,0,2.00)}
#end
#macro PH_2MM_1X12()
object{PH_GRND(1,12,0,2.00)}
#end
#macro PH_2MM_1X13()
object{PH_GRND(1,13,0,2.00)}
#end
#macro PH_2MM_1X14()
object{PH_GRND(1,14,0,2.00)}
#end
#macro PH_2MM_1X15()
object{PH_GRND(1,15,0,2.00)}
#end
#macro PH_2MM_1X16()
object{PH_GRND(1,16,0,2.00)}
#end
#macro PH_2MM_1X17()
object{PH_GRND(1,17,0,2.00)}
#end
#macro PH_2MM_1X18()
object{PH_GRND(1,18,0,2.00)}
#end
#macro PH_2MM_1X19()
object{PH_GRND(1,19,0,2.00)}
#end
#macro PH_2MM_1X20()
object{PH_GRND(1,20,0,2.00)}
#end
#macro PH_2MM_1X21()
object{PH_GRND(1,21,0,2.00)}
#end
#macro PH_2MM_1X22()
object{PH_GRND(1,22,0,2.00)}
#end
#macro PH_2MM_1X23()
object{PH_GRND(1,23,0,2.00)}
#end
#macro PH_2MM_1X24()
object{PH_GRND(1,24,0,2.00)}
#end
#macro PH_2MM_1X25()
object{PH_GRND(1,25,0,2.00)}
#end
#macro PH_2MM_1X26()
object{PH_GRND(1,26,0,2.00)}
#end
#macro PH_2MM_1X27()
object{PH_GRND(1,27,0,2.00)}
#end
#macro PH_2MM_1X28()
object{PH_GRND(1,28,0,2.00)}
#end
#macro PH_2MM_1X29()
object{PH_GRND(1,29,0,2.00)}
#end
#macro PH_2MM_1X30()
object{PH_GRND(1,30,0,2.00)}
#end
//two row pinheader (2mm)
#macro PH_2MM_2X2()
object{PH_GRND(2,2,0,2.00)}
#end
#macro PH_2MM_2X3()
object{PH_GRND(2,3,0,2.00)}
#end
#macro PH_2MM_2X4()
object{PH_GRND(2,4,0,2.00)}
#end
#macro PH_2MM_2X5()
object{PH_GRND(2,5,0,2.00)}
#end
#macro PH_2MM_2X6()
object{PH_GRND(2,6,0,2.00)}
#end
#macro PH_2MM_2X7()
object{PH_GRND(2,7,0,2.00)}
#end
#macro PH_2MM_2X8()
object{PH_GRND(2,8,0,2.00)}
#end
#macro PH_2MM_2X9()
object{PH_GRND(2,9,0,2.00)}
#end
#macro PH_2MM_2X10()
object{PH_GRND(2,10,0,2.00)}
#end
#macro PH_2MM_2X11()
object{PH_GRND(2,11,0,2.00)}
#end
#macro PH_2MM_2X12()
object{PH_GRND(2,12,0,2.00)}
#end
#macro PH_2MM_2X13()
object{PH_GRND(2,13,0,2.00)}
#end
#macro PH_2MM_2X14()
object{PH_GRND(2,14,0,2.00)}
#end
#macro PH_2MM_2X15()
object{PH_GRND(2,15,0,2.00)}
#end
#macro PH_2MM_2X16()
object{PH_GRND(2,16,0,2.00)}
#end
#macro PH_2MM_2X17()
object{PH_GRND(2,17,0,2.00)}
#end
#macro PH_2MM_2X18()
object{PH_GRND(2,18,0,2.00)}
#end
#macro PH_2MM_2X19()
object{PH_GRND(2,19,0,2.00)}
#end
#macro PH_2MM_2X20()
object{PH_GRND(2,20,0,2.00)}
#end
#macro PH_2MM_2X21()
object{PH_GRND(2,21,0,2.00)}
#end
#macro PH_2MM_2X22()
object{PH_GRND(2,22,0,2.00)}
#end
#macro PH_2MM_2X23()
object{PH_GRND(2,23,0,2.00)}
#end
#macro PH_2MM_2X24()
object{PH_GRND(2,24,0,2.00)}
#end
#macro PH_2MM_2X25()
object{PH_GRND(2,25,0,2.00)}
#end
#macro PH_2MM_2X26()
object{PH_GRND(2,26,0,2.00)}
#end
#macro PH_2MM_2X27()
object{PH_GRND(2,27,0,2.00)}
#end
#macro PH_2MM_2X28()
object{PH_GRND(2,28,0,2.00)}
#end
#macro PH_2MM_2X29()
object{PH_GRND(2,29,0,2.00)}
#end
#macro PH_2MM_2X30()
object{PH_GRND(2,30,0,2.00)}
#end
//two row pinheader (2mm) with jumper
#macro PH_2MM_2X1J(j)
object{PH_GRND(2,1,j,2.00)}
#end
#macro PH_2MM_2X2J(j)
object{PH_GRND(2,2,j,2.00)}
#end
#macro PH_2MM_2X3J(j)
object{PH_GRND(2,3,j,2.00)}
#end
#macro PH_2MM_2X4J(j)
object{PH_GRND(2,4,j,2.00)}
#end
#macro PH_2MM_2X5J(j)
object{PH_GRND(2,5,j,2.00)}
#end
#macro PH_2MM_2X6J(j)
object{PH_GRND(2,6,j,2.00)}
#end
#macro PH_2MM_2X7J(j)
object{PH_GRND(2,7,j,2.00)}
#end
#macro PH_2MM_2X8J(j)
object{PH_GRND(2,8,j,2.00)}
#end
#macro PH_2MM_2X9J(j)
object{PH_GRND(2,9,j,2.00)}
#end
#macro PH_2MM_2X10J(j)
object{PH_GRND(2,10,j,2.00)}
#end

/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// gerade Pfostenwannen
// Bezugspunkt: geometrische Mitte der Pins auf PCB-Oberflaeche
********************************************************************************************************************************************/
#macro CON_DIS_WS_XX_G_GRND(Pins)
union{
object{PFOSTENWANNE(7.62+Pins*1.27)}
object{PIN_STRAIGHT_ROW (Pins/2,2.54,0.635,8.5,3,col_gold) translate<0,0,-1.27>}
object{PIN_STRAIGHT_ROW (Pins/2,2.54,0.635,8.5,3,col_gold) translate<0,0,1.27>}}
#end

#macro CON_DIS_WS6G()
object{CON_DIS_WS_XX_G_GRND(6)}
#end
#macro CON_DIS_WS10G()
object{CON_DIS_WS_XX_G_GRND(10)}
#end
#macro CON_DIS_WS14G()
object{CON_DIS_WS_XX_G_GRND(14)}
#end
#macro CON_DIS_WS16G()
object{CON_DIS_WS_XX_G_GRND(16)}
#end
#macro CON_DIS_WS20G()
object{CON_DIS_WS_XX_G_GRND(20)}
#end
#macro CON_DIS_WS26G()
object{CON_DIS_WS_XX_G_GRND(26)}
#end
#macro CON_DIS_WS34G()
object{CON_DIS_WS_XX_G_GRND(34)}
#end
#macro CON_DIS_WS40G()
object{CON_DIS_WS_XX_G_GRND(40)}
#end
#macro CON_DIS_WS50G()
object{CON_DIS_WS_XX_G_GRND(50)}
#end
#macro CON_DIS_WS64G()
object{CON_DIS_WS_XX_G_GRND(64)}
#end

/********************************************************************************************************************************************
// Tilmann Reh <tilmann.reh(replace with at)autometer.de>
// abgewinkelte Pfostenwannen
// Bezugspunkt: mittig, 5.08mm vor der unteren/inneren Pinreihe.
********************************************************************************************************************************************/
#macro CON_DIS_WS_XX_W_GRND(Pins)
union{
object{PFOSTENWANNE(7.62+Pins*1.27) rotate<-90,0,0> translate<0,4.5,3.3>}
object{PIN_BENDED_ROW (Pins/2,2.54,0.635,0.8,4.5-1.27,3,10.5,col_gold) translate<0,0,5.08>}
object{PIN_BENDED_ROW (Pins/2,2.54,0.635,0.8,4.5+1.27,3,13.04,col_gold) translate<0,0,7.62>}}
#end

#macro CON_DIS_WS10W()
object{CON_DIS_WS_XX_W_GRND(10)}
#end
#macro CON_DIS_WS14W()
object{CON_DIS_WS_XX_W_GRND(14)}
#end
#macro CON_DIS_WS16W()
object{CON_DIS_WS_XX_W_GRND(16)}
#end
#macro CON_DIS_WS20W()
object{CON_DIS_WS_XX_W_GRND(20)}
#end
#macro CON_DIS_WS26W()
object{CON_DIS_WS_XX_W_GRND(26)}
#end
#macro CON_DIS_WS34W()
object{CON_DIS_WS_XX_W_GRND(34)}
#end
#macro CON_DIS_WS40W()
object{CON_DIS_WS_XX_W_GRND(40)}
#end
#macro CON_DIS_WS50W()
object{CON_DIS_WS_XX_W_GRND(50)}
#end
#macro CON_DIS_WS64W()
object{CON_DIS_WS_XX_W_GRND(64)}
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

