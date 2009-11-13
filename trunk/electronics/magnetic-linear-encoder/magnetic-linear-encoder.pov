//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/magnetic-linear-encoder/magnetic-linear-encoder.brd
//11/13/09 2:13 PM

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
#declare global_seed=seed(994);
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
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_1206(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<48.260000,0.000000,29.210000>translate<0,0.035000,0> }#end		//SMD Capacitor 1206 C1 100nF C1206
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP20("AS5306","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,33.640000>translate<0,0.035000,0> }#end		//SSOP20 IC1 AS5306 SSOP20
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
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<48.260000,0.000000,30.610000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<48.260000,0.000000,27.810000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,36.565000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,35.915000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,35.265000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,34.615000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,33.965000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,33.315000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,32.665000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,32.015000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,31.365000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<36.455000,0.000000,30.715000>}
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
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.480000,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.518000,0.000000,36.830000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.018000,0.000000,36.830000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.670000,0.000000,43.332000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.670000,0.000000,40.488000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.622000,0.000000,19.660000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.622000,0.000000,22.504000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.190000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.346000,0.000000,34.290000>}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.701800,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.701800,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.701800,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.701800,1.092200,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.670000,0,35.560000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<33.274000,0,37.084000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<34.798000,0,37.846000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<40.894000,0,30.734000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<22.098000,0,40.894000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<38.100000,0,34.798000> texture{col_thl}}
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,-1.535000,43.942000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,27.940000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,39.370000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.162000,0.000000,25.258000>}
box{<0,0,-0.203200><3.792921,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,0.000000,27.940000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,37.069000>}
box{<0,0,-0.203200><1.098844,0.035000,0.203200> rotate<0,44.997030,0> translate<34.798000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.189000,0.000000,32.665000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,32.665000>}
box{<0,0,-0.203200><2.266000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.189000,0.000000,32.665000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.203000,0.000000,34.615000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,34.615000>}
box{<0,0,-0.203200><3.252000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.203000,0.000000,34.615000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.443000,0.000000,35.915000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,35.915000>}
box{<0,0,-0.203200><2.012000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.443000,0.000000,35.915000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.575000,0.000000,37.069000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,36.565000>}
box{<0,0,-0.203200><1.014108,0.035000,0.203200> rotate<0,29.798977,0> translate<35.575000,0.000000,37.069000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,35.265000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.633000,0.000000,35.265000>}
box{<0,0,-0.203200><1.178000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.455000,0.000000,35.265000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157000,0.000000,33.315000>}
box{<0,0,-0.203200><2.702000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.455000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,40.640000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.455000,0.000000,32.015000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.635000,0.000000,32.015000>}
box{<0,0,-0.203200><3.180000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.455000,0.000000,32.015000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,34.036000>}
box{<0,0,-0.203200><1.019648,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.157000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,34.036000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.878000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,38.354000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<38.862000,0.000000,39.370000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,27.810000>}
box{<0,0,-0.203200><2.678078,0.035000,0.203200> rotate<0,9.672717,0> translate<45.620000,0.000000,28.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,30.610000>}
box{<0,0,-0.203200><0.900580,0.035000,0.203200> rotate<0,32.205572,0> translate<47.498000,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.457000,0.000000,33.315000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,32.258000>}
box{<0,0,-0.203200><1.494824,0.035000,0.203200> rotate<0,44.997030,0> translate<47.457000,0.000000,33.315000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.162000,0.000000,25.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.672000,0.000000,25.258000>}
box{<0,0,-0.203200><16.510000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.162000,0.000000,25.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.514000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,32.258000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.514000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.190000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,34.618000>}
box{<0,0,-0.203200><0.463862,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.190000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,34.618000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.518000,0.000000,36.830000>}
box{<0,0,-0.203200><2.212000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.518000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.672000,0.000000,25.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.942000,0.000000,26.528000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.672000,0.000000,25.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.942000,0.000000,31.100000>}
box{<0,0,-0.203200><1.637659,0.035000,0.203200> rotate<0,44.997030,0> translate<49.784000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.942000,0.000000,26.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.942000,0.000000,31.100000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.942000,0.000000,31.100000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,0.000000,46.736000>}
box{<0,0,-0.127000><29.972000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.224000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,46.736000>}
box{<0,0,-0.127000><29.972000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.224000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,0.000000,16.764000>}
box{<0,0,-0.127000><38.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.224000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,-1.535000,16.764000>}
box{<0,0,-0.127000><38.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.224000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,0.000000,46.736000>}
box{<0,0,-0.127000><38.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.224000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,-1.535000,46.736000>}
box{<0,0,-0.127000><38.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.224000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,0.000000,16.764000>}
box{<0,0,-0.127000><29.972000,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.324000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.324000,-1.535000,16.764000>}
box{<0,0,-0.127000><29.972000,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.324000,-1.535000,16.764000> }
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
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,25.557100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.580600,0.000000,25.870700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<51.267100,0.000000,25.557100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.580600,0.000000,25.870700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.580600,0.000000,24.930100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.580600,0.000000,24.930100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.267100,0.000000,24.930100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.894100,0.000000,24.930100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<51.267100,0.000000,24.930100> }
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
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.047000,0.000000,30.175000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.047000,0.000000,28.245000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<49.047000,0.000000,28.245000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.473000,0.000000,30.175000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.473000,0.000000,28.245000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.473000,0.000000,28.245000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<48.259000,0.000000,30.536700>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<48.260900,0.000000,27.883300>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,37.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,29.822000>}
box{<0,0,-0.101600><7.536000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.385000,0.000000,29.822000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,29.822000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.235000,0.000000,29.822000>}
box{<0,0,-0.101600><5.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.235000,0.000000,29.822000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.235000,0.000000,29.822000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.235000,0.000000,37.358000>}
box{<0,0,-0.101600><7.536000,0.036000,0.101600> rotate<0,90.000000,0> translate<37.235000,0.000000,37.358000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.235000,0.000000,37.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.385000,0.000000,37.358000>}
box{<0,0,-0.101600><5.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.235000,0.000000,37.358000> }
difference{
cylinder{<37.885000,0,36.810000><37.885000,0.036000,36.810000>0.491600 translate<0,0.000000,0>}
cylinder{<37.885000,-0.1,36.810000><37.885000,0.135000,36.810000>0.288400 translate<0,0.000000,0>}}
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
