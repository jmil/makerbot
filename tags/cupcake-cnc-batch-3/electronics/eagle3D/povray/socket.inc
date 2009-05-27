//Eagle3D 1.05 INC-File  socket.inc
//created by: INC SRC Compiler v1.06
//created on: 13.11.2006 19:31:48
//(c) 2002-2004 by M. Weisser
//or the author of the macro

#ifndef(__socket_inc)
#declare __socket_inc = true;

#ifndef(inc_testmode)
#declare inc_testmode=true;
#include "tools.inc" 
#undef inc_testmode
#end

/********************************************************************************************************************************************
//Sockel Pin
********************************************************************************************************************************************/
#macro SOCKET_DIP_PIN()
difference{
union{
cylinder{<0,0,0><0,2.95,0>0.25}
sphere{<0,0,0>0.25}
cone{<0,2.95,0>0.25<0,3.45,0>0.6}
cylinder{<0,3.45,0><0,7.15,0>0.6}
cylinder{<0,6.4,0><0,7.15,0>0.85}}
cylinder{<0,4,0><0,7.16,0>0.5}
texture{col_silver}}
#end


/********************************************************************************************************************************************
// The following is a modified module section by Joseph Zeglinski   Aug. 20, 2003

// This macro now produces either a fully pin populated DIL SOCKET,  or a DIL SOCKET with fewer "quads" of pins.
// Example: Some IC's, FET's, Optoisolators and Crystal Oscillators - (8, 14, 16, or 24) pin body, with only 4, 6 or 12 outer pins.
// The " a= Available Pins" parameter is how many pins (modulo 4), are present on the intended DIL SOCKET.


//Grundmakro fuer DIL SOCKETS
//pin=Pincount of a full DIL
//a=Count of available pin positions, ( less than or equal to "pin" )
//breite=breite (in Raster)
********************************************************************************************************************************************/
#macro SOCKET_DIP_GRND(pin,a,breite)
union{
	difference{
		union{
			box{<-pin/4*2.54,0,breite/2+1.2><pin/4*2.54,2.8,breite/2-1.2>}
			box{<-pin/4*2.54,0,-breite/2-1.2><pin/4*2.54,2.8,-breite/2+1.2>}
		}
		#local i=0;
		#while(i<(a/4))
			#if((pin/4)=div(pin,4))
    			#local k = div(pin,4)-i-1;
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<k*2.54+1.27,-7.15+2.9,breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<-k*2.54-1.27,-7.15+2.9,breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<k*2.54+1.27,-7.15+2.9,-breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<-k*2.54-1.27,-7.15+2.9,-breite/2>}
			#else
				#local k = div(pin,4)-i;
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<k*2.54,-7.15+2.9,breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<-k*2.54,-7.15+2.9,breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<k*2.54,-7.15+2.9,-breite/2>}
				cylinder{<0,-0.1,0><0,8,0>0.51 translate<-k*2.54,-7.15+2.9,-breite/2>}
			#end
			#local i=i+1;
		#end
	}
	#local i=0;
	#while(i<(a/4))
		#if((pin/4)=div(pin,4))
			#local k = div(pin,4)-i-1;
			object{SOCKET_DIP_PIN() translate<k*2.54+1.27,-7.15+2.9,breite/2>}
			object{SOCKET_DIP_PIN() translate<-k*2.54-1.27,-7.15+2.9,breite/2>}
			object{SOCKET_DIP_PIN() translate<k*2.54+1.27,-7.15+2.9,-breite/2>}
			object{SOCKET_DIP_PIN() translate<-k*2.54-1.27,-7.15+2.9,-breite/2>}
		#else
			#local k = div(pin,4)-i;
			object{SOCKET_DIP_PIN() translate<k*2.54,-7.15+2.9,breite/2>}
			object{SOCKET_DIP_PIN() translate<-k*2.54,-7.15+2.9,breite/2>}
			object{SOCKET_DIP_PIN() translate<k*2.54,-7.15+2.9,-breite/2>}
			object{SOCKET_DIP_PIN() translate<-k*2.54,-7.15+2.9,-breite/2>}
		#end
		#local i=i+1;
	#end
	difference{
		box{<-pin/4*2.54,0,breite/2-1.2><-pin/4*2.54+2,2,-breite/2+1.2>}
		cylinder{<0,-0.1,0><0,3,0>1 translate<-pin/4*2.54-0.4,0,0>}
	}
	box{<pin/4*2.54,0,breite/2-1.2><pin/4*2.54-2,2,-breite/2+1.2>}
	#if((pin>19)&(pin<33))
		box{<-1,0,breite/2-1.2><1,2,-breite/2+1.2>}
	#end
	#if(pin>32)
		box{<-pin/12*2.54+1,0,breite/2-1.2><-pin/12*2.54-1,2,-breite/2+1.2>}
		box{<pin/12*2.54+1,0,breite/2-1.2><pin/12*2.54-1,2,-breite/2+1.2>}
	#end
	translate<0,0.1,0> 
	pigment{Gray10}
}
#end

//DIP8 with 4 corner pin sockets
#macro SOCKET_DIP8A4()
object{SOCKET_DIP_GRND(8,4,7.62)}
#end
//DIP14 with 4 corner pin sockets
#macro SOCKET_DIP14A4()
object{SOCKET_DIP_GRND(14,4,7.62)}
#end
//DIP14 with 8 corner pin sockets
#macro SOCKET_DIP14A8()
object{SOCKET_DIP_GRND(14,8,7.62)}
#end
//DIP16 with 4 corner pin sockets
#macro SOCKET_DIP16A4()
object{SOCKET_DIP_GRND(16,4,7.62)}
#end
//DIP16 with 8 corner pin sockets
#macro SOCKET_DIP16A8()
object{SOCKET_DIP_GRND(16,8,7.62)}
#end
//DIP24 with 12 corner pin sockets
#macro SOCKET_DIP24A12()
object{SOCKET_DIP_GRND(24,12,7.62)}
#end
#macro SOCKET_DIP2()
object{SOCKET_DIP_GRND(2,2,7.62)}
#end
#macro SOCKET_DIP4()
object{SOCKET_DIP_GRND(4,4,7.62)}
#end
#macro SOCKET_DIP6()
object{SOCKET_DIP_GRND(6,6,7.62)}
#end
#macro SOCKET_DIP6_4()
object{SOCKET_DIP_GRND(6,6,10.16)}
#end
#macro SOCKET_DIP8()
object{SOCKET_DIP_GRND(8,8,7.62)}
#end
#macro SOCKET_DIP14()
object{SOCKET_DIP_GRND(14,14,7.62)}
#end
#macro SOCKET_DIP16()
object{SOCKET_DIP_GRND(16,16,7.62)}
#end
#macro SOCKET_DIP18()
object{SOCKET_DIP_GRND(18,18,7.62)}
#end
#macro SOCKET_DIP20()
object{SOCKET_DIP_GRND(20,20,7.62)}
#end
#macro SOCKET_DIP22()
object{SOCKET_DIP_GRND(22,22,7.62)}
#end
#macro SOCKET_DIP22_4()
object{SOCKET_DIP_GRND(22,22,10.16)}
#end
#macro SOCKET_DIP24()
object{SOCKET_DIP_GRND(24,24,7.62)}
#end
#macro SOCKET_DIP24_4()
object{SOCKET_DIP_GRND(24,24,10.16)}
#end
#macro SOCKET_DIP24W()
object{SOCKET_DIP_GRND(24,24,15.24)}
#end
#macro SOCKET_DIP24_9()
object{SOCKET_DIP_GRND(24,24,22.86)}
#end
#macro SOCKET_DIP28()
object{SOCKET_DIP_GRND(28,28,7.62)}
#end
#macro SOCKET_DIP28_4()
object{SOCKET_DIP_GRND(28,28,10.16)}
#end
#macro SOCKET_DIP28W()
object{SOCKET_DIP_GRND(28,28,15.24)}
#end
#macro SOCKET_DIP32_3()
object{SOCKET_DIP_GRND(32,32,7.62)}
#end
#macro SOCKET_DIP32W()
object{SOCKET_DIP_GRND(32,32,15.24)}
#end
#macro SOCKET_DIP36W()
object{SOCKET_DIP_GRND(36,36,15.24)}
#end
#macro SOCKET_DIP40W()
object{SOCKET_DIP_GRND(40,40,15.24)}
#end
#macro SOCKET_DIP42W()
object{SOCKET_DIP_GRND(42,42,15.24)}
#end
#macro SOCKET_DIP48W()
object{SOCKET_DIP_GRND(48,48,15.24)}
#end
#macro SOCKET_DIP52W()
object{SOCKET_DIP_GRND(52,52,15.24)}
#end
#macro SOCKET_DIP64_9()
object{SOCKET_DIP_GRND(64,64,22.86)}
#end
#macro SOCKET_DIP68_9()
object{SOCKET_DIP_GRND(68,68,22.86)}
#end

/********************************************************************************************************************************************
//B    = Breite (Z-Achse)
//pin_l= Pins auf einer L-Seite
//pin_b= Pins auf einer B-Seite
//Li   = Laenge innen
//Bi   = Breite innen
//totalPins= Anzahl der Pins komplett
//pincL= Korrektur fuer Pinausrichtung auf L-Seite
//pincB= Korrektur fuer Pinausrichtung auf L-Seite
//chip = Der Chip fuer den Sockel
********************************************************************************************************************************************/
#macro SOCKET_PLCC_GRND(L,B,pin_l,pin_b,Li,Bi,totalPins,pincL,pincB,chip)

#local plcc20_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,2,1,1,1,2,0,0,0,0}
        {0,0,0,0,1,1,1,1,1,0,0,0,0}
        {0,0,0,0,1,1,0,1,1,0,0,0,0}
        {0,0,0,0,1,1,1,1,1,0,0,0,0}
        {0,0,0,0,2,1,1,1,2,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}

#local plcc28_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,2,1,1,1,1,2,0,0,0}
        {0,0,0,0,1,1,1,1,1,1,0,0,0}
        {0,0,0,0,1,1,0,0,1,1,0,0,0}
        {0,0,0,0,1,1,0,0,1,1,0,0,0}
        {0,0,0,0,1,1,1,1,1,1,0,0,0}
        {0,0,0,0,2,1,1,1,1,2,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}//Korrektur -1.27,-1.27

#local plcc32_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,2,1,1,1,1,2,0,0,0}
        {0,0,0,0,1,1,1,1,1,1,0,0,0}
        {0,0,0,0,1,1,0,0,1,1,0,0,0}
        {0,0,0,0,1,1,0,0,1,1,0,0,0}
        {0,0,0,0,1,1,0,0,1,1,0,0,0}
        {0,0,0,0,1,1,1,1,1,1,0,0,0}
        {0,0,0,0,2,1,1,1,1,2,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}//Korrektur -1.27,0

#local plcc44_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,2,1,1,1,1,1,1,2,0,0}
        {0,0,0,1,1,1,1,1,1,1,1,0,0}
        {0,0,0,1,1,0,0,0,0,1,1,0,0}
        {0,0,0,1,1,0,0,0,0,1,1,0,0}
        {0,0,0,1,1,0,0,0,0,1,1,0,0}
        {0,0,0,1,1,0,0,0,0,1,1,0,0}
        {0,0,0,1,1,1,1,1,1,1,1,0,0}
        {0,0,0,2,1,1,1,1,1,1,2,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}//Korrektur -1.27,-1.27

#local plcc52_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,2,1,1,1,1,1,1,1,2,0,0}
        {0,0,1,1,1,1,1,1,1,1,1,0,0}
        {0,0,1,1,0,0,0,0,0,1,1,0,0}
        {0,0,1,1,0,0,0,0,0,1,1,0,0}
        {0,0,1,1,0,0,0,0,0,1,1,0,0}
        {0,0,1,1,0,0,0,0,0,1,1,0,0}
        {0,0,1,1,0,0,0,0,0,1,1,0,0}
        {0,0,1,1,1,1,1,1,1,1,1,0,0}
        {0,0,2,1,1,1,1,1,1,1,2,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}

#local plcc68_pina = array[13][13]
{
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
        {0,2,1,1,1,1,1,1,1,1,1,2,0}
        {0,1,1,1,1,1,1,1,1,1,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,0,0,0,0,0,0,0,1,1,0}
        {0,1,1,1,1,1,1,1,1,1,1,1,0}
        {0,2,1,1,1,1,1,1,1,1,1,2,0}
        {0,0,0,0,0,0,0,0,0,0,0,0,0}
}

#local plcc84_pina = array[13][13]
{
        {2,1,1,1,1,1,1,1,1,1,1,1,2}
        {1,1,1,1,1,1,1,1,1,1,1,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,0,0,0,0,0,0,0,0,0,1,1}
        {1,1,1,1,1,1,1,1,1,1,1,1,1}
        {2,1,1,1,1,1,1,1,1,1,1,1,2}
}

#switch(totalPins)
  #case (20)
    #local pinar = plcc20_pina;
  #break
  #case (28)
    #local pinar = plcc28_pina;
  #break
  #case (32)
    #local pinar = plcc32_pina;
  #break
  #case (44)
    #local pinar = plcc44_pina;
  #break
  #case (52)
    #local pinar = plcc52_pina;
  #break
  #case (68)
    #local pinar = plcc68_pina;
  #break
  #case (84)
    #local pinar = plcc84_pina;
  #break  
  #else
    #local pinar = plcc20_pina;
#end

union{
	difference{
		union{
			box{<-L/2,0.6,-B/2+2><L/2,7.5,B/2-2>}
			box{<-L/2+2,0.6,-B/2><L/2-2,7.5,B/2>}
			cylinder{<-L/2+2,0.6,-B/2+2><-L/2+2,7.5,-B/2+2>,2}
			cylinder{<L/2-2,0.6,-B/2+2><L/2-2,7.5,-B/2+2>,2}
			cylinder{<-L/2+2,0.6,B/2-2><-L/2+2,7.5,B/2-2>,2}
			cylinder{<L/2-2,0.6,B/2-2><L/2-2,7.5,B/2-2>,2}
		}
		box{<-Li/2,2.6,-Bi/2><Li/2,7.6,Bi/2>}
		box{<sqrt(pow(L,2)+pow(B,2))/2-2.5,2.61,-0.8><-sqrt(pow(L,2)+pow(B,2))/2+2.5,7.6,0.8> rotate<0,-45,0>}
		
		#local i=0;
		#while (i<pin_l)
			box{<-0.3,2.61,0><0.3,7.6,-3> translate<1.27*i/2,0,Bi/2+2>}
			#if(i!=0) 
				box{<-0.3,2.61,0><0.3,7.6,-3> translate<-1.27*i/2,0,Bi/2+2>} 
			#end
			box{<-0.3,2.61,0><0.3,7.6,3> translate<1.27*i/2,0,-Bi/2-2>}
			#if(i!=0) 
				box{<-0.3,2.61,0><0.3,7.6,3> translate<-1.27*i/2,0,-Bi/2-2>} 
			#end
			#local i=i+2;
		#end
		
		#local i=0;
		#while (i<pin_b)
			box{<-3,2.61,0.3><0,7.6,-0.3> translate<Li/2+2,0,1.27*i/2>}
			#if(i!=0)
				box{<-3,2.61,0.3><0,7.6,-0.3> translate<Li/2+2,0,-1.27*i/2>} 
			#end
			box{<3,2.61,0.3><0,7.6,-0.3> translate<-Li/2-2,0,1.27*i/2>}
			#if(i!=0) 
				box{<3,2.61,0.3><0,7.6,-0.3> translate<-Li/2-2,0,-1.27*i/2>} 
			#end
			#local i=i+2;
		#end
		cylinder{<0,0,0><0,4,0>1.5}
		box{<-3,0,0><3,7.6,3> rotate<0,-45,0> translate<-L/2+1,0,B/2-1>}
		box{<-1,2.61,-1><1,7.6,1> rotate<0,-45,0> translate<-L/2+2.5,0,B/2-2.5>}
		box{<-1,2.61,-1><1,7.6,1> rotate<0,-45,0> translate<L/2-2,0,-B/2+2>}
	}
	box{<-1,1.5,0><1,7.5,1> rotate<0,-45,0> translate<-Li/2+0.5,0,Bi/2-0.5>}
	//Innere Kontaktfedern
	#local i=0;
	#while (i<pin_l)
		cylinder{<-0.25,5.5,Bi/2+1><0.25,5.5,Bi/2+1>0.8 texture{col_silver} translate<1.27*i/2,0,0>}
		#if(i!=0) 
			cylinder{<-0.25,5.5,Bi/2+1><0.25,5.5,Bi/2+1>0.8 texture{col_silver} translate<-1.27*i/2,0,0>} 
		#end
		cylinder{<-0.25,5.5,-Bi/2-1><0.25,5.5,-Bi/2-1>0.8 texture{col_silver} translate<1.27*i/2,0,0>}
		#if(i!=0) 
			cylinder{<-0.25,5.5,-Bi/2-1><0.25,5.5,-Bi/2-1>0.8 texture{col_silver} translate<-1.27*i/2,0,0>} 
		#end
		#local i=i+2;
	#end
	#local i=0;
	#while (i<pin_b)
		cylinder{<Li/2+1,5.5,-0.25><Li/2+1,5.5,0.25>0.8 texture{col_silver} translate<0,0,1.27*i/2>}
		#if(i!=0)
			cylinder{<Li/2+1,5.5,-0.25><Li/2+1,5.5,0.25>0.8 texture{col_silver} translate<0,0,-1.27*i/2>} 
		#end
		cylinder{<-Li/2-1,5.5,-0.25><-Li/2-1,5.5,0.25>0.8 texture{col_silver} translate<0,0,1.27*i/2>}
		#if(i!=0) 
			cylinder{<-Li/2-1,5.5,-0.25><-Li/2-1,5.5,0.25>0.8 texture{col_silver} translate<0,0,-1.27*i/2>} 
		#end
	#local i=i+2;
	#end
	//Pinplatzierung per Arrays
	union{
		#local i=-6;
		#while(i<7)
        	#local j=-6;
        	#while(j<7)
        		#if (pinar[i+6][j+6]=1)
        			box{<-0.25,0.6,-0.1><0.25,-3,0.1> texture{col_silver} translate<j*2.54,0,i*2.54>}
        		#end
        		#if (pinar[i+6][j+6]=2)
        			cylinder{<0,0.05,0><0,0.6,0>1 translate<j*2.54,0,i*2.54>}
        		#end
        	#local j=j+1;
        	#end
		#local i=i+1;
		#end
	object{chip translate<0,3.5,0> translate<-pincL,0,-pincB>}
	translate<pincL,0,pincB>}
	pigment{Gray40}
}
#end


#macro SOCKET_PLCC20(value)
object{SOCKET_PLCC_GRND(15.5,15.5,5,5,9,9,20,0,0,IC_SMD_PLCC20(value))}
#end
#macro SOCKET_PLCC28(value)
object{SOCKET_PLCC_GRND(18,18,7,7,11.5,11.5,28,-1.27,-1.27,IC_SMD_PLCC28(value))}
#end
#macro SOCKET_PLCC32(value)
object{SOCKET_PLCC_GRND(18,22.34,7,9,11.5,14,32,-1.27,0,IC_SMD_PLCC32(value))}
#end
#macro SOCKET_PLCC44(value)
object{SOCKET_PLCC_GRND(23.6,23.6,11,11,16.5,16.4,44,-1.27,-1.27,IC_SMD_PLCC44(value))}
#end
#macro SOCKET_PLCC52(value)
object{SOCKET_PLCC_GRND(25.9,25.9,13,13,19.2,19.2,52,0,0,IC_SMD_PLCC52(value))}
#end
#macro SOCKET_PLCC68(value)
object{SOCKET_PLCC_GRND(31.8,31.8,16,16,24.1,24.1,68,0,0,IC_SMD_PLCC68(value))}
#end
#macro SOCKET_PLCC84(value)
object{SOCKET_PLCC_GRND(36.7,36.7,21,21,29.3,29.3,84,0,0,IC_SMD_PLCC84(value))}
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

