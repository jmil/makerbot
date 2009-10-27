//POVRay-File created by 3d41.ulp v1.05
///Users/zachsmith/makerbot/trunk/electronics/magnetic-linear-encoder/magnetic-linear-encoder.brd
//10/27/09 6:01 PM

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
#local cam_y = 128;
#local cam_z = -68;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -2;
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

#local lgt1_pos_x = 14;
#local lgt1_pos_y = 21;
#local lgt1_pos_z = 15;
#local lgt1_intense = 0.716275;
#local lgt2_pos_x = -14;
#local lgt2_pos_y = 21;
#local lgt2_pos_z = 15;
#local lgt2_intense = 0.716275;
#local lgt3_pos_x = 14;
#local lgt3_pos_y = 21;
#local lgt3_pos_z = -10;
#local lgt3_intense = 0.716275;
#local lgt4_pos_x = -14;
#local lgt4_pos_y = 21;
#local lgt4_pos_z = -10;
#local lgt4_intense = 0.716275;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 38.024000;
#declare pcb_y_size = 29.962000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(397);
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
	//translate<-19.012000,0,-14.981000>
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


#macro MAGNETIC_LINEAR_ENCODER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<14.224000,16.764000><52.248000,16.764000>
<52.248000,16.764000><52.248000,46.726000>
<52.248000,46.726000><14.224000,46.726000>
<14.224000,46.726000><14.224000,16.764000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<18.034000,1,36.957000><18.034000,-5,36.957000>1.700000 texture{col_hls}}
cylinder{<18.034000,1,26.543000><18.034000,-5,26.543000>1.700000 texture{col_hls}}
cylinder{<17.780000,1,20.320000><17.780000,-5,20.320000>1.500000 texture{col_hls}}
cylinder{<17.780000,1,43.180000><17.780000,-5,43.180000>1.500000 texture{col_hls}}
cylinder{<48.768000,1,43.180000><48.768000,-5,43.180000>1.500000 texture{col_hls}}
cylinder{<48.768000,1,20.320000><48.768000,-5,20.320000>1.500000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,29.210000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100nF C0805
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP20("AS5306","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,34.290000>translate<0,0.035000,0> }#end		//SSOP20 IC1 AS5306 SSOP20
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<30.480000,0.000000,34.290000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) JP1  1X06
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.670000,0.000000,41.910000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R1 560 R1206
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<23.622000,0.000000,21.082000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R2 560 R1206
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_1206("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<48.768000,0.000000,34.290000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R3 560 R1206
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.162000,0.000000,19.332000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.162000,0.000000,22.832000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.130000,0.000000,43.660000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.130000,0.000000,40.160000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<48.260000,0.000000,30.160000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<48.260000,0.000000,28.260000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,36.565000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,35.915000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,35.265000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,34.615000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,33.965000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,33.315000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,32.665000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,32.015000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,31.365000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.575000,0.000000,30.715000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,36.565000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,35.915000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,35.265000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,34.615000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,33.965000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,33.315000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,32.665000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,32.015000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,31.365000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.165000,0.000000,30.715000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.518000,0.000000,36.830000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.018000,0.000000,36.830000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.670000,0.000000,43.332000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.670000,0.000000,40.488000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.622000,0.000000,19.660000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.622000,0.000000,22.504000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.190000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.346000,0.000000,34.290000>}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,35.560000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<33.274000,0,37.084000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<34.798000,0,37.846000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<40.894000,0,30.734000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<22.098000,0,40.894000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<38.100000,0,34.798000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,32.258000>}
box{<0,0,-0.203200><6.604000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.590000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,44.958000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.098000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,33.020000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.590000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,40.894000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,40.132000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<22.098000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,41.148000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,41.148000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.860000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,45.720000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.098000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,29.464000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.114000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,23.622000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<21.590000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,22.504000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,23.622000>}
box{<0,0,-0.203200><1.118000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.622000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.102000,0.000000,40.132000>}
box{<0,0,-0.203200><1.242000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,30.480000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<22.860000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,30.480000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.114000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.102000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,40.160000>}
box{<0,0,-0.203200><0.039598,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.102000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,43.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.458000,0.000000,43.332000>}
box{<0,0,-0.203200><0.463862,0.035000,0.203200> rotate<0,44.997030,0> translate<24.130000,0.000000,43.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,43.942000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,19.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.834000,0.000000,19.660000>}
box{<0,0,-0.203200><2.212000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.622000,0.000000,19.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.834000,0.000000,19.660000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,19.332000>}
box{<0,0,-0.203200><0.463862,0.035000,0.203200> rotate<0,44.997030,0> translate<25.834000,0.000000,19.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,23.368000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,44.997030,0> translate<23.114000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,22.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,0.000000,23.368000>}
box{<0,0,-0.203200><0.536000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.162000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,30.480000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,30.480000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,33.020000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.352000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,40.488000>}
box{<0,0,-0.203200><4.928000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.670000,0.000000,40.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.458000,0.000000,43.332000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,43.332000>}
box{<0,0,-0.203200><2.212000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.458000,0.000000,43.332000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,45.720000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,27.940000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,30.480000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,33.020000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,35.560000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,42.926000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<28.194000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,38.100000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,33.020000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,35.560000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,0.000000,25.908000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,-1.535000,43.942000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,27.940000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,39.370000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.203000,0.000000,34.615000>}
box{<0,0,-0.203200><1.336432,0.035000,0.203200> rotate<0,44.997030,0> translate<32.258000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,34.290000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.004000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,37.084000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.274000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,28.448000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.020000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,32.004000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.528000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.189000,0.000000,32.665000>}
box{<0,0,-0.203200><0.934795,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.528000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.443000,0.000000,35.915000>}
box{<0,0,-0.203200><1.653216,0.035000,0.203200> rotate<0,44.997030,0> translate<33.274000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,37.846000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.798000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,41.656000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,44.997030,0> translate<32.512000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,38.100000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.798000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,27.940000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.189000,0.000000,32.665000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,32.665000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.189000,0.000000,32.665000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.203000,0.000000,34.615000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,34.615000>}
box{<0,0,-0.203200><2.372000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.203000,0.000000,34.615000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.443000,0.000000,35.915000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,35.915000>}
box{<0,0,-0.203200><1.132000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.443000,0.000000,35.915000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,37.069000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,36.565000>}
box{<0,0,-0.203200><0.504000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.575000,0.000000,36.565000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,37.069000>}
box{<0,0,-0.203200><1.098844,0.035000,0.203200> rotate<0,44.997030,0> translate<34.798000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,35.265000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.633000,0.000000,35.265000>}
box{<0,0,-0.203200><2.058000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.575000,0.000000,35.265000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,30.734000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.306000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.633000,0.000000,35.265000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,0.000000,34.798000>}
box{<0,0,-0.203200><0.660438,0.035000,0.203200> rotate<0,44.997030,0> translate<37.633000,0.000000,35.265000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,34.798000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.100000,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,38.100000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.052000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,39.370000>}
box{<0,0,-0.203200><5.842000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157000,0.000000,33.315000>}
box{<0,0,-0.203200><3.582000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.575000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,40.640000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,32.015000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.635000,0.000000,32.015000>}
box{<0,0,-0.203200><4.060000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.575000,0.000000,32.015000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,34.036000>}
box{<0,0,-0.203200><1.019648,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.157000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.354000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<38.862000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.354000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.878000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,30.734000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.894000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,35.814000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,44.997030,0> translate<38.608000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.913000,0.000000,30.715000>}
box{<0,0,-0.203200><0.026870,0.035000,0.203200> rotate<0,44.997030,0> translate<40.894000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.635000,0.000000,32.015000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,33.528000>}
box{<0,0,-0.203200><2.139705,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.635000,0.000000,32.015000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,39.116000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<39.624000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,39.116000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,90.000000,0> translate<41.148000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,42.926000>}
box{<0,0,-0.203200><10.160000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.988000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.913000,0.000000,30.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.165000,0.000000,30.715000>}
box{<0,0,-0.203200><2.252000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.913000,0.000000,30.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.165000,0.000000,33.965000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.633000,0.000000,33.965000>}
box{<0,0,-0.203200><1.468000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.165000,0.000000,33.965000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.633000,0.000000,33.965000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,34.544000>}
box{<0,0,-0.203200><0.818830,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.633000,0.000000,33.965000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,34.544000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,36.830000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,38.862000>}
box{<0,0,-0.203200><5.747364,0.035000,0.203200> rotate<0,44.997030,0> translate<41.148000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.165000,0.000000,30.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.620000,0.000000,28.260000>}
box{<0,0,-0.203200><3.471894,0.035000,0.203200> rotate<0,44.997030,0> translate<43.165000,0.000000,30.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.018000,0.000000,36.830000>}
box{<0,0,-0.203200><1.806000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.212000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.165000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.133000,0.000000,33.315000>}
box{<0,0,-0.203200><3.968000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.165000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.133000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.346000,0.000000,34.290000>}
box{<0,0,-0.203200><0.997995,0.035000,0.203200> rotate<0,-77.671560,0> translate<47.133000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.133000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.457000,0.000000,33.315000>}
box{<0,0,-0.203200><0.324000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.133000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.346000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,31.090000>}
box{<0,0,-0.203200><3.203608,0.035000,0.203200> rotate<0,87.274734,0> translate<47.346000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.620000,0.000000,28.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,28.260000>}
box{<0,0,-0.203200><2.640000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.620000,0.000000,28.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,30.160000>}
box{<0,0,-0.203200><1.202308,0.035000,0.203200> rotate<0,50.667013,0> translate<47.498000,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.457000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,32.258000>}
box{<0,0,-0.203200><1.494824,0.035000,0.203200> rotate<0,44.997030,0> translate<47.457000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,25.908000>}
box{<0,0,-0.203200><16.510000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.512000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,32.258000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.514000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,0.000000,27.178000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.022000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,0.000000,31.750000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<49.784000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,0.000000,31.750000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.292000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.190000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,34.618000>}
box{<0,0,-0.203200><0.463862,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.190000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,34.618000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,36.830000>}
box{<0,0,-0.203200><2.212000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.518000,0.000000,36.830000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,27.573500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.926400>}
box{<0,0,-0.127000><8.352900,0.035000,0.127000> rotate<0,90.000000,0> translate<15.366900,-1.535000,35.926400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,27.573500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,-1.535000,27.640300>}
box{<0,0,-0.127000><0.069131,0.035000,0.127000> rotate<0,-75.074305,0> translate<15.366900,-1.535000,27.573500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,27.573600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.926300>}
box{<0,0,-0.127000><8.352700,0.035000,0.127000> rotate<0,90.000000,0> translate<15.366900,0.000000,35.926300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,27.573600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,0.000000,27.640300>}
box{<0,0,-0.127000><0.069034,0.035000,0.127000> rotate<0,-75.052937,0> translate<15.366900,0.000000,27.573600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411100,0.000000,27.686000>}
box{<0,0,-0.127000><0.044200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411100,-1.535000,27.686000>}
box{<0,0,-0.127000><0.044200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557800,0.000000,27.940000>}
box{<0,0,-0.127000><0.190900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557800,-1.535000,27.940000>}
box{<0,0,-0.127000><0.190900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704400,0.000000,28.194000>}
box{<0,0,-0.127000><0.337500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704400,-1.535000,28.194000>}
box{<0,0,-0.127000><0.337500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.918400,0.000000,28.448000>}
box{<0,0,-0.127000><0.551500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.918400,-1.535000,28.448000>}
box{<0,0,-0.127000><0.551500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.172400,0.000000,28.702000>}
box{<0,0,-0.127000><0.805500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.172400,-1.535000,28.702000>}
box{<0,0,-0.127000><0.805500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.527500,0.000000,28.956000>}
box{<0,0,-0.127000><1.160600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.527500,-1.535000,28.956000>}
box{<0,0,-0.127000><1.160600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.003100,0.000000,29.210000>}
box{<0,0,-0.127000><1.636200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.003100,-1.535000,29.210000>}
box{<0,0,-0.127000><1.636200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,29.464000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169400,-1.535000,29.464000>}
box{<0,0,-0.127000><9.802500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,29.718000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.915400,-1.535000,29.718000>}
box{<0,0,-0.127000><9.548500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,29.972000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.762100,-1.535000,29.972000>}
box{<0,0,-0.127000><9.395200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,30.226000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.656800,-1.535000,30.226000>}
box{<0,0,-0.127000><9.289900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,30.480000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,-1.535000,30.480000>}
box{<0,0,-0.127000><11.175600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,30.734000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.657000,-1.535000,30.734000>}
box{<0,0,-0.127000><9.290100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,30.988000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.762200,-1.535000,30.988000>}
box{<0,0,-0.127000><9.395300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,31.242000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.915500,-1.535000,31.242000>}
box{<0,0,-0.127000><9.548600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,31.496000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169500,-1.535000,31.496000>}
box{<0,0,-0.127000><9.802600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,31.750000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,31.750000>}
box{<0,0,-0.127000><22.199700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.004000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,-1.535000,32.004000>}
box{<0,0,-0.127000><9.933200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.258000>}
box{<0,0,-0.127000><5.689700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,-1.535000,32.258000>}
box{<0,0,-0.127000><9.620400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.089700,0.000000,32.512000>}
box{<0,0,-0.127000><5.722800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817100,-1.535000,32.512000>}
box{<0,0,-0.127000><9.450200,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.343700,0.000000,32.766000>}
box{<0,0,-0.127000><5.976800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.711800,-1.535000,32.766000>}
box{<0,0,-0.127000><9.344900,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.597700,0.000000,33.020000>}
box{<0,0,-0.127000><6.230800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,33.020000>}
box{<0,0,-0.127000><9.334500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.851700,0.000000,33.274000>}
box{<0,0,-0.127000><6.484800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.712000,-1.535000,33.274000>}
box{<0,0,-0.127000><9.345100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.105700,0.000000,33.528000>}
box{<0,0,-0.127000><6.738800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817200,-1.535000,33.528000>}
box{<0,0,-0.127000><9.450300,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,0.000000,33.782000>}
box{<0,0,-0.127000><9.620500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,-1.535000,33.782000>}
box{<0,0,-0.127000><9.620500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,0.000000,34.036000>}
box{<0,0,-0.127000><9.933500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,-1.535000,34.036000>}
box{<0,0,-0.127000><9.933500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.002600,0.000000,34.290000>}
box{<0,0,-0.127000><1.635700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.002600,-1.535000,34.290000>}
box{<0,0,-0.127000><1.635700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.527300,0.000000,34.544000>}
box{<0,0,-0.127000><1.160400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.527300,-1.535000,34.544000>}
box{<0,0,-0.127000><1.160400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.172300,0.000000,34.798000>}
box{<0,0,-0.127000><0.805400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.172300,-1.535000,34.798000>}
box{<0,0,-0.127000><0.805400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.918300,0.000000,35.052000>}
box{<0,0,-0.127000><0.551400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.918300,-1.535000,35.052000>}
box{<0,0,-0.127000><0.551400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704300,0.000000,35.306000>}
box{<0,0,-0.127000><0.337400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.704300,-1.535000,35.306000>}
box{<0,0,-0.127000><0.337400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557600,0.000000,35.560000>}
box{<0,0,-0.127000><0.190700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.557600,-1.535000,35.560000>}
box{<0,0,-0.127000><0.190700,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411000,0.000000,35.814000>}
box{<0,0,-0.127000><0.044100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.411000,-1.535000,35.814000>}
box{<0,0,-0.127000><0.044100,0.035000,0.127000> rotate<0,0.000000,0> translate<15.366900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,0.000000,35.926300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,0.000000,35.859600>}
box{<0,0,-0.127000><0.069034,0.035000,0.127000> rotate<0,75.052937,0> translate<15.366900,0.000000,35.926300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.366900,-1.535000,35.926400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,-1.535000,35.859600>}
box{<0,0,-0.127000><0.069131,0.035000,0.127000> rotate<0,75.074305,0> translate<15.366900,-1.535000,35.926400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,0.000000,27.640300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,0.000000,28.288600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<15.384700,0.000000,27.640300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,-1.535000,27.640300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,-1.535000,28.288600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<15.384700,-1.535000,27.640300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,0.000000,35.859600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,0.000000,35.211300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<15.384700,0.000000,35.859600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.384700,-1.535000,35.859600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,-1.535000,35.211300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<15.384700,-1.535000,35.859600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,0.000000,28.288600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,0.000000,28.817900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.759000,0.000000,28.288600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,-1.535000,28.288600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,-1.535000,28.817900>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.759000,-1.535000,28.288600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,0.000000,35.211300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,0.000000,34.682000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<15.759000,0.000000,35.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.759000,-1.535000,35.211300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,-1.535000,34.682000>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<15.759000,-1.535000,35.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,0.000000,28.817900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,0.000000,29.192200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<16.288300,0.000000,28.817900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,-1.535000,28.817900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,-1.535000,29.192200>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<16.288300,-1.535000,28.817900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,0.000000,34.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,0.000000,34.307700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<16.288300,0.000000,34.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.288300,-1.535000,34.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,-1.535000,34.307700>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<16.288300,-1.535000,34.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,0.000000,29.192200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,0.000000,29.385900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<16.936600,0.000000,29.192200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,-1.535000,29.192200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,-1.535000,29.385900>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<16.936600,-1.535000,29.192200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,0.000000,34.307700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,0.000000,34.114000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<16.936600,0.000000,34.307700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.936600,-1.535000,34.307700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,-1.535000,34.114000>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<16.936600,-1.535000,34.307700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,0.000000,29.385900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,0.000000,29.385900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<17.659600,0.000000,29.385900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,-1.535000,29.385900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,-1.535000,29.385900>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<17.659600,-1.535000,29.385900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,0.000000,34.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,0.000000,34.114000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<17.659600,0.000000,34.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.659600,-1.535000,34.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,-1.535000,34.114000>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,0.000000,0> translate<17.659600,-1.535000,34.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,0.000000,29.385900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,0.000000,29.192200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<18.408300,0.000000,29.385900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,-1.535000,29.385900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,-1.535000,29.192200>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,14.996994,0> translate<18.408300,-1.535000,29.385900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,0.000000,34.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,0.000000,34.307700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<18.408300,0.000000,34.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.408300,-1.535000,34.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,-1.535000,34.307700>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-14.996994,0> translate<18.408300,-1.535000,34.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.064900,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,29.210000>}
box{<0,0,-0.127000><1.991700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.064900,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.064900,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.821700,-1.535000,29.210000>}
box{<0,0,-0.127000><16.756800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.064900,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.065200,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.519700,-1.535000,34.290000>}
box{<0,0,-0.127000><13.454500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.065200,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.065200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.773600,0.000000,34.290000>}
box{<0,0,-0.127000><13.708400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.065200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,0.000000,29.192200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,28.817900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<19.131300,0.000000,29.192200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,-1.535000,29.192200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,28.817900>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,29.998273,0> translate<19.131300,-1.535000,29.192200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,0.000000,34.307700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,34.682000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<19.131300,0.000000,34.307700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.131300,-1.535000,34.307700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,34.682000>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-29.998273,0> translate<19.131300,-1.535000,34.307700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,0.000000,24.109300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,24.268000>}
box{<0,0,-0.127000><0.317420,0.035000,0.127000> rotate<0,-29.995896,0> translate<19.504700,0.000000,24.109300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,-1.535000,24.109300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,24.268000>}
box{<0,0,-0.127000><0.317420,0.035000,0.127000> rotate<0,-29.995896,0> translate<19.504700,-1.535000,24.109300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,0.000000,24.109300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,0.000000,23.596600>}
box{<0,0,-0.127000><1.025554,0.035000,0.127000> rotate<0,29.993061,0> translate<19.504700,0.000000,24.109300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,-1.535000,24.109300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,-1.535000,23.596600>}
box{<0,0,-0.127000><1.025554,0.035000,0.127000> rotate<0,29.993061,0> translate<19.504700,-1.535000,24.109300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,0.000000,39.390600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,39.231900>}
box{<0,0,-0.127000><0.317420,0.035000,0.127000> rotate<0,29.995896,0> translate<19.504700,0.000000,39.390600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,-1.535000,39.390600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,39.231900>}
box{<0,0,-0.127000><0.317420,0.035000,0.127000> rotate<0,29.995896,0> translate<19.504700,-1.535000,39.390600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,0.000000,39.390600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,0.000000,39.903300>}
box{<0,0,-0.127000><1.025554,0.035000,0.127000> rotate<0,-29.993061,0> translate<19.504700,0.000000,39.390600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.504700,-1.535000,39.390600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,-1.535000,39.903300>}
box{<0,0,-0.127000><1.025554,0.035000,0.127000> rotate<0,-29.993061,0> translate<19.504700,-1.535000,39.390600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540400,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,39.370000>}
box{<0,0,-0.127000><3.458600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540400,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540400,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.132400,-1.535000,39.370000>}
box{<0,0,-0.127000><27.592000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540400,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.359600,0.000000,24.130000>}
box{<0,0,-0.127000><2.819100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.132700,-1.535000,24.130000>}
box{<0,0,-0.127000><27.592200,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,28.956000>}
box{<0,0,-0.127000><1.516100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,-1.535000,28.956000>}
box{<0,0,-0.127000><5.759900,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,0.000000,34.544000>}
box{<0,0,-0.127000><5.759600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.540500,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,-1.535000,34.544000>}
box{<0,0,-0.127000><5.759600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.540500,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,24.268000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,24.797300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.779600,0.000000,24.268000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,24.268000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,24.797300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.779600,-1.535000,24.268000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,28.817900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,28.288600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<19.779600,0.000000,28.817900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,28.817900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,28.288600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<19.779600,-1.535000,28.817900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,34.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,35.211300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.779600,0.000000,34.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,34.682000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,35.211300>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.779600,-1.535000,34.682000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,0.000000,39.231900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,38.702600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<19.779600,0.000000,39.231900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.779600,-1.535000,39.231900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,38.702600>}
box{<0,0,-0.127000><0.748543,0.035000,0.127000> rotate<0,44.997030,0> translate<19.779600,-1.535000,39.231900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895500,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,28.702000>}
box{<0,0,-0.127000><1.161100,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895500,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895500,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,-1.535000,28.702000>}
box{<0,0,-0.127000><5.091900,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895500,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895500,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.135100,0.000000,39.116000>}
box{<0,0,-0.127000><3.239600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895500,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895500,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,-1.535000,39.116000>}
box{<0,0,-0.127000><9.421600,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895500,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895600,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.105600,0.000000,24.384000>}
box{<0,0,-0.127000><2.210000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895600,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.779800,-1.535000,24.384000>}
box{<0,0,-0.127000><27.884200,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895600,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,0.000000,34.798000>}
box{<0,0,-0.127000><5.091700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895600,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.895600,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,-1.535000,34.798000>}
box{<0,0,-0.127000><5.091700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.895600,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.908900,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.613600,0.000000,23.876000>}
box{<0,0,-0.127000><2.704700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.908900,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.908900,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.580400,-1.535000,23.876000>}
box{<0,0,-0.127000><26.671500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.908900,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.909000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,39.624000>}
box{<0,0,-0.127000><3.090000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.909000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.909000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,-1.535000,39.624000>}
box{<0,0,-0.127000><9.407700,0.035000,0.127000> rotate<0,0.000000,0> translate<19.909000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149500,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,28.448000>}
box{<0,0,-0.127000><0.907100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149500,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817200,-1.535000,28.448000>}
box{<0,0,-0.127000><4.667700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149500,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,38.862000>}
box{<0,0,-0.127000><5.987100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149500,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149500,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,-1.535000,38.862000>}
box{<0,0,-0.127000><8.786000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149500,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149600,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.851600,0.000000,24.638000>}
box{<0,0,-0.127000><1.702000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149600,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149600,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,24.638000>}
box{<0,0,-0.127000><30.955400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149600,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149600,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817100,0.000000,35.052000>}
box{<0,0,-0.127000><4.667500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149600,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.149600,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817100,-1.535000,35.052000>}
box{<0,0,-0.127000><4.667500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.149600,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,24.797300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,25.445600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<20.308900,0.000000,24.797300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,24.797300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,25.445600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<20.308900,-1.535000,24.797300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,28.288600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,27.640300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<20.308900,0.000000,28.288600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,28.288600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,27.640300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<20.308900,-1.535000,28.288600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,35.211300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,35.859600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<20.308900,0.000000,35.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,35.211300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,35.859600>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,-59.995787,0> translate<20.308900,-1.535000,35.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,0.000000,38.702600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,38.054300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<20.308900,0.000000,38.702600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.308900,-1.535000,38.702600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,38.054300>}
box{<0,0,-0.127000><0.748594,0.035000,0.127000> rotate<0,59.995787,0> translate<20.308900,-1.535000,38.702600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.348900,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.571600,0.000000,23.622000>}
box{<0,0,-0.127000><2.222700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.348900,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.348900,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.262000,-1.535000,23.622000>}
box{<0,0,-0.127000><25.913100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.348900,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.349000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,39.878000>}
box{<0,0,-0.127000><2.650000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.349000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.349000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,39.878000>}
box{<0,0,-0.127000><8.586400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.349000,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363500,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.597600,0.000000,24.892000>}
box{<0,0,-0.127000><1.234100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363500,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363500,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,24.892000>}
box{<0,0,-0.127000><30.741500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363500,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363500,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.711800,0.000000,35.306000>}
box{<0,0,-0.127000><4.348300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363500,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363500,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.711800,-1.535000,35.306000>}
box{<0,0,-0.127000><4.348300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363500,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363600,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,28.194000>}
box{<0,0,-0.127000><0.693000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363600,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363600,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.712000,-1.535000,28.194000>}
box{<0,0,-0.127000><4.348400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363600,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363600,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,38.608000>}
box{<0,0,-0.127000><5.773000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363600,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.363600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,-1.535000,38.608000>}
box{<0,0,-0.127000><8.382700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.363600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,0.000000,23.596600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,23.596600>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.392900,0.000000,23.596600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,-1.535000,23.596600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,23.596600>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.392900,-1.535000,23.596600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,0.000000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,39.903300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.392900,0.000000,39.903300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.392900,-1.535000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,39.903300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.392900,-1.535000,39.903300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,23.596600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,22.680800>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,47.141031,0> translate<20.393000,0.000000,23.596600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,23.596600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,22.680800>}
box{<0,0,-0.127000><1.249272,0.035000,0.127000> rotate<0,47.141031,0> translate<20.393000,-1.535000,23.596600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,39.903400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<20.393000,0.000000,39.903400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,39.903400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<20.393000,-1.535000,39.903400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,0.000000,39.903400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,40.819100>}
box{<0,0,-0.127000><1.249198,0.035000,0.127000> rotate<0,-47.137911,0> translate<20.393000,0.000000,39.903400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.393000,-1.535000,39.903400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,40.819100>}
box{<0,0,-0.127000><1.249198,0.035000,0.127000> rotate<0,-47.137911,0> translate<20.393000,-1.535000,39.903400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.343600,0.000000,25.146000>}
box{<0,0,-0.127000><0.833400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,25.146000>}
box{<0,0,-0.127000><30.594800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,27.940000>}
box{<0,0,-0.127000><0.546400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,27.940000>}
box{<0,0,-0.127000><4.191200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,35.560000>}
box{<0,0,-0.127000><4.191200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,35.560000>}
box{<0,0,-0.127000><4.191200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,38.354000>}
box{<0,0,-0.127000><5.626400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.510200,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,-1.535000,38.354000>}
box{<0,0,-0.127000><8.130900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.510200,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605100,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.002600,0.000000,40.132000>}
box{<0,0,-0.127000><3.397500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.605100,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605100,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,-1.535000,40.132000>}
box{<0,0,-0.127000><8.141100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.605100,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605200,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,23.368000>}
box{<0,0,-0.127000><1.785100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.605200,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.605200,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.943600,-1.535000,23.368000>}
box{<0,0,-0.127000><25.338400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.605200,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656800,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.089600,0.000000,25.400000>}
box{<0,0,-0.127000><0.432800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656800,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656800,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,25.400000>}
box{<0,0,-0.127000><30.448200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656800,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656800,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.712000,0.000000,35.814000>}
box{<0,0,-0.127000><4.055200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656800,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656800,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.712000,-1.535000,35.814000>}
box{<0,0,-0.127000><4.055200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656800,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,27.686000>}
box{<0,0,-0.127000><0.399700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656900,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.711800,-1.535000,27.686000>}
box{<0,0,-0.127000><4.054900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656900,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656900,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,38.100000>}
box{<0,0,-0.127000><5.479700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656900,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.656900,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,38.100000>}
box{<0,0,-0.127000><7.968900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.656900,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,25.445600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.168600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<20.683200,0.000000,25.445600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,25.445600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.168600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<20.683200,-1.535000,25.445600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,27.640300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.917300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<20.683200,0.000000,27.640300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,27.640300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.917300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<20.683200,-1.535000,27.640300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,35.859600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,36.582600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<20.683200,0.000000,35.859600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,35.859600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,36.582600>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,-74.997066,0> translate<20.683200,-1.535000,35.859600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,0.000000,38.054300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,37.331300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<20.683200,0.000000,38.054300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.683200,-1.535000,38.054300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,37.331300>}
box{<0,0,-0.127000><0.748498,0.035000,0.127000> rotate<0,74.997066,0> translate<20.683200,-1.535000,38.054300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,25.654000>}
box{<0,0,-0.127000><0.317600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739000,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,25.654000>}
box{<0,0,-0.127000><30.366000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739000,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817200,0.000000,36.068000>}
box{<0,0,-0.127000><4.078200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817200,-1.535000,36.068000>}
box{<0,0,-0.127000><4.078200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739100,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,27.432000>}
box{<0,0,-0.127000><0.317500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739100,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739100,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817100,-1.535000,27.432000>}
box{<0,0,-0.127000><4.078000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739100,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739100,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,37.846000>}
box{<0,0,-0.127000><5.397500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739100,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.739100,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,-1.535000,37.846000>}
box{<0,0,-0.127000><7.901900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.739100,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,25.908000>}
box{<0,0,-0.127000><0.249600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,25.908000>}
box{<0,0,-0.127000><30.298000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,0.000000,36.322000>}
box{<0,0,-0.127000><4.180400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,-1.535000,36.322000>}
box{<0,0,-0.127000><4.180400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807000,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807100,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,27.178000>}
box{<0,0,-0.127000><0.249500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807100,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807100,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,-1.535000,27.178000>}
box{<0,0,-0.127000><4.180200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807100,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807100,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,37.592000>}
box{<0,0,-0.127000><5.329500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807100,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.807100,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,-1.535000,37.592000>}
box{<0,0,-0.127000><7.939100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.807100,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.840800,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,23.114000>}
box{<0,0,-0.127000><1.549500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.840800,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.840800,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.657400,-1.535000,23.114000>}
box{<0,0,-0.127000><24.816600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.840800,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.840800,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.386000>}
box{<0,0,-0.127000><2.158200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.840800,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.840800,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,-1.535000,40.386000>}
box{<0,0,-0.127000><7.800200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.840800,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875100,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,26.162000>}
box{<0,0,-0.127000><0.181500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875100,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875100,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,26.162000>}
box{<0,0,-0.127000><30.229900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875100,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875100,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,0.000000,36.576000>}
box{<0,0,-0.127000><4.425300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875100,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,-1.535000,36.576000>}
box{<0,0,-0.127000><4.425300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875200,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,26.924000>}
box{<0,0,-0.127000><0.181400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875200,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875200,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,-1.535000,26.924000>}
box{<0,0,-0.127000><4.424900,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875200,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875200,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,37.338000>}
box{<0,0,-0.127000><5.261400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875200,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875200,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,37.338000>}
box{<0,0,-0.127000><8.060200,0.035000,0.127000> rotate<0,0.000000,0> translate<20.875200,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.917300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<20.876900,0.000000,26.917300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.917300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<20.876900,-1.535000,26.917300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,26.416000>}
box{<0,0,-0.127000><0.179700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,26.416000>}
box{<0,0,-0.127000><30.228100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,26.670000>}
box{<0,0,-0.127000><0.179700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,26.670000>}
box{<0,0,-0.127000><30.228100,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,36.582600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,37.331300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<20.876900,0.000000,37.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,36.582600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,37.331300>}
box{<0,0,-0.127000><0.748700,0.035000,0.127000> rotate<0,90.000000,0> translate<20.876900,-1.535000,37.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,36.830000>}
box{<0,0,-0.127000><5.259700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.531200,-1.535000,36.830000>}
box{<0,0,-0.127000><11.654300,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,37.084000>}
box{<0,0,-0.127000><5.259700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.876900,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,-1.535000,37.084000>}
box{<0,0,-0.127000><8.439800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.876900,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,25.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.369000,0.000000,25.120600>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<21.056600,0.000000,25.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,25.433000>}
box{<0,0,-0.127000><6.604000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.056600,0.000000,25.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.478900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.037000>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.056600,0.000000,32.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.056600,0.000000,32.478900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.818600,0.000000,33.240900>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.056600,0.000000,32.478900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.076500,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,22.860000>}
box{<0,0,-0.127000><1.313800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.076500,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.076500,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.484200,-1.535000,22.860000>}
box{<0,0,-0.127000><24.407700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.076500,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.076500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.640000>}
box{<0,0,-0.127000><1.922500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.076500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.076500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,40.640000>}
box{<0,0,-0.127000><7.549300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.076500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.194200,0.000000,17.906900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,17.959100>}
box{<0,0,-0.127000><0.071254,0.035000,0.127000> rotate<0,-47.101152,0> translate<21.194200,0.000000,17.906900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.194200,-1.535000,17.906900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,17.959100>}
box{<0,0,-0.127000><0.071254,0.035000,0.127000> rotate<0,-47.101152,0> translate<21.194200,-1.535000,17.906900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.194200,0.000000,17.906900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.397600,0.000000,17.906900>}
box{<0,0,-0.127000><24.203400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.194200,0.000000,17.906900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.194200,-1.535000,17.906900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.397600,-1.535000,17.906900>}
box{<0,0,-0.127000><24.203400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.194200,-1.535000,17.906900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.203400,0.000000,45.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,45.540800>}
box{<0,0,-0.127000><0.057666,0.035000,0.127000> rotate<0,47.034781,0> translate<21.203400,0.000000,45.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.203400,-1.535000,45.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,45.540800>}
box{<0,0,-0.127000><0.057666,0.035000,0.127000> rotate<0,47.034781,0> translate<21.203400,-1.535000,45.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.203400,0.000000,45.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390800,0.000000,45.583000>}
box{<0,0,-0.127000><24.187400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.203400,0.000000,45.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.203400,-1.535000,45.583000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390800,-1.535000,45.583000>}
box{<0,0,-0.127000><24.187400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.203400,-1.535000,45.583000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,17.959100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,17.959200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,0.000000,17.959200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,17.959100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,17.959200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,-1.535000,17.959200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,17.959200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,19.084600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<21.242700,0.000000,17.959200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,17.959200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,19.084600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<21.242700,-1.535000,17.959200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,22.680700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,22.680800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,0.000000,22.680800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,22.680700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,22.680800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,-1.535000,22.680800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,22.680700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,21.555300>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,64.279987,0> translate<21.242700,0.000000,22.680700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,22.680700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,21.555300>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,64.279987,0> translate<21.242700,-1.535000,22.680700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,40.819100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,40.819200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,0.000000,40.819200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,40.819100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,40.819200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,-1.535000,40.819200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,40.819200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,41.944600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<21.242700,0.000000,40.819200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,40.819200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,41.944600>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,-64.279987,0> translate<21.242700,-1.535000,40.819200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,45.540700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,45.540800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,0.000000,45.540800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,45.540700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,45.540800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.242700,-1.535000,45.540800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,0.000000,45.540700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,44.415300>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,64.279987,0> translate<21.242700,0.000000,45.540700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.242700,-1.535000,45.540700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,44.415300>}
box{<0,0,-0.127000><1.249115,0.035000,0.127000> rotate<0,64.279987,0> translate<21.242700,-1.535000,45.540700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310900,0.000000,18.034000>}
box{<0,0,-0.127000><24.032200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310900,-1.535000,18.034000>}
box{<0,0,-0.127000><24.032200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,22.606000>}
box{<0,0,-0.127000><1.111600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310900,-1.535000,22.606000>}
box{<0,0,-0.127000><24.032200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.894000>}
box{<0,0,-0.127000><1.720300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,-1.535000,40.894000>}
box{<0,0,-0.127000><7.362400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.311000,0.000000,45.466000>}
box{<0,0,-0.127000><24.032300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.278700,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.311000,-1.535000,45.466000>}
box{<0,0,-0.127000><24.032300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.278700,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.369000,0.000000,25.120600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.855600,0.000000,23.634100>}
box{<0,0,-0.127000><2.102299,0.035000,0.127000> rotate<0,44.995103,0> translate<21.369000,0.000000,25.120600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.239000,0.000000,18.288000>}
box{<0,0,-0.127000><3.838000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137600,-1.535000,18.288000>}
box{<0,0,-0.127000><23.736600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.079200,0.000000,41.148000>}
box{<0,0,-0.127000><1.678200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,-1.535000,41.148000>}
box{<0,0,-0.127000><7.345300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401100,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,22.352000>}
box{<0,0,-0.127000><0.989200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401100,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137700,-1.535000,22.352000>}
box{<0,0,-0.127000><23.736600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401100,0.000000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137800,0.000000,45.212000>}
box{<0,0,-0.127000><23.736700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401100,0.000000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.401100,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137800,-1.535000,45.212000>}
box{<0,0,-0.127000><23.736700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.401100,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523300,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.571500,0.000000,18.542000>}
box{<0,0,-0.127000><1.048200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523300,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523300,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979500,-1.535000,18.542000>}
box{<0,0,-0.127000><23.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523300,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523300,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,41.402000>}
box{<0,0,-0.127000><3.915000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523300,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523300,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,-1.535000,41.402000>}
box{<0,0,-0.127000><7.412200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523300,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523400,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,22.098000>}
box{<0,0,-0.127000><0.866900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523400,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523400,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979600,-1.535000,22.098000>}
box{<0,0,-0.127000><23.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523400,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523400,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979600,0.000000,44.958000>}
box{<0,0,-0.127000><23.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523400,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.523400,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979600,-1.535000,44.958000>}
box{<0,0,-0.127000><23.456200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.523400,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,18.796000>}
box{<0,0,-0.127000><0.744600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901100,-1.535000,18.796000>}
box{<0,0,-0.127000><23.255400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,21.844000>}
box{<0,0,-0.127000><0.744600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901300,-1.535000,21.844000>}
box{<0,0,-0.127000><23.255600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,0.000000,41.656000>}
box{<0,0,-0.127000><7.671400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,-1.535000,41.656000>}
box{<0,0,-0.127000><7.671400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.207100,0.000000,44.704000>}
box{<0,0,-0.127000><1.561400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.645700,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901300,-1.535000,44.704000>}
box{<0,0,-0.127000><23.255600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.645700,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,19.050000>}
box{<0,0,-0.127000><0.622300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822800,-1.535000,19.050000>}
box{<0,0,-0.127000><23.054800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,21.590000>}
box{<0,0,-0.127000><0.622300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822900,-1.535000,21.590000>}
box{<0,0,-0.127000><23.054900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822800,0.000000,41.910000>}
box{<0,0,-0.127000><23.054800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822800,-1.535000,41.910000>}
box{<0,0,-0.127000><23.054800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,44.450000>}
box{<0,0,-0.127000><1.281800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.768000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822900,-1.535000,44.450000>}
box{<0,0,-0.127000><23.054900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.768000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,19.084600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,19.084700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,0.000000,19.084700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,19.084600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,19.084700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,-1.535000,19.084700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,19.084700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,20.320000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<21.784700,0.000000,19.084700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,19.084700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,20.320000>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,-81.422813,0> translate<21.784700,-1.535000,19.084700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,21.555200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,21.555300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,0.000000,21.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,21.555200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,21.555300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,-1.535000,21.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,21.555200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,20.320000>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,81.422129,0> translate<21.784700,0.000000,21.555200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,21.555200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,20.320000>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,81.422129,0> translate<21.784700,-1.535000,21.555200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,41.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,41.944700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,0.000000,41.944700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,41.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,41.944700>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,-1.535000,41.944700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,41.944700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,43.179900>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,-81.422129,0> translate<21.784700,0.000000,41.944700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,41.944700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,43.179900>}
box{<0,0,-0.127000><1.249156,0.035000,0.127000> rotate<0,-81.422129,0> translate<21.784700,-1.535000,41.944700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,44.415200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,44.415300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,0.000000,44.415300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,44.415200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,44.415300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<21.784700,-1.535000,44.415300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,0.000000,44.415200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,43.179900>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,81.422813,0> translate<21.784700,0.000000,44.415200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.784700,-1.535000,44.415200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,43.179900>}
box{<0,0,-0.127000><1.249254,0.035000,0.127000> rotate<0,81.422813,0> translate<21.784700,-1.535000,44.415200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817700,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,19.304000>}
box{<0,0,-0.127000><0.572600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817700,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817700,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744400,-1.535000,19.304000>}
box{<0,0,-0.127000><22.926700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817700,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817700,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744400,0.000000,42.164000>}
box{<0,0,-0.127000><22.926700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817700,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817700,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744400,-1.535000,42.164000>}
box{<0,0,-0.127000><22.926700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817700,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817800,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744600,0.000000,21.336000>}
box{<0,0,-0.127000><22.926800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817800,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817800,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744600,-1.535000,21.336000>}
box{<0,0,-0.127000><22.926800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817800,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817800,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,44.196000>}
box{<0,0,-0.127000><1.232000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817800,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.817800,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744600,-1.535000,44.196000>}
box{<0,0,-0.127000><22.926800,0.035000,0.127000> rotate<0,0.000000,0> translate<21.817800,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.818600,0.000000,33.240900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.131000,0.000000,33.553300>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.818600,0.000000,33.240900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,19.558000>}
box{<0,0,-0.127000><0.534300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856000,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666100,-1.535000,19.558000>}
box{<0,0,-0.127000><22.810100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856000,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.418000>}
box{<0,0,-0.127000><3.582300,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666100,-1.535000,42.418000>}
box{<0,0,-0.127000><22.810100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856000,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856100,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666200,0.000000,21.082000>}
box{<0,0,-0.127000><22.810100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856100,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856100,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666200,-1.535000,21.082000>}
box{<0,0,-0.127000><22.810100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856100,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856100,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,43.942000>}
box{<0,0,-0.127000><1.193700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856100,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.856100,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666200,-1.535000,43.942000>}
box{<0,0,-0.127000><22.810100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.856100,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894300,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,19.812000>}
box{<0,0,-0.127000><0.496000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894300,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894300,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,19.812000>}
box{<0,0,-0.127000><22.729500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894300,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894300,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.151000,0.000000,42.672000>}
box{<0,0,-0.127000><1.256700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894300,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894300,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.672000>}
box{<0,0,-0.127000><22.729500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894300,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894400,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.828000>}
box{<0,0,-0.127000><22.729400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894400,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894400,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.828000>}
box{<0,0,-0.127000><22.729400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894400,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894400,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,43.688000>}
box{<0,0,-0.127000><1.155400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894400,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.894400,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.688000>}
box{<0,0,-0.127000><22.729400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.894400,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,20.066000>}
box{<0,0,-0.127000><0.457700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.066000>}
box{<0,0,-0.127000><22.691200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,-1.535000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,42.926000>}
box{<0,0,-0.127000><1.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.926000>}
box{<0,0,-0.127000><22.691200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,0.000000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,43.434000>}
box{<0,0,-0.127000><1.117200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,0.000000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932600,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.434000>}
box{<0,0,-0.127000><22.691200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932600,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932700,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,20.574000>}
box{<0,0,-0.127000><0.457600,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932700,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.932700,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.574000>}
box{<0,0,-0.127000><22.691100,0.035000,0.127000> rotate<0,0.000000,0> translate<21.932700,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,20.320000>}
box{<0,0,-0.127000><0.419400,0.035000,0.127000> rotate<0,0.000000,0> translate<21.970900,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.320000>}
box{<0,0,-0.127000><22.652900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.970900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,43.180000>}
box{<0,0,-0.127000><1.078900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.970900,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.970900,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.180000>}
box{<0,0,-0.127000><22.652900,0.035000,0.127000> rotate<0,0.000000,0> translate<21.970900,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,25.874900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,32.037000>}
box{<0,0,-0.127000><6.162100,0.035000,0.127000> rotate<0,90.000000,0> translate<22.123300,0.000000,32.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,25.874900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155300,0.000000,23.842900>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<22.123300,0.000000,25.874900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.757600,0.000000,25.908000>}
box{<0,0,-0.127000><9.634300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.503600,0.000000,26.162000>}
box{<0,0,-0.127000><9.380300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.249600,0.000000,26.416000>}
box{<0,0,-0.127000><9.126300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.995600,0.000000,26.670000>}
box{<0,0,-0.127000><8.872300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,0.000000,26.924000>}
box{<0,0,-0.127000><3.176800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,0.000000,27.178000>}
box{<0,0,-0.127000><2.864000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817100,0.000000,27.432000>}
box{<0,0,-0.127000><2.693800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.711800,0.000000,27.686000>}
box{<0,0,-0.127000><2.588500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,27.940000>}
box{<0,0,-0.127000><2.578100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.712000,0.000000,28.194000>}
box{<0,0,-0.127000><2.588700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.817200,0.000000,28.448000>}
box{<0,0,-0.127000><2.693900,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987400,0.000000,28.702000>}
box{<0,0,-0.127000><2.864100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300400,0.000000,28.956000>}
box{<0,0,-0.127000><3.177100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,29.210000>}
box{<0,0,-0.127000><10.871300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169400,0.000000,29.464000>}
box{<0,0,-0.127000><3.046100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.915400,0.000000,29.718000>}
box{<0,0,-0.127000><2.792100,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.762100,0.000000,29.972000>}
box{<0,0,-0.127000><2.638800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.656800,0.000000,30.226000>}
box{<0,0,-0.127000><2.533500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,0.000000,30.480000>}
box{<0,0,-0.127000><4.419200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.657000,0.000000,30.734000>}
box{<0,0,-0.127000><2.533700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.762200,0.000000,30.988000>}
box{<0,0,-0.127000><2.638900,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.915500,0.000000,31.242000>}
box{<0,0,-0.127000><2.792200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.169500,0.000000,31.496000>}
box{<0,0,-0.127000><3.046200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,31.750000>}
box{<0,0,-0.127000><10.871300,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300100,0.000000,32.004000>}
box{<0,0,-0.127000><3.176800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.123300,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123300,0.000000,32.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.572900,0.000000,32.486600>}
box{<0,0,-0.127000><0.635830,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.123300,0.000000,32.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.131000,0.000000,33.553300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.827700,0.000000,33.553300>}
box{<0,0,-0.127000><2.696700,0.035000,0.127000> rotate<0,0.000000,0> translate<22.131000,0.000000,33.553300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.344200,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.011600,0.000000,25.654000>}
box{<0,0,-0.127000><9.667400,0.035000,0.127000> rotate<0,0.000000,0> translate<22.344200,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.344300,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.987300,0.000000,32.258000>}
box{<0,0,-0.127000><2.643000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.344300,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,18.723200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,18.529800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<22.390300,0.000000,18.723200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,20.596700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,18.723200>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.390300,0.000000,18.723200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,20.596700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,20.790100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.390300,0.000000,20.596700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,21.567200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,21.373800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<22.390300,0.000000,21.567200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,23.440700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,21.567200>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.390300,0.000000,21.567200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.390300,0.000000,23.440700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,23.634100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.390300,0.000000,23.440700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.572900,0.000000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.827700,0.000000,32.486600>}
box{<0,0,-0.127000><2.254800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.572900,0.000000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,18.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,18.529800>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.583700,0.000000,18.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,20.790100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,20.790100>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.583700,0.000000,20.790100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,21.373800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,21.373800>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.583700,0.000000,21.373800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.583700,0.000000,23.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.855600,0.000000,23.634100>}
box{<0,0,-0.127000><0.271900,0.035000,0.127000> rotate<0,0.000000,0> translate<22.583700,0.000000,23.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.598200,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.265600,0.000000,25.400000>}
box{<0,0,-0.127000><9.667400,0.035000,0.127000> rotate<0,0.000000,0> translate<22.598200,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.852200,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,25.146000>}
box{<0,0,-0.127000><28.252800,0.035000,0.127000> rotate<0,0.000000,0> translate<22.852200,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,39.252100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.222100,0.000000,39.029000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<22.999000,0.000000,39.252100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.033100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,39.252100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.999000,0.000000,39.252100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.033100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.002600,0.000000,40.033100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.999000,0.000000,40.033100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.286700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.002600,0.000000,40.286700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<22.999000,0.000000,40.286700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,41.067800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,40.286700>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.999000,0.000000,40.286700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.999000,0.000000,41.067800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.222100,0.000000,41.290900>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.999000,0.000000,41.067800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,42.773200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.243200,0.000000,42.579800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<23.049800,0.000000,42.773200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,44.546700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,42.773200>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.049800,0.000000,42.773200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.049800,0.000000,44.546700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.243200,0.000000,44.740100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.049800,0.000000,44.546700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.106200,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,24.892000>}
box{<0,0,-0.127000><27.998800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.106200,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.222100,0.000000,39.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.029000>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.222100,0.000000,39.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.222100,0.000000,41.290900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,41.290900>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.222100,0.000000,41.290900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.243200,0.000000,42.579800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.016700,0.000000,42.579800>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.243200,0.000000,42.579800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.243200,0.000000,44.740100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.016700,0.000000,44.740100>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.243200,0.000000,44.740100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.360200,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,24.638000>}
box{<0,0,-0.127000><27.744800,0.035000,0.127000> rotate<0,0.000000,0> translate<23.360200,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.614200,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.779800,0.000000,24.384000>}
box{<0,0,-0.127000><24.165600,0.035000,0.127000> rotate<0,0.000000,0> translate<23.614200,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.868200,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.132700,0.000000,24.130000>}
box{<0,0,-0.127000><23.264500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.868200,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.002600,0.000000,40.286700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.002600,0.000000,40.033100>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.002600,0.000000,40.033100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.032600>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<24.003100,0.000000,40.032600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.116000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.370000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.624000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.878000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.032600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.032600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,40.032600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.287300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,41.290900>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<24.003100,0.000000,41.290900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.287300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.287300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,40.287300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.386000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.640000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.894000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.003100,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,41.148000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.003100,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.122200,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.167200,0.000000,23.876000>}
box{<0,0,-0.127000><1.045000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.122200,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155300,0.000000,23.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155300,0.000000,23.842900>}
box{<0,0,-0.127000><0.208800,0.035000,0.127000> rotate<0,90.000000,0> translate<24.155300,0.000000,23.842900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.155300,0.000000,23.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,23.634100>}
box{<0,0,-0.127000><0.504900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.155300,0.000000,23.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.037800,0.000000,39.029000>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.256700,0.000000,39.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.032600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,39.029000>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.256700,0.000000,39.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,41.290900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,40.287300>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.256700,0.000000,40.287300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.256700,0.000000,41.290900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.037800,0.000000,41.290900>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.256700,0.000000,41.290900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257300,0.000000,40.033100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257300,0.000000,40.286700>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<24.257300,0.000000,40.286700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257300,0.000000,40.033100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.033100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.257300,0.000000,40.033100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257300,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,40.132000>}
box{<0,0,-0.127000><1.181000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.257300,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257300,0.000000,40.286700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.286700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<24.257300,0.000000,40.286700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.241200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,0.000000,29.800100>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,67.496610,0> translate<24.650600,0.000000,30.241200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.241200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,-1.535000,29.800100>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,67.496610,0> translate<24.650600,-1.535000,30.241200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.241200>}
box{<0,0,-0.127000><0.111800,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.650600,0.000000,30.241200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.241200>}
box{<0,0,-0.127000><0.111800,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.650600,-1.535000,30.241200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,0.000000,30.353000>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.650600,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,-1.535000,30.353000>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.650600,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,0.000000,30.606800>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.650600,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,-1.535000,30.606800>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<24.650600,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.718700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.606800>}
box{<0,0,-0.127000><0.111900,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.650600,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.718700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.606800>}
box{<0,0,-0.127000><0.111900,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.650600,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,0.000000,30.718700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,0.000000,31.159800>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-67.496610,0> translate<24.650600,0.000000,30.718700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650600,-1.535000,30.718700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,-1.535000,31.159800>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-67.496610,0> translate<24.650600,-1.535000,30.718700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,18.529800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,18.723200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.660200,0.000000,18.529800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,20.790100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.596700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<24.660200,0.000000,20.790100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,21.373800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,21.567200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.660200,0.000000,21.373800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.660200,0.000000,23.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,23.440700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<24.660200,0.000000,23.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.672300,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,23.622000>}
box{<0,0,-0.127000><0.358700,0.035000,0.127000> rotate<0,0.000000,0> translate<24.672300,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.672400,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,18.542000>}
box{<0,0,-0.127000><0.409400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.672400,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,27.711300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,27.288900>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,67.491355,0> translate<24.701400,0.000000,27.711300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,27.711300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,27.288900>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,67.491355,0> translate<24.701400,-1.535000,27.711300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,27.711300>}
box{<0,0,-0.127000><0.457300,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.701400,0.000000,27.711300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,27.711300>}
box{<0,0,-0.127000><0.457300,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.701400,-1.535000,27.711300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,28.591000>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-67.491355,0> translate<24.701400,0.000000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,28.168600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,28.591000>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-67.491355,0> translate<24.701400,-1.535000,28.168600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,32.368900>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,67.491355,0> translate<24.701400,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,33.248600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,32.791300>}
box{<0,0,-0.127000><0.457300,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.701400,-1.535000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,33.248600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,33.671000>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-67.491355,0> translate<24.701400,-1.535000,33.248600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,35.331300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,34.908900>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,67.491355,0> translate<24.701400,0.000000,35.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,35.331300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,34.908900>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,67.491355,0> translate<24.701400,-1.535000,35.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,35.331300>}
box{<0,0,-0.127000><0.457300,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.701400,0.000000,35.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,35.331300>}
box{<0,0,-0.127000><0.457300,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.701400,-1.535000,35.331300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,0.000000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,36.211000>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-67.491355,0> translate<24.701400,0.000000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701400,-1.535000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,36.211000>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-67.491355,0> translate<24.701400,-1.535000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.827700,0.000000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,32.368900>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,67.517543,0> translate<24.827700,0.000000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.827700,0.000000,33.553300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,33.671000>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,-67.517543,0> translate<24.827700,0.000000,33.553300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,0.000000,29.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,0.000000,29.462500>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<24.833300,0.000000,29.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,-1.535000,29.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,-1.535000,29.462500>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<24.833300,-1.535000,29.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,0.000000,31.159800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,0.000000,31.497400>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.833300,0.000000,31.159800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.833300,-1.535000,31.159800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,-1.535000,31.497400>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.833300,-1.535000,31.159800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,18.723200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,19.126600>}
box{<0,0,-0.127000><0.403400,0.035000,0.127000> rotate<0,90.000000,0> translate<24.853600,0.000000,19.126600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,18.796000>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,19.050000>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,19.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,19.126600>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,19.126600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.193300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.596700>}
box{<0,0,-0.127000><0.403400,0.035000,0.127000> rotate<0,90.000000,0> translate<24.853600,0.000000,20.596700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.193300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,20.193300>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,20.193300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.183100,0.000000,20.320000>}
box{<0,0,-0.127000><0.329500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.574000>}
box{<0,0,-0.127000><19.770200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,21.567200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,23.440700>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.853600,0.000000,23.440700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822900,0.000000,21.590000>}
box{<0,0,-0.127000><19.969300,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.111100,0.000000,21.844000>}
box{<0,0,-0.127000><0.257500,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.098000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.352000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.606000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.034600,0.000000,22.860000>}
box{<0,0,-0.127000><1.181000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,23.114000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.853600,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,23.368000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.853600,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,27.288900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,26.965600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,0.000000,27.288900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,27.288900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,26.965600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,-1.535000,27.288900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,28.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,28.914300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,0.000000,28.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,28.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,28.914300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,-1.535000,28.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,32.368900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,32.045600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,0.000000,32.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,32.368900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,32.045600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,-1.535000,32.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,33.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,33.994300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,0.000000,33.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,33.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,33.994300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,-1.535000,33.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,34.908900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,34.585600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,0.000000,34.908900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,34.908900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,34.585600>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<24.876400,-1.535000,34.908900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,0.000000,36.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,36.534300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,0.000000,36.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.876400,-1.535000,36.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,36.534300>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.876400,-1.535000,36.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.016700,0.000000,42.579800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,42.773200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.016700,0.000000,42.579800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.016700,0.000000,44.740100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,44.546700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<25.016700,0.000000,44.740100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,21.924100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.254100,0.000000,21.701000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<25.031000,0.000000,21.924100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.705100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,21.924100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.031000,0.000000,21.924100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.705100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.034600,0.000000,22.705100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<25.031000,0.000000,22.705100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.958700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.034600,0.000000,22.958700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<25.031000,0.000000,22.958700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,23.739800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,22.958700>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.031000,0.000000,22.958700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.031000,0.000000,23.739800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.254100,0.000000,23.962900>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.031000,0.000000,23.739800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.037800,0.000000,39.029000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,39.252100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.037800,0.000000,39.029000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.037800,0.000000,41.290900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,41.067800>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<25.037800,0.000000,41.290900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.052800,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901300,0.000000,44.704000>}
box{<0,0,-0.127000><19.848500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.052800,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,18.445200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.275200,0.000000,18.251800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<25.081800,0.000000,18.445200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,19.126600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,18.445200>}
box{<0,0,-0.127000><0.681400,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.081800,0.000000,18.445200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,20.218700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,20.193300>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.081800,0.000000,20.193300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.081800,0.000000,20.218700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.275200,0.000000,20.412100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.081800,0.000000,20.218700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.108900,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.672000>}
box{<0,0,-0.127000><0.329400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.108900,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.124800,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,39.116000>}
box{<0,0,-0.127000><1.011800,0.035000,0.127000> rotate<0,0.000000,0> translate<25.124800,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,0.000000,29.462500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,0.000000,29.279800>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<25.170900,0.000000,29.462500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,-1.535000,29.462500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,-1.535000,29.279800>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<25.170900,-1.535000,29.462500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,0.000000,31.497400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,0.000000,31.680100>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<25.170900,0.000000,31.497400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.170900,-1.535000,31.497400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,-1.535000,31.680100>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<25.170900,-1.535000,31.497400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.180700,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,41.148000>}
box{<0,0,-0.127000><0.257600,0.035000,0.127000> rotate<0,0.000000,0> translate<25.180700,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,26.965600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,26.790600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,0.000000,26.965600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,26.965600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,26.790600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,-1.535000,26.965600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,28.914300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,29.089300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,0.000000,28.914300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,28.914300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,29.089300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,-1.535000,28.914300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,32.045600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,31.870600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,0.000000,32.045600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,32.045600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,31.870600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,-1.535000,32.045600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,33.994300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,34.169300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,0.000000,33.994300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,33.994300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,34.169300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,-1.535000,33.994300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,34.585600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,34.410600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,0.000000,34.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,34.585600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,34.410600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<25.199700,-1.535000,34.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,0.000000,36.534300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,36.709300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,0.000000,36.534300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.199700,-1.535000,36.534300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,36.709300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<25.199700,-1.535000,36.534300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,42.773200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,42.798600>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,90.000000,0> translate<25.210100,0.000000,42.798600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,42.798600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.798600>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.210100,0.000000,42.798600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,43.865300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,44.546700>}
box{<0,0,-0.127000><0.681400,0.035000,0.127000> rotate<0,90.000000,0> translate<25.210100,0.000000,44.546700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,43.865300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,43.865300>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.210100,0.000000,43.865300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,43.942000>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.210100,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,44.196000>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.210100,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.210100,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.619600,0.000000,44.450000>}
box{<0,0,-0.127000><0.409500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.210100,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.254100,0.000000,21.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,21.701000>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.254100,0.000000,21.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.254100,0.000000,23.962900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.962900>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.254100,0.000000,23.962900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,39.252100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.033100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.260900,0.000000,40.033100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.619500,0.000000,39.370000>}
box{<0,0,-0.127000><0.358600,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,39.624000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,39.878000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.286700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,41.067800>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,90.000000,0> translate<25.260900,0.000000,41.067800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,40.386000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,40.640000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.260900,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,40.894000>}
box{<0,0,-0.127000><0.177400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.260900,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.275200,0.000000,18.251800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.048700,0.000000,18.251800>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.275200,0.000000,18.251800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.275200,0.000000,20.412100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.048700,0.000000,20.412100>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.275200,0.000000,20.412100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,39.551200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,39.357800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<25.438300,0.000000,39.551200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,41.424700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,39.551200>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.438300,0.000000,39.551200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,41.424700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,41.618100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.438300,0.000000,41.424700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.395200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,42.201800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<25.438300,0.000000,42.395200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.798600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,42.395200>}
box{<0,0,-0.127000><0.403400,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.438300,0.000000,42.395200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,44.268700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,43.865300>}
box{<0,0,-0.127000><0.403400,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.438300,0.000000,43.865300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.438300,0.000000,44.268700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,44.462100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.438300,0.000000,44.268700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,0.000000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,29.279800>}
box{<0,0,-0.127000><0.931000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.612000,0.000000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,-1.535000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,29.279800>}
box{<0,0,-0.127000><0.931000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.612000,-1.535000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,0.000000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,31.680100>}
box{<0,0,-0.127000><0.931000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.612000,0.000000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.612000,-1.535000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,31.680100>}
box{<0,0,-0.127000><0.931000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.612000,-1.535000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,26.790600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,26.790600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,26.790600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,26.790600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,26.790600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,26.790600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,29.089300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,29.089300>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,29.089300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,29.089300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,29.089300>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,29.089300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,31.870600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,31.870600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,31.870600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,31.870600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,31.870600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,31.870600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,34.169300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,34.169300>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,34.169300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,34.169300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,34.169300>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,34.169300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,34.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,34.410600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,34.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,34.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,34.410600>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,34.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,0.000000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,36.709300>}
box{<0,0,-0.127000><0.514500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,0.000000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.622100,-1.535000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,36.709300>}
box{<0,0,-0.127000><2.095700,0.035000,0.127000> rotate<0,0.000000,0> translate<25.622100,-1.535000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,39.357800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,39.357800>}
box{<0,0,-0.127000><0.504900,0.035000,0.127000> rotate<0,0.000000,0> translate<25.631700,0.000000,39.357800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,41.618100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,41.618100>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.631700,0.000000,41.618100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,42.201800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,42.201800>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.631700,0.000000,42.201800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.631700,0.000000,44.462100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,44.462100>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,0.000000,0> translate<25.631700,0.000000,44.462100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.034600,0.000000,22.958700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.034600,0.000000,22.705100>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.034600,0.000000,22.705100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,21.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.704600>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.035100,0.000000,22.704600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,21.844000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.098000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.352000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.606000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.704600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.704600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,22.704600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.959300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.962900>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.035100,0.000000,23.962900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,22.959300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.959300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,22.959300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.114000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.368000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.622000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.035100,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.876000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.035100,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,39.357800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.136600,0.000000,36.709300>}
box{<0,0,-0.127000><2.648500,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.136600,0.000000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,21.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.069800,0.000000,21.701000>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.288700,0.000000,21.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.704600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,21.701000>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.288700,0.000000,21.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.962900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,22.959300>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.288700,0.000000,22.959300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.288700,0.000000,23.962900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.069800,0.000000,23.962900>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.288700,0.000000,23.962900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289300,0.000000,22.705100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289300,0.000000,22.958700>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.289300,0.000000,22.958700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289300,0.000000,22.705100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.705100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.289300,0.000000,22.705100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289300,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.484200,0.000000,22.860000>}
box{<0,0,-0.127000><19.194900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.289300,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289300,0.000000,22.958700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.958700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<26.289300,0.000000,22.958700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,0.000000,30.353000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.542500,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.542500,-1.535000,30.353000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.542500,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.352500>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,90.000000,0> translate<26.543000,0.000000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.352500>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,90.000000,0> translate<26.543000,-1.535000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,29.464000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,29.464000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,29.718000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,29.718000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,29.972000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,29.972000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.226000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.226000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.352500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.352500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,31.680100>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,90.000000,0> translate<26.543000,0.000000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,31.680100>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,90.000000,0> translate<26.543000,-1.535000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.607400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.607400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.734000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.734000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.988000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.988000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,31.242000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,31.242000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,31.496000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,31.496000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<26.543000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,0.000000,29.279800>}
box{<0,0,-0.127000><0.931100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.796800,0.000000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,-1.535000,29.279800>}
box{<0,0,-0.127000><0.931100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.796800,-1.535000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,29.279800>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.796800,0.000000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,29.279800>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.796800,-1.535000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,30.607400>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.796800,0.000000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,30.607400>}
box{<0,0,-0.127000><1.072700,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.796800,-1.535000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,0.000000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,0.000000,31.680100>}
box{<0,0,-0.127000><0.931100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.796800,0.000000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.796800,-1.535000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,-1.535000,31.680100>}
box{<0,0,-0.127000><0.931100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.796800,-1.535000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,0.000000,30.606800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<26.797400,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,-1.535000,30.606800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<26.797400,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,0.000000,30.353000>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,-1.535000,30.353000>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,0.000000,30.480000>}
box{<0,0,-0.127000><3.555100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,-1.535000,30.480000>}
box{<0,0,-0.127000><3.555100,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,0.000000,30.606800>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797400,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,-1.535000,30.606800>}
box{<0,0,-0.127000><1.891900,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797400,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.048700,0.000000,18.251800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,18.445200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.048700,0.000000,18.251800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.048700,0.000000,20.412100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,20.218700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<27.048700,0.000000,20.412100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.069800,0.000000,21.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,21.924100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.069800,0.000000,21.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.069800,0.000000,23.962900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,23.739800>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<27.069800,0.000000,23.962900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.084900,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137600,0.000000,18.288000>}
box{<0,0,-0.127000><18.052700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.084900,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.140800,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.320000>}
box{<0,0,-0.127000><17.483000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.140800,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.156700,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.580400,0.000000,23.876000>}
box{<0,0,-0.127000><19.423700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.156700,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,39.357800>}
box{<0,0,-0.127000><2.648500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.203300,0.000000,39.357800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,36.709300>}
box{<0,0,-0.127000><0.514500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.531200,0.000000,36.830000>}
box{<0,0,-0.127000><5.327900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,0.000000,37.084000>}
box{<0,0,-0.127000><2.113400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,0.000000,37.338000>}
box{<0,0,-0.127000><1.732100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,0.000000,37.592000>}
box{<0,0,-0.127000><1.542900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,0.000000,37.846000>}
box{<0,0,-0.127000><1.437700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,38.100000>}
box{<0,0,-0.127000><1.422500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,0.000000,38.354000>}
box{<0,0,-0.127000><1.437800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,0.000000,38.608000>}
box{<0,0,-0.127000><1.543000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,0.000000,38.862000>}
box{<0,0,-0.127000><1.732200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,0.000000,39.116000>}
box{<0,0,-0.127000><2.113800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.203300,0.000000,39.357800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,39.357800>}
box{<0,0,-0.127000><0.504900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.203300,0.000000,39.357800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.212800,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901300,0.000000,21.844000>}
box{<0,0,-0.127000><17.688500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.212800,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,18.445200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,20.218700>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.242100,0.000000,20.218700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979500,0.000000,18.542000>}
box{<0,0,-0.127000><17.737400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901100,0.000000,18.796000>}
box{<0,0,-0.127000><17.659000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822800,0.000000,19.050000>}
box{<0,0,-0.127000><17.580700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744400,0.000000,19.304000>}
box{<0,0,-0.127000><17.502300,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666100,0.000000,19.558000>}
box{<0,0,-0.127000><17.424000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,19.812000>}
box{<0,0,-0.127000><17.381700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.242100,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.066000>}
box{<0,0,-0.127000><17.381700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.242100,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,21.924100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.705100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.292900,0.000000,22.705100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979600,0.000000,22.098000>}
box{<0,0,-0.127000><17.686700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137700,0.000000,22.352000>}
box{<0,0,-0.127000><17.844800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310900,0.000000,22.606000>}
box{<0,0,-0.127000><18.018000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,22.958700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,23.739800>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,90.000000,0> translate<27.292900,0.000000,23.739800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.657400,0.000000,23.114000>}
box{<0,0,-0.127000><18.364500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.943600,0.000000,23.368000>}
box{<0,0,-0.127000><18.650700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.292900,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.262000,0.000000,23.622000>}
box{<0,0,-0.127000><18.969100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.292900,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,39.357800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,39.551200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.708200,0.000000,39.357800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,41.618100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,41.424700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<27.708200,0.000000,41.618100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,42.201800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,42.395200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.708200,0.000000,42.201800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.708200,0.000000,44.462100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,44.268700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<27.708200,0.000000,44.462100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,26.790600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,26.965600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,0.000000,26.790600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,26.790600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,26.965600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,-1.535000,26.790600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,29.089300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,28.914300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,0.000000,29.089300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,29.089300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,28.914300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,-1.535000,29.089300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,31.870600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,32.045600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,0.000000,31.870600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,31.870600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,32.045600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,-1.535000,31.870600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,34.169300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,33.994300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,0.000000,34.169300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,34.169300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,33.994300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,-1.535000,34.169300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,34.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,34.585600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,0.000000,34.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,34.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,34.585600>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,-22.502705,0> translate<27.717800,-1.535000,34.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,0.000000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,36.534300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,0.000000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.717800,-1.535000,36.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,36.534300>}
box{<0,0,-0.127000><0.457216,0.035000,0.127000> rotate<0,22.502705,0> translate<27.717800,-1.535000,36.709300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.720300,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.822900,0.000000,44.450000>}
box{<0,0,-0.127000><17.102600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.720300,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.720400,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.265800,0.000000,39.370000>}
box{<0,0,-0.127000><4.545400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.720400,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,0.000000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,0.000000,29.462500>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<27.727900,0.000000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,-1.535000,29.279800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,-1.535000,29.462500>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,-22.497451,0> translate<27.727900,-1.535000,29.279800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,0.000000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,0.000000,31.497400>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<27.727900,0.000000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.727900,-1.535000,31.680100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,-1.535000,31.497400>}
box{<0,0,-0.127000><0.477440,0.035000,0.127000> rotate<0,22.497451,0> translate<27.727900,-1.535000,31.680100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,39.551200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,41.424700>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.901600,0.000000,41.424700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,0.000000,39.624000>}
box{<0,0,-0.127000><1.415100,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,0.000000,39.878000>}
box{<0,0,-0.127000><1.033800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,0.000000,40.132000>}
box{<0,0,-0.127000><0.844600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,0.000000,40.386000>}
box{<0,0,-0.127000><0.739400,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,40.640000>}
box{<0,0,-0.127000><0.724200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,0.000000,40.894000>}
box{<0,0,-0.127000><0.739500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,0.000000,41.148000>}
box{<0,0,-0.127000><0.844700,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,0.000000,41.402000>}
box{<0,0,-0.127000><1.033900,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,42.395200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,44.268700>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.901600,0.000000,44.268700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666100,0.000000,42.418000>}
box{<0,0,-0.127000><16.764500,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.672000>}
box{<0,0,-0.127000><16.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.926000>}
box{<0,0,-0.127000><16.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.180000>}
box{<0,0,-0.127000><16.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.434000>}
box{<0,0,-0.127000><16.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.688000>}
box{<0,0,-0.127000><16.722200,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.666200,0.000000,43.942000>}
box{<0,0,-0.127000><16.764600,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.901600,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.744600,0.000000,44.196000>}
box{<0,0,-0.127000><16.843000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.901600,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,0.000000,28.956000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,-1.535000,28.956000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,0.000000,34.036000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,-1.535000,34.036000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,0.000000,36.576000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039600,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.317100,-1.535000,36.576000>}
box{<0,0,-0.127000><1.277500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039600,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,0.000000,26.924000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,-1.535000,26.924000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,0.000000,32.004000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,-1.535000,32.004000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,0.000000,34.544000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.039700,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.316700,-1.535000,34.544000>}
box{<0,0,-0.127000><1.277000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.039700,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,26.965600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,27.288900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,0.000000,26.965600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,26.965600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,27.288900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,-1.535000,26.965600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,28.914300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,28.591000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,0.000000,28.914300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,28.914300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,28.591000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,-1.535000,28.914300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,32.045600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,32.368900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,0.000000,32.045600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,32.045600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,32.368900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,-1.535000,32.045600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,33.994300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,33.671000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,0.000000,33.994300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,33.994300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,33.671000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,-1.535000,33.994300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,34.585600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,34.908900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,0.000000,34.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,34.585600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,34.908900>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.140200,-1.535000,34.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,0.000000,36.534300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,36.211000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,0.000000,36.534300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.140200,-1.535000,36.534300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,36.211000>}
box{<0,0,-0.127000><0.457215,0.035000,0.127000> rotate<0,44.997030,0> translate<28.140200,-1.535000,36.534300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,0.000000,29.462500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,0.000000,29.800100>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.169000,0.000000,29.462500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,-1.535000,29.462500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,-1.535000,29.800100>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.169000,-1.535000,29.462500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,0.000000,31.497400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,0.000000,31.159800>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<28.169000,0.000000,31.497400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.169000,-1.535000,31.497400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,-1.535000,31.159800>}
box{<0,0,-0.127000><0.477438,0.035000,0.127000> rotate<0,44.997030,0> translate<28.169000,-1.535000,31.497400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170400,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184300,0.000000,31.496000>}
box{<0,0,-0.127000><1.013900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170400,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170400,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184300,-1.535000,31.496000>}
box{<0,0,-0.127000><1.013900,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170400,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170500,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.183900,0.000000,29.464000>}
box{<0,0,-0.127000><1.013400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170500,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.170500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.183900,-1.535000,29.464000>}
box{<0,0,-0.127000><1.013400,0.035000,0.127000> rotate<0,0.000000,0> translate<28.170500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,0.000000,28.702000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,-1.535000,28.702000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,0.000000,33.782000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,-1.535000,33.782000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,0.000000,36.322000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935500,-1.535000,36.322000>}
box{<0,0,-0.127000><0.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,0.000000,27.178000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,27.178000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,0.000000,32.258000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,32.258000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,0.000000,34.798000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.352600,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.935400,-1.535000,34.798000>}
box{<0,0,-0.127000><0.582800,0.035000,0.127000> rotate<0,0.000000,0> translate<28.352600,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.424400,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.863600,0.000000,31.242000>}
box{<0,0,-0.127000><0.439200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.424400,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.424400,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.863600,-1.535000,31.242000>}
box{<0,0,-0.127000><0.439200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.424400,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.424500,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.863500,0.000000,29.718000>}
box{<0,0,-0.127000><0.439000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.424500,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.424500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.863500,-1.535000,29.718000>}
box{<0,0,-0.127000><0.439000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.424500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,27.288900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,27.406600>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,-67.517543,0> translate<28.463500,-1.535000,27.288900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,27.288900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,27.701800>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,-67.498954,0> translate<28.463500,0.000000,27.288900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,28.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,28.473300>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,67.517543,0> translate<28.463500,-1.535000,28.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,28.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,28.178100>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,67.498954,0> translate<28.463500,0.000000,28.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,32.368900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,32.486600>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,-67.517543,0> translate<28.463500,-1.535000,32.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,32.368900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,32.781800>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,-67.498954,0> translate<28.463500,0.000000,32.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,33.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,33.553300>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,67.517543,0> translate<28.463500,-1.535000,33.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,33.671000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,33.258100>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,67.498954,0> translate<28.463500,0.000000,33.671000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,34.908900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,35.026600>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,-67.517543,0> translate<28.463500,-1.535000,34.908900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,34.908900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,35.321800>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,-67.498954,0> translate<28.463500,0.000000,34.908900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,-1.535000,36.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,36.093300>}
box{<0,0,-0.127000><0.127377,0.035000,0.127000> rotate<0,67.517543,0> translate<28.463500,-1.535000,36.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.463500,0.000000,36.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,35.798100>}
box{<0,0,-0.127000><0.446909,0.035000,0.127000> rotate<0,67.498954,0> translate<28.463500,0.000000,36.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,0.000000,29.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,30.109100>}
box{<0,0,-0.127000><0.334424,0.035000,0.127000> rotate<0,-67.510105,0> translate<28.506600,0.000000,29.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,-1.535000,29.800100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,-1.535000,30.109100>}
box{<0,0,-0.127000><0.334424,0.035000,0.127000> rotate<0,-67.510105,0> translate<28.506600,-1.535000,29.800100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,0.000000,31.159800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,30.850800>}
box{<0,0,-0.127000><0.334424,0.035000,0.127000> rotate<0,67.510105,0> translate<28.506600,0.000000,31.159800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.506600,-1.535000,31.159800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,-1.535000,30.850800>}
box{<0,0,-0.127000><0.334424,0.035000,0.127000> rotate<0,67.510105,0> translate<28.506600,-1.535000,31.159800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,27.406600>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,28.473300>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,32.486600>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,33.553300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,33.553300>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,33.553300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,35.026600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,35.026600>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,35.026600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.512200,-1.535000,36.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,36.093300>}
box{<0,0,-0.127000><0.244600,0.035000,0.127000> rotate<0,0.000000,0> translate<28.512200,-1.535000,36.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522700,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,0.000000,27.432000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522700,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522700,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,0.000000,32.512000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522700,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522700,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746200,0.000000,35.052000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522700,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522800,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,0.000000,28.448000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522800,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522800,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,0.000000,33.528000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522800,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.522800,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.746300,0.000000,36.068000>}
box{<0,0,-0.127000><0.223500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.522800,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.577700,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.691200,0.000000,29.972000>}
box{<0,0,-0.127000><0.113500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.577700,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.577700,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.691200,-1.535000,29.972000>}
box{<0,0,-0.127000><0.113500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.577700,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.577800,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.691300,0.000000,30.988000>}
box{<0,0,-0.127000><0.113500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.577800,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.577800,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.691300,-1.535000,30.988000>}
box{<0,0,-0.127000><0.113500,0.035000,0.127000> rotate<0,0.000000,0> translate<28.577800,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,37.882700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,37.481300>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<28.625800,0.000000,37.882700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,37.882700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,37.481300>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<28.625800,-1.535000,37.882700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,38.317200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,37.882700>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.625800,0.000000,37.882700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,38.317200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,37.882700>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.625800,-1.535000,37.882700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,38.317200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,38.718600>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<28.625800,0.000000,38.317200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,38.317200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,38.718600>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<28.625800,-1.535000,38.317200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,40.422700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,40.021300>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<28.625800,0.000000,40.422700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,40.422700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,40.021300>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<28.625800,-1.535000,40.422700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,40.857200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,40.422700>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.625800,0.000000,40.422700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,40.857200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,40.422700>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.625800,-1.535000,40.422700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,0.000000,40.857200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,41.258600>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<28.625800,0.000000,40.857200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.625800,-1.535000,40.857200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,41.258600>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<28.625800,-1.535000,40.857200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.627900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,0.000000,27.686000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.627900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.627900,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,0.000000,32.766000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.627900,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.627900,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641000,0.000000,35.306000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.627900,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,0.000000,28.194000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.628000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,0.000000,33.274000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.628000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.628000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.641100,0.000000,35.814000>}
box{<0,0,-0.127000><0.013100,0.035000,0.127000> rotate<0,0.000000,0> translate<28.628000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,27.701800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,27.321300>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,67.496607,0> translate<28.634500,0.000000,27.701800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,28.178100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,28.558600>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,-67.496607,0> translate<28.634500,0.000000,28.178100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,30.109100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,0.000000,29.832500>}
box{<0,0,-0.127000><0.299362,0.035000,0.127000> rotate<0,67.508182,0> translate<28.634500,0.000000,30.109100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,-1.535000,30.109100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,-1.535000,29.832500>}
box{<0,0,-0.127000><0.299362,0.035000,0.127000> rotate<0,67.508182,0> translate<28.634500,-1.535000,30.109100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,30.850800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,0.000000,31.127400>}
box{<0,0,-0.127000><0.299362,0.035000,0.127000> rotate<0,-67.508182,0> translate<28.634500,0.000000,30.850800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,-1.535000,30.850800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,-1.535000,31.127400>}
box{<0,0,-0.127000><0.299362,0.035000,0.127000> rotate<0,-67.508182,0> translate<28.634500,-1.535000,30.850800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,32.781800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,32.401300>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,67.496607,0> translate<28.634500,0.000000,32.781800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,33.258100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,33.638600>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,-67.496607,0> translate<28.634500,0.000000,33.258100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,35.321800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,34.941300>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,67.496607,0> translate<28.634500,0.000000,35.321800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.634500,0.000000,35.798100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,36.178600>}
box{<0,0,-0.127000><0.411847,0.035000,0.127000> rotate<0,-67.496607,0> translate<28.634500,0.000000,35.798100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,0.000000,30.353000>}
box{<0,0,-0.127000><1.663200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.689300,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,-1.535000,30.353000>}
box{<0,0,-0.127000><1.663200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.689300,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,0.000000,30.606800>}
box{<0,0,-0.127000><1.663200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.689300,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.689300,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,-1.535000,30.606800>}
box{<0,0,-0.127000><1.663200,0.035000,0.127000> rotate<0,0.000000,0> translate<28.689300,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,0.000000,29.832500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,0.000000,29.511000>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<28.749000,0.000000,29.832500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,-1.535000,29.832500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,-1.535000,29.511000>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<28.749000,-1.535000,29.832500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,0.000000,31.127400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,0.000000,31.448900>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.749000,0.000000,31.127400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.749000,-1.535000,31.127400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,-1.535000,31.448900>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.749000,-1.535000,31.127400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,27.321300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<28.756800,-1.535000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,28.558600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<28.756800,-1.535000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,32.401300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<28.756800,-1.535000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,33.553300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,33.638600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<28.756800,-1.535000,33.553300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,35.026600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,34.941300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<28.756800,-1.535000,35.026600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.756800,-1.535000,36.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,36.178600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<28.756800,-1.535000,36.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,27.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,27.014100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,0.000000,27.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,27.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,27.014100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,-1.535000,27.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,28.558600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,28.865800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,0.000000,28.558600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,28.558600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,28.865800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,-1.535000,28.558600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,32.401300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,32.094100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,0.000000,32.401300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,32.401300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,32.094100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,-1.535000,32.401300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,33.638600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,33.945800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,0.000000,33.638600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,33.638600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,33.945800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,-1.535000,33.638600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,34.941300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,34.634100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,0.000000,34.941300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,34.941300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,34.634100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,-1.535000,34.941300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,36.178600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,36.485800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,0.000000,36.178600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,36.178600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,36.485800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,-1.535000,36.178600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,37.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,37.174100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,0.000000,37.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,37.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,37.174100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,-1.535000,37.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,38.718600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,39.025800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,0.000000,38.718600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,38.718600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,39.025800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,-1.535000,38.718600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,40.021300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,39.714100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,0.000000,40.021300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,40.021300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,39.714100>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<28.792100,-1.535000,40.021300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,0.000000,41.258600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,41.565800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,0.000000,41.258600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.792100,-1.535000,41.258600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,41.565800>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.792100,-1.535000,41.258600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,0.000000,29.511000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,0.000000,29.337000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<29.070500,0.000000,29.511000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,-1.535000,29.511000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,-1.535000,29.337000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<29.070500,-1.535000,29.511000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,0.000000,31.448900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,0.000000,31.622900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<29.070500,0.000000,31.448900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.070500,-1.535000,31.448900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,-1.535000,31.622900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<29.070500,-1.535000,31.448900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,27.014100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,26.847800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,0.000000,27.014100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,27.014100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,26.847800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,-1.535000,27.014100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,28.865800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,29.032100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,0.000000,28.865800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,28.865800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,29.032100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,-1.535000,28.865800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,32.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,31.927800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,0.000000,32.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,32.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,31.927800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,-1.535000,32.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,33.945800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,34.112100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,0.000000,33.945800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,33.945800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,34.112100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,-1.535000,33.945800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,34.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,34.467800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,0.000000,34.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,34.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,34.467800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,-1.535000,34.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,36.485800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,36.652100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,0.000000,36.485800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,36.485800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,36.652100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,-1.535000,36.485800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,37.174100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,37.007800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,0.000000,37.174100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,37.174100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,37.007800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,-1.535000,37.174100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,39.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,39.192100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,0.000000,39.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,39.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,39.192100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,-1.535000,39.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,39.714100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,39.547800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,0.000000,39.714100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,39.714100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,39.547800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<29.099300,-1.535000,39.714100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,0.000000,41.565800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,41.732100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,0.000000,41.565800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.099300,-1.535000,41.565800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,41.732100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<29.099300,-1.535000,41.565800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,29.337000>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.490600,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,29.337000>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.490600,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,0.000000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,31.622900>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.490600,0.000000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.490600,-1.535000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,31.622900>}
box{<0,0,-0.127000><0.862400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.490600,-1.535000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,26.847800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.817900,0.000000,26.847800>}
box{<0,0,-0.127000><1.317200,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,26.847800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,26.847800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,26.847800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,26.847800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,29.032100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,29.032100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,29.032100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,29.032100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,29.032100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,29.032100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,31.927800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,31.927800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,34.112100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,34.112100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,34.112100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,34.112100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,34.112100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,34.112100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,34.467800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,34.467800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,34.467800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,34.467800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,34.467800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,34.467800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,36.652100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,36.652100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,36.652100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,36.652100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,36.652100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,36.652100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,37.007800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,37.007800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,37.007800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,37.007800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,37.007800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,37.007800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,39.192100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,39.192100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,39.192100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,39.192100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,39.192100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,39.192100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,39.547800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,39.547800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,39.547800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,39.547800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,39.547800>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,39.547800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,0.000000,41.732100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,41.732100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,0.000000,41.732100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500700,-1.535000,41.732100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,41.732100>}
box{<0,0,-0.127000><1.958500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500700,-1.535000,41.732100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,0.000000,30.353000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.352500,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.352500,-1.535000,30.353000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.352500,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.352500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,0.000000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.352500>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,-1.535000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,29.464000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,29.464000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,29.718000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,29.718000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,29.972000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,29.972000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.226000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.226000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.352500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.352500>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,30.352500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,31.622900>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,0.000000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,31.622900>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,-1.535000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.607400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.607400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.607400>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.734000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.734000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.988000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.988000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,31.242000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,31.242000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,31.496000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,31.496000>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,0.000000,0> translate<30.353000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,0.000000,29.337000>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.606800,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,-1.535000,29.337000>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.606800,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,29.337000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.606800,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.352500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,29.337000>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.606800,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,30.607400>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.606800,0.000000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,30.607400>}
box{<0,0,-0.127000><1.015500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.606800,-1.535000,30.607400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,0.000000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,0.000000,31.622900>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.606800,0.000000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.606800,-1.535000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,-1.535000,31.622900>}
box{<0,0,-0.127000><0.862500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.606800,-1.535000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,0.000000,30.606800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<30.607400,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,-1.535000,30.606800>}
box{<0,0,-0.127000><0.253800,0.035000,0.127000> rotate<0,90.000000,0> translate<30.607400,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.353000>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.353000>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,30.480000>}
box{<0,0,-0.127000><2.387200,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.091700,-1.535000,30.480000>}
box{<0,0,-0.127000><6.484300,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.606800>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,0.000000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607400,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.606800>}
box{<0,0,-0.127000><1.777500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.607400,-1.535000,30.606800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.817900,0.000000,26.847800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.291000,0.000000,25.374600>}
box{<0,0,-0.127000><2.083349,0.035000,0.127000> rotate<0,44.998975,0> translate<30.817900,0.000000,26.847800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,26.847800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,27.014100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,-1.535000,26.847800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,29.032100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,28.865800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,0.000000,29.032100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,29.032100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,28.865800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,-1.535000,29.032100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,32.094100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,0.000000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,32.094100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,-1.535000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,34.112100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,33.945800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,0.000000,34.112100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,34.112100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,33.945800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,-1.535000,34.112100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,34.467800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,34.634100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,0.000000,34.467800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,34.467800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,34.634100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,-1.535000,34.467800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,36.652100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,36.485800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,0.000000,36.652100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,36.652100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,36.485800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,-1.535000,36.652100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,37.007800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,37.174100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,0.000000,37.007800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,37.007800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,37.174100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,-1.535000,37.007800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,39.192100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,39.025800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,0.000000,39.192100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,39.192100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,39.025800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,-1.535000,39.192100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,39.547800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,39.714100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,0.000000,39.547800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,39.547800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,39.714100>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-22.502739,0> translate<31.459200,-1.535000,39.547800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,0.000000,41.732100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,41.565800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,0.000000,41.732100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.459200,-1.535000,41.732100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,41.565800>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,22.502739,0> translate<31.459200,-1.535000,41.732100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,0.000000,29.511000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<31.469300,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,-1.535000,29.511000>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-22.497221,0> translate<31.469300,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,0.000000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,0.000000,31.448900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<31.469300,0.000000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.469300,-1.535000,31.622900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,-1.535000,31.448900>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,22.497221,0> translate<31.469300,-1.535000,31.622900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,28.956000>}
box{<0,0,-0.127000><1.351700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.567700,-1.535000,28.956000>}
box{<0,0,-0.127000><3.924800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.265700,-1.535000,34.036000>}
box{<0,0,-0.127000><0.622800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,34.036000>}
box{<0,0,-0.127000><2.886900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.674100,0.000000,36.576000>}
box{<0,0,-0.127000><1.031200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.674100,-1.535000,36.576000>}
box{<0,0,-0.127000><1.031200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.011800,0.000000,39.116000>}
box{<0,0,-0.127000><0.368900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.779500,-1.535000,39.116000>}
box{<0,0,-0.127000><16.136600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901100,0.000000,41.656000>}
box{<0,0,-0.127000><13.258200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.642900,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.901100,-1.535000,41.656000>}
box{<0,0,-0.127000><13.258200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.642900,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,26.924000>}
box{<0,0,-0.127000><19.461900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,32.004000>}
box{<0,0,-0.127000><1.351500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,32.004000>}
box{<0,0,-0.127000><5.923500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.519600,0.000000,34.544000>}
box{<0,0,-0.127000><0.876500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,34.544000>}
box{<0,0,-0.127000><1.097500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,0.000000,37.084000>}
box{<0,0,-0.127000><0.847500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,-1.535000,37.084000>}
box{<0,0,-0.127000><0.847500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.519700,0.000000,39.624000>}
box{<0,0,-0.127000><0.876600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.643100,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.580300,-1.535000,39.624000>}
box{<0,0,-0.127000><14.937200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.643100,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.775700,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,31.496000>}
box{<0,0,-0.127000><1.218900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.775700,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.775700,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,31.496000>}
box{<0,0,-0.127000><5.790900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.775700,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.775900,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,29.464000>}
box{<0,0,-0.127000><1.218700,0.035000,0.127000> rotate<0,0.000000,0> translate<31.775900,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.775900,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.075700,-1.535000,29.464000>}
box{<0,0,-0.127000><4.299800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.775900,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,27.014100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,27.321300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,-1.535000,27.014100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,28.865800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,28.558600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,0.000000,28.865800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,28.865800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,28.558600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,-1.535000,28.865800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,32.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,32.401300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,0.000000,32.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,32.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,32.401300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,-1.535000,32.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,33.945800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.018000,-1.535000,33.788300>}
box{<0,0,-0.127000><0.222668,0.035000,0.127000> rotate<0,45.015224,0> translate<31.860600,-1.535000,33.945800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,33.945800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,33.638600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,0.000000,33.945800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,34.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.145000,0.000000,34.918600>}
box{<0,0,-0.127000><0.402273,0.035000,0.127000> rotate<0,-45.007101,0> translate<31.860600,0.000000,34.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,34.634100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,34.941300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,-1.535000,34.634100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,36.485800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,36.178600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,0.000000,36.485800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,36.485800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,36.178600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,-1.535000,36.485800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,37.174100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,37.481300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,0.000000,37.174100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,37.174100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,37.481300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,-1.535000,37.174100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,39.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.891100,0.000000,38.995300>}
box{<0,0,-0.127000><0.043134,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,0.000000,39.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,39.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,38.718600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,-1.535000,39.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,39.714100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,40.021300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,0.000000,39.714100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,39.714100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,40.021300>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.860600,-1.535000,39.714100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,0.000000,41.565800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,41.258600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,0.000000,41.565800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.860600,-1.535000,41.565800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,41.258600>}
box{<0,0,-0.127000><0.434446,0.035000,0.127000> rotate<0,44.997030,0> translate<31.860600,-1.535000,41.565800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,0.000000,29.511000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,0.000000,29.832500>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.889400,0.000000,29.511000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,-1.535000,29.511000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,-1.535000,29.832500>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.889400,-1.535000,29.511000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,0.000000,31.448900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,0.000000,31.127400>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<31.889400,0.000000,31.448900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889400,-1.535000,31.448900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,-1.535000,31.127400>}
box{<0,0,-0.127000><0.454670,0.035000,0.127000> rotate<0,44.997030,0> translate<31.889400,-1.535000,31.448900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.891100,0.000000,38.995300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486600,0.000000,39.590800>}
box{<0,0,-0.127000><0.842164,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.891100,0.000000,38.995300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.010300,0.000000,27.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,27.321300>}
box{<0,0,-0.127000><0.222739,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.010300,0.000000,27.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.010300,0.000000,27.163800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.732900,0.000000,26.441300>}
box{<0,0,-0.127000><1.021840,0.035000,0.127000> rotate<0,44.993066,0> translate<32.010300,0.000000,27.163800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.018000,-1.535000,33.788300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,34.510900>}
box{<0,0,-0.127000><1.021911,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.018000,-1.535000,33.788300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,28.702000>}
box{<0,0,-0.127000><0.970200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.313700,-1.535000,28.702000>}
box{<0,0,-0.127000><3.289300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.782000>}
box{<0,0,-0.127000><2.505400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.265600,0.000000,34.798000>}
box{<0,0,-0.127000><0.241200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,36.322000>}
box{<0,0,-0.127000><0.716200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.066400,0.000000,36.322000>}
box{<0,0,-0.127000><1.042000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,-1.535000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,38.862000>}
box{<0,0,-0.127000><19.080600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,-1.535000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979500,0.000000,41.402000>}
box{<0,0,-0.127000><12.955100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024400,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.979500,-1.535000,41.402000>}
box{<0,0,-0.127000><12.955100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024400,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.537700,0.000000,27.178000>}
box{<0,0,-0.127000><17.513200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,27.178000>}
box{<0,0,-0.127000><19.080500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.027700,0.000000,32.258000>}
box{<0,0,-0.127000><1.003200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,32.258000>}
box{<0,0,-0.127000><5.542100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,34.798000>}
box{<0,0,-0.127000><0.716100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.531300,0.000000,37.338000>}
box{<0,0,-0.127000><0.506800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.531300,-1.535000,37.338000>}
box{<0,0,-0.127000><0.506800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.773700,0.000000,39.878000>}
box{<0,0,-0.127000><0.749200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.024500,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.261800,-1.535000,39.878000>}
box{<0,0,-0.127000><14.237300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.024500,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.096300,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,31.242000>}
box{<0,0,-0.127000><0.898300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.096300,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.096300,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,31.242000>}
box{<0,0,-0.127000><5.470300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.096300,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.096400,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,29.718000>}
box{<0,0,-0.127000><0.898200,0.035000,0.127000> rotate<0,0.000000,0> translate<32.096400,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.096400,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.329700,-1.535000,29.718000>}
box{<0,0,-0.127000><4.233300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.096400,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.145000,0.000000,34.918600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.982000,0.000000,34.081600>}
box{<0,0,-0.127000><1.183697,0.035000,0.127000> rotate<0,44.997030,0> translate<32.145000,0.000000,34.918600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,27.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,27.406600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<32.167800,0.000000,27.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,27.321300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,27.406600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<32.167800,-1.535000,27.321300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,28.558600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,28.473300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<32.167800,0.000000,28.558600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,28.558600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,28.473300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<32.167800,-1.535000,28.558600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,32.401300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,32.486600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<32.167800,-1.535000,32.401300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,32.401300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,32.802700>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<32.167800,0.000000,32.401300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,33.638600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,33.237200>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<32.167800,0.000000,33.638600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,34.941300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,35.342700>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<32.167800,-1.535000,34.941300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,36.178600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,36.093300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<32.167800,0.000000,36.178600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,36.178600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,35.777200>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<32.167800,-1.535000,36.178600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,37.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,37.882700>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<32.167800,0.000000,37.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,37.481300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,37.882700>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<32.167800,-1.535000,37.481300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,38.718600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,38.317200>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<32.167800,-1.535000,38.718600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,40.021300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,40.106600>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,-67.514132,0> translate<32.167800,0.000000,40.021300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,40.021300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,40.422700>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,-67.491321,0> translate<32.167800,-1.535000,40.021300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,0.000000,41.258600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,41.173300>}
box{<0,0,-0.127000><0.092316,0.035000,0.127000> rotate<0,67.514132,0> translate<32.167800,0.000000,41.258600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.167800,-1.535000,41.258600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,40.857200>}
box{<0,0,-0.127000><0.434486,0.035000,0.127000> rotate<0,67.491321,0> translate<32.167800,-1.535000,41.258600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,27.406600>}
box{<0,0,-0.127000><0.595900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,0.000000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.526900,-1.535000,27.406600>}
box{<0,0,-0.127000><3.323800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,-1.535000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,28.473300>}
box{<0,0,-0.127000><0.595900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,0.000000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.085000,-1.535000,28.473300>}
box{<0,0,-0.127000><2.881900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,-1.535000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,-1.535000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.224900,-1.535000,32.486600>}
box{<0,0,-0.127000><0.021800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,-1.535000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,36.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.478900,0.000000,36.093300>}
box{<0,0,-0.127000><0.275800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,0.000000,36.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,40.106600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.403000,0.000000,40.106600>}
box{<0,0,-0.127000><7.199900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,0.000000,40.106600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.203100,0.000000,41.173300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.844900,0.000000,41.173300>}
box{<0,0,-0.127000><7.641800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.203100,0.000000,41.173300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,0.000000,29.832500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.252600>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-67.496839,0> translate<32.210900,0.000000,29.832500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,-1.535000,29.832500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.252600>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,-67.496839,0> translate<32.210900,-1.535000,29.832500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,0.000000,31.127400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.707300>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,67.496839,0> translate<32.210900,0.000000,31.127400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.210900,-1.535000,31.127400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.707300>}
box{<0,0,-0.127000><0.454709,0.035000,0.127000> rotate<0,67.496839,0> translate<32.210900,-1.535000,31.127400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213600,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.281700,0.000000,32.512000>}
box{<0,0,-0.127000><1.068100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213600,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213600,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,35.052000>}
box{<0,0,-0.127000><0.527000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213600,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213600,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.674200,0.000000,37.592000>}
box{<0,0,-0.127000><0.460600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213600,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213600,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.674200,-1.535000,37.592000>}
box{<0,0,-0.127000><0.460600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213600,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213600,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.943400,-1.535000,40.132000>}
box{<0,0,-0.127000><13.729800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213600,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213700,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.528000>}
box{<0,0,-0.127000><2.316100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213700,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213700,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,36.068000>}
box{<0,0,-0.127000><0.526900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213700,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213700,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,38.608000>}
box{<0,0,-0.127000><18.891300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213700,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.213700,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137500,-1.535000,41.148000>}
box{<0,0,-0.127000><12.923800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.213700,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.224900,-1.535000,32.486600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.537300,-1.535000,32.799000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.224900,-1.535000,32.486600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250200,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.283700,0.000000,26.924000>}
box{<0,0,-0.127000><17.033500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.250200,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250300,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,32.512000>}
box{<0,0,-0.127000><5.316300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.250300,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.268600,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,29.972000>}
box{<0,0,-0.127000><0.726000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.268600,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.268600,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.583700,-1.535000,29.972000>}
box{<0,0,-0.127000><4.315100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.268600,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.268700,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,30.988000>}
box{<0,0,-0.127000><0.725900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.268700,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.268700,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,30.988000>}
box{<0,0,-0.127000><5.297900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.268700,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.291000,0.000000,25.374600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.732900,0.000000,25.374600>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.291000,0.000000,25.374600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318800,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.535700,0.000000,32.766000>}
box{<0,0,-0.127000><1.216900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318800,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318800,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,35.306000>}
box{<0,0,-0.127000><0.421800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318800,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318800,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.066700,0.000000,37.846000>}
box{<0,0,-0.127000><0.747900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318800,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318800,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.066700,-1.535000,37.846000>}
box{<0,0,-0.127000><0.747900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318800,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318800,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.657200,-1.535000,40.386000>}
box{<0,0,-0.127000><13.338400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318800,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318900,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.274000>}
box{<0,0,-0.127000><2.210900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318900,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318900,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,35.814000>}
box{<0,0,-0.127000><0.421700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318900,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318900,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,38.354000>}
box{<0,0,-0.127000><18.786100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318900,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.318900,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310700,-1.535000,40.894000>}
box{<0,0,-0.127000><12.991800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.318900,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,32.802700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,33.237200>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.334100,0.000000,33.237200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.789700,0.000000,33.020000>}
box{<0,0,-0.127000><1.455600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.334100,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,35.342700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,35.777200>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.334100,-1.535000,35.777200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,35.560000>}
box{<0,0,-0.127000><0.406500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.334100,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,37.882700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,37.929900>}
box{<0,0,-0.127000><0.047200,0.035000,0.127000> rotate<0,90.000000,0> translate<32.334100,0.000000,37.929900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,37.882700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,38.317200>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.334100,-1.535000,38.317200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,0.000000,37.929900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.240800,0.000000,38.836600>}
box{<0,0,-0.127000><1.282267,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.334100,0.000000,37.929900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,38.100000>}
box{<0,0,-0.127000><18.770900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.334100,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,40.422700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,40.857200>}
box{<0,0,-0.127000><0.434500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.334100,-1.535000,40.857200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.334100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.483900,-1.535000,40.640000>}
box{<0,0,-0.127000><13.149800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.334100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.373800,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,30.226000>}
box{<0,0,-0.127000><0.620800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.373800,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.373800,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.837700,-1.535000,30.226000>}
box{<0,0,-0.127000><4.463900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.373800,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.373900,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,30.734000>}
box{<0,0,-0.127000><0.620700,0.035000,0.127000> rotate<0,0.000000,0> translate<32.373900,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.373900,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.345700,-1.535000,30.734000>}
box{<0,0,-0.127000><4.971800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.373900,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.252600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.353000>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,90.000000,0> translate<32.384900,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.252600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.353000>}
box{<0,0,-0.127000><0.100400,0.035000,0.127000> rotate<0,90.000000,0> translate<32.384900,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,0.000000,30.707300>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.384900,0.000000,30.707300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.606800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.384900,-1.535000,30.707300>}
box{<0,0,-0.127000><0.100500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.384900,-1.535000,30.707300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.478900,0.000000,36.093300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.791300,0.000000,35.780900>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<32.478900,0.000000,36.093300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486600,0.000000,39.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486600,0.000000,39.590800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.486600,0.000000,39.590800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.486600,0.000000,39.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,39.903300>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.486600,0.000000,39.590900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,0.000000,36.928100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,0.000000,36.640200>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<32.490600,0.000000,36.928100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,-1.535000,36.928100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,-1.535000,36.640200>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<32.490600,-1.535000,36.928100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,0.000000,37.239800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,0.000000,36.928100>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.490600,0.000000,36.928100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,-1.535000,37.239800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,-1.535000,36.928100>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.490600,-1.535000,36.928100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,0.000000,37.239800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,0.000000,37.527700>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<32.490600,0.000000,37.239800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.490600,-1.535000,37.239800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,-1.535000,37.527700>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<32.490600,-1.535000,37.239800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.504200,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.029700,0.000000,26.670000>}
box{<0,0,-0.127000><16.525500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.504200,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.504200,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.535600,0.000000,36.068000>}
box{<0,0,-0.127000><1.031400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.504200,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.504200,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,38.100000>}
box{<0,0,-0.127000><6.840400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.504200,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.504300,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,32.766000>}
box{<0,0,-0.127000><5.062300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.504300,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.537300,-1.535000,32.799000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.069000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.537300,-1.535000,32.799000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,-1.535000,36.640200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,36.509500>}
box{<0,0,-0.127000><0.184838,0.035000,0.127000> rotate<0,44.997030,0> translate<32.609900,-1.535000,36.640200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,0.000000,36.640200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,0.000000,36.419900>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<32.609900,0.000000,36.640200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,0.000000,37.527700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,0.000000,37.748000>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.609900,0.000000,37.527700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609900,-1.535000,37.527700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,-1.535000,37.748000>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.609900,-1.535000,37.527700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.732900,0.000000,25.374600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.242900,0.000000,25.374600>}
box{<0,0,-0.127000><16.510000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.732900,0.000000,25.374600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.732900,0.000000,26.441300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.801000,0.000000,26.441300>}
box{<0,0,-0.127000><16.068100,0.035000,0.127000> rotate<0,0.000000,0> translate<32.732900,0.000000,26.441300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,36.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.740600,-1.535000,34.510900>}
box{<0,0,-0.127000><1.998600,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.740600,-1.535000,34.510900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.758200,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.789600,0.000000,35.814000>}
box{<0,0,-0.127000><1.031400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.758200,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.758200,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.123600,0.000000,38.354000>}
box{<0,0,-0.127000><6.365400,0.035000,0.127000> rotate<0,0.000000,0> translate<32.758200,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.758300,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,33.020000>}
box{<0,0,-0.127000><4.808300,0.035000,0.127000> rotate<0,0.000000,0> translate<32.758300,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.791300,0.000000,35.780900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.423900,0.000000,35.148300>}
box{<0,0,-0.127000><0.894631,0.035000,0.127000> rotate<0,44.997030,0> translate<32.791300,0.000000,35.780900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.240900,0.000000,27.406600>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.799000,0.000000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,28.668900>}
box{<0,0,-0.127000><0.276620,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.799000,0.000000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.799000,0.000000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.082900,0.000000,39.903300>}
box{<0,0,-0.127000><6.283900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.799000,0.000000,39.903300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,0.000000,36.419900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,0.000000,36.300600>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<32.830200,0.000000,36.419900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,0.000000,37.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,0.000000,37.867300>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-22.506653,0> translate<32.830200,0.000000,37.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.830200,-1.535000,37.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,-1.535000,37.867300>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-22.506653,0> translate<32.830200,-1.535000,37.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.982000,0.000000,34.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.423900,0.000000,34.081600>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<32.982000,0.000000,34.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,32.224900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,28.668900>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.994600,0.000000,28.668900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.994600,0.000000,32.224900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.307000,0.000000,32.537300>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.994600,0.000000,32.224900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012200,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.043600,0.000000,35.560000>}
box{<0,0,-0.127000><1.031400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.012200,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012200,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.869600,0.000000,38.608000>}
box{<0,0,-0.127000><5.857400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.012200,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.012300,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,33.274000>}
box{<0,0,-0.127000><4.554300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.012300,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,0.000000,36.300600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.303000,0.000000,36.300600>}
box{<0,0,-0.127000><0.184900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.118100,0.000000,36.300600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,0.000000,37.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.429800,0.000000,37.867300>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.118100,0.000000,37.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.118100,-1.535000,37.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.429800,-1.535000,37.867300>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.118100,-1.535000,37.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.240800,0.000000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.641000,0.000000,38.836600>}
box{<0,0,-0.127000><5.400200,0.035000,0.127000> rotate<0,0.000000,0> translate<33.240800,0.000000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.240900,0.000000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.227000>}
box{<0,0,-0.127000><1.160221,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.240900,0.000000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.266200,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,35.306000>}
box{<0,0,-0.127000><1.263600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.266200,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.266300,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.149100,0.000000,27.432000>}
box{<0,0,-0.127000><13.882800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.266300,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.266300,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,33.528000>}
box{<0,0,-0.127000><4.300300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.266300,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.303000,0.000000,36.300600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.222000,0.000000,35.381600>}
box{<0,0,-0.127000><1.299662,0.035000,0.127000> rotate<0,44.997030,0> translate<33.303000,0.000000,36.300600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.307000,0.000000,32.537300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.968000,0.000000,33.198300>}
box{<0,0,-0.127000><0.934795,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.307000,0.000000,32.537300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.423900,0.000000,34.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,34.081600>}
box{<0,0,-0.127000><1.105900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.423900,0.000000,34.081600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.423900,0.000000,35.148300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,35.148300>}
box{<0,0,-0.127000><1.105900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.423900,0.000000,35.148300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.429800,0.000000,37.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.717700,0.000000,37.748000>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<33.429800,0.000000,37.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.429800,-1.535000,37.867300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.717700,-1.535000,37.748000>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<33.429800,-1.535000,37.867300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.481300,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,37.846000>}
box{<0,0,-0.127000><5.863300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.481300,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.481300,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,37.846000>}
box{<0,0,-0.127000><17.623700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.481300,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.520300,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,27.686000>}
box{<0,0,-0.127000><13.608700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.520300,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.520300,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,33.782000>}
box{<0,0,-0.127000><4.046300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.520300,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.717700,0.000000,37.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,0.000000,37.527700>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<33.717700,0.000000,37.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.717700,-1.535000,37.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,-1.535000,37.527700>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<33.717700,-1.535000,37.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.774300,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,27.940000>}
box{<0,0,-0.127000><13.354700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.774300,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.774300,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,34.036000>}
box{<0,0,-0.127000><3.792300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.774300,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.510900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<33.807300,-1.535000,34.510900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.500100,-1.535000,34.290000>}
box{<0,0,-0.127000><3.692800,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.510900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,36.509500>}
box{<0,0,-0.127000><1.998600,0.035000,0.127000> rotate<0,90.000000,0> translate<33.807300,-1.535000,36.509500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.357200,-1.535000,34.544000>}
box{<0,0,-0.127000><3.549900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,-1.535000,34.798000>}
box{<0,0,-0.127000><3.509300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.357300,-1.535000,35.052000>}
box{<0,0,-0.127000><3.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.500200,-1.535000,35.306000>}
box{<0,0,-0.127000><3.692900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.892700,-1.535000,35.560000>}
box{<0,0,-0.127000><4.085400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,35.814000>}
box{<0,0,-0.127000><17.297700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,36.068000>}
box{<0,0,-0.127000><17.297700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,36.322000>}
box{<0,0,-0.127000><17.297700,0.035000,0.127000> rotate<0,0.000000,0> translate<33.807300,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.807300,-1.535000,36.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,-1.535000,36.640200>}
box{<0,0,-0.127000><0.184838,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.807300,-1.535000,36.509500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.873700,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,37.592000>}
box{<0,0,-0.127000><5.470900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.873700,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.873700,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,37.592000>}
box{<0,0,-0.127000><17.231300,0.035000,0.127000> rotate<0,0.000000,0> translate<33.873700,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.873800,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,36.576000>}
box{<0,0,-0.127000><17.231200,0.035000,0.127000> rotate<0,0.000000,0> translate<33.873800,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,-1.535000,36.640200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,-1.535000,36.928100>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<33.938000,-1.535000,36.640200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,0.000000,37.527700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,0.000000,37.239800>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<33.938000,0.000000,37.527700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.938000,-1.535000,37.527700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,-1.535000,37.239800>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<33.938000,-1.535000,37.527700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.968000,0.000000,33.198300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.409900,0.000000,33.198300>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<33.968000,0.000000,33.198300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.016600,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,36.830000>}
box{<0,0,-0.127000><17.088400,0.035000,0.127000> rotate<0,0.000000,0> translate<34.016600,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.016700,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,37.338000>}
box{<0,0,-0.127000><5.327900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.016700,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.016700,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,37.338000>}
box{<0,0,-0.127000><17.088300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.016700,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.028300,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.132600,0.000000,28.194000>}
box{<0,0,-0.127000><14.104300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.028300,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,-1.535000,36.928100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,-1.535000,37.239800>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,90.000000,0> translate<34.057300,-1.535000,37.239800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,0.000000,37.054900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,0.000000,37.239800>}
box{<0,0,-0.127000><0.184900,0.035000,0.127000> rotate<0,90.000000,0> translate<34.057300,0.000000,37.239800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,0.000000,37.054900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.479000,0.000000,36.633100>}
box{<0,0,-0.127000><0.596445,0.035000,0.127000> rotate<0,45.003822,0> translate<34.057300,0.000000,37.054900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.610200,0.000000,37.084000>}
box{<0,0,-0.127000><0.552900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.057300,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.057300,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,37.084000>}
box{<0,0,-0.127000><17.047700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.057300,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.227000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.668900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<34.061300,0.000000,28.668900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.448000>}
box{<0,0,-0.127000><13.067700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.668900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,31.783000>}
box{<0,0,-0.127000><3.114100,0.035000,0.127000> rotate<0,90.000000,0> translate<34.061300,0.000000,31.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.702000>}
box{<0,0,-0.127000><13.067700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.956000>}
box{<0,0,-0.127000><13.067700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.271300,0.000000,29.210000>}
box{<0,0,-0.127000><13.210000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,29.464000>}
box{<0,0,-0.127000><13.118500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,29.718000>}
box{<0,0,-0.127000><13.118500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,29.972000>}
box{<0,0,-0.127000><13.118500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.652000,0.000000,30.226000>}
box{<0,0,-0.127000><0.590700,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,30.480000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,30.734000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,30.988000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.242000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.496000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.750000>}
box{<0,0,-0.127000><0.468500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.061300,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.061300,0.000000,31.783000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.409900,0.000000,32.131600>}
box{<0,0,-0.127000><0.492995,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.061300,0.000000,31.783000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.222000,0.000000,35.381600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,35.381600>}
box{<0,0,-0.127000><0.307800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.222000,0.000000,35.381600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.282200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.479000,0.000000,36.830000>}
box{<0,0,-0.127000><0.196800,0.035000,0.127000> rotate<0,0.000000,0> translate<34.282200,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.282300,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,32.004000>}
box{<0,0,-0.127000><0.247500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.282300,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.409900,0.000000,32.131600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,32.131600>}
box{<0,0,-0.127000><0.119900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.409900,0.000000,32.131600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.409900,0.000000,33.198300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.198300>}
box{<0,0,-0.127000><0.119900,0.035000,0.127000> rotate<0,0.000000,0> translate<34.409900,0.000000,33.198300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.479000,0.000000,36.952800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.479000,0.000000,36.633100>}
box{<0,0,-0.127000><0.319700,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.479000,0.000000,36.633100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.479000,0.000000,36.952800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.702100,0.000000,37.175900>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.479000,0.000000,36.952800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,30.348200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.723200,0.000000,30.154800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<34.529800,0.000000,30.348200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.081700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,30.348200>}
box{<0,0,-0.127000><0.733500,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,30.348200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.731700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.081700>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,31.081700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,32.131600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,31.731700>}
box{<0,0,-0.127000><0.399900,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,31.731700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.681700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.198300>}
box{<0,0,-0.127000><0.483400,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,33.198300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,34.081600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,33.681700>}
box{<0,0,-0.127000><0.399900,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,33.681700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,35.381600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.529800,0.000000,35.148300>}
box{<0,0,-0.127000><0.233300,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.529800,0.000000,35.148300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.702100,0.000000,37.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,37.175900>}
box{<0,0,-0.127000><0.872300,0.035000,0.127000> rotate<0,0.000000,0> translate<34.702100,0.000000,37.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.723200,0.000000,30.154800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.426700,0.000000,30.154800>}
box{<0,0,-0.127000><1.703500,0.035000,0.127000> rotate<0,0.000000,0> translate<34.723200,0.000000,30.154800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.085000,-1.535000,28.473300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,30.954900>}
box{<0,0,-0.127000><3.509512,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.085000,-1.535000,28.473300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.526900,-1.535000,27.406600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.839300,-1.535000,27.719000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.526900,-1.535000,27.406600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.552300,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,27.432000>}
box{<0,0,-0.127000><15.552700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.552300,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,36.566000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,37.175900>}
box{<0,0,-0.127000><0.609900,0.035000,0.127000> rotate<0,90.000000,0> translate<35.574400,0.000000,37.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,36.566000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,36.566000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.574400,0.000000,36.566000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,36.576000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.574400,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,36.830000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.574400,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.574400,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,37.084000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.574400,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,37.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,36.566000>}
box{<0,0,-0.127000><0.609900,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.575400,0.000000,36.566000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.575400,0.000000,37.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.447800,0.000000,37.175900>}
box{<0,0,-0.127000><0.872400,0.035000,0.127000> rotate<0,0.000000,0> translate<35.575400,0.000000,37.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.576000,0.000000,36.564400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.576000,0.000000,36.565400>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.576000,0.000000,36.565400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.576000,0.000000,36.564400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.564400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<35.576000,0.000000,36.564400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.576000,0.000000,36.565400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.565400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<35.576000,0.000000,36.565400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.806300,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,27.686000>}
box{<0,0,-0.127000><15.298700,0.035000,0.127000> rotate<0,0.000000,0> translate<35.806300,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.839300,-1.535000,27.719000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.513000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.839300,-1.535000,27.719000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.060300,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,27.940000>}
box{<0,0,-0.127000><15.044700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.060300,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.314300,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,28.194000>}
box{<0,0,-0.127000><14.790700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.314300,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.426700,0.000000,30.154800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,30.348200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.426700,0.000000,30.154800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.447800,0.000000,37.175900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.952800>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<36.447800,0.000000,37.175900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.497900,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.170100,0.000000,30.226000>}
box{<0,0,-0.127000><5.672200,0.035000,0.127000> rotate<0,0.000000,0> translate<36.497900,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.539700,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,37.084000>}
box{<0,0,-0.127000><2.804900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.539700,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.568300,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,28.448000>}
box{<0,0,-0.127000><14.536700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.568300,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,30.348200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,31.081700>}
box{<0,0,-0.127000><0.733500,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,31.081700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.480000>}
box{<0,0,-0.127000><5.448900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.734000>}
box{<0,0,-0.127000><5.448900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.988000>}
box{<0,0,-0.127000><5.448900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,31.081700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,31.481600>}
box{<0,0,-0.127000><0.399900,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,31.481600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.242000>}
box{<0,0,-0.127000><5.499700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,31.481600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.414000,0.000000,31.481600>}
box{<0,0,-0.127000><2.793900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,31.481600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,32.548300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,32.781600>}
box{<0,0,-0.127000><0.233300,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,32.548300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.414000,0.000000,32.548300>}
box{<0,0,-0.127000><2.793900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,32.548300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.631700,0.000000,32.766000>}
box{<0,0,-0.127000><3.011600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,32.781600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.936000,0.000000,32.781600>}
box{<0,0,-0.127000><2.315900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,33.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.331700>}
box{<0,0,-0.127000><0.483400,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,34.331700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,33.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.936000,0.000000,33.848300>}
box{<0,0,-0.127000><2.315900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,33.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.892400,0.000000,34.036000>}
box{<0,0,-0.127000><1.272300,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.500100,0.000000,34.290000>}
box{<0,0,-0.127000><0.880000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.331700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.731600>}
box{<0,0,-0.127000><0.399900,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,34.731600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.357200,0.000000,34.544000>}
box{<0,0,-0.127000><0.737100,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,34.731600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,0.000000,34.731600>}
box{<0,0,-0.127000><0.696500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,34.731600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,35.798300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,36.126300>}
box{<0,0,-0.127000><0.328000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.620100,0.000000,36.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,35.798300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.412000,0.000000,35.798300>}
box{<0,0,-0.127000><0.791900,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,35.798300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,35.814000>}
box{<0,0,-0.127000><2.724500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,36.068000>}
box{<0,0,-0.127000><2.724500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.620100,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.620100,0.000000,36.126300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.177100>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.620100,0.000000,36.126300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.177100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.564400>}
box{<0,0,-0.127000><0.387300,0.035000,0.127000> rotate<0,90.000000,0> translate<36.670900,0.000000,36.564400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,36.322000>}
box{<0,0,-0.127000><2.673700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.670900,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.565400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.952800>}
box{<0,0,-0.127000><0.387400,0.035000,0.127000> rotate<0,90.000000,0> translate<36.670900,0.000000,36.952800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,36.576000>}
box{<0,0,-0.127000><2.673700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.670900,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.670900,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,36.830000>}
box{<0,0,-0.127000><2.673700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.670900,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.822300,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,28.702000>}
box{<0,0,-0.127000><14.282700,0.035000,0.127000> rotate<0,0.000000,0> translate<36.822300,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.076300,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,28.956000>}
box{<0,0,-0.127000><14.028700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.076300,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,0.000000,34.642100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,0.000000,34.354200>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<37.316600,0.000000,34.642100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,-1.535000,34.642100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,-1.535000,34.354200>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<37.316600,-1.535000,34.642100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,0.000000,34.731600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,0.000000,34.642100>}
box{<0,0,-0.127000><0.089500,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.316600,0.000000,34.642100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,-1.535000,34.953800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,-1.535000,34.642100>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.316600,-1.535000,34.642100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.316600,-1.535000,34.953800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,-1.535000,35.241700>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<37.316600,-1.535000,34.953800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.330300,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,29.210000>}
box{<0,0,-0.127000><13.774700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.330300,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.412000,0.000000,35.798300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.853900,0.000000,35.798300>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<37.412000,0.000000,35.798300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,-1.535000,34.354200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,34.223500>}
box{<0,0,-0.127000><0.184838,0.035000,0.127000> rotate<0,44.997030,0> translate<37.435900,-1.535000,34.354200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,0.000000,34.354200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.656200,0.000000,34.133900>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<37.435900,0.000000,34.354200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.435900,-1.535000,35.241700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.656200,-1.535000,35.462000>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.435900,-1.535000,35.241700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,34.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.566600,-1.535000,30.954900>}
box{<0,0,-0.127000><3.268600,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.566600,-1.535000,30.954900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.584300,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,29.464000>}
box{<0,0,-0.127000><13.520700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.584300,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.656200,0.000000,34.133900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.944100,0.000000,34.014600>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<37.656200,0.000000,34.133900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.656200,-1.535000,35.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.944100,-1.535000,35.581300>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-22.506653,0> translate<37.656200,-1.535000,35.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.838300,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,29.718000>}
box{<0,0,-0.127000><13.266700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.838300,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.853900,0.000000,35.798300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.070900,0.000000,35.581300>}
box{<0,0,-0.127000><0.306884,0.035000,0.127000> rotate<0,44.997030,0> translate<37.853900,0.000000,35.798300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.944100,0.000000,34.014600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,0.000000,34.014600>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.944100,0.000000,34.014600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.944100,-1.535000,35.581300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,-1.535000,35.581300>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,0.000000,0> translate<37.944100,-1.535000,35.581300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.070900,0.000000,35.581300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,0.000000,35.581300>}
box{<0,0,-0.127000><0.184900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.070900,0.000000,35.581300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.092300,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,29.972000>}
box{<0,0,-0.127000><13.012700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.092300,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,0.000000,34.014600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,0.000000,34.133900>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-22.506653,0> translate<38.255800,0.000000,34.014600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,0.000000,35.581300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,0.000000,35.462000>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<38.255800,0.000000,35.581300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.255800,-1.535000,35.581300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,-1.535000,35.462000>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,22.506653,0> translate<38.255800,-1.535000,35.581300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.307300,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,35.560000>}
box{<0,0,-0.127000><1.037300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.307300,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.307300,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,35.560000>}
box{<0,0,-0.127000><12.797700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.307300,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.307400,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.123700,0.000000,34.036000>}
box{<0,0,-0.127000><0.816300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.307400,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.346300,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,30.226000>}
box{<0,0,-0.127000><12.758700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.346300,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,0.000000,34.133900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,0.000000,34.354200>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.543700,0.000000,34.133900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,0.000000,35.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,0.000000,35.241700>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<38.543700,0.000000,35.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.543700,-1.535000,35.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,-1.535000,35.241700>}
box{<0,0,-0.127000><0.311551,0.035000,0.127000> rotate<0,44.997030,0> translate<38.543700,-1.535000,35.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.600300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,30.480000>}
box{<0,0,-0.127000><12.504700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.600300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.513000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.954900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<38.633300,-1.535000,30.954900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,30.734000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.954900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,34.223500>}
box{<0,0,-0.127000><3.268600,0.035000,0.127000> rotate<0,90.000000,0> translate<38.633300,-1.535000,34.223500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,30.988000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,31.242000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,31.496000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,31.750000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,32.004000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,32.258000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,32.512000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,32.766000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,33.020000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,33.274000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,33.528000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,33.782000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,34.036000>}
box{<0,0,-0.127000><12.471700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.633300,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.633300,-1.535000,34.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,-1.535000,34.354200>}
box{<0,0,-0.127000><0.184838,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.633300,-1.535000,34.223500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.641000,0.000000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,38.133000>}
box{<0,0,-0.127000><0.995041,0.035000,0.127000> rotate<0,44.997030,0> translate<38.641000,0.000000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.699700,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,35.306000>}
box{<0,0,-0.127000><0.644900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.699700,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.699700,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,35.306000>}
box{<0,0,-0.127000><12.405300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.699700,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.699800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,34.290000>}
box{<0,0,-0.127000><0.644800,0.035000,0.127000> rotate<0,0.000000,0> translate<38.699800,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.699800,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,34.290000>}
box{<0,0,-0.127000><12.405200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.699800,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,0.000000,34.354200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,0.000000,34.642100>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<38.764000,0.000000,34.354200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,-1.535000,34.354200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,-1.535000,34.642100>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,-67.487407,0> translate<38.764000,-1.535000,34.354200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,0.000000,35.241700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,0.000000,34.953800>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<38.764000,0.000000,35.241700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.764000,-1.535000,35.241700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,-1.535000,34.953800>}
box{<0,0,-0.127000><0.311639,0.035000,0.127000> rotate<0,67.487407,0> translate<38.764000,-1.535000,35.241700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.842600,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,34.544000>}
box{<0,0,-0.127000><0.502000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.842600,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.842600,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,34.544000>}
box{<0,0,-0.127000><12.262400,0.035000,0.127000> rotate<0,0.000000,0> translate<38.842600,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.842700,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,35.052000>}
box{<0,0,-0.127000><0.501900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.842700,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.842700,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,35.052000>}
box{<0,0,-0.127000><12.262300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.842700,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,0.000000,34.642100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,0.000000,34.953800>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,90.000000,0> translate<38.883300,0.000000,34.953800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,-1.535000,34.642100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,-1.535000,34.953800>}
box{<0,0,-0.127000><0.311700,0.035000,0.127000> rotate<0,90.000000,0> translate<38.883300,-1.535000,34.953800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,34.798000>}
box{<0,0,-0.127000><0.461300,0.035000,0.127000> rotate<0,0.000000,0> translate<38.883300,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.883300,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,34.798000>}
box{<0,0,-0.127000><12.221700,0.035000,0.127000> rotate<0,0.000000,0> translate<38.883300,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.936000,0.000000,32.781600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.377900,0.000000,32.781600>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.936000,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.936000,0.000000,33.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,34.256900>}
box{<0,0,-0.127000><0.577848,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.936000,0.000000,33.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.082900,0.000000,39.903300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395300,0.000000,39.590900>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<39.082900,0.000000,39.903300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.108200,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.631600,0.000000,39.878000>}
box{<0,0,-0.127000><0.523400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.108200,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,38.133000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.344600,0.000000,34.256900>}
box{<0,0,-0.127000><3.876100,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.344600,0.000000,34.256900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.362200,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.885600,0.000000,39.624000>}
box{<0,0,-0.127000><0.523400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.362200,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.377900,0.000000,32.781600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.098900,0.000000,33.502600>}
box{<0,0,-0.127000><1.019648,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.377900,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.395300,0.000000,39.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.574900>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<39.395300,0.000000,39.590900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.403000,0.000000,40.106600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.895000>}
box{<0,0,-0.127000><1.713461,0.035000,0.127000> rotate<0,44.997030,0> translate<39.403000,0.000000,40.106600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.414000,0.000000,31.481600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.855900,0.000000,31.481600>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.414000,0.000000,31.481600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.414000,0.000000,32.548300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,33.748900>}
box{<0,0,-0.127000><1.697905,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.414000,0.000000,32.548300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.616200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.139600,0.000000,39.370000>}
box{<0,0,-0.127000><0.523400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.616200,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.616300,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.885700,0.000000,33.020000>}
box{<0,0,-0.127000><0.269400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.616300,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.844900,0.000000,41.173300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.157300,0.000000,40.860900>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<39.844900,0.000000,41.173300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.855900,0.000000,31.481600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.368900,0.000000,32.994600>}
box{<0,0,-0.127000><2.139705,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.855900,0.000000,31.481600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.870200,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.393600,0.000000,39.116000>}
box{<0,0,-0.127000><0.523400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.870200,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.870200,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.137600,0.000000,41.148000>}
box{<0,0,-0.127000><5.267400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.870200,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.870300,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.496000>}
box{<0,0,-0.127000><2.249500,0.035000,0.127000> rotate<0,0.000000,0> translate<39.870300,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.870300,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.139700,0.000000,33.274000>}
box{<0,0,-0.127000><0.269400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.870300,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.098900,0.000000,33.502600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,33.815000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.098900,0.000000,33.502600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.124200,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.862000>}
box{<0,0,-0.127000><0.490400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.124200,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.124200,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.310800,0.000000,40.894000>}
box{<0,0,-0.127000><5.186600,0.035000,0.127000> rotate<0,0.000000,0> translate<40.124200,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.124300,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.750000>}
box{<0,0,-0.127000><1.995500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.124300,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.124300,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.393700,0.000000,33.528000>}
box{<0,0,-0.127000><0.269400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.124300,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.157300,0.000000,40.860900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,39.336900>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,44.997030,0> translate<40.157300,0.000000,40.860900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.378200,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.608000>}
box{<0,0,-0.127000><0.236400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.378200,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.378200,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.484000,0.000000,40.640000>}
box{<0,0,-0.127000><5.105800,0.035000,0.127000> rotate<0,0.000000,0> translate<40.378200,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.378300,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.004000>}
box{<0,0,-0.127000><1.741500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.378300,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.378300,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,33.782000>}
box{<0,0,-0.127000><0.236300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.378300,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,33.815000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.133000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.411300,0.000000,38.133000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,34.036000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,34.290000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,34.544000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,34.798000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,35.052000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,35.306000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,35.560000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,35.814000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,36.068000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,36.322000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,36.576000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,36.830000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,37.084000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,37.338000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,37.592000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,37.846000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.100000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.133000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.574900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<40.411300,0.000000,38.574900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.411300,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.354000>}
box{<0,0,-0.127000><0.203300,0.035000,0.127000> rotate<0,0.000000,0> translate<40.411300,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,38.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.614600,0.000000,33.748900>}
box{<0,0,-0.127000><5.146100,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.614600,0.000000,33.748900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.632200,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.657200,0.000000,40.386000>}
box{<0,0,-0.127000><5.025000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.632200,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.632300,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.258000>}
box{<0,0,-0.127000><1.487500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.632300,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.886200,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.943300,0.000000,40.132000>}
box{<0,0,-0.127000><5.057100,0.035000,0.127000> rotate<0,0.000000,0> translate<40.886200,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.886300,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.512000>}
box{<0,0,-0.127000><1.233500,0.035000,0.127000> rotate<0,0.000000,0> translate<40.886300,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.140200,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.261800,0.000000,39.878000>}
box{<0,0,-0.127000><5.121600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.140200,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.140300,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.766000>}
box{<0,0,-0.127000><0.979500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.140300,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.368900,0.000000,32.994600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,33.307000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.368900,0.000000,32.994600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.394200,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.580200,0.000000,39.624000>}
box{<0,0,-0.127000><5.186000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.394200,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.394300,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,33.020000>}
box{<0,0,-0.127000><0.725500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.394300,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.648200,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.132300,0.000000,39.370000>}
box{<0,0,-0.127000><5.484100,0.035000,0.127000> rotate<0,0.000000,0> translate<41.648200,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.648300,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,33.274000>}
box{<0,0,-0.127000><0.471500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.648300,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,33.307000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.895000>}
box{<0,0,-0.127000><5.588000,0.035000,0.127000> rotate<0,90.000000,0> translate<41.681300,0.000000,38.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.118100,0.000000,33.528000>}
box{<0,0,-0.127000><0.436800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.782000>}
box{<0,0,-0.127000><0.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,34.036000>}
box{<0,0,-0.127000><0.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,34.290000>}
box{<0,0,-0.127000><0.387700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.544000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.798000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.052000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.306000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.560000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.814000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.068000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.322000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.576000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.830000>}
box{<0,0,-0.127000><0.438500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.272100,0.000000,37.084000>}
box{<0,0,-0.127000><0.590800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,37.338000>}
box{<0,0,-0.127000><4.205700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,37.592000>}
box{<0,0,-0.127000><4.205700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.995200,0.000000,37.846000>}
box{<0,0,-0.127000><4.313900,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,38.100000>}
box{<0,0,-0.127000><9.423700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,38.354000>}
box{<0,0,-0.127000><9.423700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,38.608000>}
box{<0,0,-0.127000><9.423700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,38.862000>}
box{<0,0,-0.127000><9.423700,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,38.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,39.336900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<41.681300,0.000000,39.336900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.681300,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.779500,0.000000,39.116000>}
box{<0,0,-0.127000><6.098200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.681300,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.327100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.292100,0.000000,30.104000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<42.069000,0.000000,30.327100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.714400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.327100>}
box{<0,0,-0.127000><0.387300,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.069000,0.000000,30.327100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.714400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,30.714400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.069000,0.000000,30.714400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.715400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,30.715400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.069000,0.000000,30.715400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,31.102800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,30.715400>}
box{<0,0,-0.127000><0.387400,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.069000,0.000000,30.715400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,31.102800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.153600>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.069000,0.000000,31.102800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.577100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,33.526300>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,44.997030,0> translate<42.069000,0.000000,33.577100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.964400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.577100>}
box{<0,0,-0.127000><0.387300,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.069000,0.000000,33.577100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.964400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,33.964400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.069000,0.000000,33.964400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,33.965400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<42.069000,0.000000,33.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,34.352800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,33.965400>}
box{<0,0,-0.127000><0.387400,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.069000,0.000000,33.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.069000,0.000000,34.352800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.403600>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.069000,0.000000,34.352800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.731700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.153600>}
box{<0,0,-0.127000><0.578100,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,31.153600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.298200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,31.731700>}
box{<0,0,-0.127000><0.566500,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,31.731700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.948200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.298200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,32.298200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,33.526300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,32.948200>}
box{<0,0,-0.127000><0.578100,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,32.948200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.898200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.403600>}
box{<0,0,-0.127000><0.494600,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,34.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.548200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,34.898200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,34.898200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.198200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,35.548200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,35.548200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.931700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.198200>}
box{<0,0,-0.127000><0.733500,0.035000,0.127000> rotate<0,-90.000000,0> translate<42.119800,0.000000,36.198200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.119800,0.000000,36.931700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.313200,0.000000,37.125100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.119800,0.000000,36.931700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.292100,0.000000,30.104000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.104000>}
box{<0,0,-0.127000><0.872300,0.035000,0.127000> rotate<0,0.000000,0> translate<42.292100,0.000000,30.104000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.313200,0.000000,37.125100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.016700,0.000000,37.125100>}
box{<0,0,-0.127000><1.703500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.313200,0.000000,37.125100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,30.715400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,30.714400>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.163900,0.000000,30.714400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,33.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.163900,0.000000,33.964400>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.163900,0.000000,33.964400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.104000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.713900>}
box{<0,0,-0.127000><0.609900,0.035000,0.127000> rotate<0,90.000000,0> translate<43.164400,0.000000,30.713900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.226000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.164400,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.480000>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.164400,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.164400,0.000000,30.713900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.713900>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.164400,0.000000,30.713900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.104000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.037800,0.000000,30.104000>}
box{<0,0,-0.127000><0.872400,0.035000,0.127000> rotate<0,0.000000,0> translate<43.165400,0.000000,30.104000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.713900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.165400,0.000000,30.104000>}
box{<0,0,-0.127000><0.609900,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.165400,0.000000,30.104000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,30.714400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,30.715400>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.166000,0.000000,30.715400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,30.714400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.714400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<43.166000,0.000000,30.714400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,30.715400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.715400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<43.166000,0.000000,30.715400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,33.964400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,33.965400>}
box{<0,0,-0.127000><0.001000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.166000,0.000000,33.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,33.964400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.964400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<43.166000,0.000000,33.964400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.166000,0.000000,33.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.965400>}
box{<0,0,-0.127000><1.094900,0.035000,0.127000> rotate<0,0.000000,0> translate<43.166000,0.000000,33.965400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.016700,0.000000,37.125100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.931700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<44.016700,0.000000,37.125100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.037800,0.000000,30.104000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.327100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.037800,0.000000,30.104000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.057800,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,37.084000>}
box{<0,0,-0.127000><1.829200,0.035000,0.127000> rotate<0,0.000000,0> translate<44.057800,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.159800,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,30.226000>}
box{<0,0,-0.127000><3.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.159800,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.153600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.731700>}
box{<0,0,-0.127000><0.578100,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,31.731700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.153600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,31.102800>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,44.997030,0> translate<44.210100,0.000000,31.153600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.956800,0.000000,31.242000>}
box{<0,0,-0.127000><2.746700,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.944700,0.000000,31.496000>}
box{<0,0,-0.127000><2.734600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.731700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.298200>}
box{<0,0,-0.127000><0.566500,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,32.298200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.932700,0.000000,31.750000>}
box{<0,0,-0.127000><2.722600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.920600,0.000000,32.004000>}
box{<0,0,-0.127000><2.710500,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.908500,0.000000,32.258000>}
box{<0,0,-0.127000><2.698400,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.298200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.781600>}
box{<0,0,-0.127000><0.483400,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.896500,0.000000,32.512000>}
box{<0,0,-0.127000><2.686400,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.884400,0.000000,32.766000>}
box{<0,0,-0.127000><2.674300,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,32.781600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.883700,0.000000,32.781600>}
box{<0,0,-0.127000><2.673600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.898200>}
box{<0,0,-0.127000><0.494600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,34.898200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.403600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,34.352800>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,44.997030,0> translate<44.210100,0.000000,34.403600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,34.544000>}
box{<0,0,-0.127000><2.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,34.798000>}
box{<0,0,-0.127000><2.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,34.898200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.548200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,35.548200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,35.052000>}
box{<0,0,-0.127000><2.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,35.306000>}
box{<0,0,-0.127000><2.005700,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.548200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.198200>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,36.198200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.984600,0.000000,35.560000>}
box{<0,0,-0.127000><5.774500,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.995100,0.000000,35.814000>}
box{<0,0,-0.127000><1.785000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.068000>}
box{<0,0,-0.127000><1.676900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.198200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.931700>}
box{<0,0,-0.127000><0.733500,0.035000,0.127000> rotate<0,90.000000,0> translate<44.210100,0.000000,36.931700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.322000>}
box{<0,0,-0.127000><1.676900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.576000>}
box{<0,0,-0.127000><1.676900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.210100,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.890600,0.000000,36.830000>}
box{<0,0,-0.127000><2.680500,0.035000,0.127000> rotate<0,0.000000,0> translate<44.210100,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.327100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.714400>}
box{<0,0,-0.127000><0.387300,0.035000,0.127000> rotate<0,90.000000,0> translate<44.260900,0.000000,30.714400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,30.480000>}
box{<0,0,-0.127000><2.918900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.715400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,31.102800>}
box{<0,0,-0.127000><0.387400,0.035000,0.127000> rotate<0,90.000000,0> translate<44.260900,0.000000,31.102800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.096700,0.000000,30.734000>}
box{<0,0,-0.127000><2.835800,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.951900,0.000000,30.988000>}
box{<0,0,-0.127000><2.691000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.964400>}
box{<0,0,-0.127000><0.116100,0.035000,0.127000> rotate<0,90.000000,0> translate<44.260900,0.000000,33.964400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.848300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,33.848300>}
box{<0,0,-0.127000><1.954900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,33.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,33.965400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,34.352800>}
box{<0,0,-0.127000><0.387400,0.035000,0.127000> rotate<0,90.000000,0> translate<44.260900,0.000000,34.352800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,34.036000>}
box{<0,0,-0.127000><1.954900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260900,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,34.290000>}
box{<0,0,-0.127000><1.954900,0.035000,0.127000> rotate<0,0.000000,0> translate<44.260900,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,19.695300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,18.501600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<44.623800,0.000000,19.695300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,19.695300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,18.501600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<44.623800,-1.535000,19.695300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,19.695400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,19.695300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,19.695300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,19.695400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,19.695300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,19.695300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,19.695400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,19.695400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,19.695400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,19.695400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.944500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,20.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.944500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,20.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,20.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,22.138300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<44.623800,0.000000,20.944600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,20.944600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,22.138300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<44.623800,-1.535000,20.944600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.555300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,41.361600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<44.623800,0.000000,42.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.555300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,41.361600>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,72.852671,0> translate<44.623800,-1.535000,42.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.555300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,42.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.555400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.555300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,42.555300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.804500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,42.555400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,42.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.804500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,42.555400>}
box{<0,0,-0.127000><1.249100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,42.555400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.804500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,0.000000,43.804500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.804500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.623800,-1.535000,43.804500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,0.000000,43.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,44.998300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<44.623800,0.000000,43.804600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.623800,-1.535000,43.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,44.998300>}
box{<0,0,-0.127000><1.249196,0.035000,0.127000> rotate<0,-72.852671,0> translate<44.623800,-1.535000,43.804600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,18.501500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.397600,0.000000,17.906900>}
box{<0,0,-0.127000><0.719764,0.035000,0.127000> rotate<0,55.696891,0> translate<44.992000,0.000000,18.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,18.501500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.397600,-1.535000,17.906900>}
box{<0,0,-0.127000><0.719764,0.035000,0.127000> rotate<0,55.696891,0> translate<44.992000,-1.535000,18.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,18.501600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,18.501500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,0.000000,18.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,18.501600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,18.501500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,-1.535000,18.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,22.138400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,22.138300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,0.000000,22.138300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,22.138400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,22.138300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,-1.535000,22.138300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,22.138400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,23.170400>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,-55.703245,0> translate<44.992000,0.000000,22.138400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,22.138400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,23.170400>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,-55.703245,0> translate<44.992000,-1.535000,22.138400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,41.361500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,40.329400>}
box{<0,0,-0.127000><1.249226,0.035000,0.127000> rotate<0,55.705829,0> translate<44.992000,-1.535000,41.361500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,41.361500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,40.329500>}
box{<0,0,-0.127000><1.249143,0.035000,0.127000> rotate<0,55.703245,0> translate<44.992000,0.000000,41.361500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,41.361600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,41.361500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,0.000000,41.361500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,41.361600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,41.361500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,-1.535000,41.361500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,44.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,44.998300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,0.000000,44.998300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,44.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,44.998300>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.992000,-1.535000,44.998300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,0.000000,44.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390800,0.000000,45.583000>}
box{<0,0,-0.127000><0.707671,0.035000,0.127000> rotate<0,-55.695460,0> translate<44.992000,0.000000,44.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.992000,-1.535000,44.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390800,-1.535000,45.583000>}
box{<0,0,-0.127000><0.707671,0.035000,0.127000> rotate<0,-55.695460,0> translate<44.992000,-1.535000,44.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,23.170400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.695800,0.000000,23.170400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,23.170400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.695800,-1.535000,23.170400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,0.000000,23.170500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.695800,0.000000,23.170500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,-1.535000,23.170500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.695800,-1.535000,23.170500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,40.329400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,0.000000,40.329400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.695800,0.000000,40.329400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,-1.535000,40.329400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,-1.535000,40.329400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<45.695800,-1.535000,40.329400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,40.329500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695800,0.000000,40.329400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.695800,0.000000,40.329400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,0.000000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,0.000000,23.949400>}
box{<0,0,-0.127000><1.249095,0.035000,0.127000> rotate<0,-38.574880,0> translate<45.695900,0.000000,23.170500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,-1.535000,23.170500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,-1.535000,23.949400>}
box{<0,0,-0.127000><1.249095,0.035000,0.127000> rotate<0,-38.574880,0> translate<45.695900,-1.535000,23.170500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,0.000000,40.329400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,0.000000,39.550500>}
box{<0,0,-0.127000><1.249095,0.035000,0.127000> rotate<0,38.574880,0> translate<45.695900,0.000000,40.329400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.695900,-1.535000,40.329400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,-1.535000,39.550500>}
box{<0,0,-0.127000><1.249173,0.035000,0.127000> rotate<0,38.572020,0> translate<45.695900,-1.535000,40.329400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,35.922100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.110100,0.000000,35.699000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<45.887000,0.000000,35.922100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.703100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,35.922100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.887000,0.000000,35.922100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.703100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.890600,0.000000,36.703100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.887000,0.000000,36.703100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.956700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.890600,0.000000,36.956700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<45.887000,0.000000,36.956700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,37.737800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,36.956700>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.887000,0.000000,36.956700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.887000,0.000000,37.737800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.110100,0.000000,37.960900>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.887000,0.000000,37.737800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.110100,0.000000,35.699000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,35.699000>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.110100,0.000000,35.699000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.110100,0.000000,37.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.960900>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.110100,0.000000,37.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,35.328200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,33.848300>}
box{<0,0,-0.127000><1.479900,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.215800,0.000000,33.848300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.215800,0.000000,35.328200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.409200,0.000000,35.521600>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.215800,0.000000,35.328200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.409200,0.000000,35.521600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.282700,0.000000,35.521600>}
box{<0,0,-0.127000><1.873500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.409200,0.000000,35.521600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,0.000000,23.949400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,0.000000,23.949400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.672400,0.000000,23.949400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,-1.535000,23.949400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,-1.535000,23.949400>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.672400,-1.535000,23.949400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672400,0.000000,39.550500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,0.000000,39.550500>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.672400,0.000000,39.550500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,0.000000,23.949400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,0.000000,24.405800>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,-21.428636,0> translate<46.672500,0.000000,23.949400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,-1.535000,23.949400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,-1.535000,24.405800>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,-21.428636,0> translate<46.672500,-1.535000,23.949400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,0.000000,39.550500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,0.000000,39.094100>}
box{<0,0,-0.127000><1.249162,0.035000,0.127000> rotate<0,21.428636,0> translate<46.672500,0.000000,39.550500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.672500,-1.535000,39.550500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,-1.535000,39.094100>}
box{<0,0,-0.127000><1.249255,0.035000,0.127000> rotate<0,21.426960,0> translate<46.672500,-1.535000,39.550500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.883700,0.000000,32.781600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.963400,0.000000,31.103800>}
box{<0,0,-0.127000><1.679692,0.035000,0.127000> rotate<0,87.274581,0> translate<46.883700,0.000000,32.781600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.890600,0.000000,36.956700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.890600,0.000000,36.703100>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.890600,0.000000,36.703100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,35.699000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.702600>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<46.891100,0.000000,36.702600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,35.814000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.068000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.322000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.576000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.702600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.702600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,36.702600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.957300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.960900>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,90.000000,0> translate<46.891100,0.000000,37.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,36.957300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.957300>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,36.957300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.084000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.338000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.592000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.891100,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.846000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<46.891100,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.945400,0.000000,30.922800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.963400,0.000000,31.103800>}
box{<0,0,-0.127000><0.181893,0.035000,0.127000> rotate<0,-84.315185,0> translate<46.945400,0.000000,30.922800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.945400,0.000000,30.922800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.973600,0.000000,30.888400>}
box{<0,0,-0.127000><0.044481,0.035000,0.127000> rotate<0,50.652873,0> translate<46.945400,0.000000,30.922800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.973600,0.000000,30.888400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.975700,0.000000,30.843900>}
box{<0,0,-0.127000><0.044550,0.035000,0.127000> rotate<0,87.292397,0> translate<46.973600,0.000000,30.888400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.975700,0.000000,30.843900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.110400,0.000000,30.721600>}
box{<0,0,-0.127000><0.181938,0.035000,0.127000> rotate<0,42.234889,0> translate<46.975700,0.000000,30.843900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.110400,0.000000,30.721600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,30.636700>}
box{<0,0,-0.127000><0.109656,0.035000,0.127000> rotate<0,50.732979,0> translate<47.110400,0.000000,30.721600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,27.452100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.352100,0.000000,27.229000>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<47.129000,0.000000,27.452100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,27.452100>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.129000,0.000000,27.452100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.132600,0.000000,28.133100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<47.129000,0.000000,28.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.386700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.132600,0.000000,28.386700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<47.129000,0.000000,28.386700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,29.067800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,28.386700>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.129000,0.000000,28.386700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.129000,0.000000,29.067800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.307200,0.000000,29.245900>}
box{<0,0,-0.127000><0.251942,0.035000,0.127000> rotate<0,-44.980950,0> translate<47.129000,0.000000,29.067800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,35.699000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.925800,0.000000,35.699000>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.144700,0.000000,35.699000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.702600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,35.699000>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.144700,0.000000,35.699000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,36.957300>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.144700,0.000000,36.957300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.144700,0.000000,37.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.925800,0.000000,37.960900>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.144700,0.000000,37.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.145300,0.000000,36.703100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.145300,0.000000,36.956700>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<47.145300,0.000000,36.956700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.145300,0.000000,36.703100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.703100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<47.145300,0.000000,36.703100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.145300,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,36.830000>}
box{<0,0,-0.127000><2.292500,0.035000,0.127000> rotate<0,0.000000,0> translate<47.145300,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.145300,0.000000,36.956700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.956700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<47.145300,0.000000,36.956700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,29.373200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.307200,0.000000,29.245900>}
box{<0,0,-0.127000><0.180100,0.035000,0.127000> rotate<0,44.974536,0> translate<47.179800,0.000000,29.373200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,30.636700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.179800,0.000000,29.373200>}
box{<0,0,-0.127000><1.263500,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.179800,0.000000,29.373200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.352100,0.000000,27.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,27.229000>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.352100,0.000000,27.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,0.000000,24.405800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,0.000000,24.405800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.835300,0.000000,24.405800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,-1.535000,24.405800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,-1.535000,24.405800>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.835300,-1.535000,24.405800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835300,0.000000,39.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,0.000000,39.094100>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.835300,0.000000,39.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,-1.535000,24.405800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081100,-1.535000,24.499200>}
box{<0,0,-0.127000><1.249197,0.035000,0.127000> rotate<0,-4.287613,0> translate<47.835400,-1.535000,24.405800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,0.000000,24.405800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,24.499200>}
box{<0,0,-0.127000><1.249296,0.035000,0.127000> rotate<0,-4.287270,0> translate<47.835400,0.000000,24.405800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,0.000000,39.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,39.000700>}
box{<0,0,-0.127000><1.249296,0.035000,0.127000> rotate<0,4.287270,0> translate<47.835400,0.000000,39.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.835400,-1.535000,39.094100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,-1.535000,39.000700>}
box{<0,0,-0.127000><1.249296,0.035000,0.127000> rotate<0,4.287270,0> translate<47.835400,-1.535000,39.094100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.925800,0.000000,35.699000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,35.922100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.925800,0.000000,35.699000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.925800,0.000000,37.960900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,37.737800>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,44.997030,0> translate<47.925800,0.000000,37.960900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.987200,0.000000,32.030500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.022300,0.000000,31.291500>}
box{<0,0,-0.127000><0.739833,0.035000,0.127000> rotate<0,87.274928,0> translate<47.987200,0.000000,32.030500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.987200,0.000000,32.030500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.293000,0.000000,31.724600>}
box{<0,0,-0.127000><0.432537,0.035000,0.127000> rotate<0,45.006396,0> translate<47.987200,0.000000,32.030500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.988500,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.013600,0.000000,32.004000>}
box{<0,0,-0.127000><0.025100,0.035000,0.127000> rotate<0,0.000000,0> translate<47.988500,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.000600,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.267600,0.000000,31.750000>}
box{<0,0,-0.127000><0.267000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.000600,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.012600,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,31.496000>}
box{<0,0,-0.127000><1.746000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.012600,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.022300,0.000000,31.291500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.146400,0.000000,31.140100>}
box{<0,0,-0.127000><0.195762,0.035000,0.127000> rotate<0,50.655767,0> translate<48.022300,0.000000,31.291500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.040700,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.567100,0.000000,37.846000>}
box{<0,0,-0.127000><1.526400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.040700,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.040800,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.567000,0.000000,35.814000>}
box{<0,0,-0.127000><1.526200,0.035000,0.127000> rotate<0,0.000000,0> translate<48.040800,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.062900,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,31.242000>}
box{<0,0,-0.127000><1.695700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.062900,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.132600,0.000000,28.386700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.132600,0.000000,28.133100>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.132600,0.000000,28.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,27.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,28.132600>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,90.000000,0> translate<48.133100,0.000000,28.132600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,27.432000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133100,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,27.686000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133100,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,27.940000>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133100,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133100,0.000000,28.132600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,28.132600>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133100,0.000000,28.132600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.146400,0.000000,31.140100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.146700,0.000000,31.140100>}
box{<0,0,-0.127000><1.000300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.146400,0.000000,31.140100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,35.922100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.703100>}
box{<0,0,-0.127000><0.781000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.148900,0.000000,36.703100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,36.068000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,36.322000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,36.576000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,36.956700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,37.737800>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,90.000000,0> translate<48.148900,0.000000,37.737800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,37.084000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,37.338000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.148900,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,37.592000>}
box{<0,0,-0.127000><1.288900,0.035000,0.127000> rotate<0,0.000000,0> translate<48.148900,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.282700,0.000000,35.521600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,35.328200>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<48.282700,0.000000,35.521600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.293000,0.000000,31.724600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.563000,0.000000,31.724600>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.293000,0.000000,31.724600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.375200,0.000000,33.150900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,33.251700>}
box{<0,0,-0.127000><0.142623,0.035000,0.127000> rotate<0,-44.968626,0> translate<48.375200,0.000000,33.150900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.375200,0.000000,33.150900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.734900,0.000000,32.791300>}
box{<0,0,-0.127000><0.508622,0.035000,0.127000> rotate<0,44.989065,0> translate<48.375200,0.000000,33.150900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,27.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.167800,0.000000,27.229000>}
box{<0,0,-0.127000><0.781100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.386700,0.000000,27.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,28.132600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.386700,0.000000,27.229000>}
box{<0,0,-0.127000><0.903600,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.386700,0.000000,27.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.387300,0.000000,28.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.387300,0.000000,28.386700>}
box{<0,0,-0.127000><0.253600,0.035000,0.127000> rotate<0,90.000000,0> translate<48.387300,0.000000,28.386700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.387300,0.000000,28.133100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.133100>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.387300,0.000000,28.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.387300,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,28.194000>}
box{<0,0,-0.127000><1.371300,0.035000,0.127000> rotate<0,0.000000,0> translate<48.387300,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.387300,0.000000,28.386700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.386700>}
box{<0,0,-0.127000><1.003600,0.035000,0.127000> rotate<0,0.000000,0> translate<48.387300,0.000000,28.386700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,33.251700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,35.328200>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,90.000000,0> translate<48.476100,0.000000,35.328200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,33.274000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,33.528000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,33.782000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,34.036000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,34.290000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,34.544000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,34.798000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,35.052000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.476100,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,35.306000>}
box{<0,0,-0.127000><0.583700,0.035000,0.127000> rotate<0,0.000000,0> translate<48.476100,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.506200,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,33.020000>}
box{<0,0,-0.127000><2.598800,0.035000,0.127000> rotate<0,0.000000,0> translate<48.506200,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.734900,0.000000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.563000,0.000000,32.791300>}
box{<0,0,-0.127000><0.828100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.734900,0.000000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.801000,0.000000,26.441300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,27.398900>}
box{<0,0,-0.127000><1.354251,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.801000,0.000000,26.441300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,33.251700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.253200,0.000000,33.058300>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<49.059800,0.000000,33.251700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,35.328200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,33.251700>}
box{<0,0,-0.127000><2.076500,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.059800,0.000000,33.251700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.059800,0.000000,35.328200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.253200,0.000000,35.521600>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.059800,0.000000,35.328200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081100,-1.535000,24.499200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,-1.535000,24.499200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.081100,-1.535000,24.499200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,24.499100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,24.499200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,90.000000,0> translate<49.081200,0.000000,24.499200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,24.499100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,0.000000,24.221200>}
box{<0,0,-0.127000><1.249106,0.035000,0.127000> rotate<0,12.853839,0> translate<49.081200,0.000000,24.499100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,-1.535000,24.499200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,-1.535000,24.221200>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,12.858311,0> translate<49.081200,-1.535000,24.499200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,-1.535000,39.000700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,-1.535000,39.278700>}
box{<0,0,-0.127000><1.249128,0.035000,0.127000> rotate<0,-12.858311,0> translate<49.081200,-1.535000,39.000700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.081200,0.000000,39.000700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299100,0.000000,39.278700>}
box{<0,0,-0.127000><1.249226,0.035000,0.127000> rotate<0,-12.857290,0> translate<49.081200,0.000000,39.000700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.146700,0.000000,31.140100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,30.946700>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<49.146700,0.000000,31.140100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.167800,0.000000,27.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,27.452100>}
box{<0,0,-0.127000><0.315511,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.167800,0.000000,27.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.212700,0.000000,29.245900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,29.373200>}
box{<0,0,-0.127000><0.180100,0.035000,0.127000> rotate<0,-44.974536,0> translate<49.212700,0.000000,29.245900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.212700,0.000000,29.245900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,29.067800>}
box{<0,0,-0.127000><0.251942,0.035000,0.127000> rotate<0,44.980950,0> translate<49.212700,0.000000,29.245900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.242900,0.000000,25.374600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.555300,0.000000,25.687000>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.242900,0.000000,25.374600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.248700,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,29.210000>}
box{<0,0,-0.127000><0.509900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.248700,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.253200,0.000000,33.058300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,33.058300>}
box{<0,0,-0.127000><1.851800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.253200,0.000000,33.058300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.253200,0.000000,35.521600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.984600,0.000000,35.521600>}
box{<0,0,-0.127000><0.731400,0.035000,0.127000> rotate<0,0.000000,0> translate<49.253200,0.000000,35.521600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.268300,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,25.400000>}
box{<0,0,-0.127000><1.836700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.268300,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.298800,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,30.988000>}
box{<0,0,-0.127000><0.459800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.298800,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,29.373200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,30.946700>}
box{<0,0,-0.127000><1.573500,0.035000,0.127000> rotate<0,90.000000,0> translate<49.340100,0.000000,30.946700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,29.464000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,29.718000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,29.972000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,30.226000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,30.480000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.340100,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,30.734000>}
box{<0,0,-0.127000><0.418500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.340100,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.370800,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,27.432000>}
box{<0,0,-0.127000><0.387800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.370800,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,27.452100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.133100>}
box{<0,0,-0.127000><0.681000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.390900,0.000000,28.133100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,27.686000>}
box{<0,0,-0.127000><0.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.390900,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,27.940000>}
box{<0,0,-0.127000><0.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.390900,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.386700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,29.067800>}
box{<0,0,-0.127000><0.681100,0.035000,0.127000> rotate<0,90.000000,0> translate<49.390900,0.000000,29.067800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,28.448000>}
box{<0,0,-0.127000><0.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.390900,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,28.702000>}
box{<0,0,-0.127000><0.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.390900,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390900,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,28.956000>}
box{<0,0,-0.127000><0.367700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.390900,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,35.943200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631200,0.000000,35.749800>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,44.997030,0> translate<49.437800,0.000000,35.943200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,37.716700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,35.943200>}
box{<0,0,-0.127000><1.773500,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.437800,0.000000,35.943200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.437800,0.000000,37.716700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631200,0.000000,37.910100>}
box{<0,0,-0.127000><0.273509,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.437800,0.000000,37.716700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.522300,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,25.654000>}
box{<0,0,-0.127000><1.582700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.522300,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.555300,0.000000,25.687000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,26.957000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.555300,0.000000,25.687000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.563000,0.000000,31.724600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,31.529000>}
box{<0,0,-0.127000><0.276620,0.035000,0.127000> rotate<0,44.997030,0> translate<49.563000,0.000000,31.724600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.563000,0.000000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.004900,0.000000,32.791300>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,0.000000,0> translate<49.563000,0.000000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.585600,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,24.384000>}
box{<0,0,-0.127000><1.519400,0.035000,0.127000> rotate<0,0.000000,0> translate<49.585600,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.585900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,24.384000>}
box{<0,0,-0.127000><1.519100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.585900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.586200,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,39.116000>}
box{<0,0,-0.127000><1.518800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.586200,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.586300,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,39.116000>}
box{<0,0,-0.127000><1.518700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.586300,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631200,0.000000,35.749800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.984600,0.000000,35.749800>}
box{<0,0,-0.127000><0.353400,0.035000,0.127000> rotate<0,0.000000,0> translate<49.631200,0.000000,35.749800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631200,0.000000,37.910100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,37.910100>}
box{<0,0,-0.127000><1.473800,0.035000,0.127000> rotate<0,0.000000,0> translate<49.631200,0.000000,37.910100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,31.529000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.758600,0.000000,27.398900>}
box{<0,0,-0.127000><4.130100,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.758600,0.000000,27.398900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.776300,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,25.908000>}
box{<0,0,-0.127000><1.328700,0.035000,0.127000> rotate<0,0.000000,0> translate<49.776300,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.984600,0.000000,35.749800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.984600,0.000000,35.521600>}
box{<0,0,-0.127000><0.228200,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.984600,0.000000,35.521600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.004900,0.000000,32.791300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.512900,0.000000,32.283300>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<50.004900,0.000000,32.791300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.030200,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,32.766000>}
box{<0,0,-0.127000><1.074800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.030200,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.030300,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,26.162000>}
box{<0,0,-0.127000><1.074700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.030300,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.284200,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,32.512000>}
box{<0,0,-0.127000><0.820800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.284200,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.284300,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,26.416000>}
box{<0,0,-0.127000><0.820700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.284300,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,-1.535000,24.221200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299100,-1.535000,24.221200>}
box{<0,0,-0.127000><0.000100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.299000,-1.535000,24.221200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,0.000000,24.221200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,23.755800>}
box{<0,0,-0.127000><0.930716,0.035000,0.127000> rotate<0,30.000989,0> translate<50.299000,0.000000,24.221200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299000,-1.535000,39.278700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,39.744000>}
box{<0,0,-0.127000><0.930666,0.035000,0.127000> rotate<0,-29.995657,0> translate<50.299000,-1.535000,39.278700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299100,-1.535000,24.221200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,23.755900>}
box{<0,0,-0.127000><0.930580,0.035000,0.127000> rotate<0,29.998736,0> translate<50.299100,-1.535000,24.221200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.299100,0.000000,39.278700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,39.744100>}
box{<0,0,-0.127000><0.930630,0.035000,0.127000> rotate<0,-30.004067,0> translate<50.299100,0.000000,39.278700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.457000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,24.130000>}
box{<0,0,-0.127000><0.648000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.457000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.457100,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,24.130000>}
box{<0,0,-0.127000><0.647900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.457100,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.457100,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,39.370000>}
box{<0,0,-0.127000><0.647900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.457100,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.457100,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,39.370000>}
box{<0,0,-0.127000><0.647900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.457100,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.512900,0.000000,32.283300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,31.970900>}
box{<0,0,-0.127000><0.441800,0.035000,0.127000> rotate<0,44.997030,0> translate<50.512900,0.000000,32.283300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.538200,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,32.258000>}
box{<0,0,-0.127000><0.566800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.538200,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.538300,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,26.670000>}
box{<0,0,-0.127000><0.566700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.538300,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.792200,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,32.004000>}
box{<0,0,-0.127000><0.312800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.792200,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.792300,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,26.924000>}
box{<0,0,-0.127000><0.312700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.792300,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,26.957000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.398900>}
box{<0,0,-0.127000><0.441900,0.035000,0.127000> rotate<0,90.000000,0> translate<50.825300,0.000000,27.398900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,27.178000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.398900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,31.970900>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.825300,0.000000,31.970900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,27.432000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,27.686000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,27.940000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,28.194000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,28.448000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,28.702000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,28.956000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,29.210000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,29.464000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,29.718000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,29.972000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,30.226000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,30.480000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,30.734000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,30.988000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,31.242000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,31.496000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825300,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,31.750000>}
box{<0,0,-0.127000><0.279700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.825300,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.896900,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,23.876000>}
box{<0,0,-0.127000><0.208100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.896900,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.897000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,23.876000>}
box{<0,0,-0.127000><0.208000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.897000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.897000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,39.624000>}
box{<0,0,-0.127000><0.208000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.897000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.897100,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,39.624000>}
box{<0,0,-0.127000><0.207900,0.035000,0.127000> rotate<0,0.000000,0> translate<50.897100,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,33.058300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,23.755800>}
box{<0,0,-0.127000><9.302500,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.105000,0.000000,23.755800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,39.744000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,-1.535000,23.755900>}
box{<0,0,-0.127000><15.988100,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.105000,-1.535000,23.755900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,39.744100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.105000,0.000000,37.910100>}
box{<0,0,-0.127000><1.834000,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.105000,0.000000,37.910100> }
texture{col_pol}
}
#end
union{
cylinder{<30.480000,0.038000,27.940000><30.480000,-1.538000,27.940000>0.508000}
cylinder{<30.480000,0.038000,30.480000><30.480000,-1.538000,30.480000>0.508000}
cylinder{<30.480000,0.038000,33.020000><30.480000,-1.538000,33.020000>0.508000}
cylinder{<30.480000,0.038000,35.560000><30.480000,-1.538000,35.560000>0.508000}
cylinder{<30.480000,0.038000,38.100000><30.480000,-1.538000,38.100000>0.508000}
cylinder{<30.480000,0.038000,40.640000><30.480000,-1.538000,40.640000>0.508000}
cylinder{<26.670000,0.038000,27.940000><26.670000,-1.538000,27.940000>0.546100}
cylinder{<26.670000,0.038000,30.480000><26.670000,-1.538000,30.480000>0.546100}
cylinder{<26.670000,0.038000,33.020000><26.670000,-1.538000,33.020000>0.546100}
cylinder{<26.670000,0.038000,35.560000><26.670000,-1.538000,35.560000>0.546100}
//Holes(fast)/Vias
cylinder{<33.274000,0.038000,37.084000><33.274000,-1.538000,37.084000>0.250000 }
cylinder{<34.798000,0.038000,37.846000><34.798000,-1.538000,37.846000>0.250000 }
cylinder{<40.894000,0.038000,30.734000><40.894000,-1.538000,30.734000>0.250000 }
cylinder{<22.098000,0.038000,40.894000><22.098000,-1.538000,40.894000>0.250000 }
cylinder{<38.100000,0.038000,34.798000><38.100000,-1.538000,34.798000>0.250000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,27.508200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,28.592800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<33.400400,0.000000,28.592800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.858000,0.000000,28.050500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.942700,0.000000,28.050500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<32.858000,0.000000,28.050500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,30.048200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,31.132800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<33.400400,0.000000,31.132800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,32.334200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,32.334200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<33.129200,0.000000,32.334200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,32.334200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,32.876500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<32.586900,0.000000,32.876500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,32.876500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,33.418800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.586900,0.000000,32.876500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,33.418800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,33.418800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<33.129200,0.000000,33.418800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,32.334200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,33.418800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<33.400400,0.000000,33.418800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,35.128200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,35.128200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<32.586900,0.000000,35.128200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,35.128200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,35.941600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<32.586900,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,35.941600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.858000,0.000000,36.212800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<32.586900,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.858000,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,36.212800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<32.858000,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.129200,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,35.941600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<33.129200,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,35.941600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.671500,0.000000,36.212800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<33.400400,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.671500,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.942700,0.000000,36.212800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<33.671500,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.942700,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,35.941600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<33.942700,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,35.941600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,35.128200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.213800,0.000000,35.128200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,35.128200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.400400,0.000000,35.941600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<33.400400,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,37.922200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,38.464500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<34.213800,0.000000,38.464500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.213800,0.000000,38.193300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,38.193300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<32.586900,0.000000,38.193300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,37.922200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.586900,0.000000,38.464500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<32.586900,0.000000,38.464500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.550100,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.550100,0.000000,40.797100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<32.550100,0.000000,40.797100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.550100,0.000000,40.797100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.863600,0.000000,41.110700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<32.550100,0.000000,40.797100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.863600,0.000000,41.110700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.177100,0.000000,40.797100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<32.863600,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.177100,0.000000,40.797100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.177100,0.000000,40.170100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.177100,0.000000,40.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.550100,0.000000,40.640400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.177100,0.000000,40.640400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<32.550100,0.000000,40.640400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.955900,0.000000,41.110700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.642300,0.000000,41.110700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.642300,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.642300,0.000000,41.110700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.485600,0.000000,40.953900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<33.485600,0.000000,40.953900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.485600,0.000000,40.953900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.485600,0.000000,40.326800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.485600,0.000000,40.326800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.485600,0.000000,40.326800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.642300,0.000000,40.170100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.485600,0.000000,40.326800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.642300,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.955900,0.000000,40.170100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.642300,0.000000,40.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.955900,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.112600,0.000000,40.326800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.955900,0.000000,40.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.112600,0.000000,40.326800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.112600,0.000000,40.953900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<34.112600,0.000000,40.953900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.112600,0.000000,40.953900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.955900,0.000000,41.110700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<33.955900,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.421100,0.000000,41.110700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.421100,0.000000,40.326800>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.421100,0.000000,40.326800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.421100,0.000000,40.326800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.577800,0.000000,40.170100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.421100,0.000000,40.326800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.577800,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.891400,0.000000,40.170100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.577800,0.000000,40.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.891400,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.048100,0.000000,40.326800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.891400,0.000000,40.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.048100,0.000000,40.326800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.048100,0.000000,41.110700>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,90.000000,0> translate<35.048100,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.670100,0.000000,40.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.670100,0.000000,41.110700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.670100,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.356600,0.000000,41.110700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.983600,0.000000,41.110700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<35.356600,0.000000,41.110700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.700200,0.000000,38.989600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.784800,0.000000,38.989600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<39.700200,0.000000,38.989600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.242500,0.000000,39.532000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.242500,0.000000,38.447300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.242500,0.000000,38.447300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,25.870700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.724100,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,25.557100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<27.724100,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,25.870700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<28.037600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.351100,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.129900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.286600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.659600,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,25.243600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<28.659600,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,25.243600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.908600,0.000000,24.616600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,24.616600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.908600,0.000000,24.616600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,24.616600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,24.773400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<30.065400,0.000000,24.616600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,24.773400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,25.557100>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<30.222100,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.751800,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.595100,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,25.086800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.595100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,24.930100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.595100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.751800,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.530600,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.530600,0.000000,25.557100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.530600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.530600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.000900,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.530600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.000900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.157600,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.000900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.157600,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.157600,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.157600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.936400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.622800,0.000000,24.930100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.622800,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.622800,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.466100,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.466100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.466100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.466100,0.000000,25.400400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<31.466100,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.466100,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.622800,0.000000,25.557100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.466100,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.622800,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.936400,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.622800,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.936400,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.093100,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.936400,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.093100,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.093100,0.000000,25.243600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.093100,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.093100,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.466100,0.000000,25.243600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<31.466100,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.558300,0.000000,25.713900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.558300,0.000000,25.086800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.558300,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.558300,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.715100,0.000000,24.930100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<32.558300,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.401600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.715100,0.000000,25.557100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<32.401600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181900,0.000000,25.557100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<33.025200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181900,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.181900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025200,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.338700,0.000000,24.930100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<33.025200,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181900,0.000000,26.027400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181900,0.000000,25.870700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.181900,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.275800,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.805500,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.805500,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.805500,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.648800,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.648800,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.648800,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.648800,0.000000,25.086800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.648800,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.648800,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.805500,0.000000,24.930100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.648800,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.805500,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.275800,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.805500,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519800,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519800,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.519800,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519800,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.146800,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<35.519800,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455300,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.612000,0.000000,25.557100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.455300,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.612000,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.612000,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.612000,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455300,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.768800,0.000000,24.930100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.455300,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.612000,0.000000,26.027400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.612000,0.000000,25.870700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.612000,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.078900,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.078900,0.000000,25.557100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<37.078900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.078900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.549200,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.078900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.549200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.705900,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.549200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.705900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.705900,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.705900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.484700,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.171100,0.000000,24.930100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.171100,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.171100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014400,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.014400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014400,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014400,0.000000,25.400400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<38.014400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014400,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.171100,0.000000,25.557100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.014400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.171100,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.484700,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.171100,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.484700,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.641400,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.484700,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.641400,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.641400,0.000000,25.243600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.641400,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.641400,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014400,0.000000,25.243600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<38.014400,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.106600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.420200,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.106600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.420200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.576900,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.420200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.576900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.576900,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.576900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.576900,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.106600,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<39.106600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.106600,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.949900,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.949900,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.949900,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.106600,0.000000,25.243600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<38.949900,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.106600,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.576900,0.000000,25.243600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<39.106600,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.885400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.885400,0.000000,25.557100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<39.885400,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.885400,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.198900,0.000000,25.557100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.885400,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.198900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.355700,0.000000,25.557100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<40.198900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.227400,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.600400,0.000000,25.870700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<41.600400,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.600400,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.600400,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.600400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.600400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.227400,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<41.600400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.600400,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.913900,0.000000,25.400400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<41.600400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.535900,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.535900,0.000000,25.557100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<42.535900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.535900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.006200,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<42.535900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.006200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.162900,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<43.006200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.162900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.162900,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.162900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.098400,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.628100,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<43.628100,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.628100,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.471400,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.471400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.471400,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.471400,0.000000,25.086800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.471400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.471400,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.628100,0.000000,24.930100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<43.471400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.628100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.098400,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<43.628100,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.563600,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.877200,0.000000,24.930100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<44.563600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.877200,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.033900,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.877200,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.033900,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.033900,0.000000,25.400400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<45.033900,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.033900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.877200,0.000000,25.557100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<44.877200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.877200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.563600,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<44.563600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.563600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.406900,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.406900,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.406900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.406900,0.000000,25.086800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.406900,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.406900,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.563600,0.000000,24.930100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<44.406900,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.969400,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.969400,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.969400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.969400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.499100,0.000000,24.930100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<45.499100,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.499100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.342400,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<45.342400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.342400,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.342400,0.000000,25.400400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<45.342400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.342400,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.499100,0.000000,25.557100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.342400,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.499100,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.969400,0.000000,25.557100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<45.499100,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.748200,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.434600,0.000000,24.930100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<46.434600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.434600,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.277900,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<46.277900,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.277900,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.277900,0.000000,25.400400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<46.277900,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.277900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.434600,0.000000,25.557100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.277900,0.000000,25.400400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.434600,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.748200,0.000000,25.557100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<46.434600,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.748200,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.904900,0.000000,25.400400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<46.748200,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.904900,0.000000,25.400400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.904900,0.000000,25.243600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.904900,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.904900,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.277900,0.000000,25.243600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<46.277900,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.213400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.213400,0.000000,25.557100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<47.213400,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.213400,0.000000,25.243600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.526900,0.000000,25.557100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.213400,0.000000,25.243600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.526900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.683700,0.000000,25.557100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<47.526900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.928400,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.241900,0.000000,24.930100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,63.430762,0> translate<48.928400,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.241900,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.555400,0.000000,25.557100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,-63.430762,0> translate<49.241900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.863900,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.177400,0.000000,25.870700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<49.863900,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.177400,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.177400,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<50.177400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.863900,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.490900,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<49.863900,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.799400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.799400,0.000000,25.086800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<50.799400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.799400,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.956100,0.000000,25.086800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<50.799400,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.956100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.956100,0.000000,24.930100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<50.956100,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.956100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.799400,0.000000,24.930100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<50.799400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.713900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<51.267100,0.000000,25.713900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.713900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.423800,0.000000,25.870700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<51.267100,0.000000,25.713900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.423800,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.737400,0.000000,25.870700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<51.423800,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.737400,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,25.713900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<51.737400,0.000000,25.870700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,25.713900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,25.086800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.894100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.737400,0.000000,24.930100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.737400,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.737400,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.423800,0.000000,24.930100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<51.423800,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.423800,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.086800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<51.267100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.086800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,25.713900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<51.267100,0.000000,25.086800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,23.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,22.644100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.724100,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,22.800800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.194400,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,23.427900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<28.351100,0.000000,23.427900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,23.427900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,23.584700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<28.194400,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,23.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,23.584700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,22.644100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,22.800800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.659600,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,23.114400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.659600,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,23.271100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.659600,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,23.271100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,23.114400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.129900,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,22.957600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.286600,0.000000,22.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,22.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,22.957600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<28.659600,0.000000,22.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.595100,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,22.800800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.065400,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,22.957600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<30.065400,0.000000,22.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,22.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,22.957600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.751800,0.000000,22.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,22.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,23.114400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<29.595100,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,23.271100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.595100,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.751800,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.222100,0.000000,23.271100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.751800,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.530600,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.687300,0.000000,23.271100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<30.530600,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.687300,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.687300,0.000000,22.644100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.687300,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.530600,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.844100,0.000000,22.644100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<30.530600,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.687300,0.000000,23.741400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.687300,0.000000,23.584700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.687300,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.467700,0.000000,22.330600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.624500,0.000000,22.330600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.467700,0.000000,22.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.624500,0.000000,22.330600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781200,0.000000,22.487400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<31.624500,0.000000,22.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781200,0.000000,22.487400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781200,0.000000,23.271100>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<31.781200,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781200,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310900,0.000000,23.271100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.310900,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310900,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154200,0.000000,23.114400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.154200,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154200,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154200,0.000000,22.800800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.154200,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154200,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310900,0.000000,22.644100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.154200,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310900,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781200,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.310900,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089700,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089700,0.000000,23.271100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<32.089700,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089700,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.560000,0.000000,23.271100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.089700,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.560000,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716700,0.000000,23.114400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.560000,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716700,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716700,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.716700,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960700,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960700,0.000000,23.584700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.960700,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960700,0.000000,23.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,23.584700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.960700,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,23.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,23.427900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.431000,0.000000,23.584700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,23.427900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,23.271100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.587700,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,23.114400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.431000,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,22.957600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.431000,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,22.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,22.800800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.587700,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.587700,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,22.644100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.431000,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960700,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.960700,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960700,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431000,0.000000,23.114400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.960700,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896200,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896200,0.000000,22.800800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.896200,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896200,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.052900,0.000000,22.644100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.896200,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.052900,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.523200,0.000000,22.644100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.052900,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.523200,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.523200,0.000000,22.487400>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.523200,0.000000,22.487400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.523200,0.000000,22.487400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.366500,0.000000,22.330600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<35.366500,0.000000,22.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.366500,0.000000,22.330600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.209700,0.000000,22.330600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.209700,0.000000,22.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,23.271100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.831700,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,23.271100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,23.114400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.988400,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,23.114400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.831700,0.000000,23.114400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,23.114400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,23.271100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<35.831700,0.000000,23.271100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,22.800800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.831700,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,22.800800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,22.644100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.988400,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.988400,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,22.644100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<35.831700,0.000000,22.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,22.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.831700,0.000000,22.800800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<35.831700,0.000000,22.800800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,22.314700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.724100,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,22.314700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,22.001100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<27.724100,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,22.314700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<28.037600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,22.314700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,21.374100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.351100,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,22.001100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.129900,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.129900,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.286600,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,21.530800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.659600,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,21.687600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<28.659600,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,21.687600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.286600,0.000000,21.687600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.816300,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,22.314700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.595100,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,21.687600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<29.595100,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.595100,0.000000,21.687600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.065400,0.000000,22.001100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<29.595100,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.844900,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.531300,0.000000,21.374100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.531300,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.531300,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.374600,0.000000,21.530800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.374600,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.374600,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.374600,0.000000,21.844400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<30.374600,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.374600,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.531300,0.000000,22.001100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.374600,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.531300,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.844900,0.000000,22.001100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<30.531300,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.844900,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.001600,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.844900,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.001600,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.001600,0.000000,21.687600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.001600,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.001600,0.000000,21.687600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.374600,0.000000,21.687600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<30.374600,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310100,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310100,0.000000,22.001100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<31.310100,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310100,0.000000,21.687600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.623600,0.000000,22.001100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.310100,0.000000,21.687600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.623600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.780400,0.000000,22.001100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.623600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089600,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089600,0.000000,22.314700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.089600,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089600,0.000000,22.314700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,22.314700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.089600,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,22.314700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,22.157900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<32.559900,0.000000,22.314700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,22.157900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,22.001100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.716600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.559900,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,21.687600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<32.559900,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,21.687600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,21.530800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.716600,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716600,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,21.374100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.559900,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089600,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.089600,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089600,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559900,0.000000,21.844400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.089600,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181800,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495400,0.000000,21.374100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.181800,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495400,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.652100,0.000000,21.530800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.495400,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.652100,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.652100,0.000000,21.844400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.652100,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.652100,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495400,0.000000,22.001100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.495400,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495400,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181800,0.000000,22.001100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.181800,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181800,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025100,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.025100,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025100,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025100,0.000000,21.530800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.025100,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025100,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181800,0.000000,21.374100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.025100,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.117300,0.000000,22.157900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.117300,0.000000,21.530800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.117300,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.117300,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.274100,0.000000,21.374100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.117300,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.960600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.274100,0.000000,22.001100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<33.960600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.584200,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.584200,0.000000,21.530800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<34.584200,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.584200,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740900,0.000000,21.530800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.584200,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740900,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740900,0.000000,21.374100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.740900,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740900,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.584200,0.000000,21.374100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.584200,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.678900,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208600,0.000000,22.001100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.208600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051900,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.051900,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051900,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051900,0.000000,21.530800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.051900,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051900,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208600,0.000000,21.374100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.051900,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208600,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.678900,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.208600,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.144100,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.457700,0.000000,21.374100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.144100,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.457700,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.614400,0.000000,21.530800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.457700,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.614400,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.614400,0.000000,21.844400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<36.614400,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.614400,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.457700,0.000000,22.001100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.457700,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.457700,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.144100,0.000000,22.001100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.144100,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.144100,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.987400,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.987400,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.987400,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.987400,0.000000,21.530800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.987400,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.987400,0.000000,21.530800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.144100,0.000000,21.374100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.987400,0.000000,21.530800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.922900,0.000000,21.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.922900,0.000000,22.001100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<36.922900,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.922900,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.079600,0.000000,22.001100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.922900,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.079600,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.236400,0.000000,21.844400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<37.079600,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.236400,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.236400,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.236400,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.236400,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.393200,0.000000,22.001100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<37.236400,0.000000,21.844400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.393200,0.000000,22.001100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.549900,0.000000,21.844400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.393200,0.000000,22.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.549900,0.000000,21.844400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.549900,0.000000,21.374100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.549900,0.000000,21.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,19.088100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.880800,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.880800,0.000000,20.028700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<27.880800,0.000000,20.028700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,20.028700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,20.028700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<27.724100,0.000000,20.028700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.347700,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.347700,0.000000,19.715100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<28.347700,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.347700,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.818000,0.000000,19.715100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.347700,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.818000,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.974700,0.000000,19.558400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.818000,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.974700,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.974700,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.974700,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.283200,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.910200,0.000000,19.244800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.753500,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.910200,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,19.401600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<29.753500,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.439900,0.000000,19.401600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.439900,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.439900,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,19.558400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<29.283200,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.439900,0.000000,19.715100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.283200,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.439900,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.910200,0.000000,19.715100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.439900,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.375400,0.000000,19.871900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.375400,0.000000,19.244800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.375400,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.375400,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.532200,0.000000,19.088100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<30.375400,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.218700,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.532200,0.000000,19.715100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<30.218700,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.842300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.842300,0.000000,19.715100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.842300,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.842300,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.155800,0.000000,19.715100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.842300,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.155800,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.312600,0.000000,19.715100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.155800,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.621800,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.621800,0.000000,19.244800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.621800,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.621800,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.778500,0.000000,19.088100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.621800,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.778500,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.248800,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.778500,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.248800,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.248800,0.000000,19.715100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<32.248800,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.184300,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.714000,0.000000,19.715100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.714000,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.714000,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.557300,0.000000,19.558400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.557300,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.557300,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.557300,0.000000,19.244800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.557300,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.557300,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.714000,0.000000,19.088100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.557300,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.714000,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.184300,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.714000,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.649500,0.000000,19.871900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.649500,0.000000,19.244800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.649500,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.649500,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.806300,0.000000,19.088100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<33.649500,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.492800,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.806300,0.000000,19.715100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<33.492800,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.116400,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.273100,0.000000,19.715100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<34.116400,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.273100,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.273100,0.000000,19.088100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.273100,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.116400,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.429900,0.000000,19.088100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<34.116400,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.273100,0.000000,20.185400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.273100,0.000000,20.028700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.273100,0.000000,20.028700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896700,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.210300,0.000000,19.088100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.896700,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.210300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.367000,0.000000,19.244800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.210300,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.367000,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.367000,0.000000,19.558400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.367000,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.367000,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.210300,0.000000,19.715100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.210300,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.210300,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896700,0.000000,19.715100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.896700,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896700,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,19.558400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.740000,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,19.244800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.740000,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.896700,0.000000,19.088100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.740000,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.675500,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.675500,0.000000,19.715100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<35.675500,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.675500,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.145800,0.000000,19.715100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.675500,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.145800,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.302500,0.000000,19.558400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.145800,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.302500,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.302500,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.302500,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611000,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081300,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.611000,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.238000,0.000000,19.244800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.081300,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.238000,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081300,0.000000,19.401600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<37.081300,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081300,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.767700,0.000000,19.401600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.767700,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.767700,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611000,0.000000,19.558400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<36.611000,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611000,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.767700,0.000000,19.715100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.611000,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.767700,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.238000,0.000000,19.715100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.767700,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.715100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<37.546500,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.558400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.703200,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.558400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<37.546500,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.715100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<37.546500,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.244800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<37.546500,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.088100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.703200,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.703200,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.088100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<37.546500,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.546500,0.000000,19.244800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<37.546500,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,17.974800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.724100,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.724100,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.880800,0.000000,17.818100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.724100,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.880800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,17.974800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<27.880800,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.037600,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,17.818100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<28.037600,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.194400,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.194400,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.351100,0.000000,18.445100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<28.351100,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,18.445100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<28.659600,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,17.818100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.816300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.659600,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.973100,0.000000,17.818100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<28.659600,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,18.915400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.816300,0.000000,18.758700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.816300,0.000000,18.758700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,18.758700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.283200,0.000000,18.758700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,18.131600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<29.283200,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.283200,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.753500,0.000000,18.445100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<29.283200,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.062700,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.219400,0.000000,18.445100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<30.062700,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.219400,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.219400,0.000000,17.818100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.219400,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.062700,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.376200,0.000000,17.818100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<30.062700,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.219400,0.000000,18.915400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.219400,0.000000,18.758700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.219400,0.000000,18.758700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.686300,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.686300,0.000000,17.974800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<30.686300,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.686300,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.843000,0.000000,17.974800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<30.686300,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.843000,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.843000,0.000000,17.818100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.843000,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.843000,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.686300,0.000000,17.818100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<30.686300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154000,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154000,0.000000,18.445100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<31.154000,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.154000,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310700,0.000000,18.445100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<31.154000,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.310700,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.467500,0.000000,18.288400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.310700,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.467500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.467500,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.467500,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.467500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.624300,0.000000,18.445100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.467500,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.624300,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781000,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.624300,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781000,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.781000,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.781000,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.246200,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559800,0.000000,18.445100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.246200,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.559800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716500,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.559800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716500,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.716500,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716500,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.246200,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.246200,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.246200,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089500,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.089500,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.089500,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.246200,0.000000,18.131600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<32.089500,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.246200,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.716500,0.000000,18.131600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.246200,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025000,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025000,0.000000,18.758700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.025000,0.000000,18.758700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495300,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025000,0.000000,18.131600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<33.025000,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.025000,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.495300,0.000000,18.445100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<33.025000,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.274800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961200,0.000000,17.818100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.961200,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961200,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.804500,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.804500,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.804500,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.804500,0.000000,18.288400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.804500,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.804500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961200,0.000000,18.445100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.804500,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961200,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.274800,0.000000,18.445100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.961200,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.274800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431500,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.274800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431500,0.000000,18.131600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.431500,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.431500,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.804500,0.000000,18.131600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<33.804500,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,18.445100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<34.740000,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.740000,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.053500,0.000000,18.445100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.740000,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.053500,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.210300,0.000000,18.445100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.053500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519500,0.000000,18.758700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519500,0.000000,17.818100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.519500,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519500,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.989800,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.519500,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.989800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.146500,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.989800,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.146500,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.146500,0.000000,18.288400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<36.146500,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.146500,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.989800,0.000000,18.445100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.989800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.989800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.519500,0.000000,18.445100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.519500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611700,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.925300,0.000000,17.818100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.611700,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.925300,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.082000,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.925300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.082000,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.082000,0.000000,18.288400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.082000,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.082000,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.925300,0.000000,18.445100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.925300,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.925300,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611700,0.000000,18.445100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.611700,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611700,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455000,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.455000,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455000,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455000,0.000000,17.974800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.455000,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455000,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.611700,0.000000,17.818100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.455000,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.547200,0.000000,18.601900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.547200,0.000000,17.974800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.547200,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.547200,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.704000,0.000000,17.818100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<37.547200,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.390500,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.704000,0.000000,18.445100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<37.390500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014100,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014100,0.000000,17.974800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<38.014100,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014100,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.170800,0.000000,17.974800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<38.014100,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.170800,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.170800,0.000000,17.818100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.170800,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.170800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.014100,0.000000,17.818100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<38.014100,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.108800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.638500,0.000000,18.445100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<38.638500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.638500,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.481800,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.481800,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.481800,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.481800,0.000000,17.974800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.481800,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.481800,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.638500,0.000000,17.818100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.481800,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.638500,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.108800,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<38.638500,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.574000,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.887600,0.000000,17.818100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.574000,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.887600,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.044300,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.887600,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.044300,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.044300,0.000000,18.288400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<40.044300,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.044300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.887600,0.000000,18.445100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.887600,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.887600,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.574000,0.000000,18.445100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.574000,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.574000,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.417300,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.417300,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.417300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.417300,0.000000,17.974800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.417300,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.417300,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.574000,0.000000,17.818100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.417300,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.352800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.352800,0.000000,18.445100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<40.352800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.352800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.509500,0.000000,18.445100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<40.352800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.509500,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.666300,0.000000,18.288400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<40.509500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.666300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.666300,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.666300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.666300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.823100,0.000000,18.445100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<40.666300,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.823100,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.979800,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<40.823100,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.979800,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.979800,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.979800,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.288300,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.915300,0.000000,18.758700>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-56.309028,0> translate<41.288300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.223800,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.223800,0.000000,18.445100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<42.223800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.223800,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.380500,0.000000,18.445100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<42.223800,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.380500,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.537300,0.000000,18.288400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<42.380500,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.537300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.537300,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.537300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.537300,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.694100,0.000000,18.445100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<42.537300,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.694100,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.850800,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<42.694100,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.850800,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.850800,0.000000,17.818100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.850800,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.159300,0.000000,18.758700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.316000,0.000000,18.758700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<43.159300,0.000000,18.758700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.316000,0.000000,18.758700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.316000,0.000000,17.818100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.316000,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.159300,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.472800,0.000000,17.818100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<43.159300,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.253200,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.939600,0.000000,17.818100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<43.939600,0.000000,17.818100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.939600,0.000000,17.818100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.782900,0.000000,17.974800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<43.782900,0.000000,17.974800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.782900,0.000000,17.974800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.782900,0.000000,18.288400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<43.782900,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.782900,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.939600,0.000000,18.445100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.782900,0.000000,18.288400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.939600,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.253200,0.000000,18.445100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<43.939600,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.253200,0.000000,18.445100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.409900,0.000000,18.288400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<44.253200,0.000000,18.445100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.409900,0.000000,18.288400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.409900,0.000000,18.131600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.409900,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.409900,0.000000,18.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.782900,0.000000,18.131600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<43.782900,0.000000,18.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,44.742100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.264100,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,44.742100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<30.264100,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.199600,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.356300,0.000000,45.369100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<31.199600,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.356300,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.356300,0.000000,44.742100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.356300,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.199600,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.513100,0.000000,44.742100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<31.199600,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.356300,0.000000,45.839400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.356300,0.000000,45.682700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.356300,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.450200,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.979900,0.000000,45.369100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.979900,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.979900,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.823200,0.000000,45.212400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.823200,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.823200,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.823200,0.000000,44.898800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.823200,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.823200,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.979900,0.000000,44.742100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.823200,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.979900,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.450200,0.000000,44.742100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.979900,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.229000,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.915400,0.000000,44.742100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.915400,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.915400,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.758700,0.000000,44.898800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.758700,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.758700,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.758700,0.000000,45.212400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<32.758700,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.758700,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.915400,0.000000,45.369100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.758700,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.915400,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.229000,0.000000,45.369100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.915400,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.229000,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.385700,0.000000,45.212400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.229000,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.385700,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.385700,0.000000,45.055600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.385700,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.385700,0.000000,45.055600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.758700,0.000000,45.055600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<32.758700,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694200,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694200,0.000000,45.369100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<33.694200,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694200,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.164500,0.000000,45.369100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.694200,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.164500,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.321200,0.000000,45.212400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.164500,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.321200,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.321200,0.000000,44.742100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.321200,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.629700,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.100000,0.000000,44.742100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.629700,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.100000,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.256700,0.000000,44.898800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.100000,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.256700,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.100000,0.000000,45.055600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.100000,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.100000,0.000000,45.055600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.786400,0.000000,45.055600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.786400,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.786400,0.000000,45.055600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.629700,0.000000,45.212400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.629700,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.629700,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.786400,0.000000,45.369100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.629700,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.786400,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.256700,0.000000,45.369100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.786400,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.035500,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.721900,0.000000,44.742100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.721900,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.721900,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.565200,0.000000,44.898800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.565200,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.565200,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.565200,0.000000,45.212400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.565200,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.565200,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.721900,0.000000,45.369100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.565200,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.721900,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.035500,0.000000,45.369100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.721900,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.035500,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.192200,0.000000,45.212400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.035500,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.192200,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.192200,0.000000,45.055600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.192200,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.192200,0.000000,45.055600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.565200,0.000000,45.055600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<35.565200,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,45.369100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.500700,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,45.212400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.657400,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,45.212400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.500700,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,45.369100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<36.500700,0.000000,45.369100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,44.898800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.500700,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,44.742100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.657400,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.657400,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,44.742100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<36.500700,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.500700,0.000000,44.898800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<36.500700,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.530900,0.000000,45.525900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.374200,0.000000,45.682700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<38.374200,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.374200,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.060600,0.000000,45.682700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.060600,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.060600,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.903900,0.000000,45.525900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<37.903900,0.000000,45.525900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.903900,0.000000,45.525900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.903900,0.000000,44.898800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.903900,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.903900,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.060600,0.000000,44.742100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.903900,0.000000,44.898800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.060600,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.374200,0.000000,44.742100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<38.060600,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.374200,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.530900,0.000000,44.898800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.374200,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.530900,0.000000,44.898800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.530900,0.000000,45.212400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<38.530900,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.530900,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.217400,0.000000,45.212400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<38.217400,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.839400,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.839400,0.000000,45.682700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<38.839400,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.839400,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.309700,0.000000,45.682700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<38.839400,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.309700,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466400,0.000000,45.525900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<39.309700,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466400,0.000000,45.525900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466400,0.000000,45.212400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.466400,0.000000,45.212400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466400,0.000000,45.212400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.309700,0.000000,45.055600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<39.309700,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.309700,0.000000,45.055600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.839400,0.000000,45.055600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<38.839400,0.000000,45.055600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.774900,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.774900,0.000000,44.742100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.774900,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.774900,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.401900,0.000000,44.742100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<39.774900,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.337400,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.710400,0.000000,44.742100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<40.710400,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.710400,0.000000,44.742100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.337400,0.000000,45.369100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.710400,0.000000,44.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.337400,0.000000,45.369100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.337400,0.000000,45.525900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<41.337400,0.000000,45.525900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.337400,0.000000,45.525900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.180700,0.000000,45.682700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<41.180700,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.180700,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.867100,0.000000,45.682700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<40.867100,0.000000,45.682700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.867100,0.000000,45.682700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.710400,0.000000,45.525900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<40.710400,0.000000,45.525900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.420800,0.000000,43.845100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.420800,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.420800,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.264100,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,43.374800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.264100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.264100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.420800,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.264100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.420800,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.891100,0.000000,43.218100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.420800,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.762100,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.135100,0.000000,43.218100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<32.135100,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.135100,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.762100,0.000000,43.845100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.135100,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.762100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.762100,0.000000,44.001900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<32.762100,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.762100,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.605400,0.000000,44.158700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<32.605400,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.605400,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.291800,0.000000,44.158700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<32.291800,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.291800,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.135100,0.000000,44.001900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<32.135100,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.070600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.070600,0.000000,44.001900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<33.070600,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.070600,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.227300,0.000000,44.158700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<33.070600,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.227300,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.540900,0.000000,44.158700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.227300,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.540900,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.697600,0.000000,44.001900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<33.540900,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.697600,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.697600,0.000000,43.374800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.697600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.697600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.540900,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.540900,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.540900,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.227300,0.000000,43.218100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.227300,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.227300,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.070600,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.070600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.070600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.697600,0.000000,44.001900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<33.070600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.006100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.006100,0.000000,44.001900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<34.006100,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.006100,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.162800,0.000000,44.158700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.006100,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.162800,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476400,0.000000,44.158700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.162800,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476400,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.633100,0.000000,44.001900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.476400,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.633100,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.633100,0.000000,43.374800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.633100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.633100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476400,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.476400,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.476400,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.162800,0.000000,43.218100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.162800,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.162800,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.006100,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.006100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.006100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.633100,0.000000,44.001900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<34.006100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.941600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.941600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.411900,0.000000,43.218100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.098300,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.411900,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.568600,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.411900,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.568600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.568600,0.000000,44.001900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<35.568600,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.568600,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.411900,0.000000,44.158700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.411900,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.411900,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,44.158700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.098300,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.941600,0.000000,44.001900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.941600,0.000000,44.001900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.941600,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.941600,0.000000,43.845100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.941600,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.941600,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.941600,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.098300,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.568600,0.000000,43.688400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.098300,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.812600,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.812600,0.000000,44.158700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<36.812600,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.812600,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.126100,0.000000,43.845100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<36.812600,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.126100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.439600,0.000000,44.158700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<37.126100,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.439600,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.439600,0.000000,43.218100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.439600,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.904800,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.218400,0.000000,43.845100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.904800,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.218400,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.375100,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.218400,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.375100,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.375100,0.000000,43.218100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.375100,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.375100,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.904800,0.000000,43.218100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.904800,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.904800,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.748100,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.748100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.748100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.904800,0.000000,43.531600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<37.748100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.904800,0.000000,43.531600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.375100,0.000000,43.531600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.904800,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.683600,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.683600,0.000000,44.158700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<38.683600,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.153900,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.683600,0.000000,43.531600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<38.683600,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.683600,0.000000,43.531600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.153900,0.000000,43.845100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<38.683600,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933400,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.619800,0.000000,43.218100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.619800,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.619800,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.463100,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.463100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.463100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.463100,0.000000,43.688400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<39.463100,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.463100,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.619800,0.000000,43.845100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.463100,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.619800,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933400,0.000000,43.845100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.619800,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933400,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.090100,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<39.933400,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.090100,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.090100,0.000000,43.531600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.090100,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.090100,0.000000,43.531600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.463100,0.000000,43.531600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<39.463100,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.398600,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.398600,0.000000,43.845100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<40.398600,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.398600,0.000000,43.531600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.712100,0.000000,43.845100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.398600,0.000000,43.531600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.712100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.868900,0.000000,43.845100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<40.712100,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.178100,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.178100,0.000000,44.158700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<41.178100,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.178100,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,44.158700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<41.178100,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,44.158700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,44.001900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<41.648400,0.000000,44.158700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.845100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.805100,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.648400,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.531600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<41.648400,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.531600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.374800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.805100,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.805100,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.648400,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.178100,0.000000,43.218100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<41.178100,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.178100,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.648400,0.000000,43.688400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<41.178100,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.270300,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.583900,0.000000,43.218100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<42.270300,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.583900,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.740600,0.000000,43.374800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.583900,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.740600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.740600,0.000000,43.688400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<42.740600,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.740600,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.583900,0.000000,43.845100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<42.583900,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.583900,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.270300,0.000000,43.845100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<42.270300,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.270300,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.113600,0.000000,43.688400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.113600,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.113600,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.113600,0.000000,43.374800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.113600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.113600,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.270300,0.000000,43.218100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<42.113600,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.205800,0.000000,44.001900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.205800,0.000000,43.374800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.205800,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.205800,0.000000,43.374800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.362600,0.000000,43.218100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<43.205800,0.000000,43.374800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.049100,0.000000,43.845100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.362600,0.000000,43.845100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<43.049100,0.000000,43.845100> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<40.380000,0.000000,29.930000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<40.390000,0.000000,37.260000>}
box{<0,0,-0.203200><7.330007,0.036000,0.203200> rotate<0,-89.915899,0> translate<40.380000,0.000000,29.930000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.259000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.259000,0.000000,41.529000>}
box{<0,0,-0.127000><1.524000,0.036000,0.127000> rotate<0,90.000000,0> translate<40.259000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.259000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.005000,0.000000,41.275000>}
box{<0,0,-0.127000><0.359210,0.036000,0.127000> rotate<0,-44.997030,0> translate<40.005000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.259000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.513000,0.000000,41.275000>}
box{<0,0,-0.127000><0.359210,0.036000,0.127000> rotate<0,44.997030,0> translate<40.259000,0.000000,41.529000> }
difference{
cylinder{<30.632400,0,43.510200><30.632400,0.036000,43.510200>0.569700 translate<0,0.000000,0>}
cylinder{<30.632400,-0.1,43.510200><30.632400,0.135000,43.510200>0.544300 translate<0,0.000000,0>}}
//A silk screen
object{ARC(0.400800,0.101600,183.690466,356.309534,0.036000) translate<26.162000,0.000000,22.707800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.362000,0.000000,20.132000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.362000,0.000000,22.032000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.362000,0.000000,22.032000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.962000,0.000000,22.032000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.962000,0.000000,20.132000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.962000,0.000000,20.132000> }
difference{
cylinder{<25.612000,0,22.507000><25.612000,0.036000,22.507000>0.150800 translate<0,0.000000,0>}
cylinder{<25.612000,-0.1,22.507000><25.612000,0.135000,22.507000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-0.000000,0> translate<25.562000,0.000000,22.669500>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-0.000000,0> translate<25.424500,0.000000,22.469500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-0.000000,0> translate<25.774500,0.000000,22.419500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-0.000000,0> translate<25.724500,0.000000,22.369500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-0.000000,0> translate<26.762000,0.000000,22.557000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-0.000000,0> translate<26.712000,0.000000,22.369500>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-0.000000,0> translate<26.162000,0.000000,22.182000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-0.000000,0> translate<26.162000,0.000000,19.782000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<25.474500,0.000000,21.644500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<26.849500,0.000000,21.644500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-0.000000,0> translate<26.162000,0.000000,21.257000>}
//B silk screen
object{ARC(0.400800,0.101600,3.690466,176.309534,0.036000) translate<24.130000,0.000000,40.284200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.930000,0.000000,42.860000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.930000,0.000000,40.960000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.930000,0.000000,40.960000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.330000,0.000000,40.960000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.330000,0.000000,42.860000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<23.330000,0.000000,42.860000> }
difference{
cylinder{<24.680000,0,40.485000><24.680000,0.036000,40.485000>0.150800 translate<0,0.000000,0>}
cylinder{<24.680000,-0.1,40.485000><24.680000,0.135000,40.485000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-180.000000,0> translate<24.730000,0.000000,40.322500>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-180.000000,0> translate<24.867500,0.000000,40.522500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-180.000000,0> translate<24.517500,0.000000,40.572500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-180.000000,0> translate<24.567500,0.000000,40.622500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-180.000000,0> translate<23.530000,0.000000,40.435000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-180.000000,0> translate<23.580000,0.000000,40.622500>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-180.000000,0> translate<24.130000,0.000000,40.810000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-180.000000,0> translate<24.130000,0.000000,43.210000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-180.000000,0> translate<24.817500,0.000000,41.347500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-180.000000,0> translate<23.442500,0.000000,41.347500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-180.000000,0> translate<24.130000,0.000000,41.735000>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.920000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.920000,0.000000,28.829000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.920000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.600000,0.000000,29.566000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.600000,0.000000,28.829000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.600000,0.000000,28.829000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-270.000000,0> translate<48.261000,0.000000,29.927100>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-270.000000,0> translate<48.261100,0.000000,28.479400>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,37.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,29.822000>}
box{<0,0,-0.101600><7.536000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.385000,0.000000,29.822000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,29.822000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.355000,0.000000,29.822000>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.355000,0.000000,29.822000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.355000,0.000000,29.822000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.355000,0.000000,37.358000>}
box{<0,0,-0.101600><7.536000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.355000,0.000000,37.358000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.355000,0.000000,37.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,37.358000>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.355000,0.000000,37.358000> }
difference{
cylinder{<37.005000,0,36.175000><37.005000,0.036000,36.175000>0.491600 translate<0,0.000000,0>}
cylinder{<37.005000,-0.1,36.175000><37.005000,0.135000,36.175000>0.288400 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,36.564900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,35.914900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,35.264900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,34.614900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,33.964900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,33.314900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,32.664900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,32.014900>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,32.015000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,32.665000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,33.315000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,33.965000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,34.615000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,35.265000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,35.915000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,36.565000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,31.365000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<35.721300,0.000000,30.715000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,31.365000>}
box{<-0.162500,0,-0.536200><0.162500,0.036000,0.536200> rotate<0,-270.000000,0> translate<43.018700,0.000000,30.715000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,36.830000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,36.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,37.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,38.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,39.370000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,38.735000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,37.465000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,32.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,33.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,34.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,33.655000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.385000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,34.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,34.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,29.210000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,28.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,29.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,31.750000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,31.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,26.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,41.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,41.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,41.275000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.005000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,40.005000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<30.480000,0.000000,40.640000>}
//POWER silk screen
object{ARC(0.400800,0.101600,273.690466,446.309534,0.036000) translate<47.142200,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.718000,0.000000,36.030000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.818000,0.000000,36.030000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<47.818000,0.000000,36.030000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.818000,0.000000,37.630000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.718000,0.000000,37.630000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<47.818000,0.000000,37.630000> }
difference{
cylinder{<47.343000,0,36.280000><47.343000,0.036000,36.280000>0.150800 translate<0,0.000000,0>}
cylinder{<47.343000,-0.1,36.280000><47.343000,0.135000,36.280000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-90.000000,0> translate<47.180500,0.000000,36.230000>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-90.000000,0> translate<47.380500,0.000000,36.092500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-90.000000,0> translate<47.430500,0.000000,36.442500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-90.000000,0> translate<47.480500,0.000000,36.392500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-90.000000,0> translate<47.293000,0.000000,37.430000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-90.000000,0> translate<47.480500,0.000000,37.380000>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-90.000000,0> translate<47.668000,0.000000,36.830000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-90.000000,0> translate<50.068000,0.000000,36.830000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<48.205500,0.000000,36.142500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-90.000000,0> translate<48.205500,0.000000,37.517500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-90.000000,0> translate<48.593000,0.000000,36.830000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.857200,0.000000,40.957500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.857200,0.000000,42.875200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<25.857200,0.000000,42.875200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.482800,0.000000,40.957500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.482800,0.000000,42.875200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<27.482800,0.000000,42.875200> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<26.670000,0.000000,43.230800>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<26.670000,0.000000,40.589200>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.434800,0.000000,22.034500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.434800,0.000000,20.116800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.434800,0.000000,20.116800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.809200,0.000000,22.034500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.809200,0.000000,20.116800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.809200,0.000000,20.116800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<23.622000,0.000000,19.761200>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<23.622000,0.000000,22.402800>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.815500,0.000000,35.102800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.733200,0.000000,35.102800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<47.815500,0.000000,35.102800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.815500,0.000000,33.477200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.733200,0.000000,33.477200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<47.815500,0.000000,33.477200> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<50.088800,0.000000,34.290000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<47.447200,0.000000,34.290000>}
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.036800,0.000000,26.500100>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.036800,0.000000,26.522300>}
box{<0,0,-0.025400><0.022200,0.036000,0.025400> rotate<0,90.000000,0> translate<15.036800,0.000000,26.522300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.986000,0.000000,26.487400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.986000,0.000000,26.535000>}
box{<0,0,-0.025400><0.047600,0.036000,0.025400> rotate<0,90.000000,0> translate<14.986000,0.000000,26.535000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.935200,0.000000,26.474700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.935200,0.000000,26.547700>}
box{<0,0,-0.025400><0.073000,0.036000,0.025400> rotate<0,90.000000,0> translate<14.935200,0.000000,26.547700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.884400,0.000000,26.462000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.884400,0.000000,26.560400>}
box{<0,0,-0.025400><0.098400,0.036000,0.025400> rotate<0,90.000000,0> translate<14.884400,0.000000,26.560400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.833600,0.000000,26.449300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.833600,0.000000,26.573100>}
box{<0,0,-0.025400><0.123800,0.036000,0.025400> rotate<0,90.000000,0> translate<14.833600,0.000000,26.573100> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.782800,0.000000,26.436600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.782800,0.000000,26.585800>}
box{<0,0,-0.025400><0.149200,0.036000,0.025400> rotate<0,90.000000,0> translate<14.782800,0.000000,26.585800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.732000,0.000000,26.423900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.732000,0.000000,26.598500>}
box{<0,0,-0.025400><0.174600,0.036000,0.025400> rotate<0,90.000000,0> translate<14.732000,0.000000,26.598500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.681200,0.000000,26.411200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.681200,0.000000,26.611200>}
box{<0,0,-0.025400><0.200000,0.036000,0.025400> rotate<0,90.000000,0> translate<14.681200,0.000000,26.611200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.630400,0.000000,26.398500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.630400,0.000000,26.623900>}
box{<0,0,-0.025400><0.225400,0.036000,0.025400> rotate<0,90.000000,0> translate<14.630400,0.000000,26.623900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.579600,0.000000,26.385800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.579600,0.000000,26.636600>}
box{<0,0,-0.025400><0.250800,0.036000,0.025400> rotate<0,90.000000,0> translate<14.579600,0.000000,26.636600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.528800,0.000000,26.373100>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.528800,0.000000,26.649300>}
box{<0,0,-0.025400><0.276200,0.036000,0.025400> rotate<0,90.000000,0> translate<14.528800,0.000000,26.649300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.478000,0.000000,26.360400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.478000,0.000000,26.662000>}
box{<0,0,-0.025400><0.301600,0.036000,0.025400> rotate<0,90.000000,0> translate<14.478000,0.000000,26.662000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.427200,0.000000,26.347700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.427200,0.000000,26.674700>}
box{<0,0,-0.025400><0.327000,0.036000,0.025400> rotate<0,90.000000,0> translate<14.427200,0.000000,26.674700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.376400,0.000000,26.335000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.376400,0.000000,26.687400>}
box{<0,0,-0.025400><0.352400,0.036000,0.025400> rotate<0,90.000000,0> translate<14.376400,0.000000,26.687400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.325600,0.000000,26.322300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.325600,0.000000,26.700100>}
box{<0,0,-0.025400><0.377800,0.036000,0.025400> rotate<0,90.000000,0> translate<14.325600,0.000000,26.700100> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.274800,0.000000,26.309600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.274800,0.000000,26.712800>}
box{<0,0,-0.025400><0.403200,0.036000,0.025400> rotate<0,90.000000,0> translate<14.274800,0.000000,26.712800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.224000,0.000000,26.296900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.224000,0.000000,26.725500>}
box{<0,0,-0.025400><0.428600,0.036000,0.025400> rotate<0,90.000000,0> translate<14.224000,0.000000,26.725500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,25.558700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,37.941300>}
box{<0,0,-0.127000><12.382600,0.036000,0.127000> rotate<0,90.000000,0> translate<24.765000,0.000000,37.941300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.225000,0.000000,30.480000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.225000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.225000,0.000000,33.020000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<22.225000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.225000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,33.020000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,27.622500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,28.575000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,30.480000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,34.925000>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,35.877500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,35.877500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.875000,0.000000,28.575000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.875000,0.000000,28.575000> }
object{ARC(1.270000,0.254000,180.000000,270.000000,0.036000) translate<15.875000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.605000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.605000,0.000000,33.655000>}
box{<0,0,-0.127000><3.810000,0.036000,0.127000> rotate<0,90.000000,0> translate<14.605000,0.000000,33.655000> }
object{ARC(1.270000,0.254000,90.000000,180.000000,0.036000) translate<15.875000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.875000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.510000,0.000000,34.925000>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.875000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,28.575000>}
box{<0,0,-0.127000><2.222500,0.036000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,28.575000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,28.575000> }
object{ARC(0.254000,0.254000,270.000000,360.000000,0.036000) translate<26.733500,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,29.845000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,29.845000> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<26.733500,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,28.829000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<26.987500,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,31.115000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.400000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,32.385000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,31.115000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,31.115000> }
object{ARC(0.254000,0.254000,270.000000,360.000000,0.036000) translate<26.733500,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,32.385000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,32.385000> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<26.733500,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,31.369000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<26.987500,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,33.655000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.400000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,34.925000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,33.655000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,33.655000> }
object{ARC(0.254000,0.254000,270.000000,360.000000,0.036000) translate<26.733500,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,34.925000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,34.925000> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<26.733500,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,33.909000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<26.987500,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,36.195000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.400000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,26.352500>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.765000,0.000000,26.352500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,26.352500>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,26.352500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,27.305000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,27.305000> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<26.733500,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,26.352500>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,-90.000000,0> translate<26.987500,0.000000,26.352500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.733500,0.000000,36.195000>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,36.195000> }
object{ARC(0.254000,0.254000,270.000000,360.000000,0.036000) translate<26.733500,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,37.147500>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,90.000000,0> translate<26.987500,0.000000,37.147500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.987500,0.000000,37.147500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,37.147500>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,37.147500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,37.147500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.765000,0.000000,37.147500>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.765000,0.000000,37.147500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.400000,0.000000,37.147500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,37.147500> }
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-90.000000,0> translate<26.035000,0.000000,27.940000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-90.000000,0> translate<26.035000,0.000000,30.480000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-90.000000,0> translate<26.035000,0.000000,33.020000>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-90.000000,0> translate<26.035000,0.000000,35.560000>}
//U$3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<17.780000,0.000000,20.320000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<17.780000,0.000000,20.320000>}
difference{
cylinder{<17.780000,0,20.320000><17.780000,0.036000,20.320000>3.505200 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,20.320000><17.780000,0.135000,20.320000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<17.780000,0,20.320000><17.780000,0.036000,20.320000>0.990600 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,20.320000><17.780000,0.135000,20.320000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<17.780000,0,20.320000><17.780000,0.036000,20.320000>1.701600 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,20.320000><17.780000,0.135000,20.320000>1.498400 translate<0,0.000000,0>}}
//U$4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<17.780000,0.000000,43.180000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<17.780000,0.000000,43.180000>}
difference{
cylinder{<17.780000,0,43.180000><17.780000,0.036000,43.180000>3.505200 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,43.180000><17.780000,0.135000,43.180000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<17.780000,0,43.180000><17.780000,0.036000,43.180000>0.990600 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,43.180000><17.780000,0.135000,43.180000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<17.780000,0,43.180000><17.780000,0.036000,43.180000>1.701600 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,43.180000><17.780000,0.135000,43.180000>1.498400 translate<0,0.000000,0>}}
//U$5 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<48.768000,0.000000,43.180000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<48.768000,0.000000,43.180000>}
difference{
cylinder{<48.768000,0,43.180000><48.768000,0.036000,43.180000>3.505200 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,43.180000><48.768000,0.135000,43.180000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<48.768000,0,43.180000><48.768000,0.036000,43.180000>0.990600 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,43.180000><48.768000,0.135000,43.180000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<48.768000,0,43.180000><48.768000,0.036000,43.180000>1.701600 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,43.180000><48.768000,0.135000,43.180000>1.498400 translate<0,0.000000,0>}}
//U$6 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<48.768000,0.000000,20.320000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<48.768000,0.000000,20.320000>}
difference{
cylinder{<48.768000,0,20.320000><48.768000,0.036000,20.320000>3.505200 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,20.320000><48.768000,0.135000,20.320000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<48.768000,0,20.320000><48.768000,0.036000,20.320000>0.990600 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,20.320000><48.768000,0.135000,20.320000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<48.768000,0,20.320000><48.768000,0.036000,20.320000>1.701600 translate<0,0.000000,0>}
cylinder{<48.768000,-0.1,20.320000><48.768000,0.135000,20.320000>1.498400 translate<0,0.000000,0>}}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAGNETIC_LINEAR_ENCODER(-33.236000,0,-31.745000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//A		CHIPLED_1206
//B		CHIPLED_1206
//POWER		CHIPLED_1206
//U$2	CDROM	70553-04
//U$3		3,0
//U$4		3,0
//U$5		3,0
//U$6		3,0
