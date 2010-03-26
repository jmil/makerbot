//POVRay-File created by 3d41.ulp v1.05
///Users/zachsmith/makerbot/trunk/electronics/magnetic-rotary-encoder/magnetic-rotary-encoder.brd
//10/29/09 2:04 PM

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
#local cam_y = 166;
#local cam_z = -88;
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

#local lgt1_pos_x = 12;
#local lgt1_pos_y = 22;
#local lgt1_pos_z = 20;
#local lgt1_intense = 0.717652;
#local lgt2_pos_x = -12;
#local lgt2_pos_y = 22;
#local lgt2_pos_z = 20;
#local lgt2_intense = 0.717652;
#local lgt3_pos_x = 12;
#local lgt3_pos_y = 22;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.717652;
#local lgt4_pos_x = -12;
#local lgt4_pos_y = 22;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.717652;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 32.004000;
#declare pcb_y_size = 38.608000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(258);
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
	//translate<-16.002000,0,-19.304000>
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
<8.128000,9.652000><40.132000,9.652000>
<40.132000,9.652000><40.132000,48.260000>
<40.132000,48.260000><8.128000,48.260000>
<8.128000,48.260000><8.128000,9.652000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<36.529200,1,44.654000><36.529200,-5,44.654000>1.500000 texture{col_hls}}
cylinder{<36.529200,1,13.148000><36.529200,-5,13.148000>1.500000 texture{col_hls}}
cylinder{<11.627200,1,13.148000><11.627200,-5,13.148000>1.500000 texture{col_hls}}
cylinder{<11.638400,1,44.650000><11.638400,-5,44.650000>1.500000 texture{col_hls}}
cylinder{<24.180800,1,35.636200><24.180800,-5,35.636200>3.049200 texture{col_hls}}
cylinder{<18.845000,1,13.719000><18.845000,-5,13.719000>1.700000 texture{col_hls}}
cylinder{<29.259000,1,13.719000><29.259000,-5,13.719000>1.700000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.814000,0.000000,18.618200>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100nF C0805
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP16("AS5040","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<24.180800,0.000000,35.636200>translate<0,0.035000,0> }#end		//SSOP16 IC1 AS5040 SSOP16
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_1X10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.214000,0.000000,27.530000>}#end		//Header 2,54mm Grid 10Pin 1Row (jumper.lib) JP1  1X10
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.558000,0.000000,44.450000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 560 R0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.018000,0.000000,44.450000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 560 R0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("472",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.531800,0.000000,31.893200>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 4.7K R0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.176000,0.000000,19.431000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R6 560 R0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.176000,0.000000,22.860000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R7 560 R0805
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.583400,0.000000,41.410600>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.583400,0.000000,39.310600>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.018000,0.000000,41.410600>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.018000,0.000000,39.310600>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.764000,0.000000,18.618200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.864000,0.000000,18.618200>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.728400,0.000000,36.616200>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.328400,0.000000,36.616200>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.512400,0.000000,22.250400>}
object{TOOLS_PCB_SMD(2.600000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.912400,0.000000,22.250400>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,37.911200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,37.261200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,36.611200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,35.961200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,35.311200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,34.661200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,34.011200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.385800,0.000000,33.361200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,33.361200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,34.011200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,34.661200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,35.311200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,35.961200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,36.611200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,37.261200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.975800,0.000000,37.911200>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<35.644000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<33.104000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<30.564000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<28.024000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<25.484000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<22.944000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<20.404000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<17.864000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<15.324000,0,27.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<12.784000,0,27.530000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.264600,0.000000,19.354800>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.164600,0.000000,19.354800>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.290000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.190000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.558000,0.000000,43.500000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.558000,0.000000,45.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.018000,0.000000,43.500000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.018000,0.000000,45.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.481800,0.000000,31.893200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.581800,0.000000,31.893200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.226000,0.000000,19.431000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.126000,0.000000,19.431000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.226000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.126000,0.000000,22.860000>}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<27.862000,0,22.355000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<25.322000,0,22.355000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<22.782000,0,22.355000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<20.242000,0,22.355000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<14.351000,0,37.973000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<12.700000,0,35.306000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<32.258000,0,30.353000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,19.365000>}
box{<0,0,-0.127000><1.458000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.160000,0.000000,19.365000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,19.365000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.226000,0.000000,19.431000>}
box{<0,0,-0.127000><0.093338,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.160000,0.000000,19.365000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.226000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.226000,0.000000,22.860000>}
box{<0,0,-0.304800><3.429000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.226000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.226000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,23.048000>}
box{<0,0,-0.127000><0.265872,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.226000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,23.048000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,24.638000>}
box{<0,0,-0.127000><1.590000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.414000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,0.000000,17.526000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<10.160000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,25.400000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.414000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,31.623000>}
box{<0,0,-0.127000><4.009000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.700000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.784000,0.000000,27.530000>}
box{<0,0,-0.127000><0.118794,0.035000,0.127000> rotate<0,44.997030,0> translate<12.700000,0.000000,27.614000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.355200,0.000000,35.961200>}
box{<0,0,-0.127000><0.926593,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.700000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.716000,0.000000,25.400000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.716000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.046200,0.000000,25.704800>}
box{<0,0,-0.127000><0.449372,0.035000,0.127000> rotate<0,-42.706571,0> translate<13.716000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.046200,0.000000,25.704800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.046200,0.000000,31.165800>}
box{<0,0,-0.127000><5.461000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.046200,0.000000,31.165800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.126000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.088400,0.000000,19.431000>}
box{<0,0,-0.304800><1.962400,0.035000,0.304800> rotate<0,0.000000,0> translate<12.126000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.088400,0.000000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.164600,0.000000,19.354800>}
box{<0,0,-0.304800><0.107763,0.035000,0.304800> rotate<0,44.997030,0> translate<14.088400,0.000000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.126000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.190000,0.000000,22.860000>}
box{<0,0,-0.304800><2.064000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.126000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.324000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,27.573000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.324000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,27.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,29.718000>}
box{<0,0,-0.127000><2.145000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.367000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.712800,0.000000,36.611200>}
box{<0,0,-0.127000><1.925876,0.035000,0.127000> rotate<0,44.997030,0> translate<14.351000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.738200,0.000000,34.661200>}
box{<0,0,-0.127000><4.296664,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.700000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.046200,0.000000,31.165800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.866200,0.000000,34.011200>}
box{<0,0,-0.127000><4.006083,0.035000,0.127000> rotate<0,-45.253889,0> translate<14.046200,0.000000,31.165800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,41.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,43.500000>}
box{<0,0,-0.127000><2.089400,0.035000,0.127000> rotate<0,90.000000,0> translate<17.018000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,39.310600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,0.000000,38.481000>}
box{<0,0,-0.127000><0.839265,0.035000,0.127000> rotate<0,81.291034,0> translate<17.018000,0.000000,39.310600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,30.353000>}
box{<0,0,-0.127000><7.004600,0.035000,0.127000> rotate<0,44.997030,0> translate<12.700000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.864000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.864000,0.000000,29.802000>}
box{<0,0,-0.127000><2.272000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.864000,0.000000,29.802000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.364800,0.000000,37.261200>}
box{<0,0,-0.127000><1.725058,0.035000,0.127000> rotate<0,44.997030,0> translate<17.145000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.010200,0.000000,33.361200>}
box{<0,0,-0.127000><5.152263,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.367000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,42.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,43.500000>}
box{<0,0,-0.127000><1.175000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.558000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,45.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,45.400000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.018000,0.000000,45.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,42.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,41.410600>}
box{<0,0,-0.127000><0.914753,0.035000,0.127000> rotate<0,88.403025,0> translate<19.558000,0.000000,42.325000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.290000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.737000,0.000000,22.860000>}
box{<0,0,-0.304800><3.447000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.290000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.864000,0.000000,29.802000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.939000,0.000000,31.877000>}
box{<0,0,-0.127000><2.934493,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.864000,0.000000,29.802000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,45.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.127000,0.000000,45.466000>}
box{<0,0,-0.127000><0.572815,0.035000,0.127000> rotate<0,-6.615904,0> translate<19.558000,0.000000,45.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.737000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.242000,0.000000,22.355000>}
box{<0,0,-0.304800><0.714178,0.035000,0.304800> rotate<0,44.997030,0> translate<19.737000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.242000,0.000000,22.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.242000,0.000000,24.560000>}
box{<0,0,-0.127000><2.205000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.242000,0.000000,24.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.010200,0.000000,33.361200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,33.361200>}
box{<0,0,-0.127000><1.375600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.010200,0.000000,33.361200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.866200,0.000000,34.011200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,34.011200>}
box{<0,0,-0.127000><3.519600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.866200,0.000000,34.011200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.738200,0.000000,34.661200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,34.661200>}
box{<0,0,-0.127000><4.647600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.738200,0.000000,34.661200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.355200,0.000000,35.961200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,35.961200>}
box{<0,0,-0.127000><7.030600,0.035000,0.127000> rotate<0,0.000000,0> translate<13.355200,0.000000,35.961200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.712800,0.000000,36.611200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,36.611200>}
box{<0,0,-0.127000><4.673000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.712800,0.000000,36.611200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.364800,0.000000,37.261200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,37.261200>}
box{<0,0,-0.127000><2.021000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.364800,0.000000,37.261200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.583400,0.000000,39.310600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,38.762200>}
box{<0,0,-0.127000><0.971899,0.035000,0.127000> rotate<0,34.348373,0> translate<19.583400,0.000000,39.310600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,37.911200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.385800,0.000000,38.762200>}
box{<0,0,-0.127000><0.851000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.385800,0.000000,38.762200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.404000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.404000,0.000000,29.802000>}
box{<0,0,-0.127000><2.272000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.404000,0.000000,29.802000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,-1.535000,37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.955000,-1.535000,31.369000>}
box{<0,0,-0.127000><9.339466,0.035000,0.127000> rotate<0,44.997030,0> translate<14.351000,-1.535000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.242000,0.000000,24.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,25.400000>}
box{<0,0,-0.127000><1.187939,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.242000,0.000000,24.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.264600,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.513800,0.000000,19.354800>}
box{<0,0,-0.304800><5.249200,0.035000,0.304800> rotate<0,0.000000,0> translate<16.264600,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.404000,0.000000,29.802000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.717000,0.000000,31.115000>}
box{<0,0,-0.127000><1.856862,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.404000,0.000000,29.802000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.782000,0.000000,22.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.782000,0.000000,23.798000>}
box{<0,0,-0.127000><1.443000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.782000,0.000000,23.798000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.513800,0.000000,19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,20.701000>}
box{<0,0,-0.304800><1.903814,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.513800,0.000000,19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.782000,0.000000,22.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,22.277000>}
box{<0,0,-0.304800><0.110309,0.035000,0.304800> rotate<0,44.997030,0> translate<22.782000,0.000000,22.355000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,22.277000>}
box{<0,0,-0.304800><1.576000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.860000,0.000000,22.277000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.127000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,45.466000>}
box{<0,0,-0.127000><2.733000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.127000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.944000,-1.535000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,-1.535000,27.487000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,44.997030,0> translate<22.944000,-1.535000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,-1.535000,27.487000>}
box{<0,0,-0.127000><1.579000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.987000,-1.535000,27.487000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.944000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,27.573000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.944000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,27.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,29.464000>}
box{<0,0,-0.127000><1.891000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.987000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.114000,0.000000,17.526000>}
box{<0,0,-0.127000><12.573000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.541000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.782000,0.000000,23.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.622000,0.000000,24.638000>}
box{<0,0,-0.127000><1.187939,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.782000,0.000000,23.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,30.378400>}
box{<0,0,-0.127000><1.275323,0.035000,0.127000> rotate<0,-45.803906,0> translate<22.987000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003000,-1.535000,24.892000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<22.987000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.114000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.322000,0.000000,19.734000>}
box{<0,0,-0.127000><3.122584,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.114000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.322000,0.000000,19.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.322000,0.000000,22.355000>}
box{<0,0,-0.127000><2.621000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.322000,0.000000,22.355000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,22.277000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,20.828000>}
box{<0,0,-0.304800><1.449000,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.400000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.322000,0.000000,22.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,22.277000>}
box{<0,0,-0.304800><0.110309,0.035000,0.304800> rotate<0,44.997030,0> translate<25.322000,0.000000,22.355000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.484000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.484000,0.000000,29.167000>}
box{<0,0,-0.127000><1.637000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.484000,0.000000,29.167000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.484000,0.000000,29.167000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.908000,0.000000,29.591000>}
box{<0,0,-0.127000><0.599627,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.484000,0.000000,29.167000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.178000,0.000000,19.050000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,44.997030,0> translate<25.400000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.432000,-1.535000,30.353000>}
box{<0,0,-0.127000><9.779000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.653000,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,25.400000>}
box{<0,0,-0.127000><6.477000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.082000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.939000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.813000,0.000000,31.877000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.939000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.862000,-1.535000,22.355000>}
box{<0,0,-0.304800><0.632007,0.035000,0.304800> rotate<0,-0.271954,0> translate<27.230000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,40.477200>}
box{<0,0,-0.127000><7.145596,0.035000,0.127000> rotate<0,44.276992,0> translate<22.860000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,37.911200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,40.477200>}
box{<0,0,-0.127000><2.566000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.975800,0.000000,40.477200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,34.011200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000600,0.000000,34.036000>}
box{<0,0,-0.127000><0.035072,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.975800,0.000000,34.011200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,0.000000,25.908000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.559000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.024000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,0.000000,27.487000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,44.997030,0> translate<28.024000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,0.000000,27.487000>}
box{<0,0,-0.127000><1.579000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.067000,0.000000,27.487000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.024000,-1.535000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,-1.535000,27.573000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.024000,-1.535000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.432000,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,-1.535000,29.718000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<27.432000,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,-1.535000,27.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.067000,-1.535000,29.718000>}
box{<0,0,-0.127000><2.145000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.067000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.813000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,32.258000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.813000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,33.361200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,33.143000>}
box{<0,0,-0.127000><0.308581,0.035000,0.127000> rotate<0,44.997030,0> translate<27.975800,0.000000,33.361200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,33.143000>}
box{<0,0,-0.127000><0.885000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.194000,0.000000,33.143000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.717000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,31.115000>}
box{<0,0,-0.127000><6.604000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.717000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,35.311200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.702000,0.000000,35.308100>}
box{<0,0,-0.127000><0.726207,0.035000,0.127000> rotate<0,0.244566,0> translate<27.975800,0.000000,35.311200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.702000,0.000000,35.308100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.704100,0.000000,35.306000>}
box{<0,0,-0.127000><0.002970,0.035000,0.127000> rotate<0,44.997030,0> translate<28.702000,0.000000,35.308100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,30.378400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,30.378400>}
box{<0,0,-0.127000><5.207000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.876000,0.000000,30.378400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000600,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,34.036000>}
box{<0,0,-0.127000><1.209400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.000600,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.702000,0.000000,35.308100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,35.306000>}
box{<0,0,-0.127000><0.508004,0.035000,0.127000> rotate<0,0.236836,0> translate<28.702000,0.000000,35.308100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.955000,-1.535000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,-1.535000,31.369000>}
box{<0,0,-0.127000><8.382000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.955000,-1.535000,31.369000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.178000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.464000,0.000000,19.050000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.178000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.622000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464000,0.000000,24.638000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.622000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.908000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,29.591000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.908000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,32.512000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.321000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,33.528000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<29.210000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,33.528000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.718000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,34.661200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.727800,0.000000,34.661200>}
box{<0,0,-0.127000><1.752000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.975800,0.000000,34.661200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.704100,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,35.306000>}
box{<0,0,-0.127000><1.648900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.704100,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,-1.535000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,30.226000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<29.337000,-1.535000,31.369000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,30.226000>}
box{<0,0,-0.127000><2.612000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,37.911200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.545200,0.000000,37.911200>}
box{<0,0,-0.127000><2.569400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.975800,0.000000,37.911200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.564000,-1.535000,27.530000>}
box{<0,0,-0.127000><0.118794,0.035000,0.127000> rotate<0,44.997030,0> translate<30.480000,-1.535000,27.614000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,25.781000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.464000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.564000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,27.487000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,44.997030,0> translate<30.564000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,27.487000>}
box{<0,0,-0.127000><1.706000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.607000,0.000000,27.487000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,30.378400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.734000,0.000000,32.004000>}
box{<0,0,-0.127000><2.316976,0.035000,0.127000> rotate<0,-44.552915,0> translate<29.083000,0.000000,30.378400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.727800,0.000000,34.661200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.734000,0.000000,33.655000>}
box{<0,0,-0.127000><1.422982,0.035000,0.127000> rotate<0,44.997030,0> translate<29.727800,0.000000,34.661200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.734000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.734000,0.000000,33.655000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.734000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003000,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,24.892000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826200,-1.535000,25.349200>}
box{<0,0,-0.127000><0.646578,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.369000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826200,-1.535000,25.349200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826200,-1.535000,29.413200>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.826200,-1.535000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,31.877000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.718000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,33.655000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,44.997030,0> translate<30.353000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,33.655000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.004000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.230000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.131000,-1.535000,22.352000>}
box{<0,0,-0.304800><4.901000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.230000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826200,-1.535000,29.413200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,29.845000>}
box{<0,0,-0.127000><0.610657,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.826200,-1.535000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,30.353000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.258000,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.545200,0.000000,37.911200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,40.005000>}
box{<0,0,-0.127000><2.961080,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.545200,0.000000,37.911200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.464000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.664400,0.000000,22.250400>}
box{<0,0,-0.304800><4.526049,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.464000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.975800,0.000000,37.261200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.845400,0.000000,37.261200>}
box{<0,0,-0.127000><4.869600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.975800,0.000000,37.261200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.728400,0.000000,36.616200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.845400,0.000000,37.261200>}
box{<0,0,-0.127000><0.655526,0.035000,0.127000> rotate<0,-79.713345,0> translate<32.728400,0.000000,36.616200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.104000,0.000000,27.530000>}
box{<0,0,-0.127000><0.118794,0.035000,0.127000> rotate<0,44.997030,0> translate<33.020000,0.000000,27.614000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.104000,0.000000,23.058800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.104000,0.000000,27.530000>}
box{<0,0,-0.304800><4.471200,0.035000,0.304800> rotate<0,90.000000,0> translate<33.104000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,27.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,0.000000,28.956000>}
box{<0,0,-0.127000><1.365826,0.035000,0.127000> rotate<0,-79.277189,0> translate<33.020000,0.000000,27.614000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.798200,0.000000,31.893200>}
box{<0,0,-0.127000><2.178172,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.258000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.581800,0.000000,31.893200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.798200,0.000000,31.893200>}
box{<0,0,-0.127000><0.216400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.581800,0.000000,31.893200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.909000,0.000000,22.247000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.909000,0.000000,19.304000>}
box{<0,0,-0.304800><2.943000,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.909000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.664400,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.912400,0.000000,22.250400>}
box{<0,0,-0.304800><1.248000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.664400,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.104000,0.000000,23.058800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.912400,0.000000,22.250400>}
box{<0,0,-0.304800><1.143250,0.035000,0.304800> rotate<0,44.997030,0> translate<33.104000,0.000000,23.058800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.909000,0.000000,22.247000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.912400,0.000000,22.250400>}
box{<0,0,-0.304800><0.004808,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.909000,0.000000,22.247000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.909000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.594800,0.000000,18.618200>}
box{<0,0,-0.304800><0.969868,0.035000,0.304800> rotate<0,44.997030,0> translate<33.909000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.594800,0.000000,18.618200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.864000,0.000000,18.618200>}
box{<0,0,-0.304800><0.269200,0.035000,0.304800> rotate<0,0.000000,0> translate<34.594800,0.000000,18.618200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.227800,0.000000,30.909800>}
box{<0,0,-0.127000><2.763090,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.274000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.227800,0.000000,30.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.481800,0.000000,31.893200>}
box{<0,0,-0.127000><1.015673,0.035000,0.127000> rotate<0,-75.512740,0> translate<35.227800,0.000000,30.909800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.131000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.644000,-1.535000,25.865000>}
box{<0,0,-0.304800><4.968132,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.131000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.644000,-1.535000,25.865000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.644000,-1.535000,27.530000>}
box{<0,0,-0.304800><1.665000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.644000,-1.535000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.644000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.843000,0.000000,27.530000>}
box{<0,0,-0.304800><0.199000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.644000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.481800,0.000000,31.893200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.328400,0.000000,32.866800>}
box{<0,0,-0.127000><1.290205,0.035000,0.127000> rotate<0,-48.987971,0> translate<35.481800,0.000000,31.893200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.328400,0.000000,32.866800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.328400,0.000000,36.616200>}
box{<0,0,-0.127000><3.749400,0.035000,0.127000> rotate<0,90.000000,0> translate<36.328400,0.000000,36.616200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,40.005000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.639000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.764000,0.000000,18.618200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.512400,0.000000,19.366600>}
box{<0,0,-0.304800><1.058397,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.764000,0.000000,18.618200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.512400,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.512400,0.000000,19.366600>}
box{<0,0,-0.304800><2.883800,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.512400,0.000000,19.366600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.512400,0.000000,22.250400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.592000,0.000000,22.330000>}
box{<0,0,-0.304800><0.112571,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.512400,0.000000,22.250400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.592000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.592000,0.000000,22.330000>}
box{<0,0,-0.304800><3.451000,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.592000,0.000000,22.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.843000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.592000,0.000000,25.781000>}
box{<0,0,-0.304800><2.473460,0.035000,0.304800> rotate<0,44.997030,0> translate<35.843000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.644000,0.000000,27.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,31.002000>}
box{<0,0,-0.127000><4.565094,0.035000,0.127000> rotate<0,-49.509790,0> translate<35.644000,0.000000,27.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,38.608000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<37.211000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,31.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,38.608000>}
box{<0,0,-0.127000><7.606000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.608000,0.000000,38.608000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,48.260000>}
box{<0,0,-0.127000><38.735000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.255000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,-1.535000,48.260000>}
box{<0,0,-0.127000><38.735000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.255000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,9.525000>}
box{<0,0,-0.127000><31.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.255000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,9.525000>}
box{<0,0,-0.127000><31.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.255000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,48.260000>}
box{<0,0,-0.127000><31.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.255000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,48.260000>}
box{<0,0,-0.127000><31.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.255000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,9.525000>}
box{<0,0,-0.127000><38.735000,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.005000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,9.525000>}
box{<0,0,-0.127000><38.735000,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.005000,-1.535000,9.525000> }
texture{col_pol}
}
#end
union{
cylinder{<35.644000,0.038000,27.530000><35.644000,-1.538000,27.530000>0.508000}
cylinder{<33.104000,0.038000,27.530000><33.104000,-1.538000,27.530000>0.508000}
cylinder{<30.564000,0.038000,27.530000><30.564000,-1.538000,27.530000>0.508000}
cylinder{<28.024000,0.038000,27.530000><28.024000,-1.538000,27.530000>0.508000}
cylinder{<25.484000,0.038000,27.530000><25.484000,-1.538000,27.530000>0.508000}
cylinder{<22.944000,0.038000,27.530000><22.944000,-1.538000,27.530000>0.508000}
cylinder{<20.404000,0.038000,27.530000><20.404000,-1.538000,27.530000>0.508000}
cylinder{<17.864000,0.038000,27.530000><17.864000,-1.538000,27.530000>0.508000}
cylinder{<15.324000,0.038000,27.530000><15.324000,-1.538000,27.530000>0.508000}
cylinder{<12.784000,0.038000,27.530000><12.784000,-1.538000,27.530000>0.508000}
cylinder{<27.862000,0.038000,22.355000><27.862000,-1.538000,22.355000>0.546100}
cylinder{<25.322000,0.038000,22.355000><25.322000,-1.538000,22.355000>0.546100}
cylinder{<22.782000,0.038000,22.355000><22.782000,-1.538000,22.355000>0.546100}
cylinder{<20.242000,0.038000,22.355000><20.242000,-1.538000,22.355000>0.546100}
//Holes(fast)/Vias
cylinder{<14.351000,0.038000,37.973000><14.351000,-1.538000,37.973000>0.250000 }
cylinder{<12.700000,0.038000,35.306000><12.700000,-1.538000,35.306000>0.250000 }
cylinder{<32.258000,0.038000,30.353000><32.258000,-1.538000,30.353000>0.250000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.945100,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.945100,0.000000,36.324100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.945100,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.945100,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.436500,0.000000,36.324100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<8.945100,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.693500,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.816300,0.000000,36.815500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.693500,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.816300,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.816300,0.000000,36.324100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.816300,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.693500,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.939200,0.000000,36.324100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<9.693500,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.816300,0.000000,37.184200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.816300,0.000000,37.061300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.816300,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.683800,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.315200,0.000000,36.815500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<10.315200,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.315200,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.192400,0.000000,36.692700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.192400,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.192400,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.192400,0.000000,36.446900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.192400,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.192400,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.315200,0.000000,36.324100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<10.192400,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.315200,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.683800,0.000000,36.324100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<10.315200,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.309400,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.063600,0.000000,36.324100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.063600,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.063600,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.940800,0.000000,36.446900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<10.940800,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.940800,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.940800,0.000000,36.692700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<10.940800,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.940800,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.063600,0.000000,36.815500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.940800,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.063600,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.309400,0.000000,36.815500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.063600,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.309400,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.432200,0.000000,36.692700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.309400,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.432200,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.432200,0.000000,36.569800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.432200,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.432200,0.000000,36.569800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.940800,0.000000,36.569800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<10.940800,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.689200,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.689200,0.000000,36.815500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<11.689200,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.689200,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.057800,0.000000,36.815500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<11.689200,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.057800,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.180600,0.000000,36.692700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.057800,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.180600,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.180600,0.000000,36.324100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.180600,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.437600,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.806200,0.000000,36.324100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.437600,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.806200,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.929000,0.000000,36.446900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.806200,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.929000,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.806200,0.000000,36.569800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.806200,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.806200,0.000000,36.569800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.560400,0.000000,36.569800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.560400,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.560400,0.000000,36.569800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.437600,0.000000,36.692700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.437600,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.437600,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.560400,0.000000,36.815500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.437600,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.560400,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.929000,0.000000,36.815500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.560400,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.554600,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.308800,0.000000,36.324100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.308800,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.308800,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.186000,0.000000,36.446900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<13.186000,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.186000,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.186000,0.000000,36.692700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<13.186000,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.186000,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.308800,0.000000,36.815500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.186000,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.308800,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.554600,0.000000,36.815500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.308800,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.554600,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.677400,0.000000,36.692700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<13.554600,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.677400,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.677400,0.000000,36.569800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.677400,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.677400,0.000000,36.569800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.186000,0.000000,36.569800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<13.186000,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.815500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.934400,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.692700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.057200,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.692700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.934400,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.815500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<13.934400,0.000000,36.815500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.446900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.934400,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.324100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.057200,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.057200,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.324100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<13.934400,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.934400,0.000000,36.446900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<13.934400,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.548400,0.000000,36.938400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.425600,0.000000,37.061300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<15.425600,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.425600,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.179800,0.000000,37.061300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<15.179800,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.179800,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.057000,0.000000,36.938400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<15.057000,0.000000,36.938400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.057000,0.000000,36.938400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.057000,0.000000,36.446900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.057000,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.057000,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.179800,0.000000,36.324100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<15.057000,0.000000,36.446900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.179800,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.425600,0.000000,36.324100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<15.179800,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.425600,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.548400,0.000000,36.446900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.425600,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.548400,0.000000,36.446900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.548400,0.000000,36.692700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<15.548400,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.548400,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.302700,0.000000,36.692700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<15.302700,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.805400,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.805400,0.000000,37.061300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<15.805400,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.805400,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.174000,0.000000,37.061300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<15.805400,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.174000,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.296800,0.000000,36.938400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<16.174000,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.296800,0.000000,36.938400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.296800,0.000000,36.692700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.296800,0.000000,36.692700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.296800,0.000000,36.692700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.174000,0.000000,36.569800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<16.174000,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.174000,0.000000,36.569800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.805400,0.000000,36.569800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<15.805400,0.000000,36.569800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.553800,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.553800,0.000000,36.324100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.553800,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.553800,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.045200,0.000000,36.324100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<16.553800,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.793600,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.302200,0.000000,36.324100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<17.302200,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.302200,0.000000,36.324100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.793600,0.000000,36.815500>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.302200,0.000000,36.324100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.793600,0.000000,36.815500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.793600,0.000000,36.938400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<17.793600,0.000000,36.938400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.793600,0.000000,36.938400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.670800,0.000000,37.061300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<17.670800,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.670800,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.425000,0.000000,37.061300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<17.425000,0.000000,37.061300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.425000,0.000000,37.061300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.302200,0.000000,36.938400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<17.302200,0.000000,36.938400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.885500,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.885500,0.000000,43.073900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<21.885500,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.885500,0.000000,43.073900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.131200,0.000000,42.828100>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,45.008687,0> translate<21.885500,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.131200,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.376900,0.000000,43.073900>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-45.008687,0> translate<22.131200,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.376900,0.000000,43.073900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.376900,0.000000,42.336700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.376900,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.756700,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.002500,0.000000,42.828100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.756700,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.002500,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.125300,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<23.002500,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.125300,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.125300,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.125300,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.125300,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.756700,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.756700,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.756700,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.633900,0.000000,42.459500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.633900,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.633900,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.756700,0.000000,42.582400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<22.633900,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.756700,0.000000,42.582400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.125300,0.000000,42.582400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.756700,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.382300,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.382300,0.000000,43.073900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<23.382300,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.750900,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.382300,0.000000,42.582400>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,33.684257,0> translate<23.382300,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.382300,0.000000,42.582400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.750900,0.000000,42.828100>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-33.684257,0> translate<23.382300,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374500,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.128700,0.000000,42.336700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.128700,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.128700,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005900,0.000000,42.459500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.005900,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005900,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005900,0.000000,42.705300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<24.005900,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005900,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.128700,0.000000,42.828100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.005900,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.128700,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374500,0.000000,42.828100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.128700,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374500,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.497300,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.374500,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.497300,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.497300,0.000000,42.582400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.497300,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.497300,0.000000,42.582400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.005900,0.000000,42.582400>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<24.005900,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.754300,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.754300,0.000000,42.828100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<24.754300,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.754300,0.000000,42.582400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.000000,0.000000,42.828100>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.754300,0.000000,42.582400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.000000,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.122900,0.000000,42.828100>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<25.000000,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.377900,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.377900,0.000000,43.073900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<25.377900,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.377900,0.000000,43.073900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,43.073900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.377900,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,43.073900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.951000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<25.746500,0.000000,43.073900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.951000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.828100>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.869300,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.746500,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.582400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<25.746500,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.582400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.459500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.869300,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869300,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,42.336700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.746500,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.377900,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.377900,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.377900,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746500,0.000000,42.705300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.377900,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.249100,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.494900,0.000000,42.336700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.249100,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.494900,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.617700,0.000000,42.459500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.494900,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.617700,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.617700,0.000000,42.705300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<26.617700,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.617700,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.494900,0.000000,42.828100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<26.494900,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.494900,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.249100,0.000000,42.828100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.249100,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.249100,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.126300,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.126300,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.126300,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.126300,0.000000,42.459500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.126300,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.126300,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.249100,0.000000,42.336700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<26.126300,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.997500,0.000000,42.951000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.997500,0.000000,42.459500>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.997500,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.997500,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.120400,0.000000,42.336700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<26.997500,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.874700,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.120400,0.000000,42.828100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<26.874700,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.373600,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.373600,0.000000,42.459500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<27.373600,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.373600,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.496400,0.000000,42.459500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<27.373600,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.496400,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.496400,0.000000,42.336700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.496400,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.496400,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.373600,0.000000,42.336700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<27.373600,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.239200,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.870600,0.000000,42.828100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.870600,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.870600,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.747800,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.747800,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.747800,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.747800,0.000000,42.459500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.747800,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.747800,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.870600,0.000000,42.336700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.747800,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.870600,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.239200,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.870600,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.619000,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.864800,0.000000,42.336700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.619000,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.864800,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.987600,0.000000,42.459500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.864800,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.987600,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.987600,0.000000,42.705300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<28.987600,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.987600,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.864800,0.000000,42.828100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.864800,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.864800,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.619000,0.000000,42.828100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.619000,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.619000,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.496200,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.496200,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.496200,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.496200,0.000000,42.459500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.496200,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.496200,0.000000,42.459500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.619000,0.000000,42.336700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.496200,0.000000,42.459500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.244600,0.000000,42.336700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.244600,0.000000,42.828100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<29.244600,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.244600,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.367400,0.000000,42.828100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.244600,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.367400,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.490300,0.000000,42.705300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<29.367400,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.490300,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.490300,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.490300,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.490300,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.613200,0.000000,42.828100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<29.490300,0.000000,42.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.613200,0.000000,42.828100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.736000,0.000000,42.705300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<29.613200,0.000000,42.828100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.736000,0.000000,42.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.736000,0.000000,42.336700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.736000,0.000000,42.336700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.910900,0.000000,44.115300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.910900,0.000000,43.378100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.910900,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.910900,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.279500,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<21.910900,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.279500,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.402300,0.000000,43.500900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.279500,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.402300,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.402300,0.000000,43.992400>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<22.402300,0.000000,43.992400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.402300,0.000000,43.992400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.279500,0.000000,44.115300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<22.279500,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.279500,0.000000,44.115300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.910900,0.000000,44.115300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<21.910900,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.027900,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.782100,0.000000,43.378100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.782100,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.782100,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.659300,0.000000,43.500900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.659300,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.659300,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.659300,0.000000,43.746700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<22.659300,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.659300,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.782100,0.000000,43.869500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.659300,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.782100,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.027900,0.000000,43.869500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.782100,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.027900,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.150700,0.000000,43.746700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<23.027900,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.150700,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.150700,0.000000,43.623800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.150700,0.000000,43.623800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.150700,0.000000,43.623800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.659300,0.000000,43.623800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<22.659300,0.000000,43.623800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.407700,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.776300,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.407700,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.776300,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.899100,0.000000,43.500900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.776300,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.899100,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.776300,0.000000,43.623800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<23.776300,0.000000,43.623800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.776300,0.000000,43.623800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.530500,0.000000,43.623800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<23.530500,0.000000,43.623800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.530500,0.000000,43.623800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.407700,0.000000,43.746700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<23.407700,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.407700,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.530500,0.000000,43.869500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.407700,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.530500,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.899100,0.000000,43.869500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.530500,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.156100,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.278900,0.000000,43.869500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.156100,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.278900,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.278900,0.000000,43.378100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.278900,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.156100,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.401800,0.000000,43.378100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<24.156100,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.278900,0.000000,44.238200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.278900,0.000000,44.115300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.278900,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.900700,0.000000,43.132400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.023600,0.000000,43.132400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<24.900700,0.000000,43.132400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.023600,0.000000,43.132400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.146400,0.000000,43.255300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<25.023600,0.000000,43.132400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.146400,0.000000,43.255300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.146400,0.000000,43.869500>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,90.000000,0> translate<25.146400,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.146400,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.777800,0.000000,43.869500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<24.777800,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.777800,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.655000,0.000000,43.746700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.655000,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.655000,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.655000,0.000000,43.500900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.655000,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.655000,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.777800,0.000000,43.378100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.655000,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.777800,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.146400,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<24.777800,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.403400,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.403400,0.000000,43.869500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<25.403400,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.403400,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.772000,0.000000,43.869500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.403400,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.772000,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.894800,0.000000,43.746700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.772000,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.894800,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.894800,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.894800,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.900200,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.900200,0.000000,44.115300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<26.900200,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.900200,0.000000,44.115300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,44.115300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.900200,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,44.115300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.992400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<27.268800,0.000000,44.115300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.992400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.869500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.391600,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,43.746700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.268800,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.623800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<27.268800,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.623800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.500900>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.391600,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.391600,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,43.378100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.268800,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.900200,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.900200,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.900200,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.268800,0.000000,43.746700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.900200,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.648600,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.648600,0.000000,43.500900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.648600,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.648600,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.771400,0.000000,43.378100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.648600,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.771400,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.140000,0.000000,43.378100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.771400,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.140000,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.140000,0.000000,43.255300>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.140000,0.000000,43.255300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.140000,0.000000,43.255300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.017200,0.000000,43.132400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<28.017200,0.000000,43.132400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.017200,0.000000,43.132400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.894300,0.000000,43.132400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<27.894300,0.000000,43.132400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.869500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.397000,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.869500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.746700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.519800,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.746700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.397000,0.000000,43.746700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.746700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.869500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<28.397000,0.000000,43.869500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.500900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.397000,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.500900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.378100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.519800,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.519800,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.378100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.397000,0.000000,43.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.397000,0.000000,43.500900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<28.397000,0.000000,43.500900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,47.130300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<21.882100,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,47.130300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,46.884500>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,45.008687,0> translate<21.882100,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,47.130300>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-45.008687,0> translate<22.127800,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,47.130300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,46.393100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.373500,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999100,0.000000,46.884500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.753300,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999100,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.999100,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.121900,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.753300,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,46.515900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.630500,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,46.638800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<22.630500,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,46.638800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.753300,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.624600,0.000000,46.147400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.747500,0.000000,46.147400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<23.624600,0.000000,46.147400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.747500,0.000000,46.147400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,46.270300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<23.747500,0.000000,46.147400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,46.270300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,46.884500>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,90.000000,0> translate<23.870300,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,46.884500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.501700,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.378900,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,46.515900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.378900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,46.393100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<23.378900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.501700,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,46.884500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<24.127300,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,46.884500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<24.127300,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.495900,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.618700,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.244300,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,46.393100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.998500,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,46.515900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.875700,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,46.761700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<24.875700,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,46.884500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.875700,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.244300,0.000000,46.884500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.998500,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.244300,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.244300,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,46.638800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.367100,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,46.638800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<24.875700,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,47.007400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,46.515900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.746900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869800,0.000000,46.393100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<25.746900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.869800,0.000000,46.884500>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<25.624100,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.123000,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245800,0.000000,46.884500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.123000,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245800,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245800,0.000000,46.393100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.245800,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.123000,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.368700,0.000000,46.393100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<26.123000,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245800,0.000000,47.253200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.245800,0.000000,47.130300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.245800,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.113300,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.744700,0.000000,46.884500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.744700,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.744700,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.621900,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.621900,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.621900,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.621900,0.000000,46.515900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.621900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.621900,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.744700,0.000000,46.393100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<26.621900,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.744700,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.113300,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<26.744700,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118700,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118700,0.000000,47.130300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<28.118700,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118700,0.000000,47.130300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487300,0.000000,47.130300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.118700,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487300,0.000000,47.130300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.610100,0.000000,47.007400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<28.487300,0.000000,47.130300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.610100,0.000000,47.007400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.610100,0.000000,46.761700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.610100,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.610100,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487300,0.000000,46.638800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<28.487300,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487300,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118700,0.000000,46.638800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.118700,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.364400,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.610100,0.000000,46.393100>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<28.364400,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989900,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235700,0.000000,46.393100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.989900,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235700,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358500,0.000000,46.515900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.235700,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358500,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358500,0.000000,46.761700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.358500,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358500,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235700,0.000000,46.884500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<29.235700,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235700,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989900,0.000000,46.884500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.989900,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989900,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.867100,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.867100,0.000000,46.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.867100,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.867100,0.000000,46.515900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.867100,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.867100,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989900,0.000000,46.393100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.867100,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,47.007400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,46.515900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.738300,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.861200,0.000000,46.393100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<29.738300,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.861200,0.000000,46.884500>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<29.615500,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237200,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.483000,0.000000,46.884500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.237200,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.483000,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.605800,0.000000,46.761700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<30.483000,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.605800,0.000000,46.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.605800,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.605800,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.605800,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237200,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.237200,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237200,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114400,0.000000,46.515900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<30.114400,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114400,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237200,0.000000,46.638800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<30.114400,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237200,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.605800,0.000000,46.638800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.237200,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.862800,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.862800,0.000000,46.884500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<30.862800,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.862800,0.000000,46.638800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.108500,0.000000,46.884500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.862800,0.000000,46.638800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.108500,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.231400,0.000000,46.884500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<31.108500,0.000000,46.884500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.486400,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.486400,0.000000,46.515900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.486400,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.486400,0.000000,46.515900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.609200,0.000000,46.393100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<31.486400,0.000000,46.515900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.609200,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.977800,0.000000,46.393100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.609200,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.977800,0.000000,46.884500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.977800,0.000000,46.270300>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.977800,0.000000,46.270300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.977800,0.000000,46.270300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.855000,0.000000,46.147400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<31.855000,0.000000,46.147400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.855000,0.000000,46.147400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.732100,0.000000,46.147400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<31.732100,0.000000,46.147400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,45.987300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<21.882100,0.000000,45.987300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,45.250100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.882100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,45.250100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<21.882100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,45.618700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<21.882100,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,45.741500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<22.630500,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999100,0.000000,45.741500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.630500,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.999100,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,45.618700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.999100,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.121900,0.000000,45.250100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.121900,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,45.741500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.501700,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,45.618700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.378900,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,45.372900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.378900,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.378900,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,45.250100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<23.378900,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.501700,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.870300,0.000000,45.250100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.501700,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.250100,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,45.250100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.250100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,45.372900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.495900,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,45.618700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<24.618700,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.618700,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,45.741500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.495900,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.495900,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.250100,0.000000,45.741500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.250100,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.250100,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,45.618700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.127300,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,45.372900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.127300,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.127300,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.250100,0.000000,45.250100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.127300,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,45.250100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.367100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,45.250100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<24.998500,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,45.372900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.875700,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,45.618700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<24.875700,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.875700,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,45.741500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.875700,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.998500,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.367100,0.000000,45.741500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<24.998500,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.992700,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,45.250100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<25.746900,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,45.372900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.624100,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,45.618700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<25.624100,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,45.741500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.624100,0.000000,45.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.746900,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.992700,0.000000,45.741500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<25.746900,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.992700,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.115500,0.000000,45.618700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.992700,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.115500,0.000000,45.618700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.115500,0.000000,45.495800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.115500,0.000000,45.495800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.115500,0.000000,45.495800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.624100,0.000000,45.495800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<25.624100,0.000000,45.495800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.372500,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.372500,0.000000,45.741500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<26.372500,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.372500,0.000000,45.495800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.618200,0.000000,45.741500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.372500,0.000000,45.495800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.618200,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.741100,0.000000,45.741500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<26.618200,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.744500,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.990200,0.000000,45.250100>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,63.430762,0> translate<27.744500,0.000000,45.741500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.990200,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.235900,0.000000,45.741500>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,-63.430762,0> translate<27.990200,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.984300,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.492900,0.000000,45.250100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<28.492900,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.492900,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.984300,0.000000,45.741500>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.492900,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.984300,0.000000,45.741500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.984300,0.000000,45.864400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<28.984300,0.000000,45.864400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.984300,0.000000,45.864400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.861500,0.000000,45.987300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<28.861500,0.000000,45.987300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.861500,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.615700,0.000000,45.987300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.615700,0.000000,45.987300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.615700,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.492900,0.000000,45.864400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<28.492900,0.000000,45.864400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.241300,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.241300,0.000000,45.372900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.241300,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.241300,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.364100,0.000000,45.372900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.241300,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.364100,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.364100,0.000000,45.250100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.364100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.364100,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.241300,0.000000,45.250100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.241300,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,45.864400>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<29.615500,0.000000,45.864400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,45.864400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,45.987300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<29.615500,0.000000,45.864400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.984100,0.000000,45.987300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.738300,0.000000,45.987300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.984100,0.000000,45.987300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.106900,0.000000,45.864400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<29.984100,0.000000,45.987300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.106900,0.000000,45.864400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.106900,0.000000,45.372900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.106900,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.106900,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.984100,0.000000,45.250100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.984100,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.984100,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,45.250100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.738300,0.000000,45.250100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738300,0.000000,45.250100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,45.372900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<29.615500,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615500,0.000000,45.372900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.106900,0.000000,45.864400>}
box{<0,0,-0.038100><0.695015,0.036000,0.038100> rotate<0,-45.002859,0> translate<29.615500,0.000000,45.372900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,39.657900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.882100,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.004900,0.000000,39.535100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<21.882100,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.004900,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,39.657900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<22.004900,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.250700,0.000000,39.535100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<22.127800,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.250700,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.250700,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.373500,0.000000,40.026500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.373500,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,40.026500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.630500,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,39.535100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.753300,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.630500,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.876200,0.000000,39.535100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<22.630500,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,40.395200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.753300,0.000000,40.272300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.753300,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,40.272300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<23.129400,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,39.780800>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,33.684257,0> translate<23.129400,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,40.026500>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-33.684257,0> translate<23.129400,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.753000,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.875800,0.000000,40.026500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<23.753000,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.875800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.875800,0.000000,39.535100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.875800,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.753000,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.998700,0.000000,39.535100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<23.753000,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.875800,0.000000,40.395200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.875800,0.000000,40.272300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.875800,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.251900,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.251900,0.000000,39.657900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<24.251900,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.251900,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374700,0.000000,39.657900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.251900,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374700,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374700,0.000000,39.535100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.374700,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.374700,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.251900,0.000000,39.535100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.251900,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.626100,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.626100,0.000000,40.026500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<24.626100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.626100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.748900,0.000000,40.026500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<24.626100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.748900,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.871800,0.000000,39.903700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<24.748900,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.871800,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.871800,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.871800,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.871800,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.994700,0.000000,40.026500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<24.871800,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.994700,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.117500,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<24.994700,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.117500,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.117500,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.117500,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.497300,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.743100,0.000000,40.026500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<25.497300,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.743100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.865900,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.743100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.865900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.865900,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.865900,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.865900,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.497300,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.497300,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.497300,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.374500,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.374500,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.374500,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.497300,0.000000,39.780800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<25.374500,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.497300,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.865900,0.000000,39.780800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.497300,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.122900,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.122900,0.000000,40.272300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<26.122900,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.491500,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.122900,0.000000,39.780800>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,33.684257,0> translate<26.122900,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.122900,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.491500,0.000000,40.026500>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-33.684257,0> translate<26.122900,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.115100,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.869300,0.000000,39.535100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.869300,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.869300,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.746500,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<26.746500,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.746500,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.746500,0.000000,39.903700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<26.746500,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.746500,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.869300,0.000000,40.026500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.746500,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.869300,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.115100,0.000000,40.026500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.869300,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.115100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.237900,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.115100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.237900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.237900,0.000000,39.780800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.237900,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.237900,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.746500,0.000000,39.780800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<26.746500,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,40.026500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<27.494900,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.740600,0.000000,40.026500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.494900,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.740600,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.863500,0.000000,40.026500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<27.740600,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118500,0.000000,40.272300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118500,0.000000,39.535100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.118500,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118500,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487100,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.118500,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487100,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.609900,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.487100,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.609900,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.609900,0.000000,39.903700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<28.609900,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.609900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487100,0.000000,40.026500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.487100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.487100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.118500,0.000000,40.026500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.118500,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989700,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235500,0.000000,39.535100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.989700,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235500,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358300,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.235500,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358300,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358300,0.000000,39.903700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.358300,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.358300,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235500,0.000000,40.026500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<29.235500,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.235500,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989700,0.000000,40.026500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<28.989700,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989700,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.866900,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.866900,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.866900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.866900,0.000000,39.657900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.866900,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.866900,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.989700,0.000000,39.535100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.866900,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738100,0.000000,40.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738100,0.000000,39.657900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.738100,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.738100,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.861000,0.000000,39.535100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<29.738100,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.615300,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.861000,0.000000,40.026500>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<29.615300,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114200,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114200,0.000000,39.657900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<30.114200,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114200,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237000,0.000000,39.657900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.114200,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237000,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237000,0.000000,39.535100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.237000,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.237000,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.114200,0.000000,39.535100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.114200,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.979800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.611200,0.000000,40.026500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.611200,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.611200,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.488400,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.488400,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.488400,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.488400,0.000000,39.657900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.488400,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.488400,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.611200,0.000000,39.535100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<30.488400,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.611200,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.979800,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.611200,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.359600,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.605400,0.000000,39.535100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.359600,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.605400,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.728200,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.605400,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.728200,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.728200,0.000000,39.903700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<31.728200,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.728200,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.605400,0.000000,40.026500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<31.605400,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.605400,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.359600,0.000000,40.026500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.359600,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.359600,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.236800,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.236800,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.236800,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.236800,0.000000,39.657900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.236800,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.236800,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.359600,0.000000,39.535100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<31.236800,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.985200,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.985200,0.000000,40.026500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<31.985200,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.985200,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.108000,0.000000,40.026500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.985200,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.108000,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.230900,0.000000,39.903700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<32.108000,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.230900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.230900,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.230900,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.230900,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.353800,0.000000,40.026500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<32.230900,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.353800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.476600,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<32.353800,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.476600,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.476600,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.476600,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.733600,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.225000,0.000000,40.272300>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,-56.309803,0> translate<32.733600,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.482000,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.482000,0.000000,40.026500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<33.482000,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.482000,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.604800,0.000000,40.026500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<33.482000,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.604800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.727700,0.000000,39.903700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<33.604800,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.727700,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.727700,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.727700,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.727700,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.850600,0.000000,40.026500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<33.727700,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.850600,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.973400,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<33.850600,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.973400,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.973400,0.000000,39.535100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.973400,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.230400,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.230400,0.000000,40.026500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<34.230400,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.230400,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476100,0.000000,40.026500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.230400,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476100,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.599000,0.000000,40.026500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<34.476100,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.222600,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.976800,0.000000,39.535100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.976800,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.976800,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.854000,0.000000,39.657900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<34.854000,0.000000,39.657900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.854000,0.000000,39.657900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.854000,0.000000,39.903700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<34.854000,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.854000,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.976800,0.000000,40.026500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.854000,0.000000,39.903700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.976800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.222600,0.000000,40.026500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.976800,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.222600,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.345400,0.000000,39.903700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<35.222600,0.000000,40.026500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.345400,0.000000,39.903700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.345400,0.000000,39.780800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.345400,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.345400,0.000000,39.780800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.854000,0.000000,39.780800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<34.854000,0.000000,39.780800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093800,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.602400,0.000000,39.535100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<35.602400,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.602400,0.000000,39.535100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093800,0.000000,40.026500>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.602400,0.000000,39.535100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093800,0.000000,40.026500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093800,0.000000,40.149400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<36.093800,0.000000,40.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093800,0.000000,40.149400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.971000,0.000000,40.272300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<35.971000,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.971000,0.000000,40.272300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.725200,0.000000,40.272300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.725200,0.000000,40.272300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.725200,0.000000,40.272300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.602400,0.000000,40.149400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<35.602400,0.000000,40.149400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,40.551100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<21.882100,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.004900,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.004900,0.000000,41.288300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<22.004900,0.000000,41.288300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.882100,0.000000,41.288300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.127800,0.000000,41.288300>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<21.882100,0.000000,41.288300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.381000,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.381000,0.000000,41.042500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<22.381000,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.381000,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.749600,0.000000,41.042500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.381000,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.749600,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.872400,0.000000,40.919700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<22.749600,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.872400,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.872400,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.872400,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.129400,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.620800,0.000000,40.673900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.498000,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.620800,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,40.796800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<23.498000,0.000000,40.796800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.498000,0.000000,40.796800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.252200,0.000000,40.796800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<23.252200,0.000000,40.796800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.252200,0.000000,40.796800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,40.919700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<23.129400,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.129400,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.252200,0.000000,41.042500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.129400,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.252200,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.620800,0.000000,41.042500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<23.252200,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.000600,0.000000,41.165400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.000600,0.000000,40.673900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.000600,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.000600,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.123500,0.000000,40.551100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<24.000600,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.877800,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.123500,0.000000,41.042500>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<23.877800,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.376700,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.376700,0.000000,41.042500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<24.376700,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.376700,0.000000,40.796800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622400,0.000000,41.042500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.376700,0.000000,40.796800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622400,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.745300,0.000000,41.042500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<24.622400,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.000300,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.000300,0.000000,40.673900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.000300,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.000300,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.123100,0.000000,40.551100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.000300,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.123100,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.491700,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.123100,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.491700,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.491700,0.000000,41.042500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<25.491700,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.240100,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.871500,0.000000,41.042500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.871500,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.871500,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.748700,0.000000,40.919700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.748700,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.748700,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.748700,0.000000,40.673900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.748700,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.748700,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.871500,0.000000,40.551100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<25.748700,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.871500,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.240100,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.871500,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.619900,0.000000,41.165400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.619900,0.000000,40.673900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.619900,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.619900,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.742800,0.000000,40.551100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<26.619900,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.497100,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.742800,0.000000,41.042500>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<26.497100,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.996000,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.118800,0.000000,41.042500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<26.996000,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.118800,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.118800,0.000000,40.551100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.118800,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.996000,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.241700,0.000000,40.551100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<26.996000,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.118800,0.000000,41.411200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.118800,0.000000,41.288300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.118800,0.000000,41.288300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.617700,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.863500,0.000000,40.551100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<27.617700,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.863500,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.986300,0.000000,40.673900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.863500,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.986300,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.986300,0.000000,40.919700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<27.986300,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.986300,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.863500,0.000000,41.042500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.863500,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.863500,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.617700,0.000000,41.042500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<27.617700,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.617700,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,40.919700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.494900,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,40.673900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.494900,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.494900,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.617700,0.000000,40.551100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<27.494900,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.243300,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.243300,0.000000,41.042500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<28.243300,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.243300,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.611900,0.000000,41.042500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.243300,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.611900,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.734700,0.000000,40.919700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<28.611900,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.734700,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.734700,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.734700,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.991700,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.360300,0.000000,40.551100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.991700,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.360300,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.483100,0.000000,40.673900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.360300,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.483100,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.360300,0.000000,40.796800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<29.360300,0.000000,40.796800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.360300,0.000000,40.796800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.114500,0.000000,40.796800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.114500,0.000000,40.796800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.114500,0.000000,40.796800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.991700,0.000000,40.919700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<28.991700,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.991700,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.114500,0.000000,41.042500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.991700,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.114500,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.483100,0.000000,41.042500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.114500,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,41.042500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.740100,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,41.042500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.919700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.862900,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.919700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.740100,0.000000,40.919700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.919700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,41.042500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.740100,0.000000,41.042500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.673900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.740100,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.673900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.551100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.862900,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.862900,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.551100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.740100,0.000000,40.551100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.551100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740100,0.000000,40.673900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<29.740100,0.000000,40.673900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.344100,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.971100,0.000000,29.972400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<35.344100,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.657600,0.000000,30.285900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.657600,0.000000,29.658800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.657600,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.804100,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.431100,0.000000,29.972400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<32.804100,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,29.629100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,30.256100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.264100,0.000000,30.256100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,30.256100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.577600,0.000000,30.569700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<30.264100,0.000000,30.256100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.577600,0.000000,30.569700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,30.256100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<30.577600,0.000000,30.569700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,30.256100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,29.629100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.891100,0.000000,29.629100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,30.099400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,30.099400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<30.264100,0.000000,30.099400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,29.629100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,30.569700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.724100,0.000000,30.569700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,30.569700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,30.569700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,30.569700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,30.569700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,30.412900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.194400,0.000000,30.569700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,30.412900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,30.256100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.351100,0.000000,30.256100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,30.256100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,30.099400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.194400,0.000000,30.099400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,30.099400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,29.942600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.194400,0.000000,30.099400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,29.942600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,29.785800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.351100,0.000000,29.785800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,29.785800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,29.629100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.194400,0.000000,29.629100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,29.629100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,29.629100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,29.629100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,30.099400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,30.099400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,30.099400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,29.502100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.056300,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,29.972400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<25.056300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.213100,0.000000,30.129100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<25.056300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.213100,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.526600,0.000000,30.129100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<25.213100,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.526600,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.683400,0.000000,29.972400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<25.526600,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.683400,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.683400,0.000000,29.502100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.683400,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,30.437600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.056300,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.683400,0.000000,30.751100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<25.683400,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.683400,0.000000,30.751100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,31.064600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.683400,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,31.064600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,31.064600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.056300,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,31.373100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.056300,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.369900,0.000000,31.686600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<25.056300,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.369900,0.000000,31.686600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,32.000100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<25.056300,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.056300,0.000000,32.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.996900,0.000000,32.000100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.056300,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.673100,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,29.972400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<22.516300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,29.658800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.516300,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.673100,0.000000,29.502100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<22.516300,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.673100,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.829900,0.000000,29.502100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<22.673100,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.829900,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,29.658800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.829900,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,29.972400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.986600,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.143400,0.000000,30.129100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<22.986600,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.143400,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.300200,0.000000,30.129100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<23.143400,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.300200,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,29.972400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<23.300200,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,29.658800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.456900,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.300200,0.000000,29.502100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.300200,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,31.064600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,30.437600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.516300,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,30.437600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.516300,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,31.064600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<23.456900,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.986600,0.000000,30.751100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<22.986600,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.516300,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,31.373100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.516300,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.456900,0.000000,32.000100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<23.456900,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.133100,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,29.972400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<19.976300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,29.658800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.976300,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.133100,0.000000,29.502100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<19.976300,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.133100,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.760200,0.000000,29.502100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<20.133100,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.760200,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,29.658800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.760200,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,29.972400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<20.916900,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.760200,0.000000,30.129100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<20.760200,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,30.437600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.976300,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,31.064600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<20.916900,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,31.373100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<19.976300,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.603400,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.976300,0.000000,32.000100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<19.976300,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.446600,0.000000,31.529800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.916900,0.000000,32.000100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.446600,0.000000,31.529800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,29.502100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<17.436300,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,29.972400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<18.376900,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.220200,0.000000,30.129100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<18.220200,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.220200,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.593100,0.000000,30.129100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<17.593100,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.593100,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,29.972400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<17.436300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,29.502100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.436300,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,30.437600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.749900,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,30.751100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<17.436300,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,30.751100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,31.064600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<17.436300,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,31.064600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,31.064600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.749900,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.906600,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.906600,0.000000,31.064600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<17.906600,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,31.686600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,31.686600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<17.436300,0.000000,31.686600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,32.000100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<17.436300,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,32.308600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,32.308600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.749900,0.000000,32.308600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,32.308600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,32.622100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<17.436300,0.000000,32.622100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.436300,0.000000,32.622100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,32.935600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<17.436300,0.000000,32.622100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.749900,0.000000,32.935600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.376900,0.000000,32.935600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<17.749900,0.000000,32.935600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.906600,0.000000,32.308600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.906600,0.000000,32.935600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<17.906600,0.000000,32.935600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,29.502100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.896300,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,29.972400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<14.896300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,30.129100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<14.896300,0.000000,29.972400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,30.129100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<15.053100,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,30.129100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,29.972400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<15.366600,0.000000,30.129100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,29.972400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,29.502100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.523400,0.000000,29.502100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,30.437600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<14.896300,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,30.437600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,30.907900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<14.896300,0.000000,30.907900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,30.907900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,31.064600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<14.896300,0.000000,30.907900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,31.064600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,31.064600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<15.053100,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,31.064600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,30.907900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<15.366600,0.000000,31.064600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,30.907900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,30.437600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.523400,0.000000,30.437600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523400,0.000000,30.751100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,31.064600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.523400,0.000000,30.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,31.843400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,31.529800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.896300,0.000000,31.529800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,31.529800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,31.373100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<14.896300,0.000000,31.529800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,31.373100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<15.053100,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,31.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,31.529800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.680200,0.000000,31.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,31.529800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,31.843400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<15.836900,0.000000,31.843400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,31.843400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.000100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.680200,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,32.000100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<15.053100,0.000000,32.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,32.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,31.843400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<14.896300,0.000000,31.843400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,32.935600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,32.778900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<14.896300,0.000000,32.778900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,32.778900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,32.465300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.896300,0.000000,32.465300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.896300,0.000000,32.465300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,32.308600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<14.896300,0.000000,32.465300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.053100,0.000000,32.308600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.308600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<15.053100,0.000000,32.308600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.308600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,32.465300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.680200,0.000000,32.308600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,32.465300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,32.778900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<15.836900,0.000000,32.778900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.836900,0.000000,32.778900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.935600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<15.680200,0.000000,32.935600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.680200,0.000000,32.935600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,32.935600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<15.366600,0.000000,32.935600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,32.935600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.366600,0.000000,32.622100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.366600,0.000000,32.622100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,29.815600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<13.296900,0.000000,29.815600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,29.658800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,29.658800>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.356300,0.000000,29.658800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,29.502100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,29.815600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<12.356300,0.000000,29.815600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,30.125700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,30.125700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.356300,0.000000,30.125700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,30.125700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,30.752700>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<12.356300,0.000000,30.125700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,30.752700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,30.752700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.356300,0.000000,30.752700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.061200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.061200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.356300,0.000000,31.061200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.061200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.531500>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<13.296900,0.000000,31.531500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.531500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.140200,0.000000,31.688200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<13.140200,0.000000,31.688200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.140200,0.000000,31.688200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.513100,0.000000,31.688200>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<12.513100,0.000000,31.688200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.513100,0.000000,31.688200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.531500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<12.356300,0.000000,31.531500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.531500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.061200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.356300,0.000000,31.061200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,32.623700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.996700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.356300,0.000000,31.996700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,31.996700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.996700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.356300,0.000000,31.996700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,31.996700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,32.623700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<13.296900,0.000000,32.623700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.826600,0.000000,31.996700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.826600,0.000000,32.310200>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<12.826600,0.000000,32.310200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,32.932200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,33.559200>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<12.356300,0.000000,32.932200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.356300,0.000000,33.559200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.296900,0.000000,32.932200>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<12.356300,0.000000,33.559200> }
//+ silk screen
object{ARC(0.350000,0.101600,0.000000,180.000000,0.036000) translate<19.583400,0.000000,39.360600>}
object{ARC(0.350000,0.101600,180.000000,360.000000,0.036000) translate<19.583400,0.000000,41.360600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.008400,0.000000,39.835600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.008400,0.000000,40.885600>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<19.008400,0.000000,40.885600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.158400,0.000000,40.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.158400,0.000000,39.435600>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.158400,0.000000,39.435600> }
difference{
cylinder{<20.033400,0,39.510600><20.033400,0.036000,39.510600>0.153800 translate<0,0.000000,0>}
cylinder{<20.033400,-0.1,39.510600><20.033400,0.135000,39.510600>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<19.120900,0.000000,39.610600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.833400,0.000000,39.735600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.333400,0.000000,39.735600>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<19.583400,0.000000,39.773100>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<19.120900,0.000000,41.110600>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<20.045900,0.000000,41.110600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.333400,0.000000,40.985600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.833400,0.000000,40.985600>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<19.583400,0.000000,40.948100>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<19.583400,0.000000,40.260600>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<20.033400,0.000000,39.710600>}
box{<-0.112500,0,-0.037500><0.112500,0.036000,0.037500> rotate<0,-180.000000,0> translate<20.095900,0.000000,39.398100>}
//- silk screen
object{ARC(0.350000,0.101600,0.000000,180.000000,0.036000) translate<17.018000,0.000000,39.360600>}
object{ARC(0.350000,0.101600,180.000000,360.000000,0.036000) translate<17.018000,0.000000,41.360600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.443000,0.000000,39.835600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.443000,0.000000,40.885600>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<16.443000,0.000000,40.885600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.593000,0.000000,40.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.593000,0.000000,39.435600>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.593000,0.000000,39.435600> }
difference{
cylinder{<17.468000,0,39.510600><17.468000,0.036000,39.510600>0.153800 translate<0,0.000000,0>}
cylinder{<17.468000,-0.1,39.510600><17.468000,0.135000,39.510600>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<16.555500,0.000000,39.610600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<17.268000,0.000000,39.735600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<16.768000,0.000000,39.735600>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<17.018000,0.000000,39.773100>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<16.555500,0.000000,41.110600>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<17.480500,0.000000,41.110600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<16.768000,0.000000,40.985600>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<17.268000,0.000000,40.985600>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<17.018000,0.000000,40.948100>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<17.018000,0.000000,40.260600>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<17.468000,0.000000,39.710600>}
box{<-0.112500,0,-0.037500><0.112500,0.036000,0.037500> rotate<0,-180.000000,0> translate<17.530500,0.000000,39.398100>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.195000,0.000000,17.958200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.433000,0.000000,17.958200>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.433000,0.000000,17.958200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.170000,0.000000,19.278200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.433000,0.000000,19.278200>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<35.433000,0.000000,19.278200> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<36.531000,0.000000,18.617100>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<35.083400,0.000000,18.617100>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.836600,0.000000,37.835400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.835400>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,37.835400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.983400,0.000000,37.632200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.632200>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,37.632200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.100700,0.000000,37.429000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.429000>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,37.429000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.191000,0.000000,37.225800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.225800>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,37.225800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.253300,0.000000,37.022600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.022600>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,37.022600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.298600,0.000000,36.819400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,36.819400>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,36.819400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.328400,0.000000,36.616200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,36.616200>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,36.616200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.306800,0.000000,36.413000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,36.413000>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,36.413000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.268200,0.000000,36.209800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,36.209800>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,36.209800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.210900,0.000000,36.006600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,36.006600>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,36.006600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.120600,0.000000,35.803400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,35.803400>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,35.803400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.000700,0.000000,35.600200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,35.600200>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,35.600200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.845600,0.000000,35.397000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,35.397000>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,0.000000,0> translate<35.728400,0.000000,35.397000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.966200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,35.266200>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.728400,0.000000,35.266200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,35.266200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.930500,0.000000,35.491700>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,-48.129156,0> translate<35.728400,0.000000,35.266200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.930500,0.000000,35.491700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.095100,0.000000,35.745900>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,-57.072303,0> translate<35.930500,0.000000,35.491700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.095100,0.000000,35.745900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.218100,0.000000,36.022600>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,-66.029311,0> translate<36.095100,0.000000,35.745900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.218100,0.000000,36.022600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.296500,0.000000,36.315100>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,-74.990507,0> translate<36.218100,0.000000,36.022600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.296500,0.000000,36.315100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.328400,0.000000,36.616200>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,-83.946825,0> translate<36.296500,0.000000,36.315100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.328400,0.000000,36.616200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.284700,0.000000,36.914000>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,81.646451,0> translate<36.284700,0.000000,36.914000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.284700,0.000000,36.914000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.201000,0.000000,37.203200>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,73.853673,0> translate<36.201000,0.000000,37.203200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.201000,0.000000,37.203200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.078700,0.000000,37.478300>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,66.027356,0> translate<36.078700,0.000000,37.478300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.078700,0.000000,37.478300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.920200,0.000000,37.734200>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,58.222805,0> translate<35.920200,0.000000,37.734200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.920200,0.000000,37.734200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.728400,0.000000,37.966200>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,50.415312,0> translate<35.728400,0.000000,37.966200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.578400,0.000000,34.566200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.278400,0.000000,34.566200>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.278400,0.000000,34.566200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.278400,0.000000,34.566200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.478400,0.000000,35.366200>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<32.478400,0.000000,35.366200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.478400,0.000000,35.366200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.478400,0.000000,37.866200>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.478400,0.000000,37.866200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.478400,0.000000,37.866200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.278400,0.000000,38.666200>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.478400,0.000000,37.866200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.278400,0.000000,38.666200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.578400,0.000000,38.666200>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.278400,0.000000,38.666200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.578400,0.000000,38.666200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.578400,0.000000,34.566200>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.578400,0.000000,34.566200> }
difference{
cylinder{<34.528400,0,36.616200><34.528400,0.036000,36.616200>1.951600 translate<0,0.000000,0>}
cylinder{<34.528400,-0.1,36.616200><34.528400,0.135000,36.616200>1.748400 translate<0,0.000000,0>}}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.404200,0.000000,21.031200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,21.031200>}
box{<0,0,-0.101600><0.108200,0.036000,0.101600> rotate<0,0.000000,0> translate<34.404200,0.000000,21.031200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.257400,0.000000,21.234400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,21.234400>}
box{<0,0,-0.101600><0.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.257400,0.000000,21.234400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.140100,0.000000,21.437600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,21.437600>}
box{<0,0,-0.101600><0.372300,0.036000,0.101600> rotate<0,0.000000,0> translate<34.140100,0.000000,21.437600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.049800,0.000000,21.640800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,21.640800>}
box{<0,0,-0.101600><0.462600,0.036000,0.101600> rotate<0,0.000000,0> translate<34.049800,0.000000,21.640800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.987500,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,21.844000>}
box{<0,0,-0.101600><0.524900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.987500,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.942200,0.000000,22.047200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,22.047200>}
box{<0,0,-0.101600><0.570200,0.036000,0.101600> rotate<0,0.000000,0> translate<33.942200,0.000000,22.047200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.912400,0.000000,22.250400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,22.250400>}
box{<0,0,-0.101600><0.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.912400,0.000000,22.250400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.934000,0.000000,22.453600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,22.453600>}
box{<0,0,-0.101600><0.578400,0.036000,0.101600> rotate<0,0.000000,0> translate<33.934000,0.000000,22.453600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.972600,0.000000,22.656800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,22.656800>}
box{<0,0,-0.101600><0.539800,0.036000,0.101600> rotate<0,0.000000,0> translate<33.972600,0.000000,22.656800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.029900,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,22.860000>}
box{<0,0,-0.101600><0.482500,0.036000,0.101600> rotate<0,0.000000,0> translate<34.029900,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.120200,0.000000,23.063200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,23.063200>}
box{<0,0,-0.101600><0.392200,0.036000,0.101600> rotate<0,0.000000,0> translate<34.120200,0.000000,23.063200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.240100,0.000000,23.266400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,23.266400>}
box{<0,0,-0.101600><0.272300,0.036000,0.101600> rotate<0,0.000000,0> translate<34.240100,0.000000,23.266400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.395200,0.000000,23.469600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,23.469600>}
box{<0,0,-0.101600><0.117200,0.036000,0.101600> rotate<0,0.000000,0> translate<34.395200,0.000000,23.469600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,20.900400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,23.600400>}
box{<0,0,-0.101600><2.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.512400,0.000000,23.600400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,23.600400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.310300,0.000000,23.374900>}
box{<0,0,-0.101600><0.302811,0.036000,0.101600> rotate<0,-48.129156,0> translate<34.310300,0.000000,23.374900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.310300,0.000000,23.374900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.145700,0.000000,23.120700>}
box{<0,0,-0.101600><0.302838,0.036000,0.101600> rotate<0,-57.072303,0> translate<34.145700,0.000000,23.120700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.145700,0.000000,23.120700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.022700,0.000000,22.844000>}
box{<0,0,-0.101600><0.302807,0.036000,0.101600> rotate<0,-66.029311,0> translate<34.022700,0.000000,22.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.022700,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.944300,0.000000,22.551500>}
box{<0,0,-0.101600><0.302825,0.036000,0.101600> rotate<0,-74.990507,0> translate<33.944300,0.000000,22.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.944300,0.000000,22.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.912400,0.000000,22.250400>}
box{<0,0,-0.101600><0.302785,0.036000,0.101600> rotate<0,-83.946825,0> translate<33.912400,0.000000,22.250400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.912400,0.000000,22.250400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.956100,0.000000,21.952600>}
box{<0,0,-0.101600><0.300989,0.036000,0.101600> rotate<0,81.646451,0> translate<33.912400,0.000000,22.250400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.956100,0.000000,21.952600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.039800,0.000000,21.663400>}
box{<0,0,-0.101600><0.301069,0.036000,0.101600> rotate<0,73.853673,0> translate<33.956100,0.000000,21.952600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.039800,0.000000,21.663400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.162100,0.000000,21.388300>}
box{<0,0,-0.101600><0.301060,0.036000,0.101600> rotate<0,66.027356,0> translate<34.039800,0.000000,21.663400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.162100,0.000000,21.388300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.320600,0.000000,21.132400>}
box{<0,0,-0.101600><0.301010,0.036000,0.101600> rotate<0,58.222805,0> translate<34.162100,0.000000,21.388300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.320600,0.000000,21.132400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.512400,0.000000,20.900400>}
box{<0,0,-0.101600><0.301017,0.036000,0.101600> rotate<0,50.415312,0> translate<34.320600,0.000000,21.132400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.662400,0.000000,24.300400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.962400,0.000000,24.300400>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.662400,0.000000,24.300400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.962400,0.000000,24.300400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.762400,0.000000,23.500400>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,44.997030,0> translate<36.962400,0.000000,24.300400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.762400,0.000000,23.500400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.762400,0.000000,21.000400>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.762400,0.000000,21.000400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.762400,0.000000,21.000400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.962400,0.000000,20.200400>}
box{<0,0,-0.101600><1.131371,0.036000,0.101600> rotate<0,-44.997030,0> translate<36.962400,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.962400,0.000000,20.200400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.662400,0.000000,20.200400>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.662400,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.662400,0.000000,20.200400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.662400,0.000000,24.300400>}
box{<0,0,-0.101600><4.100000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.662400,0.000000,24.300400> }
difference{
cylinder{<35.712400,0,22.250400><35.712400,0.036000,22.250400>1.951600 translate<0,0.000000,0>}
cylinder{<35.712400,-0.1,22.250400><35.712400,0.135000,22.250400>1.748400 translate<0,0.000000,0>}}
//H1 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<36.529200,0.000000,44.654000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<36.529200,0.000000,44.654000>}
difference{
cylinder{<36.529200,0,44.654000><36.529200,0.036000,44.654000>3.505200 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.654000><36.529200,0.135000,44.654000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,44.654000><36.529200,0.036000,44.654000>0.990600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.654000><36.529200,0.135000,44.654000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,44.654000><36.529200,0.036000,44.654000>1.701600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.654000><36.529200,0.135000,44.654000>1.498400 translate<0,0.000000,0>}}
//H2 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<36.529200,0.000000,13.148000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<36.529200,0.000000,13.148000>}
difference{
cylinder{<36.529200,0,13.148000><36.529200,0.036000,13.148000>3.505200 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,13.148000><36.529200,0.135000,13.148000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,13.148000><36.529200,0.036000,13.148000>0.990600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,13.148000><36.529200,0.135000,13.148000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,13.148000><36.529200,0.036000,13.148000>1.701600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,13.148000><36.529200,0.135000,13.148000>1.498400 translate<0,0.000000,0>}}
//H3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<11.627200,0.000000,13.148000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<11.627200,0.000000,13.148000>}
difference{
cylinder{<11.627200,0,13.148000><11.627200,0.036000,13.148000>3.505200 translate<0,0.000000,0>}
cylinder{<11.627200,-0.1,13.148000><11.627200,0.135000,13.148000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<11.627200,0,13.148000><11.627200,0.036000,13.148000>0.990600 translate<0,0.000000,0>}
cylinder{<11.627200,-0.1,13.148000><11.627200,0.135000,13.148000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<11.627200,0,13.148000><11.627200,0.036000,13.148000>1.701600 translate<0,0.000000,0>}
cylinder{<11.627200,-0.1,13.148000><11.627200,0.135000,13.148000>1.498400 translate<0,0.000000,0>}}
//H4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<11.638400,0.000000,44.650000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<11.638400,0.000000,44.650000>}
difference{
cylinder{<11.638400,0,44.650000><11.638400,0.036000,44.650000>3.505200 translate<0,0.000000,0>}
cylinder{<11.638400,-0.1,44.650000><11.638400,0.135000,44.650000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<11.638400,0,44.650000><11.638400,0.036000,44.650000>0.990600 translate<0,0.000000,0>}
cylinder{<11.638400,-0.1,44.650000><11.638400,0.135000,44.650000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<11.638400,0,44.650000><11.638400,0.036000,44.650000>1.701600 translate<0,0.000000,0>}
cylinder{<11.638400,-0.1,44.650000><11.638400,0.135000,44.650000>1.498400 translate<0,0.000000,0>}}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,38.704200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,32.568200>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.195800,0.000000,32.568200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,32.568200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,32.568200>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.165800,0.000000,32.568200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,32.568200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,38.704200>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.165800,0.000000,38.704200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.165800,0.000000,38.704200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.195800,0.000000,38.704200>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.165800,0.000000,38.704200> }
difference{
cylinder{<21.815800,0,38.156200><21.815800,0.036000,38.156200>0.491600 translate<0,0.000000,0>}
cylinder{<21.815800,-0.1,38.156200><21.815800,0.135000,38.156200>0.288400 translate<0,0.000000,0>}}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.959000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.959000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.959000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.689000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.689000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.689000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.054000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.054000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.689000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.054000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.689000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.959000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.689000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.959000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.959000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.039000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.769000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.769000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.769000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.134000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.134000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.769000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.134000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.499000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.499000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.499000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.229000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.229000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.229000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.594000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.594000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.594000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.229000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.594000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.229000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.499000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.229000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.499000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.134000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.499000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.579000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.579000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.579000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.309000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.309000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.309000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.674000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.674000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.309000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.674000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.309000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.579000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.309000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.579000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.579000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.039000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.039000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.674000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.039000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.039000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.769000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.039000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.769000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.659000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.389000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.389000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.389000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.754000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.754000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.389000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.754000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.119000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.119000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.119000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.849000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.849000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.849000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.214000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.214000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.214000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.849000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.214000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.849000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.119000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.849000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.119000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.754000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.119000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.199000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.199000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.199000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.929000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.294000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.294000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.294000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.199000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.929000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.199000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.199000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.659000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.659000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.294000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.659000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<28.659000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.389000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.659000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.389000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.279000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.009000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.009000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.009000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.374000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.374000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.009000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.374000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.739000,0.000000,26.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.739000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.739000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.469000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.469000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.469000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.834000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.834000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.834000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.469000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.834000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.469000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.739000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.469000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.739000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.374000,0.000000,28.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.739000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.914000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.914000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.914000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.279000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.914000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.279000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.914000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.279000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.279000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.009000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.279000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.009000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.419000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.149000,0.000000,26.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.149000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.149000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.514000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<11.514000,0.000000,26.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.514000,0.000000,26.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.514000,0.000000,28.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.514000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.514000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.149000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.514000,0.000000,28.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.419000,0.000000,26.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,26.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.419000,0.000000,26.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.054000,0.000000,28.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.419000,0.000000,28.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.419000,0.000000,28.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.149000,0.000000,28.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.419000,0.000000,28.800000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.149000,0.000000,28.800000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.324000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<17.864000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<20.404000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<22.944000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<25.484000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<28.024000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<30.564000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.104000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<35.644000,0.000000,27.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<12.784000,0.000000,27.530000>}
//QUADA silk screen
object{ARC(0.350000,0.101600,270.000000,450.000000,0.036000) translate<14.214600,0.000000,19.354800>}
object{ARC(0.350000,0.101600,90.000000,270.000000,0.036000) translate<16.214600,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.689600,0.000000,19.929800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.739600,0.000000,19.929800>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.689600,0.000000,19.929800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.714600,0.000000,18.779800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.289600,0.000000,18.779800>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.289600,0.000000,18.779800> }
difference{
cylinder{<14.364600,0,18.904800><14.364600,0.036000,18.904800>0.153800 translate<0,0.000000,0>}
cylinder{<14.364600,-0.1,18.904800><14.364600,0.135000,18.904800>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<14.464600,0.000000,19.817300>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<14.589600,0.000000,19.104800>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<14.589600,0.000000,19.604800>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<14.627100,0.000000,19.354800>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<15.964600,0.000000,19.817300>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<15.964600,0.000000,18.892300>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<15.839600,0.000000,19.604800>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<15.839600,0.000000,19.104800>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<15.802100,0.000000,19.354800>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<15.114600,0.000000,19.354800>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<14.564600,0.000000,18.904800>}
box{<-0.112500,0,-0.037500><0.112500,0.036000,0.037500> rotate<0,-90.000000,0> translate<14.252100,0.000000,18.842300>}
//QUADB silk screen
object{ARC(0.350000,0.101600,270.000000,450.000000,0.036000) translate<14.240000,0.000000,22.860000>}
object{ARC(0.350000,0.101600,90.000000,270.000000,0.036000) translate<16.240000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.715000,0.000000,23.435000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.765000,0.000000,23.435000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.715000,0.000000,23.435000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.740000,0.000000,22.285000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.315000,0.000000,22.285000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.315000,0.000000,22.285000> }
difference{
cylinder{<14.390000,0,22.410000><14.390000,0.036000,22.410000>0.153800 translate<0,0.000000,0>}
cylinder{<14.390000,-0.1,22.410000><14.390000,0.135000,22.410000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<14.490000,0.000000,23.322500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<14.615000,0.000000,22.610000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<14.615000,0.000000,23.110000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<14.652500,0.000000,22.860000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<15.990000,0.000000,23.322500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<15.990000,0.000000,22.397500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<15.865000,0.000000,23.110000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<15.865000,0.000000,22.610000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<15.827500,0.000000,22.860000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<15.140000,0.000000,22.860000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<14.590000,0.000000,22.410000>}
box{<-0.112500,0,-0.037500><0.112500,0.036000,0.037500> rotate<0,-90.000000,0> translate<14.277500,0.000000,22.347500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,44.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.923000,0.000000,44.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,44.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.193000,0.000000,44.860000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<19.556500,0.000000,45.181400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<19.556500,0.000000,43.708200>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,44.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.383000,0.000000,44.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,44.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.653000,0.000000,44.860000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<17.016500,0.000000,45.181400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<17.016500,0.000000,43.708200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.941800,0.000000,31.258200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.121800,0.000000,31.258200>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.121800,0.000000,31.258200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.941800,0.000000,32.528200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.121800,0.000000,32.528200>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.121800,0.000000,32.528200> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<33.800400,0.000000,31.891700>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<35.273600,0.000000,31.891700>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.766000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.586000,0.000000,20.066000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.766000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.766000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.586000,0.000000,18.796000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.766000,0.000000,18.796000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<11.907400,0.000000,19.432500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<10.434200,0.000000,19.432500>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.766000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.586000,0.000000,23.495000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.766000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.766000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.586000,0.000000,22.225000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.766000,0.000000,22.225000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<11.907400,0.000000,22.861500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<10.434200,0.000000,22.861500>}
//U$1 silk screen
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.301900,0.000000,10.721800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.279700,0.000000,10.721800>}
box{<0,0,-0.025400><0.022200,0.036000,0.025400> rotate<0,0.000000,0> translate<29.279700,0.000000,10.721800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.314600,0.000000,10.671000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.267000,0.000000,10.671000>}
box{<0,0,-0.025400><0.047600,0.036000,0.025400> rotate<0,0.000000,0> translate<29.267000,0.000000,10.671000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.327300,0.000000,10.620200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.254300,0.000000,10.620200>}
box{<0,0,-0.025400><0.073000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.254300,0.000000,10.620200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.340000,0.000000,10.569400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.241600,0.000000,10.569400>}
box{<0,0,-0.025400><0.098400,0.036000,0.025400> rotate<0,0.000000,0> translate<29.241600,0.000000,10.569400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.352700,0.000000,10.518600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.228900,0.000000,10.518600>}
box{<0,0,-0.025400><0.123800,0.036000,0.025400> rotate<0,0.000000,0> translate<29.228900,0.000000,10.518600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.365400,0.000000,10.467800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.216200,0.000000,10.467800>}
box{<0,0,-0.025400><0.149200,0.036000,0.025400> rotate<0,0.000000,0> translate<29.216200,0.000000,10.467800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.378100,0.000000,10.417000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.203500,0.000000,10.417000>}
box{<0,0,-0.025400><0.174600,0.036000,0.025400> rotate<0,0.000000,0> translate<29.203500,0.000000,10.417000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.390800,0.000000,10.366200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.190800,0.000000,10.366200>}
box{<0,0,-0.025400><0.200000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.190800,0.000000,10.366200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.403500,0.000000,10.315400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.178100,0.000000,10.315400>}
box{<0,0,-0.025400><0.225400,0.036000,0.025400> rotate<0,0.000000,0> translate<29.178100,0.000000,10.315400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.416200,0.000000,10.264600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.165400,0.000000,10.264600>}
box{<0,0,-0.025400><0.250800,0.036000,0.025400> rotate<0,0.000000,0> translate<29.165400,0.000000,10.264600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.428900,0.000000,10.213800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.152700,0.000000,10.213800>}
box{<0,0,-0.025400><0.276200,0.036000,0.025400> rotate<0,0.000000,0> translate<29.152700,0.000000,10.213800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.441600,0.000000,10.163000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.140000,0.000000,10.163000>}
box{<0,0,-0.025400><0.301600,0.036000,0.025400> rotate<0,0.000000,0> translate<29.140000,0.000000,10.163000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.454300,0.000000,10.112200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.127300,0.000000,10.112200>}
box{<0,0,-0.025400><0.327000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.127300,0.000000,10.112200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.467000,0.000000,10.061400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.114600,0.000000,10.061400>}
box{<0,0,-0.025400><0.352400,0.036000,0.025400> rotate<0,0.000000,0> translate<29.114600,0.000000,10.061400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.479700,0.000000,10.010600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.101900,0.000000,10.010600>}
box{<0,0,-0.025400><0.377800,0.036000,0.025400> rotate<0,0.000000,0> translate<29.101900,0.000000,10.010600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.492400,0.000000,9.959800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.089200,0.000000,9.959800>}
box{<0,0,-0.025400><0.403200,0.036000,0.025400> rotate<0,0.000000,0> translate<29.089200,0.000000,9.959800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.505100,0.000000,9.909000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.076500,0.000000,9.909000>}
box{<0,0,-0.025400><0.428600,0.036000,0.025400> rotate<0,0.000000,0> translate<29.076500,0.000000,9.909000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.517800,0.000000,9.858200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.063800,0.000000,9.858200>}
box{<0,0,-0.025400><0.454000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.063800,0.000000,9.858200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.530500,0.000000,9.807400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.051100,0.000000,9.807400>}
box{<0,0,-0.025400><0.479400,0.036000,0.025400> rotate<0,0.000000,0> translate<29.051100,0.000000,9.807400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.543200,0.000000,9.756600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.038400,0.000000,9.756600>}
box{<0,0,-0.025400><0.504800,0.036000,0.025400> rotate<0,0.000000,0> translate<29.038400,0.000000,9.756600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.555900,0.000000,9.705800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.025700,0.000000,9.705800>}
box{<0,0,-0.025400><0.530200,0.036000,0.025400> rotate<0,0.000000,0> translate<29.025700,0.000000,9.705800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.568600,0.000000,9.655000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.013000,0.000000,9.655000>}
box{<0,0,-0.025400><0.555600,0.036000,0.025400> rotate<0,0.000000,0> translate<29.013000,0.000000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.243300,0.000000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.860700,0.000000,20.450000>}
box{<0,0,-0.127000><12.382600,0.036000,0.127000> rotate<0,0.000000,0> translate<17.860700,0.000000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.322000,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.322000,0.000000,17.910000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.322000,0.000000,17.910000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.322000,0.000000,17.910000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.782000,0.000000,17.910000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<22.782000,0.000000,17.910000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.782000,0.000000,17.910000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.782000,0.000000,12.195000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<22.782000,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.179500,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,12.195000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<27.227000,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.322000,0.000000,12.195000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,0.000000,0> translate<25.322000,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.782000,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,12.195000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.877000,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.924500,0.000000,12.195000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<19.924500,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,11.560000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<27.227000,0.000000,11.560000> }
object{ARC(1.270000,0.254000,270.000000,360.000000,0.036000) translate<25.957000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.957000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.147000,0.000000,10.290000>}
box{<0,0,-0.127000><3.810000,0.036000,0.127000> rotate<0,0.000000,0> translate<22.147000,0.000000,10.290000> }
object{ARC(1.270000,0.254000,180.000000,270.000000,0.036000) translate<22.147000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,12.195000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<20.877000,0.000000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,21.085000>}
box{<0,0,-0.127000><2.222500,0.036000,0.127000> rotate<0,0.000000,0> translate<27.227000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.957000,0.000000,21.085000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<25.957000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.227000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<27.227000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<26.973000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.957000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.957000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<25.957000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<26.211000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.211000,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.973000,0.000000,22.672500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<26.211000,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.957000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.687000,0.000000,21.085000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.687000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.687000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.417000,0.000000,21.085000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.417000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.687000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.687000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<24.687000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<24.433000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.417000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.417000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<23.417000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<23.671000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.671000,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.433000,0.000000,22.672500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.671000,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.417000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.147000,0.000000,21.085000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.147000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.147000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,21.085000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.877000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.147000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.147000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<22.147000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<21.893000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.877000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<20.877000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<21.131000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.131000,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.893000,0.000000,22.672500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<21.131000,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.877000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.607000,0.000000,21.085000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.607000,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,21.085000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<29.449500,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,22.672500>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,90.000000,0> translate<29.449500,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.497000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.497000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<28.497000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<28.751000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.751000,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.449500,0.000000,22.672500>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,0.000000,0> translate<28.751000,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.607000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.607000,0.000000,22.418500>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<19.607000,0.000000,22.418500> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<19.353000,0.000000,22.418500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.353000,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,22.672500>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,0.000000,0> translate<18.654500,0.000000,22.672500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,22.672500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,21.085000>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,-90.000000,0> translate<18.654500,0.000000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,20.450000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<18.654500,0.000000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.607000,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.654500,0.000000,21.085000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<18.654500,0.000000,21.085000> }
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<27.862000,0.000000,21.720000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<25.322000,0.000000,21.720000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<22.782000,0.000000,21.720000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<20.242000,0.000000,21.720000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAGNETIC_ROTARY_ENCODER(-24.130000,0,-28.956000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//+		CHIPLED_0805
//-		CHIPLED_0805
//C2	1uF	SANYO-OSCON_SMD_A5
//C5	1uF	SANYO-OSCON_SMD_A5
//H1	MOUNT-HOLE3.0	3,0
//H2	MOUNT-HOLE3.0	3,0
//H3	MOUNT-HOLE3.0	3,0
//H4	MOUNT-HOLE3.0	3,0
//QUADA		CHIPLED_0805
//QUADB		CHIPLED_0805
//U$1	6.1MMHOLE	6.1MMHOLE
//U$2	CDROM	70553-04
