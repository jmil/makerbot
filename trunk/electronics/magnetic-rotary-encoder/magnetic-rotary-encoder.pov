//POVRay-File created by 3d41.ulp v1.05
///home/nycresistor/reprap/trunk/reprap/electronics/Arduino/magnetic-rotary-encoder/magnetic-rotary-encoder.brd
// 5/20/2008 22:32:12 

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
#local cam_y = 225;
#local cam_z = -120;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
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
#local lgt1_pos_y = 29;
#local lgt1_pos_z = 27;
#local lgt1_intense = 0.731165;
#local lgt2_pos_x = -15;
#local lgt2_pos_y = 29;
#local lgt2_pos_z = 27;
#local lgt2_intense = 0.731165;
#local lgt3_pos_x = 15;
#local lgt3_pos_y = 29;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.731165;
#local lgt4_pos_x = -15;
#local lgt4_pos_y = 29;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.731165;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 41.513800;
#declare pcb_y_size = 52.549500;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(434);
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
	//translate<-20.756900,0,-26.274750>
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


#macro MAGNETIC_ROTARY_ENCODER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<3.307200,1.673000><44.803200,1.622200>
<44.803200,1.622200><44.785400,54.120900>
<44.785400,54.120900><3.289400,54.171700>
<3.289400,54.171700><3.307200,1.673000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<7.289800,1,50.165000><7.289800,-5,50.165000>1.500000 texture{col_hls}}
cylinder{<15.443200,1,14.986000><15.443200,-5,14.986000>1.500000 texture{col_hls}}
cylinder{<32.918400,1,14.986000><32.918400,-5,14.986000>1.500000 texture{col_hls}}
cylinder{<40.817800,1,50.165000><40.817800,-5,50.165000>1.500000 texture{col_hls}}
cylinder{<40.640000,1,5.715000><40.640000,-5,5.715000>1.500000 texture{col_hls}}
cylinder{<7.493000,1,5.842000><7.493000,-5,5.842000>1.500000 texture{col_hls}}
cylinder{<24.180800,1,35.001200><24.180800,-5,35.001200>3.049200 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_1206(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<7.874000,-0.000000,13.639800>translate<0,0.035000,0> }#end		//SMD Capacitor 1206 C1 100nF C1206
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_1206(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<14.605000,-0.000000,21.082000>translate<0,0.035000,0> }#end		//SMD Capacitor 1206 C6 10nF C1206
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP16("AS5040","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<24.180800,-0.000000,35.001200>translate<0,0.035000,0> }#end		//SSOP16 IC1 AS5040 SSOP16
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.493000,-0.000000,44.069000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R1 560 R1206
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_1206("472",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<34.213800,-0.000000,34.671000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R2 4.7K R1206
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_1206("472",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.182800,-0.000000,34.671000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R3 4.7K R1206
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.493000,-0.000000,40.513000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R4 560 R1206
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_1206("472",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<32.118800,-0.000000,22.749200>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R5 4.7K R1206
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<7.620000,-0.000000,36.703000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R6 560 R1206
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<7.620000,-0.000000,33.020000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R7 560 R1206
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-0.000000,0> rotate<0,0,0> translate<7.620000,-0.000000,29.210000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R8 560 R1206
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.975600,-0.000000,23.647400>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R9 560 R1206
#ifndef(pack_SV2) #declare global_pack_SV2=yes; object {CON_DIS_WS10G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.939200,-0.000000,6.508000>}#end		//Shrouded Header 10Pin SV2  ML10
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.474000,0.000000,13.639800>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.274000,0.000000,13.639800>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.033600,0.000000,22.783800>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.433600,0.000000,22.783800>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.366200,0.000000,31.162400>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.366200,0.000000,27.562400>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.208200,0.000000,31.264000>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.208200,0.000000,27.664000>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.683600,0.000000,18.643600>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.283600,0.000000,18.643600>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.205000,0.000000,21.082000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.005000,0.000000,21.082000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,37.276200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,36.626200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,35.976200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,35.326200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,34.676200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,34.026200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,33.376200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,32.726200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,32.726200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,33.376200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,34.026200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,34.676200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,35.326200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,35.976200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,36.626200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,37.276200>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.958000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.458000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.356400,0.000000,44.221400>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.856400,0.000000,44.221400>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.356400,0.000000,40.640000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.856400,0.000000,40.640000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.940600,0.000000,23.647400>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.440600,0.000000,23.647400>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.932600,0.000000,36.880800>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.432600,0.000000,36.880800>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.958000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.458000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.893000,0.000000,44.069000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.093000,0.000000,44.069000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.813800,0.000000,34.671000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.613800,0.000000,34.671000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.582800,0.000000,34.671000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.782800,0.000000,34.671000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.893000,0.000000,40.513000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.093000,0.000000,40.513000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.518800,0.000000,22.749200>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.718800,0.000000,22.749200>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.220000,0.000000,36.703000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.020000,0.000000,36.703000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.220000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.020000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.220000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.020000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.375600,0.000000,23.647400>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.575600,0.000000,23.647400>}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.019200,0,7.778000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.019200,0,5.238000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.479200,0,7.778000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.479200,0,5.238000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<23.939200,0,7.778000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<23.939200,0,5.238000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.399200,0,7.778000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.399200,0,5.238000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.859200,0,7.778000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.859200,0,5.238000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<22.225000,0,30.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<17.399000,0,25.349200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<36.830000,0,26.035000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.597400,-0.000000,12.623800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.622800,-0.000000,22.250400>}
box{<0,0,-0.152400><9.626634,0.035000,0.152400> rotate<0,-89.842894,0> translate<4.597400,-0.000000,12.623800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.723200,-0.000000,38.761500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.723300,-0.000000,38.761500>}
box{<0,0,-0.152400><0.000100,0.035000,0.152400> rotate<0,0.000000,0> translate<4.723200,-0.000000,38.761500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.723300,-0.000000,38.761500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.724400,-0.000000,38.760400>}
box{<0,0,-0.152400><0.001556,0.035000,0.152400> rotate<0,44.997030,0> translate<4.723300,-0.000000,38.761500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.775200,-0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.775200,-0.000000,38.963600>}
box{<0,0,-0.127000><11.277600,0.035000,0.127000> rotate<0,90.000000,0> translate<4.775200,-0.000000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.775200,-0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.813300,-0.000000,27.622500>}
box{<0,0,-0.127000><0.074053,0.035000,0.127000> rotate<0,59.032347,0> translate<4.775200,-0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.699000,-0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.986800,-0.000000,39.049000>}
box{<0,0,-0.152400><0.425940,0.035000,0.152400> rotate<0,-47.489724,0> translate<4.699000,-0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.775200,-0.000000,38.963600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.986800,-0.000000,39.049000>}
box{<0,0,-0.127000><0.228184,0.035000,0.127000> rotate<0,-21.977143,0> translate<4.775200,-0.000000,38.963600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.597400,-0.000000,12.623800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.613400,-0.000000,11.607800>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<4.597400,-0.000000,12.623800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-0.000000,44.069000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.715000,-0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,30.099000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,32.131000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.969000,-0.000000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,33.909000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,35.941000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.969000,-0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.986800,-0.000000,39.049000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.093000,-0.000000,40.256000>}
box{<0,0,-0.152400><1.637232,0.035000,0.152400> rotate<0,-47.492008,0> translate<4.986800,-0.000000,39.049000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.093000,-0.000000,40.513000>}
box{<0,0,-0.127000><0.738992,0.035000,0.127000> rotate<0,59.231785,0> translate<5.715000,-0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.093000,-0.000000,40.256000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.093000,-0.000000,40.513000>}
box{<0,0,-0.152400><0.257000,0.035000,0.152400> rotate<0,90.000000,0> translate<6.093000,-0.000000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.093000,-0.000000,44.069000>}
box{<0,0,-0.127000><0.378000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.715000,-0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.813300,-0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.172200,-0.000000,25.298400>}
box{<0,0,-0.152400><2.692220,0.035000,0.152400> rotate<0,59.681258,0> translate<4.813300,-0.000000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,30.099000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220000,-0.000000,29.210000>}
box{<0,0,-0.127000><0.923754,0.035000,0.127000> rotate<0,74.228621,0> translate<5.969000,-0.000000,30.099000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,29.289200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,29.210000>}
box{<0,0,-0.152400><0.079200,0.035000,0.152400> rotate<0,-90.000000,0> translate<6.220000,-0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.172200,-0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,29.289200>}
box{<0,0,-0.152400><0.067599,0.035000,0.152400> rotate<0,44.997030,0> translate<6.172200,-0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,26.901600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,29.289200>}
box{<0,0,-0.152400><2.387600,0.035000,0.152400> rotate<0,90.000000,0> translate<6.220000,-0.000000,29.289200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220000,-0.000000,33.020000>}
box{<0,0,-0.127000><0.923754,0.035000,0.127000> rotate<0,-74.228621,0> translate<5.969000,-0.000000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,33.909000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220000,-0.000000,33.020000>}
box{<0,0,-0.127000><0.923754,0.035000,0.127000> rotate<0,74.228621,0> translate<5.969000,-0.000000,33.909000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.969000,-0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220000,-0.000000,36.703000>}
box{<0,0,-0.127000><0.802275,0.035000,0.127000> rotate<0,-71.763571,0> translate<5.969000,-0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.969000,-0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.248400,-0.000000,19.304000>}
box{<0,0,-0.152400><0.306909,0.035000,0.152400> rotate<0,-24.442342,0> translate<5.969000,-0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.474000,-0.000000,13.639800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,14.859000>}
box{<0,0,-0.127000><1.219204,0.035000,0.127000> rotate<0,-89.853086,0> translate<6.474000,-0.000000,13.639800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,18.415000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.477000,-0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.093000,-0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,45.847000>}
box{<0,0,-0.127000><1.818994,0.035000,0.127000> rotate<0,-77.807709,0> translate<6.093000,-0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.622800,-0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.524800,-0.000000,23.669800>}
box{<0,0,-0.152400><2.373247,0.035000,0.152400> rotate<0,-36.730345,0> translate<4.622800,-0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.524800,-0.000000,23.669800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.575600,-0.000000,23.647400>}
box{<0,0,-0.152400><0.055519,0.035000,0.152400> rotate<0,23.793265,0> translate<6.524800,-0.000000,23.669800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.969000,-0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.683600,-0.000000,18.643600>}
box{<0,0,-0.152400><0.891722,0.035000,0.152400> rotate<0,36.736397,0> translate<5.969000,-0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.683600,-0.000000,18.643600>}
box{<0,0,-0.127000><0.308126,0.035000,0.127000> rotate<0,-47.890762,0> translate<6.477000,-0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.220000,-0.000000,26.901600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,-0.000000,26.136600>}
box{<0,0,-0.152400><1.081873,0.035000,0.152400> rotate<0,44.997030,0> translate<6.220000,-0.000000,26.901600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.474000,-0.000000,13.639800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-0.000000,13.208000>}
box{<0,0,-0.127000><0.878451,0.035000,0.127000> rotate<0,29.440371,0> translate<6.474000,-0.000000,13.639800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.613400,-0.000000,11.607800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.366000,-0.000000,11.607800>}
box{<0,0,-0.152400><1.752600,0.035000,0.152400> rotate<0,0.000000,0> translate<5.613400,-0.000000,11.607800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.172200,-0.000000,25.298400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.493000,-0.000000,25.273000>}
box{<0,0,-0.152400><1.321044,0.035000,0.152400> rotate<0,1.101633,0> translate<6.172200,-0.000000,25.298400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-0.000000,34.086800>}
box{<0,0,-0.152400><6.045200,0.035000,0.152400> rotate<0,90.000000,0> translate<7.620000,-0.000000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,-0.000000,26.136600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.797800,-0.000000,26.136600>}
box{<0,0,-0.152400><0.812800,0.035000,0.152400> rotate<0,0.000000,0> translate<6.985000,-0.000000,26.136600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.248400,-0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.950200,-0.000000,21.031200>}
box{<0,0,-0.152400><2.424736,0.035000,0.152400> rotate<0,-45.421408,0> translate<6.248400,-0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.493000,-0.000000,25.273000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.975600,-0.000000,24.663400>}
box{<0,0,-0.152400><0.777506,0.035000,0.152400> rotate<0,51.629107,0> translate<7.493000,-0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.950200,-0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.975600,-0.000000,24.663400>}
box{<0,0,-0.152400><3.632289,0.035000,0.152400> rotate<0,-89.593424,0> translate<7.950200,-0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-0.000000,34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.331200,-0.000000,34.798000>}
box{<0,0,-0.152400><1.005789,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,-0.000000,34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.797800,-0.000000,26.136600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.788400,-0.000000,25.146000>}
box{<0,0,-0.152400><1.400920,0.035000,0.152400> rotate<0,44.997030,0> translate<7.797800,-0.000000,26.136600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.093200,-0.000000,26.568400>}
box{<0,0,-0.152400><2.083419,0.035000,0.152400> rotate<0,44.997030,0> translate<7.620000,-0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-0.000000,18.415000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.271000,-0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.274000,-0.000000,13.639800>}
box{<0,0,-0.127000><1.219204,0.035000,0.127000> rotate<0,89.853086,0> translate<9.271000,-0.000000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.893000,-0.000000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-0.000000,40.513000>}
box{<0,0,-0.127000><1.013000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.893000,-0.000000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.274000,-0.000000,13.639800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-0.000000,13.208000>}
box{<0,0,-0.127000><0.873231,0.035000,0.127000> rotate<0,29.633871,0> translate<9.274000,-0.000000,13.639800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.283600,-0.000000,18.643600>}
box{<0,0,-0.127000><1.038083,0.035000,0.127000> rotate<0,-12.720737,0> translate<9.271000,-0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.283600,-0.000000,18.643600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.922000,-0.000000,19.177000>}
box{<0,0,-0.127000><0.831908,0.035000,0.127000> rotate<0,-39.877013,0> translate<10.283600,-0.000000,18.643600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-0.000000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.356400,-0.000000,40.640000>}
box{<0,0,-0.127000><1.455950,0.035000,0.127000> rotate<0,-5.003843,0> translate<9.906000,-0.000000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.893000,-0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.356400,-0.000000,44.221400>}
box{<0,0,-0.127000><2.468110,0.035000,0.127000> rotate<0,-3.539899,0> translate<8.893000,-0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.020000,-0.000000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.432600,-0.000000,36.880800>}
box{<0,0,-0.127000><2.419143,0.035000,0.127000> rotate<0,-4.214597,0> translate<9.020000,-0.000000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.020000,-0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.458000,-0.000000,29.210000>}
box{<0,0,-0.127000><2.438000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.020000,-0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.020000,-0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.458000,-0.000000,33.020000>}
box{<0,0,-0.127000><2.438000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.020000,-0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.375600,-0.000000,23.647400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.940600,-0.000000,23.647400>}
box{<0,0,-0.127000><2.565000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.375600,-0.000000,23.647400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.331200,-0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.827000,-0.000000,34.798000>}
box{<0,0,-0.152400><4.495800,0.035000,0.152400> rotate<0,0.000000,0> translate<8.331200,-0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.940600,-0.000000,23.647400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.928600,-0.000000,22.860000>}
box{<0,0,-0.127000><1.263385,0.035000,0.127000> rotate<0,38.551024,0> translate<11.940600,-0.000000,23.647400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.928600,-0.000000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.928600,-0.000000,22.860000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.928600,-0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.928600,-0.000000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.205000,-0.000000,21.082000>}
box{<0,0,-0.127000><0.930977,0.035000,0.127000> rotate<0,72.724149,0> translate<12.928600,-0.000000,21.971000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.233400,-0.000000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.233400,-0.000000,31.242000>}
box{<0,0,-0.152400><3.251200,0.035000,0.152400> rotate<0,90.000000,0> translate<13.233400,-0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.827000,-0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,-0.000000,35.636200>}
box{<0,0,-0.152400><1.185394,0.035000,0.152400> rotate<0,-44.997030,0> translate<12.827000,-0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.665200,-0.000000,35.636200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.741400,-0.000000,35.636200>}
box{<0,0,-0.152400><0.076200,0.035000,0.152400> rotate<0,0.000000,0> translate<13.665200,-0.000000,35.636200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.233400,-0.000000,27.990800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.817600,-0.000000,27.406600>}
box{<0,0,-0.152400><0.826184,0.035000,0.152400> rotate<0,44.997030,0> translate<13.233400,-0.000000,27.990800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.788400,-0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.503400,-0.000000,25.146000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,0.000000,0> translate<8.788400,-0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.922000,-0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.630400,-0.000000,19.253200>}
box{<0,0,-0.127000><3.709183,0.035000,0.127000> rotate<0,-1.177067,0> translate<10.922000,-0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,-0.000000,5.588000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<7.239000,-0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.884400,-0.000000,29.184600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.909800,-0.000000,29.210000>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.884400,-0.000000,29.184600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.859000,-0.000000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.932600,-0.000000,36.880800>}
box{<0,0,-0.152400><0.105941,0.035000,0.152400> rotate<0,45.991317,0> translate<14.859000,-0.000000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.859000,-0.000000,32.943800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.935200,-0.000000,33.020000>}
box{<0,0,-0.152400><0.107763,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.859000,-0.000000,32.943800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.932600,-0.000000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.935200,-0.000000,36.880800>}
box{<0,0,-0.152400><0.002600,0.035000,0.152400> rotate<0,0.000000,0> translate<14.932600,-0.000000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.909800,-0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,29.210000>}
box{<0,0,-0.152400><0.048200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.909800,-0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,30.223400>}
box{<0,0,-0.152400><1.013400,0.035000,0.152400> rotate<0,90.000000,0> translate<14.958000,-0.000000,30.223400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.935200,-0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,33.020000>}
box{<0,0,-0.152400><0.022800,0.035000,0.152400> rotate<0,0.000000,0> translate<14.935200,-0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,32.997200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,33.020000>}
box{<0,0,-0.152400><0.022800,0.035000,0.152400> rotate<0,90.000000,0> translate<14.958000,-0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.741400,-0.000000,35.636200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.960600,-0.000000,36.855400>}
box{<0,0,-0.152400><1.724209,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.741400,-0.000000,35.636200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.859000,-0.000000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.960600,-0.000000,36.855400>}
box{<0,0,-0.152400><0.143684,0.035000,0.152400> rotate<0,44.997030,0> translate<14.859000,-0.000000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.935200,-0.000000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.960600,-0.000000,36.855400>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<14.935200,-0.000000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.233400,-0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.986000,-0.000000,32.969200>}
box{<0,0,-0.152400><2.460656,0.035000,0.152400> rotate<0,-44.578848,0> translate<13.233400,-0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,32.997200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.986000,-0.000000,32.969200>}
box{<0,0,-0.152400><0.039598,0.035000,0.152400> rotate<0,44.997030,0> translate<14.958000,-0.000000,32.997200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.932600,-0.000000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.036800,-0.000000,36.880800>}
box{<0,0,-0.152400><0.104200,0.035000,0.152400> rotate<0,0.000000,0> translate<14.932600,-0.000000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.366000,-0.000000,11.607800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.062200,-0.000000,3.733800>}
box{<0,0,-0.152400><11.010512,0.035000,0.152400> rotate<0,45.651233,0> translate<7.366000,-0.000000,11.607800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.113000,-0.000000,8.128000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,44.997030,0> translate<10.033000,-0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.036800,-0.000000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-0.000000,36.677600>}
box{<0,0,-0.152400><0.287368,0.035000,0.152400> rotate<0,44.997030,0> translate<15.036800,-0.000000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.856400,-0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494000,-0.000000,39.497000>}
box{<0,0,-0.127000><1.308810,0.035000,0.127000> rotate<0,60.841883,0> translate<14.856400,-0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.856400,-0.000000,44.221400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494000,-0.000000,44.323000>}
box{<0,0,-0.127000><0.645644,0.035000,0.127000> rotate<0,-9.053226,0> translate<14.856400,-0.000000,44.221400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.630400,-0.000000,19.253200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.005000,-0.000000,21.082000>}
box{<0,0,-0.127000><2.287801,0.035000,0.127000> rotate<0,-53.066494,0> translate<14.630400,-0.000000,19.253200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.503400,-0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.052800,-0.000000,23.596600>}
box{<0,0,-0.152400><2.191182,0.035000,0.152400> rotate<0,44.997030,0> translate<14.503400,-0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.440600,-0.000000,23.647400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.129000,-0.000000,23.672800>}
box{<0,0,-0.152400><0.688868,0.035000,0.152400> rotate<0,-2.112953,0> translate<15.440600,-0.000000,23.647400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.052800,-0.000000,23.596600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.129000,-0.000000,23.672800>}
box{<0,0,-0.152400><0.107763,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.052800,-0.000000,23.596600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.440600,-0.000000,23.647400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.355000,-0.000000,22.628800>}
box{<0,0,-0.152400><1.368822,0.035000,0.152400> rotate<0,48.082418,0> translate<15.440600,-0.000000,23.647400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.005000,-0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.357600,-0.000000,21.945600>}
box{<0,0,-0.152400><0.932809,0.035000,0.152400> rotate<0,-67.785780,0> translate<16.005000,-0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.355000,-0.000000,22.628800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.357600,-0.000000,21.945600>}
box{<0,0,-0.152400><0.683205,0.035000,0.152400> rotate<0,89.776030,0> translate<16.355000,-0.000000,22.628800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.738600,-0.000000,36.677600>}
box{<0,0,-0.152400><1.498600,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,-0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.440600,-0.000000,23.647400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,23.825200>}
box{<0,0,-0.152400><1.410848,0.035000,0.152400> rotate<0,-7.239386,0> translate<15.440600,-0.000000,23.647400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,30.223400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,32.105600>}
box{<0,0,-0.152400><2.661833,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.958000,-0.000000,30.223400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,32.994600>}
box{<0,0,-0.152400><0.889000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.840200,-0.000000,32.994600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.935200,-0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,34.925000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.935200,-0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,23.825200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,-0.000000,25.349200>}
box{<0,0,-0.152400><1.623217,0.035000,0.152400> rotate<0,-69.859086,0> translate<16.840200,-0.000000,23.825200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.738600,-0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.440000,-0.000000,35.976200>}
box{<0,0,-0.152400><0.991929,0.035000,0.152400> rotate<0,44.997030,0> translate<16.738600,-0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,-1.535000,25.349200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,26.035000>}
box{<0,0,-0.152400><0.784527,0.035000,0.152400> rotate<0,-60.941374,0> translate<17.399000,-1.535000,25.349200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,32.994600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.881600,-0.000000,34.036000>}
box{<0,0,-0.152400><1.472762,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.840200,-0.000000,32.994600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.093200,-0.000000,26.568400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.135600,-0.000000,26.568400>}
box{<0,0,-0.152400><9.042400,0.035000,0.152400> rotate<0,0.000000,0> translate<9.093200,-0.000000,26.568400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,-0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,5.588000>}
box{<0,0,-0.127000><3.429000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.859000,-0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.113000,-0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,8.128000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.113000,-0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494000,-0.000000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,36.703000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,44.997030,0> translate<15.494000,-0.000000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.958000,-0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,-0.000000,29.210000>}
box{<0,0,-0.152400><3.634800,0.035000,0.152400> rotate<0,0.000000,0> translate<14.958000,-0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.062200,-0.000000,3.733800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.618200,-0.000000,3.733800>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.062200,-0.000000,3.733800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.135600,-0.000000,26.568400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.669000,-0.000000,26.035000>}
box{<0,0,-0.152400><0.754342,0.035000,0.152400> rotate<0,44.997030,0> translate<18.135600,-0.000000,26.568400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.859200,-0.000000,5.238000>}
box{<0,0,-0.127000><0.669903,0.035000,0.127000> rotate<0,31.495602,0> translate<18.288000,-0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.859200,-0.000000,7.778000>}
box{<0,0,-0.127000><0.669903,0.035000,0.127000> rotate<0,31.495602,0> translate<18.288000,-0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.840200,-0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.872200,-0.000000,34.925000>}
box{<0,0,-0.152400><2.032000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.840200,-0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.592800,-0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.126200,-0.000000,28.981400>}
box{<0,0,-0.152400><0.580322,0.035000,0.152400> rotate<0,23.197059,0> translate<18.592800,-0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.669000,-0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,26.035000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.669000,-0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,26.035000>}
box{<0,0,-0.152400><7.239000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.177000,-0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,33.147000>}
box{<0,0,-0.152400><1.143000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.177000,-0.000000,33.147000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-0.000000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,-0.000000,45.847000>}
box{<0,0,-0.127000><12.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.477000,-0.000000,45.847000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.872200,-0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.273400,-0.000000,35.326200>}
box{<0,0,-0.152400><0.567382,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.872200,-0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,33.147000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.406200,-0.000000,33.376200>}
box{<0,0,-0.152400><0.324138,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.177000,-0.000000,33.147000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,-0.000000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,36.703000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.288000,-0.000000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494000,-0.000000,44.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,40.132000>}
box{<0,0,-0.127000><5.926969,0.035000,0.127000> rotate<0,44.997030,0> translate<15.494000,-0.000000,44.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,40.132000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.685000,-0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-0.000000,17.780000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<19.177000,-0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.142200,-0.000000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-0.000000,17.780000>}
box{<0,0,-0.152400><11.328514,0.035000,0.152400> rotate<0,-89.737147,0> translate<20.142200,-0.000000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.817600,-0.000000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-0.000000,27.406600>}
box{<0,0,-0.152400><6.375400,0.035000,0.152400> rotate<0,0.000000,0> translate<13.817600,-0.000000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.881600,-0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.345400,-0.000000,34.036000>}
box{<0,0,-0.152400><2.463800,0.035000,0.152400> rotate<0,0.000000,0> translate<17.881600,-0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.345400,-0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.370800,-0.000000,34.061400>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.345400,-0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.406200,-0.000000,33.376200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,33.376200>}
box{<0,0,-0.152400><0.979600,0.035000,0.152400> rotate<0,0.000000,0> translate<19.406200,-0.000000,33.376200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,34.046400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,34.026200>}
box{<0,0,-0.152400><0.020200,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.385800,-0.000000,34.026200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.370800,-0.000000,34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,34.046400>}
box{<0,0,-0.152400><0.021213,0.035000,0.152400> rotate<0,44.997030,0> translate<20.370800,-0.000000,34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.273400,-0.000000,35.326200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,35.326200>}
box{<0,0,-0.152400><1.112400,0.035000,0.152400> rotate<0,0.000000,0> translate<19.273400,-0.000000,35.326200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.440000,-0.000000,35.976200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.385800,-0.000000,35.976200>}
box{<0,0,-0.152400><2.945800,0.035000,0.152400> rotate<0,0.000000,0> translate<17.440000,-0.000000,35.976200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,-0.000000,36.626200>}
box{<0,0,-0.127000><0.704996,0.035000,0.127000> rotate<0,6.253620,0> translate<19.685000,-0.000000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,-0.000000,37.276200>}
box{<0,0,-0.127000><0.725787,0.035000,0.127000> rotate<0,15.076875,0> translate<19.685000,-0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,-0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.904200,-0.000000,30.276800>}
box{<0,0,-0.152400><2.442630,0.035000,0.152400> rotate<0,44.997030,0> translate<19.177000,-0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-0.000000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.056600,-0.000000,26.543000>}
box{<0,0,-0.152400><1.221315,0.035000,0.152400> rotate<0,44.997030,0> translate<20.193000,-0.000000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.056600,-0.000000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-0.000000,26.543000>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,0.000000,0> translate<21.056600,-0.000000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,-0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,-0.000000,26.543000>}
box{<0,0,-0.127000><18.161000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.082000,-0.000000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.126200,-0.000000,28.981400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.209000,-0.000000,28.981400>}
box{<0,0,-0.152400><2.082800,0.035000,0.152400> rotate<0,0.000000,0> translate<19.126200,-0.000000,28.981400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,-0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399200,-0.000000,7.778000>}
box{<0,0,-0.127000><0.682226,0.035000,0.127000> rotate<0,62.288980,0> translate<21.082000,-0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.142200,-0.000000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.432000,-0.000000,5.238000>}
box{<0,0,-0.152400><1.770991,0.035000,0.152400> rotate<0,43.253680,0> translate<20.142200,-0.000000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.399200,-0.000000,5.238000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.432000,-0.000000,5.238000>}
box{<0,0,-0.152400><0.032800,0.035000,0.152400> rotate<0,0.000000,0> translate<21.399200,-0.000000,5.238000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.432000,-0.000000,5.238000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.463000,-0.000000,5.207000>}
box{<0,0,-0.152400><0.043841,0.035000,0.152400> rotate<0,44.997030,0> translate<21.432000,-0.000000,5.238000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.904200,-0.000000,30.276800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.021800,-0.000000,30.276800>}
box{<0,0,-0.152400><1.117600,0.035000,0.152400> rotate<0,0.000000,0> translate<20.904200,-0.000000,30.276800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-1.535000,30.480000>}
box{<0,0,-0.152400><6.286179,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.780000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.021800,-0.000000,30.276800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-0.000000,30.480000>}
box{<0,0,-0.152400><0.287368,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.021800,-0.000000,30.276800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.209000,-0.000000,28.981400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.707600,-0.000000,27.127200>}
box{<0,0,-0.152400><2.384085,0.035000,0.152400> rotate<0,51.050823,0> translate<21.209000,-0.000000,28.981400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.682200,-0.000000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.707600,-0.000000,27.127200>}
box{<0,0,-0.152400><20.726416,0.035000,0.152400> rotate<0,-89.923850,0> translate<22.682200,-0.000000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.682200,-0.000000,6.400800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.946600,-0.000000,5.238000>}
box{<0,0,-0.152400><1.717793,0.035000,0.152400> rotate<0,42.600248,0> translate<22.682200,-0.000000,6.400800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.939200,-0.000000,5.238000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.946600,-0.000000,5.238000>}
box{<0,0,-0.152400><0.007400,0.035000,0.152400> rotate<0,0.000000,0> translate<23.939200,-0.000000,5.238000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.939200,-0.000000,7.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-0.000000,8.382000>}
box{<0,0,-0.127000><0.682505,0.035000,0.127000> rotate<0,-62.244389,0> translate<23.939200,-0.000000,7.778000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-0.000000,26.238200>}
box{<0,0,-0.127000><17.856200,0.035000,0.127000> rotate<0,90.000000,0> translate<24.257000,-0.000000,26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-0.000000,26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-0.000000,26.289000>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,90.000000,0> translate<24.257000,-0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.257000,-0.000000,26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.282400,-0.000000,26.238200>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,0.000000,0> translate<24.257000,-0.000000,26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.282400,-0.000000,26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.333200,-0.000000,26.289000>}
box{<0,0,-0.152400><0.071842,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.282400,-0.000000,26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.333200,-0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.333200,-0.000000,28.600400>}
box{<0,0,-0.152400><2.311400,0.035000,0.152400> rotate<0,90.000000,0> translate<24.333200,-0.000000,28.600400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.374600,-0.000000,26.593800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.374800,-0.000000,26.593600>}
box{<0,0,-0.152400><0.000283,0.035000,0.152400> rotate<0,44.997030,0> translate<25.374600,-0.000000,26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.196800,-0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.399500,-0.000000,26.593600>}
box{<0,0,-0.127000><19.990628,0.035000,0.127000> rotate<0,-89.413124,0> translate<25.196800,-0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.374800,-0.000000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.399500,-0.000000,26.593600>}
box{<0,0,-0.152400><0.024700,0.035000,0.152400> rotate<0,0.000000,0> translate<25.374800,-0.000000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.399500,-0.000000,26.593600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-0.000000,26.670000>}
box{<0,0,-0.127000><0.076402,0.035000,0.127000> rotate<0,-89.619118,0> translate<25.399500,-0.000000,26.593600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.196800,-0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-0.000000,5.842000>}
box{<0,0,-0.127000><1.229738,0.035000,0.127000> rotate<0,38.287636,0> translate<25.196800,-0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.333200,-0.000000,28.600400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-0.000000,30.480000>}
box{<0,0,-0.152400><2.658156,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.333200,-0.000000,28.600400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-0.000000,30.530800>}
box{<0,0,-0.152400><0.050800,0.035000,0.152400> rotate<0,90.000000,0> translate<26.212800,-0.000000,30.530800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-0.000000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.479200,-0.000000,5.238000>}
box{<0,0,-0.127000><0.682226,0.035000,0.127000> rotate<0,62.288980,0> translate<26.162000,-0.000000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.479200,-0.000000,7.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,-0.000000,8.382000>}
box{<0,0,-0.127000><0.682505,0.035000,0.127000> rotate<0,-62.244389,0> translate<26.479200,-0.000000,7.778000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.771600,-0.000000,18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.797000,-0.000000,18.059400>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,0.000000,0> translate<26.771600,-0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,-0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,-0.000000,18.059400>}
box{<0,0,-0.127000><9.677400,0.035000,0.127000> rotate<0,90.000000,0> translate<26.797000,-0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.305000,-1.535000,30.480000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.225000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.618200,-0.000000,3.733800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.381200,-0.000000,3.733800>}
box{<0,0,-0.127000><8.763000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.618200,-0.000000,3.733800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,-0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,-0.000000,37.465000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.686000,-0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,-0.000000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,-0.000000,37.592000>}
box{<0,0,-0.127000><11.855299,0.035000,0.127000> rotate<0,44.129036,0> translate<19.177000,-0.000000,45.847000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.381200,-0.000000,3.733800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.762200,-0.000000,4.292600>}
box{<0,0,-0.127000><0.676327,0.035000,0.127000> rotate<0,-55.709446,0> translate<27.381200,-0.000000,3.733800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.762200,-0.000000,4.292600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.762200,-0.000000,6.223000>}
box{<0,0,-0.127000><1.930400,0.035000,0.127000> rotate<0,90.000000,0> translate<27.762200,-0.000000,6.223000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-0.000000,30.530800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.975800,-0.000000,32.293800>}
box{<0,0,-0.152400><2.493259,0.035000,0.152400> rotate<0,-44.997030,0> translate<26.212800,-0.000000,30.530800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.975800,-0.000000,32.293800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.975800,-0.000000,32.726200>}
box{<0,0,-0.152400><0.432400,0.035000,0.152400> rotate<0,90.000000,0> translate<27.975800,-0.000000,32.726200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,-0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,-0.000000,37.276200>}
box{<0,0,-0.127000><0.345875,0.035000,0.127000> rotate<0,33.081408,0> translate<27.686000,-0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.975800,-0.000000,36.626200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.193400,-0.000000,36.626200>}
box{<0,0,-0.152400><0.217600,0.035000,0.152400> rotate<0,0.000000,0> translate<27.975800,-0.000000,36.626200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,-0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,-0.000000,17.018000>}
box{<0,0,-0.152400><4.572000,0.035000,0.152400> rotate<0,90.000000,0> translate<28.194000,-0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.193400,-0.000000,36.626200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.244800,-0.000000,36.677600>}
box{<0,0,-0.152400><0.072691,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.193400,-0.000000,36.626200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.975800,-0.000000,34.026200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.285800,-0.000000,34.026200>}
box{<0,0,-0.152400><0.310000,0.035000,0.152400> rotate<0,0.000000,0> translate<27.975800,-0.000000,34.026200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.285800,-0.000000,34.026200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-0.000000,34.061400>}
box{<0,0,-0.152400><0.049780,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.285800,-0.000000,34.026200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-0.000000,34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.346400,-0.000000,34.036000>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,44.997030,0> translate<28.321000,-0.000000,34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,-0.000000,33.376200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,33.401000>}
box{<0,0,-0.127000><0.599713,0.035000,0.127000> rotate<0,-2.369878,0> translate<27.975800,-0.000000,33.376200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,-0.000000,34.026200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,34.036000>}
box{<0,0,-0.127000><0.599280,0.035000,0.127000> rotate<0,-0.936935,0> translate<27.975800,-0.000000,34.026200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,-0.000000,34.676200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,34.671000>}
box{<0,0,-0.127000><0.599223,0.035000,0.127000> rotate<0,0.497181,0> translate<27.975800,-0.000000,34.676200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,-0.000000,36.626200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,36.703000>}
box{<0,0,-0.127000><0.604102,0.035000,0.127000> rotate<0,-7.303348,0> translate<27.975800,-0.000000,36.626200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.762200,-0.000000,6.223000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,-0.000000,7.112000>}
box{<0,0,-0.127000><1.388662,0.035000,0.127000> rotate<0,-39.802944,0> translate<27.762200,-0.000000,6.223000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,-0.000000,33.401000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.575000,-0.000000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-0.000000,34.036000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.575000,-0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-0.000000,36.703000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.575000,-0.000000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,-0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.019200,-0.000000,7.778000>}
box{<0,0,-0.127000><0.692627,0.035000,0.127000> rotate<0,-74.056534,0> translate<28.829000,-0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.019200,-0.000000,7.778000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,-0.000000,8.382000>}
box{<0,0,-0.127000><0.607360,0.035000,0.127000> rotate<0,-83.964714,0> translate<29.019200,-0.000000,7.778000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,-0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.083000,-0.000000,11.557000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<28.194000,-0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.083000,-0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.083000,-0.000000,11.557000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.083000,-0.000000,11.557000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.019200,-0.000000,5.238000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,-0.000000,5.842000>}
box{<0,0,-0.127000><0.682505,0.035000,0.127000> rotate<0,-62.244389,0> translate<29.019200,-0.000000,5.238000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.829000,-0.000000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.337000,-0.000000,33.401000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.829000,-0.000000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.374600,-0.000000,26.593800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.768800,-0.000000,30.988000>}
box{<0,0,-0.152400><6.214337,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.374600,-0.000000,26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.337000,-0.000000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.768800,-0.000000,32.969200>}
box{<0,0,-0.152400><0.610657,0.035000,0.152400> rotate<0,44.997030,0> translate<29.337000,-0.000000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.768800,-0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.768800,-0.000000,32.969200>}
box{<0,0,-0.152400><1.981200,0.035000,0.152400> rotate<0,90.000000,0> translate<29.768800,-0.000000,32.969200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.244800,-0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-0.000000,36.677600>}
box{<0,0,-0.152400><1.854200,0.035000,0.152400> rotate<0,0.000000,0> translate<28.244800,-0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.346400,-0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.276800,-0.000000,34.036000>}
box{<0,0,-0.152400><1.930400,0.035000,0.152400> rotate<0,0.000000,0> translate<28.346400,-0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.771600,-0.000000,18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,22.006600>}
box{<0,0,-0.152400><5.582184,0.035000,0.152400> rotate<0,-44.997030,0> translate<26.771600,-0.000000,18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,22.006600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,22.749200>}
box{<0,0,-0.152400><0.742600,0.035000,0.152400> rotate<0,90.000000,0> translate<30.718800,-0.000000,22.749200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.276800,-0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,33.594000>}
box{<0,0,-0.152400><0.625082,0.035000,0.152400> rotate<0,44.997030,0> translate<30.276800,-0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,22.749200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.718800,-0.000000,33.594000>}
box{<0,0,-0.152400><10.844800,0.035000,0.152400> rotate<0,90.000000,0> translate<30.718800,-0.000000,33.594000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.445200,-0.000000,38.023800>}
box{<0,0,-0.152400><1.903814,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.099000,-0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,-0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-0.000000,20.828000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.194000,-0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.131000,-0.000000,20.828000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<32.004000,-0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.131000,-0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.131000,-0.000000,33.782000>}
box{<0,0,-0.127000><12.954000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.131000,-0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-0.000000,34.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.813800,-0.000000,34.671000>}
box{<0,0,-0.127000><4.238800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.575000,-0.000000,34.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.131000,-0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.813800,-0.000000,34.671000>}
box{<0,0,-0.127000><1.120954,0.035000,0.127000> rotate<0,-52.470329,0> translate<32.131000,-0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.337000,-0.000000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-0.000000,5.842000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.337000,-0.000000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.305000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,24.765000>}
box{<0,0,-0.152400><8.082231,0.035000,0.152400> rotate<0,44.997030,0> translate<27.305000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.518800,-0.000000,22.716800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.518800,-0.000000,22.749200>}
box{<0,0,-0.152400><0.032400,0.035000,0.152400> rotate<0,90.000000,0> translate<33.518800,-0.000000,22.749200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.518800,-0.000000,22.716800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.553400,-0.000000,22.682200>}
box{<0,0,-0.152400><0.048932,0.035000,0.152400> rotate<0,44.997030,0> translate<33.518800,-0.000000,22.716800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.553400,-0.000000,22.682200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,23.495000>}
box{<0,0,-0.152400><1.149473,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.553400,-0.000000,22.682200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,27.562400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,27.254200>}
box{<0,0,-0.152400><0.308200,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.366200,-0.000000,27.254200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,27.562400>}
box{<0,0,-0.152400><4.067400,0.035000,0.152400> rotate<0,90.000000,0> translate<34.366200,-0.000000,27.562400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.366200,-0.000000,27.562400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.769200,-0.000000,27.562400>}
box{<0,0,-0.203200><0.403000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.366200,-0.000000,27.562400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.366200,-0.000000,31.162400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-0.000000,32.385000>}
box{<0,0,-0.127000><1.401810,0.035000,0.127000> rotate<0,-60.706370,0> translate<34.366200,-0.000000,31.162400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-0.000000,33.782000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.052000,-0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,24.765000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.613800,-0.000000,34.671000>}
box{<0,0,-0.127000><1.051637,0.035000,0.127000> rotate<0,-57.705516,0> translate<35.052000,-0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.613800,-0.000000,34.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,-0.000000,35.560000>}
box{<0,0,-0.127000><1.136604,0.035000,0.127000> rotate<0,-51.454886,0> translate<35.613800,-0.000000,34.671000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-0.000000,24.765000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.830000,-0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,26.035000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.560000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,-0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,-0.000000,36.449000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.322000,-0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.366200,-0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.693600,-0.000000,23.495000>}
box{<0,0,-0.152400><3.327400,0.035000,0.152400> rotate<0,0.000000,0> translate<34.366200,-0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.693600,-0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.404800,-0.000000,22.783800>}
box{<0,0,-0.152400><1.005789,0.035000,0.152400> rotate<0,44.997030,0> translate<37.693600,-0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.404800,-0.000000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.433600,-0.000000,22.783800>}
box{<0,0,-0.152400><0.028800,0.035000,0.152400> rotate<0,0.000000,0> translate<38.404800,-0.000000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.433600,-0.000000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.433600,-0.000000,22.787200>}
box{<0,0,-0.152400><0.003400,0.035000,0.152400> rotate<0,90.000000,0> translate<38.433600,-0.000000,22.787200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.433600,-0.000000,22.787200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.557200,-0.000000,22.910800>}
box{<0,0,-0.152400><0.174797,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.433600,-0.000000,22.787200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.557200,-0.000000,22.910800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.557200,-0.000000,25.450800>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.557200,-0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.433600,-0.000000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.658800,-0.000000,22.783800>}
box{<0,0,-0.152400><0.225200,0.035000,0.152400> rotate<0,0.000000,0> translate<38.433600,-0.000000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,-0.000000,22.860000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<36.830000,-0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.658800,-0.000000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,-0.000000,22.860000>}
box{<0,0,-0.152400><0.107763,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.658800,-0.000000,22.783800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.782800,-0.000000,34.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-0.000000,33.782000>}
box{<0,0,-0.127000><1.140352,0.035000,0.127000> rotate<0,51.219109,0> translate<38.782800,-0.000000,34.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-0.000000,33.782000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.497000,-0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-0.000000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-0.000000,12.954000>}
box{<0,0,-0.203200><10.057887,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.020000,-0.000000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-0.000000,16.510000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.132000,-0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,-0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.132000,-0.000000,36.449000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.211000,-0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.557200,-0.000000,25.450800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.208200,-0.000000,27.101800>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.557200,-0.000000,25.450800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.208200,-0.000000,27.101800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.208200,-0.000000,27.664000>}
box{<0,0,-0.152400><0.562200,0.035000,0.152400> rotate<0,90.000000,0> translate<40.208200,-0.000000,27.664000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.208200,-0.000000,31.264000>}
box{<0,0,-0.127000><1.436422,0.035000,0.127000> rotate<0,60.318423,0> translate<39.497000,-0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.233600,-0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.258800,-0.000000,16.763600>}
box{<0,0,-0.152400><7.747441,0.035000,0.152400> rotate<0,89.807707,0> translate<40.233600,-0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.220900,-0.000000,16.725900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.259000,-0.000000,16.687800>}
box{<0,0,-0.152400><0.053882,0.035000,0.152400> rotate<0,44.997030,0> translate<40.220900,-0.000000,16.725900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.258800,-0.000000,16.763600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.259000,-0.000000,16.687800>}
box{<0,0,-0.152400><0.075800,0.035000,0.152400> rotate<0,89.842894,0> translate<40.258800,-0.000000,16.763600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385600,-0.000000,16.763600>}
box{<0,0,-0.203200><0.358645,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.132000,-0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.258800,-0.000000,16.763600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385600,-0.000000,16.763600>}
box{<0,0,-0.203200><0.126800,0.035000,0.203200> rotate<0,0.000000,0> translate<40.258800,-0.000000,16.763600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385600,-0.000000,16.763600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,-0.000000,16.764000>}
box{<0,0,-0.203200><0.000566,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.385600,-0.000000,16.763600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,-0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,-0.000000,35.941000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.513000,-0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.132000,-0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,-0.000000,36.068000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<40.132000,-0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.233600,-0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.741600,-0.000000,24.968200>}
box{<0,0,-0.152400><0.683444,0.035000,0.152400> rotate<0,-41.984442,0> translate<40.233600,-0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.208200,-0.000000,31.264000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-0.000000,29.972000>}
box{<0,0,-0.127000><1.462732,0.035000,0.127000> rotate<0,62.036322,0> translate<40.208200,-0.000000,31.264000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,-0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-0.000000,35.560000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<40.513000,-0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.944800,-0.000000,35.458400>}
box{<0,0,-0.127000><0.113592,0.035000,0.127000> rotate<0,63.430762,0> translate<40.894000,-0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.741600,-0.000000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-0.000000,24.968200>}
box{<0,0,-0.152400><0.533400,0.035000,0.152400> rotate<0,0.000000,0> translate<40.741600,-0.000000,24.968200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-0.000000,29.464000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<40.894000,-0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,-0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.579800,-0.000000,29.464000>}
box{<0,0,-0.152400><0.177800,0.035000,0.152400> rotate<0,0.000000,0> translate<41.402000,-0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.944800,-0.000000,35.458400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.582800,-0.000000,34.671000>}
box{<0,0,-0.127000><1.013431,0.035000,0.127000> rotate<0,50.980113,0> translate<40.944800,-0.000000,35.458400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.445200,-0.000000,38.023800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.706800,-0.000000,38.023800>}
box{<0,0,-0.152400><10.261600,0.035000,0.152400> rotate<0,0.000000,0> translate<31.445200,-0.000000,38.023800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.033600,-0.000000,22.783800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.033600,-0.000000,24.304400>}
box{<0,0,-0.152400><1.520600,0.035000,0.152400> rotate<0,90.000000,0> translate<42.033600,-0.000000,24.304400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-0.000000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.037000,-0.000000,25.730200>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.275000,-0.000000,24.968200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.579800,-0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.037000,-0.000000,29.006800>}
box{<0,0,-0.152400><0.646578,0.035000,0.152400> rotate<0,44.997030,0> translate<41.579800,-0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.037000,-0.000000,25.730200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.037000,-0.000000,29.006800>}
box{<0,0,-0.152400><3.276600,0.035000,0.152400> rotate<0,90.000000,0> translate<42.037000,-0.000000,29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.033600,-0.000000,24.304400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.383200,-0.000000,25.654000>}
box{<0,0,-0.152400><1.908623,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.033600,-0.000000,24.304400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.706800,-0.000000,38.023800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.383200,-0.000000,36.347400>}
box{<0,0,-0.152400><2.370788,0.035000,0.152400> rotate<0,44.997030,0> translate<41.706800,-0.000000,38.023800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.383200,-0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.383200,-0.000000,36.347400>}
box{<0,0,-0.152400><10.693400,0.035000,0.152400> rotate<0,90.000000,0> translate<43.383200,-0.000000,36.347400> }
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
cylinder{<29.019200,0.038000,7.778000><29.019200,-1.538000,7.778000>0.457200}
cylinder{<29.019200,0.038000,5.238000><29.019200,-1.538000,5.238000>0.457200}
cylinder{<26.479200,0.038000,7.778000><26.479200,-1.538000,7.778000>0.457200}
cylinder{<26.479200,0.038000,5.238000><26.479200,-1.538000,5.238000>0.457200}
cylinder{<23.939200,0.038000,7.778000><23.939200,-1.538000,7.778000>0.457200}
cylinder{<23.939200,0.038000,5.238000><23.939200,-1.538000,5.238000>0.457200}
cylinder{<21.399200,0.038000,7.778000><21.399200,-1.538000,7.778000>0.457200}
cylinder{<21.399200,0.038000,5.238000><21.399200,-1.538000,5.238000>0.457200}
cylinder{<18.859200,0.038000,7.778000><18.859200,-1.538000,7.778000>0.457200}
cylinder{<18.859200,0.038000,5.238000><18.859200,-1.538000,5.238000>0.457200}
//Holes(fast)/Vias
cylinder{<22.225000,0.038000,30.480000><22.225000,-1.538000,30.480000>0.300000 }
cylinder{<17.399000,0.038000,25.349200><17.399000,-1.538000,25.349200>0.300000 }
cylinder{<36.830000,0.038000,26.035000><36.830000,-1.538000,26.035000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.128500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.128500,0.000000,52.997900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<12.128500,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.128500,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.442000,0.000000,52.684300>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<12.128500,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.442000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.755500,0.000000,52.997900>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<12.442000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.755500,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.755500,0.000000,52.057300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.755500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.220700,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.534300,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<13.220700,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.534300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.691000,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.534300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.691000,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.691000,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.691000,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.691000,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.220700,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.220700,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.220700,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.064000,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.064000,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.064000,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.220700,0.000000,52.370800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<13.064000,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.220700,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.691000,0.000000,52.370800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.220700,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.313000,0.000000,51.743800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.469800,0.000000,51.743800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<14.313000,0.000000,51.743800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.469800,0.000000,51.743800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.626500,0.000000,51.900600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<14.469800,0.000000,51.743800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.626500,0.000000,51.900600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.626500,0.000000,52.684300>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<14.626500,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.626500,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.156200,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<14.156200,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.156200,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999500,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.999500,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999500,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999500,0.000000,52.214000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.999500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.156200,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.999500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.156200,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.626500,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<14.156200,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.935000,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.935000,0.000000,52.684300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<14.935000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.935000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.405300,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<14.935000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.405300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.562000,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.405300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.562000,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.562000,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.562000,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.340800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.027200,0.000000,52.057300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<16.027200,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.027200,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.870500,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.870500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.870500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.870500,0.000000,52.527600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<15.870500,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.870500,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.027200,0.000000,52.684300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.870500,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.027200,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.340800,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<16.027200,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.340800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.497500,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<16.340800,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.497500,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.497500,0.000000,52.370800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.497500,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.497500,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.870500,0.000000,52.370800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<15.870500,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.962700,0.000000,52.841100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.962700,0.000000,52.214000>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.962700,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.962700,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.119500,0.000000,52.057300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<16.962700,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.806000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.119500,0.000000,52.684300>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<16.806000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.429600,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.586300,0.000000,52.684300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<17.429600,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.586300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.586300,0.000000,52.057300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.586300,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.429600,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.743100,0.000000,52.057300>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<17.429600,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.586300,0.000000,53.154600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.586300,0.000000,52.997900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.586300,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.680200,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.209900,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<18.209900,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.209900,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.053200,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.053200,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.053200,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.053200,0.000000,52.214000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.053200,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.053200,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.209900,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<18.053200,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.209900,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.680200,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<18.209900,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.924200,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.924200,0.000000,52.997900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<19.924200,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.924200,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.394500,0.000000,52.997900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.924200,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.394500,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.551200,0.000000,52.841100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<20.394500,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.551200,0.000000,52.841100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.551200,0.000000,52.527600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.551200,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.551200,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.394500,0.000000,52.370800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<20.394500,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.394500,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.924200,0.000000,52.370800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.924200,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.237700,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.551200,0.000000,52.057300>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<20.237700,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.016400,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.330000,0.000000,52.057300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<21.016400,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.330000,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.486700,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.330000,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.486700,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.486700,0.000000,52.527600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<21.486700,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.486700,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.330000,0.000000,52.684300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<21.330000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.330000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.016400,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<21.016400,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.016400,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.859700,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.859700,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.859700,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.859700,0.000000,52.214000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.859700,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.859700,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.016400,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<20.859700,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.951900,0.000000,52.841100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.951900,0.000000,52.214000>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.951900,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.951900,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.108700,0.000000,52.057300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.951900,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.795200,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.108700,0.000000,52.684300>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<21.795200,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.575500,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.889100,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.575500,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.889100,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.045800,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.889100,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.045800,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.045800,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.045800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.045800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.575500,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<22.575500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.575500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.418800,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.418800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.418800,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.575500,0.000000,52.370800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<22.418800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.575500,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.045800,0.000000,52.370800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<22.575500,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.354300,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.354300,0.000000,52.684300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<23.354300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.354300,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.667800,0.000000,52.684300>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.354300,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.667800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.824600,0.000000,52.684300>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<23.667800,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.133800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.133800,0.000000,52.214000>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.133800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.133800,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.290500,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<24.133800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.290500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.760800,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<24.290500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.760800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.760800,0.000000,51.900600>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.760800,0.000000,51.900600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.760800,0.000000,51.900600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.604100,0.000000,51.743800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<24.604100,0.000000,51.743800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.604100,0.000000,51.743800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.447300,0.000000,51.743800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.447300,0.000000,51.743800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.631800,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.004800,0.000000,52.997900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<26.004800,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.004800,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.004800,0.000000,52.057300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.004800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.004800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.631800,0.000000,52.057300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<26.004800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.004800,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.318300,0.000000,52.527600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<26.004800,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.940300,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.940300,0.000000,52.684300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<26.940300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.940300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.410600,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<26.940300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.410600,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.567300,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.410600,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.567300,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.567300,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.567300,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.502800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.032500,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.032500,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.032500,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.875800,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.875800,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.875800,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.875800,0.000000,52.214000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.875800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.875800,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.032500,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.875800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.032500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.502800,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.032500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.968000,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.281600,0.000000,52.057300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.968000,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.281600,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.438300,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.281600,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.438300,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.438300,0.000000,52.527600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.438300,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.438300,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.281600,0.000000,52.684300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.281600,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.281600,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.968000,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.968000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.968000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.811300,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.811300,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.811300,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.811300,0.000000,52.214000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.811300,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.811300,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.968000,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.811300,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.373800,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.373800,0.000000,52.057300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.373800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.373800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.903500,0.000000,52.057300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.903500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.903500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.746800,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.746800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.746800,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.746800,0.000000,52.527600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.746800,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.746800,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.903500,0.000000,52.684300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.746800,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.903500,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.373800,0.000000,52.684300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.903500,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.152600,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.839000,0.000000,52.057300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.839000,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.839000,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.682300,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.682300,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.682300,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.682300,0.000000,52.527600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<30.682300,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.682300,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.839000,0.000000,52.684300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.682300,0.000000,52.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.839000,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.152600,0.000000,52.684300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.839000,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.152600,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.309300,0.000000,52.527600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.152600,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.309300,0.000000,52.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.309300,0.000000,52.370800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.309300,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.309300,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.682300,0.000000,52.370800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<30.682300,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.617800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.617800,0.000000,52.684300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<31.617800,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.617800,0.000000,52.370800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.931300,0.000000,52.684300>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.617800,0.000000,52.370800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.931300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.088100,0.000000,52.684300>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.931300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.332800,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.646300,0.000000,52.057300>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,63.430762,0> translate<33.332800,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.646300,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.959800,0.000000,52.684300>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,-63.430762,0> translate<33.646300,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.268300,0.000000,52.684300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581800,0.000000,52.997900>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<34.268300,0.000000,52.684300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581800,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581800,0.000000,52.057300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.268300,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.895300,0.000000,52.057300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<34.268300,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.203800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.203800,0.000000,52.214000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<35.203800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.203800,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.360500,0.000000,52.214000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.203800,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.360500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.360500,0.000000,52.057300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.360500,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.360500,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.203800,0.000000,52.057300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.203800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.671500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.671500,0.000000,52.841100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<35.671500,0.000000,52.841100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.671500,0.000000,52.841100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.828200,0.000000,52.997900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<35.671500,0.000000,52.841100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.828200,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.141800,0.000000,52.997900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.828200,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.141800,0.000000,52.997900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.298500,0.000000,52.841100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<36.141800,0.000000,52.997900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.298500,0.000000,52.841100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.298500,0.000000,52.214000>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.298500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.298500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.141800,0.000000,52.057300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.141800,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.141800,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.828200,0.000000,52.057300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.828200,0.000000,52.057300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.828200,0.000000,52.057300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.671500,0.000000,52.214000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.671500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.671500,0.000000,52.214000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.298500,0.000000,52.841100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<35.671500,0.000000,52.214000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<12.103100,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.259800,0.000000,51.134900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<12.103100,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.259800,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.416600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<12.259800,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.416600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.416600,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.416600,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.416600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.573400,0.000000,51.134900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<12.416600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.573400,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.730100,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<12.573400,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.730100,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.730100,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.730100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.508900,0.000000,51.134900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<13.195300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.508900,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.665600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.508900,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.665600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.665600,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.665600,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.665600,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.195300,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.038600,0.000000,50.664600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.038600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.038600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,50.821400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<13.038600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.665600,0.000000,50.821400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.195300,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.974100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.974100,0.000000,51.448500>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<13.974100,0.000000,51.448500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.444400,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.974100,0.000000,50.821400>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<13.974100,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.974100,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.444400,0.000000,51.134900>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<13.974100,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.223900,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.910300,0.000000,50.507900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.910300,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.910300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.753600,0.000000,50.664600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<14.753600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.753600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.753600,0.000000,50.978200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<14.753600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.753600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.910300,0.000000,51.134900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.753600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.910300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.223900,0.000000,51.134900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.910300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.223900,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.380600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.223900,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.380600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.380600,0.000000,50.821400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.380600,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.380600,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.753600,0.000000,50.821400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<14.753600,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.689100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.689100,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<15.689100,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.689100,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.845800,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<15.689100,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.845800,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.845800,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.845800,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.845800,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.689100,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<15.689100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.156800,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.156800,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<16.156800,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.156800,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.470300,0.000000,51.134900>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.156800,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.470300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.627100,0.000000,51.134900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<16.470300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.936300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.936300,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<16.936300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.936300,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.249800,0.000000,51.134900>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.936300,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.249800,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.406600,0.000000,51.134900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<17.249800,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.715800,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.715800,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<17.715800,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.715800,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.029300,0.000000,51.134900>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.715800,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.029300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.186100,0.000000,51.134900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<18.029300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.652000,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.652000,0.000000,51.291700>}
box{<0,0,-0.038100><0.783800,0.036000,0.038100> rotate<0,90.000000,0> translate<18.652000,0.000000,51.291700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.652000,0.000000,51.291700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.808800,0.000000,51.448500>}
box{<0,0,-0.038100><0.221749,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.652000,0.000000,51.291700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.495300,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.808800,0.000000,50.978200>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<18.495300,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.118900,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.118900,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<19.118900,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.118900,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275600,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<19.118900,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275600,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.275600,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275600,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.118900,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<19.118900,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.743300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.056900,0.000000,50.507900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.743300,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.056900,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.213600,0.000000,50.664600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.056900,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.213600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.213600,0.000000,50.978200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<20.213600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.213600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.056900,0.000000,51.134900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<20.056900,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.056900,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.743300,0.000000,51.134900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.743300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.743300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.586600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.586600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.586600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.586600,0.000000,50.664600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.586600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.586600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.743300,0.000000,50.507900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<19.586600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.522100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.522100,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<20.522100,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.522100,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.835600,0.000000,51.134900>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.522100,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.835600,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.992400,0.000000,51.134900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<20.835600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.615100,0.000000,50.194400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.771900,0.000000,50.194400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<21.615100,0.000000,50.194400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.771900,0.000000,50.194400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.928600,0.000000,50.351200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<21.771900,0.000000,50.194400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.928600,0.000000,50.351200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.928600,0.000000,51.134900>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<21.928600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.928600,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.458300,0.000000,51.134900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.458300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.458300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.301600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.301600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.301600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.301600,0.000000,50.664600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.301600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.301600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.458300,0.000000,50.507900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<21.301600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.458300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.928600,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.458300,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.237100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.864100,0.000000,51.448500>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-56.309028,0> translate<22.237100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.172600,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.172600,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<23.172600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.172600,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.329300,0.000000,51.134900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<23.172600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.329300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.486100,0.000000,50.978200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<23.329300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.486100,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.486100,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.486100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.486100,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.642900,0.000000,51.134900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<23.486100,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.642900,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.799600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<23.642900,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.799600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.799600,0.000000,50.507900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.799600,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.108100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.108100,0.000000,51.134900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<24.108100,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.108100,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.421600,0.000000,51.134900>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.108100,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.421600,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.578400,0.000000,51.134900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.421600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.357900,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.044300,0.000000,50.507900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.044300,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.044300,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.887600,0.000000,50.664600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<24.887600,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.887600,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.887600,0.000000,50.978200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<24.887600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.887600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.044300,0.000000,51.134900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.887600,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.044300,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.357900,0.000000,51.134900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.044300,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.357900,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.514600,0.000000,50.978200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<25.357900,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.514600,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.514600,0.000000,50.821400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.514600,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.514600,0.000000,50.821400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.887600,0.000000,50.821400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<24.887600,0.000000,50.821400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.823100,0.000000,50.978200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.450100,0.000000,50.978200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<25.823100,0.000000,50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.758600,0.000000,51.134900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.072100,0.000000,51.448500>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<26.758600,0.000000,51.134900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.072100,0.000000,51.448500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.072100,0.000000,50.507900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.072100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.758600,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.385600,0.000000,50.507900>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<26.758600,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.694100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.694100,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<27.694100,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.694100,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.850800,0.000000,50.664600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<27.694100,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.850800,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.850800,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.850800,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.850800,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.694100,0.000000,50.507900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<27.694100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.161800,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.161800,0.000000,51.291700>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<28.161800,0.000000,51.291700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.161800,0.000000,51.291700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.318500,0.000000,51.448500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<28.161800,0.000000,51.291700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.318500,0.000000,51.448500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.632100,0.000000,51.448500>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.318500,0.000000,51.448500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.632100,0.000000,51.448500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.788800,0.000000,51.291700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.632100,0.000000,51.448500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.788800,0.000000,51.291700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.788800,0.000000,50.664600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.788800,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.788800,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.632100,0.000000,50.507900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.632100,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.632100,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.318500,0.000000,50.507900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.318500,0.000000,50.507900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.318500,0.000000,50.507900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.161800,0.000000,50.664600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.161800,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.161800,0.000000,50.664600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.788800,0.000000,51.291700>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<28.161800,0.000000,50.664600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.700100,0.000000,49.433100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.229800,0.000000,49.433100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<26.229800,0.000000,49.433100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.229800,0.000000,49.433100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.073100,0.000000,49.276400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.073100,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.073100,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.073100,0.000000,48.962800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.073100,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.073100,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.229800,0.000000,48.806100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<26.073100,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.229800,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.700100,0.000000,48.806100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<26.229800,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.571100,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.944100,0.000000,48.806100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<27.944100,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.944100,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.571100,0.000000,49.433100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.944100,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.571100,0.000000,49.433100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.571100,0.000000,49.589900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<28.571100,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.571100,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.414400,0.000000,49.746700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.414400,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.414400,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.100800,0.000000,49.746700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.100800,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.100800,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.944100,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<27.944100,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.879600,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.879600,0.000000,49.589900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<28.879600,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.879600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.036300,0.000000,49.746700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<28.879600,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.036300,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.349900,0.000000,49.746700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.036300,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.349900,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.506600,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<29.349900,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.506600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.506600,0.000000,48.962800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.506600,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.506600,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.349900,0.000000,48.806100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.349900,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.349900,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.036300,0.000000,48.806100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.036300,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.036300,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.879600,0.000000,48.962800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.879600,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.879600,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.506600,0.000000,49.589900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<28.879600,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.815100,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.815100,0.000000,49.589900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<29.815100,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.815100,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.971800,0.000000,49.746700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<29.815100,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.971800,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.285400,0.000000,49.746700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.971800,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.285400,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.442100,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<30.285400,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.442100,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.442100,0.000000,48.962800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.442100,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.442100,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.285400,0.000000,48.806100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.285400,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.285400,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.971800,0.000000,48.806100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.971800,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.971800,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.815100,0.000000,48.962800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.815100,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.815100,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.442100,0.000000,49.589900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<29.815100,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,49.746700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<30.750600,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,49.746700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.907300,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<31.220900,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.433100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.377600,0.000000,49.433100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.433100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,49.276400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.220900,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.119600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<31.220900,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,48.962800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.377600,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.377600,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,48.806100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.220900,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,48.806100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.907300,0.000000,48.806100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,48.962800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.750600,0.000000,48.962800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,48.962800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.119600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<30.750600,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,49.276400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<30.750600,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.433100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.750600,0.000000,49.433100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.433100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.750600,0.000000,49.589900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<30.750600,0.000000,49.589900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.907300,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.220900,0.000000,49.276400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.907300,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.621600,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.621600,0.000000,49.746700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.621600,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.621600,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.091900,0.000000,49.746700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.621600,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.091900,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.248600,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<33.091900,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.248600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.248600,0.000000,49.276400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.248600,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.248600,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.091900,0.000000,49.119600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<33.091900,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.091900,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.621600,0.000000,49.119600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.621600,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.935100,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.248600,0.000000,48.806100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<32.935100,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.557100,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.557100,0.000000,49.746700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.557100,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.557100,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.027400,0.000000,49.746700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.557100,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.027400,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.184100,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.027400,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.184100,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.184100,0.000000,49.276400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.184100,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.184100,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.027400,0.000000,49.119600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.027400,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.027400,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.557100,0.000000,49.119600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.557100,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.870600,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.184100,0.000000,48.806100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<33.870600,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.492600,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.492600,0.000000,49.746700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<34.492600,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.492600,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.962900,0.000000,49.746700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.492600,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.962900,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.119600,0.000000,49.589900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.962900,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.119600,0.000000,49.589900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.119600,0.000000,49.276400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.119600,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.119600,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.962900,0.000000,49.119600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.962900,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.962900,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.492600,0.000000,49.119600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.492600,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.806100,0.000000,49.119600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.119600,0.000000,48.806100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<34.806100,0.000000,49.119600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.428100,0.000000,48.806100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.428100,0.000000,49.746700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.428100,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.428100,0.000000,49.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.055100,0.000000,49.746700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<35.428100,0.000000,49.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.428100,0.000000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.741600,0.000000,49.276400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<35.428100,0.000000,49.276400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,48.679100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.103100,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.103100,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.730100,0.000000,48.679100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<12.103100,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.038600,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,49.306100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<13.038600,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,48.679100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.195300,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.038600,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.352100,0.000000,48.679100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<13.038600,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,49.776400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.195300,0.000000,49.619700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.195300,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.289200,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.818900,0.000000,49.306100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.818900,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.818900,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.662200,0.000000,49.149400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.662200,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.662200,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.662200,0.000000,48.835800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.662200,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.662200,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.818900,0.000000,48.679100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.662200,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.818900,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.289200,0.000000,48.679100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.818900,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.068000,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.754400,0.000000,48.679100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.754400,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.754400,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.597700,0.000000,48.835800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<14.597700,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.597700,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.597700,0.000000,49.149400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<14.597700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.597700,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.754400,0.000000,49.306100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.597700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.754400,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.068000,0.000000,49.306100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.754400,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.068000,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.224700,0.000000,49.149400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.068000,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.224700,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.224700,0.000000,48.992600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.224700,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.224700,0.000000,48.992600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.597700,0.000000,48.992600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<14.597700,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.533200,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.533200,0.000000,49.306100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<15.533200,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.533200,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.003500,0.000000,49.306100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<15.533200,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.003500,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.160200,0.000000,49.149400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<16.003500,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.160200,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.160200,0.000000,48.679100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.160200,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.468700,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.939000,0.000000,48.679100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<16.468700,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.939000,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.095700,0.000000,48.835800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.939000,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.095700,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.939000,0.000000,48.992600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<16.939000,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.939000,0.000000,48.992600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.625400,0.000000,48.992600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<16.625400,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.625400,0.000000,48.992600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.468700,0.000000,49.149400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<16.468700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.468700,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.625400,0.000000,49.306100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.468700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.625400,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.095700,0.000000,49.306100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<16.625400,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.874500,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.560900,0.000000,48.679100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<17.560900,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.560900,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.404200,0.000000,48.835800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<17.404200,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.404200,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.404200,0.000000,49.149400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<17.404200,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.404200,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.560900,0.000000,49.306100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.404200,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.560900,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.874500,0.000000,49.306100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<17.560900,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.874500,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031200,0.000000,49.149400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<17.874500,0.000000,49.306100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031200,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031200,0.000000,48.992600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.031200,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031200,0.000000,48.992600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.404200,0.000000,48.992600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.404200,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.902200,0.000000,49.462900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.745500,0.000000,49.619700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<19.745500,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.745500,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.431900,0.000000,49.619700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.431900,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.431900,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275200,0.000000,49.462900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<19.275200,0.000000,49.462900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275200,0.000000,49.462900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275200,0.000000,48.835800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.275200,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.275200,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.431900,0.000000,48.679100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<19.275200,0.000000,48.835800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.431900,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.745500,0.000000,48.679100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.431900,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.745500,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.902200,0.000000,48.835800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.745500,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.902200,0.000000,48.835800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.902200,0.000000,49.149400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<19.902200,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.902200,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.588700,0.000000,49.149400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<19.588700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.210700,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.210700,0.000000,49.619700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<20.210700,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.210700,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.681000,0.000000,49.619700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.210700,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.681000,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.837700,0.000000,49.462900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<20.681000,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.837700,0.000000,49.462900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.837700,0.000000,49.149400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.837700,0.000000,49.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.837700,0.000000,49.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.681000,0.000000,48.992600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<20.681000,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.681000,0.000000,48.992600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.210700,0.000000,48.992600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.210700,0.000000,48.992600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.146200,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.146200,0.000000,48.679100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.146200,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.146200,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.773200,0.000000,48.679100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<21.146200,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.708700,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.081700,0.000000,48.679100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<22.081700,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.081700,0.000000,48.679100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.708700,0.000000,49.306100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.081700,0.000000,48.679100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.708700,0.000000,49.306100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.708700,0.000000,49.462900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<22.708700,0.000000,49.462900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.708700,0.000000,49.462900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.552000,0.000000,49.619700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<22.552000,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.552000,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.238400,0.000000,49.619700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.238400,0.000000,49.619700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.238400,0.000000,49.619700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.081700,0.000000,49.462900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<22.081700,0.000000,49.462900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.606500,0.000000,43.879300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.233500,0.000000,43.879300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<26.606500,0.000000,43.879300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.233500,0.000000,43.879300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.233500,0.000000,43.722500>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.233500,0.000000,43.722500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.233500,0.000000,43.722500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.606500,0.000000,43.095400>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<26.606500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.606500,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.606500,0.000000,42.938700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.606500,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.606500,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.233500,0.000000,42.938700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<26.606500,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.698700,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.012300,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.698700,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.012300,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.169000,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.012300,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.169000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.169000,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.169000,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.169000,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.698700,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.698700,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.698700,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.542000,0.000000,43.095400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.542000,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.542000,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.698700,0.000000,43.252200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<27.542000,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.698700,0.000000,43.252200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.169000,0.000000,43.252200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.698700,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.104500,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.634200,0.000000,43.565700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.634200,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.634200,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.477500,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.477500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.477500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.477500,0.000000,43.095400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.477500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.477500,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.634200,0.000000,42.938700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.477500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.634200,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.104500,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.634200,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.413000,0.000000,43.879300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.413000,0.000000,42.938700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.413000,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.413000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.569700,0.000000,43.565700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.413000,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.569700,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.883300,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.569700,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.883300,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.040000,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.883300,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.040000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.040000,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.040000,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.348500,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.348500,0.000000,43.879300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<30.348500,0.000000,43.879300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.348500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.975500,0.000000,43.409000>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<30.348500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.975500,0.000000,43.879300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.975500,0.000000,42.938700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.975500,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.440700,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.754300,0.000000,42.938700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.440700,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.754300,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.911000,0.000000,43.095400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.754300,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.911000,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.911000,0.000000,43.409000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<31.911000,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.911000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.754300,0.000000,43.565700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.754300,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.754300,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.440700,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.440700,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.440700,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.284000,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.284000,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.284000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.284000,0.000000,43.095400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.284000,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.284000,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.440700,0.000000,42.938700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.284000,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.689800,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.376200,0.000000,42.938700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.376200,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.376200,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.219500,0.000000,43.095400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.219500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.219500,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.219500,0.000000,43.409000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.219500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.219500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.376200,0.000000,43.565700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.219500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.376200,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.689800,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.376200,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.689800,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.846500,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.689800,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.846500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.846500,0.000000,43.252200>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.846500,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.846500,0.000000,43.252200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.219500,0.000000,43.252200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<32.219500,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.155000,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.155000,0.000000,43.879300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.155000,0.000000,43.879300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625300,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.155000,0.000000,43.252200>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<33.155000,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.155000,0.000000,43.252200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.625300,0.000000,43.565700>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<33.155000,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.404800,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.091200,0.000000,42.938700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.091200,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.091200,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.934500,0.000000,43.095400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.934500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.934500,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.934500,0.000000,43.409000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.934500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.934500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.091200,0.000000,43.565700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.934500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.091200,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.404800,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.091200,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.404800,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.561500,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.404800,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.561500,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.561500,0.000000,43.252200>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.561500,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.561500,0.000000,43.252200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.934500,0.000000,43.252200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<33.934500,0.000000,43.252200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.870000,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.870000,0.000000,43.565700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<34.870000,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.870000,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.340300,0.000000,43.565700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.870000,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.340300,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497000,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.340300,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497000,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.497000,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.497000,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.805500,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.805500,0.000000,43.095400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<35.805500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.805500,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.962200,0.000000,43.095400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.805500,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.962200,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.962200,0.000000,42.938700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.962200,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.962200,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.805500,0.000000,42.938700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.805500,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.900200,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.429900,0.000000,43.565700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.429900,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.429900,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.273200,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.273200,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.273200,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.273200,0.000000,43.095400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.273200,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.273200,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.429900,0.000000,42.938700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.273200,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.429900,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.900200,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.429900,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.365400,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.679000,0.000000,42.938700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.365400,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.679000,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.835700,0.000000,43.095400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.679000,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.835700,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.835700,0.000000,43.409000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.835700,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.835700,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.679000,0.000000,43.565700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.679000,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.679000,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.365400,0.000000,43.565700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.365400,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.365400,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.208700,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.208700,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.208700,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.208700,0.000000,43.095400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.208700,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.208700,0.000000,43.095400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.365400,0.000000,42.938700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.208700,0.000000,43.095400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.144200,0.000000,42.938700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.144200,0.000000,43.565700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<38.144200,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.144200,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.300900,0.000000,43.565700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<38.144200,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.300900,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.457700,0.000000,43.409000>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<38.300900,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.457700,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.457700,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.457700,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.457700,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.614500,0.000000,43.565700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<38.457700,0.000000,43.409000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.614500,0.000000,43.565700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.771200,0.000000,43.409000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.614500,0.000000,43.565700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.771200,0.000000,43.409000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.771200,0.000000,42.938700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.771200,0.000000,42.938700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504900,0.000000,45.428700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504900,0.000000,44.488100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.504900,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504900,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.975200,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<26.504900,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.975200,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.131900,0.000000,44.644800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.975200,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.131900,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.131900,0.000000,45.271900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<27.131900,0.000000,45.271900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.131900,0.000000,45.271900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.975200,0.000000,45.428700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<26.975200,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.975200,0.000000,45.428700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504900,0.000000,45.428700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<26.504900,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.910700,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.597100,0.000000,44.488100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.597100,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.597100,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440400,0.000000,44.644800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.440400,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440400,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440400,0.000000,44.958400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.440400,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440400,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.597100,0.000000,45.115100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.440400,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.597100,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.910700,0.000000,45.115100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.597100,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.910700,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.067400,0.000000,44.958400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.910700,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.067400,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.067400,0.000000,44.801600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.067400,0.000000,44.801600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.067400,0.000000,44.801600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440400,0.000000,44.801600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<27.440400,0.000000,44.801600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.375900,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.846200,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.375900,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.846200,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.002900,0.000000,44.644800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.846200,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.002900,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.846200,0.000000,44.801600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.846200,0.000000,44.801600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.846200,0.000000,44.801600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.532600,0.000000,44.801600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.532600,0.000000,44.801600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.532600,0.000000,44.801600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.375900,0.000000,44.958400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.375900,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.375900,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.532600,0.000000,45.115100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.375900,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.532600,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.002900,0.000000,45.115100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.532600,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.311400,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.468100,0.000000,45.115100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<29.311400,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.468100,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.468100,0.000000,44.488100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.468100,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.311400,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.624900,0.000000,44.488100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<29.311400,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.468100,0.000000,45.585400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.468100,0.000000,45.428700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.468100,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.248500,0.000000,44.174600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.405300,0.000000,44.174600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.248500,0.000000,44.174600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.405300,0.000000,44.174600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.562000,0.000000,44.331400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<30.405300,0.000000,44.174600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.562000,0.000000,44.331400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.562000,0.000000,45.115100>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<30.562000,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.562000,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.091700,0.000000,45.115100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.091700,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.091700,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.935000,0.000000,44.958400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.935000,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.935000,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.935000,0.000000,44.644800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.935000,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.935000,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.091700,0.000000,44.488100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.935000,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.091700,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.562000,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.091700,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.870500,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.870500,0.000000,45.115100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.870500,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.870500,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.340800,0.000000,45.115100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.870500,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.340800,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.497500,0.000000,44.958400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.340800,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.497500,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.497500,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.497500,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.741500,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.741500,0.000000,45.428700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.741500,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.741500,0.000000,45.428700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,45.428700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.741500,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,45.428700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,45.271900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<33.211800,0.000000,45.428700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,45.271900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,45.115100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.368500,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,44.958400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.211800,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,44.801600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<33.211800,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,44.801600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,44.644800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.368500,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.368500,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,44.488100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.211800,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.741500,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.741500,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.741500,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.211800,0.000000,44.958400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.741500,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.677000,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.677000,0.000000,44.644800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.677000,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.677000,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.833700,0.000000,44.488100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.677000,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.833700,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.304000,0.000000,44.488100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.833700,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.304000,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.304000,0.000000,44.331400>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.304000,0.000000,44.331400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.304000,0.000000,44.331400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.147300,0.000000,44.174600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.147300,0.000000,44.174600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.147300,0.000000,44.174600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.990500,0.000000,44.174600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<33.990500,0.000000,44.174600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,45.115100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.612500,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,45.115100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.958400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.769200,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.958400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.612500,0.000000,44.958400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.958400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,45.115100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<34.612500,0.000000,45.115100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.644800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.612500,0.000000,44.644800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.644800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.488100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.769200,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.769200,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.488100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.612500,0.000000,44.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.612500,0.000000,44.644800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<34.612500,0.000000,44.644800> }
difference{
cylinder{<26.416000,0,49.149000><26.416000,0.036000,49.149000>0.876600 translate<0,0.000000,0>}
cylinder{<26.416000,-0.1,49.149000><26.416000,0.135000,49.149000>0.749600 translate<0,0.000000,0>}}
difference{
cylinder{<21.590000,0,38.735000><21.590000,0.036000,38.735000>0.511600 translate<0,0.000000,0>}
cylinder{<21.590000,-0.1,38.735000><21.590000,0.135000,38.735000>0.206800 translate<0,0.000000,0>}}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.909000,0.000000,14.426800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.839000,0.000000,14.426800>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.909000,0.000000,14.426800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.909000,0.000000,12.852800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.839000,0.000000,12.852800>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.909000,0.000000,12.852800> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.547200,0.000000,13.638900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<9.200700,0.000000,13.640700>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.925400,0.000000,21.564600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,21.564600>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,0.000000,0> translate<38.925400,0.000000,21.564600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.778600,0.000000,21.767800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,21.767800>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.778600,0.000000,21.767800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.661300,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,21.971000>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,0.000000,0> translate<38.661300,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.571000,0.000000,22.174200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,22.174200>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,0.000000,0> translate<38.571000,0.000000,22.174200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.508700,0.000000,22.377400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,22.377400>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,0.000000,0> translate<38.508700,0.000000,22.377400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.463400,0.000000,22.580600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,22.580600>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,0.000000,0> translate<38.463400,0.000000,22.580600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.433600,0.000000,22.783800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,22.783800>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.433600,0.000000,22.783800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.455200,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,22.987000>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,0.000000,0> translate<38.455200,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.493800,0.000000,23.190200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,23.190200>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,0.000000,0> translate<38.493800,0.000000,23.190200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.551100,0.000000,23.393400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,23.393400>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,0.000000,0> translate<38.551100,0.000000,23.393400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.641400,0.000000,23.596600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,23.596600>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,0.000000,0> translate<38.641400,0.000000,23.596600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.761300,0.000000,23.799800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,23.799800>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,0.000000,0> translate<38.761300,0.000000,23.799800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.916400,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,24.003000>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,0.000000,0> translate<38.916400,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,21.433800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,24.133800>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<39.033600,0.000000,24.133800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,24.133800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.831500,0.000000,23.908300>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,-48.129156,0> translate<38.831500,0.000000,23.908300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.831500,0.000000,23.908300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.666900,0.000000,23.654100>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,-57.072303,0> translate<38.666900,0.000000,23.654100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.666900,0.000000,23.654100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.543900,0.000000,23.377400>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,-66.029311,0> translate<38.543900,0.000000,23.377400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.543900,0.000000,23.377400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.465500,0.000000,23.084900>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,-74.990507,0> translate<38.465500,0.000000,23.084900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.465500,0.000000,23.084900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.433600,0.000000,22.783800>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,-83.946825,0> translate<38.433600,0.000000,22.783800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.433600,0.000000,22.783800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.477300,0.000000,22.486000>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,81.646451,0> translate<38.433600,0.000000,22.783800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.477300,0.000000,22.486000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.561000,0.000000,22.196800>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,73.853673,0> translate<38.477300,0.000000,22.486000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.561000,0.000000,22.196800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.683300,0.000000,21.921700>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,66.027356,0> translate<38.561000,0.000000,22.196800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.683300,0.000000,21.921700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.841800,0.000000,21.665800>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,58.222805,0> translate<38.683300,0.000000,21.921700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.841800,0.000000,21.665800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.033600,0.000000,21.433800>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,50.415312,0> translate<38.841800,0.000000,21.665800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.183600,0.000000,24.833800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.483600,0.000000,24.833800>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.183600,0.000000,24.833800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.483600,0.000000,24.833800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.283600,0.000000,24.033800>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<41.483600,0.000000,24.833800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.283600,0.000000,24.033800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.283600,0.000000,21.533800>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.283600,0.000000,21.533800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.283600,0.000000,21.533800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.483600,0.000000,20.733800>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<41.483600,0.000000,20.733800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.483600,0.000000,20.733800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.183600,0.000000,20.733800>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.183600,0.000000,20.733800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.183600,0.000000,20.733800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.183600,0.000000,24.833800>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.183600,0.000000,24.833800> }
difference{
cylinder{<40.233600,0,22.783800><40.233600,0.036000,22.783800>1.951600 translate<0,0.000000,0>}
cylinder{<40.233600,-0.1,22.783800><40.233600,0.135000,22.783800>1.748400 translate<0,0.000000,0>}}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.585400,0.000000,28.054200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.585400,0.000000,28.162400>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,90.000000,0> translate<35.585400,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.382200,0.000000,27.907400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.382200,0.000000,28.162400>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.382200,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,27.790100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,28.162400>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,90.000000,0> translate<35.179000,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.975800,0.000000,27.699800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.975800,0.000000,28.162400>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,90.000000,0> translate<34.975800,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.772600,0.000000,27.637500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.772600,0.000000,28.162400>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,90.000000,0> translate<34.772600,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.569400,0.000000,27.592200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.569400,0.000000,28.162400>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,90.000000,0> translate<34.569400,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.366200,0.000000,27.562400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.366200,0.000000,28.162400>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.366200,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.163000,0.000000,27.584000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.163000,0.000000,28.162400>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,90.000000,0> translate<34.163000,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.959800,0.000000,27.622600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.959800,0.000000,28.162400>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,90.000000,0> translate<33.959800,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.756600,0.000000,27.679900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.756600,0.000000,28.162400>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,90.000000,0> translate<33.756600,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.553400,0.000000,27.770200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.553400,0.000000,28.162400>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,90.000000,0> translate<33.553400,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.350200,0.000000,27.890100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.350200,0.000000,28.162400>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,90.000000,0> translate<33.350200,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.147000,0.000000,28.045200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.147000,0.000000,28.162400>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,90.000000,0> translate<33.147000,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.716200,0.000000,28.162400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.016200,0.000000,28.162400>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.016200,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.016200,0.000000,28.162400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.241700,0.000000,27.960300>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,41.864905,0> translate<33.016200,0.000000,28.162400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.241700,0.000000,27.960300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.495900,0.000000,27.795700>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,32.921758,0> translate<33.241700,0.000000,27.960300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.495900,0.000000,27.795700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.772600,0.000000,27.672700>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,23.964750,0> translate<33.495900,0.000000,27.795700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.772600,0.000000,27.672700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.065100,0.000000,27.594300>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,15.003553,0> translate<33.772600,0.000000,27.672700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.065100,0.000000,27.594300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.366200,0.000000,27.562400>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,6.047235,0> translate<34.065100,0.000000,27.594300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.366200,0.000000,27.562400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.664000,0.000000,27.606100>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,-8.347610,0> translate<34.366200,0.000000,27.562400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.664000,0.000000,27.606100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.953200,0.000000,27.689800>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,-16.140387,0> translate<34.664000,0.000000,27.606100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.953200,0.000000,27.689800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.228300,0.000000,27.812100>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,-23.966704,0> translate<34.953200,0.000000,27.689800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.228300,0.000000,27.812100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.484200,0.000000,27.970600>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,-31.771255,0> translate<35.228300,0.000000,27.812100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.484200,0.000000,27.970600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.716200,0.000000,28.162400>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,-39.578749,0> translate<35.484200,0.000000,27.970600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.316200,0.000000,27.312400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.316200,0.000000,30.612400>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.316200,0.000000,30.612400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.316200,0.000000,30.612400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.116200,0.000000,31.412400>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.316200,0.000000,30.612400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.116200,0.000000,31.412400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.616200,0.000000,31.412400>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.116200,0.000000,31.412400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.616200,0.000000,31.412400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.416200,0.000000,30.612400>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<35.616200,0.000000,31.412400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.416200,0.000000,30.612400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.416200,0.000000,27.312400>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.416200,0.000000,27.312400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.416200,0.000000,27.312400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.316200,0.000000,27.312400>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.316200,0.000000,27.312400> }
difference{
cylinder{<34.366200,0,29.362400><34.366200,0.036000,29.362400>1.951600 translate<0,0.000000,0>}
cylinder{<34.366200,-0.1,29.362400><34.366200,0.135000,29.362400>1.748400 translate<0,0.000000,0>}}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.427400,0.000000,28.155800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.427400,0.000000,28.264000>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,90.000000,0> translate<41.427400,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.224200,0.000000,28.009000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.224200,0.000000,28.264000>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.224200,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,27.891700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,28.264000>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,90.000000,0> translate<41.021000,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.817800,0.000000,27.801400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.817800,0.000000,28.264000>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,90.000000,0> translate<40.817800,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.614600,0.000000,27.739100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.614600,0.000000,28.264000>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,90.000000,0> translate<40.614600,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,27.693800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.411400,0.000000,28.264000>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,90.000000,0> translate<40.411400,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.208200,0.000000,27.664000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.208200,0.000000,28.264000>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.208200,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,27.685600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,28.264000>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,90.000000,0> translate<40.005000,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.801800,0.000000,27.724200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.801800,0.000000,28.264000>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,90.000000,0> translate<39.801800,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.598600,0.000000,27.781500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.598600,0.000000,28.264000>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,90.000000,0> translate<39.598600,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.395400,0.000000,27.871800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.395400,0.000000,28.264000>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,90.000000,0> translate<39.395400,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.192200,0.000000,27.991700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.192200,0.000000,28.264000>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,90.000000,0> translate<39.192200,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,28.146800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,28.264000>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,90.000000,0> translate<38.989000,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.558200,0.000000,28.264000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.858200,0.000000,28.264000>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.858200,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.858200,0.000000,28.264000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.083700,0.000000,28.061900>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,41.864905,0> translate<38.858200,0.000000,28.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.083700,0.000000,28.061900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.337900,0.000000,27.897300>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,32.921758,0> translate<39.083700,0.000000,28.061900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.337900,0.000000,27.897300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.614600,0.000000,27.774300>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,23.964750,0> translate<39.337900,0.000000,27.897300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.614600,0.000000,27.774300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.907100,0.000000,27.695900>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,15.003553,0> translate<39.614600,0.000000,27.774300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.907100,0.000000,27.695900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.208200,0.000000,27.664000>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,6.047235,0> translate<39.907100,0.000000,27.695900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.208200,0.000000,27.664000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.506000,0.000000,27.707700>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,-8.347610,0> translate<40.208200,0.000000,27.664000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.506000,0.000000,27.707700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.795200,0.000000,27.791400>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,-16.140387,0> translate<40.506000,0.000000,27.707700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.795200,0.000000,27.791400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.070300,0.000000,27.913700>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,-23.966704,0> translate<40.795200,0.000000,27.791400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.070300,0.000000,27.913700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.326200,0.000000,28.072200>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,-31.771255,0> translate<41.070300,0.000000,27.913700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.326200,0.000000,28.072200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.558200,0.000000,28.264000>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,-39.578749,0> translate<41.326200,0.000000,28.072200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.158200,0.000000,27.414000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.158200,0.000000,30.714000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.158200,0.000000,30.714000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.158200,0.000000,30.714000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.958200,0.000000,31.514000>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.158200,0.000000,30.714000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.958200,0.000000,31.514000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.458200,0.000000,31.514000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.958200,0.000000,31.514000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.458200,0.000000,31.514000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.258200,0.000000,30.714000>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<41.458200,0.000000,31.514000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.258200,0.000000,30.714000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.258200,0.000000,27.414000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.258200,0.000000,27.414000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.258200,0.000000,27.414000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.158200,0.000000,27.414000>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.158200,0.000000,27.414000> }
difference{
cylinder{<40.208200,0,29.464000><40.208200,0.036000,29.464000>1.951600 translate<0,0.000000,0>}
cylinder{<40.208200,-0.1,29.464000><40.208200,0.135000,29.464000>1.748400 translate<0,0.000000,0>}}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.791800,0.000000,19.862800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.862800>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,19.862800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.938600,0.000000,19.659600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.659600>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,19.659600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.055900,0.000000,19.456400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.456400>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,19.456400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.146200,0.000000,19.253200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.253200>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,19.253200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.208500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.050000>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.253800,0.000000,18.846800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,18.846800>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,18.846800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.283600,0.000000,18.643600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,18.643600>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,18.643600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.262000,0.000000,18.440400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,18.440400>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,18.440400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.223400,0.000000,18.237200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,18.237200>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,18.237200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.166100,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,18.034000>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.075800,0.000000,17.830800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,17.830800>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,17.830800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.955900,0.000000,17.627600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,17.627600>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,17.627600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.800800,0.000000,17.424400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,17.424400>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,0.000000,0> translate<9.683600,0.000000,17.424400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.993600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,17.293600>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.683600,0.000000,17.293600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,17.293600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.885700,0.000000,17.519100>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,-48.129156,0> translate<9.683600,0.000000,17.293600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.885700,0.000000,17.519100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.050300,0.000000,17.773300>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,-57.072303,0> translate<9.885700,0.000000,17.519100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.050300,0.000000,17.773300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.173300,0.000000,18.050000>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,-66.029311,0> translate<10.050300,0.000000,17.773300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.173300,0.000000,18.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.251700,0.000000,18.342500>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,-74.990507,0> translate<10.173300,0.000000,18.050000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.251700,0.000000,18.342500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.283600,0.000000,18.643600>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,-83.946825,0> translate<10.251700,0.000000,18.342500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.283600,0.000000,18.643600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.239900,0.000000,18.941400>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,81.646451,0> translate<10.239900,0.000000,18.941400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.239900,0.000000,18.941400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.156200,0.000000,19.230600>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,73.853673,0> translate<10.156200,0.000000,19.230600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.156200,0.000000,19.230600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.033900,0.000000,19.505700>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,66.027356,0> translate<10.033900,0.000000,19.505700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.033900,0.000000,19.505700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.875400,0.000000,19.761600>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,58.222805,0> translate<9.875400,0.000000,19.761600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.875400,0.000000,19.761600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.683600,0.000000,19.993600>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,50.415312,0> translate<9.683600,0.000000,19.993600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.533600,0.000000,16.593600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.233600,0.000000,16.593600>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.233600,0.000000,16.593600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.233600,0.000000,16.593600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.433600,0.000000,17.393600>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<6.433600,0.000000,17.393600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.433600,0.000000,17.393600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.433600,0.000000,19.893600>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.433600,0.000000,19.893600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.433600,0.000000,19.893600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.233600,0.000000,20.693600>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.433600,0.000000,19.893600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.233600,0.000000,20.693600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.533600,0.000000,20.693600>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.233600,0.000000,20.693600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.533600,0.000000,20.693600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.533600,0.000000,16.593600>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.533600,0.000000,16.593600> }
difference{
cylinder{<8.483600,0,18.643600><8.483600,0.036000,18.643600>1.951600 translate<0,0.000000,0>}
cylinder{<8.483600,-0.1,18.643600><8.483600,0.135000,18.643600>1.748400 translate<0,0.000000,0>}}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.640000,0.000000,21.869000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570000,0.000000,21.869000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.640000,0.000000,21.869000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.640000,0.000000,20.295000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570000,0.000000,20.295000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.640000,0.000000,20.295000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<13.278200,0.000000,21.081100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<15.931700,0.000000,21.082900>}
//H1 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<7.289800,0.000000,50.165000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<7.289800,0.000000,50.165000>}
difference{
cylinder{<7.289800,0,50.165000><7.289800,0.036000,50.165000>3.505200 translate<0,0.000000,0>}
cylinder{<7.289800,-0.1,50.165000><7.289800,0.135000,50.165000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<7.289800,0,50.165000><7.289800,0.036000,50.165000>0.990600 translate<0,0.000000,0>}
cylinder{<7.289800,-0.1,50.165000><7.289800,0.135000,50.165000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<7.289800,0,50.165000><7.289800,0.036000,50.165000>1.701600 translate<0,0.000000,0>}
cylinder{<7.289800,-0.1,50.165000><7.289800,0.135000,50.165000>1.498400 translate<0,0.000000,0>}}
//H2 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<15.443200,0.000000,14.986000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<15.443200,0.000000,14.986000>}
difference{
cylinder{<15.443200,0,14.986000><15.443200,0.036000,14.986000>3.505200 translate<0,0.000000,0>}
cylinder{<15.443200,-0.1,14.986000><15.443200,0.135000,14.986000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<15.443200,0,14.986000><15.443200,0.036000,14.986000>0.990600 translate<0,0.000000,0>}
cylinder{<15.443200,-0.1,14.986000><15.443200,0.135000,14.986000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<15.443200,0,14.986000><15.443200,0.036000,14.986000>1.701600 translate<0,0.000000,0>}
cylinder{<15.443200,-0.1,14.986000><15.443200,0.135000,14.986000>1.498400 translate<0,0.000000,0>}}
//H3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<32.918400,0.000000,14.986000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<32.918400,0.000000,14.986000>}
difference{
cylinder{<32.918400,0,14.986000><32.918400,0.036000,14.986000>3.505200 translate<0,0.000000,0>}
cylinder{<32.918400,-0.1,14.986000><32.918400,0.135000,14.986000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<32.918400,0,14.986000><32.918400,0.036000,14.986000>0.990600 translate<0,0.000000,0>}
cylinder{<32.918400,-0.1,14.986000><32.918400,0.135000,14.986000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<32.918400,0,14.986000><32.918400,0.036000,14.986000>1.701600 translate<0,0.000000,0>}
cylinder{<32.918400,-0.1,14.986000><32.918400,0.135000,14.986000>1.498400 translate<0,0.000000,0>}}
//H4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<40.817800,0.000000,50.165000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<40.817800,0.000000,50.165000>}
difference{
cylinder{<40.817800,0,50.165000><40.817800,0.036000,50.165000>3.505200 translate<0,0.000000,0>}
cylinder{<40.817800,-0.1,50.165000><40.817800,0.135000,50.165000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<40.817800,0,50.165000><40.817800,0.036000,50.165000>0.990600 translate<0,0.000000,0>}
cylinder{<40.817800,-0.1,50.165000><40.817800,0.135000,50.165000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<40.817800,0,50.165000><40.817800,0.036000,50.165000>1.701600 translate<0,0.000000,0>}
cylinder{<40.817800,-0.1,50.165000><40.817800,0.135000,50.165000>1.498400 translate<0,0.000000,0>}}
//H5 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<40.640000,0.000000,5.715000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<40.640000,0.000000,5.715000>}
difference{
cylinder{<40.640000,0,5.715000><40.640000,0.036000,5.715000>3.505200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,5.715000><40.640000,0.135000,5.715000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,5.715000><40.640000,0.036000,5.715000>0.990600 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,5.715000><40.640000,0.135000,5.715000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,5.715000><40.640000,0.036000,5.715000>1.701600 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,5.715000><40.640000,0.135000,5.715000>1.498400 translate<0,0.000000,0>}}
//H6 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<7.493000,0.000000,5.842000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<7.493000,0.000000,5.842000>}
difference{
cylinder{<7.493000,0,5.842000><7.493000,0.036000,5.842000>3.505200 translate<0,0.000000,0>}
cylinder{<7.493000,-0.1,5.842000><7.493000,0.135000,5.842000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<7.493000,0,5.842000><7.493000,0.036000,5.842000>0.990600 translate<0,0.000000,0>}
cylinder{<7.493000,-0.1,5.842000><7.493000,0.135000,5.842000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<7.493000,0,5.842000><7.493000,0.036000,5.842000>1.701600 translate<0,0.000000,0>}
cylinder{<7.493000,-0.1,5.842000><7.493000,0.135000,5.842000>1.498400 translate<0,0.000000,0>}}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,38.069200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,31.933200>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.195800,0.000000,31.933200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,31.933200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,31.933200>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.165800,0.000000,31.933200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,31.933200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,38.069200>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.165800,0.000000,38.069200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,38.069200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,38.069200>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.165800,0.000000,38.069200> }
difference{
cylinder{<21.815800,0,36.886200><21.815800,0.036000,36.886200>0.491600 translate<0,0.000000,0>}
cylinder{<21.815800,-0.1,36.886200><21.815800,0.135000,36.886200>0.288400 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,37.276100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,36.626100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,35.976100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,35.326100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,34.676100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,34.026100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,33.376100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,32.726100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,32.726200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,33.376200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,34.026200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,34.676200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,35.326200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,35.976200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,36.626200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,37.276200>}
//INDEX silk screen
object{ARC(0.400000,0.101600,270.000000,450.000000,0.036000) translate<11.583000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.158000,0.000000,28.410000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.258000,0.000000,28.410000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.258000,0.000000,28.410000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.258000,0.000000,30.010000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.158000,0.000000,30.010000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.258000,0.000000,30.010000> }
difference{
cylinder{<11.783000,0,28.660000><11.783000,0.036000,28.660000>0.150800 translate<0,0.000000,0>}
cylinder{<11.783000,-0.1,28.660000><11.783000,0.135000,28.660000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.620500,0.000000,28.610000>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-90.000000,0> translate<11.820500,0.000000,28.472500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-90.000000,0> translate<11.870500,0.000000,28.822500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.920500,0.000000,28.772500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-90.000000,0> translate<11.733000,0.000000,29.810000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.920500,0.000000,29.760000>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-90.000000,0> translate<12.108000,0.000000,29.210000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-90.000000,0> translate<14.508000,0.000000,29.210000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.645500,0.000000,28.522500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.645500,0.000000,29.897500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-90.000000,0> translate<13.033000,0.000000,29.210000>}
//MAG+ silk screen
object{ARC(0.400000,0.101600,90.000000,270.000000,0.036000) translate<14.731400,0.000000,44.221400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.156400,0.000000,45.021400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.056400,0.000000,45.021400>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.156400,0.000000,45.021400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.056400,0.000000,43.421400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.156400,0.000000,43.421400>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.156400,0.000000,43.421400> }
difference{
cylinder{<14.531400,0,44.771400><14.531400,0.036000,44.771400>0.150800 translate<0,0.000000,0>}
cylinder{<14.531400,-0.1,44.771400><14.531400,0.135000,44.771400>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.693900,0.000000,44.821400>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-270.000000,0> translate<14.493900,0.000000,44.958900>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-270.000000,0> translate<14.443900,0.000000,44.608900>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.393900,0.000000,44.658900>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-270.000000,0> translate<14.581400,0.000000,43.621400>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.393900,0.000000,43.671400>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-270.000000,0> translate<14.206400,0.000000,44.221400>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-270.000000,0> translate<11.806400,0.000000,44.221400>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<13.668900,0.000000,44.908900>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<13.668900,0.000000,43.533900>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-270.000000,0> translate<13.281400,0.000000,44.221400>}
//MAG- silk screen
object{ARC(0.400000,0.101600,90.000000,270.000000,0.036000) translate<14.731400,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.156400,0.000000,41.440000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.056400,0.000000,41.440000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.156400,0.000000,41.440000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.056400,0.000000,39.840000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.156400,0.000000,39.840000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.156400,0.000000,39.840000> }
difference{
cylinder{<14.531400,0,41.190000><14.531400,0.036000,41.190000>0.150800 translate<0,0.000000,0>}
cylinder{<14.531400,-0.1,41.190000><14.531400,0.135000,41.190000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.693900,0.000000,41.240000>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-270.000000,0> translate<14.493900,0.000000,41.377500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-270.000000,0> translate<14.443900,0.000000,41.027500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.393900,0.000000,41.077500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-270.000000,0> translate<14.581400,0.000000,40.040000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.393900,0.000000,40.090000>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-270.000000,0> translate<14.206400,0.000000,40.640000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-270.000000,0> translate<11.806400,0.000000,40.640000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<13.668900,0.000000,41.327500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<13.668900,0.000000,39.952500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-270.000000,0> translate<13.281400,0.000000,40.640000>}
//PWM silk screen
object{ARC(0.400000,0.101600,90.000000,270.000000,0.036000) translate<15.315600,0.000000,23.647400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.740600,0.000000,24.447400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.640600,0.000000,24.447400>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.740600,0.000000,24.447400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.640600,0.000000,22.847400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.740600,0.000000,22.847400>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.740600,0.000000,22.847400> }
difference{
cylinder{<15.115600,0,24.197400><15.115600,0.036000,24.197400>0.150800 translate<0,0.000000,0>}
cylinder{<15.115600,-0.1,24.197400><15.115600,0.135000,24.197400>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-270.000000,0> translate<15.278100,0.000000,24.247400>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-270.000000,0> translate<15.078100,0.000000,24.384900>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-270.000000,0> translate<15.028100,0.000000,24.034900>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.978100,0.000000,24.084900>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-270.000000,0> translate<15.165600,0.000000,23.047400>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-270.000000,0> translate<14.978100,0.000000,23.097400>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-270.000000,0> translate<14.790600,0.000000,23.647400>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-270.000000,0> translate<12.390600,0.000000,23.647400>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<14.253100,0.000000,24.334900>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-270.000000,0> translate<14.253100,0.000000,22.959900>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-270.000000,0> translate<13.865600,0.000000,23.647400>}
//QUADA silk screen
object{ARC(0.400000,0.101600,270.000000,450.000000,0.036000) translate<11.557600,0.000000,36.880800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.132600,0.000000,36.080800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.232600,0.000000,36.080800>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.232600,0.000000,36.080800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.232600,0.000000,37.680800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.132600,0.000000,37.680800>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.232600,0.000000,37.680800> }
difference{
cylinder{<11.757600,0,36.330800><11.757600,0.036000,36.330800>0.150800 translate<0,0.000000,0>}
cylinder{<11.757600,-0.1,36.330800><11.757600,0.135000,36.330800>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.595100,0.000000,36.280800>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-90.000000,0> translate<11.795100,0.000000,36.143300>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-90.000000,0> translate<11.845100,0.000000,36.493300>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.895100,0.000000,36.443300>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-90.000000,0> translate<11.707600,0.000000,37.480800>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.895100,0.000000,37.430800>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-90.000000,0> translate<12.082600,0.000000,36.880800>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-90.000000,0> translate<14.482600,0.000000,36.880800>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.620100,0.000000,36.193300>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.620100,0.000000,37.568300>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-90.000000,0> translate<13.007600,0.000000,36.880800>}
//QUADB silk screen
object{ARC(0.400000,0.101600,270.000000,450.000000,0.036000) translate<11.583000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.158000,0.000000,32.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.258000,0.000000,32.220000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.258000,0.000000,32.220000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.258000,0.000000,33.820000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.158000,0.000000,33.820000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.258000,0.000000,33.820000> }
difference{
cylinder{<11.783000,0,32.470000><11.783000,0.036000,32.470000>0.150800 translate<0,0.000000,0>}
cylinder{<11.783000,-0.1,32.470000><11.783000,0.135000,32.470000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.620500,0.000000,32.420000>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-90.000000,0> translate<11.820500,0.000000,32.282500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-90.000000,0> translate<11.870500,0.000000,32.632500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.920500,0.000000,32.582500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-90.000000,0> translate<11.733000,0.000000,33.620000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-90.000000,0> translate<11.920500,0.000000,33.570000>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-90.000000,0> translate<12.108000,0.000000,33.020000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-90.000000,0> translate<14.508000,0.000000,33.020000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.645500,0.000000,32.332500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<12.645500,0.000000,33.707500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-90.000000,0> translate<13.033000,0.000000,33.020000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.540500,0.000000,44.881800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.458200,0.000000,44.881800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.540500,0.000000,44.881800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.540500,0.000000,43.256200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.458200,0.000000,43.256200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.540500,0.000000,43.256200> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<8.813800,0.000000,44.069000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<6.172200,0.000000,44.069000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.166300,0.000000,33.858200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.248600,0.000000,33.858200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<33.248600,0.000000,33.858200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.166300,0.000000,35.483800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.248600,0.000000,35.483800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<33.248600,0.000000,35.483800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<32.893000,0.000000,34.671000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<35.534600,0.000000,34.671000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.230300,0.000000,35.483800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,35.483800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<39.230300,0.000000,35.483800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.230300,0.000000,33.858200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,33.858200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<39.230300,0.000000,33.858200> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<41.503600,0.000000,34.671000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<38.862000,0.000000,34.671000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.540500,0.000000,41.325800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.458200,0.000000,41.325800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.540500,0.000000,41.325800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.540500,0.000000,39.700200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.458200,0.000000,39.700200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.540500,0.000000,39.700200> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<8.813800,0.000000,40.513000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<6.172200,0.000000,40.513000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.166300,0.000000,23.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.084000,0.000000,23.562000>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<31.166300,0.000000,23.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.166300,0.000000,21.936400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.084000,0.000000,21.936400>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<31.166300,0.000000,21.936400> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<33.439600,0.000000,22.749200>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<30.798000,0.000000,22.749200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,35.890200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,35.890200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,35.890200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,37.515800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,37.515800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,37.515800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<6.299200,0.000000,36.703000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<8.940800,0.000000,36.703000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,32.207200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,32.207200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,32.207200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,33.832800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,33.832800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,33.832800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<6.299200,0.000000,33.020000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<8.940800,0.000000,33.020000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,28.397200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,28.397200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,28.397200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,30.022800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.654800,0.000000,30.022800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<6.654800,0.000000,30.022800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<6.299200,0.000000,29.210000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<8.940800,0.000000,29.210000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.023100,0.000000,24.460200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.940800,0.000000,24.460200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<7.023100,0.000000,24.460200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.023100,0.000000,22.834600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.940800,0.000000,22.834600>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<7.023100,0.000000,22.834600> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<9.296400,0.000000,23.647400>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<6.654800,0.000000,23.647400>}
//SV2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,3.333000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,3.333000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.049200,0.000000,3.333000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,3.333000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.049200,0.000000,3.333000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,3.333000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,9.683000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.829200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,2.063000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.829200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.478200,0.000000,10.953000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.779200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779200,0.000000,2.063000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.779200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099200,0.000000,10.953000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.099200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,9.683000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.049200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,8.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,8.921000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.907200,0.000000,8.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,8.921000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.971200,0.000000,8.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,9.683000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.971200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,9.937000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.971200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,8.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,9.683000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.907200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,9.937000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.907200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,1.809000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.049200,0.000000,1.809000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319200,0.000000,1.809000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.049200,0.000000,1.809000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319200,0.000000,1.809000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.319200,0.000000,1.809000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.049200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.779200,0.000000,2.063000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.779200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.574200,0.000000,1.809000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.304200,0.000000,1.809000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304200,0.000000,2.063000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.304200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319200,0.000000,2.063000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.319200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.574200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.574200,0.000000,2.063000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.574200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.559200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,1.809000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.559200,0.000000,1.809000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.829200,0.000000,2.063000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.829200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.559200,0.000000,1.809000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.559200,0.000000,2.063000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.559200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.559200,0.000000,2.063000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.574200,0.000000,2.063000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.574200,0.000000,2.063000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.780200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,10.953000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.780200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,10.953000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.907200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,9.937000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.891200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,9.683000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.891200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,9.937000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.367200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,9.683000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.367200,0.000000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.780200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.399200,0.000000,10.445000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-53.126596,0> translate<21.399200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.859200,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.478200,0.000000,10.953000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,53.126596,0> translate<18.478200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.859200,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,10.445000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.859200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<20.891200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.907200,0.000000,9.937000>}
box{<0,0,-0.025400><1.016000,0.036000,0.025400> rotate<0,0.000000,0> translate<20.891200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907200,0.000000,10.953000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.907200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.367200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.795200,0.000000,9.937000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<14.795200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.795200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.795200,0.000000,3.079000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<14.795200,0.000000,3.079000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.795200,0.000000,3.079000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083200,0.000000,3.079000>}
box{<0,0,-0.025400><18.288000,0.036000,0.025400> rotate<0,0.000000,0> translate<14.795200,0.000000,3.079000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083200,0.000000,3.079000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083200,0.000000,9.937000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<33.083200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.971200,0.000000,9.937000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.971200,0.000000,9.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,10.953000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.971200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,10.445000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.891200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.399200,0.000000,10.445000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.891200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,9.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,10.445000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.367200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367200,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891200,0.000000,10.445000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.367200,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.971200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.384200,0.000000,10.953000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.971200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.384200,0.000000,10.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.384200,0.000000,10.953000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.384200,0.000000,10.953000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.384200,0.000000,10.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.654200,0.000000,10.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.384200,0.000000,10.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.654200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.654200,0.000000,10.826000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.654200,0.000000,10.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.654200,0.000000,10.953000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099200,0.000000,10.953000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.654200,0.000000,10.953000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.479200,0.000000,5.238000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.019200,0.000000,5.238000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<23.939200,0.000000,5.238000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.859200,0.000000,5.238000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.399200,0.000000,5.238000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.479200,0.000000,7.778000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.019200,0.000000,7.778000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<23.939200,0.000000,7.778000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.859200,0.000000,7.778000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.399200,0.000000,7.778000>}
//U$1 silk screen
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAGNETIC_ROTARY_ENCODER(-24.046300,0,-27.896950,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C2	1uF	SANYO-OSCON_SMD_A5
//C3	1uF	SANYO-OSCON_SMD_A5
//C4	1uF	SANYO-OSCON_SMD_A5
//C5	1uF	SANYO-OSCON_SMD_A5
//H1	MOUNT-HOLE3.0	3,0
//H2	MOUNT-HOLE3.0	3,0
//H3	MOUNT-HOLE3.0	3,0
//H4	MOUNT-HOLE3.0	3,0
//H5	MOUNT-HOLE3.0	3,0
//H6	MOUNT-HOLE3.0	3,0
//INDEX		CHIPLED_1206
//MAG+		CHIPLED_1206
//MAG-		CHIPLED_1206
//PWM		CHIPLED_1206
//QUADA		CHIPLED_1206
//QUADB		CHIPLED_1206
//U$1	6.1MMHOLE	6.1MMHOLE
