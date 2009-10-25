//POVRay-File created by 3d41.ulp v1.05
///Users/zachsmith/makerbot/trunk/electronics/magnetic-rotary-encoder/magnetic-rotary-encoder.brd
//10/25/09 6:07 PM

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
#declare global_seed=seed(969);
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
cylinder{<36.529200,1,44.644000><36.529200,-5,44.644000>1.500000 texture{col_hls}}
cylinder{<36.529200,1,13.148000><36.529200,-5,13.148000>1.500000 texture{col_hls}}
cylinder{<11.637200,1,13.148000><11.637200,-5,13.148000>1.500000 texture{col_hls}}
cylinder{<11.428400,1,44.770000><11.428400,-5,44.770000>1.500000 texture{col_hls}}
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,16.561400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,18.447300>}
box{<0,0,-0.127000><1.885900,0.035000,0.127000> rotate<0,90.000000,0> translate<9.270900,0.000000,18.447300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,16.561400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,41.190000>}
box{<0,0,-0.127000><24.628600,0.035000,0.127000> rotate<0,90.000000,0> translate<9.270900,-1.535000,41.190000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,16.561400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,-1.535000,16.777300>}
box{<0,0,-0.127000><0.346253,0.035000,0.127000> rotate<0,-38.571982,0> translate<9.270900,-1.535000,16.561400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,16.561400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,0.000000,16.777400>}
box{<0,0,-0.127000><0.346316,0.035000,0.127000> rotate<0,-38.584915,0> translate<9.270900,0.000000,16.561400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.524900,0.000000,16.764000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,-1.535000,16.764000>}
box{<0,0,-0.127000><0.254100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.154700,0.000000,17.018000>}
box{<0,0,-0.127000><0.883800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.154700,-1.535000,17.018000>}
box{<0,0,-0.127000><0.883800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.214100,0.000000,17.272000>}
box{<0,0,-0.127000><1.943200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.214100,-1.535000,17.272000>}
box{<0,0,-0.127000><1.943200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.017300,0.000000,17.526000>}
box{<0,0,-0.127000><24.746400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,17.526000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,17.780000>}
box{<0,0,-0.127000><24.562100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,17.780000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.034000>}
box{<0,0,-0.127000><24.562100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,18.034000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.114600,0.000000,18.288000>}
box{<0,0,-0.127000><1.843700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,18.288000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,18.447300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,18.300000>}
box{<0,0,-0.127000><0.208243,0.035000,0.127000> rotate<0,45.016484,0> translate<9.270900,0.000000,18.447300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,18.542000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,18.796000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,19.050000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,19.304000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,19.558000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,19.812000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,20.066000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.642600,-1.535000,20.320000>}
box{<0,0,-0.127000><10.371700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,20.414600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.876300>}
box{<0,0,-0.127000><1.461700,0.035000,0.127000> rotate<0,90.000000,0> translate<9.270900,0.000000,21.876300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,20.414600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,20.561900>}
box{<0,0,-0.127000><0.208243,0.035000,0.127000> rotate<0,-45.016484,0> translate<9.270900,0.000000,20.414600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.114800,0.000000,20.574000>}
box{<0,0,-0.127000><1.843900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.290900,-1.535000,20.574000>}
box{<0,0,-0.127000><10.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.071100,0.000000,20.828000>}
box{<0,0,-0.127000><9.800200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.071100,-1.535000,20.828000>}
box{<0,0,-0.127000><9.800200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.965900,0.000000,21.082000>}
box{<0,0,-0.127000><9.695000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.965900,-1.535000,21.082000>}
box{<0,0,-0.127000><9.695000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,21.336000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,21.336000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.241600,0.000000,21.590000>}
box{<0,0,-0.127000><1.970700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,21.590000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.303100,0.000000,21.844000>}
box{<0,0,-0.127000><0.032200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,21.844000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,21.876300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,21.729000>}
box{<0,0,-0.127000><0.208243,0.035000,0.127000> rotate<0,45.016484,0> translate<9.270900,0.000000,21.876300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,22.098000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,22.352000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,22.606000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,22.860000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,23.114000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,23.368000>}
box{<0,0,-0.127000><9.618500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.963500,-1.535000,23.622000>}
box{<0,0,-0.127000><9.692600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,23.843600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,41.190000>}
box{<0,0,-0.127000><17.346400,0.035000,0.127000> rotate<0,90.000000,0> translate<9.270900,0.000000,41.190000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,23.843600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,23.990900>}
box{<0,0,-0.127000><0.208243,0.035000,0.127000> rotate<0,-45.016484,0> translate<9.270900,0.000000,23.843600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.303300,0.000000,23.876000>}
box{<0,0,-0.127000><0.032400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.068700,-1.535000,23.876000>}
box{<0,0,-0.127000><9.797800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.241800,0.000000,24.130000>}
box{<0,0,-0.127000><1.970900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.285000,-1.535000,24.130000>}
box{<0,0,-0.127000><10.014100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.384000>}
box{<0,0,-0.127000><10.310700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.628400,-1.535000,24.384000>}
box{<0,0,-0.127000><10.357500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.638000>}
box{<0,0,-0.127000><10.310700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323000,-1.535000,24.638000>}
box{<0,0,-0.127000><14.052100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.664800,0.000000,24.892000>}
box{<0,0,-0.127000><10.393900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.069000,-1.535000,24.892000>}
box{<0,0,-0.127000><13.798100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.894200,0.000000,25.146000>}
box{<0,0,-0.127000><10.623300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.815000,-1.535000,25.146000>}
box{<0,0,-0.127000><13.544100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.148200,0.000000,25.400000>}
box{<0,0,-0.127000><10.877300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.561000,-1.535000,25.400000>}
box{<0,0,-0.127000><13.290100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.088300,0.000000,25.654000>}
box{<0,0,-0.127000><2.817400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.088300,-1.535000,25.654000>}
box{<0,0,-0.127000><2.817400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.812000,0.000000,25.908000>}
box{<0,0,-0.127000><2.541100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.812000,-1.535000,25.908000>}
box{<0,0,-0.127000><2.541100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.632800,0.000000,26.162000>}
box{<0,0,-0.127000><2.361900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.632800,-1.535000,26.162000>}
box{<0,0,-0.127000><2.361900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.527600,0.000000,26.416000>}
box{<0,0,-0.127000><2.256700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.527600,-1.535000,26.416000>}
box{<0,0,-0.127000><2.256700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,26.670000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,26.670000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,26.924000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,26.924000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,27.178000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,27.178000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,27.432000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,27.432000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,27.686000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,27.686000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,27.940000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,27.940000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,28.194000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,28.194000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,28.448000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,28.448000>}
box{<0,0,-0.127000><2.217700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.551700,0.000000,28.702000>}
box{<0,0,-0.127000><2.280800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.551700,-1.535000,28.702000>}
box{<0,0,-0.127000><2.280800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.657000,0.000000,28.956000>}
box{<0,0,-0.127000><2.386100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.657000,-1.535000,28.956000>}
box{<0,0,-0.127000><2.386100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.870100,-1.535000,29.210000>}
box{<0,0,-0.127000><2.599200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.870200,0.000000,29.210000>}
box{<0,0,-0.127000><2.599300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,29.464000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.228600,-1.535000,29.464000>}
box{<0,0,-0.127000><2.957700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,29.718000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.460200,-1.535000,29.718000>}
box{<0,0,-0.127000><8.189300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,29.972000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,-1.535000,29.972000>}
box{<0,0,-0.127000><7.829100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,30.226000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.846000,-1.535000,30.226000>}
box{<0,0,-0.127000><7.575100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,30.480000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.592000,-1.535000,30.480000>}
box{<0,0,-0.127000><7.321100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,30.734000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.338000,-1.535000,30.734000>}
box{<0,0,-0.127000><7.067100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,30.988000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.084000,-1.535000,30.988000>}
box{<0,0,-0.127000><6.813100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,31.242000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.830000,-1.535000,31.242000>}
box{<0,0,-0.127000><6.559100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,31.496000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.576000,-1.535000,31.496000>}
box{<0,0,-0.127000><6.305100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,31.750000>}
box{<0,0,-0.127000><2.768700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.322000,-1.535000,31.750000>}
box{<0,0,-0.127000><6.051100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.147100,0.000000,32.004000>}
box{<0,0,-0.127000><2.876200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.068000,-1.535000,32.004000>}
box{<0,0,-0.127000><5.797100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.401100,0.000000,32.258000>}
box{<0,0,-0.127000><3.130200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.814000,-1.535000,32.258000>}
box{<0,0,-0.127000><5.543100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.655100,0.000000,32.512000>}
box{<0,0,-0.127000><3.384200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.560000,-1.535000,32.512000>}
box{<0,0,-0.127000><5.289100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.909100,0.000000,32.766000>}
box{<0,0,-0.127000><3.638200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.306000,-1.535000,32.766000>}
box{<0,0,-0.127000><5.035100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.163100,0.000000,33.020000>}
box{<0,0,-0.127000><3.892200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.052000,-1.535000,33.020000>}
box{<0,0,-0.127000><4.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.417100,0.000000,33.274000>}
box{<0,0,-0.127000><4.146200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.798000,-1.535000,33.274000>}
box{<0,0,-0.127000><4.527100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.544000,-1.535000,33.528000>}
box{<0,0,-0.127000><4.273100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.671100,0.000000,33.528000>}
box{<0,0,-0.127000><4.400200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.290000,-1.535000,33.782000>}
box{<0,0,-0.127000><4.019100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.925100,0.000000,33.782000>}
box{<0,0,-0.127000><4.654200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.036000,-1.535000,34.036000>}
box{<0,0,-0.127000><3.765100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.179100,0.000000,34.036000>}
box{<0,0,-0.127000><4.908200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.782000,-1.535000,34.290000>}
box{<0,0,-0.127000><3.511100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.433100,0.000000,34.290000>}
box{<0,0,-0.127000><5.162200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.066700,0.000000,34.544000>}
box{<0,0,-0.127000><2.795800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.066700,-1.535000,34.544000>}
box{<0,0,-0.127000><2.795800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.842500,0.000000,34.798000>}
box{<0,0,-0.127000><2.571600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.842500,-1.535000,34.798000>}
box{<0,0,-0.127000><2.571600,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.737300,0.000000,35.052000>}
box{<0,0,-0.127000><2.466400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.737300,-1.535000,35.052000>}
box{<0,0,-0.127000><2.466400,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,0.000000,35.306000>}
box{<0,0,-0.127000><2.442500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,-1.535000,35.306000>}
box{<0,0,-0.127000><2.442500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.737400,0.000000,35.560000>}
box{<0,0,-0.127000><2.466500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.737400,-1.535000,35.560000>}
box{<0,0,-0.127000><2.466500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.842600,0.000000,35.814000>}
box{<0,0,-0.127000><2.571700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.842600,-1.535000,35.814000>}
box{<0,0,-0.127000><2.571700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.066800,0.000000,36.068000>}
box{<0,0,-0.127000><2.795900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.066800,-1.535000,36.068000>}
box{<0,0,-0.127000><2.795900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.782100,0.000000,36.322000>}
box{<0,0,-0.127000><3.511200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.068000,-1.535000,36.322000>}
box{<0,0,-0.127000><5.797100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.114000,0.000000,36.576000>}
box{<0,0,-0.127000><3.843100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.814000,-1.535000,36.576000>}
box{<0,0,-0.127000><5.543100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.560000,0.000000,36.830000>}
box{<0,0,-0.127000><5.289100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.560000,-1.535000,36.830000>}
box{<0,0,-0.127000><5.289100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.919000,0.000000,37.084000>}
box{<0,0,-0.127000><4.648100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.919000,-1.535000,37.084000>}
box{<0,0,-0.127000><4.648100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590700,0.000000,37.338000>}
box{<0,0,-0.127000><4.319800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590700,-1.535000,37.338000>}
box{<0,0,-0.127000><4.319800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.440900,0.000000,37.592000>}
box{<0,0,-0.127000><4.170000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.440900,-1.535000,37.592000>}
box{<0,0,-0.127000><4.170000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,37.846000>}
box{<0,0,-0.127000><4.093500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,37.846000>}
box{<0,0,-0.127000><4.093500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,38.100000>}
box{<0,0,-0.127000><4.093500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,38.100000>}
box{<0,0,-0.127000><4.093500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.441000,0.000000,38.354000>}
box{<0,0,-0.127000><4.170100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.441000,-1.535000,38.354000>}
box{<0,0,-0.127000><4.170100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590800,0.000000,38.608000>}
box{<0,0,-0.127000><4.319900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590800,-1.535000,38.608000>}
box{<0,0,-0.127000><4.319900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.919400,0.000000,38.862000>}
box{<0,0,-0.127000><4.648500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.919400,-1.535000,38.862000>}
box{<0,0,-0.127000><4.648500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,39.116000>}
box{<0,0,-0.127000><6.613700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.823800,-1.535000,39.116000>}
box{<0,0,-0.127000><12.552900,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,39.370000>}
box{<0,0,-0.127000><6.613700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.263700,-1.535000,39.370000>}
box{<0,0,-0.127000><12.992800,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,39.624000>}
box{<0,0,-0.127000><6.613700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.866400,-1.535000,39.624000>}
box{<0,0,-0.127000><13.595500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,39.878000>}
box{<0,0,-0.127000><6.613700,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,39.878000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.885200,0.000000,40.132000>}
box{<0,0,-0.127000><6.614300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,40.132000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.088200,0.000000,40.386000>}
box{<0,0,-0.127000><6.817300,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,40.386000>}
box{<0,0,-0.127000><29.718100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.083900,0.000000,40.640000>}
box{<0,0,-0.127000><1.813000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.083900,-1.535000,40.640000>}
box{<0,0,-0.127000><1.813000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.960900,0.000000,40.894000>}
box{<0,0,-0.127000><0.690000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.960900,-1.535000,40.894000>}
box{<0,0,-0.127000><0.690000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.323400,0.000000,41.148000>}
box{<0,0,-0.127000><0.052500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.323400,-1.535000,41.148000>}
box{<0,0,-0.127000><0.052500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.270900,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,0.000000,41.190000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332800,0.000000,41.140500>}
box{<0,0,-0.127000><0.079258,0.035000,0.127000> rotate<0,38.645968,0> translate<9.270900,0.000000,41.190000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.270900,-1.535000,41.190000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332800,-1.535000,41.140500>}
box{<0,0,-0.127000><0.079258,0.035000,0.127000> rotate<0,38.645968,0> translate<9.270900,-1.535000,41.190000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332800,0.000000,41.140500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332900,0.000000,41.140500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.332800,0.000000,41.140500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332800,-1.535000,41.140500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332900,-1.535000,41.140500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.332800,-1.535000,41.140500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332900,0.000000,41.140500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495700,0.000000,40.684100>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,21.428636,0> translate<9.332900,0.000000,41.140500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.332900,-1.535000,41.140500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495700,-1.535000,40.684100>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,21.428636,0> translate<9.332900,-1.535000,41.140500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,18.300000>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.418100,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,20.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,20.561900>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.418100,0.000000,20.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,21.729000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,21.729000>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.418100,0.000000,21.729000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.418100,0.000000,23.990900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.990900>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.418100,0.000000,23.990900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,-1.535000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,-1.535000,16.777300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<9.541600,-1.535000,16.777300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,0.000000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541700,0.000000,16.777400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.541600,0.000000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541600,-1.535000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704500,-1.535000,17.233800>}
box{<0,0,-0.127000><1.249255,0.035000,0.127000> rotate<0,-21.426960,0> translate<9.541600,-1.535000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.541700,0.000000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704500,0.000000,17.233800>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,-21.428636,0> translate<9.541700,0.000000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.303600>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<10.099100,0.000000,19.303600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,18.542000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,18.796000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.050000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.303600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.303600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,19.303600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.558300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,20.561900>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<10.099100,0.000000,20.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.558300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.558300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,19.558300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.812000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,20.066000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,20.320000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,21.729000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.732600>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<10.099100,0.000000,22.732600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,21.844000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.098000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.352000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.606000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.732600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.732600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,22.732600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.987300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.990900>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<10.099100,0.000000,23.990900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,22.987300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.987300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,22.987300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.114000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.368000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.622000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.099100,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.876000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<10.099100,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,18.300000>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.352700,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.303600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,18.300000>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.352700,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,20.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,19.558300>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.352700,0.000000,19.558300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,20.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,20.561900>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.352700,0.000000,20.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,21.729000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,21.729000>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.352700,0.000000,21.729000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.732600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,21.729000>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.352700,0.000000,21.729000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.990900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,22.987300>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.352700,0.000000,22.987300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.352700,0.000000,23.990900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,23.990900>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.352700,0.000000,23.990900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495700,0.000000,40.684100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495800,0.000000,40.684100>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.495700,0.000000,40.684100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495700,-1.535000,40.684100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495800,-1.535000,40.684100>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.495700,-1.535000,40.684100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495800,0.000000,40.684100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741500,0.000000,40.590700>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,4.287613,0> translate<10.495800,0.000000,40.684100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.495800,-1.535000,40.684100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741500,-1.535000,40.590700>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,4.287613,0> translate<10.495800,-1.535000,40.684100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704500,0.000000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704600,0.000000,17.233800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<10.704500,0.000000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704500,-1.535000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950300,-1.535000,17.327200>}
box{<0,0,-0.127000><1.249296,0.035000,0.127000> rotate<0,-4.287270,0> translate<10.704500,-1.535000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.704600,0.000000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950300,0.000000,17.327200>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,-4.287613,0> translate<10.704600,0.000000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,18.334500>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,-45.080183,0> translate<11.033800,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,20.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,20.527400>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,45.080183,0> translate<11.033800,0.000000,20.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,21.729000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,21.763500>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,-45.080183,0> translate<11.033800,0.000000,21.729000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.033800,0.000000,23.990900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,23.956400>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,45.080183,0> translate<11.033800,0.000000,23.990900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,18.334500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,18.147600>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,45.012361,0> translate<11.068200,0.000000,18.334500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,20.527400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,20.714300>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,-45.012361,0> translate<11.068200,0.000000,20.527400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,21.763500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,21.576600>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,45.012361,0> translate<11.068200,0.000000,21.763500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.068200,0.000000,23.956400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,24.143300>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,-45.012361,0> translate<11.068200,0.000000,23.956400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,18.147600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,18.147600>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<11.255000,0.000000,18.147600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,20.714300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,20.714300>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<11.255000,0.000000,20.714300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,21.576600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,21.576600>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<11.255000,0.000000,21.576600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.255000,0.000000,24.143300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,24.143300>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<11.255000,0.000000,24.143300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,0.000000,26.034200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<11.488600,0.000000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<11.488600,-1.535000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,26.510200>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.488600,0.000000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,26.510200>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.488600,-1.535000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,0.000000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,0.000000,29.025700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<11.488600,0.000000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.488600,-1.535000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<11.488600,-1.535000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,0.000000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<11.685800,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<11.685800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,0.000000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,29.379400>}
box{<0,0,-0.127000><0.500278,0.035000,0.127000> rotate<0,-44.988932,0> translate<11.685800,0.000000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.685800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.685800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,0.000000,35.109700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,0.000000,34.747100>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<11.713400,0.000000,35.109700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,-1.535000,35.109700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,-1.535000,34.747100>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<11.713400,-1.535000,35.109700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,0.000000,35.502200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,0.000000,35.109700>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.713400,0.000000,35.109700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,-1.535000,35.502200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,-1.535000,35.109700>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.713400,-1.535000,35.109700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,0.000000,35.502200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,0.000000,35.864800>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<11.713400,0.000000,35.502200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.713400,-1.535000,35.502200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,-1.535000,35.864800>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<11.713400,-1.535000,35.502200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741500,0.000000,40.590700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741600,0.000000,40.590700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.741500,0.000000,40.590700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741500,-1.535000,40.590700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741600,-1.535000,40.590700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.741500,-1.535000,40.590700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741600,0.000000,40.590700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959400,0.000000,40.868700>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,-12.858311,0> translate<11.741600,0.000000,40.590700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.741600,-1.535000,40.590700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959400,-1.535000,40.868700>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,-12.858311,0> translate<11.741600,-1.535000,40.590700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,0.000000,34.747100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,0.000000,34.469600>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<11.863600,0.000000,34.747100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,-1.535000,34.747100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,-1.535000,34.469600>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<11.863600,-1.535000,34.747100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,0.000000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,0.000000,36.142300>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.863600,0.000000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.863600,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,-1.535000,36.142300>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.863600,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950300,0.000000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950400,0.000000,17.327200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.950300,0.000000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950300,-1.535000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168200,-1.535000,17.049200>}
box{<0,0,-0.127000><1.249226,0.035000,0.127000> rotate<0,12.857290,0> translate<11.950300,-1.535000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.950400,0.000000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,0.000000,17.049200>}
box{<0,0,-0.127000><1.249226,0.035000,0.127000> rotate<0,12.857290,0> translate<11.950400,0.000000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.957500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.640000>}
box{<0,0,-0.127000><3.927100,0.035000,0.127000> rotate<0,0.000000,0> translate<11.957500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.957500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.387800,-1.535000,40.640000>}
box{<0,0,-0.127000><23.430300,0.035000,0.127000> rotate<0,0.000000,0> translate<11.957500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,31.754300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,29.379400>}
box{<0,0,-0.127000><2.374900,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.039600,0.000000,29.379400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.039600,0.000000,31.754300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.140100,0.000000,31.997000>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<12.039600,0.000000,31.754300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,0.000000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<12.050200,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<12.050200,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.050200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<12.050200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.140100,0.000000,31.997000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.325900,0.000000,32.182800>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.140100,0.000000,31.997000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,0.000000,34.469600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,0.000000,34.319400>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<12.141100,0.000000,34.469600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,-1.535000,34.469600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,-1.535000,34.319400>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<12.141100,-1.535000,34.469600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,0.000000,36.142300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,0.000000,36.292500>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<12.141100,0.000000,36.142300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.141100,-1.535000,36.142300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,-1.535000,36.292500>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<12.141100,-1.535000,36.142300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192200,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.106100,-1.535000,17.272000>}
box{<0,0,-0.127000><23.913900,0.035000,0.127000> rotate<0,0.000000,0> translate<12.192200,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.192300,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.106100,0.000000,17.272000>}
box{<0,0,-0.127000><23.913800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.192300,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.325900,0.000000,32.182800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.364100,0.000000,35.221000>}
box{<0,0,-0.127000><4.296664,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.325900,0.000000,32.182800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,-1.535000,34.319400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.752600,-1.535000,34.319400>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,0.000000,0> translate<12.503700,-1.535000,34.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,0.000000,34.319400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.896200,0.000000,34.319400>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.503700,0.000000,34.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,0.000000,36.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.752600,0.000000,36.292500>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,0.000000,0> translate<12.503700,0.000000,36.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.503700,-1.535000,36.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.896200,-1.535000,36.292500>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.503700,-1.535000,36.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,0.000000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.526200,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.526200,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.526200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.526200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.752600,-1.535000,34.319400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.093100,-1.535000,29.978900>}
box{<0,0,-0.127000><6.138394,0.035000,0.127000> rotate<0,44.997030,0> translate<12.752600,-1.535000,34.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.752600,0.000000,36.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.981100,0.000000,36.521000>}
box{<0,0,-0.127000><0.323148,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.752600,0.000000,36.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.896200,0.000000,34.319400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258800,0.000000,34.469600>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<12.896200,0.000000,34.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.896200,-1.535000,36.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258800,-1.535000,36.142300>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<12.896200,-1.535000,36.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959400,0.000000,40.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959500,0.000000,40.868700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<12.959400,0.000000,40.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959400,-1.535000,40.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959500,-1.535000,40.868700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<12.959400,-1.535000,40.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959500,0.000000,40.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041300,0.000000,41.493300>}
box{<0,0,-0.127000><1.249166,0.035000,0.127000> rotate<0,-29.998913,0> translate<12.959500,0.000000,40.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.959500,-1.535000,40.868700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041300,-1.535000,41.493300>}
box{<0,0,-0.127000><1.249166,0.035000,0.127000> rotate<0,-29.998913,0> translate<12.959500,-1.535000,40.868700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.981100,0.000000,36.521000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.223800,0.000000,36.621500>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-22.492544,0> translate<12.981100,0.000000,36.521000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,18.147600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.207100,0.000000,18.357900>}
box{<0,0,-0.127000><0.297338,0.035000,0.127000> rotate<0,-45.010655,0> translate<12.996900,0.000000,18.147600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,20.714300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.283300,0.000000,20.427800>}
box{<0,0,-0.127000><0.405101,0.035000,0.127000> rotate<0,45.007031,0> translate<12.996900,0.000000,20.714300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,21.576600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258000,0.000000,21.837700>}
box{<0,0,-0.127000><0.369251,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.996900,0.000000,21.576600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.996900,0.000000,24.143300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258000,0.000000,23.882200>}
box{<0,0,-0.127000><0.369251,0.035000,0.127000> rotate<0,44.997030,0> translate<12.996900,0.000000,24.143300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.003300,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.894000>}
box{<0,0,-0.127000><2.881300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.003300,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.003300,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.740700,-1.535000,40.894000>}
box{<0,0,-0.127000><21.737400,0.035000,0.127000> rotate<0,0.000000,0> translate<13.003300,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.010200,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.285000,0.000000,24.130000>}
box{<0,0,-0.127000><6.274800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.010200,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.010300,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,21.590000>}
box{<0,0,-0.127000><5.879100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.010300,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,0.000000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<13.041700,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<13.041700,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.041700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<13.041700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.137200,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.277000,0.000000,18.288000>}
box{<0,0,-0.127000><0.139800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.137200,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.137200,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.290900,0.000000,20.574000>}
box{<0,0,-0.127000><6.153700,0.035000,0.127000> rotate<0,0.000000,0> translate<13.137200,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168200,-1.535000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,-1.535000,17.049200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.168200,-1.535000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,0.000000,17.049100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,0.000000,17.049200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<13.168300,0.000000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,0.000000,17.049100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250100,0.000000,16.424600>}
box{<0,0,-0.127000><1.249116,0.035000,0.127000> rotate<0,29.994941,0> translate<13.168300,0.000000,17.049100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.168300,-1.535000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250100,-1.535000,16.424600>}
box{<0,0,-0.127000><1.249166,0.035000,0.127000> rotate<0,29.998913,0> translate<13.168300,-1.535000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.207100,0.000000,18.357900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.343600,0.000000,18.221400>}
box{<0,0,-0.127000><0.193040,0.035000,0.127000> rotate<0,44.997030,0> translate<13.207100,0.000000,18.357900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.222200,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.046700,0.000000,17.018000>}
box{<0,0,-0.127000><21.824500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.222200,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.222400,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.046700,-1.535000,17.018000>}
box{<0,0,-0.127000><21.824300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.222400,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.223800,0.000000,36.621500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.486500,0.000000,36.621500>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,0.000000,0> translate<13.223800,0.000000,36.621500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258000,0.000000,21.837700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.369000,0.000000,21.726600>}
box{<0,0,-0.127000><0.157048,0.035000,0.127000> rotate<0,45.022826,0> translate<13.258000,0.000000,21.837700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258000,0.000000,23.882200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.369000,0.000000,23.993300>}
box{<0,0,-0.127000><0.157048,0.035000,0.127000> rotate<0,-45.022826,0> translate<13.258000,0.000000,23.882200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258800,0.000000,34.469600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.536300,0.000000,34.747100>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.258800,0.000000,34.469600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.258800,-1.535000,36.142300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.536300,-1.535000,35.864800>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<13.258800,-1.535000,36.142300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.283300,0.000000,20.427800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.343600,0.000000,20.488100>}
box{<0,0,-0.127000><0.085277,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.283300,0.000000,20.427800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.333100,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.322000,-1.535000,36.068000>}
box{<0,0,-0.127000><1.988900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.333100,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.333200,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.687100,0.000000,34.544000>}
box{<0,0,-0.127000><1.353900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.333200,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.339400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.768600,-1.535000,29.464000>}
box{<0,0,-0.127000><1.429200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.339400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.343600,0.000000,18.221400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.985500,0.000000,18.221400>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.343600,0.000000,18.221400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.343600,0.000000,20.488100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.985500,0.000000,20.488100>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.343600,0.000000,20.488100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,29.455300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,31.349400>}
box{<0,0,-0.127000><1.894100,0.035000,0.127000> rotate<0,90.000000,0> translate<13.360300,0.000000,31.349400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,29.455300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,0.000000,29.390100>}
box{<0,0,-0.127000><0.170370,0.035000,0.127000> rotate<0,22.499380,0> translate<13.360300,0.000000,29.455300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.464000>}
box{<0,0,-0.127000><1.346300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.718000>}
box{<0,0,-0.127000><1.346300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.757500,0.000000,29.972000>}
box{<0,0,-0.127000><1.397200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.941100,0.000000,30.226000>}
box{<0,0,-0.127000><1.580800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.195100,0.000000,30.480000>}
box{<0,0,-0.127000><1.834800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.449100,0.000000,30.734000>}
box{<0,0,-0.127000><2.088800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.703100,0.000000,30.988000>}
box{<0,0,-0.127000><2.342800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.957100,0.000000,31.242000>}
box{<0,0,-0.127000><2.596800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.360300,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.360300,0.000000,31.349400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.011700,0.000000,34.000800>}
box{<0,0,-0.127000><3.749646,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.360300,0.000000,31.349400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,37.776700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,0.000000,37.414100>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<13.364400,0.000000,37.776700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,37.776700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,-1.535000,37.414100>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<13.364400,-1.535000,37.776700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,38.169200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,37.776700>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.364400,0.000000,37.776700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,38.169200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,37.776700>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.364400,-1.535000,37.776700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,0.000000,38.169200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,0.000000,38.531800>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<13.364400,0.000000,38.169200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.364400,-1.535000,38.169200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,-1.535000,38.531800>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<13.364400,-1.535000,38.169200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.369000,0.000000,21.726600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010900,0.000000,21.726600>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.369000,0.000000,21.726600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.369000,0.000000,23.993300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010900,0.000000,23.993300>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.369000,0.000000,23.993300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.443200,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,41.148000>}
box{<0,0,-0.127000><2.441400,0.035000,0.127000> rotate<0,0.000000,0> translate<13.443200,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.443200,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.266200,-1.535000,41.148000>}
box{<0,0,-0.127000><20.823000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.443200,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.479500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.628300,0.000000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.479500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.479500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.628300,-1.535000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.479500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.486500,0.000000,36.621500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.768600,0.000000,36.621500>}
box{<0,0,-0.127000><1.282100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.486500,0.000000,36.621500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.506900,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.211100,0.000000,31.496000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.506900,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,0.000000,37.414100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,0.000000,37.136600>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<13.514600,0.000000,37.414100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,-1.535000,37.414100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,-1.535000,37.136600>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<13.514600,-1.535000,37.414100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,0.000000,38.531800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,0.000000,38.809300>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.514600,0.000000,38.531800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.514600,-1.535000,38.531800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,-1.535000,38.809300>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.514600,-1.535000,38.531800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,0.000000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.517700,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.517700,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,0.000000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,0.000000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<13.517700,0.000000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.517700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<13.517700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.536300,0.000000,34.747100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,0.000000,35.109700>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<13.536300,0.000000,34.747100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.536300,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,-1.535000,35.502200>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<13.536300,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.557300,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.941100,0.000000,34.798000>}
box{<0,0,-0.127000><1.383800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.557300,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.557400,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.576000,-1.535000,35.814000>}
box{<0,0,-0.127000><2.018600,0.035000,0.127000> rotate<0,0.000000,0> translate<13.557400,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.662200,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.416800,0.000000,16.764000>}
box{<0,0,-0.127000><20.754600,0.035000,0.127000> rotate<0,0.000000,0> translate<13.662200,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.662300,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.416800,-1.535000,16.764000>}
box{<0,0,-0.127000><20.754500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.662300,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.662500,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.195100,0.000000,35.052000>}
box{<0,0,-0.127000><1.532600,0.035000,0.127000> rotate<0,0.000000,0> translate<13.662500,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.662600,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.830000,-1.535000,35.560000>}
box{<0,0,-0.127000><2.167400,0.035000,0.127000> rotate<0,0.000000,0> translate<13.662600,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,0.000000,35.109700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,0.000000,35.300800>}
box{<0,0,-0.127000><0.191100,0.035000,0.127000> rotate<0,90.000000,0> translate<13.686500,0.000000,35.300800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,-1.535000,35.253300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,-1.535000,35.502200>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,90.000000,0> translate<13.686500,-1.535000,35.502200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,-1.535000,35.253300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.926500,-1.535000,31.013300>}
box{<0,0,-0.127000><5.996266,0.035000,0.127000> rotate<0,44.997030,0> translate<13.686500,-1.535000,35.253300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,0.000000,35.300800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557000,0.000000,35.300800>}
box{<0,0,-0.127000><1.870500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.686500,0.000000,35.300800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.686500,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.084000,-1.535000,35.306000>}
box{<0,0,-0.127000><2.397500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.686500,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.697800,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.410100,0.000000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.697800,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.697800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.410100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<13.697800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.755900,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.352000,0.000000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.755900,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.755900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.352000,-1.535000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.755900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.760900,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.465100,0.000000,31.750000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.760900,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,0.000000,37.136600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,0.000000,36.986400>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<13.792100,0.000000,37.136600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,-1.535000,37.136600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,-1.535000,36.986400>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<13.792100,-1.535000,37.136600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,0.000000,38.809300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,0.000000,38.959500>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<13.792100,0.000000,38.809300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.792100,-1.535000,38.809300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,-1.535000,38.959500>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<13.792100,-1.535000,38.809300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,0.000000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<13.882100,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,-1.535000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<13.882100,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,0.000000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,0.000000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<13.882100,0.000000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.882100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<13.882100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.883100,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,41.402000>}
box{<0,0,-0.127000><2.001500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.883100,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.883100,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.947700,-1.535000,41.402000>}
box{<0,0,-0.127000><20.064600,0.035000,0.127000> rotate<0,0.000000,0> translate<13.883100,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.887800,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.338000,-1.535000,35.052000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.887800,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.911000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.197000,0.000000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.911000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.911000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.197000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.911000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.935000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.172800,0.000000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.935000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.935000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.172800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.935000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.014900,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.719100,0.000000,32.004000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.014900,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.016300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.091800,0.000000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.016300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.016300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.091800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.016300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.040200,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.067700,0.000000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.040200,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.040200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.067700,-1.535000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.040200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041300,0.000000,41.493300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041400,0.000000,41.493300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.041300,0.000000,41.493300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041300,-1.535000,41.493300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041400,-1.535000,41.493300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.041300,-1.535000,41.493300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041400,0.000000,41.493300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,0.000000,42.409100>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,-47.141031,0> translate<14.041400,0.000000,41.493300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.041400,-1.535000,41.493300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,-1.535000,42.409100>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,-47.141031,0> translate<14.041400,-1.535000,41.493300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,0.000000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,0.000000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<14.054000,0.000000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,-1.535000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<14.054000,-1.535000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,0.000000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,0.000000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<14.054000,0.000000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.054000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<14.054000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.102200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.276900,0.000000,16.510000>}
box{<0,0,-0.127000><4.174700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.102200,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.102200,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.276900,-1.535000,16.510000>}
box{<0,0,-0.127000><4.174700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.102200,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.141800,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.592000,-1.535000,34.798000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.141800,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,0.000000,36.986400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.403600,0.000000,36.986400>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,0.000000,0> translate<14.154700,0.000000,36.986400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,-1.535000,36.986400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.403600,-1.535000,36.986400>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,0.000000,0> translate<14.154700,-1.535000,36.986400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,0.000000,38.959500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.547200,0.000000,38.959500>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.154700,0.000000,38.959500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.154700,-1.535000,38.959500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.547200,-1.535000,38.959500>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.154700,-1.535000,38.959500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.192300,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,41.656000>}
box{<0,0,-0.127000><1.692300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.192300,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.192300,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.629300,-1.535000,41.656000>}
box{<0,0,-0.127000><19.437000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.192300,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,0.000000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<14.225800,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<14.225800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,0.000000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,0.000000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.225800,0.000000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.225800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.225800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250100,-1.535000,16.424600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250200,-1.535000,16.424600>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.250100,-1.535000,16.424600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250100,0.000000,16.424600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099800,0.000000,15.508800>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,47.141031,0> translate<14.250100,0.000000,16.424600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.250200,-1.535000,16.424600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,-1.535000,15.508800>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,47.141031,0> translate<14.250200,-1.535000,16.424600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.268900,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.973100,0.000000,32.258000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.268900,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.395800,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.846000,-1.535000,34.544000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.395800,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.403600,0.000000,36.986400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.768600,0.000000,36.621500>}
box{<0,0,-0.127000><0.516117,0.035000,0.127000> rotate<0,44.989181,0> translate<14.403600,0.000000,36.986400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.403600,-1.535000,36.986400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.376800,-1.535000,31.013300>}
box{<0,0,-0.127000><8.447310,0.035000,0.127000> rotate<0,44.996551,0> translate<14.403600,-1.535000,36.986400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.406600,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.553300,0.000000,16.256000>}
box{<0,0,-0.127000><3.146700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.406600,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.406700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.553300,-1.535000,16.256000>}
box{<0,0,-0.127000><3.146600,0.035000,0.127000> rotate<0,0.000000,0> translate<14.406700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.428000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,41.910000>}
box{<0,0,-0.127000><1.456600,0.035000,0.127000> rotate<0,0.000000,0> translate<14.428000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.428000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.377500,-1.535000,41.910000>}
box{<0,0,-0.127000><18.949500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.428000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.522900,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.227100,0.000000,32.512000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.522900,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.547200,0.000000,38.959500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.909800,0.000000,38.809300>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<14.547200,0.000000,38.959500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.547200,-1.535000,38.959500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.909800,-1.535000,38.809300>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<14.547200,-1.535000,38.959500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,0.000000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<14.590200,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<14.590200,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,0.000000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.438300>}
box{<0,0,-0.127000><0.125985,0.035000,0.127000> rotate<0,-22.492440,0> translate<14.590200,0.000000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.590200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<14.590200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.642200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.113400,0.000000,16.002000>}
box{<0,0,-0.127000><2.471200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.642200,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.642300,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.113400,-1.535000,16.002000>}
box{<0,0,-0.127000><2.471100,0.035000,0.127000> rotate<0,0.000000,0> translate<14.642300,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.649800,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,-1.535000,34.290000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.649800,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.663600,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,42.164000>}
box{<0,0,-0.127000><1.221000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.663600,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.663600,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.204300,-1.535000,42.164000>}
box{<0,0,-0.127000><18.540700,0.035000,0.127000> rotate<0,0.000000,0> translate<14.663600,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.849300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.438300>}
box{<0,0,-0.127000><0.411000,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.706600,0.000000,29.438300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.706600,0.000000,29.849300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.807100,0.000000,30.092000>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<14.706600,0.000000,29.849300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.776900,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.481100,0.000000,32.766000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.776900,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.782600,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,38.862000>}
box{<0,0,-0.127000><1.102000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.782600,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.782600,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.478000,-1.535000,38.862000>}
box{<0,0,-0.127000><6.695400,0.035000,0.127000> rotate<0,0.000000,0> translate<14.782600,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.807100,0.000000,30.092000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.992900,0.000000,30.277800>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.807100,0.000000,30.092000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.877900,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.853400,0.000000,15.748000>}
box{<0,0,-0.127000><1.975500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.877900,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.878000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.853400,-1.535000,15.748000>}
box{<0,0,-0.127000><1.975400,0.035000,0.127000> rotate<0,0.000000,0> translate<14.878000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,0.000000,42.409100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,0.000000,42.409200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<14.891100,0.000000,42.409200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,-1.535000,42.409100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,-1.535000,42.409200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<14.891100,-1.535000,42.409200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,0.000000,42.409200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,43.534600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<14.891100,0.000000,42.409200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.891100,-1.535000,42.409200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,43.534600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<14.891100,-1.535000,42.409200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.895300,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.945600,0.000000,42.418000>}
box{<0,0,-0.127000><1.050300,0.035000,0.127000> rotate<0,0.000000,0> translate<14.895300,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.895300,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.031100,-1.535000,42.418000>}
box{<0,0,-0.127000><18.135800,0.035000,0.127000> rotate<0,0.000000,0> translate<14.895300,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.897700,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,46.005300>}
box{<0,0,-0.127000><1.233908,0.035000,0.127000> rotate<0,64.280070,0> translate<14.897700,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.897700,-1.535000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,46.005300>}
box{<0,0,-0.127000><1.233908,0.035000,0.127000> rotate<0,64.280070,0> translate<14.897700,-1.535000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.897700,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.199700,0.000000,47.117000>}
box{<0,0,-0.127000><18.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.897700,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.897700,-1.535000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.199700,-1.535000,47.117000>}
box{<0,0,-0.127000><18.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.897700,-1.535000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.903800,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.354000,-1.535000,34.036000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.903800,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.909800,0.000000,38.809300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.187300,0.000000,38.531800>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<14.909800,0.000000,38.809300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.909800,-1.535000,38.809300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.187300,-1.535000,38.531800>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<14.909800,-1.535000,38.809300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.958900,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.113100,0.000000,46.990000>}
box{<0,0,-0.127000><18.154200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.958900,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.958900,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.113100,-1.535000,46.990000>}
box{<0,0,-0.127000><18.154200,0.035000,0.127000> rotate<0,0.000000,0> translate<14.958900,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.985500,0.000000,18.221400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,0.000000,18.450500>}
box{<0,0,-0.127000><0.323996,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.985500,0.000000,18.221400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.985500,0.000000,20.488100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,0.000000,20.259000>}
box{<0,0,-0.127000><0.323996,0.035000,0.127000> rotate<0,44.997030,0> translate<14.985500,0.000000,20.488100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.992900,0.000000,30.277800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.636100,0.000000,33.921000>}
box{<0,0,-0.127000><5.152263,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.992900,0.000000,30.277800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010900,0.000000,21.726600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.239900,0.000000,21.955700>}
box{<0,0,-0.127000><0.323926,0.035000,0.127000> rotate<0,-45.009537,0> translate<15.010900,0.000000,21.726600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010900,0.000000,23.993300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.239900,0.000000,23.764200>}
box{<0,0,-0.127000><0.323926,0.035000,0.127000> rotate<0,45.009537,0> translate<15.010900,0.000000,23.993300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.017600,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,42.672000>}
box{<0,0,-0.127000><0.717000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.017600,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.017600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.857800,-1.535000,42.672000>}
box{<0,0,-0.127000><17.840200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.017600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.030900,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.735100,0.000000,33.020000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.030900,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.052100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.377000,0.000000,18.288000>}
box{<0,0,-0.127000><0.324900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.052100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,0.000000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.066200,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.066200,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.066200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.066200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.081200,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.939900,0.000000,46.736000>}
box{<0,0,-0.127000><17.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.081200,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.081200,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.939900,-1.535000,46.736000>}
box{<0,0,-0.127000><17.858700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.081200,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099800,0.000000,15.508800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,0.000000,15.508800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.099800,0.000000,15.508800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,-1.535000,15.508700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,-1.535000,15.508800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.099900,-1.535000,15.508800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,-1.535000,15.508700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,14.383300>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,64.279987,0> translate<15.099900,-1.535000,15.508700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.099900,0.000000,15.508800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,14.383300>}
box{<0,0,-0.127000><1.249205,0.035000,0.127000> rotate<0,64.281977,0> translate<15.099900,0.000000,15.508800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.103600,0.000000,10.794900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,11.912600>}
box{<0,0,-0.127000><1.240573,0.035000,0.127000> rotate<0,-64.279639,0> translate<15.103600,0.000000,10.794900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.103600,-1.535000,10.794900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,11.912600>}
box{<0,0,-0.127000><1.240573,0.035000,0.127000> rotate<0,-64.279639,0> translate<15.103600,-1.535000,10.794900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.103600,0.000000,10.794900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.117900,0.000000,10.794900>}
box{<0,0,-0.127000><18.014300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.103600,0.000000,10.794900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.103600,-1.535000,10.794900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.117900,-1.535000,10.794900>}
box{<0,0,-0.127000><18.014300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.103600,-1.535000,10.794900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.107000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.599400,-1.535000,15.494000>}
box{<0,0,-0.127000><1.492400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.107000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.107100,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.599400,0.000000,15.494000>}
box{<0,0,-0.127000><1.492300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.107100,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.111100,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,38.608000>}
box{<0,0,-0.127000><0.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.111100,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.111100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.224000,-1.535000,38.608000>}
box{<0,0,-0.127000><6.112900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.111100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.128200,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.351600,0.000000,21.844000>}
box{<0,0,-0.127000><0.223400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.128200,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.128200,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.351700,0.000000,23.876000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.128200,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.139900,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,42.926000>}
box{<0,0,-0.127000><0.594700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.139900,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.139900,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.722200,-1.535000,42.926000>}
box{<0,0,-0.127000><17.582300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.139900,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.153600,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.275600,0.000000,20.320000>}
box{<0,0,-0.127000><0.122000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.153600,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.157800,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.608000,-1.535000,33.782000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.157800,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.164800,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.298900,0.000000,10.922000>}
box{<0,0,-0.127000><3.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.164800,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.164800,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.298900,-1.535000,10.922000>}
box{<0,0,-0.127000><3.134100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.164800,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.187300,0.000000,38.531800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,0.000000,38.169200>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<15.187300,0.000000,38.531800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.187300,-1.535000,38.531800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,-1.535000,38.169200>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<15.187300,-1.535000,38.531800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.203600,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.945700,0.000000,46.482000>}
box{<0,0,-0.127000><0.742100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.203600,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.203600,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766600,-1.535000,46.482000>}
box{<0,0,-0.127000><17.563000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.203600,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,0.000000,18.450500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.443600,0.000000,18.221400>}
box{<0,0,-0.127000><0.323926,0.035000,0.127000> rotate<0,45.009537,0> translate<15.214600,0.000000,18.450500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,0.000000,20.259000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.443600,0.000000,20.488100>}
box{<0,0,-0.127000><0.323926,0.035000,0.127000> rotate<0,-45.009537,0> translate<15.214600,0.000000,20.259000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.229400,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.440400,0.000000,15.240000>}
box{<0,0,-0.127000><1.211000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.229400,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.229400,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.440400,-1.535000,15.240000>}
box{<0,0,-0.127000><1.211000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.229400,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.239900,0.000000,21.955700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.469000,0.000000,21.726600>}
box{<0,0,-0.127000><0.323996,0.035000,0.127000> rotate<0,44.997030,0> translate<15.239900,0.000000,21.955700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.239900,0.000000,23.764200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.469000,0.000000,23.993300>}
box{<0,0,-0.127000><0.323996,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.239900,0.000000,23.764200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.261000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.020200,0.000000,38.354000>}
box{<0,0,-0.127000><0.759200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.261000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.261000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.970000,-1.535000,38.354000>}
box{<0,0,-0.127000><5.709000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.261000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.262300,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,43.180000>}
box{<0,0,-0.127000><0.472300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.262300,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.262300,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.643800,-1.535000,43.180000>}
box{<0,0,-0.127000><17.381500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.262300,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.284900,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.989100,0.000000,33.274000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.284900,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.287100,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.563400,0.000000,11.176000>}
box{<0,0,-0.127000><2.276300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.287100,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.287100,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.563400,-1.535000,11.176000>}
box{<0,0,-0.127000><2.276300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.287100,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.325900,0.000000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,46.228000>}
box{<0,0,-0.127000><0.408700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.325900,0.000000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.325900,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.681000,-1.535000,46.228000>}
box{<0,0,-0.127000><17.355100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.325900,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,0.000000,37.920300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,0.000000,38.169200>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,90.000000,0> translate<15.337500,0.000000,38.169200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,-1.535000,37.920300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,-1.535000,38.169200>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,90.000000,0> translate<15.337500,-1.535000,38.169200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,0.000000,37.920300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.986300,0.000000,37.271500>}
box{<0,0,-0.127000><0.917542,0.035000,0.127000> rotate<0,44.997030,0> translate<15.337500,0.000000,37.920300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,-1.535000,37.920300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.228500,-1.535000,32.029300>}
box{<0,0,-0.127000><8.331132,0.035000,0.127000> rotate<0,44.997030,0> translate<15.337500,-1.535000,37.920300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.592000,0.000000,38.100000>}
box{<0,0,-0.127000><1.254500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.337500,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.337500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.762600,-1.535000,38.100000>}
box{<0,0,-0.127000><5.425100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.337500,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.351700,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.293700,0.000000,14.986000>}
box{<0,0,-0.127000><0.942000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.351700,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.351700,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.293700,-1.535000,14.986000>}
box{<0,0,-0.127000><0.942000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.351700,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.364100,0.000000,35.221000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557000,0.000000,35.300800>}
box{<0,0,-0.127000><0.208755,0.035000,0.127000> rotate<0,-22.472704,0> translate<15.364100,0.000000,35.221000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384600,0.000000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,43.434000>}
box{<0,0,-0.127000><0.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.384600,0.000000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384600,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.565500,-1.535000,43.434000>}
box{<0,0,-0.127000><17.180900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.384600,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.409400,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.123500,0.000000,11.430000>}
box{<0,0,-0.127000><1.714100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.409400,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.409400,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.123500,-1.535000,11.430000>}
box{<0,0,-0.127000><1.714100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.409400,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411800,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.862000,-1.535000,33.528000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.411800,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411800,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.846100,0.000000,37.846000>}
box{<0,0,-0.127000><1.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.411800,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411800,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.616000,-1.535000,37.846000>}
box{<0,0,-0.127000><5.204200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.411800,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,43.534600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,43.534700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.433100,0.000000,43.534700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,43.534600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,43.534700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.433100,-1.535000,43.534700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,43.534700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.619300,0.000000,44.770000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<15.433100,0.000000,43.534700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,43.534700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.619300,-1.535000,44.770000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<15.433100,-1.535000,43.534700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,46.005200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,46.005300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.433100,0.000000,46.005300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,46.005200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,46.005300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.433100,-1.535000,46.005300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,0.000000,46.005200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.619300,0.000000,44.770000>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,81.422129,0> translate<15.433100,0.000000,46.005200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.433100,-1.535000,46.005200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.619300,-1.535000,44.770000>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,81.422129,0> translate<15.433100,-1.535000,46.005200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.437900,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,45.974000>}
box{<0,0,-0.127000><0.296700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.437900,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.437900,-1.535000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.602600,-1.535000,45.974000>}
box{<0,0,-0.127000><17.164700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.437900,-1.535000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.443600,0.000000,18.221400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.085500,0.000000,18.221400>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.443600,0.000000,18.221400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.443600,0.000000,20.488100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.085500,0.000000,20.488100>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.443600,0.000000,20.488100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.456200,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,43.688000>}
box{<0,0,-0.127000><0.278400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.456200,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.456200,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.487100,-1.535000,43.688000>}
box{<0,0,-0.127000><17.030900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.456200,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.469000,0.000000,21.726600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.110900,0.000000,21.726600>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.469000,0.000000,21.726600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.469000,0.000000,23.993300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.110900,0.000000,23.993300>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.469000,0.000000,23.993300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.474000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.173200,0.000000,14.732000>}
box{<0,0,-0.127000><0.699200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.474000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.474000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.173200,-1.535000,14.732000>}
box{<0,0,-0.127000><0.699200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.474000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.476100,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,45.720000>}
box{<0,0,-0.127000><0.258500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.476100,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.476100,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.524300,-1.535000,45.720000>}
box{<0,0,-0.127000><17.048200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.476100,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494400,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,43.942000>}
box{<0,0,-0.127000><0.240200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.494400,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494400,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.408800,-1.535000,43.942000>}
box{<0,0,-0.127000><16.914400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.494400,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.514400,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,45.466000>}
box{<0,0,-0.127000><0.220200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.514400,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.514400,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.445900,-1.535000,45.466000>}
box{<0,0,-0.127000><16.931500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.514400,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.531800,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.859300,0.000000,11.684000>}
box{<0,0,-0.127000><1.327500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.531800,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.531800,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.859300,-1.535000,11.684000>}
box{<0,0,-0.127000><1.327500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.531800,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.532700,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.196000>}
box{<0,0,-0.127000><0.201900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.532700,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.532700,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.196000>}
box{<0,0,-0.127000><16.852300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.532700,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.538900,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.243100,0.000000,33.528000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.538900,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.552700,0.000000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,45.212000>}
box{<0,0,-0.127000><0.181900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.552700,0.000000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.552700,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,45.212000>}
box{<0,0,-0.127000><16.832300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.552700,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.571000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.813600,0.000000,44.450000>}
box{<0,0,-0.127000><0.242600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.571000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.571000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.450000>}
box{<0,0,-0.127000><16.814000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.571000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,0.000000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<15.581700,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<15.581700,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.581700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<15.581700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.591000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.958000>}
box{<0,0,-0.127000><0.143600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.591000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.591000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.958000>}
box{<0,0,-0.127000><16.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.591000,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.596300,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.105100,0.000000,14.478000>}
box{<0,0,-0.127000><0.508800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.596300,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.596300,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.105100,-1.535000,14.478000>}
box{<0,0,-0.127000><0.508800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.596300,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.609300,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.704000>}
box{<0,0,-0.127000><0.125300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.609300,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.609300,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.704000>}
box{<0,0,-0.127000><16.775700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.609300,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,11.912600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,11.912700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.641900,0.000000,11.912700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,11.912600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,11.912700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.641900,-1.535000,11.912700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,11.912700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.828100,0.000000,13.148000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<15.641900,0.000000,11.912700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,11.912700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.828100,-1.535000,13.148000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<15.641900,-1.535000,11.912700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,14.383200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,14.383300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.641900,-1.535000,14.383300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,-1.535000,14.383200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.828100,-1.535000,13.148000>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,81.422129,0> translate<15.641900,-1.535000,14.383200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.641900,0.000000,14.383300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.828100,0.000000,13.148000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,81.422813,0> translate<15.641900,0.000000,14.383300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.645700,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.605300,0.000000,11.938000>}
box{<0,0,-0.127000><0.959600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.645700,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.645700,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.605300,-1.535000,11.938000>}
box{<0,0,-0.127000><0.959600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.645700,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.665800,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.116000,-1.535000,33.274000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.665800,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.665800,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100100,0.000000,37.592000>}
box{<0,0,-0.127000><1.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.665800,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.665800,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.469300,-1.535000,37.592000>}
box{<0,0,-0.127000><4.803500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.665800,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.665900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.037100,-1.535000,14.224000>}
box{<0,0,-0.127000><0.371200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.665900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.666000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.037100,0.000000,14.224000>}
box{<0,0,-0.127000><0.371100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.666000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.683900,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.443700,0.000000,12.192000>}
box{<0,0,-0.127000><0.759800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.683900,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.683900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.443700,-1.535000,12.192000>}
box{<0,0,-0.127000><0.759800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.683900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704200,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,13.970000>}
box{<0,0,-0.127000><0.297800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.704200,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704200,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,13.970000>}
box{<0,0,-0.127000><0.297800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.704200,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722200,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.297000,0.000000,12.446000>}
box{<0,0,-0.127000><0.574800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.722200,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722200,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.297000,-1.535000,12.446000>}
box{<0,0,-0.127000><0.574800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.722200,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,42.629000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.008400,0.000000,42.355300>}
box{<0,0,-0.127000><0.387141,0.035000,0.127000> rotate<0,44.986566,0> translate<15.734600,0.000000,42.629000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.370900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,42.629000>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.734600,0.000000,42.629000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.370900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.813700,0.000000,44.449900>}
box{<0,0,-0.127000><0.111794,0.035000,0.127000> rotate<0,-44.960792,0> translate<15.734600,0.000000,44.370900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.529000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.813700,0.000000,44.449900>}
box{<0,0,-0.127000><0.111864,0.035000,0.127000> rotate<0,44.997030,0> translate<15.734600,0.000000,44.529000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,46.270900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,44.529000>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.734600,0.000000,44.529000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.734600,0.000000,46.270900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.047000,0.000000,46.583300>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.734600,0.000000,46.270900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.742500,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,13.716000>}
box{<0,0,-0.127000><0.259500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.742500,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.742500,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,13.716000>}
box{<0,0,-0.127000><0.259500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.742500,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.760500,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.174600,0.000000,12.700000>}
box{<0,0,-0.127000><0.414100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.760500,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.760500,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.174600,-1.535000,12.700000>}
box{<0,0,-0.127000><0.414100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.760500,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.780800,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,13.462000>}
box{<0,0,-0.127000><0.221200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.780800,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.780800,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,13.462000>}
box{<0,0,-0.127000><0.221200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.780800,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.792900,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.497100,0.000000,33.782000>}
box{<0,0,-0.127000><2.704200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.792900,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.798800,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.106600,0.000000,12.954000>}
box{<0,0,-0.127000><0.307800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.798800,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.798800,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.106600,-1.535000,12.954000>}
box{<0,0,-0.127000><0.307800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.798800,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.819100,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.038500,0.000000,13.208000>}
box{<0,0,-0.127000><0.219400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.819100,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.819100,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.038500,-1.535000,13.208000>}
box{<0,0,-0.127000><0.219400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.819100,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.879400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.308600,-1.535000,29.464000>}
box{<0,0,-0.127000><1.429200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.879400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,38.489600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.197000,0.000000,38.177200>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<15.884600,0.000000,38.489600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.131500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,38.489600>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.884600,0.000000,38.489600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.131500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.113700,0.000000,40.360500>}
box{<0,0,-0.127000><0.323926,0.035000,0.127000> rotate<0,-44.984524,0> translate<15.884600,0.000000,40.131500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.589600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.113700,0.000000,40.360500>}
box{<0,0,-0.127000><0.323996,0.035000,0.127000> rotate<0,44.997030,0> translate<15.884600,0.000000,40.589600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,42.231500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,40.589600>}
box{<0,0,-0.127000><1.641900,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.884600,0.000000,40.589600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.884600,0.000000,42.231500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.008400,0.000000,42.355300>}
box{<0,0,-0.127000><0.175080,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.884600,0.000000,42.231500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.919800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.370000,-1.535000,33.020000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.919800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.919800,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.354100,0.000000,37.338000>}
box{<0,0,-0.127000><1.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.919800,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.919800,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.322700,-1.535000,37.338000>}
box{<0,0,-0.127000><4.402900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.919800,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.986300,0.000000,37.271500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.420600,0.000000,37.271500>}
box{<0,0,-0.127000><1.434300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.986300,0.000000,37.271500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,0.000000,12.621600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<16.002000,0.000000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,-1.535000,12.621600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<16.002000,-1.535000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,13.344600>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.002000,0.000000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,13.344600>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.002000,-1.535000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,0.000000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,0.000000,14.816300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<16.002000,0.000000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,-1.535000,14.816300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<16.002000,-1.535000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.011700,0.000000,34.000800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.828900,0.000000,34.000800>}
box{<0,0,-0.127000><2.817200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.011700,0.000000,34.000800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.019500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.168300,0.000000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.019500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.019500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.168300,-1.535000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.019500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.047000,0.000000,46.583300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.988900,0.000000,46.583300>}
box{<0,0,-0.127000><1.941900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.047000,0.000000,46.583300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,0.000000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.057700,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.057700,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.057700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<16.057700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.173800,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.624000,-1.535000,32.766000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.173800,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.173800,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.228700,-1.535000,37.084000>}
box{<0,0,-0.127000><4.054900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.173800,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,0.000000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,0.000000,11.973300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<16.195700,0.000000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,-1.535000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,-1.535000,11.973300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<16.195700,-1.535000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,0.000000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,0.000000,15.464600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<16.195700,0.000000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.195700,-1.535000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,-1.535000,15.464600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<16.195700,-1.535000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.197000,0.000000,38.177200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.556000,0.000000,38.177200>}
box{<0,0,-0.127000><0.359000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.197000,0.000000,38.177200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.237800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.950100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<16.237800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.295900,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.892000,0.000000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.295900,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.295900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.892000,-1.535000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.295900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,0.000000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<16.422100,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,-1.535000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<16.422100,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.422100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<16.422100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.427800,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.878000,-1.535000,32.512000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.427800,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.427800,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.160700,-1.535000,36.830000>}
box{<0,0,-0.127000><3.732900,0.035000,0.127000> rotate<0,0.000000,0> translate<16.427800,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.451000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.737000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.451000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.475000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.712800,0.000000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.475000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.475000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.712800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.475000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.556000,0.000000,38.177200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.585100,0.000000,38.106900>}
box{<0,0,-0.127000><0.076085,0.035000,0.127000> rotate<0,67.508912,0> translate<16.556000,0.000000,38.177200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.556300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.631800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.556300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,0.000000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,0.000000,11.444000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<16.570000,0.000000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,-1.535000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,-1.535000,11.444000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<16.570000,-1.535000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,0.000000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,0.000000,15.993900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.570000,0.000000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.570000,-1.535000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,-1.535000,15.993900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.570000,-1.535000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.580200,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.607700,0.000000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.580200,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.580200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.607700,-1.535000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.580200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.585100,0.000000,38.106900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.621700,0.000000,38.070400>}
box{<0,0,-0.127000><0.051690,0.035000,0.127000> rotate<0,44.918655,0> translate<16.585100,0.000000,38.106900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,0.000000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,0.000000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<16.594000,0.000000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,-1.535000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<16.594000,-1.535000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.594000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<16.594000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.621700,0.000000,38.070400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.648200,0.000000,38.026500>}
box{<0,0,-0.127000><0.051278,0.035000,0.127000> rotate<0,58.879058,0> translate<16.621700,0.000000,38.070400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.648200,0.000000,38.026500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713400,0.000000,37.978700>}
box{<0,0,-0.127000><0.080845,0.035000,0.127000> rotate<0,36.243825,0> translate<16.648200,0.000000,38.026500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.681800,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.132000,-1.535000,32.258000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.681800,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.681800,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.092600,-1.535000,36.576000>}
box{<0,0,-0.127000><3.410800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.681800,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.713400,0.000000,37.978700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.420600,0.000000,37.271500>}
box{<0,0,-0.127000><1.000132,0.035000,0.127000> rotate<0,44.997030,0> translate<16.713400,0.000000,37.978700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,0.000000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<16.765800,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<16.765800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.765800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.765800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.935800,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.386000,-1.535000,32.004000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<16.935800,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.935800,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.024500,-1.535000,36.322000>}
box{<0,0,-0.127000><3.088700,0.035000,0.127000> rotate<0,0.000000,0> translate<16.935800,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.085500,0.000000,18.221400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.380600,0.000000,18.516600>}
box{<0,0,-0.127000><0.417405,0.035000,0.127000> rotate<0,-45.006736,0> translate<17.085500,0.000000,18.221400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.085500,0.000000,20.488100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.380600,0.000000,20.192900>}
box{<0,0,-0.127000><0.417405,0.035000,0.127000> rotate<0,45.006736,0> translate<17.085500,0.000000,20.488100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.093100,-1.535000,29.978900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.278900,-1.535000,29.793100>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,44.997030,0> translate<17.093100,-1.535000,29.978900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,0.000000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,0.000000,11.069700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<17.099300,0.000000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,-1.535000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,-1.535000,11.069700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<17.099300,-1.535000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,0.000000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,0.000000,16.368200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<17.099300,0.000000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.099300,-1.535000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,-1.535000,16.368200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<17.099300,-1.535000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.110900,0.000000,21.726600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.406000,0.000000,22.021800>}
box{<0,0,-0.127000><0.417405,0.035000,0.127000> rotate<0,-45.006736,0> translate<17.110900,0.000000,21.726600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.110900,0.000000,23.993300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.406000,0.000000,23.698100>}
box{<0,0,-0.127000><0.417405,0.035000,0.127000> rotate<0,45.006736,0> translate<17.110900,0.000000,23.993300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,0.000000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<17.130200,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<17.130200,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.130200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<17.130200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.152000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.288000>}
box{<0,0,-0.127000><16.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.152000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.189800,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.640000,-1.535000,31.750000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.189800,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.189800,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,36.068000>}
box{<0,0,-0.127000><2.798800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.189800,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.228200,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,21.844000>}
box{<0,0,-0.127000><1.661200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.228200,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.228200,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.068700,0.000000,23.876000>}
box{<0,0,-0.127000><1.840500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.228200,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.253600,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.642700,0.000000,20.320000>}
box{<0,0,-0.127000><2.389100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.253600,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.278900,-1.535000,29.793100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.521600,-1.535000,29.692600>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,22.492544,0> translate<17.278900,-1.535000,29.793100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.380600,0.000000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.347000,0.000000,18.516600>}
box{<0,0,-0.127000><3.966400,0.035000,0.127000> rotate<0,0.000000,0> translate<17.380600,0.000000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.380600,0.000000,20.192900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.949700,0.000000,20.192900>}
box{<0,0,-0.127000><2.569100,0.035000,0.127000> rotate<0,0.000000,0> translate<17.380600,0.000000,20.192900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.406000,0.000000,22.021800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,22.021800>}
box{<0,0,-0.127000><1.483400,0.035000,0.127000> rotate<0,0.000000,0> translate<17.406000,0.000000,22.021800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.406000,0.000000,23.698100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.995000,0.000000,23.698100>}
box{<0,0,-0.127000><1.589000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.406000,0.000000,23.698100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.443800,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.894000,-1.535000,31.496000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.443800,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.443800,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,35.814000>}
box{<0,0,-0.127000><2.544800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.443800,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.521600,-1.535000,29.692600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.158400,-1.535000,29.692600>}
box{<0,0,-0.127000><9.636800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.521600,-1.535000,29.692600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,0.000000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.606200,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.606200,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.606200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<17.606200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.697800,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.148000,-1.535000,31.242000>}
box{<0,0,-0.127000><2.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.697800,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.697800,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,35.560000>}
box{<0,0,-0.127000><2.290800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.697800,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,0.000000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,0.000000,10.876000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<17.747600,0.000000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,-1.535000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,-1.535000,10.876000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<17.747600,-1.535000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,0.000000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,0.000000,16.561900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<17.747600,0.000000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.747600,-1.535000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,-1.535000,16.561900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<17.747600,-1.535000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.926500,-1.535000,31.013300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.376800,-1.535000,31.013300>}
box{<0,0,-0.127000><2.450300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.926500,-1.535000,31.013300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.951800,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,35.306000>}
box{<0,0,-0.127000><2.036800,0.035000,0.127000> rotate<0,0.000000,0> translate<17.951800,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.988900,0.000000,46.583300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,0.000000,46.284200>}
box{<0,0,-0.127000><0.422991,0.035000,0.127000> rotate<0,44.997030,0> translate<17.988900,0.000000,46.583300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.090200,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.485800,0.000000,46.482000>}
box{<0,0,-0.127000><0.395600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.090200,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,0.000000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<18.121700,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<18.121700,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.121700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<18.121700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.205800,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.997200,-1.535000,35.052000>}
box{<0,0,-0.127000><1.791400,0.035000,0.127000> rotate<0,0.000000,0> translate<18.205800,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.288000,0.000000,46.284200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.587000,0.000000,46.583300>}
box{<0,0,-0.127000><0.422921,0.035000,0.127000> rotate<0,-45.006609,0> translate<18.288000,0.000000,46.284200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.419400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.848600,-1.535000,29.464000>}
box{<0,0,-0.127000><1.429200,0.035000,0.127000> rotate<0,0.000000,0> translate<18.419400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.459800,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.065200,-1.535000,34.798000>}
box{<0,0,-0.127000><1.605400,0.035000,0.127000> rotate<0,0.000000,0> translate<18.459800,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,0.000000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,0.000000,10.876000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.470600,0.000000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,-1.535000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,-1.535000,10.876000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.470600,-1.535000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,0.000000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,0.000000,16.561900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.470600,0.000000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.470600,-1.535000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,-1.535000,16.561900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<18.470600,-1.535000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.559500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.708300,0.000000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<18.559500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.559500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.708300,-1.535000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<18.559500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.587000,0.000000,46.583300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.528900,0.000000,46.583300>}
box{<0,0,-0.127000><1.941900,0.035000,0.127000> rotate<0,0.000000,0> translate<18.587000,0.000000,46.583300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,0.000000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.597700,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.597700,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.597700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<18.597700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.636100,0.000000,33.921000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.828900,0.000000,34.000800>}
box{<0,0,-0.127000><0.208662,0.035000,0.127000> rotate<0,-22.483200,0> translate<18.636100,0.000000,33.921000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.713800,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.133300,-1.535000,34.544000>}
box{<0,0,-0.127000><1.419500,0.035000,0.127000> rotate<0,0.000000,0> translate<18.713800,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.777800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.490100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<18.777800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.835900,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.432000,0.000000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.835900,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.835900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.432000,-1.535000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<18.835900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,21.266700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,0.000000,20.769600>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,67.496092,0> translate<18.889400,0.000000,21.266700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,21.266700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,-1.535000,20.769600>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,67.496092,0> translate<18.889400,-1.535000,21.266700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,22.021800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,0.000000,21.266700>}
box{<0,0,-0.127000><0.755100,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.889400,0.000000,21.266700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,23.443200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,21.266700>}
box{<0,0,-0.127000><2.176500,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.889400,-1.535000,21.266700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.889400,-1.535000,23.443200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,-1.535000,23.940300>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-67.496092,0> translate<18.889400,-1.535000,23.443200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,0.000000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<18.962100,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,-1.535000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<18.962100,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.962100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<18.962100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.967800,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.201400,-1.535000,34.290000>}
box{<0,0,-0.127000><1.233600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.967800,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.991000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.277000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.991000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.995000,0.000000,23.698100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,0.000000,23.940300>}
box{<0,0,-0.127000><0.262147,0.035000,0.127000> rotate<0,-67.500093,0> translate<18.995000,0.000000,23.698100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.015000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.252800,0.000000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.015000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.015000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.252800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.015000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,0.000000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,0.000000,20.389100>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<19.095300,0.000000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<19.095300,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,0.000000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,0.000000,24.320800>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.095300,0.000000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.095300,-1.535000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,-1.535000,24.320800>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.095300,-1.535000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.096300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.171800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.096300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.120200,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.147700,0.000000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.120200,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.120200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.147700,-1.535000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.120200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,0.000000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,0.000000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<19.134000,0.000000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,-1.535000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<19.134000,-1.535000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.134000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<19.134000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,0.000000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,0.000000,11.069700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<19.219300,0.000000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,-1.535000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,-1.535000,11.069700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<19.219300,-1.535000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,0.000000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,0.000000,16.368200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<19.219300,0.000000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.219300,-1.535000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,-1.535000,16.368200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<19.219300,-1.535000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.221800,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.269400,-1.535000,34.036000>}
box{<0,0,-0.127000><1.047600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.221800,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,0.000000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<19.305800,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<19.305800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.305800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.305800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.390900,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.712900,0.000000,10.922000>}
box{<0,0,-0.127000><9.322000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.390900,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.390900,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.712900,-1.535000,10.922000>}
box{<0,0,-0.127000><9.322000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.390900,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413100,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.690900,0.000000,16.510000>}
box{<0,0,-0.127000><9.277800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.413100,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.413100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.690900,-1.535000,16.510000>}
box{<0,0,-0.127000><9.277800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.413100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,0.000000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.949700,0.000000,20.192900>}
box{<0,0,-0.127000><0.512909,0.035000,0.127000> rotate<0,22.488628,0> translate<19.475800,0.000000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.972900,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<19.475800,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,0.000000,24.320800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.364600>}
box{<0,0,-0.127000><0.114508,0.035000,0.127000> rotate<0,-22.487516,0> translate<19.475800,0.000000,24.320800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,-1.535000,24.320800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.972900,-1.535000,24.526700>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<19.475800,-1.535000,24.320800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.475800,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.410500,-1.535000,33.782000>}
box{<0,0,-0.127000><0.934700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.475800,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.428600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.364600>}
box{<0,0,-0.127000><0.064000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.581600,0.000000,24.364600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.691300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.428600>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.581600,0.000000,24.428600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.581600,0.000000,24.691300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.682100,0.000000,24.934000>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<19.581600,0.000000,24.691300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,0.000000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<19.670200,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<19.670200,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.670200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<19.670200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.682100,0.000000,24.934000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.220800,0.000000,25.472600>}
box{<0,0,-0.127000><0.761766,0.035000,0.127000> rotate<0,-44.991712,0> translate<19.682100,0.000000,24.934000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.729800,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.557200,-1.535000,33.528000>}
box{<0,0,-0.127000><0.827400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.729800,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,0.000000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,0.000000,11.444000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<19.942300,0.000000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,-1.535000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,-1.535000,11.444000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<19.942300,-1.535000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,0.000000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,0.000000,15.993900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<19.942300,0.000000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.942300,-1.535000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,-1.535000,15.993900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<19.942300,-1.535000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.972900,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.511000,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.972900,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.972900,-1.535000,24.526700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.511000,-1.535000,24.526700>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.972900,-1.535000,24.526700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.983800,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.703800,-1.535000,33.274000>}
box{<0,0,-0.127000><0.720000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.983800,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,35.084200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.274300,-1.535000,34.018000>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,74.994420,0> translate<19.988600,-1.535000,35.084200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,36.188100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,35.084200>}
box{<0,0,-0.127000><1.103900,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.988600,-1.535000,35.084200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.988600,-1.535000,36.188100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.274300,-1.535000,37.254300>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,-74.994420,0> translate<19.988600,-1.535000,36.188100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.126400,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.977400,0.000000,11.176000>}
box{<0,0,-0.127000><7.851000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.126400,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.126400,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.977400,-1.535000,11.176000>}
box{<0,0,-0.127000><7.851000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.126400,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.136700,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.967300,0.000000,16.256000>}
box{<0,0,-0.127000><7.830600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.136700,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.136700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.967300,-1.535000,16.256000>}
box{<0,0,-0.127000><7.830600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.136700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.220800,0.000000,25.472600>}
box{<0,0,-0.127000><0.074600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.146200,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.661700,-1.535000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.146200,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.146200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.661700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.146200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.237800,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.868300,-1.535000,33.020000>}
box{<0,0,-0.127000><0.630500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.237800,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.274300,-1.535000,34.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.826200,-1.535000,33.062100>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,59.995551,0> translate<20.274300,-1.535000,34.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.274300,-1.535000,37.254300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.826200,-1.535000,38.210200>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,-59.995551,0> translate<20.274300,-1.535000,37.254300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.491800,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.122300,-1.535000,32.766000>}
box{<0,0,-0.127000><0.630500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.491800,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.511000,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.008100,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<20.511000,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.511000,-1.535000,24.526700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.008100,-1.535000,24.320800>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<20.511000,-1.535000,24.526700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.528900,0.000000,46.583300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841300,0.000000,46.270900>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<20.528900,0.000000,46.583300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.566300,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.537500,0.000000,11.430000>}
box{<0,0,-0.127000><6.971200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.566300,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.566300,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.537500,-1.535000,11.430000>}
box{<0,0,-0.127000><6.971200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.566300,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.576600,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.527400,0.000000,16.002000>}
box{<0,0,-0.127000><6.950800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.576600,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.576600,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.527400,-1.535000,16.002000>}
box{<0,0,-0.127000><6.950800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.576600,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,0.000000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,0.000000,11.973300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.590600,0.000000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,-1.535000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,-1.535000,11.973300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.590600,-1.535000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,0.000000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,0.000000,15.464600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<20.590600,0.000000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.590600,-1.535000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,-1.535000,15.464600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<20.590600,-1.535000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.630200,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766600,0.000000,46.482000>}
box{<0,0,-0.127000><12.136400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.630200,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.661700,-1.535000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.137700,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<20.661700,-1.535000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.661700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.137700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<20.661700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.745800,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.376300,-1.535000,32.512000>}
box{<0,0,-0.127000><0.630500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.745800,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.826200,-1.535000,33.062100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.606700,-1.535000,32.281600>}
box{<0,0,-0.127000><1.103794,0.035000,0.127000> rotate<0,44.997030,0> translate<20.826200,-1.535000,33.062100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.826200,-1.535000,38.210200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.606700,-1.535000,38.990700>}
box{<0,0,-0.127000><1.103794,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.826200,-1.535000,38.210200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.830600,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.273300,0.000000,11.684000>}
box{<0,0,-0.127000><6.442700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.830600,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.830600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.273300,-1.535000,11.684000>}
box{<0,0,-0.127000><6.442700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.830600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.836500,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.267400,0.000000,15.748000>}
box{<0,0,-0.127000><6.430900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.836500,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.836500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.267400,-1.535000,15.748000>}
box{<0,0,-0.127000><6.430900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.836500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841200,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.182600,-1.535000,20.320000>}
box{<0,0,-0.127000><1.341400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.841200,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841300,0.000000,46.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841300,0.000000,46.270900>}
box{<0,0,-0.127000><0.144600,0.035000,0.127000> rotate<0,90.000000,0> translate<20.841300,0.000000,46.270900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841300,0.000000,46.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.855700,0.000000,46.126300>}
box{<0,0,-0.127000><2.014400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.841300,0.000000,46.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.841300,0.000000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.681000,0.000000,46.228000>}
box{<0,0,-0.127000><11.839700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.841300,0.000000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.855600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.168400,-1.535000,24.384000>}
box{<0,0,-0.127000><1.312800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.855600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.959400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.388600,-1.535000,29.464000>}
box{<0,0,-0.127000><1.429200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.959400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.999800,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.647500,-1.535000,32.258000>}
box{<0,0,-0.127000><0.647700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.999800,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.008100,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.388600,-1.535000,20.769600>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.008100,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.008100,-1.535000,24.320800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.388600,-1.535000,23.940300>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<21.008100,-1.535000,24.320800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.084600,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.019300,0.000000,11.938000>}
box{<0,0,-0.127000><5.934700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.084600,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.084600,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.019300,-1.535000,11.938000>}
box{<0,0,-0.127000><5.934700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.084600,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.090500,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.013400,0.000000,15.494000>}
box{<0,0,-0.127000><5.922900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.090500,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.090500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.013400,-1.535000,15.494000>}
box{<0,0,-0.127000><5.922900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.090500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.099500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.248300,-1.535000,25.654000>}
box{<0,0,-0.127000><1.148800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.099500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,0.000000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,0.000000,12.621600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<21.119900,0.000000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,-1.535000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,-1.535000,12.621600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<21.119900,-1.535000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,0.000000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,0.000000,14.816300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<21.119900,0.000000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.119900,-1.535000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,-1.535000,14.816300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<21.119900,-1.535000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.137700,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.502100,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.137700,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.137700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.502100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<21.137700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.193000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.830900,-1.535000,20.574000>}
box{<0,0,-0.127000><0.637900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.193000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.198900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.825000,-1.535000,24.130000>}
box{<0,0,-0.127000><0.626100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.198900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.228500,-1.535000,32.029300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.043900,-1.535000,32.029300>}
box{<0,0,-0.127000><0.815400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.228500,-1.535000,32.029300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.246100,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.857700,0.000000,12.192000>}
box{<0,0,-0.127000><5.611600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.246100,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.246100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.857700,-1.535000,12.192000>}
box{<0,0,-0.127000><5.611600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.246100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.249600,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.854400,0.000000,15.240000>}
box{<0,0,-0.127000><5.604800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.249600,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.249600,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.854400,-1.535000,15.240000>}
box{<0,0,-0.127000><5.604800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.249600,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.317800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.030100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.317800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.347000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.680500,0.000000,18.516600>}
box{<0,0,-0.127000><0.333500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.347000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.375900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.972000,-1.535000,25.908000>}
box{<0,0,-0.127000><0.596100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.375900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.388600,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.512000,-1.535000,21.067500>}
box{<0,0,-0.127000><0.322447,0.035000,0.127000> rotate<0,-67.494596,0> translate<21.388600,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.388600,-1.535000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.512000,-1.535000,23.642400>}
box{<0,0,-0.127000><0.322447,0.035000,0.127000> rotate<0,67.494596,0> translate<21.388600,-1.535000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.392800,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.711000,0.000000,12.446000>}
box{<0,0,-0.127000><5.318200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.392800,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.392800,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.711000,-1.535000,12.446000>}
box{<0,0,-0.127000><5.318200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.392800,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396300,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.707700,0.000000,14.986000>}
box{<0,0,-0.127000><5.311400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.396300,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396300,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.707700,-1.535000,14.986000>}
box{<0,0,-0.127000><5.311400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.396300,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.412700,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.611100,-1.535000,20.828000>}
box{<0,0,-0.127000><0.198400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.412700,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.415300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.608700,-1.535000,23.876000>}
box{<0,0,-0.127000><0.193400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.415300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,0.000000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,13.344600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<21.494200,0.000000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,-1.535000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,13.344600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<21.494200,-1.535000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,0.000000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,14.093300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<21.494200,0.000000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.494200,-1.535000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,14.093300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<21.494200,-1.535000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.502100,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.674000,-1.535000,26.449100>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,-67.490502,0> translate<21.502100,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.502100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.674000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<21.502100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.512000,-1.535000,21.067500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635300,-1.535000,20.769600>}
box{<0,0,-0.127000><0.322409,0.035000,0.127000> rotate<0,67.511014,0> translate<21.512000,-1.535000,21.067500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.512000,-1.535000,23.642400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635300,-1.535000,23.940300>}
box{<0,0,-0.127000><0.322409,0.035000,0.127000> rotate<0,-67.511014,0> translate<21.512000,-1.535000,23.642400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.515200,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.588600,0.000000,12.700000>}
box{<0,0,-0.127000><5.073400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.515200,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.515200,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.588600,-1.535000,12.700000>}
box{<0,0,-0.127000><5.073400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.515200,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.516800,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.587200,0.000000,14.732000>}
box{<0,0,-0.127000><5.070400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.516800,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.516800,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.587200,-1.535000,14.732000>}
box{<0,0,-0.127000><5.070400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.516800,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.531000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.531000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.555000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.792800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.237800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.555000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.583200,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.520600,0.000000,12.954000>}
box{<0,0,-0.127000><4.937400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.583200,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.583200,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.520600,-1.535000,12.954000>}
box{<0,0,-0.127000><4.937400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.583200,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.584900,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.519100,0.000000,14.478000>}
box{<0,0,-0.127000><4.934200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.584900,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.584900,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.519100,-1.535000,14.478000>}
box{<0,0,-0.127000><4.934200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.584900,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.606700,-1.535000,32.281600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.043900,-1.535000,32.029300>}
box{<0,0,-0.127000><0.504776,0.035000,0.127000> rotate<0,29.986467,0> translate<21.606700,-1.535000,32.281600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.606700,-1.535000,38.990700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.562600,-1.535000,39.542600>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,-29.998509,0> translate<21.606700,-1.535000,38.990700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635300,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.015800,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<21.635300,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635300,-1.535000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.015800,-1.535000,24.320800>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.635300,-1.535000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.636300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.711800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.636300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.651300,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.452500,0.000000,13.208000>}
box{<0,0,-0.127000><4.801200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.651300,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.651300,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.452500,-1.535000,13.208000>}
box{<0,0,-0.127000><4.801200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.651300,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.652900,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.451100,0.000000,14.224000>}
box{<0,0,-0.127000><4.798200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.652900,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.652900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.451100,-1.535000,14.224000>}
box{<0,0,-0.127000><4.798200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.652900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.660200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687700,-1.535000,26.416000>}
box{<0,0,-0.127000><0.027500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.660200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.674000,-1.535000,26.449100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.845800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,67.502288,0> translate<21.674000,-1.535000,26.449100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.674000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.845800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<21.674000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.680500,0.000000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.988500,0.000000,18.644200>}
box{<0,0,-0.127000><0.333385,0.035000,0.127000> rotate<0,-22.502043,0> translate<21.680500,0.000000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,14.093300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<21.687900,0.000000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,14.093300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<21.687900,-1.535000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,13.462000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,13.462000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,13.716000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,13.716000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,13.970000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.687900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,13.970000>}
box{<0,0,-0.127000><4.728100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.687900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.741800,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.736600,0.000000,18.542000>}
box{<0,0,-0.127000><12.994800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.741800,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.845800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210200,-1.535000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<21.845800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.845800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.845800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.988500,0.000000,18.644200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.334700,0.000000,19.990400>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.988500,0.000000,18.644200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.015800,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.512900,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<22.015800,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.015800,-1.535000,24.320800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.512900,-1.535000,24.526700>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<22.015800,-1.535000,24.320800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.140300,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.796000>}
box{<0,0,-0.127000><11.692700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.140300,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210200,-1.535000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.404100,-1.535000,25.589500>}
box{<0,0,-0.127000><0.209870,0.035000,0.127000> rotate<0,22.494477,0> translate<22.210200,-1.535000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.210200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.686200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<22.210200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.394300,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,19.050000>}
box{<0,0,-0.127000><11.438700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.394300,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.404100,-1.535000,25.589500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.427100,-1.535000,25.533900>}
box{<0,0,-0.127000><0.060169,0.035000,0.127000> rotate<0,67.522177,0> translate<22.404100,-1.535000,25.589500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.427100,-1.535000,25.533900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.612900,-1.535000,25.348100>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,44.997030,0> translate<22.427100,-1.535000,25.533900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.512900,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.051000,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.512900,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.512900,-1.535000,24.526700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.051000,-1.535000,24.526700>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.512900,-1.535000,24.526700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.562600,-1.535000,39.542600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.628800,-1.535000,39.828300>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,-14.999640,0> translate<22.562600,-1.535000,39.542600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.612900,-1.535000,25.348100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.628900,-1.535000,24.332100>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<22.612900,-1.535000,25.348100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.648300,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,19.304000>}
box{<0,0,-0.127000><11.184700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.648300,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.686200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.201700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.686200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.855700,0.000000,46.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.983000,0.000000,46.127900>}
box{<0,0,-0.127000><0.127310,0.035000,0.127000> rotate<0,-0.720050,0> translate<22.855700,0.000000,46.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.902300,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.865000,0.000000,19.558000>}
box{<0,0,-0.127000><10.962700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.902300,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.983000,0.000000,46.127900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,46.126300>}
box{<0,0,-0.127000><0.004308,0.035000,0.127000> rotate<0,21.799971,0> translate<22.983000,0.000000,46.127900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.987000,0.000000,46.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.991300,0.000000,46.126300>}
box{<0,0,-0.127000><0.004300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.987000,0.000000,46.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.991300,0.000000,46.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.109700,0.000000,46.077200>}
box{<0,0,-0.127000><0.128177,0.035000,0.127000> rotate<0,22.522100,0> translate<22.991300,0.000000,46.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.051000,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.548100,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<23.051000,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.051000,-1.535000,24.526700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.548100,-1.535000,24.320800>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<23.051000,-1.535000,24.526700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.109700,0.000000,46.077200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.227000,0.000000,46.030400>}
box{<0,0,-0.127000><0.126291,0.035000,0.127000> rotate<0,21.749426,0> translate<23.109700,0.000000,46.077200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.156300,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.803600,0.000000,19.812000>}
box{<0,0,-0.127000><12.647300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.156300,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.201700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.677700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<23.201700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.227000,0.000000,46.030400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.230000,0.000000,46.027400>}
box{<0,0,-0.127000><0.004243,0.035000,0.127000> rotate<0,44.997030,0> translate<23.227000,0.000000,46.030400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.230000,0.000000,46.027400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.234000,0.000000,46.025800>}
box{<0,0,-0.127000><0.004308,0.035000,0.127000> rotate<0,21.799971,0> translate<23.230000,0.000000,46.027400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.234000,0.000000,46.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323800,0.000000,45.936000>}
box{<0,0,-0.127000><0.126996,0.035000,0.127000> rotate<0,44.997030,0> translate<23.234000,0.000000,46.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.285800,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.602600,0.000000,45.974000>}
box{<0,0,-0.127000><9.316800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.285800,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.323800,0.000000,45.936000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.345700,0.000000,41.038700>}
box{<0,0,-0.127000><7.014487,0.035000,0.127000> rotate<0,44.277395,0> translate<23.323800,0.000000,45.936000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.334700,0.000000,19.990400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.570500,0.000000,20.226200>}
box{<0,0,-0.127000><0.333472,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.334700,0.000000,19.990400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.381200,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.262600,-1.535000,20.320000>}
box{<0,0,-0.127000><3.881400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.381200,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.395600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.577000,-1.535000,24.384000>}
box{<0,0,-0.127000><0.181400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.395600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.410300,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.066000>}
box{<0,0,-0.127000><13.263900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.410300,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.499400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.928600,-1.535000,29.464000>}
box{<0,0,-0.127000><1.429200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.499400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.545300,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.524300,0.000000,45.720000>}
box{<0,0,-0.127000><8.979000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.545300,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.548100,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,-1.535000,20.769600>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.548100,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.548100,-1.535000,24.320800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,-1.535000,23.940300>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<23.548100,-1.535000,24.320800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.570500,0.000000,20.226200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.698100,0.000000,20.534200>}
box{<0,0,-0.127000><0.333385,0.035000,0.127000> rotate<0,-67.492017,0> translate<23.570500,0.000000,20.226200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.609300,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.262600,0.000000,20.320000>}
box{<0,0,-0.127000><3.653300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.609300,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.628800,-1.535000,39.828300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.732700,-1.535000,39.828300>}
box{<0,0,-0.127000><1.103900,0.035000,0.127000> rotate<0,0.000000,0> translate<23.628800,-1.535000,39.828300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.628900,-1.535000,24.332100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.871600,-1.535000,24.231600>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,22.492544,0> translate<23.628900,-1.535000,24.332100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.677700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.042100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<23.677700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.698100,0.000000,20.534200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.698100,0.000000,20.539100>}
box{<0,0,-0.127000><0.004900,0.035000,0.127000> rotate<0,90.000000,0> translate<23.698100,0.000000,20.539100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.698100,0.000000,20.539100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,0.000000,20.769600>}
box{<0,0,-0.127000><0.325976,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.698100,0.000000,20.539100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.733000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.586400,0.000000,20.574000>}
box{<0,0,-0.127000><0.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.733000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.733000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.586400,-1.535000,20.574000>}
box{<0,0,-0.127000><0.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<23.733000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.738900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.580500,-1.535000,24.130000>}
box{<0,0,-0.127000><0.841600,0.035000,0.127000> rotate<0,0.000000,0> translate<23.738900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.805800,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.445900,0.000000,45.466000>}
box{<0,0,-0.127000><8.640100,0.035000,0.127000> rotate<0,0.000000,0> translate<23.805800,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.857800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.570100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<23.857800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.871600,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134300,-1.535000,24.231600>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.871600,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,0.000000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,0.000000,21.266600>}
box{<0,0,-0.127000><0.537924,0.035000,0.127000> rotate<0,-67.501857,0> translate<23.928600,0.000000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,-1.535000,21.266600>}
box{<0,0,-0.127000><0.537924,0.035000,0.127000> rotate<0,-67.501857,0> translate<23.928600,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.928600,-1.535000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,-1.535000,23.443300>}
box{<0,0,-0.127000><0.537924,0.035000,0.127000> rotate<0,67.501857,0> translate<23.928600,-1.535000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.952700,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.332400,0.000000,20.828000>}
box{<0,0,-0.127000><0.379700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.952700,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.952700,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.332400,-1.535000,20.828000>}
box{<0,0,-0.127000><0.379700,0.035000,0.127000> rotate<0,0.000000,0> translate<23.952700,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.955300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.326500,-1.535000,23.876000>}
box{<0,0,-0.127000><0.371200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.955300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.042100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.214000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<24.042100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.057900,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.210800,0.000000,21.082000>}
box{<0,0,-0.127000><0.152900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.057900,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.057900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.210800,-1.535000,21.082000>}
box{<0,0,-0.127000><0.152900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.057900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.060500,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.208500,-1.535000,23.622000>}
box{<0,0,-0.127000><0.148000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.060500,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.066300,0.000000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,45.212000>}
box{<0,0,-0.127000><8.318700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.066300,0.000000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.071000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.357000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.071000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134300,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.738800,-1.535000,24.231600>}
box{<0,0,-0.127000><0.604500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.134300,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,0.000000,21.266600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,0.000000,20.855900>}
box{<0,0,-0.127000><0.444532,0.035000,0.127000> rotate<0,67.497630,0> translate<24.134400,0.000000,21.266600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,-1.535000,21.266600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,-1.535000,20.855900>}
box{<0,0,-0.127000><0.444532,0.035000,0.127000> rotate<0,67.497630,0> translate<24.134400,-1.535000,21.266600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.134400,-1.535000,23.443300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,-1.535000,23.854000>}
box{<0,0,-0.127000><0.444532,0.035000,0.127000> rotate<0,-67.497630,0> translate<24.134400,-1.535000,23.443300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.176300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.251800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.176300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.214000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.385800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<24.214000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,0.000000,20.855900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,0.000000,20.518300>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<24.304500,0.000000,20.855900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,-1.535000,20.855900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,-1.535000,20.518300>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<24.304500,-1.535000,20.855900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.304500,-1.535000,23.854000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,-1.535000,24.191600>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.304500,-1.535000,23.854000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.326700,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.958000>}
box{<0,0,-0.127000><8.058300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.326700,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.385800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.385800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.587200,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.704000>}
box{<0,0,-0.127000><7.797800,0.035000,0.127000> rotate<0,0.000000,0> translate<24.587200,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,0.000000,20.518300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.083200,0.000000,20.335600>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<24.642100,0.000000,20.518300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,-1.535000,20.518300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.083200,-1.535000,20.335600>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<24.642100,-1.535000,20.518300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.642100,-1.535000,24.191600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.738800,-1.535000,24.231600>}
box{<0,0,-0.127000><0.104647,0.035000,0.127000> rotate<0,-22.470973,0> translate<24.642100,-1.535000,24.191600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.732700,-1.535000,39.828300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.798900,-1.535000,39.542600>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,14.999640,0> translate<24.732700,-1.535000,39.828300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.226200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<24.750200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.847700,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.450000>}
box{<0,0,-0.127000><7.537300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.847700,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.083200,0.000000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,20.335600>}
box{<0,0,-0.127000><0.111800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.083200,0.000000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.083200,-1.535000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,20.335600>}
box{<0,0,-0.127000><0.111800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.083200,-1.535000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.108100,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.196000>}
box{<0,0,-0.127000><7.276900,0.035000,0.127000> rotate<0,0.000000,0> translate<25.108100,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,22.227500>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,90.000000,0> translate<25.195000,0.000000,22.227500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,22.227500>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,90.000000,0> translate<25.195000,-1.535000,22.227500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,20.574000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,20.574000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,20.828000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,20.828000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,21.082000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,21.082000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,21.336000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,21.336000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,21.590000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,21.590000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,21.844000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,21.844000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,22.098000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,22.098000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,0.000000,22.227500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,22.227500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,0.000000,22.227500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.195000,-1.535000,22.227500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,22.227500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.195000,-1.535000,22.227500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.226200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.741700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.226200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.368600,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.408800,0.000000,43.942000>}
box{<0,0,-0.127000><7.040200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.368600,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.560700,0.000000,20.335600>}
box{<0,0,-0.127000><0.111900,0.035000,0.127000> rotate<0,0.000000,0> translate<25.448800,0.000000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.560700,-1.535000,20.335600>}
box{<0,0,-0.127000><0.111900,0.035000,0.127000> rotate<0,0.000000,0> translate<25.448800,-1.535000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,22.227500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,0.000000,20.335600>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.448800,0.000000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,22.227500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.448800,-1.535000,20.335600>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.448800,-1.535000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.495200,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,39.624000>}
box{<0,0,-0.127000><13.493800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.495200,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.560700,0.000000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.001800,0.000000,20.518300>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<25.560700,0.000000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.560700,-1.535000,20.335600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.001800,-1.535000,20.518300>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<25.560700,-1.535000,20.335600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.629000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.487100,0.000000,43.688000>}
box{<0,0,-0.127000><6.858100,0.035000,0.127000> rotate<0,0.000000,0> translate<25.629000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.741700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.217700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<25.741700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.798900,-1.535000,39.542600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754800,-1.535000,38.990700>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,29.998509,0> translate<25.798900,-1.535000,39.542600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.889500,0.000000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.565500,0.000000,43.434000>}
box{<0,0,-0.127000><6.676000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.889500,0.000000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.001800,0.000000,20.518300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339400,0.000000,20.855900>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.001800,0.000000,20.518300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.001800,-1.535000,20.518300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339400,-1.535000,20.855900>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.001800,-1.535000,20.518300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.039400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.387000,-1.535000,29.464000>}
box{<0,0,-0.127000><1.347600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.039400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.057500,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.910900,0.000000,20.574000>}
box{<0,0,-0.127000><0.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<26.057500,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.057500,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.910900,-1.535000,20.574000>}
box{<0,0,-0.127000><0.853400,0.035000,0.127000> rotate<0,0.000000,0> translate<26.057500,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.097900,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,39.370000>}
box{<0,0,-0.127000><12.891100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.097900,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.150000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.643800,0.000000,43.180000>}
box{<0,0,-0.127000><6.493800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.150000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.217700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.582100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<26.217700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.311500,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.691100,0.000000,20.828000>}
box{<0,0,-0.127000><0.379600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.311500,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.311500,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.691100,-1.535000,20.828000>}
box{<0,0,-0.127000><0.379600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.311500,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.317600,-1.535000,32.029300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754800,-1.535000,32.281600>}
box{<0,0,-0.127000><0.504776,0.035000,0.127000> rotate<0,-29.986467,0> translate<26.317600,-1.535000,32.029300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.317600,-1.535000,32.029300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.205600,-1.535000,32.029300>}
box{<0,0,-0.127000><2.888000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.317600,-1.535000,32.029300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339400,0.000000,20.855900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.509500,0.000000,21.266600>}
box{<0,0,-0.127000><0.444532,0.035000,0.127000> rotate<0,-67.497630,0> translate<26.339400,0.000000,20.855900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.339400,-1.535000,20.855900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.509500,-1.535000,21.266600>}
box{<0,0,-0.127000><0.444532,0.035000,0.127000> rotate<0,-67.497630,0> translate<26.339400,-1.535000,20.855900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.397800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.110100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.712300,0.035000,0.127000> rotate<0,0.000000,0> translate<26.397800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.410400,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.722200,0.000000,42.926000>}
box{<0,0,-0.127000><6.311800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.410400,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,0.000000,12.621600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<26.416000,0.000000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,-1.535000,12.621600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<26.416000,-1.535000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,13.344600>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.416000,0.000000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,13.344600>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.416000,-1.535000,13.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,0.000000,14.816300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<26.416000,0.000000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,14.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,-1.535000,14.816300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<26.416000,-1.535000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.433000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.585900,0.000000,21.082000>}
box{<0,0,-0.127000><0.152900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.433000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.433000,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.585900,-1.535000,21.082000>}
box{<0,0,-0.127000><0.152900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.433000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.509500,0.000000,21.266600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.715300,0.000000,20.769600>}
box{<0,0,-0.127000><0.537924,0.035000,0.127000> rotate<0,67.501857,0> translate<26.509500,0.000000,21.266600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.509500,-1.535000,21.266600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.715300,-1.535000,20.769600>}
box{<0,0,-0.127000><0.537924,0.035000,0.127000> rotate<0,67.501857,0> translate<26.509500,-1.535000,21.266600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.537800,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,39.116000>}
box{<0,0,-0.127000><12.451200,0.035000,0.127000> rotate<0,0.000000,0> translate<26.537800,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.582100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754000,-1.535000,28.610800>}
box{<0,0,-0.127000><0.449101,0.035000,0.127000> rotate<0,67.490502,0> translate<26.582100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,0.000000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,0.000000,11.973300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<26.609700,0.000000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,-1.535000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,-1.535000,11.973300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<26.609700,-1.535000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,0.000000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,0.000000,15.464600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<26.609700,0.000000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.609700,-1.535000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,-1.535000,15.464600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<26.609700,-1.535000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.611000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.897000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.611000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670900,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.857800,0.000000,42.672000>}
box{<0,0,-0.127000><6.186900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.670900,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.713900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,32.258000>}
box{<0,0,-0.127000><12.275100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.713900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.715300,0.000000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.095800,0.000000,20.389100>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<26.715300,0.000000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.715300,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.095800,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,44.997030,0> translate<26.715300,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.716300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.791800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.075500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.716300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754000,-1.535000,28.610800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.925800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.449063,0.035000,0.127000> rotate<0,-67.502288,0> translate<26.754000,-1.535000,28.610800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754800,-1.535000,32.281600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.535300,-1.535000,33.062100>}
box{<0,0,-0.127000><1.103794,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.754800,-1.535000,32.281600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.754800,-1.535000,38.990700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.535300,-1.535000,38.210200>}
box{<0,0,-0.127000><1.103794,0.035000,0.127000> rotate<0,44.997030,0> translate<26.754800,-1.535000,38.990700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.883500,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,38.862000>}
box{<0,0,-0.127000><12.105500,0.035000,0.127000> rotate<0,0.000000,0> translate<26.883500,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.925800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.290200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.925800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.931400,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.031100,0.000000,42.418000>}
box{<0,0,-0.127000><6.099700,0.035000,0.127000> rotate<0,0.000000,0> translate<26.931400,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,0.000000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,0.000000,11.444000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<26.984000,0.000000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,-1.535000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,-1.535000,11.444000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<26.984000,-1.535000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,0.000000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,0.000000,15.993900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.984000,0.000000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.984000,-1.535000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,-1.535000,15.993900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.984000,-1.535000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.985200,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,32.512000>}
box{<0,0,-0.127000><12.003800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.985200,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.095800,0.000000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.592900,0.000000,20.183200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<27.095800,0.000000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.095800,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.592900,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,22.497968,0> translate<27.095800,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.137500,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,38.608000>}
box{<0,0,-0.127000><11.851500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.137500,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.158400,-1.535000,29.692600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.406600,-1.535000,29.444400>}
box{<0,0,-0.127000><0.351008,0.035000,0.127000> rotate<0,44.997030,0> translate<27.158400,-1.535000,29.692600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.191800,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.204300,0.000000,42.164000>}
box{<0,0,-0.127000><6.012500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.191800,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.239200,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,32.766000>}
box{<0,0,-0.127000><11.749800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.239200,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.290200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.406600,-1.535000,29.438300>}
box{<0,0,-0.127000><0.125985,0.035000,0.127000> rotate<0,-22.492440,0> translate<27.290200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.391500,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,38.354000>}
box{<0,0,-0.127000><11.597500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.391500,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.406600,-1.535000,29.444400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.406600,-1.535000,29.438300>}
box{<0,0,-0.127000><0.006100,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.406600,-1.535000,29.438300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.452300,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.377500,0.000000,41.910000>}
box{<0,0,-0.127000><5.925200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.452300,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.493200,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,33.020000>}
box{<0,0,-0.127000><11.495800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.493200,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,0.000000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,0.000000,11.069700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<27.513300,0.000000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,-1.535000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,-1.535000,11.069700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<27.513300,-1.535000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,0.000000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,0.000000,16.368200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<27.513300,0.000000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.513300,-1.535000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,-1.535000,16.368200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<27.513300,-1.535000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.535300,-1.535000,33.062100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.087200,-1.535000,34.018000>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,-59.995551,0> translate<27.535300,-1.535000,33.062100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.535300,-1.535000,38.210200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.087200,-1.535000,37.254300>}
box{<0,0,-0.127000><1.103784,0.035000,0.127000> rotate<0,59.995551,0> translate<27.535300,-1.535000,38.210200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.592900,0.000000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.131000,0.000000,20.183200>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.592900,0.000000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.592900,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.131000,-1.535000,20.183200>}
box{<0,0,-0.127000><0.538100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.592900,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.599000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,38.100000>}
box{<0,0,-0.127000><11.390000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.599000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.657600,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,33.274000>}
box{<0,0,-0.127000><11.331400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.657600,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.712700,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.629300,0.000000,41.656000>}
box{<0,0,-0.127000><5.916600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.712700,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.745600,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,37.846000>}
box{<0,0,-0.127000><11.243400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.745600,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.804200,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,33.528000>}
box{<0,0,-0.127000><11.184800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.804200,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.892300,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,37.592000>}
box{<0,0,-0.127000><11.096700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.892300,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.950900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,33.782000>}
box{<0,0,-0.127000><11.038100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.950900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.973200,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.947700,0.000000,41.402000>}
box{<0,0,-0.127000><5.974500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.973200,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.038900,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,37.338000>}
box{<0,0,-0.127000><10.950100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.038900,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.087200,-1.535000,34.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,35.084200>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,-74.994420,0> translate<28.087200,-1.535000,34.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.087200,-1.535000,37.254300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,36.188100>}
box{<0,0,-0.127000><1.103815,0.035000,0.127000> rotate<0,74.994420,0> translate<28.087200,-1.535000,37.254300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.092000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,34.036000>}
box{<0,0,-0.127000><10.897000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.092000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.131000,0.000000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628100,0.000000,20.389100>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<28.131000,0.000000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.131000,-1.535000,20.183200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628100,-1.535000,20.389100>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-22.497968,0> translate<28.131000,-1.535000,20.183200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.132900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,37.084000>}
box{<0,0,-0.127000><10.856100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.132900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.160000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,34.290000>}
box{<0,0,-0.127000><10.829000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.160000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,0.000000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,0.000000,10.876000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<28.161600,0.000000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,-1.535000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,-1.535000,10.876000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<28.161600,-1.535000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,0.000000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,0.000000,16.561900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<28.161600,0.000000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.161600,-1.535000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,-1.535000,16.561900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<28.161600,-1.535000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.200900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,36.830000>}
box{<0,0,-0.127000><10.788100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.200900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.228100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,34.544000>}
box{<0,0,-0.127000><10.760900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.228100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.233700,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.266200,0.000000,41.148000>}
box{<0,0,-0.127000><6.032500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.233700,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.269000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,36.576000>}
box{<0,0,-0.127000><10.720000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.269000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.296200,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,34.798000>}
box{<0,0,-0.127000><10.692800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.296200,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.337100,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,36.322000>}
box{<0,0,-0.127000><10.651900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.337100,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.345700,0.000000,41.038700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.349800,0.000000,41.037000>}
box{<0,0,-0.127000><0.004438,0.035000,0.127000> rotate<0,22.519079,0> translate<28.345700,0.000000,41.038700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.349800,0.000000,41.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.442000,0.000000,40.944700>}
box{<0,0,-0.127000><0.130461,0.035000,0.127000> rotate<0,45.028083,0> translate<28.349800,0.000000,41.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.364200,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,35.052000>}
box{<0,0,-0.127000><10.624800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.364200,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,35.084200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,36.188100>}
box{<0,0,-0.127000><1.103900,0.035000,0.127000> rotate<0,90.000000,0> translate<28.372900,-1.535000,36.188100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,35.306000>}
box{<0,0,-0.127000><10.616100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.372900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,35.560000>}
box{<0,0,-0.127000><10.616100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.372900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,35.814000>}
box{<0,0,-0.127000><10.616100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.372900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.372900,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,36.068000>}
box{<0,0,-0.127000><10.616100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.372900,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.442000,0.000000,40.944700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.530800,0.000000,40.858200>}
box{<0,0,-0.127000><0.123966,0.035000,0.127000> rotate<0,44.245381,0> translate<28.442000,0.000000,40.944700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.461200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.320000>}
box{<0,0,-0.127000><8.213000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.461200,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.461200,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,20.320000>}
box{<0,0,-0.127000><10.527800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.461200,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.494100,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.740700,0.000000,40.894000>}
box{<0,0,-0.127000><6.246600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.494100,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.530800,0.000000,40.858200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.532400,0.000000,40.854300>}
box{<0,0,-0.127000><0.004215,0.035000,0.127000> rotate<0,67.689327,0> translate<28.530800,0.000000,40.858200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.532400,0.000000,40.854300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.535600,0.000000,40.851200>}
box{<0,0,-0.127000><0.004455,0.035000,0.127000> rotate<0,44.087710,0> translate<28.532400,0.000000,40.854300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.535600,0.000000,40.851200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.584900,0.000000,40.732100>}
box{<0,0,-0.127000><0.128900,0.035000,0.127000> rotate<0,67.509029,0> translate<28.535600,0.000000,40.851200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.584900,0.000000,40.732100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634400,0.000000,40.616800>}
box{<0,0,-0.127000><0.125476,0.035000,0.127000> rotate<0,66.761028,0> translate<28.584900,0.000000,40.732100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.624500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.446600,0.000000,40.640000>}
box{<0,0,-0.127000><3.822100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.624500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628100,0.000000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,0.000000,20.769600>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.628100,0.000000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628100,-1.535000,20.389100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,-1.535000,20.769600>}
box{<0,0,-0.127000><0.538108,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.628100,-1.535000,20.389100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634400,0.000000,40.612400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634400,0.000000,40.616800>}
box{<0,0,-0.127000><0.004400,0.035000,0.127000> rotate<0,90.000000,0> translate<28.634400,0.000000,40.616800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634400,0.000000,40.612400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.608500>}
box{<0,0,-0.127000><0.004254,0.035000,0.127000> rotate<0,66.443351,0> translate<28.634400,0.000000,40.612400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,38.674500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.350100>}
box{<0,0,-0.127000><1.675600,0.035000,0.127000> rotate<0,90.000000,0> translate<28.636100,0.000000,40.350100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,38.674500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.911700,0.000000,38.674500>}
box{<0,0,-0.127000><0.275600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,38.674500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.562100,0.000000,38.862000>}
box{<0,0,-0.127000><1.926000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.816100,0.000000,39.116000>}
box{<0,0,-0.127000><2.180000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.070100,0.000000,39.370000>}
box{<0,0,-0.127000><2.434000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.324100,0.000000,39.624000>}
box{<0,0,-0.127000><2.688000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.578100,0.000000,39.878000>}
box{<0,0,-0.127000><2.942000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.832100,0.000000,40.132000>}
box{<0,0,-0.127000><3.196000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.636100,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.350100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.637700,0.000000,40.354100>}
box{<0,0,-0.127000><0.004308,0.035000,0.127000> rotate<0,-68.194090,0> translate<28.636100,0.000000,40.350100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.481600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.608500>}
box{<0,0,-0.127000><0.126900,0.035000,0.127000> rotate<0,90.000000,0> translate<28.636100,0.000000,40.608500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.636100,0.000000,40.481600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.637700,0.000000,40.354100>}
box{<0,0,-0.127000><0.127510,0.035000,0.127000> rotate<0,89.275140,0> translate<28.636100,0.000000,40.481600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.637300,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.086100,0.000000,40.386000>}
box{<0,0,-0.127000><3.448800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.637300,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.717200,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,-1.535000,23.940300>}
box{<0,0,-0.127000><0.412031,0.035000,0.127000> rotate<0,44.987198,0> translate<28.717200,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.717200,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500300,-1.535000,24.231600>}
box{<0,0,-0.127000><2.783100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.717200,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.813000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.574000>}
box{<0,0,-0.127000><7.861200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.813000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.813000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,20.574000>}
box{<0,0,-0.127000><10.176000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.813000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.818900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.723800,-1.535000,24.130000>}
box{<0,0,-0.127000><3.904900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.818900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,0.000000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,0.000000,10.876000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.884600,0.000000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,-1.535000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,-1.535000,10.876000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.884600,-1.535000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,0.000000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,0.000000,16.561900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.884600,0.000000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.884600,-1.535000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,-1.535000,16.561900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<28.884600,-1.535000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.911700,0.000000,38.674500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.014700,0.000000,38.571500>}
box{<0,0,-0.127000><0.145664,0.035000,0.127000> rotate<0,44.997030,0> translate<28.911700,0.000000,38.674500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.971200,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,0.000000,23.940300>}
box{<0,0,-0.127000><0.052821,0.035000,0.127000> rotate<0,44.920334,0> translate<28.971200,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.971200,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.332600,0.000000,23.977600>}
box{<0,0,-0.127000><0.361400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.971200,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.978200,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.308100,0.000000,38.608000>}
box{<0,0,-0.127000><1.329900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.978200,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,0.000000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,21.266700>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-67.496092,0> translate<29.008600,0.000000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,-1.535000,20.769600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,21.266700>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,-67.496092,0> translate<29.008600,-1.535000,20.769600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,0.000000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,23.443200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,67.496092,0> translate<29.008600,0.000000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.008600,-1.535000,23.940300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,23.443200>}
box{<0,0,-0.127000><0.538055,0.035000,0.127000> rotate<0,67.496092,0> translate<29.008600,-1.535000,23.940300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.014700,0.000000,38.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.271600,0.000000,38.571500>}
box{<0,0,-0.127000><1.256900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.014700,0.000000,38.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.032700,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.828000>}
box{<0,0,-0.127000><7.641500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.032700,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.032700,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,20.828000>}
box{<0,0,-0.127000><9.956300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.032700,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.035300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.469800,-1.535000,23.876000>}
box{<0,0,-0.127000><3.434500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.035300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.035300,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,23.876000>}
box{<0,0,-0.127000><7.718500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.035300,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.137900,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.441900,0.000000,21.082000>}
box{<0,0,-0.127000><3.304000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.137900,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.137900,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,21.082000>}
box{<0,0,-0.127000><9.851100,0.035000,0.127000> rotate<0,0.000000,0> translate<29.137900,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.140500,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.215800,-1.535000,23.622000>}
box{<0,0,-0.127000><3.075300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.140500,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.140500,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,23.622000>}
box{<0,0,-0.127000><7.613300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.140500,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.205600,-1.535000,32.029300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.468300,-1.535000,32.029300>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.205600,-1.535000,32.029300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,21.266700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,21.513800>}
box{<0,0,-0.127000><0.247100,0.035000,0.127000> rotate<0,90.000000,0> translate<29.214500,-1.535000,21.513800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,21.266700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,23.443200>}
box{<0,0,-0.127000><2.176500,0.035000,0.127000> rotate<0,90.000000,0> translate<29.214500,0.000000,23.443200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,21.336000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,21.336000>}
box{<0,0,-0.127000><9.774500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,21.513800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.297700,-1.535000,21.513800>}
box{<0,0,-0.127000><3.083200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,-1.535000,21.513800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,21.590000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,21.844000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.098000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785000,0.000000,22.352000>}
box{<0,0,-0.127000><4.570500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.606000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.860000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,23.114000>}
box{<0,0,-0.127000><3.016900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,23.190100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,23.443200>}
box{<0,0,-0.127000><0.253100,0.035000,0.127000> rotate<0,90.000000,0> translate<29.214500,-1.535000,23.443200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,23.190100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.783800,-1.535000,23.190100>}
box{<0,0,-0.127000><2.569300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,-1.535000,23.190100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961800,-1.535000,23.368000>}
box{<0,0,-0.127000><2.747300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.214500,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.391200,0.000000,23.368000>}
box{<0,0,-0.127000><3.176700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.214500,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.332600,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.595300,0.000000,23.977600>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,0.000000,0> translate<29.332600,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.468300,-1.535000,32.029300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.711000,-1.535000,31.928800>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,22.492544,0> translate<29.468300,-1.535000,32.029300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.529400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,32.004000>}
box{<0,0,-0.127000><9.459600,0.035000,0.127000> rotate<0,0.000000,0> translate<29.529400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.595300,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.838000,0.000000,24.078100>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-22.492544,0> translate<29.595300,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,0.000000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,0.000000,11.069700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<29.633300,0.000000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,-1.535000,10.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,-1.535000,11.069700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<29.633300,-1.535000,10.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,0.000000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,0.000000,16.368200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<29.633300,0.000000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.633300,-1.535000,16.561900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,-1.535000,16.368200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<29.633300,-1.535000,16.561900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.711000,-1.535000,31.928800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.854000,-1.535000,30.785800>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<29.711000,-1.535000,31.928800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.804900,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.031100,0.000000,10.922000>}
box{<0,0,-0.127000><3.226200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.804900,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.804900,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.031100,-1.535000,10.922000>}
box{<0,0,-0.127000><3.226200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.804900,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.827100,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.098400,0.000000,16.510000>}
box{<0,0,-0.127000><4.271300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.827100,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.827100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.098400,-1.535000,16.510000>}
box{<0,0,-0.127000><4.271300,0.035000,0.127000> rotate<0,0.000000,0> translate<29.827100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.838000,0.000000,24.078100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.981000,0.000000,25.221100>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.838000,0.000000,24.078100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.889800,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,31.750000>}
box{<0,0,-0.127000><9.099200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.889800,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.889900,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,24.130000>}
box{<0,0,-0.127000><6.863900,0.035000,0.127000> rotate<0,0.000000,0> translate<29.889900,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.143800,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,31.496000>}
box{<0,0,-0.127000><8.845200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.143800,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.143900,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,24.384000>}
box{<0,0,-0.127000><6.609900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.143900,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.271600,0.000000,38.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.079100,0.000000,40.379000>}
box{<0,0,-0.127000><2.556191,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.271600,0.000000,38.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,0.000000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,0.000000,11.444000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<30.356300,0.000000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,-1.535000,11.069700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,-1.535000,11.444000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<30.356300,-1.535000,11.069700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,0.000000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,0.000000,15.993900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<30.356300,0.000000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.356300,-1.535000,16.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,-1.535000,15.993900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<30.356300,-1.535000,16.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.397800,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826400,-1.535000,31.242000>}
box{<0,0,-0.127000><1.428600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.397800,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.397900,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,24.638000>}
box{<0,0,-0.127000><6.355900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.397900,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.540400,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.857900,0.000000,11.176000>}
box{<0,0,-0.127000><2.317500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.540400,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.540400,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.857900,-1.535000,11.176000>}
box{<0,0,-0.127000><2.317500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.540400,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.550700,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.779900,0.000000,16.256000>}
box{<0,0,-0.127000><3.229200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.550700,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.550700,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.779900,-1.535000,16.256000>}
box{<0,0,-0.127000><3.229200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.550700,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.648100,0.000000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.821700,0.000000,29.587300>}
box{<0,0,-0.127000><0.173600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.648100,0.000000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.648100,0.000000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,0.000000,30.210600>}
box{<0,0,-0.127000><0.881479,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.648100,0.000000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.651800,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.497800,-1.535000,30.988000>}
box{<0,0,-0.127000><0.846000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.651800,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.651900,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,24.892000>}
box{<0,0,-0.127000><6.101900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.651900,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.778800,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.497700,0.000000,29.718000>}
box{<0,0,-0.127000><0.718900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.778800,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.821700,0.000000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.297700,0.000000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<30.821700,0.000000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.854000,-1.535000,30.785800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.039800,-1.535000,30.600000>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,44.997030,0> translate<30.854000,-1.535000,30.785800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.905800,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.348000,-1.535000,30.734000>}
box{<0,0,-0.127000><0.442200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.905800,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.905900,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,25.146000>}
box{<0,0,-0.127000><5.847900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.905900,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.980300,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.722200,0.000000,11.430000>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.980300,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.980300,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.722200,-1.535000,11.430000>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.980300,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.981000,0.000000,25.221100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.166800,0.000000,25.406900>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.981000,0.000000,25.221100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.990600,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.461400,0.000000,16.002000>}
box{<0,0,-0.127000><2.470800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.990600,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.990600,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.461400,-1.535000,16.002000>}
box{<0,0,-0.127000><2.470800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.990600,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,0.000000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,0.000000,11.973300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.004600,0.000000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,-1.535000,11.444000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,-1.535000,11.973300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.004600,-1.535000,11.444000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,0.000000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,0.000000,15.464600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<31.004600,0.000000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.004600,-1.535000,15.993900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,-1.535000,15.464600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<31.004600,-1.535000,15.993900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.032800,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.347900,0.000000,29.972000>}
box{<0,0,-0.127000><0.315100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.032800,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.039800,-1.535000,30.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,30.357300>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,67.501516,0> translate<31.039800,-1.535000,30.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.089500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.480000>}
box{<0,0,-0.127000><0.181900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.089500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.119400,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.826000,0.000000,29.464000>}
box{<0,0,-0.127000><0.706600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.119400,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,29.455300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,30.357300>}
box{<0,0,-0.127000><0.902000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.140300,-1.535000,30.357300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,29.455300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,-1.535000,29.444700>}
box{<0,0,-0.127000><0.027615,0.035000,0.127000> rotate<0,22.570496,0> translate<31.140300,-1.535000,29.455300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,-1.535000,29.464000>}
box{<0,0,-0.127000><0.025500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.140300,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.237700,-1.535000,29.718000>}
box{<0,0,-0.127000><0.097400,0.035000,0.127000> rotate<0,0.000000,0> translate<31.140300,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.347900,-1.535000,29.972000>}
box{<0,0,-0.127000><0.207600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.140300,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.140300,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.226000>}
box{<0,0,-0.127000><0.131100,0.035000,0.127000> rotate<0,0.000000,0> translate<31.140300,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.159900,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,25.400000>}
box{<0,0,-0.127000><5.593900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.159900,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,-1.535000,29.544500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,-1.535000,29.444700>}
box{<0,0,-0.127000><0.099800,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.165800,-1.535000,29.444700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,-1.535000,29.544500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.266300,-1.535000,29.787200>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<31.165800,-1.535000,29.544500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.166800,0.000000,25.406900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.267300,0.000000,25.649600>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<31.166800,0.000000,25.406900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.244600,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.643800,0.000000,11.684000>}
box{<0,0,-0.127000><1.399200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.244600,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.244600,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.643800,-1.535000,11.684000>}
box{<0,0,-0.127000><1.399200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.244600,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250500,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.286300,0.000000,15.748000>}
box{<0,0,-0.127000><2.035800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.250500,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250500,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.286300,-1.535000,15.748000>}
box{<0,0,-0.127000><2.035800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.250500,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.266300,-1.535000,29.787200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.378200,-1.535000,29.899000>}
box{<0,0,-0.127000><0.158180,0.035000,0.127000> rotate<0,-44.971419,0> translate<31.266300,-1.535000,29.787200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.267300,0.000000,25.649600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.267300,0.000000,25.657200>}
box{<0,0,-0.127000><0.007600,0.035000,0.127000> rotate<0,90.000000,0> translate<31.267300,0.000000,25.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.267300,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.806500,0.000000,25.654000>}
box{<0,0,-0.127000><1.539200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.267300,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.267300,0.000000,25.657200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.297700,0.000000,25.669800>}
box{<0,0,-0.127000><0.032908,0.035000,0.127000> rotate<0,-22.511234,0> translate<31.267300,0.000000,25.657200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.156700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.378200,-1.535000,29.899000>}
box{<0,0,-0.127000><0.278954,0.035000,0.127000> rotate<0,67.484698,0> translate<31.271400,-1.535000,30.156700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,0.000000,30.156700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.421600,0.000000,29.794100>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<31.271400,0.000000,30.156700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,0.000000,30.210600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,0.000000,30.156700>}
box{<0,0,-0.127000><0.053900,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.271400,0.000000,30.156700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.549200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.156700>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.271400,-1.535000,30.156700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.271400,-1.535000,30.549200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.421600,-1.535000,30.911800>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<31.271400,-1.535000,30.549200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.297700,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.662100,0.000000,26.034200>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.297700,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.297700,0.000000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.662100,0.000000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<31.297700,0.000000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.309900,0.000000,35.282800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.563800,0.000000,34.029000>}
box{<0,0,-0.127000><1.773212,0.035000,0.127000> rotate<0,44.994746,0> translate<31.309900,0.000000,35.282800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.309900,0.000000,35.282800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.249300,0.000000,35.282800>}
box{<0,0,-0.127000><2.939400,0.035000,0.127000> rotate<0,0.000000,0> translate<31.309900,0.000000,35.282800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.421600,0.000000,29.794100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.699100,0.000000,29.516600>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<31.421600,0.000000,29.794100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.421600,-1.535000,30.911800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.699100,-1.535000,31.189300>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.421600,-1.535000,30.911800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.477800,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.405600,0.000000,29.210000>}
box{<0,0,-0.127000><0.927800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.477800,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.498600,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.565500,0.000000,11.938000>}
box{<0,0,-0.127000><1.066900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.498600,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.498600,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.565500,-1.535000,11.938000>}
box{<0,0,-0.127000><1.066900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.498600,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500300,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.743000,-1.535000,24.332100>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-22.492544,0> translate<31.500300,-1.535000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.504500,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.113100,0.000000,15.494000>}
box{<0,0,-0.127000><1.608600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.504500,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.504500,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.113100,-1.535000,15.494000>}
box{<0,0,-0.127000><1.608600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.504500,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.517300,0.000000,37.949500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.912500,0.000000,39.344600>}
box{<0,0,-0.127000><1.973040,0.035000,0.127000> rotate<0,-44.994977,0> translate<31.517300,0.000000,37.949500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.517300,0.000000,37.949500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.249300,0.000000,37.949500>}
box{<0,0,-0.127000><2.732000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.517300,0.000000,37.949500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,0.000000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,0.000000,12.621600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<31.533900,0.000000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,-1.535000,11.973300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,-1.535000,12.621600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<31.533900,-1.535000,11.973300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,0.000000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,0.000000,14.816300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<31.533900,0.000000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.533900,-1.535000,15.464600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,-1.535000,14.816300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<31.533900,-1.535000,15.464600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.535900,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.347500,0.000000,25.908000>}
box{<0,0,-0.127000><0.811600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.535900,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.540800,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,35.052000>}
box{<0,0,-0.127000><6.406800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.540800,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.660100,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.487100,0.000000,12.192000>}
box{<0,0,-0.127000><0.827000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.660100,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.660100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.487100,-1.535000,12.192000>}
box{<0,0,-0.127000><0.827000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.660100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.662100,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,26.510200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<31.662100,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.662100,0.000000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,28.549700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<31.662100,0.000000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.663600,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.939800,0.000000,15.240000>}
box{<0,0,-0.127000><1.276200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.663600,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.663600,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.939800,-1.535000,15.240000>}
box{<0,0,-0.127000><1.276200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.663600,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.667800,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,38.100000>}
box{<0,0,-0.127000><6.279800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.667800,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.691000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.151600,0.000000,28.956000>}
box{<0,0,-0.127000><0.460600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.691000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.699100,0.000000,29.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.061700,0.000000,29.366400>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<31.699100,0.000000,29.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.699100,-1.535000,31.189300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.061700,-1.535000,31.339500>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<31.699100,-1.535000,31.189300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.715000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.117800,0.000000,26.162000>}
box{<0,0,-0.127000><0.402800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.715000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.743000,-1.535000,24.332100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.928800,-1.535000,24.517900>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.743000,-1.535000,24.332100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.783800,-1.535000,23.190100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.586900,-1.535000,25.993100>}
box{<0,0,-0.127000><3.964111,0.035000,0.127000> rotate<0,-44.996008,0> translate<31.783800,-1.535000,23.190100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.794800,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,34.798000>}
box{<0,0,-0.127000><6.152800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.794800,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.794900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977800,-1.535000,24.384000>}
box{<0,0,-0.127000><1.182900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.794900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.796300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.036700,0.000000,28.702000>}
box{<0,0,-0.127000><0.240400,0.035000,0.127000> rotate<0,0.000000,0> translate<31.796300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.806800,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.408800,0.000000,12.446000>}
box{<0,0,-0.127000><0.602000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.806800,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.806800,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.408800,-1.535000,12.446000>}
box{<0,0,-0.127000><0.602000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.806800,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.810300,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766600,0.000000,14.986000>}
box{<0,0,-0.127000><0.956300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.810300,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.810300,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766600,-1.535000,14.986000>}
box{<0,0,-0.127000><0.956300,0.035000,0.127000> rotate<0,0.000000,0> translate<31.810300,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.820200,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.012600,0.000000,26.416000>}
box{<0,0,-0.127000><0.192400,0.035000,0.127000> rotate<0,0.000000,0> translate<31.820200,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,28.549700>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,90.000000,0> translate<31.859300,0.000000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,26.670000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,26.924000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.178000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.976500,0.000000,27.432000>}
box{<0,0,-0.127000><1.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.686000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.940000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,28.194000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.859300,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,28.448000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.859300,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,0.000000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,13.344600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<31.908200,0.000000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,-1.535000,12.621600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,13.344600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<31.908200,-1.535000,12.621600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,0.000000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,14.093300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<31.908200,0.000000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.908200,-1.535000,14.816300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,14.093300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<31.908200,-1.535000,14.816300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.921800,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.928000,0.000000,38.354000>}
box{<0,0,-0.127000><6.006200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.921800,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.928800,-1.535000,24.517900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.386000,-1.535000,24.975100>}
box{<0,0,-0.127000><0.646578,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.928800,-1.535000,24.517900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.929200,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.700000>}
box{<0,0,-0.127000><0.455800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.929200,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.929200,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.700000>}
box{<0,0,-0.127000><0.455800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.929200,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.930800,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.681000,0.000000,14.732000>}
box{<0,0,-0.127000><0.750200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.930800,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.930800,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.681000,-1.535000,14.732000>}
box{<0,0,-0.127000><0.750200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.930800,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,26.540600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.135000,0.000000,26.120500>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,67.496839,0> translate<31.961000,0.000000,26.540600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,26.540600>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.961000,0.000000,26.540600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.976500,0.000000,27.403000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.961000,0.000000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.976500,0.000000,27.656800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.961000,0.000000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,28.519300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,27.656800>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.961000,0.000000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.961000,0.000000,28.519300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.135000,0.000000,28.939400>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-67.496839,0> translate<31.961000,0.000000,28.519300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.997200,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.954000>}
box{<0,0,-0.127000><0.387800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.997200,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.997200,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.954000>}
box{<0,0,-0.127000><0.387800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.997200,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.998900,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.602600,0.000000,14.478000>}
box{<0,0,-0.127000><0.603700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.998900,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.998900,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.602600,-1.535000,14.478000>}
box{<0,0,-0.127000><0.603700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.998900,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.048800,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,34.544000>}
box{<0,0,-0.127000><5.898800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.048800,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.048900,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231800,-1.535000,24.638000>}
box{<0,0,-0.127000><1.182900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.048900,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.061700,0.000000,29.366400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454200,0.000000,29.366400>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.061700,0.000000,29.366400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.061700,-1.535000,31.339500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454200,-1.535000,31.339500>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.061700,-1.535000,31.339500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.065300,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.208000>}
box{<0,0,-0.127000><0.319700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.065300,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.065300,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.208000>}
box{<0,0,-0.127000><0.319700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.065300,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.066900,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.524300,0.000000,14.224000>}
box{<0,0,-0.127000><0.457400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.066900,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.066900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.524300,-1.535000,14.224000>}
box{<0,0,-0.127000><0.457400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.066900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.079100,0.000000,40.379000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.264900,0.000000,40.564800>}
box{<0,0,-0.127000><0.262761,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.079100,0.000000,40.379000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,14.093300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<32.101900,0.000000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,13.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,14.093300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<32.101900,-1.535000,14.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.462000>}
box{<0,0,-0.127000><0.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.462000>}
box{<0,0,-0.127000><0.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.716000>}
box{<0,0,-0.127000><0.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.716000>}
box{<0,0,-0.127000><0.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.445900,0.000000,13.970000>}
box{<0,0,-0.127000><0.344000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.101900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.445900,-1.535000,13.970000>}
box{<0,0,-0.127000><0.344000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.101900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.135000,0.000000,26.120500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.456500,0.000000,25.799000>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<32.135000,0.000000,26.120500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.135000,0.000000,28.939400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.456500,0.000000,29.260900>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.135000,0.000000,28.939400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.175800,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.674000,0.000000,38.608000>}
box{<0,0,-0.127000><5.498200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.175800,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,21.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454500,0.000000,21.069400>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<32.231400,0.000000,21.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.123500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,21.292500>}
box{<0,0,-0.127000><0.831000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.231400,0.000000,21.292500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.123500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785000,0.000000,22.123500>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.231400,0.000000,22.123500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.377100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785000,0.000000,22.377100>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.231400,0.000000,22.377100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,23.208200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,22.377100>}
box{<0,0,-0.127000><0.831100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.231400,0.000000,22.377100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.231400,0.000000,23.208200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454500,0.000000,23.431300>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.231400,0.000000,23.208200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.264900,0.000000,40.564800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.507600,0.000000,40.665300>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-22.492544,0> translate<32.264900,0.000000,40.564800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.297700,-1.535000,21.513800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.605700,-1.535000,21.641400>}
box{<0,0,-0.127000><0.333385,0.035000,0.127000> rotate<0,-22.502043,0> translate<32.297700,-1.535000,21.513800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.302800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,34.290000>}
box{<0,0,-0.127000><5.644800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.302800,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.302900,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.485800,-1.535000,24.892000>}
box{<0,0,-0.127000><1.182900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.302900,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.523300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,11.329600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<32.385000,0.000000,12.523300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.523300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,11.329600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<32.385000,-1.535000,12.523300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.523400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.523300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,12.523300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.523400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.523300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,12.523300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.772500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,12.523400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,12.523400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.772500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,12.523400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,12.523400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.772600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.772500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,13.772500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.772600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.772500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,13.772500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,13.772600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,14.966300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<32.385000,0.000000,13.772600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,13.772600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,14.966300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<32.385000,-1.535000,13.772600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.019300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,42.825600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<32.385000,0.000000,44.019300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.019300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,42.825600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<32.385000,-1.535000,44.019300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.019400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.019300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,44.019300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.019400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.019300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,44.019300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,45.268500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,44.019400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,44.019400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,45.268500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,44.019400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,44.019400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,45.268600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,45.268500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,0.000000,45.268500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,45.268600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,45.268500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,45.268500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,45.268600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,46.462300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<32.385000,0.000000,45.268600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,45.268600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,46.462300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<32.385000,-1.535000,45.268600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.386000,-1.535000,24.975100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.217800>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,-67.501516,0> translate<32.386000,-1.535000,24.975100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.429800,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.420000,0.000000,38.862000>}
box{<0,0,-0.127000><4.990200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.429800,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454200,0.000000,29.366400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.816800,0.000000,29.516600>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-22.499346,0> translate<32.454200,0.000000,29.366400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454200,-1.535000,31.339500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.816800,-1.535000,31.189300>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,22.499346,0> translate<32.454200,-1.535000,31.339500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454500,0.000000,21.069400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.069400>}
box{<0,0,-0.127000><1.331000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.454500,0.000000,21.069400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.454500,0.000000,23.431300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,23.431300>}
box{<0,0,-0.127000><1.331000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.454500,0.000000,23.431300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.456500,0.000000,25.799000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,0.000000,25.625000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<32.456500,0.000000,25.799000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.456500,0.000000,29.260900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,0.000000,29.434900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<32.456500,0.000000,29.260900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.456700,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.739800,-1.535000,25.146000>}
box{<0,0,-0.127000><1.283100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.456700,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.481600,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,21.590000>}
box{<0,0,-0.127000><6.507400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.481600,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.217800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.480500>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,90.000000,0> translate<32.486500,-1.535000,25.480500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.993800,-1.535000,25.400000>}
box{<0,0,-0.127000><1.507300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.486500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.480500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.786600>}
box{<0,0,-0.127000><0.306100,0.035000,0.127000> rotate<0,90.000000,0> translate<32.486500,-1.535000,25.786600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.806500,-1.535000,25.654000>}
box{<0,0,-0.127000><0.320000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.486500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486500,-1.535000,25.786600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,-1.535000,25.625000>}
box{<0,0,-0.127000><0.422247,0.035000,0.127000> rotate<0,22.500432,0> translate<32.486500,-1.535000,25.786600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.507600,0.000000,40.665300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.323600,0.000000,40.665300>}
box{<0,0,-0.127000><2.816000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.507600,0.000000,40.665300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.556800,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,34.036000>}
box{<0,0,-0.127000><5.390800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.556800,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.563800,0.000000,34.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.786300>}
box{<0,0,-0.127000><0.262685,0.035000,0.127000> rotate<0,67.501516,0> translate<32.563800,0.000000,34.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.605700,-1.535000,21.641400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.841500,-1.535000,21.877200>}
box{<0,0,-0.127000><0.333472,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.605700,-1.535000,21.641400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.129900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.523600>}
box{<0,0,-0.127000><0.393700,0.035000,0.127000> rotate<0,90.000000,0> translate<32.664300,0.000000,33.523600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.129900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.710800,0.000000,33.176500>}
box{<0,0,-0.127000><0.065832,0.035000,0.127000> rotate<0,-45.058568,0> translate<32.664300,0.000000,33.129900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,33.274000>}
box{<0,0,-0.127000><5.283300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664300,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.523600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.786300>}
box{<0,0,-0.127000><0.262700,0.035000,0.127000> rotate<0,90.000000,0> translate<32.664300,0.000000,33.786300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,33.528000>}
box{<0,0,-0.127000><5.283300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664300,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664300,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,33.782000>}
box{<0,0,-0.127000><5.283300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664300,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.683800,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.166000,0.000000,39.116000>}
box{<0,0,-0.127000><4.482200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.683800,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689600,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,31.242000>}
box{<0,0,-0.127000><6.299400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.689600,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.689800,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.088600,0.000000,29.464000>}
box{<0,0,-0.127000><2.398800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.689800,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.710800,0.000000,33.176500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.452700,0.000000,33.176500>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.710800,0.000000,33.176500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.714600,-1.535000,29.367700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.817800,-1.535000,29.470900>}
box{<0,0,-0.127000><0.145947,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.714600,-1.535000,29.367700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.714600,-1.535000,29.367700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,-1.535000,29.434900>}
box{<0,0,-0.127000><0.175385,0.035000,0.127000> rotate<0,-22.527911,0> translate<32.714600,-1.535000,29.367700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,11.329500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.117900,0.000000,10.794900>}
box{<0,0,-0.127000><0.647150,0.035000,0.127000> rotate<0,55.694817,0> translate<32.753200,0.000000,11.329500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,11.329500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.117900,-1.535000,10.794900>}
box{<0,0,-0.127000><0.647150,0.035000,0.127000> rotate<0,55.694817,0> translate<32.753200,-1.535000,11.329500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,11.329600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,11.329500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,0.000000,11.329500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,11.329600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,11.329500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,-1.535000,11.329500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,14.966400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,14.966300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,0.000000,14.966300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,14.966400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,14.966300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,-1.535000,14.966300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,14.966400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,15.998400>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,-55.703245,0> translate<32.753200,0.000000,14.966400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,14.966400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,15.998400>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,-55.703245,0> translate<32.753200,-1.535000,14.966400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,42.825500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,41.793500>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,55.703245,0> translate<32.753200,0.000000,42.825500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,42.825500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,41.793500>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,55.703245,0> translate<32.753200,-1.535000,42.825500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,42.825600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,42.825500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,0.000000,42.825500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,42.825600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,42.825500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,-1.535000,42.825500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,46.462400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,46.462300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,0.000000,46.462300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,46.462400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,46.462300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.753200,-1.535000,46.462300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,0.000000,46.462400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.199700,0.000000,47.117000>}
box{<0,0,-0.127000><0.792378,0.035000,0.127000> rotate<0,-55.698584,0> translate<32.753200,0.000000,46.462400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.753200,-1.535000,46.462400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.199700,-1.535000,47.117000>}
box{<0,0,-0.127000><0.792378,0.035000,0.127000> rotate<0,-55.698584,0> translate<32.753200,-1.535000,46.462400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.808300,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,21.844000>}
box{<0,0,-0.127000><6.180700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.808300,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.810900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.088600,-1.535000,29.464000>}
box{<0,0,-0.127000><2.277700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.810900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.816800,0.000000,29.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,0.000000,29.794100>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.816800,0.000000,29.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.816800,-1.535000,31.189300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,-1.535000,30.911800>}
box{<0,0,-0.127000><0.392444,0.035000,0.127000> rotate<0,44.997030,0> translate<32.816800,-1.535000,31.189300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.817800,-1.535000,29.470900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.850800,-1.535000,29.550600>}
box{<0,0,-0.127000><0.086262,0.035000,0.127000> rotate<0,-67.503412,0> translate<32.817800,-1.535000,29.470900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.841500,-1.535000,21.877200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.354500,-1.535000,25.390200>}
box{<0,0,-0.127000><4.968132,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.841500,-1.535000,21.877200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.850800,-1.535000,29.550600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,-1.535000,29.794100>}
box{<0,0,-0.127000><0.344361,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.850800,-1.535000,29.550600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,0.000000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,25.625000>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.876600,0.000000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,25.625000>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.876600,-1.535000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,0.000000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,29.434900>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.876600,0.000000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.876600,-1.535000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,29.434900>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.876600,-1.535000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.912500,0.000000,39.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.937400,0.000000,39.344600>}
box{<0,0,-0.127000><4.024900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.912500,0.000000,39.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.976500,0.000000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.976500,0.000000,27.403000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.976500,0.000000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.402500>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.977000,0.000000,27.402500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.402500>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.977000,-1.535000,27.402500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,25.654000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,25.654000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,25.908000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,26.162000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,26.416000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,26.416000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,26.670000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,26.670000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,26.924000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,26.924000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.178000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.178000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.402500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.402500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,27.402500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.402500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.402500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,27.402500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.657400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,29.434900>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.977000,0.000000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.657400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,29.434900>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.977000,-1.535000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.657400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.657400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,27.657400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.657400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.657400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,27.657400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.686000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.686000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.940000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.940000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,28.194000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,28.194000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,28.448000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,28.448000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,28.702000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,28.702000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,28.956000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,28.956000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,29.210000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.977000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,29.210000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.977000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.018100,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,30.988000>}
box{<0,0,-0.127000><5.970900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.018100,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.018200,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.643800,0.000000,29.718000>}
box{<0,0,-0.127000><3.625600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.018200,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.018200,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,29.718000>}
box{<0,0,-0.127000><5.970800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.018200,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.062300,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,22.098000>}
box{<0,0,-0.127000><5.926700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.062300,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,0.000000,29.794100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,0.000000,30.156700>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<33.094300,0.000000,29.794100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,-1.535000,29.794100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.156700>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,-67.494714,0> translate<33.094300,-1.535000,29.794100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.094300,-1.535000,30.911800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.549200>}
box{<0,0,-0.127000><0.392478,0.035000,0.127000> rotate<0,67.494714,0> translate<33.094300,-1.535000,30.911800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.167900,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.860600,0.000000,29.972000>}
box{<0,0,-0.127000><3.692700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.167900,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.167900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,29.972000>}
box{<0,0,-0.127000><5.821100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.167900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.168000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,30.734000>}
box{<0,0,-0.127000><5.821000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.168000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,0.000000,25.625000>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.230800,0.000000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,-1.535000,25.625000>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.230800,-1.535000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.402500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,25.625000>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.230800,0.000000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.402500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,25.625000>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.230800,-1.535000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,27.657400>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.230800,0.000000,27.657400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,27.657400>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.230800,-1.535000,27.657400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,0.000000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,0.000000,29.434900>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.230800,0.000000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.230800,-1.535000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,-1.535000,29.434900>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.230800,-1.535000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,0.000000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,0.000000,27.656800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<33.231400,0.000000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,-1.535000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,-1.535000,27.656800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<33.231400,-1.535000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,0.000000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.403000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,0.000000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,-1.535000,27.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.403000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,-1.535000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,27.432000>}
box{<0,0,-0.127000><1.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,27.432000>}
box{<0,0,-0.127000><1.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,0.000000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.656800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,0.000000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.231400,-1.535000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.656800>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.231400,-1.535000,27.656800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,0.000000,30.156700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,0.000000,30.405600>}
box{<0,0,-0.127000><0.248900,0.035000,0.127000> rotate<0,90.000000,0> translate<33.244500,0.000000,30.405600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.156700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.549200>}
box{<0,0,-0.127000><0.392500,0.035000,0.127000> rotate<0,90.000000,0> translate<33.244500,-1.535000,30.549200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.077400,0.000000,30.226000>}
box{<0,0,-0.127000><3.832900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.244500,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,30.226000>}
box{<0,0,-0.127000><5.744500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.244500,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,0.000000,30.405600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.448700,0.000000,30.609800>}
box{<0,0,-0.127000><0.288782,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.244500,0.000000,30.405600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,30.480000>}
box{<0,0,-0.127000><5.744500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.244500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.316300,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,22.352000>}
box{<0,0,-0.127000><5.672700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.316300,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.318900,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.294300,0.000000,30.480000>}
box{<0,0,-0.127000><3.975400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.318900,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,0.000000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,0.000000,25.799000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<33.331300,0.000000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,-1.535000,25.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,-1.535000,25.799000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<33.331300,-1.535000,25.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,0.000000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,0.000000,29.260900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<33.331300,0.000000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.331300,-1.535000,29.434900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,-1.535000,29.260900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<33.331300,-1.535000,29.434900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401300,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.247800,-1.535000,25.654000>}
box{<0,0,-0.127000><0.846500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.401300,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401300,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.948300,0.000000,25.654000>}
box{<0,0,-0.127000><1.547000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.401300,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.448700,0.000000,30.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.452700,0.000000,30.609800>}
box{<0,0,-0.127000><1.004000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.448700,0.000000,30.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,15.998500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,15.998400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.457000,0.000000,15.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,15.998500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,15.998400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.457000,-1.535000,15.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,15.998500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,0.000000,16.777400>}
box{<0,0,-0.127000><1.249173,0.035000,0.127000> rotate<0,-38.572020,0> translate<33.457000,0.000000,15.998500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,15.998500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,-1.535000,16.777400>}
box{<0,0,-0.127000><1.249173,0.035000,0.127000> rotate<0,-38.572020,0> translate<33.457000,-1.535000,15.998500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,41.793400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457100,0.000000,41.793400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.457000,0.000000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,41.793400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457100,-1.535000,41.793400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<33.457000,-1.535000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,41.793500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,0.000000,41.793400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.457000,0.000000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,41.793500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457000,-1.535000,41.793400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.457000,-1.535000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457100,0.000000,41.793400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,0.000000,41.014500>}
box{<0,0,-0.127000><1.249095,0.035000,0.127000> rotate<0,38.574880,0> translate<33.457100,0.000000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.457100,-1.535000,41.793400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,-1.535000,41.014500>}
box{<0,0,-0.127000><1.249095,0.035000,0.127000> rotate<0,38.574880,0> translate<33.457100,-1.535000,41.793400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.570300,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,22.606000>}
box{<0,0,-0.127000><5.418700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.570300,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,0.000000,25.799000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,0.000000,26.120500>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.751400,0.000000,25.799000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,-1.535000,25.799000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,-1.535000,26.120500>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.751400,-1.535000,25.799000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,0.000000,29.260900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,0.000000,28.939400>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<33.751400,0.000000,29.260900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.751400,-1.535000,29.260900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,-1.535000,28.939400>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<33.751400,-1.535000,29.260900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785000,0.000000,22.377100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785000,0.000000,22.123500>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.785000,0.000000,22.123500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.069400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.123000>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,90.000000,0> translate<33.785500,0.000000,22.123000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.082000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.336000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.590000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.844000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.098000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.123000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.123000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,22.123000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.377700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,23.431300>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,90.000000,0> translate<33.785500,0.000000,23.431300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.377700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.377700>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,22.377700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.606000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.860000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,23.114000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.785500,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,23.368000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.785500,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.802300,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.730100,0.000000,29.210000>}
box{<0,0,-0.127000><0.927800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.802300,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.802300,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.730100,-1.535000,29.210000>}
box{<0,0,-0.127000><0.927800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.802300,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.824300,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,22.860000>}
box{<0,0,-0.127000><5.164700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.824300,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,17.710300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056100,0.000000,17.487200>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<33.833000,0.000000,17.710300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.491300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,17.710300>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.833000,0.000000,17.710300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.491300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.736600,0.000000,18.491300>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.833000,0.000000,18.491300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.744900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.736600,0.000000,18.744900>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.833000,0.000000,18.744900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,19.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,18.744900>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.833000,0.000000,18.744900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.833000,0.000000,19.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056100,0.000000,19.749100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.833000,0.000000,19.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.860400,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.501800,-1.535000,25.908000>}
box{<0,0,-0.127000><0.641400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.860400,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.860400,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.672000,0.000000,25.908000>}
box{<0,0,-0.127000><0.811600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.860400,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.069400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.370200,0.000000,21.069400>}
box{<0,0,-0.127000><1.331100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.039100,0.000000,21.069400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.123000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,21.069400>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.039100,0.000000,21.069400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,23.431300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,22.377700>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.039100,0.000000,22.377700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039100,0.000000,23.431300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.370200,0.000000,23.431300>}
box{<0,0,-0.127000><1.331100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.039100,0.000000,23.431300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039700,0.000000,22.123500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039700,0.000000,22.377100>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<34.039700,0.000000,22.377100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039700,0.000000,22.123500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.123500>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.039700,0.000000,22.123500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039700,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,22.352000>}
box{<0,0,-0.127000><1.639300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.039700,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.039700,0.000000,22.377100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.377100>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.039700,0.000000,22.377100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056100,0.000000,17.487200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,17.487200>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.056100,0.000000,17.487200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056100,0.000000,19.749100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,19.749100>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.056100,0.000000,19.749100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056300,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.517000,0.000000,28.956000>}
box{<0,0,-0.127000><0.460700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.056300,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.056300,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.517000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.460700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.056300,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,0.000000,26.120500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,26.540600>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-67.496839,0> translate<34.072900,0.000000,26.120500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,-1.535000,26.120500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,26.540600>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-67.496839,0> translate<34.072900,-1.535000,26.120500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,0.000000,28.939400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,28.519300>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,67.496839,0> translate<34.072900,0.000000,28.939400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.072900,-1.535000,28.939400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,28.519300>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,67.496839,0> translate<34.072900,-1.535000,28.939400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.078300,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,23.114000>}
box{<0,0,-0.127000><4.910700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.078300,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.090000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.492800,0.000000,26.162000>}
box{<0,0,-0.127000><0.402800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.090000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.090000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.492800,-1.535000,26.162000>}
box{<0,0,-0.127000><0.402800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.090000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.171300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.411700,0.000000,28.702000>}
box{<0,0,-0.127000><0.240400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.171300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.171300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.411700,-1.535000,28.702000>}
box{<0,0,-0.127000><0.240400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.171300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.195200,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.387600,0.000000,26.416000>}
box{<0,0,-0.127000><0.192400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.195200,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.195200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.387600,-1.535000,26.416000>}
box{<0,0,-0.127000><0.192400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.195200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,26.540600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.403000>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,90.000000,0> translate<34.246900,0.000000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,26.540600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.403000>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,90.000000,0> translate<34.246900,-1.535000,27.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,26.670000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,26.670000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,26.924000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,26.924000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,27.178000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,27.178000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,28.519300>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.246900,0.000000,28.519300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.656800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,28.519300>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,90.000000,0> translate<34.246900,-1.535000,28.519300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,27.686000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,27.686000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,27.940000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,27.940000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,28.194000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,28.194000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,28.448000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.246900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,28.448000>}
box{<0,0,-0.127000><0.101700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.246900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.249300,0.000000,35.282800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,35.595200>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.249300,0.000000,35.282800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.249300,0.000000,37.949500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,37.637100>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<34.249300,0.000000,37.949500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.272500,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,35.306000>}
box{<0,0,-0.127000><3.675100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.272500,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.332300,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,23.368000>}
box{<0,0,-0.127000><4.656700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.332300,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,0.000000,26.034200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<34.348600,0.000000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,-1.535000,26.034200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<34.348600,-1.535000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,26.510200>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.348600,0.000000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,26.510200>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.348600,-1.535000,26.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,0.000000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,0.000000,29.025700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<34.348600,0.000000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.348600,-1.535000,28.549700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<34.348600,-1.535000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.352800,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,37.846000>}
box{<0,0,-0.127000><3.594800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.352800,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,0.000000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,0.000000,16.777400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.433600,0.000000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,-1.535000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,-1.535000,16.777400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.433600,-1.535000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,0.000000,41.014500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,0.000000,41.014500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.433600,0.000000,41.014500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433600,-1.535000,41.014500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,-1.535000,41.014500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.433600,-1.535000,41.014500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,0.000000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,0.000000,17.233800>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,-21.428636,0> translate<34.433700,0.000000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,-1.535000,16.777400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,-1.535000,17.233800>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,-21.428636,0> translate<34.433700,-1.535000,16.777400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,0.000000,41.014500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.323600,0.000000,40.665300>}
box{<0,0,-0.127000><0.955962,0.035000,0.127000> rotate<0,21.423809,0> translate<34.433700,0.000000,41.014500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.433700,-1.535000,41.014500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,-1.535000,40.558100>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,21.428636,0> translate<34.433700,-1.535000,41.014500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.452700,0.000000,30.609800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.639500,0.000000,30.796700>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,-45.012361,0> translate<34.452700,0.000000,30.609800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.452700,0.000000,33.176500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.639500,0.000000,32.989600>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,45.012361,0> translate<34.452700,0.000000,33.176500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.526500,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.745700,0.000000,35.560000>}
box{<0,0,-0.127000><0.219200,0.035000,0.127000> rotate<0,0.000000,0> translate<34.526500,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.586900,-1.535000,25.993100>}
box{<0,0,-0.127000><0.058124,0.035000,0.127000> rotate<0,44.997030,0> translate<34.545800,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,0.000000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,0.000000,25.669800>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<34.545800,0.000000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,0.000000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,0.000000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.545800,0.000000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.545800,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.545800,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,35.595200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,37.637100>}
box{<0,0,-0.127000><2.041900,0.035000,0.127000> rotate<0,90.000000,0> translate<34.561700,0.000000,37.637100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,35.814000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.068000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.322000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201000,0.000000,36.576000>}
box{<0,0,-0.127000><1.639300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.830000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,37.084000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,37.338000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.561700,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.665400,0.000000,37.592000>}
box{<0,0,-0.127000><0.103700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.561700,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.576800,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.511100,0.000000,30.734000>}
box{<0,0,-0.127000><2.934300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.576800,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.586300,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,23.622000>}
box{<0,0,-0.127000><4.402700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.586300,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.609200,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.669900,0.000000,33.020000>}
box{<0,0,-0.127000><0.060700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.609200,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.639500,0.000000,30.796700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.673900,0.000000,30.762200>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,45.080183,0> translate<34.639500,0.000000,30.796700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.639500,0.000000,32.989600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.673900,0.000000,33.024100>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,-45.080183,0> translate<34.639500,0.000000,32.989600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,35.658300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.870500,0.000000,35.435200>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<34.647400,0.000000,35.658300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.489300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,35.658300>}
box{<0,0,-0.127000><0.831000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.647400,0.000000,35.658300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.489300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201000,0.000000,36.489300>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.647400,0.000000,36.489300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201000,0.000000,36.742900>}
box{<0,0,-0.127000><1.553600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.647400,0.000000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,37.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,36.742900>}
box{<0,0,-0.127000><0.831100,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.647400,0.000000,36.742900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.647400,0.000000,37.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.870500,0.000000,37.797100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.647400,0.000000,37.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.673900,0.000000,30.762200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,30.762200>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.673900,0.000000,30.762200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.673900,0.000000,33.024100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,33.024100>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.673900,0.000000,33.024100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.736600,0.000000,18.744900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.736600,0.000000,18.491300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.736600,0.000000,18.491300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,17.487200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.490800>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<34.737100,0.000000,18.490800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,17.526000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,17.780000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.034000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.288000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.490800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.490800>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,18.490800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.745500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,19.749100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<34.737100,0.000000,19.749100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.745500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.745500>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,18.745500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.796000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,19.050000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,19.304000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.737100,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,19.558000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<34.737100,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.840300,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,23.876000>}
box{<0,0,-0.127000><4.148700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.840300,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.870500,0.000000,35.435200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,35.435200>}
box{<0,0,-0.127000><1.331000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.870500,0.000000,35.435200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.870500,0.000000,37.797100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,37.797100>}
box{<0,0,-0.127000><1.331000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.870500,0.000000,37.797100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,0.000000,25.472600>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<34.910200,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,0.000000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,0.000000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<34.910200,0.000000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.910200,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<34.910200,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,17.487200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.671800,0.000000,17.487200>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.990700,0.000000,17.487200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.490800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,17.487200>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.990700,0.000000,17.487200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,19.749100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,18.745500>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.990700,0.000000,18.745500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.990700,0.000000,19.749100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.671800,0.000000,19.749100>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<34.990700,0.000000,19.749100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.094300,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,24.130000>}
box{<0,0,-0.127000><3.894700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.094300,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.348300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,24.384000>}
box{<0,0,-0.127000><3.640700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.348300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,30.762200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,31.765800>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<35.354900,0.000000,31.765800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,30.988000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,31.242000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,31.496000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,31.750000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,31.765800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,31.765800>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,31.765800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,32.020500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,33.024100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<35.354900,0.000000,33.024100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,32.020500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,32.020500>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,32.020500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,32.258000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,32.512000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,32.766000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.354900,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,33.020000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.354900,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.370200,0.000000,21.069400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,21.292500>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.370200,0.000000,21.069400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.370200,0.000000,23.431300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,23.208200>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<35.370200,0.000000,23.431300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.382800,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.826400,0.000000,21.082000>}
box{<0,0,-0.127000><0.443600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.382800,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,0.000000,25.472600>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.386200,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,0.000000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,0.000000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.386200,0.000000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.386200,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,-1.535000,29.587300>}
box{<0,0,-0.127000><0.515500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.386200,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.433500,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.775700,0.000000,23.368000>}
box{<0,0,-0.127000><0.342200,0.035000,0.127000> rotate<0,0.000000,0> translate<35.433500,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,21.292500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.123500>}
box{<0,0,-0.127000><0.831000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.593300,0.000000,22.123500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,21.336000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,21.590000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,21.844000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,22.098000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.377100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,23.208200>}
box{<0,0,-0.127000><0.831100,0.035000,0.127000> rotate<0,90.000000,0> translate<35.593300,0.000000,23.208200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,22.606000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,22.860000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.593300,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,23.114000>}
box{<0,0,-0.127000><0.085700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.593300,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,0.000000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,0.000000,17.233800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.596500,0.000000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,-1.535000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,-1.535000,17.233800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.596500,-1.535000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596500,-1.535000,40.558100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,-1.535000,40.558100>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.596500,-1.535000,40.558100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,0.000000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,0.000000,17.327200>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,-4.287613,0> translate<35.596600,0.000000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,-1.535000,17.233800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,-1.535000,17.327200>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,-4.287613,0> translate<35.596600,-1.535000,17.233800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.596600,-1.535000,40.558100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,-1.535000,40.464700>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,4.287613,0> translate<35.596600,-1.535000,40.558100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.602300,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,24.638000>}
box{<0,0,-0.127000><3.386700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.602300,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,30.762200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.289600,0.000000,30.762200>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.608500,0.000000,30.762200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,31.765800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,30.762200>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.608500,0.000000,30.762200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,33.024100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,32.020500>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.608500,0.000000,32.020500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.608500,0.000000,33.024100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.289600,0.000000,33.024100>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.608500,0.000000,33.024100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.609100,0.000000,31.766300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.609100,0.000000,32.019900>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<35.609100,0.000000,32.019900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.609100,0.000000,31.766300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,31.766300>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.609100,0.000000,31.766300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.609100,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,32.004000>}
box{<0,0,-0.127000><2.338500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.609100,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.609100,0.000000,32.019900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.019900>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,0.000000,0> translate<35.609100,0.000000,32.019900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.671800,0.000000,17.487200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.706200,0.000000,17.521700>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,-45.080183,0> translate<35.671800,0.000000,17.487200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.671800,0.000000,19.749100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.706200,0.000000,19.714600>}
box{<0,0,-0.127000><0.048720,0.035000,0.127000> rotate<0,45.080183,0> translate<35.671800,0.000000,19.749100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,21.229400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.991400,0.000000,20.917000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<35.679000,0.000000,21.229400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,23.271300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,21.229400>}
box{<0,0,-0.127000><2.041900,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.679000,0.000000,21.229400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.679000,0.000000,23.271300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.991400,0.000000,23.583700>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.679000,0.000000,23.271300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.706200,0.000000,17.521700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.893000,0.000000,17.334800>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,45.012361,0> translate<35.706200,0.000000,17.521700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.706200,0.000000,19.714600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.893000,0.000000,19.901500>}
box{<0,0,-0.127000><0.264246,0.035000,0.127000> rotate<0,-45.012361,0> translate<35.706200,0.000000,19.714600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.856300,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,24.892000>}
box{<0,0,-0.127000><3.132700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.856300,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.893000,0.000000,17.334800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.634900,0.000000,17.334800>}
box{<0,0,-0.127000><1.741900,0.035000,0.127000> rotate<0,0.000000,0> translate<35.893000,0.000000,17.334800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.893000,0.000000,19.901500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,19.901500>}
box{<0,0,-0.127000><0.781200,0.035000,0.127000> rotate<0,0.000000,0> translate<35.893000,0.000000,19.901500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,0.000000,25.472600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.377700,0.000000,25.669800>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-22.502043,0> translate<35.901700,0.000000,25.472600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,0.000000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.367400,0.000000,29.394300>}
box{<0,0,-0.127000><0.504109,0.035000,0.127000> rotate<0,22.509093,0> translate<35.901700,0.000000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.901700,-1.535000,29.587300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.377700,-1.535000,29.390100>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,22.502043,0> translate<35.901700,-1.535000,29.587300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.991400,0.000000,20.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.917000>}
box{<0,0,-0.127000><0.682800,0.035000,0.127000> rotate<0,0.000000,0> translate<35.991400,0.000000,20.917000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.991400,0.000000,23.583700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,23.583700>}
box{<0,0,-0.127000><0.762400,0.035000,0.127000> rotate<0,0.000000,0> translate<35.991400,0.000000,23.583700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.110300,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,25.146000>}
box{<0,0,-0.127000><2.878700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.110300,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.199300,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.426900,0.000000,29.464000>}
box{<0,0,-0.127000><0.227600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.199300,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.199400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,29.464000>}
box{<0,0,-0.127000><2.789600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.199400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201000,0.000000,36.742900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201000,0.000000,36.489300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.201000,0.000000,36.489300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,35.435200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.488800>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,90.000000,0> translate<36.201500,0.000000,36.488800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,35.560000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,35.814000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.068000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.322000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.488800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.488800>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,36.488800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.743500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,37.797100>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,90.000000,0> translate<36.201500,0.000000,37.797100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.743500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.743500>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,36.743500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.830000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,37.084000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,37.338000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.201500,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,37.592000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.201500,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.289600,0.000000,30.762200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,30.985300>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.289600,0.000000,30.762200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.289600,0.000000,33.024100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.801000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<36.289600,0.000000,33.024100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.293700,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,33.020000>}
box{<0,0,-0.127000><1.653900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.293700,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.339500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.533600,0.000000,25.654000>}
box{<0,0,-0.127000><0.194100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.339500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.354500,-1.535000,25.390200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.482100,-1.535000,25.698200>}
box{<0,0,-0.127000><0.333385,0.035000,0.127000> rotate<0,-67.492017,0> translate<36.354500,-1.535000,25.390200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.358500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,25.400000>}
box{<0,0,-0.127000><2.630500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.358500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.367400,0.000000,29.394300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,31.245400>}
box{<0,0,-0.127000><2.433845,0.035000,0.127000> rotate<0,-49.510852,0> translate<36.367400,0.000000,29.394300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.377700,0.000000,25.669800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.447700,0.000000,25.739900>}
box{<0,0,-0.127000><0.099066,0.035000,0.127000> rotate<0,-45.037924,0> translate<36.377700,0.000000,25.669800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.377700,-1.535000,29.390100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742100,-1.535000,29.025700>}
box{<0,0,-0.127000><0.515339,0.035000,0.127000> rotate<0,44.997030,0> translate<36.377700,-1.535000,29.390100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.447700,0.000000,25.739900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,25.433800>}
box{<0,0,-0.127000><0.432891,0.035000,0.127000> rotate<0,44.997030,0> translate<36.447700,0.000000,25.739900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,35.435200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.786200,0.000000,35.435200>}
box{<0,0,-0.127000><1.331100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.455100,0.000000,35.435200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.488800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,35.435200>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.455100,0.000000,35.435200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,37.797100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,36.743500>}
box{<0,0,-0.127000><1.053600,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.455100,0.000000,36.743500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.455100,0.000000,37.797100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.786200,0.000000,37.797100>}
box{<0,0,-0.127000><1.331100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.455100,0.000000,37.797100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.463700,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,25.654000>}
box{<0,0,-0.127000><2.525300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.463700,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.482100,-1.535000,25.698200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.482100,-1.535000,25.774200>}
box{<0,0,-0.127000><0.076000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.482100,-1.535000,25.774200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.482100,-1.535000,25.774200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742100,-1.535000,26.034200>}
box{<0,0,-0.127000><0.367696,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.482100,-1.535000,25.774200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,30.985300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,31.766300>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.512700,0.000000,31.766300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.727900,0.000000,30.988000>}
box{<0,0,-0.127000><1.215200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.944700,0.000000,31.242000>}
box{<0,0,-0.127000><1.432000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,31.496000>}
box{<0,0,-0.127000><1.434900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,31.750000>}
box{<0,0,-0.127000><1.434900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.019900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.801000>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,90.000000,0> translate<36.512700,0.000000,32.801000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,32.258000>}
box{<0,0,-0.127000><1.434900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,32.512000>}
box{<0,0,-0.127000><1.434900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.512700,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,32.766000>}
box{<0,0,-0.127000><1.434900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.512700,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.557800,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,29.210000>}
box{<0,0,-0.127000><2.431200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.557800,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.615900,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,25.908000>}
box{<0,0,-0.127000><2.373100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.615900,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,20.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.674200,0.000000,19.901500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.674200,0.000000,19.901500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742100,-1.535000,26.034200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,26.510200>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,-67.492017,0> translate<36.742100,-1.535000,26.034200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742100,-1.535000,29.025700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,28.549700>}
box{<0,0,-0.127000><0.515232,0.035000,0.127000> rotate<0,67.492017,0> translate<36.742100,-1.535000,29.025700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,25.433800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.753800,0.000000,23.583700>}
box{<0,0,-0.127000><1.850100,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.753800,0.000000,23.583700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.771000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,28.956000>}
box{<0,0,-0.127000><2.218000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.771000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.795000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,26.162000>}
box{<0,0,-0.127000><2.194000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.795000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,0.000000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,0.000000,17.327200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.842300,0.000000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,-1.535000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,-1.535000,17.327200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.842300,-1.535000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842300,-1.535000,40.464700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,-1.535000,40.464700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.842300,-1.535000,40.464700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,0.000000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,0.000000,17.049200>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,12.858311,0> translate<36.842400,0.000000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,-1.535000,17.327200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,-1.535000,17.049200>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,12.858311,0> translate<36.842400,-1.535000,17.327200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.842400,-1.535000,40.464700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,-1.535000,40.742700>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,-12.858311,0> translate<36.842400,-1.535000,40.464700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.876300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,28.702000>}
box{<0,0,-0.127000><2.112700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.876300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.900200,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,26.416000>}
box{<0,0,-0.127000><2.088800,0.035000,0.127000> rotate<0,0.000000,0> translate<36.900200,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.937400,0.000000,39.344600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,38.334400>}
box{<0,0,-0.127000><1.428639,0.035000,0.127000> rotate<0,44.997030,0> translate<36.937400,0.000000,39.344600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,26.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,28.549700>}
box{<0,0,-0.127000><2.039500,0.035000,0.127000> rotate<0,90.000000,0> translate<36.939300,-1.535000,28.549700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,26.670000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,26.924000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,27.178000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,27.432000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,27.686000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,27.940000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,28.194000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.939300,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,28.448000>}
box{<0,0,-0.127000><2.049700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.939300,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084300,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,17.272000>}
box{<0,0,-0.127000><1.904700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.084300,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084300,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,17.272000>}
box{<0,0,-0.127000><1.904700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.084300,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.610300,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,40.640000>}
box{<0,0,-0.127000><1.378700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.610300,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.634900,0.000000,17.334800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,17.647200>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.634900,0.000000,17.334800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.786200,0.000000,35.435200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,35.596700>}
box{<0,0,-0.127000><0.228325,0.035000,0.127000> rotate<0,-45.014773,0> translate<37.786200,0.000000,35.435200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.786200,0.000000,37.797100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,37.635600>}
box{<0,0,-0.127000><0.228325,0.035000,0.127000> rotate<0,45.014773,0> translate<37.786200,0.000000,37.797100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.826100,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,17.526000>}
box{<0,0,-0.127000><1.162900,0.035000,0.127000> rotate<0,0.000000,0> translate<37.826100,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.910900,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,35.560000>}
box{<0,0,-0.127000><0.036700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.910900,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,17.647200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,18.616200>}
box{<0,0,-0.127000><0.969000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.947300,0.000000,18.616200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,17.780000>}
box{<0,0,-0.127000><1.041700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.947300,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,18.034000>}
box{<0,0,-0.127000><1.041700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.947300,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,18.288000>}
box{<0,0,-0.127000><1.041700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.947300,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,18.542000>}
box{<0,0,-0.127000><1.041700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.947300,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947300,0.000000,18.616200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.222900,0.000000,18.891800>}
box{<0,0,-0.127000><0.389757,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.947300,0.000000,18.616200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,35.596700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,31.245400>}
box{<0,0,-0.127000><4.351300,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.947600,0.000000,31.245400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,38.334400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.947600,0.000000,37.635600>}
box{<0,0,-0.127000><0.698800,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.947600,0.000000,37.635600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,0.000000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,0.000000,17.049200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.060200,0.000000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,-1.535000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,-1.535000,17.049200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.060200,-1.535000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060200,-1.535000,40.742700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,-1.535000,40.742700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<38.060200,-1.535000,40.742700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,0.000000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,16.513000>}
box{<0,0,-0.127000><1.072378,0.035000,0.127000> rotate<0,29.998705,0> translate<38.060300,0.000000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,-1.535000,17.049200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,16.513000>}
box{<0,0,-0.127000><1.072378,0.035000,0.127000> rotate<0,29.998705,0> translate<38.060300,-1.535000,17.049200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.060300,-1.535000,40.742700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,41.279000>}
box{<0,0,-0.127000><1.072428,0.035000,0.127000> rotate<0,-30.003332,0> translate<38.060300,-1.535000,40.742700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.114400,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,17.018000>}
box{<0,0,-0.127000><0.874600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.114400,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.114400,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,17.018000>}
box{<0,0,-0.127000><0.874600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.114400,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.127100,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,18.796000>}
box{<0,0,-0.127000><0.861900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.127100,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.222900,0.000000,18.891800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.199800>}
box{<0,0,-0.127000><0.333385,0.035000,0.127000> rotate<0,-67.492017,0> translate<38.222900,0.000000,18.891800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.288400,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,19.050000>}
box{<0,0,-0.127000><0.700600,0.035000,0.127000> rotate<0,0.000000,0> translate<38.288400,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.322300,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,40.894000>}
box{<0,0,-0.127000><0.666700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.322300,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.199800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.533300>}
box{<0,0,-0.127000><0.333500,0.035000,0.127000> rotate<0,90.000000,0> translate<38.350500,0.000000,19.533300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,19.304000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.533300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.917000>}
box{<0,0,-0.127000><1.383700,0.035000,0.127000> rotate<0,90.000000,0> translate<38.350500,0.000000,20.917000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,19.558000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,19.812000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.066000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.320000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.574000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.828000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.350500,0.000000,20.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.917000>}
box{<0,0,-0.127000><0.638500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.350500,0.000000,20.917000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.554300,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,16.764000>}
box{<0,0,-0.127000><0.434700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.554300,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.554300,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,16.764000>}
box{<0,0,-0.127000><0.434700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.554300,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.762100,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,41.148000>}
box{<0,0,-0.127000><0.226900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.762100,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,20.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,16.513000>}
box{<0,0,-0.127000><4.404000,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.989000,0.000000,16.513000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,41.279000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,-1.535000,16.513000>}
box{<0,0,-0.127000><24.766000,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.989000,-1.535000,16.513000> }
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
difference{
cylinder{<21.590000,0,38.354000><21.590000,0.036000,38.354000>0.511600 translate<0,0.000000,0>}
cylinder{<21.590000,-0.1,38.354000><21.590000,0.135000,38.354000>0.206800 translate<0,0.000000,0>}}
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
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<36.529200,0.000000,44.644000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<36.529200,0.000000,44.644000>}
difference{
cylinder{<36.529200,0,44.644000><36.529200,0.036000,44.644000>3.505200 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.644000><36.529200,0.135000,44.644000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,44.644000><36.529200,0.036000,44.644000>0.990600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.644000><36.529200,0.135000,44.644000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<36.529200,0,44.644000><36.529200,0.036000,44.644000>1.701600 translate<0,0.000000,0>}
cylinder{<36.529200,-0.1,44.644000><36.529200,0.135000,44.644000>1.498400 translate<0,0.000000,0>}}
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
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<11.637200,0.000000,13.148000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<11.637200,0.000000,13.148000>}
difference{
cylinder{<11.637200,0,13.148000><11.637200,0.036000,13.148000>3.505200 translate<0,0.000000,0>}
cylinder{<11.637200,-0.1,13.148000><11.637200,0.135000,13.148000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<11.637200,0,13.148000><11.637200,0.036000,13.148000>0.990600 translate<0,0.000000,0>}
cylinder{<11.637200,-0.1,13.148000><11.637200,0.135000,13.148000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<11.637200,0,13.148000><11.637200,0.036000,13.148000>1.701600 translate<0,0.000000,0>}
cylinder{<11.637200,-0.1,13.148000><11.637200,0.135000,13.148000>1.498400 translate<0,0.000000,0>}}
//H4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<11.428400,0.000000,44.770000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<11.428400,0.000000,44.770000>}
difference{
cylinder{<11.428400,0,44.770000><11.428400,0.036000,44.770000>3.505200 translate<0,0.000000,0>}
cylinder{<11.428400,-0.1,44.770000><11.428400,0.135000,44.770000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<11.428400,0,44.770000><11.428400,0.036000,44.770000>0.990600 translate<0,0.000000,0>}
cylinder{<11.428400,-0.1,44.770000><11.428400,0.135000,44.770000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<11.428400,0,44.770000><11.428400,0.036000,44.770000>1.701600 translate<0,0.000000,0>}
cylinder{<11.428400,-0.1,44.770000><11.428400,0.135000,44.770000>1.498400 translate<0,0.000000,0>}}
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
cylinder{<21.815800,0,37.521200><21.815800,0.036000,37.521200>0.491600 translate<0,0.000000,0>}
cylinder{<21.815800,-0.1,37.521200><21.815800,0.135000,37.521200>0.288400 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,37.911100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,37.261100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,36.611100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,35.961100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,35.311100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,34.661100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,34.011100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<20.532100,0.000000,33.361100>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,33.361200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,34.011200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,34.661200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,35.311200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,35.961200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,36.611200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,37.261200>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<27.829500,0.000000,37.911200>}
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
