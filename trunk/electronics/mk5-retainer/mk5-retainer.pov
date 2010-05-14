//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/mk5-retainer/mk5-retainer.brd
//5/14/10 3:45 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 144;
#local cam_z = -77;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 15;
#local lgt1_pos_y = 23;
#local lgt1_pos_z = 17;
#local lgt1_intense = 0.719680;
#local lgt2_pos_x = -15;
#local lgt2_pos_y = 23;
#local lgt2_pos_z = 17;
#local lgt2_intense = 0.719680;
#local lgt3_pos_x = 15;
#local lgt3_pos_y = 23;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.719680;
#local lgt4_pos_x = -15;
#local lgt4_pos_y = 23;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.719680;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 41.000000;
#declare pcb_y_size = 33.600000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(72);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-20.500000,0,-16.800000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MK5_RETAINER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<-20.500000,-14.000000><20.500000,-14.000000>
<20.500000,-14.000000><20.500000,19.600000>
<20.500000,19.600000><-20.500000,19.600000>
<-20.500000,19.600000><-20.500000,-14.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<0.000000,1,0.000000><0.000000,-5,0.000000>6.000000 texture{col_hls}}
cylinder{<6.610000,1,11.040000><6.610000,-5,11.040000>1.562500 texture{col_hls}}
cylinder{<-6.610000,1,11.040000><-6.610000,-5,11.040000>1.562500 texture{col_hls}}
cylinder{<-17.370000,1,-11.040000><-17.370000,-5,-11.040000>1.562500 texture{col_hls}}
cylinder{<17.370000,1,-11.040000><17.370000,-5,-11.040000>1.562500 texture{col_hls}}
cylinder{<-17.370000,1,16.600000><-17.370000,-5,16.600000>1.562500 texture{col_hls}}
cylinder{<17.370000,1,16.600000><17.370000,-5,16.600000>1.562500 texture{col_hls}}
cylinder{<6.610000,1,-11.040000><6.610000,-5,-11.040000>1.562500 texture{col_hls}}
cylinder{<-6.610000,1,-11.040000><-6.610000,-5,-11.040000>1.562500 texture{col_hls}}
cylinder{<-15.000000,1,-4.340000><-15.000000,-5,-4.340000>1.562500 texture{col_hls}}
cylinder{<15.000000,1,-4.340000><15.000000,-5,-4.340000>1.562500 texture{col_hls}}
cylinder{<15.000000,1,9.840000><15.000000,-5,9.840000>1.562500 texture{col_hls}}
cylinder{<-15.000000,1,9.840000><-15.000000,-5,9.840000>1.562500 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.000000,0.000000,3.000000>}#end		//Diskrete 5MM LED LED1  LED5MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<0.000000,0.000000,-11.000000>}#end		//Diskrete 5MM LED LED2  LED5MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-17.000000,0.000000,3.000000>}#end		//Diskrete 5MM LED LED3  LED5MM
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<-11.000000,0.000000,16.000000>}#end		//Diskrete 5MM LED LED4  LED5MM
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.000000,0.000000,16.000000>}#end		//Diskrete 5MM LED LED5  LED5MM
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<0.000000,0.000000,16.000000>}#end		//Diskrete 5MM LED LED6  LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-11.000000,0.000000,3.000000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R1  0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-8.000000,0.000000,3.000000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R2  0207/7
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.270000,2.540000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<-13.270000,0.000000,-11.970000>}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<17.000000,0,4.270000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<17.000000,0,1.730000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<1.270000,0,-11.000000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<-1.270000,0,-11.000000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-17.000000,0,4.270000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-17.000000,0,1.730000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<-12.270000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<-9.730000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<9.730000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.270000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<-1.270000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<1.270000,0,16.000000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-11.000000,0,6.810000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-11.000000,0,-0.810000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-8.000000,0,6.810000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-8.000000,0,-0.810000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,2.540000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<-10.730000,0.000000,-11.970000>}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-19.000000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-19.000000,0.000000,1.730000>}
box{<0,0,-0.203200><4.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-19.000000,0.000000,1.730000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,0.730000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,-6.000000>}
box{<0,0,-0.203200><6.730000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-18.000000,0.000000,-6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-19.000000,0.000000,1.730000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,0.730000>}
box{<0,0,-0.203200><1.414214,0.035000,0.203200> rotate<0,44.997030,0> translate<-19.000000,0.000000,1.730000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-19.000000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,7.000000>}
box{<0,0,-0.203200><1.414214,0.035000,0.203200> rotate<0,-44.997030,0> translate<-19.000000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,0.730000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-17.000000,0.000000,1.730000>}
box{<0,0,-0.203200><1.414214,0.035000,0.203200> rotate<0,-44.997030,0> translate<-18.000000,0.000000,0.730000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-17.000000,-1.535000,4.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-16.730000,-1.535000,4.000000>}
box{<0,0,-0.203200><0.381838,0.035000,0.203200> rotate<0,44.997030,0> translate<-17.000000,-1.535000,4.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-16.730000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-16.000000,-1.535000,4.000000>}
box{<0,0,-0.203200><0.730000,0.035000,0.203200> rotate<0,0.000000,0> translate<-16.730000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,7.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-14.000000,0.000000,7.000000>}
box{<0,0,-0.203200><4.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-18.000000,0.000000,7.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.270000,0.000000,-10.730000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.270000,0.000000,-11.970000>}
box{<0,0,-0.203200><1.240000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-13.270000,0.000000,-11.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-18.000000,0.000000,-6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.270000,0.000000,-10.730000>}
box{<0,0,-0.203200><6.689230,0.035000,0.203200> rotate<0,44.997030,0> translate<-18.000000,0.000000,-6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-16.000000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.000000,-1.535000,1.000000>}
box{<0,0,-0.203200><4.242641,0.035000,0.203200> rotate<0,44.997030,0> translate<-16.000000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.000000,-1.535000,-2.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.000000,-1.535000,1.000000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,90.000000,0> translate<-13.000000,-1.535000,1.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.270000,-1.535000,13.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.270000,-1.535000,16.000000>}
box{<0,0,-0.203200><2.730000,0.035000,0.203200> rotate<0,90.000000,0> translate<-12.270000,-1.535000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,6.810000>}
box{<0,0,-0.203200><1.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<-11.000000,0.000000,6.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-14.000000,0.000000,7.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,10.000000>}
box{<0,0,-0.203200><4.242641,0.035000,0.203200> rotate<0,-44.997030,0> translate<-14.000000,0.000000,7.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,10.000000>}
box{<0,0,-0.203200><1.000000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.000000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-11.970000>}
box{<0,0,-0.203200><7.970000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-10.730000,0.000000,-11.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,-0.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-1.080000>}
box{<0,0,-0.203200><0.381838,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.000000,0.000000,-0.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-1.080000>}
box{<0,0,-0.203200><2.920000,0.035000,0.203200> rotate<0,90.000000,0> translate<-10.730000,0.000000,-1.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-13.000000,-1.535000,-2.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.000000,-1.535000,-5.000000>}
box{<0,0,-0.203200><4.242641,0.035000,0.203200> rotate<0,44.997030,0> translate<-13.000000,-1.535000,-2.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.000000,0.000000,4.000000>}
box{<0,0,-0.203200><1.414214,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.000000,0.000000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.730000,0.000000,-4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,0.000000,-1.270000>}
box{<0,0,-0.203200><3.860803,0.035000,0.203200> rotate<0,-44.997030,0> translate<-10.730000,0.000000,-4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,0.000000,-0.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,0.000000,-1.270000>}
box{<0,0,-0.203200><0.460000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.000000,0.000000,-1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,-1.535000,9.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,-1.535000,6.810000>}
box{<0,0,-0.203200><2.190000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.000000,-1.535000,6.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.270000,-1.535000,13.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,-1.535000,9.000000>}
box{<0,0,-0.203200><6.038692,0.035000,0.203200> rotate<0,44.997030,0> translate<-12.270000,-1.535000,13.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.000000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,0.000000,14.000000>}
box{<0,0,-0.203200><4.242641,0.035000,0.203200> rotate<0,-44.997030,0> translate<-11.000000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.000000,-1.535000,-5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.000000,-1.535000,-5.000000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.000000,-1.535000,-5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.000000,0.000000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.000000,0.000000,4.000000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.000000,0.000000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.000000,0.000000,14.000000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.000000,-1.535000,-5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.270000,-1.535000,-8.730000>}
box{<0,0,-0.203200><5.275017,0.035000,0.203200> rotate<0,44.997030,0> translate<-7.000000,-1.535000,-5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.000000,0.000000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.000000,0.000000,8.000000>}
box{<0,0,-0.203200><5.656854,0.035000,0.203200> rotate<0,-44.997030,0> translate<-7.000000,0.000000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.000000,0.000000,12.000000>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,44.997030,0> translate<-5.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.270000,-1.535000,-8.730000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.270000,-1.535000,-11.000000>}
box{<0,0,-0.203200><3.025376,0.035000,0.203200> rotate<0,48.614893,0> translate<-3.270000,-1.535000,-8.730000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.730000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.270000,0.000000,16.000000>}
box{<0,0,-0.203200><8.460000,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.730000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,-11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.000000,0.000000,-11.000000>}
box{<0,0,-0.203200><0.730000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.270000,0.000000,-11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.000000,0.000000,8.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.000000,0.000000,8.000000>}
box{<0,0,-0.203200><6.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.000000,0.000000,8.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.000000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.000000,0.000000,12.000000>}
box{<0,0,-0.203200><6.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.000000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.000000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.000000,0.000000,14.000000>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.000000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.000000,0.000000,8.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.000000,0.000000,4.000000>}
box{<0,0,-0.203200><5.656854,0.035000,0.203200> rotate<0,44.997030,0> translate<3.000000,0.000000,8.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.730000,0.000000,16.000000>}
box{<0,0,-0.203200><8.460000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.270000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.270000,0.000000,14.000000>}
box{<0,0,-0.203200><5.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.270000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.270000,0.000000,16.000000>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.270000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.000000,0.000000,-11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.000000,0.000000,1.000000>}
box{<0,0,-0.203200><16.970563,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.000000,0.000000,-11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.000000,0.000000,1.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.270000,0.000000,1.000000>}
box{<0,0,-0.203200><2.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.000000,0.000000,1.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.000000,0.000000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.730000,0.000000,4.000000>}
box{<0,0,-0.203200><9.730000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.000000,0.000000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.270000,0.000000,1.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000000,0.000000,1.730000>}
box{<0,0,-0.203200><1.032376,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.270000,0.000000,1.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.730000,0.000000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000000,0.000000,4.270000>}
box{<0,0,-0.203200><0.381838,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.730000,0.000000,4.000000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<17.000000,0.038000,4.270000><17.000000,-1.538000,4.270000>0.406400}
cylinder{<17.000000,0.038000,1.730000><17.000000,-1.538000,1.730000>0.406400}
cylinder{<1.270000,0.038000,-11.000000><1.270000,-1.538000,-11.000000>0.406400}
cylinder{<-1.270000,0.038000,-11.000000><-1.270000,-1.538000,-11.000000>0.406400}
cylinder{<-17.000000,0.038000,4.270000><-17.000000,-1.538000,4.270000>0.406400}
cylinder{<-17.000000,0.038000,1.730000><-17.000000,-1.538000,1.730000>0.406400}
cylinder{<-12.270000,0.038000,16.000000><-12.270000,-1.538000,16.000000>0.406400}
cylinder{<-9.730000,0.038000,16.000000><-9.730000,-1.538000,16.000000>0.406400}
cylinder{<9.730000,0.038000,16.000000><9.730000,-1.538000,16.000000>0.406400}
cylinder{<12.270000,0.038000,16.000000><12.270000,-1.538000,16.000000>0.406400}
cylinder{<-1.270000,0.038000,16.000000><-1.270000,-1.538000,16.000000>0.406400}
cylinder{<1.270000,0.038000,16.000000><1.270000,-1.538000,16.000000>0.406400}
cylinder{<-11.000000,0.038000,6.810000><-11.000000,-1.538000,6.810000>0.406400}
cylinder{<-11.000000,0.038000,-0.810000><-11.000000,-1.538000,-0.810000>0.406400}
cylinder{<-8.000000,0.038000,6.810000><-8.000000,-1.538000,6.810000>0.406400}
cylinder{<-8.000000,0.038000,-0.810000><-8.000000,-1.538000,-0.810000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//GND silk screen
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.095000,0.000000,0.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.905000,0.000000,0.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.095000,0.000000,0.460000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<17.000000,0.000000,3.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<17.000000,0.000000,3.000000>}
difference{
cylinder{<17.000000,0,3.000000><17.000000,0.036000,3.000000>2.616200 translate<0,0.000000,0>}
cylinder{<17.000000,-0.1,3.000000><17.000000,0.135000,3.000000>2.463800 translate<0,0.000000,0>}}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-2.540000,0.000000,-9.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-2.540000,0.000000,-12.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,-90.000000,0> translate<-2.540000,0.000000,-12.905000> }
object{ARC(3.175000,0.254000,216.869898,503.130102,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,-11.000000>}
difference{
cylinder{<0.000000,0,-11.000000><0.000000,0.036000,-11.000000>2.616200 translate<0,0.000000,0>}
cylinder{<0.000000,-0.1,-11.000000><0.000000,0.135000,-11.000000>2.463800 translate<0,0.000000,0>}}
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-18.905000,0.000000,0.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-15.095000,0.000000,0.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<-18.905000,0.000000,0.460000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<-17.000000,0.000000,3.000000>}
difference{
cylinder{<-17.000000,0,3.000000><-17.000000,0.036000,3.000000>2.616200 translate<0,0.000000,0>}
cylinder{<-17.000000,-0.1,3.000000><-17.000000,0.135000,3.000000>2.463800 translate<0,0.000000,0>}}
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-8.460000,0.000000,14.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-8.460000,0.000000,17.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<-8.460000,0.000000,17.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<-11.000000,0.000000,16.000000>}
difference{
cylinder{<-11.000000,0,16.000000><-11.000000,0.036000,16.000000>2.616200 translate<0,0.000000,0>}
cylinder{<-11.000000,-0.1,16.000000><-11.000000,0.135000,16.000000>2.463800 translate<0,0.000000,0>}}
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.540000,0.000000,14.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.540000,0.000000,17.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.540000,0.000000,17.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<11.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<11.000000,0.000000,16.000000>}
difference{
cylinder{<11.000000,0,16.000000><11.000000,0.036000,16.000000>2.616200 translate<0,0.000000,0>}
cylinder{<11.000000,-0.1,16.000000><11.000000,0.135000,16.000000>2.463800 translate<0,0.000000,0>}}
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.540000,0.000000,14.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.540000,0.000000,17.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.540000,0.000000,17.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<0.000000,0.000000,16.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<0.000000,0.000000,16.000000>}
difference{
cylinder{<0.000000,0,16.000000><0.000000,0.036000,16.000000>2.616200 translate<0,0.000000,0>}
cylinder{<0.000000,-0.1,16.000000><0.000000,0.135000,16.000000>2.463800 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-11.000000,0.000000,6.810000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-11.000000,0.000000,6.429000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<-11.000000,0.000000,6.429000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<-10.111000,0.000000,5.921000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<-11.889000,0.000000,5.921000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<-11.889000,0.000000,0.079000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<-10.111000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.889000,0.000000,6.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.111000,0.000000,6.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.889000,0.000000,6.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,5.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,5.540000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-9.857000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.984000,0.000000,5.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,5.540000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-9.984000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,5.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,5.540000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.143000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.016000,0.000000,5.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,5.540000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-12.143000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.984000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,0.460000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-9.984000,0.000000,0.587000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.984000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.984000,0.000000,5.413000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.984000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.016000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,0.460000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-12.143000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.016000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.016000,0.000000,5.413000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<-12.016000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.857000,0.000000,0.460000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.857000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.143000,0.000000,0.460000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<-12.143000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.889000,0.000000,-0.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.111000,0.000000,-0.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.889000,0.000000,-0.175000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-11.000000,0.000000,-0.429000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-11.000000,0.000000,-0.810000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<-11.000000,0.000000,-0.810000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<-11.000000,0.000000,6.302000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<-11.000000,0.000000,-0.302000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-8.000000,0.000000,6.810000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-8.000000,0.000000,6.429000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<-8.000000,0.000000,6.429000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<-7.111000,0.000000,5.921000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<-8.889000,0.000000,5.921000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<-8.889000,0.000000,0.079000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<-7.111000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.889000,0.000000,6.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.111000,0.000000,6.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<-8.889000,0.000000,6.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,5.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,5.540000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-6.857000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.984000,0.000000,5.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,5.540000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-6.984000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,5.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,5.540000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-9.143000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.016000,0.000000,5.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,5.540000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-9.143000,0.000000,5.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.984000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,0.460000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-6.984000,0.000000,0.587000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.984000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.984000,0.000000,5.413000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<-6.984000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.016000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,0.460000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-9.143000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.016000,0.000000,0.587000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.016000,0.000000,5.413000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.016000,0.000000,5.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-6.857000,0.000000,0.460000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<-6.857000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,0.079000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.143000,0.000000,0.460000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.143000,0.000000,0.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.889000,0.000000,-0.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.111000,0.000000,-0.175000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<-8.889000,0.000000,-0.175000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-8.000000,0.000000,-0.429000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-8.000000,0.000000,-0.810000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<-8.000000,0.000000,-0.810000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<-8.000000,0.000000,6.302000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<-8.000000,0.000000,-0.302000>}
//VCC silk screen
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MK5_RETAINER(0.000000,0,-2.800000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND		SMD1,27-2,54
//VCC		SMD1,27-2,54
