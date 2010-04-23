//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/mk5-retainer/mk5-retainer.brd
//4/23/10 4:48 PM

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
#local cam_y = 180;
#local cam_z = -96;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
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

#local lgt1_pos_x = 12;
#local lgt1_pos_y = 23;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.719200;
#local lgt2_pos_x = -12;
#local lgt2_pos_y = 23;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.719200;
#local lgt3_pos_x = 12;
#local lgt3_pos_y = 23;
#local lgt3_pos_z = -15;
#local lgt3_intense = 0.719200;
#local lgt4_pos_x = -12;
#local lgt4_pos_y = 23;
#local lgt4_pos_z = -15;
#local lgt4_intense = 0.719200;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 32.000000;
#declare pcb_y_size = 42.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(909);
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
	//translate<-16.000000,0,-21.000000>
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
<-16.000000,-21.000000><16.000000,-21.000000>
<16.000000,-21.000000><16.000000,21.000000>
<16.000000,21.000000><-16.000000,21.000000>
<-16.000000,21.000000><-16.000000,-21.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<0.000000,1,0.000000><0.000000,-5,0.000000>6.000000 texture{col_hls}}
cylinder{<11.040000,1,6.662000><11.040000,-5,6.662000>1.562500 texture{col_hls}}
cylinder{<-11.040000,1,6.620000><-11.040000,-5,6.620000>1.562500 texture{col_hls}}
cylinder{<-11.040000,1,-6.620000><-11.040000,-5,-6.620000>1.562500 texture{col_hls}}
cylinder{<11.040000,1,-6.620000><11.040000,-5,-6.620000>1.562500 texture{col_hls}}
cylinder{<-12.870000,1,17.500000><-12.870000,-5,17.500000>1.562500 texture{col_hls}}
cylinder{<12.870000,1,17.500000><12.870000,-5,17.500000>1.562500 texture{col_hls}}
cylinder{<12.870000,1,-17.500000><12.870000,-5,-17.500000>1.562500 texture{col_hls}}
cylinder{<-12.870000,1,-17.500000><-12.870000,-5,-17.500000>1.562500 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<-7.000000,0.000000,-13.000000>}#end		//Diskrete 5MM LED LED1  LED5MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<0.000000,0.000000,-14.000000>}#end		//Diskrete 5MM LED LED2  LED5MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.000000,0.000000,-13.000000>}#end		//Diskrete 5MM LED LED3  LED5MM
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-7.000000,0.000000,13.000000>}#end		//Diskrete 5MM LED LED4  LED5MM
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.000000,0.000000,13.000000>}#end		//Diskrete 5MM LED LED5  LED5MM
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<0.000000,0.000000,14.000000>}#end		//Diskrete 5MM LED LED6  LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<0.000000,0.000000,-19.000000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R1  0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<0.000000,0.000000,19.000000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R2  0207/7
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.270000,2.540000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.970000,0.000000,-1.270000>}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<-7.000000,0,-14.270000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<-7.000000,0,-11.730000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<0.000000,0,-15.270000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<0.000000,0,-12.730000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.000000,0,-14.270000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.000000,0,-11.730000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-7.000000,0,14.270000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-7.000000,0,11.730000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.000000,0,14.270000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.000000,0,11.730000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<0.000000,0,15.270000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<0.000000,0,12.730000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<-3.810000,0,-19.000000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<3.810000,0,-19.000000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<-3.810000,0,19.000000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<3.810000,0,19.000000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,2.540000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.970000,0.000000,1.270000>}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,14.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,15.810000>}
box{<0,0,-0.304800><1.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<-7.000000,-1.535000,15.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-6.270000,-1.535000,11.730000>}
box{<0,0,-0.304800><0.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<-7.000000,-1.535000,11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,-11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-5.270000,-1.535000,-11.730000>}
box{<0,0,-0.304800><1.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<-7.000000,-1.535000,-11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,-14.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.810000,-1.535000,-17.460000>}
box{<0,0,-0.304800><4.511341,0.035000,0.304800> rotate<0,44.997030,0> translate<-7.000000,-1.535000,-14.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.810000,-1.535000,-19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.810000,-1.535000,-17.460000>}
box{<0,0,-0.304800><1.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<-3.810000,-1.535000,-17.460000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.000000,-1.535000,15.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.810000,-1.535000,19.000000>}
box{<0,0,-0.304800><4.511341,0.035000,0.304800> rotate<0,-44.997030,0> translate<-7.000000,-1.535000,15.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-6.270000,-1.535000,11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.000000,-1.535000,15.000000>}
box{<0,0,-0.304800><4.624478,0.035000,0.304800> rotate<0,-44.997030,0> translate<-6.270000,-1.535000,11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-5.270000,-1.535000,-11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-2.000000,-1.535000,-15.000000>}
box{<0,0,-0.304800><4.624478,0.035000,0.304800> rotate<0,44.997030,0> translate<-5.270000,-1.535000,-11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-2.000000,-1.535000,-15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-0.270000,-1.535000,-15.000000>}
box{<0,0,-0.304800><1.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<-2.000000,-1.535000,-15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.000000,-1.535000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-0.270000,-1.535000,15.000000>}
box{<0,0,-0.304800><2.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<-3.000000,-1.535000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-0.270000,-1.535000,-15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.000000,-1.535000,-15.270000>}
box{<0,0,-0.304800><0.381838,0.035000,0.304800> rotate<0,44.997030,0> translate<-0.270000,-1.535000,-15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-0.270000,-1.535000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.000000,-1.535000,15.270000>}
box{<0,0,-0.304800><0.381838,0.035000,0.304800> rotate<0,-44.997030,0> translate<-0.270000,-1.535000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.000000,-1.535000,-12.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.270000,-1.535000,-13.000000>}
box{<0,0,-0.304800><0.381838,0.035000,0.304800> rotate<0,44.997030,0> translate<0.000000,-1.535000,-12.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.270000,-1.535000,-13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.000000,-1.535000,-13.000000>}
box{<0,0,-0.304800><1.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.270000,-1.535000,-13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.000000,-1.535000,-13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.270000,-1.535000,-14.270000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<2.000000,-1.535000,-13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.000000,-1.535000,12.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.730000,-1.535000,12.730000>}
box{<0,0,-0.304800><3.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.000000,-1.535000,12.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,-19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,-8.890000>}
box{<0,0,-0.304800><10.110000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.810000,0.000000,-8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.730000,-1.535000,12.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.000000,-1.535000,14.000000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.730000,-1.535000,12.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.030000,0.000000,17.780000>}
box{<0,0,-0.304800><1.725341,0.035000,0.304800> rotate<0,44.997030,0> translate<3.810000,0.000000,19.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.000000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730000,-1.535000,14.000000>}
box{<0,0,-0.304800><1.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.000000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.270000,-1.535000,-14.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,-14.270000>}
box{<0,0,-0.304800><3.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.270000,-1.535000,-14.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,9.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,11.730000>}
box{<0,0,-0.304800><2.220000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.000000,-1.535000,11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.730000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,14.270000>}
box{<0,0,-0.304800><0.381838,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.730000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,0.000000,-11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.300000,0.000000,-11.430000>}
box{<0,0,-0.304800><0.424264,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.000000,0.000000,-11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,-11.730000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,-11.110000>}
box{<0,0,-0.304800><0.876812,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.000000,-1.535000,-11.730000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,-8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,-5.080000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.810000,0.000000,-8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,-5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,-1.270000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,-1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.000000,-1.535000,9.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,8.890000>}
box{<0,0,-0.304800><0.876812,0.035000,0.304800> rotate<0,44.997030,0> translate<7.000000,-1.535000,9.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,-11.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,8.890000>}
box{<0,0,-0.304800><20.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.620000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.030000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,17.780000>}
box{<0,0,-0.304800><2.590000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.030000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,-1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,1.270000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.620000,0.000000,-1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.300000,0.000000,-11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,-11.430000>}
box{<0,0,-0.304800><4.130000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.300000,0.000000,-11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,-11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,-8.890000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.430000,0.000000,-11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,-8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,-1.270000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.970000,0.000000,-1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,1.270000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,11.430000>}
box{<0,0,-0.304800><8.980256,0.035000,0.304800> rotate<0,44.997030,0> translate<7.620000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,11.430000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.970000,0.000000,11.430000> }
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
cylinder{<-7.000000,0.038000,-14.270000><-7.000000,-1.538000,-14.270000>0.406400}
cylinder{<-7.000000,0.038000,-11.730000><-7.000000,-1.538000,-11.730000>0.406400}
cylinder{<0.000000,0.038000,-15.270000><0.000000,-1.538000,-15.270000>0.406400}
cylinder{<0.000000,0.038000,-12.730000><0.000000,-1.538000,-12.730000>0.406400}
cylinder{<7.000000,0.038000,-14.270000><7.000000,-1.538000,-14.270000>0.406400}
cylinder{<7.000000,0.038000,-11.730000><7.000000,-1.538000,-11.730000>0.406400}
cylinder{<-7.000000,0.038000,14.270000><-7.000000,-1.538000,14.270000>0.406400}
cylinder{<-7.000000,0.038000,11.730000><-7.000000,-1.538000,11.730000>0.406400}
cylinder{<7.000000,0.038000,14.270000><7.000000,-1.538000,14.270000>0.406400}
cylinder{<7.000000,0.038000,11.730000><7.000000,-1.538000,11.730000>0.406400}
cylinder{<0.000000,0.038000,15.270000><0.000000,-1.538000,15.270000>0.406400}
cylinder{<0.000000,0.038000,12.730000><0.000000,-1.538000,12.730000>0.406400}
cylinder{<-3.810000,0.038000,-19.000000><-3.810000,-1.538000,-19.000000>0.406400}
cylinder{<3.810000,0.038000,-19.000000><3.810000,-1.538000,-19.000000>0.406400}
cylinder{<-3.810000,0.038000,19.000000><-3.810000,-1.538000,19.000000>0.406400}
cylinder{<3.810000,0.038000,19.000000><3.810000,-1.538000,19.000000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,2.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,3.703100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-13.923800,0.000000,3.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,3.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,3.160800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<-13.923800,0.000000,3.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,3.160800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,3.703100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<-13.381500,0.000000,3.160800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,3.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,2.076200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.839200,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,3.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,2.076200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.286700,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,2.618500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,3.703100>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<-12.286700,0.000000,2.618500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.015600,0.000000,2.889600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,2.076200>}
box{<0,0,-0.076200><1.150392,0.036000,0.076200> rotate<0,44.993509,0> translate<-12.015600,0.000000,2.889600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,3.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,3.703100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.649600,0.000000,3.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,3.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,2.889600>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<-10.649600,0.000000,2.889600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,2.889600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.107300,0.000000,3.160800>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,-26.567524,0> translate<-10.649600,0.000000,2.889600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.107300,0.000000,3.160800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.836200,0.000000,3.160800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.107300,0.000000,3.160800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.836200,0.000000,3.160800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,2.889600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<-9.836200,0.000000,3.160800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,2.889600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,2.347300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<-9.565000,0.000000,2.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,2.347300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.836200,0.000000,2.076200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<-9.836200,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.836200,0.000000,2.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,2.076200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.378500,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,2.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,2.347300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<-10.649600,0.000000,2.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,2.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,2.347300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.012500,0.000000,2.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,2.347300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,2.347300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.012500,0.000000,2.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,2.347300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,2.076200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<-8.741400,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,2.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,2.076200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.012500,0.000000,2.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,1.703100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-13.923800,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,1.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.110400,0.000000,1.703100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.110400,0.000000,1.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,1.432000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<-13.110400,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,1.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,0.889600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.839200,0.000000,0.889600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,0.889600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.110400,0.000000,0.618500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<-13.110400,0.000000,0.618500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.110400,0.000000,0.618500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,0.618500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,0.618500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,0.618500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,0.076200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<-13.381500,0.000000,0.618500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,1.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,1.703100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,1.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,0.076200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.286700,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,0.076200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,0.889600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.744400,0.000000,0.889600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,0.889600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.107300,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.107300,0.000000,1.703100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.107300,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,1.703100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.565000,0.000000,1.703100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.649600,0.000000,1.703100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,0.347300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.012500,0.000000,0.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,0.347300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,0.347300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.012500,0.000000,0.347300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,0.347300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,0.076200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<-8.741400,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.741400,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.012500,0.000000,0.076200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.012500,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-0.839200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<-13.923800,0.000000,-0.839200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-0.839200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,-0.296900>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<-13.923800,0.000000,-0.839200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,-0.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-0.839200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<-13.381500,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-0.839200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-1.923800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.839200,0.000000,-1.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-1.110400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-1.110400>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,-1.110400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.744400,0.000000,-1.923800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,-1.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.015600,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.015600,0.000000,-0.296900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-12.015600,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-0.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.744400,0.000000,-0.296900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.195300,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.195300,0.000000,-0.296900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.195300,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.195300,0.000000,-0.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.110700,0.000000,-1.923800>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<-11.195300,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.110700,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.110700,0.000000,-0.296900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.110700,0.000000,-0.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.558200,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.558200,0.000000,-1.652700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.558200,0.000000,-1.652700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.558200,0.000000,-1.652700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.287100,0.000000,-1.652700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.558200,0.000000,-1.652700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.287100,0.000000,-1.652700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.287100,0.000000,-1.923800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<-9.287100,0.000000,-1.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.287100,0.000000,-1.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.558200,0.000000,-1.923800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-9.558200,0.000000,-1.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-2.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-2.296900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,-2.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-2.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-3.923800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<-13.923800,0.000000,-3.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-3.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.839200,0.000000,-3.923800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,-3.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.923800,0.000000,-3.110400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-13.381500,0.000000,-3.110400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<-13.923800,0.000000,-3.110400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-3.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-2.296900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<-12.286700,0.000000,-2.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-2.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.473300,0.000000,-2.296900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,-2.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.473300,0.000000,-2.296900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,-2.568000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<-11.473300,0.000000,-2.296900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,-2.568000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,-3.110400>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<-11.202100,0.000000,-3.110400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,-3.110400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.473300,0.000000,-3.381500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<-11.473300,0.000000,-3.381500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.473300,0.000000,-3.381500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.286700,0.000000,-3.381500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<-12.286700,0.000000,-3.381500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.744400,0.000000,-3.381500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.202100,0.000000,-3.923800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<-11.744400,0.000000,-3.381500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,-3.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,-3.652700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.649600,0.000000,-3.652700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,-3.652700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,-3.652700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.649600,0.000000,-3.652700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,-3.652700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,-3.923800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<-10.378500,0.000000,-3.923800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.378500,0.000000,-3.923800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.649600,0.000000,-3.923800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.649600,0.000000,-3.923800> }
//GND silk screen
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-5.095000,0.000000,-10.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-8.905000,0.000000,-10.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<-8.905000,0.000000,-10.460000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,-13.000000>}
difference{
cylinder{<-7.000000,0,-13.000000><-7.000000,0.036000,-13.000000>2.616200 translate<0,0.000000,0>}
cylinder{<-7.000000,-0.1,-13.000000><-7.000000,0.135000,-13.000000>2.463800 translate<0,0.000000,0>}}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.905000,0.000000,-11.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-1.905000,0.000000,-11.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<-1.905000,0.000000,-11.460000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,-14.000000>}
difference{
cylinder{<0.000000,0,-14.000000><0.000000,0.036000,-14.000000>2.616200 translate<0,0.000000,0>}
cylinder{<0.000000,-0.1,-14.000000><0.000000,0.135000,-14.000000>2.463800 translate<0,0.000000,0>}}
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.905000,0.000000,-10.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.095000,0.000000,-10.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.095000,0.000000,-10.460000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,-13.000000>}
difference{
cylinder{<7.000000,0,-13.000000><7.000000,0.036000,-13.000000>2.616200 translate<0,0.000000,0>}
cylinder{<7.000000,-0.1,-13.000000><7.000000,0.135000,-13.000000>2.463800 translate<0,0.000000,0>}}
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-8.905000,0.000000,10.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-5.095000,0.000000,10.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<-8.905000,0.000000,10.460000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<-7.000000,0.000000,13.000000>}
difference{
cylinder{<-7.000000,0,13.000000><-7.000000,0.036000,13.000000>2.616200 translate<0,0.000000,0>}
cylinder{<-7.000000,-0.1,13.000000><-7.000000,0.135000,13.000000>2.463800 translate<0,0.000000,0>}}
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.095000,0.000000,10.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.905000,0.000000,10.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.095000,0.000000,10.460000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<7.000000,0.000000,13.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<7.000000,0.000000,13.000000>}
difference{
cylinder{<7.000000,0,13.000000><7.000000,0.036000,13.000000>2.616200 translate<0,0.000000,0>}
cylinder{<7.000000,-0.1,13.000000><7.000000,0.135000,13.000000>2.463800 translate<0,0.000000,0>}}
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-1.905000,0.000000,11.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.905000,0.000000,11.460000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<-1.905000,0.000000,11.460000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<0.000000,0.000000,14.000000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<0.000000,0.000000,14.000000>}
difference{
cylinder{<0.000000,0,14.000000><0.000000,0.036000,14.000000>2.616200 translate<0,0.000000,0>}
cylinder{<0.000000,-0.1,14.000000><0.000000,0.135000,14.000000>2.463800 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-3.810000,0.000000,-19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-3.429000,0.000000,-19.000000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<-3.810000,0.000000,-19.000000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<-2.921000,0.000000,-18.111000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<-2.921000,0.000000,-19.889000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<2.921000,0.000000,-19.889000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<2.921000,0.000000,-18.111000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.175000,0.000000,-19.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.175000,0.000000,-18.111000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<-3.175000,0.000000,-18.111000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.921000,0.000000,-17.857000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,-17.857000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.921000,0.000000,-17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,-17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,-17.857000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-2.540000,0.000000,-17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.921000,0.000000,-20.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,-20.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.921000,0.000000,-20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,-20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,-20.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-2.540000,0.000000,-20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,-17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,-17.857000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,-17.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,-17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,-17.984000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.413000,0.000000,-17.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,-20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,-20.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,-20.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,-20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,-20.016000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.413000,0.000000,-20.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,-17.857000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,-17.857000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.540000,0.000000,-17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,-20.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,-20.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.540000,0.000000,-20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,-19.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,-18.111000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,-18.111000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<3.429000,0.000000,-19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<3.810000,0.000000,-19.000000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<3.429000,0.000000,-19.000000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<-3.302000,0.000000,-19.000000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<3.302000,0.000000,-19.000000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-3.810000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<-3.429000,0.000000,19.000000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<-3.810000,0.000000,19.000000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<-2.921000,0.000000,19.889000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<-2.921000,0.000000,18.111000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<2.921000,0.000000,18.111000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<2.921000,0.000000,19.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.175000,0.000000,18.111000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.175000,0.000000,19.889000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<-3.175000,0.000000,19.889000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.921000,0.000000,20.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,20.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.921000,0.000000,20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,20.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<-2.540000,0.000000,20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.921000,0.000000,17.857000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,17.857000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.921000,0.000000,17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.540000,0.000000,17.857000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<-2.540000,0.000000,17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,20.143000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,20.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,20.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,20.016000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.413000,0.000000,20.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,17.857000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,17.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,17.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.413000,0.000000,17.984000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<-2.413000,0.000000,17.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,20.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,20.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.540000,0.000000,20.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,17.857000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,17.857000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.540000,0.000000,17.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,18.111000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,19.889000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.175000,0.000000,19.889000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<3.429000,0.000000,19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<3.810000,0.000000,19.000000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<3.429000,0.000000,19.000000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<-3.302000,0.000000,19.000000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<3.302000,0.000000,19.000000>}
//VCC silk screen
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MK5_RETAINER(0.000000,0,0.000000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND		SMD1,27-2,54
//VCC		SMD1,27-2,54
