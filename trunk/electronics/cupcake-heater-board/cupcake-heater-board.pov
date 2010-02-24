//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/cupcake-heater-board/cupcake-heater-board.brd
//2/24/10 12:24 PM

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
#local cam_y = 430;
#local cam_z = -229;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -10;
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

#local lgt1_pos_x = 38;
#local lgt1_pos_y = 56;
#local lgt1_pos_z = 53;
#local lgt1_intense = 0.842857;
#local lgt2_pos_x = -38;
#local lgt2_pos_y = 56;
#local lgt2_pos_z = 53;
#local lgt2_intense = 0.842857;
#local lgt3_pos_x = 38;
#local lgt3_pos_y = 56;
#local lgt3_pos_z = -36;
#local lgt3_intense = 0.842857;
#local lgt4_pos_x = -38;
#local lgt4_pos_y = 56;
#local lgt4_pos_z = -36;
#local lgt4_intense = 0.842857;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 100.000000;
#declare pcb_y_size = 100.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(237);
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
	//translate<-50.000000,0,-50.000000>
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


#macro CUPCAKE_HEATER_BOARD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><100.000000,0.000000>
<100.000000,0.000000><100.000000,100.000000>
<100.000000,100.000000><0.000000,100.000000>
<0.000000,100.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<50.000000,1,50.000000><50.000000,-5,50.000000>1.500000 texture{col_hls}}
cylinder{<4.000000,1,4.038100><4.000000,-5,4.038100>1.800000 texture{col_hls}}
cylinder{<4.000000,1,50.000000><4.000000,-5,50.000000>1.800000 texture{col_hls}}
cylinder{<4.000000,1,95.962000><4.000000,-5,95.962000>1.800000 texture{col_hls}}
cylinder{<96.000000,1,95.962000><96.000000,-5,95.962000>1.800000 texture{col_hls}}
cylinder{<96.000000,1,50.000000><96.000000,-5,50.000000>1.800000 texture{col_hls}}
cylinder{<96.000000,1,4.038100><96.000000,-5,4.038100>1.800000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_1206(DarkWood)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<74.168000,-1.500000,94.742000>translate<0,-0.035000,0> }#end		//SMD Capacitor 1206 C1  C1206
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_1206(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<24.638000,0.000000,94.742000>translate<0,0.035000,0> }#end		//SMD Capacitor 1206 C2  C1206
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<80.518000,-1.500000,94.742000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R1  1206
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.288000,0.000000,94.742000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R2  1206
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,85.090000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R4  1206
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,76.200000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R5  1206
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,67.310000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R6  1206
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,58.420000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R7  1206
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,39.370000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R8  1206
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,12.700000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R9  1206
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<75.311000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R10  1206
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<66.421000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R11  1206
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<57.531000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R12  1206
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,78.740000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R13  1206
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,87.630000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R14  1206
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,69.850000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R15  1206
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,60.960000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R16  1206
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,41.910000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R17  1206
#ifndef(pack_R18) #declare global_pack_R18=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,33.020000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R18  1206
#ifndef(pack_R19) #declare global_pack_R19=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,24.130000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R19  1206
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,15.240000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R20  1206
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<13.081000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R21  1206
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<21.971000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R22  1206
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<30.861000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R23  1206
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<39.751000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R24  1206
#ifndef(pack_R25) #declare global_pack_R25=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<48.641000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R25  1206
#ifndef(pack_R26) #declare global_pack_R26=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<84.201000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R26  1206
#ifndef(pack_R27) #declare global_pack_R27=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,21.590000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R27  1206
#ifndef(pack_R28) #declare global_pack_R28=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<95.250000,-1.500000,30.480000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R28  1206
#ifndef(pack_R29) #declare global_pack_R29=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<76.962000,-1.500000,94.742000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R29  1206
#ifndef(pack_R30) #declare global_pack_R30=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.844000,0.000000,94.742000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R30  1206
#ifndef(pack_R32) #declare global_pack_R32=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,85.090000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R32  1206
#ifndef(pack_R33) #declare global_pack_R33=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,76.200000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R33  1206
#ifndef(pack_R34) #declare global_pack_R34=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,67.310000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R34  1206
#ifndef(pack_R35) #declare global_pack_R35=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,58.420000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R35  1206
#ifndef(pack_R36) #declare global_pack_R36=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,39.370000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R36  1206
#ifndef(pack_R37) #declare global_pack_R37=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<83.820000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R37  1206
#ifndef(pack_R38) #declare global_pack_R38=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<74.930000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R38  1206
#ifndef(pack_R39) #declare global_pack_R39=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<66.040000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R39  1206
#ifndef(pack_R40) #declare global_pack_R40=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<57.150000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R40  1206
#ifndef(pack_R41) #declare global_pack_R41=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,78.740000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R41  1206
#ifndef(pack_R42) #declare global_pack_R42=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,87.630000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R42  1206
#ifndef(pack_R43) #declare global_pack_R43=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,69.850000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R43  1206
#ifndef(pack_R44) #declare global_pack_R44=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,60.960000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R44  1206
#ifndef(pack_R45) #declare global_pack_R45=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,41.910000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R45  1206
#ifndef(pack_R46) #declare global_pack_R46=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,33.020000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R46  1206
#ifndef(pack_R47) #declare global_pack_R47=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,24.130000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R47  1206
#ifndef(pack_R48) #declare global_pack_R48=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.080000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R48  1206
#ifndef(pack_R49) #declare global_pack_R49=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<12.700000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R49  1206
#ifndef(pack_R50) #declare global_pack_R50=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.590000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R50  1206
#ifndef(pack_R51) #declare global_pack_R51=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<30.480000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R51  1206
#ifndef(pack_R52) #declare global_pack_R52=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.370000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R52  1206
#ifndef(pack_R53) #declare global_pack_R53=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.260000,0.000000,5.080000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R53  1206
#ifndef(pack_R54) #declare global_pack_R54=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,12.700000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R54  1206
#ifndef(pack_R55) #declare global_pack_R55=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,21.590000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R55  1206
#ifndef(pack_R56) #declare global_pack_R56=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<95.250000,0.000000,30.480000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R56  1206
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.168000,-1.537000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.168000,-1.537000,96.142000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.638000,0.000000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.638000,0.000000,96.142000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<70.358000,-1.537000,94.996000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.702000,0.000000,94.996000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,87.630000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,87.630000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,78.740000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,78.740000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,69.850000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,69.850000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<77.851000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<77.851000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.961000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.961000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<60.071000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<60.071000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,76.200000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,76.200000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,85.090000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,85.090000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,67.310000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,67.310000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,30.480000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,30.480000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,21.590000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,21.590000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,-1.537000,12.700000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,-1.537000,12.700000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.621000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.621000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.511000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.511000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.401000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.401000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<42.291000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<42.291000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<51.181000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<51.181000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<86.741000,-1.537000,5.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<86.741000,-1.537000,2.818000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,24.130000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,24.130000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,85.090000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,85.090000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,76.200000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,76.200000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,67.310000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,67.310000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,58.420000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,58.420000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,39.370000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,39.370000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.580000,0.000000,12.700000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.580000,0.000000,12.700000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.240000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.240000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.130000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.130000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.020000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.020000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<41.910000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<41.910000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.800000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.800000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<59.690000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<59.690000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.580000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.580000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<77.470000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<77.470000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<86.360000,0.000000,6.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<86.360000,0.000000,3.580000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,60.960000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,60.960000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,69.850000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,69.850000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,78.740000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,78.740000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<93.750000,0.000000,87.630000>}
object{TOOLS_PCB_SMD(1.200000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<96.750000,0.000000,87.630000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<86.167000,-1.537000,96.553000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.711000,0.000000,96.045000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<89.375000,-1.537000,96.553000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.315000,0.000000,96.045000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<80.518000,-1.537000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<80.518000,-1.537000,96.142000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.288000,0.000000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.288000,0.000000,96.142000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,85.090000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,85.090000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,76.200000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,76.200000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,67.310000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,67.310000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,12.700000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,12.700000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.311000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.311000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.421000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.421000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<57.531000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<57.531000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,78.740000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,78.740000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,87.630000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,87.630000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,69.850000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,69.850000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,24.130000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,24.130000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.081000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.081000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.971000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.971000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.751000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.751000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.641000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.641000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<84.201000,-1.537000,2.918000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<84.201000,-1.537000,5.718000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,21.590000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,21.590000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,-1.537000,30.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,-1.537000,30.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.962000,-1.537000,96.142000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.962000,-1.537000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.844000,0.000000,96.142000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.844000,0.000000,93.342000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,85.090000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,85.090000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,76.200000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,76.200000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,67.310000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,67.310000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,58.420000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,58.420000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,39.370000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,39.370000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<83.820000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<83.820000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.930000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.930000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.040000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.040000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<57.150000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<57.150000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,78.740000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,78.740000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,87.630000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,87.630000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,69.850000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,69.850000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,60.960000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,60.960000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.680000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.480000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.700000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.700000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.590000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.590000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.480000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.480000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.370000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.370000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.260000,0.000000,3.680000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.260000,0.000000,6.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,12.700000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,12.700000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<96.650000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<93.850000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.738000,-1.537000,94.996000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.814000,0.000000,94.996000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.548000,-1.537000,94.996000>}
object{TOOLS_PCB_SMD(1.828800,5.080000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.258000,0.000000,94.996000>}
//Pads/Vias
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<90.170000,0,92.964000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<86.106000,0,91.694000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<96.266000,0,90.424000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<13.716000,0,92.456000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<10.160000,0,92.710000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,14.478000>}
box{<0,0,-0.203200><11.684000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,23.114000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,32.258000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,41.656000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,59.944000>}
box{<0,0,-0.203200><18.288000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,68.580000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,78.232000>}
box{<0,0,-0.203200><9.652000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,86.360000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.016000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,16.002000>}
box{<0,0,-0.203200><13.716000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,24.892000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,33.528000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,42.672000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,61.214000>}
box{<0,0,-0.203200><18.542000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,70.358000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,70.358000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,70.358000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,78.994000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,87.884000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,87.884000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,87.884000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,88.900000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,60.960000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,78.740000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,78.740000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,87.884000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,87.630000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,87.884000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,-1.535000,15.240000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,-1.535000,33.020000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,0.000000,33.020000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,70.358000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,0.000000,69.850000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,70.358000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,15.240000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,-1.535000,24.130000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,24.130000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,41.910000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,-1.535000,60.960000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,1.270000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,-1.535000,69.850000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,-1.535000,87.630000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.016000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.016000,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.794000,-1.535000,1.016000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<1.016000,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,88.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.172000,0.000000,90.802000>}
box{<0,0,-0.203200><2.689834,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.270000,0.000000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,15.240000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.778000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,15.240000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.032000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,24.130000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.032000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,24.130000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.032000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,33.020000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.778000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,33.020000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.778000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,41.910000>}
box{<0,0,-0.203200><2.410000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.270000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,41.910000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.032000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,60.960000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.032000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,60.960000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.032000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.778000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,69.850000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.778000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,69.850000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.286000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,78.740000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,78.740000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,0.000000,87.630000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,-1.535000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.680000,-1.535000,87.630000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.286000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,12.954000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.580000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,21.844000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.580000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,30.734000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.580000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,58.674000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.580000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,67.564000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.580000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,12.700000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,21.590000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,30.480000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,39.370000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,58.420000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,67.310000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,76.200000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,85.090000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,39.370000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,76.200000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.580000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,85.090000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.580000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,12.954000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.834000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,21.844000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.834000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,30.734000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.834000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,58.674000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.834000,-1.535000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,-1.535000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,67.564000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.834000,-1.535000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.172000,0.000000,90.802000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.950000,0.000000,90.802000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.172000,0.000000,90.802000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.950000,0.000000,90.802000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,0.000000,91.186000>}
box{<0,0,-0.203200><0.543058,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.950000,0.000000,90.802000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,15.116000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,15.240000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,15.116000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,15.240000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,24.006000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,24.130000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,24.006000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,24.130000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,32.896000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,33.020000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,32.896000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,33.020000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,41.786000>}
box{<0,0,-0.203200><3.416740,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.064000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,41.910000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,41.786000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,60.836000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,-1.535000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,60.960000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,60.836000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,60.960000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,-1.535000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,69.726000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,-1.535000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,69.850000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,69.726000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,69.850000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,78.616000>}
box{<0,0,-0.203200><3.416740,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.064000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,78.740000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,78.616000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,78.740000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,87.506000>}
box{<0,0,-0.203200><3.416740,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.064000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.940000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,0.000000,87.630000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.940000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,87.506000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.480000,-1.535000,87.630000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.480000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.834000,-1.535000,85.344000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.580000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,-1.535000,30.480000>}
box{<0,0,-0.203200><0.532000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,0.000000,91.186000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,91.186000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.334000,0.000000,91.186000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,12.700000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,39.370000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.834000,-1.535000,85.344000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,85.344000>}
box{<0,0,-0.203200><0.786000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.834000,-1.535000,85.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,21.590000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,-1.535000,67.310000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,12.700000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,21.590000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,30.480000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,58.420000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,67.310000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,76.200000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,85.090000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,9.906000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,12.954000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.128000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,12.954000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,22.098000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.874000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,22.098000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,30.734000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.128000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,30.734000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,39.370000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,39.370000>}
box{<0,0,-0.203200><19.050000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,58.420000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,58.420000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,67.564000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.128000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,67.564000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.580000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,76.200000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.580000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,85.344000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,76.200000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,85.344000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.128000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,90.424000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,85.344000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,85.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,11.684000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<7.620000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,11.684000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,21.082000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<8.128000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,21.082000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,28.956000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<7.112000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,28.956000>}
box{<0,0,-0.203200><7.874000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,38.354000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<7.620000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,38.354000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,57.912000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<8.128000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,57.912000>}
box{<0,0,-0.203200><19.558000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,66.548000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<7.874000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,66.548000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,75.692000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<8.128000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,75.692000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,75.692000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,85.344000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,84.328000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<7.620000,-1.535000,85.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,75.692000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,84.328000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.636000,-1.535000,84.328000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,91.186000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,92.710000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.366000,0.000000,91.186000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,90.424000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,91.440000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.382000,0.000000,90.424000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,8.128000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<8.636000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,8.382000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<8.382000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<10.160000,0.000000,90.170000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<10.160000,0.000000,10.160000>}
box{<0,0,-0.444500><80.010000,0.035000,0.444500> rotate<0,-90.000000,0> translate<10.160000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,-1.535000,92.710000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,-1.535000,10.160000>}
box{<0,0,-0.508000><82.550000,0.035000,0.508000> rotate<0,-90.000000,0> translate<10.160000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,92.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,92.710000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.890000,0.000000,92.710000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,92.710000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,96.045000>}
box{<0,0,-0.508000><3.335000,0.035000,0.508000> rotate<0,90.000000,0> translate<10.160000,0.000000,96.045000> }
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<10.160000,0.000000,96.045000>}
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<10.315000,0.000000,96.045000>}
box{<0,0,-0.381000><0.155000,0.035000,0.381000> rotate<0,0.000000,0> translate<10.160000,0.000000,96.045000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,12.700000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,15.240000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,17.780000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,20.320000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,22.860000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,25.400000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,27.940000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,30.480000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,33.020000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,35.560000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,38.100000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,40.640000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,43.180000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,45.720000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,48.260000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,50.800000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,53.340000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,55.880000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,58.420000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,60.960000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,63.500000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,66.040000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,68.580000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,71.120000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,73.660000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,76.200000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,78.740000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,81.280000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,81.280000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,83.820000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,83.820000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,86.360000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,88.900000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<11.430000,0.000000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,-1.535000,91.440000>}
box{<0,0,-0.508000><80.010000,0.035000,0.508000> rotate<0,90.000000,0> translate<11.430000,-1.535000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,0.000000,1.270000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.286000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,2.286000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.684000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,3.680000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.700000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,12.700000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,15.240000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,17.780000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,20.320000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,22.860000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,25.400000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,27.940000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,30.480000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,33.020000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,35.560000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,38.100000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,40.640000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,43.180000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,45.720000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,48.260000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,50.800000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,53.340000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,55.880000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,58.420000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,60.960000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,63.500000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,66.040000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,68.580000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,71.120000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,73.660000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,76.200000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,78.740000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,81.280000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,81.280000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,83.820000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,83.820000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,86.360000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,90.170000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,88.900000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,91.440000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.398000,0.000000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.081000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.794000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,1.016000>}
box{<0,0,-0.203200><10.414000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.794000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,1.016000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<13.081000,-1.535000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.332000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.081000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,-1.535000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.711000,-1.535000,91.440000>}
box{<0,0,-0.508000><2.281000,0.035000,0.508000> rotate<0,0.000000,0> translate<11.430000,-1.535000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.711000,-1.535000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.711000,-1.535000,92.451000>}
box{<0,0,-0.508000><1.011000,0.035000,0.508000> rotate<0,90.000000,0> translate<13.711000,-1.535000,92.451000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,92.456000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.700000,0.000000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.711000,-1.535000,92.451000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.716000,-1.535000,92.456000>}
box{<0,0,-0.508000><0.007071,0.035000,0.508000> rotate<0,-44.997030,0> translate<13.711000,-1.535000,92.451000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.716000,0.000000,92.456000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.716000,0.000000,95.250000>}
box{<0,0,-0.508000><2.794000,0.035000,0.508000> rotate<0,90.000000,0> translate<13.716000,0.000000,95.250000> }
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<13.711000,0.000000,96.045000>}
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<13.716000,0.000000,96.040000>}
box{<0,0,-0.381000><0.007071,0.035000,0.381000> rotate<0,44.997030,0> translate<13.711000,0.000000,96.045000> }
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<13.716000,0.000000,95.250000>}
cylinder{<0,0,0><0,0.035000,0>0.381000 translate<13.716000,0.000000,96.040000>}
box{<0,0,-0.381000><0.790000,0.035000,0.381000> rotate<0,90.000000,0> translate<13.716000,0.000000,96.040000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.711000,0.000000,96.045000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.744000,0.000000,98.044000>}
box{<0,0,-0.304800><1.999272,0.035000,0.304800> rotate<0,-89.048355,0> translate<13.711000,0.000000,96.045000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,3.199000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.240000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.332000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,3.810000>}
box{<0,0,-0.203200><2.698319,0.035000,0.203200> rotate<0,44.997030,0> translate<13.332000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<12.700000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.240000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,6.580000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.240000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,0.000000,8.382000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,0.000000,8.382000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.240000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,3.199000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.621000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<15.240000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.621000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.621000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.167000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.621000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,8.128000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.621000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,8.128000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.621000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<18.288000,0.000000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<18.288000,0.000000,98.298000>}
box{<0,0,-0.317500><2.156000,0.035000,0.317500> rotate<0,90.000000,0> translate<18.288000,0.000000,98.298000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<18.288000,0.000000,98.298000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<19.050000,0.000000,99.060000>}
box{<0,0,-0.317500><1.077631,0.035000,0.317500> rotate<0,-44.997030,0> translate<18.288000,0.000000,98.298000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,1.270000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.684000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,2.032000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.828000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,3.680000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.590000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.208000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,93.342000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,93.342000>}
box{<0,0,-0.304800><3.556000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.288000,0.000000,93.342000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.971000,-1.535000,1.143000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.844000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.971000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.971000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.971000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.971000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.222000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.971000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<21.590000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.130000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,6.580000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,2.945000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.384000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.222000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,3.556000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,44.997030,0> translate<22.222000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,8.382000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.494000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,8.382000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.130000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,2.945000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.511000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<24.384000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.511000,-1.535000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.511000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.421000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.511000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,93.342000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,91.440000>}
box{<0,0,-0.304800><1.902000,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.638000,0.000000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,93.342000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,93.342000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.844000,0.000000,93.342000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,96.142000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.844000,0.000000,96.142000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.511000,-1.535000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,8.128000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.511000,-1.535000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.556000,0.000000,96.142000>}
box{<0,0,-0.304800><2.918000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.638000,0.000000,96.142000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.556000,0.000000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.702000,0.000000,94.996000>}
box{<0,0,-0.304800><1.620689,0.035000,0.304800> rotate<0,44.997030,0> translate<27.556000,0.000000,96.142000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,1.270000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.828000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,1.524000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.226000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,3.680000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<19.050000,0.000000,99.060000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<30.480000,0.000000,99.060000>}
box{<0,0,-0.317500><11.430000,0.035000,0.317500> rotate<0,0.000000,0> translate<19.050000,0.000000,99.060000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.861000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,1.016000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.844000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,1.016000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<30.861000,-1.535000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.112000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.861000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<31.750000,0.000000,97.790000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<31.750000,0.000000,95.504000>}
box{<0,0,-0.317500><2.286000,0.035000,0.317500> rotate<0,-90.000000,0> translate<31.750000,0.000000,95.504000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<30.480000,0.000000,99.060000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<31.750000,0.000000,97.790000>}
box{<0,0,-0.317500><1.796051,0.035000,0.317500> rotate<0,44.997030,0> translate<30.480000,0.000000,99.060000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<31.750000,0.000000,95.504000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<32.258000,0.000000,94.996000>}
box{<0,0,-0.317500><0.718420,0.035000,0.317500> rotate<0,44.997030,0> translate<31.750000,0.000000,95.504000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.020000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.580000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.382000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,2.945000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.274000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.112000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,3.556000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,44.997030,0> translate<31.112000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,2.945000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<33.274000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,7.493000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.675000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.401000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.400000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,-1.535000,7.493000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.401000,-1.535000,7.493000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.638000,0.000000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,91.440000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.638000,0.000000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.814000,0.000000,92.456000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.798000,0.000000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.814000,0.000000,92.456000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.814000,0.000000,94.996000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.814000,0.000000,94.996000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,1.270000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,2.032000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.608000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,3.680000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.370000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.988000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,1.143000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.624000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.751000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.751000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.002000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.751000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,3.453000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.656000,-1.535000,3.453000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.002000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,4.064000>}
box{<0,0,-0.203200><2.339109,0.035000,0.203200> rotate<0,44.997030,0> translate<40.002000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<39.370000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<41.910000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,6.580000>}
box{<0,0,-0.203200><0.786000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.910000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,3.453000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<41.656000,-1.535000,3.453000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,-1.535000,7.493000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.675000,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.291000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.036000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,-1.535000,7.493000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.291000,-1.535000,7.493000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,0.000000,8.382000>}
box{<0,0,-0.203200><9.906000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,0.000000,8.382000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.910000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,46.990000>}
box{<0,0,-0.508000><33.020000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,46.990000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,48.260000>}
box{<0,0,-0.508000><33.020000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,49.530000>}
box{<0,0,-0.508000><33.020000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,49.530000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,-1.535000,50.800000>}
box{<0,0,-0.508000><33.020000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,48.260000>}
box{<0,0,-0.444500><35.560000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,49.530000>}
box{<0,0,-0.444500><35.560000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,49.530000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<46.990000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,50.800000>}
box{<0,0,-0.444500><35.560000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,52.070000>}
box{<0,0,-0.444500><35.560000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.990000,-1.535000,52.070000>}
box{<0,0,-0.508000><34.290000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.990000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.990000,-1.535000,52.070000>}
box{<0,0,-0.508000><5.080000,0.035000,0.508000> rotate<0,90.000000,0> translate<46.990000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<46.990000,0.000000,52.070000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<46.990000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.752000,0.000000,1.270000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.608000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.752000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,1.778000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.752000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,3.680000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.260000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.641000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.641000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.641000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,1.016000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.641000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,1.016000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<48.641000,-1.535000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.641000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.892000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.641000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,3.199000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.800000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.892000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,3.810000>}
box{<0,0,-0.203200><2.698319,0.035000,0.203200> rotate<0,44.997030,0> translate<48.892000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<48.260000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.800000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,6.580000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.800000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,-1.535000,3.199000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.181000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<50.800000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.181000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.181000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.929000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.181000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,0.000000,8.382000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.926000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,0.000000,8.382000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.800000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.926000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.181000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.181000,-1.535000,7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<53.340000,0.000000,46.990000>}
box{<0,0,-0.444500><41.910000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<53.340000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<53.340000,0.000000,46.990000>}
box{<0,0,-0.444500><5.080000,0.035000,0.444500> rotate<0,-90.000000,0> translate<53.340000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,48.260000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,50.800000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,48.260000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<54.610000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,50.800000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<54.610000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.752000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,0.000000,1.270000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.752000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,1.778000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.642000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,3.680000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<57.531000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,5.715000>}
box{<0,0,-0.203200><0.003000,0.035000,0.203200> rotate<0,-90.000000,0> translate<57.531000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.768000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.658000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.768000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.658000,-1.535000,1.016000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<57.531000,-1.535000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<57.150000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<59.690000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,6.580000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.690000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,2.945000>}
box{<0,0,-0.203200><0.357000,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.944000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.531000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,3.302000>}
box{<0,0,-0.203200><3.412497,0.035000,0.203200> rotate<0,44.997030,0> translate<57.531000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.944000,-1.535000,2.945000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<59.944000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.929000,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.071000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,8.382000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.308000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,8.382000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.690000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.562000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.071000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.071000,-1.535000,7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<62.738000,-1.535000,91.948000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<62.738000,-1.535000,94.996000>}
box{<0,0,-0.317500><3.048000,0.035000,0.317500> rotate<0,90.000000,0> translate<62.738000,-1.535000,94.996000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<62.738000,-1.535000,91.948000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<63.246000,-1.535000,91.440000>}
box{<0,0,-0.317500><0.718420,0.035000,0.317500> rotate<0,44.997030,0> translate<62.738000,-1.535000,91.948000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.642000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.278000,0.000000,1.270000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.642000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.278000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,2.032000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.278000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,3.680000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,90.000000,0> translate<66.040000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<66.421000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,5.715000>}
box{<0,0,-0.203200><0.003000,0.035000,0.203200> rotate<0,-90.000000,0> translate<66.421000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.658000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.658000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,1.016000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<66.421000,-1.535000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<66.548000,-1.535000,94.996000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<66.548000,-1.535000,97.028000>}
box{<0,0,-0.317500><2.032000,0.035000,0.317500> rotate<0,90.000000,0> translate<66.548000,-1.535000,97.028000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<66.040000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<68.580000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,6.580000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.580000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<66.548000,-1.535000,97.028000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<68.580000,-1.535000,99.060000>}
box{<0,0,-0.317500><2.873682,0.035000,0.317500> rotate<0,-44.997030,0> translate<66.548000,-1.535000,97.028000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.834000,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.834000,-1.535000,2.945000>}
box{<0,0,-0.203200><0.357000,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.834000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.834000,-1.535000,3.302000>}
box{<0,0,-0.203200><3.412497,0.035000,0.203200> rotate<0,44.997030,0> translate<66.421000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.834000,-1.535000,2.945000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.961000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<68.834000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.961000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.961000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.929000,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.961000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.088000,0.000000,8.382000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.198000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.088000,0.000000,8.382000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<68.580000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.342000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.452000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.961000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.342000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<68.961000,-1.535000,7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<70.358000,-1.535000,94.996000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<71.504000,-1.535000,96.142000>}
box{<0,0,-0.317500><1.620689,0.035000,0.317500> rotate<0,-44.997030,0> translate<70.358000,-1.535000,94.996000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<63.246000,-1.535000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<73.406000,-1.535000,91.440000>}
box{<0,0,-0.317500><10.160000,0.035000,0.317500> rotate<0,0.000000,0> translate<63.246000,-1.535000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<73.406000,-1.535000,91.440000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,92.202000>}
box{<0,0,-0.317500><1.077631,0.035000,0.317500> rotate<0,-44.997030,0> translate<73.406000,-1.535000,91.440000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,92.202000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,93.342000>}
box{<0,0,-0.317500><1.140000,0.035000,0.317500> rotate<0,90.000000,0> translate<74.168000,-1.535000,93.342000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<71.504000,-1.535000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,96.142000>}
box{<0,0,-0.317500><2.664000,0.035000,0.317500> rotate<0,0.000000,0> translate<71.504000,-1.535000,96.142000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.278000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.422000,0.000000,1.270000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<65.278000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.422000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,1.778000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<74.422000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,3.680000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,90.000000,0> translate<74.930000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.184000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<66.548000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.184000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.311000,-1.535000,1.143000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.184000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.311000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.311000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<75.311000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.311000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.562000,-1.535000,5.718000>}
box{<0,0,-0.203200><0.251000,0.035000,0.203200> rotate<0,0.000000,0> translate<75.311000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,93.342000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<76.962000,-1.535000,93.342000>}
box{<0,0,-0.317500><2.794000,0.035000,0.317500> rotate<0,0.000000,0> translate<74.168000,-1.535000,93.342000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<74.168000,-1.535000,96.142000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<76.962000,-1.535000,96.142000>}
box{<0,0,-0.317500><2.794000,0.035000,0.317500> rotate<0,0.000000,0> translate<74.168000,-1.535000,96.142000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<74.930000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<77.470000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,6.580000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.470000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,2.945000>}
box{<0,0,-0.203200><0.611000,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.724000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.562000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,3.556000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,44.997030,0> translate<75.562000,-1.535000,5.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,2.945000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.851000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<77.724000,-1.535000,2.945000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.851000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.851000,-1.535000,5.818000>}
box{<0,0,-0.203200><1.929000,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.851000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.088000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.978000,0.000000,8.382000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<69.088000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.978000,0.000000,8.382000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<77.470000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.342000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.232000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<69.342000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.851000,-1.535000,7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.232000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<77.851000,-1.535000,7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<68.580000,-1.535000,99.060000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<78.740000,-1.535000,99.060000>}
box{<0,0,-0.317500><10.160000,0.035000,0.317500> rotate<0,0.000000,0> translate<68.580000,-1.535000,99.060000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.010000,-1.535000,97.790000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.010000,-1.535000,96.650000>}
box{<0,0,-0.317500><1.140000,0.035000,0.317500> rotate<0,-90.000000,0> translate<80.010000,-1.535000,96.650000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<78.740000,-1.535000,99.060000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.010000,-1.535000,97.790000>}
box{<0,0,-0.317500><1.796051,0.035000,0.317500> rotate<0,44.997030,0> translate<78.740000,-1.535000,99.060000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<76.962000,-1.535000,93.342000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.518000,-1.535000,93.342000>}
box{<0,0,-0.317500><3.556000,0.035000,0.317500> rotate<0,0.000000,0> translate<76.962000,-1.535000,93.342000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.010000,-1.535000,96.650000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<80.518000,-1.535000,96.142000>}
box{<0,0,-0.317500><0.718420,0.035000,0.317500> rotate<0,44.997030,0> translate<80.010000,-1.535000,96.650000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.422000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,0.000000,1.270000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<74.422000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,0.000000,2.286000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<82.804000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,0.000000,3.680000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,90.000000,0> translate<83.820000,0.000000,3.680000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.184000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.074000,-1.535000,1.016000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<75.184000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.074000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,1.143000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<84.074000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,2.918000>}
box{<0,0,-0.203200><1.775000,0.035000,0.203200> rotate<0,90.000000,0> translate<84.201000,-1.535000,2.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,5.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,5.715000>}
box{<0,0,-0.203200><0.003000,0.035000,0.203200> rotate<0,-90.000000,0> translate<84.201000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<86.106000,-1.535000,91.694000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<86.167000,-1.535000,91.694000>}
box{<0,0,-0.444500><0.061000,0.035000,0.444500> rotate<0,0.000000,0> translate<86.106000,-1.535000,91.694000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<86.167000,-1.535000,91.694000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<86.167000,-1.535000,96.553000>}
box{<0,0,-0.444500><4.859000,0.035000,0.444500> rotate<0,90.000000,0> translate<86.167000,-1.535000,96.553000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<86.167000,-1.535000,96.553000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<86.294000,-1.535000,95.156000>}
box{<0,0,-0.317500><1.402761,0.035000,0.317500> rotate<0,84.799974,0> translate<86.167000,-1.535000,96.553000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,3.199000>}
box{<0,0,-0.203200><0.357000,0.035000,0.203200> rotate<0,-90.000000,0> translate<86.360000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.201000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,3.556000>}
box{<0,0,-0.203200><3.053287,0.035000,0.203200> rotate<0,44.997030,0> translate<84.201000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,3.940000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<83.820000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,3.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,3.940000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<86.360000,0.000000,3.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,6.580000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,-90.000000,0> translate<86.360000,0.000000,6.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.978000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.614000,0.000000,8.382000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<77.978000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.614000,0.000000,8.382000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.360000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,3.199000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,2.818000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<86.360000,-1.535000,3.199000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,5.818000>}
box{<0,0,-0.203200><2.183000,0.035000,0.203200> rotate<0,-90.000000,0> translate<86.741000,-1.535000,5.818000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.232000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,8.128000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<78.232000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.741000,-1.535000,8.001000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,12.700000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,13.970000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,13.970000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,15.240000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,16.510000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,16.510000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,17.780000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,19.050000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,19.050000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,20.320000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,21.590000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,21.590000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,22.860000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,24.130000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,24.130000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,25.400000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,26.670000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,26.670000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,27.940000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,29.210000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,29.210000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,30.480000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,31.750000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,31.750000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,33.020000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,34.290000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,34.290000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,35.560000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,36.830000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,36.830000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,38.100000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,39.370000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,39.370000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,40.640000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,41.910000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,41.910000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,43.180000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,44.450000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,44.450000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,45.720000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,46.990000>}
box{<0,0,-0.444500><33.020000,0.035000,0.444500> rotate<0,0.000000,0> translate<54.610000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,46.990000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,48.260000>}
box{<0,0,-0.444500><33.020000,0.035000,0.444500> rotate<0,0.000000,0> translate<54.610000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,49.530000>}
box{<0,0,-0.444500><33.020000,0.035000,0.444500> rotate<0,0.000000,0> translate<54.610000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,49.530000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<54.610000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,50.800000>}
box{<0,0,-0.444500><33.020000,0.035000,0.444500> rotate<0,0.000000,0> translate<54.610000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<53.340000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,52.070000>}
box{<0,0,-0.444500><34.290000,0.035000,0.444500> rotate<0,0.000000,0> translate<53.340000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,52.070000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,53.340000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,54.610000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,54.610000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,55.880000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,57.150000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,57.150000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,58.420000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,59.690000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,59.690000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,60.960000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,62.230000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,62.230000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,63.500000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,64.770000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,64.770000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,66.040000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,67.310000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,67.310000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,68.580000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,69.850000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,69.850000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,71.120000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,72.390000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,72.390000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,73.660000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,74.930000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,74.930000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,76.200000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,77.470000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,77.470000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,78.740000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,80.010000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,80.010000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,81.280000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,81.280000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,81.280000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,82.550000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,81.280000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,82.550000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,83.820000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,83.820000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,83.820000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,85.090000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,83.820000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,85.090000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,86.360000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,87.630000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,87.630000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,88.900000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,88.900000>}
box{<0,0,-0.444500><76.200000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<10.160000,0.000000,90.170000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,90.170000>}
box{<0,0,-0.444500><77.470000,0.035000,0.444500> rotate<0,0.000000,0> translate<10.160000,0.000000,90.170000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,88.900000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<87.630000,0.000000,90.170000>}
box{<0,0,-0.444500><1.270000,0.035000,0.444500> rotate<0,90.000000,0> translate<87.630000,0.000000,90.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.106000,0.000000,91.694000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,0.000000,94.361000>}
box{<0,0,-0.203200><3.771708,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.106000,0.000000,91.694000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<11.430000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<88.900000,0.000000,11.430000>}
box{<0,0,-0.444500><77.470000,0.035000,0.444500> rotate<0,0.000000,0> translate<11.430000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,11.430000>}
box{<0,0,-0.508000><77.470000,0.035000,0.508000> rotate<0,0.000000,0> translate<11.430000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,11.430000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<88.900000,0.000000,91.694000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<88.900000,0.000000,11.430000>}
box{<0,0,-0.444500><80.264000,0.035000,0.444500> rotate<0,-90.000000,0> translate<88.900000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,12.700000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,13.970000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,13.970000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,15.240000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,16.510000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,16.510000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,17.780000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,19.050000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,19.050000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,20.320000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,21.590000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,21.590000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,22.860000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,24.130000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,24.130000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,25.400000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,26.670000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,26.670000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,27.940000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,29.210000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,29.210000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,30.480000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,31.750000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,31.750000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,33.020000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,34.290000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,34.290000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,35.560000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,36.830000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,36.830000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,38.100000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,39.370000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,39.370000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,40.640000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,41.910000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,41.910000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,43.180000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,44.450000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,44.450000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,45.720000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.990000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,46.990000>}
box{<0,0,-0.508000><41.910000,0.035000,0.508000> rotate<0,0.000000,0> translate<46.990000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,46.990000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,48.260000>}
box{<0,0,-0.508000><35.560000,0.035000,0.508000> rotate<0,0.000000,0> translate<53.340000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,49.530000>}
box{<0,0,-0.508000><35.560000,0.035000,0.508000> rotate<0,0.000000,0> translate<53.340000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,49.530000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,50.800000>}
box{<0,0,-0.508000><35.560000,0.035000,0.508000> rotate<0,0.000000,0> translate<53.340000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,52.070000>}
box{<0,0,-0.508000><35.560000,0.035000,0.508000> rotate<0,0.000000,0> translate<53.340000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,52.070000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,53.340000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,54.610000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,54.610000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,55.880000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,57.150000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,57.150000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,58.420000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,59.690000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,59.690000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,60.960000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,62.230000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,62.230000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,63.500000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,64.770000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,64.770000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,66.040000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,67.310000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,67.310000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,68.580000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,69.850000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,69.850000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,71.120000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,71.120000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,71.120000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,72.390000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,72.390000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,73.660000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,74.930000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,74.930000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,76.200000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,77.470000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,77.470000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,78.740000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,80.010000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,81.280000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,80.010000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,81.280000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,81.280000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,81.280000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,82.550000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,83.820000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,82.550000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,83.820000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,83.820000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,83.820000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,85.090000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,85.090000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,86.360000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,87.630000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,88.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,87.630000>}
box{<0,0,-0.508000><1.270000,0.035000,0.508000> rotate<0,-90.000000,0> translate<88.900000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,88.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<88.900000,-1.535000,88.900000>}
box{<0,0,-0.508000><76.200000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,88.900000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<86.106000,0.000000,91.694000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<88.900000,0.000000,91.694000>}
box{<0,0,-0.444500><2.794000,0.035000,0.444500> rotate<0,0.000000,0> translate<86.106000,0.000000,91.694000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<89.375000,-1.535000,95.664000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<89.375000,-1.535000,96.553000>}
box{<0,0,-0.317500><0.889000,0.035000,0.317500> rotate<0,90.000000,0> translate<89.375000,-1.535000,96.553000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<10.160000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<90.170000,0.000000,10.160000>}
box{<0,0,-0.444500><80.010000,0.035000,0.444500> rotate<0,0.000000,0> translate<10.160000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<90.170000,-1.535000,10.160000>}
box{<0,0,-0.508000><80.010000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.160000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,-1.535000,90.170000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<90.170000,-1.535000,90.170000>}
box{<0,0,-0.508000><77.470000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,-1.535000,90.170000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<90.170000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<90.170000,-1.535000,90.170000>}
box{<0,0,-0.508000><80.010000,0.035000,0.508000> rotate<0,90.000000,0> translate<90.170000,-1.535000,90.170000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<89.375000,-1.535000,95.664000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<90.170000,-1.535000,92.964000>}
box{<0,0,-0.444500><2.814609,0.035000,0.444500> rotate<0,73.588371,0> translate<89.375000,-1.535000,95.664000> }
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<90.170000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.444500 translate<90.170000,0.000000,92.964000>}
box{<0,0,-0.444500><82.804000,0.035000,0.444500> rotate<0,90.000000,0> translate<90.170000,0.000000,92.964000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.678000,-1.535000,8.128000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<86.868000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.614000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.678000,0.000000,8.382000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<86.614000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.773000,0.000000,94.361000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.805000,0.000000,94.361000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<88.773000,0.000000,94.361000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.678000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,9.144000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<90.678000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,9.144000>}
box{<0,0,-0.203200><6.604000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.678000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,9.398000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<90.678000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,15.748000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,15.748000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,24.130000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,24.384000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,33.020000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,33.020000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,41.910000>}
box{<0,0,-0.203200><19.050000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,42.164000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,60.960000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,61.468000>}
box{<0,0,-0.203200><19.304000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,69.850000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,70.612000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,70.612000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,70.612000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,78.994000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,86.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,78.994000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.694000,-1.535000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,87.122000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<91.694000,0.000000,87.122000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.170000,-1.535000,92.964000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,92.329000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,22.618372,0> translate<90.170000,-1.535000,92.964000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,24.130000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,41.910000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,78.740000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,78.740000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,-1.535000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,15.240000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,-1.535000,15.240000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,60.960000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,87.122000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,87.630000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<91.694000,0.000000,87.122000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,70.612000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.456000,0.000000,69.850000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<91.694000,0.000000,70.612000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,86.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.710000,-1.535000,87.630000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<91.694000,-1.535000,86.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,15.240000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.202000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,15.240000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.202000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,24.130000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,24.130000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.948000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,33.020000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,33.020000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,41.910000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,41.910000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.948000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,60.960000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,60.960000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.202000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,69.850000>}
box{<0,0,-0.203200><2.056000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.694000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.456000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,69.850000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.456000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,78.740000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.948000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,78.740000>}
box{<0,0,-0.203200><1.802000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.948000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.202000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,0.000000,87.630000>}
box{<0,0,-0.203200><1.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.202000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.710000,-1.535000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,87.630000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.710000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,89.638000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,87.630000>}
box{<0,0,-0.203200><2.008000,0.035000,0.203200> rotate<0,-90.000000,0> translate<93.750000,-1.535000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.694000,-1.535000,92.329000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.750000,-1.535000,89.638000>}
box{<0,0,-0.203200><3.386535,0.035000,0.203200> rotate<0,52.615678,0> translate<91.694000,-1.535000,92.329000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,12.824000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,12.824000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,21.714000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,21.714000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,30.604000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,30.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,39.494000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,39.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,58.544000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,58.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,67.434000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,67.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,76.324000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,76.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,85.214000>}
box{<0,0,-0.203200><0.124000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.850000,-1.535000,85.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.805000,0.000000,94.361000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.742000,0.000000,90.424000>}
box{<0,0,-0.203200><5.567759,0.035000,0.203200> rotate<0,44.997030,0> translate<90.805000,0.000000,94.361000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,12.824000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.758000,-1.535000,14.732000>}
box{<0,0,-0.203200><2.698319,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,12.824000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,21.714000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,23.876000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,21.714000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,30.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,32.766000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,30.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,58.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,60.706000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,58.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,67.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,69.596000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,67.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,76.324000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,78.486000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,76.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,85.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,87.376000>}
box{<0,0,-0.203200><3.057530,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,85.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.758000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.242000,-1.535000,14.732000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<95.758000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,-1.535000,39.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.266000,-1.535000,41.910000>}
box{<0,0,-0.203200><3.416740,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,-1.535000,39.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.742000,0.000000,90.424000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.266000,0.000000,90.424000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<94.742000,0.000000,90.424000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,15.240000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,24.130000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,33.020000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,41.910000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,60.960000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,69.850000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,78.740000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.850000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,87.630000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.850000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,23.876000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,32.766000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,60.706000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,69.596000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,69.596000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,69.596000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,78.486000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,78.486000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,78.486000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,87.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,87.376000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,87.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.242000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,15.240000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.242000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,15.240000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,24.130000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,24.130000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,33.020000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,33.020000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.266000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.484000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.266000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,41.910000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,60.960000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,60.960000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,69.850000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,69.596000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,69.850000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,69.596000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,78.740000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,78.486000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,78.740000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,78.486000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.390000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,0.000000,87.630000>}
box{<0,0,-0.203200><0.360000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.390000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.496000,-1.535000,87.376000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.750000,-1.535000,87.630000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<96.496000,-1.535000,87.376000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.266000,-1.535000,90.424000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.282000,-1.535000,89.408000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<96.266000,-1.535000,90.424000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.536000,-1.535000,85.090000>}
box{<0,0,-0.203200><0.886000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.074000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,-1.535000,1.016000>}
box{<0,0,-0.203200><13.716000,0.035000,0.203200> rotate<0,0.000000,0> translate<84.074000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,0.000000,1.270000>}
box{<0,0,-0.203200><14.986000,0.035000,0.203200> rotate<0,0.000000,0> translate<82.804000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,0.000000,30.480000>}
box{<0,0,-0.203200><1.140000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,39.370000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,67.310000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,76.200000>}
box{<0,0,-0.203200><1.394000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.298000,0.000000,58.420000>}
box{<0,0,-0.203200><1.648000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,0.000000,12.700000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,12.700000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,0.000000,21.590000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,21.590000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,30.480000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,39.370000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,67.310000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,76.200000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,85.090000>}
box{<0,0,-0.203200><1.902000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,2.032000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<97.790000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,2.286000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<97.790000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,12.446000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<98.552000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,12.446000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<98.552000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,12.446000>}
box{<0,0,-0.203200><10.414000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,12.446000>}
box{<0,0,-0.203200><10.160000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,21.336000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<98.552000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,21.336000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,21.844000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,21.844000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.790000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,29.464000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<97.790000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,29.464000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,30.734000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,30.734000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,38.608000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<98.044000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,38.608000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,39.624000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,39.624000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.298000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,57.912000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<98.298000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,57.912000>}
box{<0,0,-0.203200><19.304000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,58.420000>}
box{<0,0,-0.203200><2.156000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.650000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,58.420000>}
box{<0,0,-0.203200><18.796000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,66.548000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<98.044000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,66.548000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,67.564000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,67.564000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,75.438000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<98.044000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,75.438000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,75.438000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,76.454000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,76.454000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,76.454000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.650000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,82.934000>}
box{<0,0,-0.203200><3.049044,0.035000,0.203200> rotate<0,44.997030,0> translate<96.650000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,75.438000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,0.000000,82.934000>}
box{<0,0,-0.203200><7.496000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,0.000000,82.934000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.552000,-1.535000,85.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,85.344000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<98.552000,-1.535000,85.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,76.454000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,85.344000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,85.344000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.282000,-1.535000,89.408000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,89.408000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<97.282000,-1.535000,89.408000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,85.344000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.806000,-1.535000,89.408000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<98.806000,-1.535000,89.408000> }
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
//Holes(fast)/Vias
cylinder{<90.170000,0.038000,92.964000><90.170000,-1.538000,92.964000>0.300000 }
cylinder{<86.106000,0.038000,91.694000><86.106000,-1.538000,91.694000>0.300000 }
cylinder{<96.266000,0.038000,90.424000><96.266000,-1.538000,90.424000>0.300000 }
cylinder{<13.716000,0.038000,92.456000><13.716000,-1.538000,92.456000>0.300000 }
cylinder{<10.160000,0.038000,92.710000><10.160000,-1.538000,92.710000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.921100,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.336400,0.000000,88.750500>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<13.336400,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.336400,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<12.167000,0.000000,88.750500>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<12.167000,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<12.167000,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<11.582400,0.000000,88.165800>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<11.582400,0.000000,88.165800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<11.582400,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<11.582400,0.000000,85.827000>}
box{<0,0,-0.152400><2.338800,0.036000,0.152400> rotate<0,-90.000000,0> translate<11.582400,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<11.582400,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<12.167000,0.000000,85.242400>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<11.582400,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<12.167000,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.336400,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<12.167000,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.336400,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<13.921100,0.000000,85.827000>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-44.992130,0> translate<13.336400,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<15.090500,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<15.090500,0.000000,85.827000>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,-90.000000,0> translate<15.090500,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<15.090500,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<15.675100,0.000000,85.242400>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<15.090500,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<15.675100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.429200,0.000000,85.242400>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<15.675100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.429200,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.429200,0.000000,87.581100>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,90.000000,0> translate<17.429200,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.598600,0.000000,84.073100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.598600,0.000000,87.581100>}
box{<0,0,-0.152400><3.508000,0.036000,0.152400> rotate<0,90.000000,0> translate<18.598600,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.598600,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.352600,0.000000,87.581100>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.598600,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.352600,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.937300,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<20.352600,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.937300,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.937300,0.000000,85.827000>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.937300,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.937300,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.352600,0.000000,85.242400>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-44.992130,0> translate<20.352600,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.352600,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.598600,0.000000,85.242400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,0.000000,0> translate<18.598600,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.445400,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.860700,0.000000,88.750500>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<23.860700,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.860700,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.691300,0.000000,88.750500>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<22.691300,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.691300,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.106700,0.000000,88.165800>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<22.106700,0.000000,88.165800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.106700,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.106700,0.000000,85.827000>}
box{<0,0,-0.152400><2.338800,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.106700,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.106700,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.691300,0.000000,85.242400>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<22.106700,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.691300,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.860700,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<22.691300,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.860700,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<24.445400,0.000000,85.827000>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-44.992130,0> translate<23.860700,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.199400,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.368800,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<26.199400,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.368800,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.953500,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<27.368800,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.953500,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.953500,0.000000,85.242400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,-90.000000,0> translate<27.953500,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.953500,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.199400,0.000000,85.242400>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<26.199400,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.199400,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.614800,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<25.614800,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<25.614800,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.199400,0.000000,86.411700>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<25.614800,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<26.199400,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.953500,0.000000,86.411700>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<26.199400,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.122900,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.122900,0.000000,88.750500>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,90.000000,0> translate<29.122900,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.876900,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.122900,0.000000,86.411700>}
box{<0,0,-0.152400><2.108027,0.036000,0.152400> rotate<0,33.687090,0> translate<29.122900,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<29.122900,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<30.876900,0.000000,87.581100>}
box{<0,0,-0.152400><2.108083,0.036000,0.152400> rotate<0,-33.689352,0> translate<29.122900,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.800300,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.630900,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<32.630900,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.630900,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.046300,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<32.046300,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.046300,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.046300,0.000000,86.996400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,90.000000,0> translate<32.046300,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.046300,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.630900,0.000000,87.581100>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<32.046300,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.630900,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.800300,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<32.630900,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.800300,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.385000,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<33.800300,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.385000,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.385000,0.000000,86.411700>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,-90.000000,0> translate<34.385000,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.385000,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.046300,0.000000,86.411700>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<32.046300,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.062500,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.062500,0.000000,88.750500>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,90.000000,0> translate<39.062500,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<39.062500,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.401200,0.000000,86.996400>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<39.062500,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.401200,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.401200,0.000000,85.242400>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,-90.000000,0> translate<41.401200,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.324600,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.155200,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<43.155200,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.155200,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.570600,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<42.570600,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.570600,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.570600,0.000000,86.996400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,90.000000,0> translate<42.570600,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.570600,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.155200,0.000000,87.581100>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<42.570600,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.155200,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.324600,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<43.155200,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.324600,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.909300,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<44.324600,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.909300,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.909300,0.000000,86.411700>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,-90.000000,0> translate<44.909300,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.909300,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<42.570600,0.000000,86.411700>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<42.570600,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.663300,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.832700,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<46.663300,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.832700,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.417400,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<47.832700,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.417400,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.417400,0.000000,85.242400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,-90.000000,0> translate<48.417400,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.417400,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.663300,0.000000,85.242400>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<46.663300,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.663300,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.078700,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<46.078700,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.078700,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.663300,0.000000,86.411700>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<46.078700,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.663300,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.417400,0.000000,86.411700>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<46.663300,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.171400,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.171400,0.000000,85.827000>}
box{<0,0,-0.152400><2.338800,0.036000,0.152400> rotate<0,-90.000000,0> translate<50.171400,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.171400,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.756100,0.000000,85.242400>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,44.992130,0> translate<50.171400,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.586800,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<50.756100,0.000000,87.581100>}
box{<0,0,-0.152400><1.169300,0.036000,0.152400> rotate<0,0.000000,0> translate<49.586800,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.679500,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.510100,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<52.510100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.510100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.925500,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<51.925500,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.925500,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.925500,0.000000,86.996400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,90.000000,0> translate<51.925500,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.925500,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.510100,0.000000,87.581100>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<51.925500,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.510100,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.679500,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<52.510100,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<53.679500,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.264200,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<53.679500,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.264200,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.264200,0.000000,86.411700>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,-90.000000,0> translate<54.264200,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.264200,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.925500,0.000000,86.411700>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<51.925500,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<55.433600,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<55.433600,0.000000,87.581100>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,90.000000,0> translate<55.433600,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<55.433600,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.602900,0.000000,87.581100>}
box{<0,0,-0.152400><1.653711,0.036000,0.152400> rotate<0,-44.999480,0> translate<55.433600,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.602900,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<57.187600,0.000000,87.581100>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,0.000000,0> translate<56.602900,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.865100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.865100,0.000000,88.750500>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,90.000000,0> translate<61.865100,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.865100,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,88.750500>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,0.000000,0> translate<61.865100,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,88.165800>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<63.619100,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,87.581100>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,-90.000000,0> translate<64.203800,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,-44.997030,0> translate<63.619100,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,86.411700>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<63.619100,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,85.827000>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,-90.000000,0> translate<64.203800,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.203800,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,85.242400>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-44.992130,0> translate<63.619100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.865100,0.000000,85.242400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,0.000000,0> translate<61.865100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.865100,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.619100,0.000000,86.996400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,0.000000,0> translate<61.865100,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.957800,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.127200,0.000000,85.242400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<65.957800,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.127200,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.711900,0.000000,85.827000>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-44.992130,0> translate<67.127200,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.711900,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.711900,0.000000,86.996400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,90.000000,0> translate<67.711900,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.711900,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.127200,0.000000,87.581100>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<67.127200,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<67.127200,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.957800,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<65.957800,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.957800,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.373200,0.000000,86.996400>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<65.373200,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.373200,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.373200,0.000000,85.827000>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,-90.000000,0> translate<65.373200,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.373200,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.957800,0.000000,85.242400>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<65.373200,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<69.465900,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<70.635300,0.000000,87.581100>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<69.465900,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<70.635300,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<71.220000,0.000000,86.996400>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<70.635300,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<71.220000,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<71.220000,0.000000,85.242400>}
box{<0,0,-0.152400><1.754000,0.036000,0.152400> rotate<0,-90.000000,0> translate<71.220000,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<71.220000,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<69.465900,0.000000,85.242400>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<69.465900,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<69.465900,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<68.881300,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<68.881300,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<68.881300,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<69.465900,0.000000,86.411700>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<68.881300,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<69.465900,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<71.220000,0.000000,86.411700>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<69.465900,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<72.389400,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<72.389400,0.000000,87.581100>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,90.000000,0> translate<72.389400,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<72.389400,0.000000,86.411700>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<73.558700,0.000000,87.581100>}
box{<0,0,-0.152400><1.653711,0.036000,0.152400> rotate<0,-44.999480,0> translate<72.389400,0.000000,86.411700> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<73.558700,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<74.143400,0.000000,87.581100>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,0.000000,0> translate<73.558700,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<77.651500,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<77.651500,0.000000,85.242400>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,-90.000000,0> translate<77.651500,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<77.651500,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.897400,0.000000,85.242400>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<75.897400,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.897400,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.312800,0.000000,85.827000>}
box{<0,0,-0.152400><0.826749,0.036000,0.152400> rotate<0,44.997030,0> translate<75.312800,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.312800,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.312800,0.000000,86.996400>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,90.000000,0> translate<75.312800,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.312800,0.000000,86.996400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.897400,0.000000,87.581100>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<75.312800,0.000000,86.996400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<75.897400,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<77.651500,0.000000,87.581100>}
box{<0,0,-0.152400><1.754100,0.036000,0.152400> rotate<0,0.000000,0> translate<75.897400,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<82.329000,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<83.498300,0.000000,88.750500>}
box{<0,0,-0.152400><1.653711,0.036000,0.152400> rotate<0,-44.999480,0> translate<82.329000,0.000000,87.581100> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<83.498300,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<83.498300,0.000000,85.242400>}
box{<0,0,-0.152400><3.508100,0.036000,0.152400> rotate<0,-90.000000,0> translate<83.498300,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<82.329000,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<84.667700,0.000000,85.242400>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<82.329000,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<85.837100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<85.837100,0.000000,85.827000>}
box{<0,0,-0.152400><0.584600,0.036000,0.152400> rotate<0,90.000000,0> translate<85.837100,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<85.837100,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<86.421700,0.000000,85.827000>}
box{<0,0,-0.152400><0.584600,0.036000,0.152400> rotate<0,0.000000,0> translate<85.837100,0.000000,85.827000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<86.421700,0.000000,85.827000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<86.421700,0.000000,85.242400>}
box{<0,0,-0.152400><0.584600,0.036000,0.152400> rotate<0,-90.000000,0> translate<86.421700,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<86.421700,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<85.837100,0.000000,85.242400>}
box{<0,0,-0.152400><0.584600,0.036000,0.152400> rotate<0,0.000000,0> translate<85.837100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.929800,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<87.591100,0.000000,85.242400>}
box{<0,0,-0.152400><2.338700,0.036000,0.152400> rotate<0,0.000000,0> translate<87.591100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<87.591100,0.000000,85.242400>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.929800,0.000000,87.581100>}
box{<0,0,-0.152400><3.307421,0.036000,0.152400> rotate<0,-44.997030,0> translate<87.591100,0.000000,85.242400> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.929800,0.000000,87.581100>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.929800,0.000000,88.165800>}
box{<0,0,-0.152400><0.584700,0.036000,0.152400> rotate<0,90.000000,0> translate<89.929800,0.000000,88.165800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.929800,0.000000,88.165800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.345100,0.000000,88.750500>}
box{<0,0,-0.152400><0.826891,0.036000,0.152400> rotate<0,44.997030,0> translate<89.345100,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<89.345100,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<88.175700,0.000000,88.750500>}
box{<0,0,-0.152400><1.169400,0.036000,0.152400> rotate<0,0.000000,0> translate<88.175700,0.000000,88.750500> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<88.175700,0.000000,88.750500>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<87.591100,0.000000,88.165800>}
box{<0,0,-0.152400><0.826820,0.036000,0.152400> rotate<0,-45.001930,0> translate<87.591100,0.000000,88.165800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.518900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.188300,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<11.518900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.853600,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.853600,0.000000,83.377200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<11.853600,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.518900,0.000000,83.377200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.188300,0.000000,83.377200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<11.518900,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.859800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.859800,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<12.859800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.859800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.863900,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<12.859800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.863900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.198600,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<13.863900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.198600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.198600,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<14.198600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.871100,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.875200,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<14.871100,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.875200,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.209900,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<15.875200,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.209900,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.875200,0.000000,82.038300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<15.875200,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.875200,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.205800,0.000000,82.038300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<15.205800,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.205800,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.871100,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<14.871100,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.871100,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.205800,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<14.871100,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.205800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.209900,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<15.205800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.217100,0.000000,83.042400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.217100,0.000000,81.703600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<17.217100,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.217100,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.551800,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<17.217100,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.882400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.551800,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.882400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.223300,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.223300,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<18.223300,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.223300,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.892700,0.000000,82.707700>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,-44.997030,0> translate<18.223300,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.892700,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.227400,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<18.892700,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.899400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.899400,0.000000,81.703600>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<19.899400,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.899400,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.234100,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<19.899400,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.234100,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.238200,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<20.234100,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.238200,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.238200,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<21.238200,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.249500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.245400,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<22.245400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.245400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.910700,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<21.910700,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.910700,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.910700,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<21.910700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.910700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.245400,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<21.910700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.245400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.249500,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<22.245400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.256700,0.000000,83.042400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.256700,0.000000,81.703600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<24.256700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.256700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.591400,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<24.256700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.922000,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.591400,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<23.922000,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.262900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.597600,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<25.262900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.597600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.597600,0.000000,81.368900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<25.597600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.262900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.932300,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<25.262900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.597600,0.000000,83.711900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.597600,0.000000,83.377200>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<25.597600,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.938500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.607900,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<26.938500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.607900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.942600,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<27.607900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.942600,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.942600,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<27.942600,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.942600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.607900,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<27.607900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.607900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.938500,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<26.938500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.938500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.603800,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<26.603800,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.603800,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.603800,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<26.603800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.603800,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.938500,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<26.603800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.615100,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.615100,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<28.615100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.615100,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.619200,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<28.615100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.619200,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.953900,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<29.619200,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.953900,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.953900,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<29.953900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.626400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.630500,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<30.626400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.630500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.965200,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<31.630500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.965200,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.630500,0.000000,82.038300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<31.630500,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.630500,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.961100,0.000000,82.038300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<30.961100,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.961100,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.626400,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<30.626400,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.626400,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.961100,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<30.626400,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.961100,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.965200,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<30.961100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<32.637700,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,82.373000>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<32.972400,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,82.373000>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<32.637700,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<32.637700,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<32.637700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<32.972400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.972400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<32.637700,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.637700,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<32.637700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.654600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.654600,0.000000,81.703600>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<35.654600,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.654600,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.989300,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<35.654600,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.989300,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.324000,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<35.989300,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.324000,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.658700,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<36.324000,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.658700,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.993400,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<36.658700,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.993400,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.993400,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,90.000000,0> translate<36.993400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.665900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.000600,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<37.665900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.000600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.000600,0.000000,81.368900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<38.000600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.665900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.335300,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<37.665900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.000600,0.000000,83.711900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.000600,0.000000,83.377200>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<38.000600,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.006800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.006800,0.000000,83.377200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<39.006800,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.010900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.006800,0.000000,82.038300>}
box{<0,0,-0.088900><1.206778,0.036000,0.088900> rotate<0,33.687844,0> translate<39.006800,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.006800,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.010900,0.000000,82.707700>}
box{<0,0,-0.088900><1.206778,0.036000,0.088900> rotate<0,-33.687844,0> translate<39.006800,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.682900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.017600,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<40.682900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.017600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.017600,0.000000,81.368900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<41.017600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.682900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.352300,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<40.682900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.017600,0.000000,83.711900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.017600,0.000000,83.377200>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<41.017600,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.023800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.023800,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<42.023800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.023800,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.358500,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<42.023800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.358500,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.358500,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<42.358500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.358500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.023800,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<42.023800,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.029400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.029400,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<43.029400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.029400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.364100,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<43.029400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.364100,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.698800,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<43.364100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.698800,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.698800,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<43.698800,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.698800,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<44.033500,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<43.698800,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<44.033500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<44.368200,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<44.033500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<44.368200,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<44.368200,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<44.368200,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.375400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.044800,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<45.375400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.044800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.379500,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<46.044800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.379500,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.379500,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<46.379500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.379500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.375400,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<45.375400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.375400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.040700,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<45.040700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.040700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.375400,0.000000,82.038300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<45.040700,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.375400,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.379500,0.000000,82.038300>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<45.375400,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.052000,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.052000,0.000000,83.377200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<47.052000,0.000000,83.377200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.056100,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.052000,0.000000,82.038300>}
box{<0,0,-0.088900><1.206778,0.036000,0.088900> rotate<0,33.687844,0> translate<47.052000,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.052000,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.056100,0.000000,82.707700>}
box{<0,0,-0.088900><1.206778,0.036000,0.088900> rotate<0,-33.687844,0> translate<47.052000,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.732200,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.062800,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<49.062800,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.062800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.728100,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<48.728100,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.728100,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.728100,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<48.728100,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.728100,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.062800,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<48.728100,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.062800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.732200,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<49.062800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.732200,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.066900,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<49.732200,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.066900,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.066900,0.000000,82.038300>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<50.066900,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.066900,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.728100,0.000000,82.038300>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<48.728100,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.739400,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.739400,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<50.739400,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.739400,0.000000,82.038300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.408800,0.000000,82.707700>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,-44.997030,0> translate<50.739400,0.000000,82.038300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.408800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.743500,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<51.408800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.415500,0.000000,83.377200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.415500,0.000000,81.368900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<52.415500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.415500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.419600,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<52.415500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.419600,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.754300,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<53.419600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.754300,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.754300,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<53.754300,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.754300,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.419600,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<53.419600,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.419600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.415500,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<52.415500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.761500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.430900,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<54.761500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.430900,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.765600,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<55.430900,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.765600,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.765600,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<55.765600,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.765600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.430900,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<55.430900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.430900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.761500,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<54.761500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.761500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.426800,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<54.426800,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.426800,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.426800,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<54.426800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.426800,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.761500,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<54.426800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.772800,0.000000,83.042400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.772800,0.000000,81.703600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<56.772800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.772800,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.107500,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<56.772800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.438100,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.107500,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<56.438100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.779000,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.779000,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<57.779000,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.779000,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.113700,0.000000,81.703600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<57.779000,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.113700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.113700,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<58.113700,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.113700,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.779000,0.000000,81.368900>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<57.779000,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.123400,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<59.119300,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<59.119300,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<59.119300,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.784600,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<58.784600,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.784600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.784600,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<58.784600,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.784600,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<59.119300,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<58.784600,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<59.119300,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.123400,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<59.119300,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.130600,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.800000,0.000000,81.368900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<61.130600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.800000,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.134700,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<61.800000,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.134700,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.134700,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<62.134700,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.134700,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.800000,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<61.800000,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.800000,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.130600,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<61.130600,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.130600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.795900,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<60.795900,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.795900,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.795900,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<60.795900,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<60.795900,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<61.130600,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<60.795900,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.807200,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.807200,0.000000,82.707700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<62.807200,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<62.807200,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.141900,0.000000,82.707700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,0.000000,0> translate<62.807200,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.141900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.476600,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<63.141900,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.476600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.476600,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<63.476600,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.476600,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.811300,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<63.476600,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<63.811300,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<64.146000,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<63.811300,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<64.146000,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<64.146000,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<64.146000,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<64.818500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<66.157300,0.000000,83.377200>}
box{<0,0,-0.088900><2.413639,0.036000,0.088900> rotate<0,-56.307533,0> translate<64.818500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.168600,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<67.164500,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<67.164500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<67.164500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<66.829800,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<66.829800,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<66.829800,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<66.829800,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<66.829800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<66.829800,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<67.164500,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<66.829800,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<67.164500,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.168600,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<67.164500,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<70.179900,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<69.175800,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<69.175800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<69.175800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.841100,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<68.841100,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.841100,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.841100,0.000000,81.703600>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<68.841100,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<68.841100,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<69.175800,0.000000,81.368900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<68.841100,0.000000,81.703600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<69.175800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<70.179900,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<69.175800,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<70.852400,0.000000,83.377200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<70.852400,0.000000,81.368900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<70.852400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<70.852400,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<71.187100,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<70.852400,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<71.187100,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<71.856500,0.000000,82.707700>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<71.187100,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<71.856500,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.191200,0.000000,82.373000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<71.856500,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.191200,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.191200,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,-90.000000,0> translate<72.191200,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.863700,0.000000,83.377200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.863700,0.000000,81.368900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<72.863700,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.863700,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<73.867800,0.000000,81.368900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<72.863700,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<73.867800,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.202500,0.000000,81.703600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<73.867800,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.202500,0.000000,81.703600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.202500,0.000000,82.373000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<74.202500,0.000000,82.373000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.202500,0.000000,82.373000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<73.867800,0.000000,82.707700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<73.867800,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<73.867800,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<72.863700,0.000000,82.707700>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<72.863700,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.875000,0.000000,82.707700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<75.544400,0.000000,83.377200>}
box{<0,0,-0.088900><0.946745,0.036000,0.088900> rotate<0,-45.001309,0> translate<74.875000,0.000000,82.707700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<75.544400,0.000000,83.377200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<75.544400,0.000000,81.368900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<75.544400,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<74.875000,0.000000,81.368900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<76.213800,0.000000,81.368900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<74.875000,0.000000,81.368900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,16.231700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.828100,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,16.011400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.607800,0.000000,16.011400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,16.011400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,15.130100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.607800,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,14.909800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.607800,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.828100,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,15.130100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.268700,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,16.011400>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<12.489000,0.000000,16.011400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,16.011400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,16.231700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.268700,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,15.791000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<12.917500,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.358100,0.000000,15.791000>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.917500,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.358100,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.578400,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<13.358100,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008900,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.229200,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<14.008900,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.229200,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.229200,0.000000,14.909800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.229200,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008900,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.449500,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<14.008900,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.229200,0.000000,16.452000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.229200,0.000000,16.231700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.229200,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.322600,0.000000,14.469200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.542900,0.000000,14.469200>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<15.322600,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.542900,0.000000,14.469200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.763200,0.000000,14.689500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.542900,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.763200,0.000000,14.689500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.763200,0.000000,15.791000>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,90.000000,0> translate<15.763200,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.763200,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.102300,0.000000,15.791000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<15.102300,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.102300,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.882000,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.882000,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.882000,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.882000,0.000000,15.130100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.882000,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.882000,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.102300,0.000000,14.909800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<14.882000,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.102300,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.763200,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<15.102300,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.191700,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.412000,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<16.191700,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.412000,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.412000,0.000000,14.909800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.412000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.191700,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.632300,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<16.191700,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.412000,0.000000,16.452000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.412000,0.000000,16.231700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.412000,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.064800,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.064800,0.000000,15.791000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<17.064800,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.064800,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.725700,0.000000,15.791000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<17.064800,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.725700,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.946000,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<17.725700,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.946000,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.946000,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.946000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.594800,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.035400,0.000000,15.791000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<18.594800,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.035400,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.255700,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<19.035400,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.255700,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.255700,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.255700,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.255700,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.594800,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<18.594800,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.594800,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.374500,0.000000,15.130100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<18.374500,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.374500,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.594800,0.000000,15.350400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<18.374500,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.594800,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.255700,0.000000,15.350400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<18.594800,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.684200,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.904500,0.000000,16.231700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<19.684200,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.904500,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.904500,0.000000,14.909800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.904500,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.684200,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.124800,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<19.684200,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867000,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867000,0.000000,14.909800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.867000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867000,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.527900,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<21.867000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.527900,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.748200,0.000000,15.130100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.527900,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.748200,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.748200,0.000000,16.011400>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<22.748200,0.000000,16.011400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.748200,0.000000,16.011400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.527900,0.000000,16.231700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<22.527900,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.527900,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867000,0.000000,16.231700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<21.867000,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.837600,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.397000,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<23.397000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.397000,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.176700,0.000000,15.130100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<23.176700,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.176700,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.176700,0.000000,15.570700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<23.176700,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.176700,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.397000,0.000000,15.791000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.176700,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.397000,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.837600,0.000000,15.791000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<23.397000,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.837600,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.057900,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<23.837600,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.057900,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.057900,0.000000,15.350400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.057900,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.057900,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.176700,0.000000,15.350400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<23.176700,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<24.486400,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,15.130100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.147300,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,15.350400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<25.147300,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,15.350400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<24.706700,0.000000,15.350400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<24.486400,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,15.791000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.486400,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,15.791000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<24.706700,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.796100,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.016400,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<25.796100,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.016400,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.016400,0.000000,14.909800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.016400,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.796100,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.236700,0.000000,14.909800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<25.796100,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.016400,0.000000,16.452000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.016400,0.000000,16.231700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.016400,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.109800,0.000000,14.469200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.330100,0.000000,14.469200>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<27.109800,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.330100,0.000000,14.469200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550400,0.000000,14.689500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<27.330100,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550400,0.000000,14.689500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550400,0.000000,15.791000>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,90.000000,0> translate<27.550400,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550400,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.889500,0.000000,15.791000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<26.889500,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.889500,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.669200,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.669200,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.669200,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.669200,0.000000,15.130100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.669200,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.669200,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.889500,0.000000,14.909800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<26.669200,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.889500,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550400,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<26.889500,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.978900,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.978900,0.000000,15.791000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<27.978900,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.978900,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.639800,0.000000,15.791000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<27.978900,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.639800,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.860100,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<28.639800,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.860100,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.860100,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.860100,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.598300,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.598300,0.000000,16.231700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<30.598300,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.598300,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,16.231700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<30.598300,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,16.231700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,16.011400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<31.259200,0.000000,16.231700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,16.011400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.791000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.479500,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,15.570700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.259200,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.350400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<31.259200,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.350400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.130100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.479500,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.479500,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,14.909800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.259200,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.598300,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<30.598300,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.598300,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.259200,0.000000,15.570700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<30.598300,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.908000,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.908000,0.000000,15.130100>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.908000,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.908000,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.128300,0.000000,14.909800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<31.908000,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.128300,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789200,0.000000,14.909800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<32.128300,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789200,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789200,0.000000,14.689500>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.789200,0.000000,14.689500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789200,0.000000,14.689500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.568900,0.000000,14.469200>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.568900,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.568900,0.000000,14.469200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.348600,0.000000,14.469200>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<32.348600,0.000000,14.469200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.217700,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.791000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.570700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.438000,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.570700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.217700,0.000000,15.570700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.570700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.791000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<33.217700,0.000000,15.791000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.130100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.217700,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,15.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,14.909800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.438000,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.438000,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,14.909800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.217700,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.217700,0.000000,15.130100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<33.217700,0.000000,15.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.579700,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.579700,0.000000,16.587300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<75.579700,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.579700,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.020300,0.000000,16.146600>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,45.003531,0> translate<75.579700,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.020300,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.460900,0.000000,16.587300>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-45.003531,0> translate<76.020300,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.460900,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.460900,0.000000,15.265400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.460900,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.109700,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.550300,0.000000,15.265400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<77.109700,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.550300,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.770600,0.000000,15.485700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<77.550300,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.770600,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.770600,0.000000,15.926300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<77.770600,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.770600,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.550300,0.000000,16.146600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<77.550300,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.550300,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.109700,0.000000,16.146600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<77.109700,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.109700,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.889400,0.000000,15.926300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<76.889400,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.889400,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.889400,0.000000,15.485700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.889400,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.889400,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.109700,0.000000,15.265400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<76.889400,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.080300,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.080300,0.000000,15.265400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.080300,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.080300,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.419400,0.000000,15.265400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<78.419400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.419400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.199100,0.000000,15.485700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<78.199100,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.199100,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.199100,0.000000,15.926300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<78.199100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.199100,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.419400,0.000000,16.146600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<78.199100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.419400,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.080300,0.000000,16.146600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<78.419400,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.508800,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.729100,0.000000,16.146600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<79.508800,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.729100,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.729100,0.000000,15.265400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.729100,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.508800,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.949400,0.000000,15.265400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<79.508800,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.729100,0.000000,16.807600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.729100,0.000000,16.587300>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.729100,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.602200,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.602200,0.000000,16.367000>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,90.000000,0> translate<80.602200,0.000000,16.367000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.602200,0.000000,16.367000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.822500,0.000000,16.587300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<80.602200,0.000000,16.367000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.381900,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.822500,0.000000,15.926300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<80.381900,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.255000,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.475300,0.000000,16.146600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<81.255000,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.475300,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.475300,0.000000,15.265400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<81.475300,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.255000,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.695600,0.000000,15.265400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<81.255000,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.475300,0.000000,16.807600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.475300,0.000000,16.587300>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<81.475300,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.789000,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.348400,0.000000,15.265400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<82.348400,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.348400,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.128100,0.000000,15.485700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<82.128100,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.128100,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.128100,0.000000,15.926300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<82.128100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.128100,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.348400,0.000000,16.146600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<82.128100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.348400,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.789000,0.000000,16.146600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<82.348400,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.789000,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.009300,0.000000,15.926300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<82.789000,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.009300,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.009300,0.000000,15.706000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<83.009300,0.000000,15.706000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.009300,0.000000,15.706000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.128100,0.000000,15.706000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<82.128100,0.000000,15.706000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.319000,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.319000,0.000000,15.265400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<84.319000,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.319000,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.658100,0.000000,15.265400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<83.658100,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.658100,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.437800,0.000000,15.485700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<83.437800,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.437800,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.437800,0.000000,15.926300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<83.437800,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.437800,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.658100,0.000000,16.146600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<83.437800,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.658100,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.319000,0.000000,16.146600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<83.658100,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.057200,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.057200,0.000000,16.587300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<86.057200,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.057200,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,16.587300>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<86.057200,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,16.587300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,16.367000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<86.718100,0.000000,16.587300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,16.367000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,16.146600>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<86.938400,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,15.926300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<86.718100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,15.706000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<86.718100,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,15.706000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,15.485700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<86.938400,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.938400,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,15.265400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<86.718100,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.057200,0.000000,15.265400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<86.057200,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.057200,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.718100,0.000000,15.926300>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<86.057200,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.366900,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.366900,0.000000,15.485700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<87.366900,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.366900,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.587200,0.000000,15.265400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<87.366900,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.587200,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.248100,0.000000,15.265400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<87.587200,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.248100,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.248100,0.000000,15.045100>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.248100,0.000000,15.045100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.248100,0.000000,15.045100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.027800,0.000000,14.824800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<88.027800,0.000000,14.824800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.027800,0.000000,14.824800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.807500,0.000000,14.824800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<87.807500,0.000000,14.824800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,16.146600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<88.676600,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,16.146600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.926300>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.896900,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.926300>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<88.676600,0.000000,15.926300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.926300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,16.146600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<88.676600,0.000000,16.146600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.485700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<88.676600,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.485700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.265400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.896900,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.896900,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.265400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<88.676600,0.000000,15.265400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.265400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.676600,0.000000,15.485700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<88.676600,0.000000,15.485700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,11.353800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.607800,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,11.353800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<11.607800,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,12.235000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<12.917500,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,11.353800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.137800,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.358100,0.000000,11.353800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<12.917500,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,12.896000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,12.675700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.137800,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.671800,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.010900,0.000000,12.235000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<14.010900,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.010900,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.790600,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.790600,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.790600,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.790600,0.000000,11.574100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.790600,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.790600,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.010900,0.000000,11.353800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<13.790600,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.010900,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.671800,0.000000,11.353800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<14.010900,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.761200,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.320600,0.000000,11.353800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<15.320600,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.320600,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.100300,0.000000,11.574100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<15.100300,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.100300,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.100300,0.000000,12.014700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<15.100300,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.100300,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.320600,0.000000,12.235000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.100300,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.320600,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.761200,0.000000,12.235000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<15.320600,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.761200,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.981500,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<15.761200,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.981500,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.981500,0.000000,11.794400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.981500,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.981500,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.100300,0.000000,11.794400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<15.100300,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.410000,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.410000,0.000000,12.235000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<16.410000,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.410000,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.070900,0.000000,12.235000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<16.410000,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.070900,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.291200,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<17.070900,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.291200,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.291200,0.000000,11.353800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.291200,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.719700,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.380600,0.000000,11.353800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<17.719700,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.380600,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.600900,0.000000,11.574100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<18.380600,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.600900,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.380600,0.000000,11.794400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<18.380600,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.380600,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940000,0.000000,11.794400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<17.940000,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940000,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.719700,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<17.719700,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.719700,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940000,0.000000,12.235000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<17.719700,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940000,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.600900,0.000000,12.235000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<17.940000,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.690300,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.249700,0.000000,11.353800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<19.249700,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.249700,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.029400,0.000000,11.574100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<19.029400,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.029400,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.029400,0.000000,12.014700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<19.029400,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.029400,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.249700,0.000000,12.235000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.029400,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.249700,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.690300,0.000000,12.235000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<19.249700,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.690300,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.910600,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<19.690300,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.910600,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.910600,0.000000,11.794400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.910600,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.910600,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.029400,0.000000,11.794400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<19.029400,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,12.235000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<20.339100,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,12.014700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.559400,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,12.014700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<20.339100,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,12.235000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<20.339100,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,11.574100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<20.339100,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,11.353800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.559400,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.559400,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,11.353800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<20.339100,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.339100,0.000000,11.574100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<20.339100,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.184800,0.000000,12.455400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.964500,0.000000,12.675700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<22.964500,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.964500,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.523900,0.000000,12.675700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.523900,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.523900,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.303600,0.000000,12.455400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.303600,0.000000,12.455400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.303600,0.000000,12.455400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.303600,0.000000,11.574100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.303600,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.303600,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.523900,0.000000,11.353800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<22.303600,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.523900,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.964500,0.000000,11.353800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.523900,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.964500,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.184800,0.000000,11.574100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.964500,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.184800,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.184800,0.000000,12.014700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<23.184800,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.184800,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.744200,0.000000,12.014700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.744200,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,12.675700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<23.613300,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274200,0.000000,12.675700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<23.613300,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274200,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.494500,0.000000,12.455400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<24.274200,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.494500,0.000000,12.455400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.494500,0.000000,12.014700>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.494500,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.494500,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274200,0.000000,11.794400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.274200,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274200,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,11.794400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<23.613300,0.000000,11.794400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.923000,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.923000,0.000000,11.353800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.923000,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.923000,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.804200,0.000000,11.353800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<24.923000,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.232700,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.673300,0.000000,11.353800>}
box{<0,0,-0.050800><0.985212,0.036000,0.050800> rotate<0,63.430762,0> translate<26.232700,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.673300,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.113900,0.000000,12.235000>}
box{<0,0,-0.050800><0.985212,0.036000,0.050800> rotate<0,-63.430762,0> translate<26.673300,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.542400,0.000000,12.455400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.762700,0.000000,12.675700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<27.542400,0.000000,12.455400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.762700,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,12.675700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<27.762700,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,12.675700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,12.455400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<28.203300,0.000000,12.675700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,12.455400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,12.235000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.423600,0.000000,12.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,12.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,12.014700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.203300,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.983000,0.000000,12.014700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<27.983000,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,12.014700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,11.794400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<28.203300,0.000000,12.014700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,11.794400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,11.574100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.423600,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.423600,0.000000,11.574100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,11.353800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.203300,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.203300,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.762700,0.000000,11.353800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<27.762700,0.000000,11.353800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.762700,0.000000,11.353800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.542400,0.000000,11.574100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<27.542400,0.000000,11.574100> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<27.659700,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<27.659700,0.000000,58.171000>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,90.000000,0> translate<27.659700,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<27.659700,0.000000,55.196700>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.625400,0.000000,55.196700>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<27.659700,0.000000,55.196700> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.625400,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.625400,0.000000,52.222400>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,-90.000000,0> translate<31.625400,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<36.574500,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.591600,0.000000,58.171000>}
box{<0,0,-0.254000><1.982900,0.036000,0.254000> rotate<0,0.000000,0> translate<34.591600,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.591600,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.600200,0.000000,57.179600>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,-44.997030,0> translate<33.600200,0.000000,57.179600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.600200,0.000000,57.179600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.600200,0.000000,53.213800>}
box{<0,0,-0.254000><3.965800,0.036000,0.254000> rotate<0,-90.000000,0> translate<33.600200,0.000000,53.213800> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.600200,0.000000,53.213800>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.591600,0.000000,52.222400>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,44.997030,0> translate<33.600200,0.000000,53.213800> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.591600,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<36.574500,0.000000,52.222400>}
box{<0,0,-0.254000><1.982900,0.036000,0.254000> rotate<0,0.000000,0> translate<34.591600,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<36.574500,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.565900,0.000000,53.213800>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,-44.997030,0> translate<36.574500,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.565900,0.000000,53.213800>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.565900,0.000000,57.179600>}
box{<0,0,-0.254000><3.965800,0.036000,0.254000> rotate<0,90.000000,0> translate<37.565900,0.000000,57.179600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<37.565900,0.000000,57.179600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<36.574500,0.000000,58.171000>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,44.997030,0> translate<36.574500,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<41.523500,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<41.523500,0.000000,58.171000>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,90.000000,0> translate<41.523500,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.540700,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.506400,0.000000,58.171000>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<39.540700,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.421700,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.387400,0.000000,58.171000>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<51.421700,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.387400,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.387400,0.000000,57.179600>}
box{<0,0,-0.254000><0.991400,0.036000,0.254000> rotate<0,-90.000000,0> translate<55.387400,0.000000,57.179600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.387400,0.000000,57.179600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.421700,0.000000,53.213800>}
box{<0,0,-0.254000><5.608417,0.036000,0.254000> rotate<0,-44.997753,0> translate<51.421700,0.000000,53.213800> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.421700,0.000000,53.213800>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.421700,0.000000,52.222400>}
box{<0,0,-0.254000><0.991400,0.036000,0.254000> rotate<0,-90.000000,0> translate<51.421700,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.421700,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.387400,0.000000,52.222400>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<51.421700,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<60.336500,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.353600,0.000000,58.171000>}
box{<0,0,-0.254000><1.982900,0.036000,0.254000> rotate<0,0.000000,0> translate<58.353600,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.353600,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.362200,0.000000,57.179600>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,-44.997030,0> translate<57.362200,0.000000,57.179600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.362200,0.000000,57.179600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.362200,0.000000,53.213800>}
box{<0,0,-0.254000><3.965800,0.036000,0.254000> rotate<0,-90.000000,0> translate<57.362200,0.000000,53.213800> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.362200,0.000000,53.213800>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.353600,0.000000,52.222400>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,44.997030,0> translate<57.362200,0.000000,53.213800> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.353600,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<60.336500,0.000000,52.222400>}
box{<0,0,-0.254000><1.982900,0.036000,0.254000> rotate<0,0.000000,0> translate<58.353600,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<60.336500,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<61.327900,0.000000,53.213800>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,-44.997030,0> translate<60.336500,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<61.327900,0.000000,53.213800>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<61.327900,0.000000,57.179600>}
box{<0,0,-0.254000><3.965800,0.036000,0.254000> rotate<0,90.000000,0> translate<61.327900,0.000000,57.179600> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<61.327900,0.000000,57.179600>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<60.336500,0.000000,58.171000>}
box{<0,0,-0.254000><1.402051,0.036000,0.254000> rotate<0,44.997030,0> translate<60.336500,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.302700,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.302700,0.000000,58.171000>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,90.000000,0> translate<63.302700,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.302700,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.268400,0.000000,52.222400>}
box{<0,0,-0.254000><7.149309,0.036000,0.254000> rotate<0,56.306438,0> translate<63.302700,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.268400,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.268400,0.000000,58.171000>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,90.000000,0> translate<67.268400,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<73.208900,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.243200,0.000000,58.171000>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<69.243200,0.000000,58.171000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.243200,0.000000,58.171000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.243200,0.000000,52.222400>}
box{<0,0,-0.254000><5.948600,0.036000,0.254000> rotate<0,-90.000000,0> translate<69.243200,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.243200,0.000000,52.222400>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<73.208900,0.000000,52.222400>}
box{<0,0,-0.254000><3.965700,0.036000,0.254000> rotate<0,0.000000,0> translate<69.243200,0.000000,52.222400> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.243200,0.000000,55.196700>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<71.226000,0.000000,55.196700>}
box{<0,0,-0.254000><1.982800,0.036000,0.254000> rotate<0,0.000000,0> translate<69.243200,0.000000,55.196700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.968300,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.748000,0.000000,12.396300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<72.748000,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.748000,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.307400,0.000000,12.396300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<72.307400,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.307400,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.087100,0.000000,12.176000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<72.087100,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.087100,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.087100,0.000000,11.294700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<72.087100,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.087100,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.307400,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<72.087100,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.307400,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.748000,0.000000,11.074400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<72.307400,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.748000,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.968300,0.000000,11.294700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<72.748000,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.617100,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.057700,0.000000,11.074400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<73.617100,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.057700,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.278000,0.000000,11.294700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<74.057700,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.278000,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.278000,0.000000,11.735300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<74.278000,0.000000,11.735300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.278000,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.057700,0.000000,11.955600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<74.057700,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.057700,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.617100,0.000000,11.955600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<73.617100,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.617100,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.396800,0.000000,11.735300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<73.396800,0.000000,11.735300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.396800,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.396800,0.000000,11.294700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<73.396800,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.396800,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.617100,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<73.396800,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.706500,0.000000,10.633800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.706500,0.000000,11.955600>}
box{<0,0,-0.050800><1.321800,0.036000,0.050800> rotate<0,90.000000,0> translate<74.706500,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.706500,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.367400,0.000000,11.955600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<74.706500,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.367400,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.587700,0.000000,11.735300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<75.367400,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.587700,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.587700,0.000000,11.294700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<75.587700,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.587700,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.367400,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<75.367400,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.367400,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.706500,0.000000,11.074400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<74.706500,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.016200,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.016200,0.000000,11.294700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.016200,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.016200,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.236500,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<76.016200,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.236500,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.897400,0.000000,11.074400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<76.236500,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.897400,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.897400,0.000000,10.854100>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.897400,0.000000,10.854100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.897400,0.000000,10.854100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.677100,0.000000,10.633800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<76.677100,0.000000,10.633800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.677100,0.000000,10.633800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.456800,0.000000,10.633800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<76.456800,0.000000,10.633800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.325900,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.325900,0.000000,11.955600>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<77.325900,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.325900,0.000000,11.515000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.766500,0.000000,11.955600>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<77.325900,0.000000,11.515000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.766500,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.986800,0.000000,11.955600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<77.766500,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.417300,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.637600,0.000000,11.955600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<78.417300,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.637600,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.637600,0.000000,11.074400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<78.637600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.417300,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.857900,0.000000,11.074400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<78.417300,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.637600,0.000000,12.616600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.637600,0.000000,12.396300>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<78.637600,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.731000,0.000000,10.633800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.951300,0.000000,10.633800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<79.731000,0.000000,10.633800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.951300,0.000000,10.633800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.171600,0.000000,10.854100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<79.951300,0.000000,10.633800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.171600,0.000000,10.854100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.171600,0.000000,11.955600>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,90.000000,0> translate<80.171600,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.171600,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.510700,0.000000,11.955600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<79.510700,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.510700,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.290400,0.000000,11.735300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<79.290400,0.000000,11.735300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.290400,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.290400,0.000000,11.294700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.290400,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.290400,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.510700,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<79.290400,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.510700,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.171600,0.000000,11.074400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<79.510700,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.600100,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.600100,0.000000,11.074400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<80.600100,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.600100,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.820400,0.000000,11.955600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<80.600100,0.000000,11.735300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.820400,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.261000,0.000000,11.955600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<80.820400,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.261000,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.481300,0.000000,11.735300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<81.261000,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.481300,0.000000,11.735300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.481300,0.000000,11.074400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<81.481300,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.130100,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.130100,0.000000,11.294700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<82.130100,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.130100,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.350400,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<82.130100,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.909800,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.350400,0.000000,11.955600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<81.909800,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.973800,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.092600,0.000000,11.074400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<84.092600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.092600,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.973800,0.000000,11.955600>}
box{<0,0,-0.050800><1.246205,0.036000,0.050800> rotate<0,-44.997030,0> translate<84.092600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.973800,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.973800,0.000000,12.176000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,90.000000,0> translate<84.973800,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.973800,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.753500,0.000000,12.396300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<84.753500,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.753500,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.312900,0.000000,12.396300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<84.312900,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.312900,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.092600,0.000000,12.176000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<84.092600,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.402300,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.402300,0.000000,12.176000>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<85.402300,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.402300,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622600,0.000000,12.396300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<85.402300,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622600,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.063200,0.000000,12.396300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<85.622600,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.063200,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283500,0.000000,12.176000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<86.063200,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283500,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283500,0.000000,11.294700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<86.283500,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283500,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.063200,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<86.063200,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.063200,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622600,0.000000,11.074400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<85.622600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622600,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.402300,0.000000,11.294700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<85.402300,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.402300,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283500,0.000000,12.176000>}
box{<0,0,-0.050800><1.246276,0.036000,0.050800> rotate<0,-45.000281,0> translate<85.402300,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.712000,0.000000,11.955600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.152600,0.000000,12.396300>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-45.003531,0> translate<86.712000,0.000000,11.955600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.152600,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.152600,0.000000,11.074400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<87.152600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.712000,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.593200,0.000000,11.074400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<86.712000,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021700,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021700,0.000000,12.176000>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<88.021700,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021700,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.242000,0.000000,12.396300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<88.021700,0.000000,12.176000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.242000,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682600,0.000000,12.396300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<88.242000,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682600,0.000000,12.396300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902900,0.000000,12.176000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<88.682600,0.000000,12.396300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902900,0.000000,12.176000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902900,0.000000,11.294700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.902900,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902900,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682600,0.000000,11.074400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<88.682600,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682600,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.242000,0.000000,11.074400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<88.242000,0.000000,11.074400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.242000,0.000000,11.074400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021700,0.000000,11.294700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<88.021700,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021700,0.000000,11.294700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902900,0.000000,12.176000>}
box{<0,0,-0.050800><1.246276,0.036000,0.050800> rotate<0,-45.000281,0> translate<88.021700,0.000000,11.294700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607800,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,13.131800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.607800,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.828100,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.048400,0.000000,13.131800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<11.828100,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.048400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.048400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268700,0.000000,14.453700>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,90.000000,0> translate<12.268700,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.048400,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.489000,0.000000,14.453700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<12.048400,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.578400,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<13.137800,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.578400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.798700,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.578400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.798700,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.798700,0.000000,13.792700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<13.798700,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.798700,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.578400,0.000000,14.013000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<13.578400,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.578400,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,14.013000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<13.137800,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.917500,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,13.352100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.917500,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.917500,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.137800,0.000000,13.131800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.917500,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.227200,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.227200,0.000000,14.013000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<14.227200,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.227200,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.667800,0.000000,14.013000>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.227200,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.667800,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.888100,0.000000,14.013000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<14.667800,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199800,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199800,0.000000,13.131800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.199800,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199800,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.538900,0.000000,13.131800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<15.538900,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.538900,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.318600,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<15.318600,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.318600,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.318600,0.000000,13.792700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<15.318600,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.318600,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.538900,0.000000,14.013000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.318600,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.538900,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199800,0.000000,14.013000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<15.538900,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.848600,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.289200,0.000000,14.013000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<16.848600,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.289200,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.509500,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<17.289200,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.509500,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.509500,0.000000,13.131800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.509500,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.509500,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.848600,0.000000,13.131800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<16.848600,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.848600,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.628300,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<16.628300,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.628300,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.848600,0.000000,13.572400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.628300,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.848600,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.509500,0.000000,13.572400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<16.848600,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.938000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.938000,0.000000,14.013000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<17.938000,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.938000,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.598900,0.000000,14.013000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<17.938000,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.598900,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.819200,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<18.598900,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.819200,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.819200,0.000000,13.131800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.819200,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.557400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.557400,0.000000,14.453700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<20.557400,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.557400,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.998000,0.000000,14.013000>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,45.003531,0> translate<20.557400,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.998000,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.438600,0.000000,14.453700>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-45.003531,0> translate<20.998000,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.438600,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.438600,0.000000,13.131800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.438600,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867100,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.087400,0.000000,14.013000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<21.867100,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.087400,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.087400,0.000000,13.131800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.087400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.867100,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.307700,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<21.867100,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.087400,0.000000,14.674000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.087400,0.000000,14.453700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.087400,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.740200,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.960500,0.000000,14.453700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<22.740200,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.960500,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.960500,0.000000,13.131800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.960500,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.740200,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.180800,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.740200,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.833600,0.000000,14.453700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<23.613300,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.833600,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.833600,0.000000,13.131800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.833600,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.613300,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.053900,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<23.613300,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<24.706700,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<24.486400,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,13.792700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<24.486400,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,14.013000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.486400,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.706700,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,14.013000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<24.706700,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.147300,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<25.147300,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,13.572400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.367600,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.367600,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.486400,0.000000,13.572400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<24.486400,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.796100,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.796100,0.000000,14.013000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<25.796100,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.796100,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.236700,0.000000,14.013000>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.796100,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.236700,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.457000,0.000000,14.013000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<26.236700,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.197200,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.078400,0.000000,14.453700>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,-56.308217,0> translate<28.197200,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.816600,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.816600,0.000000,14.453700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<30.816600,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.816600,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.697800,0.000000,13.792700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<30.816600,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.697800,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.697800,0.000000,13.131800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.697800,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.126300,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.346600,0.000000,14.013000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<32.126300,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.346600,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.346600,0.000000,13.131800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.346600,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.126300,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.566900,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<32.126300,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.346600,0.000000,14.674000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.346600,0.000000,14.453700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.346600,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.999400,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.440000,0.000000,13.131800>}
box{<0,0,-0.050800><0.985212,0.036000,0.050800> rotate<0,63.430762,0> translate<32.999400,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.440000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.880600,0.000000,14.013000>}
box{<0,0,-0.050800><0.985212,0.036000,0.050800> rotate<0,-63.430762,0> translate<33.440000,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.970000,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.529400,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<34.529400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.529400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.309100,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<34.309100,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.309100,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.309100,0.000000,13.792700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<34.309100,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.309100,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.529400,0.000000,14.013000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.309100,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.529400,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.970000,0.000000,14.013000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<34.529400,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.970000,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.190300,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<34.970000,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.190300,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.190300,0.000000,13.572400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.190300,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.190300,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.309100,0.000000,13.572400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<34.309100,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.618800,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.500000,0.000000,14.453700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<35.618800,0.000000,14.453700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.500000,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.500000,0.000000,14.233400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.500000,0.000000,14.233400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.500000,0.000000,14.233400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.618800,0.000000,13.352100>}
box{<0,0,-0.050800><1.246276,0.036000,0.050800> rotate<0,-45.000281,0> translate<35.618800,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.618800,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.618800,0.000000,13.131800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.618800,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.809700,0.000000,14.453700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.369100,0.000000,14.233400>}
box{<0,0,-0.050800><0.492606,0.036000,0.050800> rotate<0,-26.563298,0> translate<37.369100,0.000000,14.233400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.369100,0.000000,14.233400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.928500,0.000000,13.792700>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-45.003531,0> translate<36.928500,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.928500,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.928500,0.000000,13.352100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.928500,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.928500,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.148800,0.000000,13.131800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<36.928500,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.148800,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.589400,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<37.148800,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.589400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.809700,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.589400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.809700,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.809700,0.000000,13.572400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<37.809700,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.809700,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.589400,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<37.589400,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.589400,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.928500,0.000000,13.792700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<36.928500,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.238200,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.238200,0.000000,13.352100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<38.238200,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.238200,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.458500,0.000000,13.352100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<38.238200,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.458500,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.458500,0.000000,13.131800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.458500,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.458500,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.238200,0.000000,13.131800>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<38.238200,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.113300,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.553900,0.000000,13.131800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<39.113300,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.553900,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.774200,0.000000,13.352100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<39.553900,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.774200,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.774200,0.000000,13.792700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<39.774200,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.774200,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.553900,0.000000,14.013000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<39.553900,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.553900,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.113300,0.000000,14.013000>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<39.113300,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.113300,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.893000,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<38.893000,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.893000,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.893000,0.000000,13.352100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.893000,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.893000,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.113300,0.000000,13.131800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<38.893000,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.202700,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.202700,0.000000,14.013000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<40.202700,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.202700,0.000000,13.572400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.643300,0.000000,14.013000>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<40.202700,0.000000,13.572400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.643300,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.863600,0.000000,14.013000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<40.643300,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.734700,0.000000,12.691200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.955000,0.000000,12.691200>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<41.734700,0.000000,12.691200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.955000,0.000000,12.691200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.175300,0.000000,12.911500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.955000,0.000000,12.691200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.175300,0.000000,12.911500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.175300,0.000000,14.013000>}
box{<0,0,-0.050800><1.101500,0.036000,0.050800> rotate<0,90.000000,0> translate<42.175300,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.175300,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.514400,0.000000,14.013000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<41.514400,0.000000,14.013000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.514400,0.000000,14.013000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.294100,0.000000,13.792700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.294100,0.000000,13.792700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.294100,0.000000,13.792700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.294100,0.000000,13.352100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.294100,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.294100,0.000000,13.352100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.514400,0.000000,13.131800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<41.294100,0.000000,13.352100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.514400,0.000000,13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.175300,0.000000,13.131800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<41.514400,0.000000,13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.025200,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.906400,0.000000,14.301300>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<57.025200,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.906400,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.906400,0.000000,14.081000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.906400,0.000000,14.081000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.906400,0.000000,14.081000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.025200,0.000000,13.199700>}
box{<0,0,-0.050800><1.246276,0.036000,0.050800> rotate<0,-45.000281,0> translate<57.025200,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.025200,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.025200,0.000000,12.979400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.025200,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.025200,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.906400,0.000000,12.979400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<57.025200,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.555200,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.995800,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<58.555200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.995800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.216100,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<58.995800,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.216100,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.216100,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.216100,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.216100,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.555200,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<58.555200,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.555200,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.334900,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<58.334900,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.334900,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.555200,0.000000,13.420000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<58.334900,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.555200,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.216100,0.000000,13.420000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<58.555200,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.525800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.864900,0.000000,13.860600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<59.864900,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.864900,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.644600,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<59.644600,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.644600,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.644600,0.000000,13.199700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.644600,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.644600,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.864900,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<59.644600,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.864900,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.525800,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<59.864900,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.954300,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.954300,0.000000,12.979400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<60.954300,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.954300,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.174600,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<60.954300,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.174600,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.615200,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<61.174600,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.615200,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.835500,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<61.615200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.835500,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.835500,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<61.835500,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.573700,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.573700,0.000000,14.301300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<63.573700,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.573700,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.454900,0.000000,13.640300>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<63.573700,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.454900,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.454900,0.000000,12.979400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<64.454900,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.103700,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.544300,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.103700,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.544300,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.764600,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<65.544300,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.764600,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.764600,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<65.764600,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.764600,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.544300,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<65.544300,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.544300,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.103700,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.103700,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.103700,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.883400,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<64.883400,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.883400,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.883400,0.000000,13.199700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<64.883400,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.883400,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.103700,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<64.883400,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.854000,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.413400,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<66.413400,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.413400,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.193100,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<66.193100,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.193100,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.193100,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<66.193100,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.193100,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.413400,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<66.193100,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.413400,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.854000,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<66.413400,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.854000,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.074300,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<66.854000,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.074300,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.074300,0.000000,13.420000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<67.074300,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.074300,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.193100,0.000000,13.420000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<66.193100,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.502800,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.502800,0.000000,14.301300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<67.502800,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.163700,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.502800,0.000000,13.420000>}
box{<0,0,-0.050800><0.794303,0.036000,0.050800> rotate<0,33.687844,0> translate<67.502800,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.502800,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.163700,0.000000,13.860600>}
box{<0,0,-0.050800><0.794303,0.036000,0.050800> rotate<0,-33.687844,0> translate<67.502800,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.255100,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.814500,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<68.814500,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.814500,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.594200,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<68.594200,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.594200,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.594200,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<68.594200,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.594200,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.814500,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<68.594200,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.814500,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.255100,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<68.814500,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.255100,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.475400,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<69.255100,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.475400,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.475400,0.000000,13.420000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<69.475400,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.475400,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.594200,0.000000,13.420000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<68.594200,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.903900,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.903900,0.000000,13.860600>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<69.903900,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.903900,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.564800,0.000000,13.860600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<69.903900,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.564800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.785100,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<70.564800,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.785100,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.785100,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<70.785100,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.523300,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.404500,0.000000,14.301300>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,-56.308217,0> translate<72.523300,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.142700,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.142700,0.000000,14.301300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<75.142700,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.142700,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.583300,0.000000,13.860600>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,45.003531,0> translate<75.142700,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.583300,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.023900,0.000000,14.301300>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-45.003531,0> translate<75.583300,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.023900,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.023900,0.000000,12.979400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.023900,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.672700,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.113300,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<76.672700,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.113300,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.333600,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<77.113300,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.333600,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.333600,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<77.333600,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.333600,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.672700,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<76.672700,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.672700,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.452400,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<76.452400,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.452400,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.672700,0.000000,13.420000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<76.452400,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.672700,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.333600,0.000000,13.420000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<76.672700,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.762100,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.762100,0.000000,14.301300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<77.762100,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.423000,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.762100,0.000000,13.420000>}
box{<0,0,-0.050800><0.794303,0.036000,0.050800> rotate<0,33.687844,0> translate<77.762100,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.762100,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.423000,0.000000,13.860600>}
box{<0,0,-0.050800><0.794303,0.036000,0.050800> rotate<0,-33.687844,0> translate<77.762100,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.514400,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.073800,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<79.073800,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.073800,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.853500,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<78.853500,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.853500,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.853500,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<78.853500,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.853500,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.073800,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<78.853500,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.073800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.514400,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<79.073800,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.514400,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.734700,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<79.514400,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.734700,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.734700,0.000000,13.420000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.734700,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.734700,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.853500,0.000000,13.420000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<78.853500,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.163200,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.163200,0.000000,13.860600>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<80.163200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.163200,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.603800,0.000000,13.860600>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<80.163200,0.000000,13.420000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.603800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.824100,0.000000,13.860600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<80.603800,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.254600,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.254600,0.000000,14.301300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<81.254600,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.254600,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,14.301300>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<81.254600,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,14.301300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,14.081000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<81.915500,0.000000,14.301300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,14.081000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.860600>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<82.135800,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<81.915500,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.420000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<81.915500,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.199700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<82.135800,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.135800,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<81.915500,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.254600,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<81.254600,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.254600,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.915500,0.000000,13.640300>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<81.254600,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.784600,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.225200,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<82.784600,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.225200,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.445500,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<83.225200,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.445500,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.445500,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<83.445500,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.445500,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.225200,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<83.225200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.225200,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.784600,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<82.784600,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.784600,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.564300,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<82.564300,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.564300,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.564300,0.000000,13.199700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<82.564300,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.564300,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.784600,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<82.564300,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.094300,0.000000,14.081000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.094300,0.000000,13.199700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<84.094300,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.094300,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.314600,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<84.094300,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.874000,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.314600,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<83.874000,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.747100,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.747100,0.000000,13.199700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,90.000000,0> translate<84.747100,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.747100,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.967400,0.000000,13.199700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<84.747100,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.967400,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.967400,0.000000,12.979400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<84.967400,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.967400,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.747100,0.000000,12.979400>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<84.747100,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283100,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622200,0.000000,13.860600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<85.622200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622200,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.401900,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<85.401900,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.401900,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.401900,0.000000,13.199700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<85.401900,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.401900,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622200,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<85.401900,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.622200,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.283100,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<85.622200,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.931900,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.372500,0.000000,12.979400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<86.931900,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.372500,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.592800,0.000000,13.199700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<87.372500,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.592800,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.592800,0.000000,13.640300>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<87.592800,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.592800,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.372500,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<87.372500,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.372500,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.931900,0.000000,13.860600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<86.931900,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.931900,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.711600,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<86.711600,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.711600,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.711600,0.000000,13.199700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<86.711600,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.711600,0.000000,13.199700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.931900,0.000000,12.979400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<86.711600,0.000000,13.199700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021300,0.000000,12.979400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021300,0.000000,13.860600>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<88.021300,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.021300,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.241600,0.000000,13.860600>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<88.021300,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.241600,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.461900,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<88.241600,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.461900,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.461900,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.461900,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.461900,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682200,0.000000,13.860600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<88.461900,0.000000,13.640300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.682200,0.000000,13.860600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902500,0.000000,13.640300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<88.682200,0.000000,13.860600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902500,0.000000,13.640300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.902500,0.000000,12.979400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.902500,0.000000,12.979400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.206200,0.000000,47.423100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.206200,0.000000,45.796200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.206200,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.206200,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.748500,0.000000,46.338500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.206200,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.748500,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.290800,0.000000,45.796200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<24.748500,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.290800,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.290800,0.000000,47.423100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<25.290800,0.000000,47.423100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.114400,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.656700,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<26.114400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.656700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.927900,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<26.656700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.927900,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.927900,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.927900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.927900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.114400,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<26.114400,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.114400,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.843300,0.000000,46.067300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<25.843300,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.843300,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.114400,0.000000,46.338500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<25.843300,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.114400,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.927900,0.000000,46.338500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<26.114400,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.480400,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.480400,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<27.480400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.480400,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.022700,0.000000,46.880800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.480400,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.022700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.293800,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<28.022700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.844600,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.844600,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<28.844600,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.844600,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.658000,0.000000,46.880800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.844600,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.658000,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929200,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<29.658000,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929200,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.929200,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.929200,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.481700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.752800,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<30.481700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.752800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.752800,0.000000,45.796200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.752800,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.481700,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.024000,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<30.481700,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.752800,0.000000,47.694300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.752800,0.000000,47.423100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.752800,0.000000,47.423100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.573100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.573100,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<31.573100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.573100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.386500,0.000000,46.880800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<31.573100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.386500,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.657700,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<32.386500,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.657700,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.657700,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.657700,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.752500,0.000000,45.253900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.023600,0.000000,45.253900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<33.752500,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.023600,0.000000,45.253900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.294800,0.000000,45.525100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.023600,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.294800,0.000000,45.525100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.294800,0.000000,46.880800>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,90.000000,0> translate<34.294800,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.294800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.481300,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<33.481300,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.481300,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.210200,0.000000,46.609600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<33.210200,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.210200,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.210200,0.000000,46.067300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.210200,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.210200,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.481300,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<33.210200,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.481300,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.294800,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<33.481300,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.847300,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.609600>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.118400,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.609600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.847300,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.880800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<34.847300,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.067300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.847300,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,45.796200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.118400,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.118400,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,45.796200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.847300,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.847300,0.000000,46.067300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<34.847300,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.845200,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.845200,0.000000,47.423100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<37.845200,0.000000,47.423100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.302900,0.000000,47.423100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.387500,0.000000,47.423100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<37.302900,0.000000,47.423100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.940000,0.000000,47.423100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.940000,0.000000,45.796200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.940000,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.940000,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.211100,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<38.940000,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.211100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.753400,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.211100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.753400,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.024600,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<39.753400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.024600,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.024600,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.024600,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.577100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.848200,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<40.577100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.848200,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.848200,0.000000,45.796200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.848200,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.577100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.119400,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<40.577100,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.848200,0.000000,47.694300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.848200,0.000000,47.423100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.848200,0.000000,47.423100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.668500,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.481900,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<41.668500,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.481900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.753100,0.000000,46.067300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<42.481900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.753100,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.481900,0.000000,46.338500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<42.481900,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.481900,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.939600,0.000000,46.338500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<41.939600,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.939600,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.668500,0.000000,46.609600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<41.668500,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.668500,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.939600,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<41.668500,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.939600,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.753100,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<41.939600,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.942700,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.756100,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<44.942700,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.756100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.027300,0.000000,46.067300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<45.756100,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.027300,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.756100,0.000000,46.338500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<45.756100,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.756100,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.213800,0.000000,46.338500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<45.213800,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.213800,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.942700,0.000000,46.609600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<44.942700,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.942700,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.213800,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<44.942700,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.213800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.027300,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<45.213800,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.579800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.579800,0.000000,46.067300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.579800,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.579800,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.850900,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<46.579800,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.850900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.664400,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<46.850900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.664400,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.664400,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<47.664400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.216900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.216900,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<48.216900,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.216900,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.759200,0.000000,46.880800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.216900,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.759200,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.030300,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<48.759200,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.852200,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.852200,0.000000,47.152000>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,90.000000,0> translate<49.852200,0.000000,47.152000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.852200,0.000000,47.152000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.123400,0.000000,47.423100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<49.852200,0.000000,47.152000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.581100,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.123400,0.000000,46.609600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<49.581100,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.943600,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.485900,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<50.943600,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.485900,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.757100,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<51.485900,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.757100,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.757100,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.757100,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.757100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.943600,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<50.943600,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.943600,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672500,0.000000,46.067300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<50.672500,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672500,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.943600,0.000000,46.338500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<50.672500,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.943600,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.757100,0.000000,46.338500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<50.943600,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.394200,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.580700,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<52.580700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.580700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.309600,0.000000,46.609600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<52.309600,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.309600,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.309600,0.000000,46.067300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.309600,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.309600,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.580700,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<52.309600,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.580700,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.394200,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<52.580700,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.760100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.217800,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.217800,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.217800,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.946700,0.000000,46.067300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<53.946700,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.946700,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.946700,0.000000,46.609600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<53.946700,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.946700,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.217800,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<53.946700,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.217800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.760100,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.217800,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.760100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.031300,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<54.760100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.031300,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.031300,0.000000,46.338500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.031300,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.031300,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.946700,0.000000,46.338500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<53.946700,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.763200,0.000000,45.253900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.034300,0.000000,45.253900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<57.763200,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.034300,0.000000,45.253900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.305500,0.000000,45.525100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.034300,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.305500,0.000000,45.525100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.305500,0.000000,46.880800>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,90.000000,0> translate<58.305500,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.305500,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.492000,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<57.492000,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.492000,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.220900,0.000000,46.609600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<57.220900,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.220900,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.220900,0.000000,46.067300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.220900,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.220900,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.492000,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<57.220900,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.492000,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.305500,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<57.492000,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.671400,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.129100,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.129100,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.129100,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.858000,0.000000,46.067300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<58.858000,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.858000,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.858000,0.000000,46.609600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<58.858000,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.858000,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.129100,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<58.858000,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.129100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.671400,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.129100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.671400,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.942600,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<59.671400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.942600,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.942600,0.000000,46.338500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.942600,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.942600,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.858000,0.000000,46.338500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<58.858000,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.766200,0.000000,47.152000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.766200,0.000000,46.067300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.766200,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.766200,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.037400,0.000000,45.796200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<60.766200,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.495100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.037400,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.495100,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.586500,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.399900,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<61.586500,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.399900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.671100,0.000000,46.067300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<62.399900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.671100,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.399900,0.000000,46.338500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<62.399900,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.399900,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.857600,0.000000,46.338500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<61.857600,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.857600,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.586500,0.000000,46.609600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<61.586500,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.586500,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.857600,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<61.586500,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.857600,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.671100,0.000000,46.880800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<61.857600,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.860700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.403000,0.000000,45.796200>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,63.430762,0> translate<64.860700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.403000,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.945300,0.000000,46.880800>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,-63.430762,0> translate<65.403000,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.311200,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.768900,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<66.768900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.768900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.497800,0.000000,46.067300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<66.497800,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.497800,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.497800,0.000000,46.609600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<66.497800,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.497800,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.768900,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<66.497800,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.768900,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.311200,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<66.768900,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.311200,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.582400,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<67.311200,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.582400,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.582400,0.000000,46.338500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.582400,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.582400,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.497800,0.000000,46.338500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<66.497800,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.134900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.134900,0.000000,46.880800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<68.134900,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.134900,0.000000,46.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.677200,0.000000,46.880800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.134900,0.000000,46.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.677200,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.948300,0.000000,46.880800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<68.677200,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.499100,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.499100,0.000000,46.067300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.499100,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.499100,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.770200,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<69.499100,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.770200,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.583700,0.000000,45.796200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<69.770200,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.583700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.583700,0.000000,45.525100>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.583700,0.000000,45.525100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.583700,0.000000,45.525100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.312500,0.000000,45.253900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.312500,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.312500,0.000000,45.253900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.041400,0.000000,45.253900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<70.041400,0.000000,45.253900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.773300,0.000000,47.423100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.773300,0.000000,45.796200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.773300,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.773300,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.044400,0.000000,46.880800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<72.773300,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.044400,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.586700,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<73.044400,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.586700,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.857900,0.000000,46.609600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<73.586700,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.857900,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.857900,0.000000,45.796200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.857900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.681500,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.223800,0.000000,45.796200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<74.681500,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.223800,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,46.067300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<75.223800,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,46.609600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<75.495000,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.495000,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.223800,0.000000,46.880800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<75.223800,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.223800,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.681500,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<74.681500,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.681500,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.410400,0.000000,46.609600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<74.410400,0.000000,46.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.410400,0.000000,46.609600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.410400,0.000000,46.067300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.410400,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.410400,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.681500,0.000000,45.796200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<74.410400,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.318600,0.000000,47.152000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.318600,0.000000,46.067300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.318600,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.318600,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.589800,0.000000,45.796200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<76.318600,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.047500,0.000000,46.880800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.589800,0.000000,46.880800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<76.047500,0.000000,46.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.138900,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.138900,0.000000,46.067300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<77.138900,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.138900,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.410000,0.000000,46.067300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<77.138900,0.000000,46.067300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.410000,0.000000,46.067300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.410000,0.000000,45.796200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.410000,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.410000,0.000000,45.796200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.138900,0.000000,45.796200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<77.138900,0.000000,45.796200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016200,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016200,0.000000,41.986200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016200,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829600,0.000000,41.986200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016200,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.100800,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<28.829600,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.100800,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.100800,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<29.100800,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.100800,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829600,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<28.829600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016200,0.000000,43.613100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.466700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.924400,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<29.924400,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.924400,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.653300,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.653300,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.653300,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.653300,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.653300,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.653300,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.924400,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.653300,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.924400,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.466700,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<29.924400,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.466700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.737900,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<30.466700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.737900,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.737900,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<30.737900,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.737900,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.466700,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<30.466700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.927500,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.927500,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<32.927500,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.927500,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.012100,0.000000,41.986200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<32.927500,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.012100,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.012100,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<34.012100,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.378000,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835700,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.835700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.564600,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.564600,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.564600,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.564600,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.564600,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.564600,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835700,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<34.564600,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.378000,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.835700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.378000,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.649200,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<35.378000,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.649200,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.649200,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<35.649200,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.649200,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.378000,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<35.378000,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.744000,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.744000,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<36.744000,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.201700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.286300,0.000000,43.613100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<36.201700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.018200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.018200,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<40.018200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.475900,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.560500,0.000000,43.613100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<39.475900,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.926400,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.384100,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<41.384100,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.384100,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.113000,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.113000,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.113000,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.113000,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.113000,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.113000,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.384100,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<41.113000,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.384100,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.926400,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<41.384100,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.926400,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.197600,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<41.926400,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.197600,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.197600,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<42.197600,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.197600,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.926400,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<41.926400,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750100,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750100,0.000000,42.257300>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.750100,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.750100,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.021200,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<42.750100,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.021200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.563500,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<43.021200,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.563500,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.834700,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<43.563500,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.834700,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.834700,0.000000,43.613100>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,90.000000,0> translate<43.834700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.471800,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<45.200600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.658300,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<44.658300,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.658300,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.387200,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.387200,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.387200,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.387200,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.387200,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.387200,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.658300,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<44.387200,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.658300,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<44.658300,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.471800,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<45.200600,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024300,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024300,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<46.024300,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.024300,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.108900,0.000000,42.799600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<46.024300,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.108900,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.108900,0.000000,41.986200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.108900,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.298500,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.298500,0.000000,41.986200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.298500,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.298500,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.111900,0.000000,41.986200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<49.298500,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.111900,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.383100,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<50.111900,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.383100,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.383100,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<50.383100,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.383100,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.111900,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<50.111900,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.111900,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.298500,0.000000,43.613100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<49.298500,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.935600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.935600,0.000000,42.257300>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.935600,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.935600,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206700,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<50.935600,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.206700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.749000,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<51.206700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.749000,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.020200,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<51.749000,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.020200,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.020200,0.000000,43.613100>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,90.000000,0> translate<52.020200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.572700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.572700,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<52.572700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.572700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386100,0.000000,43.613100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<52.572700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386100,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.657300,0.000000,43.342000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<53.386100,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.657300,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.657300,0.000000,42.799600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.657300,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.657300,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386100,0.000000,42.528500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<53.386100,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386100,0.000000,42.528500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.572700,0.000000,42.528500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<52.572700,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.115000,0.000000,42.528500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.657300,0.000000,41.986200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<53.115000,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.209800,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.752100,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.209800,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.480900,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.480900,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<54.480900,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.209800,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.752100,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.209800,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.301200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.301200,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<55.301200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.301200,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.385800,0.000000,41.986200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<55.301200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.385800,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.385800,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<56.385800,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.022900,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.751700,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<57.751700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.751700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.209400,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<57.209400,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.209400,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.938300,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.938300,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.938300,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.938300,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.938300,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.938300,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.209400,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<56.938300,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.209400,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.751700,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<57.209400,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.751700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.022900,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<57.751700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.022900,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.022900,0.000000,42.799600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<58.022900,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.022900,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.480600,0.000000,42.799600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<57.480600,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.025900,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483600,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.483600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.212500,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.212500,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.212500,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.212500,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.212500,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.212500,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483600,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<60.212500,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.025900,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.483600,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.025900,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.297100,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<61.025900,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.297100,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.297100,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<61.297100,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.297100,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.025900,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<61.025900,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849600,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<61.849600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.663000,0.000000,43.613100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.663000,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.934200,0.000000,43.342000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<62.663000,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.934200,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.934200,0.000000,42.799600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.934200,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.934200,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.663000,0.000000,42.528500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<62.663000,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.663000,0.000000,42.528500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849600,0.000000,42.528500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<61.849600,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.571300,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.486700,0.000000,43.613100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<63.486700,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.486700,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.486700,0.000000,41.986200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.486700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.486700,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.571300,0.000000,41.986200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<63.486700,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.486700,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.029000,0.000000,42.799600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<63.486700,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.123800,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.123800,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<65.123800,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.123800,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.937200,0.000000,43.613100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<65.123800,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.937200,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.208400,0.000000,43.342000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<65.937200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.208400,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.208400,0.000000,42.799600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.208400,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.208400,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.937200,0.000000,42.528500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<65.937200,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.937200,0.000000,42.528500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.123800,0.000000,42.528500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<65.123800,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.666100,0.000000,42.528500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.208400,0.000000,41.986200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<65.666100,0.000000,42.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.760900,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.760900,0.000000,43.070800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<66.760900,0.000000,43.070800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.760900,0.000000,43.070800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.303200,0.000000,43.613100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.760900,0.000000,43.070800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.303200,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.845500,0.000000,43.070800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<67.303200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.845500,0.000000,43.070800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.845500,0.000000,41.986200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.845500,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.760900,0.000000,42.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.845500,0.000000,42.799600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<66.760900,0.000000,42.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.940300,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.940300,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<68.940300,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.398000,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.482600,0.000000,43.613100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<68.398000,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.035100,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.577400,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<70.035100,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.306200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.306200,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<70.306200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.035100,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.577400,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<70.035100,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.939900,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.397600,0.000000,43.613100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<71.397600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.397600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.126500,0.000000,43.342000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.126500,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.126500,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.126500,0.000000,42.257300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.126500,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.126500,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.397600,0.000000,41.986200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<71.126500,0.000000,42.257300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.397600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.939900,0.000000,41.986200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<71.397600,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.939900,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.211100,0.000000,42.257300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<71.939900,0.000000,41.986200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.211100,0.000000,42.257300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.211100,0.000000,43.342000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<72.211100,0.000000,43.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.211100,0.000000,43.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.939900,0.000000,43.613100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<71.939900,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.763600,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.763600,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<72.763600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.763600,0.000000,43.613100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.848200,0.000000,41.986200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<72.763600,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.848200,0.000000,41.986200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.848200,0.000000,43.613100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<73.848200,0.000000,43.613100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.097100,0.000000,91.499900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.940400,0.000000,91.656700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<27.940400,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.940400,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.626800,0.000000,91.656700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.626800,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.626800,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.470100,0.000000,91.499900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<27.470100,0.000000,91.499900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.470100,0.000000,91.499900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.470100,0.000000,90.872800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.470100,0.000000,90.872800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.470100,0.000000,90.872800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.626800,0.000000,90.716100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<27.470100,0.000000,90.872800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.626800,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.940400,0.000000,90.716100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<27.626800,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.940400,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.097100,0.000000,90.872800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.940400,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.097100,0.000000,90.872800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.097100,0.000000,91.186400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.097100,0.000000,91.186400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.097100,0.000000,91.186400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.783600,0.000000,91.186400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<27.783600,0.000000,91.186400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.405600,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.405600,0.000000,91.656700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.405600,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.405600,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.032600,0.000000,90.716100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,56.309028,0> translate<28.405600,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.032600,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.032600,0.000000,91.656700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.032600,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.341100,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.341100,0.000000,90.716100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.341100,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.341100,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.811400,0.000000,90.716100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.341100,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.811400,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.968100,0.000000,90.872800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.811400,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.968100,0.000000,90.872800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.968100,0.000000,91.499900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<29.968100,0.000000,91.499900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.968100,0.000000,91.499900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.811400,0.000000,91.656700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<29.811400,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.811400,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.341100,0.000000,91.656700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.341100,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.161100,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.534100,0.000000,91.656700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<31.534100,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.534100,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.534100,0.000000,91.186400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.534100,0.000000,91.186400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.534100,0.000000,91.186400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.847600,0.000000,91.343100>}
box{<0,0,-0.038100><0.350481,0.036000,0.038100> rotate<0,-26.555988,0> translate<31.534100,0.000000,91.186400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.847600,0.000000,91.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.004400,0.000000,91.343100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.847600,0.000000,91.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.004400,0.000000,91.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.161100,0.000000,91.186400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<32.004400,0.000000,91.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.161100,0.000000,91.186400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.161100,0.000000,90.872800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.161100,0.000000,90.872800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.161100,0.000000,90.872800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.004400,0.000000,90.716100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.004400,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.004400,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.690800,0.000000,90.716100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.690800,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.690800,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.534100,0.000000,90.872800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.534100,0.000000,90.872800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.469600,0.000000,91.656700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.469600,0.000000,91.029600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.469600,0.000000,91.029600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.469600,0.000000,91.029600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.783100,0.000000,90.716100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<32.469600,0.000000,91.029600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.783100,0.000000,90.716100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.096600,0.000000,91.029600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.783100,0.000000,90.716100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.096600,0.000000,91.029600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.096600,0.000000,91.656700>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<33.096600,0.000000,91.656700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.463100,0.000000,91.753900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,91.910700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.306400,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,91.910700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,91.910700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.992800,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,91.910700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.836100,0.000000,91.753900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.836100,0.000000,91.753900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.836100,0.000000,91.753900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.836100,0.000000,91.597100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.836100,0.000000,91.597100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.836100,0.000000,91.597100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,91.440400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.836100,0.000000,91.597100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,91.440400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,91.440400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.992800,0.000000,91.440400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,91.440400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.463100,0.000000,91.283600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.306400,0.000000,91.440400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.463100,0.000000,91.283600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.463100,0.000000,91.126800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.463100,0.000000,91.126800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.463100,0.000000,91.126800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,90.970100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.306400,0.000000,90.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.306400,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,90.970100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.992800,0.000000,90.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.992800,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.836100,0.000000,91.126800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.836100,0.000000,91.126800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.771600,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.085100,0.000000,90.970100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<35.771600,0.000000,90.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.928300,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.928300,0.000000,91.910700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.928300,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.771600,0.000000,91.910700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.085100,0.000000,91.910700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<35.771600,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.022200,0.000000,91.753900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.865500,0.000000,91.910700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<36.865500,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.865500,0.000000,91.910700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.551900,0.000000,91.910700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.551900,0.000000,91.910700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.551900,0.000000,91.910700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.395200,0.000000,91.753900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<36.395200,0.000000,91.753900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.395200,0.000000,91.753900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.395200,0.000000,91.126800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.395200,0.000000,91.126800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.395200,0.000000,91.126800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.551900,0.000000,90.970100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.395200,0.000000,91.126800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.551900,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.865500,0.000000,90.970100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<36.551900,0.000000,90.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.865500,0.000000,90.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.022200,0.000000,91.126800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.865500,0.000000,90.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.022200,0.000000,91.126800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.022200,0.000000,91.440400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.022200,0.000000,91.440400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.022200,0.000000,91.440400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.708700,0.000000,91.440400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.708700,0.000000,91.440400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.258800,0.000000,91.135700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.140000,0.000000,91.135700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<13.258800,0.000000,91.135700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.699400,0.000000,91.576400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.699400,0.000000,90.695100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.699400,0.000000,90.695100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702800,0.000000,91.135700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.584000,0.000000,91.135700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.702800,0.000000,91.135700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.950800,0.000000,91.135700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<89.832000,0.000000,91.135700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<88.950800,0.000000,91.135700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<89.391400,0.000000,91.576400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<89.391400,0.000000,90.695100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<89.391400,0.000000,90.695100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<85.140800,0.000000,91.389700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.022000,0.000000,91.389700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<85.140800,0.000000,91.389700> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<90.170000,0.000000,90.170000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<90.170000,0.000000,10.160000>}
box{<0,0,-0.304800><80.010000,0.036000,0.304800> rotate<0,-90.000000,0> translate<90.170000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<90.170000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,10.160000>}
box{<0,0,-0.304800><80.010000,0.036000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,90.170000>}
box{<0,0,-0.304800><80.010000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,0.000000,90.170000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,90.170000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<90.170000,0.000000,90.170000>}
box{<0,0,-0.304800><80.010000,0.036000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,90.170000> }
cylinder{<0,0,0><0,0.036000,0>0.444500 translate<49.530000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.444500 translate<50.800000,0.000000,49.530000>}
box{<0,0,-0.444500><1.796051,0.036000,0.444500> rotate<0,44.997030,0> translate<49.530000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.444500 translate<50.800000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.444500 translate<49.530000,0.000000,49.530000>}
box{<0,0,-0.444500><1.796051,0.036000,0.444500> rotate<0,-44.997030,0> translate<49.530000,0.000000,49.530000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.955000,-1.536000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.955000,-1.536000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<74.955000,-1.536000,95.707000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.381000,-1.536000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.381000,-1.536000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<73.381000,-1.536000,95.707000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<74.167000,-1.536000,93.415300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<74.168900,-1.536000,96.068700>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.851000,0.000000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.851000,0.000000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<23.851000,0.000000,95.707000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.425000,0.000000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.425000,0.000000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.425000,0.000000,95.707000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<24.638800,0.000000,93.415300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<24.637100,0.000000,96.068700>}
//GND silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.189600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.526400,-1.536000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<69.189600,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.526400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.526400,-1.536000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.526400,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.526400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.189600,-1.536000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<69.189600,-1.536000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.189600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.189600,-1.536000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.189600,-1.536000,92.202000> }
//GND1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.870400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.533600,0.000000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.533600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.533600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.533600,0.000000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.533600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.533600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.870400,0.000000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<27.533600,0.000000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.870400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.870400,0.000000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.870400,0.000000,92.202000> }
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,86.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,88.630000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,88.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,86.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,88.630000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,88.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,86.930000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,87.630000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,87.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,87.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,88.330000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,88.330000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,87.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,87.030000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,87.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,87.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,88.230000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,88.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,88.230000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,87.630000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,88.230000> }
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,77.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,79.740000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,79.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,77.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,79.740000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,79.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,78.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,78.740000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,79.440000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,79.440000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,78.140000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,78.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,78.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,79.340000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,79.340000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,79.340000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,78.740000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,79.340000> }
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,68.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,70.850000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,70.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,68.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,70.850000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,70.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,69.150000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,69.850000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,70.550000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,70.550000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,69.250000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,69.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,69.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,70.450000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,70.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,70.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,69.850000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,70.450000> }
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,59.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,61.960000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,61.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,59.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,61.960000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,61.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,60.260000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,60.960000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,61.660000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,61.660000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,60.360000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,60.360000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,60.360000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,61.560000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,61.560000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,61.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,60.960000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,61.560000> }
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,40.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,42.910000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,42.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,40.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,42.910000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,42.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,41.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,41.910000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,42.610000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,42.610000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,41.310000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,41.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,41.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,42.510000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,42.510000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,42.510000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,41.910000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,42.510000> }
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,14.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,16.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,16.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,14.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,16.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,16.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,14.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,15.240000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,15.940000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,15.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,14.640000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,14.640000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,14.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,15.840000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,15.840000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,15.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,15.240000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,15.840000> }
//LED7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<76.851000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.851000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<78.851000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.851000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.851000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.851000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.851000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<78.851000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.151000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.851000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.151000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.851000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.551000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.851000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.851000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.251000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<77.251000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.251000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.451000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.251000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.451000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.851000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<77.851000,-1.536000,4.018000> }
//LED8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<67.961000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.961000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.961000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.961000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.961000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.961000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.961000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<69.961000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.261000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.261000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.661000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.961000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.361000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<68.361000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.361000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.561000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.361000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.561000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<68.961000,-1.536000,4.018000> }
//LED9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.071000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.071000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<61.071000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.071000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.071000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.071000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.071000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<61.071000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.371000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.071000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.371000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.071000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.771000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.071000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.071000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.471000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<59.471000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.471000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.671000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.471000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.671000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.071000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<60.071000,-1.536000,4.018000> }
//LED10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,77.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,75.200000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,75.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,77.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,75.200000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,75.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,76.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,76.200000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,76.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,76.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,75.500000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,75.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,76.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,76.800000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,76.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,76.800000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,75.600000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,75.600000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,75.600000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,76.200000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,76.200000> }
//LED11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,86.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,84.090000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,84.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,86.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,84.090000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,84.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,85.790000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,85.090000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,85.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,85.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,84.390000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,84.390000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,85.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,85.690000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,85.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,85.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,84.490000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,84.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,84.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,85.090000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,85.090000> }
//LED12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,68.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,66.310000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,66.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,68.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,66.310000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,66.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,68.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,67.310000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,67.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,66.610000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,66.610000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,67.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,67.910000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,67.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,66.710000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,66.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,66.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,67.310000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,67.310000> }
//LED13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,59.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,57.420000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,57.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,59.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,57.420000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,57.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,59.120000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,58.420000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,57.720000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,57.720000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,59.020000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,59.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,57.820000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,57.820000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,57.820000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,58.420000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,58.420000> }
//LED14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,40.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,38.370000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,38.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,40.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,38.370000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,38.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,40.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,39.370000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,38.670000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,38.670000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,39.970000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,39.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,38.770000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,38.770000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,38.770000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,39.370000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,39.370000> }
//LED15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,31.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,29.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,29.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,31.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,29.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,29.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,31.180000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,30.480000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,29.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,29.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,31.080000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,31.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,29.880000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,29.880000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,29.880000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,30.480000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,30.480000> }
//LED16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,22.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,20.590000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,20.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,22.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,20.590000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,20.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,22.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,21.590000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,20.890000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,20.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,22.190000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,22.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,20.990000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,20.990000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,20.990000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,21.590000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,21.590000> }
//LED17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,13.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,11.700000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.480000,-1.536000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,-1.536000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,-1.536000,11.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,-1.536000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,13.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,11.700000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.680000,-1.536000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,-1.536000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,-1.536000,11.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,-1.536000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,13.400000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,12.700000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,12.000000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.780000,-1.536000,12.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,13.300000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,13.300000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,12.100000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.380000,-1.536000,12.100000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,-1.536000,12.100000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,-1.536000,12.700000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,-1.536000,12.700000> }
//LED18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.621000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.621000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.621000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.621000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.621000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.621000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.621000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.621000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.921000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.921000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.321000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.621000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.021000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<15.021000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.021000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.221000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.021000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.221000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.621000,-1.536000,4.018000> }
//LED19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<23.511000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.511000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.511000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.511000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.511000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.511000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.511000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.511000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.811000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.511000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.811000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.511000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.211000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.511000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.511000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.911000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<23.911000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.911000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.111000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.911000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.111000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.511000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.511000,-1.536000,4.018000> }
//LED20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.401000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.401000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.401000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.401000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.401000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.401000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.401000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.401000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.701000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.701000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.101000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.401000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.801000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<32.801000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.801000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.001000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.801000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.001000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.401000,-1.536000,4.018000> }
//LED21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.291000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.291000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.291000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.291000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.291000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.291000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.291000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<43.291000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.591000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.591000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.991000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.291000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.691000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<41.691000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.691000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.891000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.691000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.891000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.291000,-1.536000,4.018000> }
//LED22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<50.181000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.181000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.181000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.181000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.181000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.181000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.181000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<52.181000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.481000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.181000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.481000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.181000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.881000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.181000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.181000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.581000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<50.581000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.581000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.781000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.581000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.781000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.181000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.181000,-1.536000,4.018000> }
//LED23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,5.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,6.718000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<85.741000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,6.718000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.741000,-1.536000,6.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,6.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,5.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.741000,-1.536000,5.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,3.318000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,1.918000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.741000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.741000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,1.918000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.741000,-1.536000,1.918000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,1.918000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.741000,-1.536000,3.318000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<87.741000,-1.536000,3.318000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.041000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.741000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.041000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.741000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.441000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.741000,-1.536000,4.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.741000,-1.536000,4.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.141000,-1.536000,4.618000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<86.141000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.141000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.341000,-1.536000,4.618000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.141000,-1.536000,4.618000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.341000,-1.536000,4.618000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.741000,-1.536000,4.018000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<86.741000,-1.536000,4.018000> }
//LED24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,23.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,25.130000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,25.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,23.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,25.130000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,25.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,23.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,24.130000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,24.830000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,24.830000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,23.530000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,23.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,23.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,24.730000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,24.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,24.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,24.130000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,24.730000> }
//LED25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,32.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,34.020000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<92.850000,-1.536000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,-1.536000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,-1.536000,34.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,-1.536000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,32.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,34.020000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<97.650000,-1.536000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,-1.536000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,-1.536000,34.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,-1.536000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,32.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,33.020000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,33.720000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<95.550000,-1.536000,33.720000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,32.420000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,-1.536000,32.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,32.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,33.620000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<94.950000,-1.536000,33.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,-1.536000,33.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,-1.536000,33.020000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,-1.536000,33.620000> }
//LED26 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,84.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,86.090000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,86.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,84.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,84.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,84.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,86.090000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,86.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,86.090000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,86.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,84.390000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,85.090000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,85.790000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,85.790000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,85.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,84.490000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,85.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,84.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,85.690000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,85.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,85.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,85.090000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,85.090000> }
//LED27 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,75.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,77.200000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,77.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,75.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,75.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,75.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,77.200000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,77.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,77.200000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,77.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,75.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,76.200000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,76.900000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,76.900000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,75.600000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,75.600000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,76.800000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,76.800000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,76.800000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,76.200000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,76.200000> }
//LED28 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,66.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,68.310000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,68.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,66.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,66.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,66.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,68.310000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,68.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,68.310000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,68.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,66.610000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,67.310000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,68.010000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,68.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,66.710000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,66.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,67.910000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,67.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,67.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,67.310000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,67.310000> }
//LED29 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,57.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,59.420000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,59.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,57.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,57.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,57.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,59.420000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,59.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,59.420000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,59.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,57.720000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,58.420000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,59.120000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,59.120000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,57.820000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,57.820000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,59.020000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,59.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,59.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,58.420000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,58.420000> }
//LED30 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,38.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,40.370000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,40.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,38.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,38.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,38.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,40.370000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,40.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,40.370000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,40.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,38.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,39.370000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,40.070000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,40.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,38.770000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,38.770000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,39.970000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,39.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,39.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,39.370000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,39.370000> }
//LED31 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,29.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,31.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,31.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,29.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,31.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,31.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,29.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,30.480000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,31.180000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,31.180000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,29.880000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,29.880000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,31.080000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,31.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,31.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,30.480000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,30.480000> }
//LED32 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,20.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,22.590000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,22.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,20.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,20.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,20.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,22.590000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,22.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,22.590000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,22.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,20.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,21.590000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,22.290000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,22.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,20.990000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,20.990000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,22.190000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,22.190000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,22.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,21.590000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,21.590000> }
//LED33 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,11.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,13.700000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.480000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.480000,0.000000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.080000,0.000000,13.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.080000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,11.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,11.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,11.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,13.700000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.680000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.680000,0.000000,13.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.080000,0.000000,13.700000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.680000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,12.700000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,13.400000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.780000,0.000000,13.400000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,12.100000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<4.780000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,12.100000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,13.300000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.380000,0.000000,13.300000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.380000,0.000000,13.300000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.780000,0.000000,12.700000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.780000,0.000000,12.700000> }
//LED34 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.240000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.240000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.240000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.240000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.240000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.240000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.240000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.240000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.940000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.240000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.540000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.540000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.840000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.240000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.840000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.640000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.640000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.640000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<14.640000,0.000000,5.380000> }
//LED35 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.130000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.130000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.130000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.130000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.130000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.130000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.130000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<23.130000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.830000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.130000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.430000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.430000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.730000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.130000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.730000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.530000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.530000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.530000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<23.530000,0.000000,5.380000> }
//LED36 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.020000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.020000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.020000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.020000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.020000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.020000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.020000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.720000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.020000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.320000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.320000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.620000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.020000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.620000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.420000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.420000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.420000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<32.420000,0.000000,5.380000> }
//LED37 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<42.910000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.910000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.910000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.910000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.910000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.910000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.910000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.910000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.610000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.910000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.910000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.910000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.210000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.210000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.910000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.510000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<41.910000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.510000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.310000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.310000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.310000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.910000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<41.310000,0.000000,5.380000> }
//LED38 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.800000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.800000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.800000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.800000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.800000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.800000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.800000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.500000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.800000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.800000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.800000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.100000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.100000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.800000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.400000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<50.800000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.400000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.200000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.200000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.200000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.800000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<50.200000,0.000000,5.380000> }
//LED39 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<60.690000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.690000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.690000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<60.690000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.690000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.690000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.690000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<58.690000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.390000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.690000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.990000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.990000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.290000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.690000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.290000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.090000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.090000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.090000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<59.090000,0.000000,5.380000> }
//LED40 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<69.580000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.580000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.580000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.580000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.580000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.580000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.580000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<67.580000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.280000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.580000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.580000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.580000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.880000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.880000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.580000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.180000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<68.580000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.180000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.980000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.980000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.980000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.580000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<67.980000,0.000000,5.380000> }
//LED41 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<78.470000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.470000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.470000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<78.470000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.470000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.470000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.470000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<76.470000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.170000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.470000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.470000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.470000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.770000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.770000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.470000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.070000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<77.470000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.070000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.870000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.870000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.870000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.470000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<76.870000,0.000000,5.380000> }
//LED42 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,6.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,7.480000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<87.360000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,7.480000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.360000,0.000000,7.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,7.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,6.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.360000,0.000000,6.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,4.080000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,2.680000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.360000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.360000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,2.680000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.360000,0.000000,2.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,2.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.360000,0.000000,4.080000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<85.360000,0.000000,4.080000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.060000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.360000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.360000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.360000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.660000,0.000000,4.780000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.660000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.360000,0.000000,4.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.960000,0.000000,5.380000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<86.360000,0.000000,4.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.960000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.760000,0.000000,5.380000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.760000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.760000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.360000,0.000000,4.780000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<85.760000,0.000000,5.380000> }
//LED43 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,16.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,14.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,14.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,16.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,14.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,14.240000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,15.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,15.240000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,14.540000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,14.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,15.840000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,15.840000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,15.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,14.640000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,14.640000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,14.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,15.240000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,14.640000> }
//LED44 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,25.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,23.130000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,23.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,25.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,25.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,25.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,23.130000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,23.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,23.130000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,23.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,24.830000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,24.130000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,23.430000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,23.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,24.730000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,24.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,24.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,23.530000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,23.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,23.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,24.130000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,23.530000> }
//LED45 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,34.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,32.020000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,32.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,34.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,34.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,34.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,32.020000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,32.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,32.020000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,32.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,33.720000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,33.020000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,32.320000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,32.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,33.620000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,33.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,33.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,32.420000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,32.420000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,32.420000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,33.020000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,32.420000> }
//LED46 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,42.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,40.910000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,40.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,42.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,42.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,42.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,40.910000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,40.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,40.910000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,40.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,42.610000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,41.910000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,41.210000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,41.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,42.510000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,42.510000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,42.510000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,41.310000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,41.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,41.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,41.910000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,41.310000> }
//LED47 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,61.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,59.960000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,59.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,61.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,61.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,61.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,59.960000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,59.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,59.960000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,59.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,61.660000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,60.960000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,60.260000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,60.260000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,61.560000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,61.560000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,61.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,60.360000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,60.360000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,60.360000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,60.960000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,60.360000> }
//LED48 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,70.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,68.850000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,68.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,70.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,70.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,70.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,68.850000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,68.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,68.850000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,68.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,70.550000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,69.850000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,69.150000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,69.150000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,70.450000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,70.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,70.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,69.250000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,69.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,69.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,69.850000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,69.250000> }
//LED49 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,79.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,77.740000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,77.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,79.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,79.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,79.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,77.740000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,77.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,77.740000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,77.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,79.440000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,78.740000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,78.040000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,78.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,79.340000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,79.340000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,79.340000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,78.140000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,78.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,78.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,78.740000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,78.140000> }
//LED50 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,88.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,86.630000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.850000,0.000000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.850000,0.000000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.250000,0.000000,86.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<92.850000,0.000000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,88.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,88.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,88.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,86.630000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<97.650000,0.000000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<97.650000,0.000000,86.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.250000,0.000000,86.630000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<96.250000,0.000000,86.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,88.330000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,87.630000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,87.630000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,86.930000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<95.550000,0.000000,86.930000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,87.630000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,88.230000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,44.997030,0> translate<94.950000,0.000000,88.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,88.230000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,87.030000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.950000,0.000000,87.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.950000,0.000000,87.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<95.550000,0.000000,87.630000>}
box{<0,0,-0.101600><0.848528,0.036000,0.101600> rotate<0,-44.997030,0> translate<94.950000,0.000000,87.030000> }
//PAD1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.335400,-1.536000,93.759000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.998600,-1.536000,93.759000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<84.998600,-1.536000,93.759000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.998600,-1.536000,99.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.998600,-1.536000,93.759000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<84.998600,-1.536000,93.759000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.998600,-1.536000,99.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.335400,-1.536000,99.347000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<84.998600,-1.536000,99.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.335400,-1.536000,93.759000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.335400,-1.536000,99.347000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.335400,-1.536000,99.347000> }
//PAD2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.542600,0.000000,93.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.879400,0.000000,93.251000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<12.542600,0.000000,93.251000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.879400,0.000000,98.839000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.879400,0.000000,93.251000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.879400,0.000000,93.251000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.879400,0.000000,98.839000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.542600,0.000000,98.839000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<12.542600,0.000000,98.839000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.542600,0.000000,93.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.542600,0.000000,98.839000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.542600,0.000000,98.839000> }
//PAD3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.543400,-1.536000,93.759000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.206600,-1.536000,93.759000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<88.206600,-1.536000,93.759000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.206600,-1.536000,99.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.206600,-1.536000,93.759000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<88.206600,-1.536000,93.759000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.206600,-1.536000,99.347000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.543400,-1.536000,99.347000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<88.206600,-1.536000,99.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.543400,-1.536000,93.759000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.543400,-1.536000,99.347000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.543400,-1.536000,99.347000> }
//PAD4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.146600,0.000000,93.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.483400,0.000000,93.251000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<9.146600,0.000000,93.251000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.483400,0.000000,98.839000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.483400,0.000000,93.251000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.483400,0.000000,93.251000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.483400,0.000000,98.839000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.146600,0.000000,98.839000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<9.146600,0.000000,98.839000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.146600,0.000000,93.251000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.146600,0.000000,98.839000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.146600,0.000000,98.839000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.305000,-1.536000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.305000,-1.536000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<81.305000,-1.536000,95.707000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.731000,-1.536000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.731000,-1.536000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<79.731000,-1.536000,95.707000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<80.517000,-1.536000,93.415300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<80.518900,-1.536000,96.068700>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.501000,0.000000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.501000,0.000000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<17.501000,0.000000,95.707000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.075000,0.000000,93.777000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.075000,0.000000,95.707000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<19.075000,0.000000,95.707000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<18.288800,0.000000,93.415300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<18.287100,0.000000,96.068700>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,85.877000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,85.877000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,85.877000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,84.303000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,84.303000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,84.303000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,85.089100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,85.090900>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,76.987000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,76.987000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,76.987000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,75.413000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,75.413000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,75.413000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,76.199100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,76.200900>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,68.097000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,68.097000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,68.097000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,66.523000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,66.523000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,66.523000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,67.309100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,67.310900>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,59.207000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,59.207000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,59.207000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,57.633000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,57.633000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,57.633000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,58.419100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,58.420900>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,40.157000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,40.157000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,40.157000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,38.583000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,38.583000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,38.583000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,39.369100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,39.370900>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,13.487000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,13.487000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,13.487000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,11.913000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,11.913000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,11.913000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,12.699100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,12.700900>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.098000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.098000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<76.098000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.524000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.524000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<74.524000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<75.310000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<75.311900,-1.536000,5.644700>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.208000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.208000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<67.208000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.634000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.634000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<65.634000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<66.420000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<66.421900,-1.536000,5.644700>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.318000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.318000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<58.318000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.744000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.744000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<56.744000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<57.530000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<57.531900,-1.536000,5.644700>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,77.953000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,77.953000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,77.953000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,79.527000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,79.527000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,79.527000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,78.740900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,78.739100>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,86.843000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,86.843000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,86.843000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,88.417000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,88.417000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,88.417000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,87.630900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,87.629100>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,69.063000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,69.063000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,69.063000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,70.637000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,70.637000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,70.637000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,69.850900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,69.849100>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,60.173000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,60.173000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,60.173000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,61.747000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,61.747000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,61.747000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,60.960900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,60.959100>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,41.123000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,41.123000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,41.123000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,42.697000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,42.697000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,42.697000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,41.910900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,41.909100>}
//R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,32.233000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,32.233000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,32.233000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,33.807000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,33.807000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,33.807000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,33.020900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,33.019100>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,23.343000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,23.343000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,23.343000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,24.917000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,24.917000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,24.917000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,24.130900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,24.129100>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,14.453000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,14.453000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,14.453000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,-1.536000,16.027000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,-1.536000,16.027000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,-1.536000,16.027000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,-1.536000,15.240900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,-1.536000,15.239100>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.868000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.868000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<13.868000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.294000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.294000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<12.294000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<13.080000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<13.081900,-1.536000,5.644700>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.758000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.758000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<22.758000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.184000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.184000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<21.184000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<21.970000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<21.971900,-1.536000,5.644700>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.648000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.648000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<31.648000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.074000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.074000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<30.074000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<30.860000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<30.861900,-1.536000,5.644700>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.538000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.538000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<40.538000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.964000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.964000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<38.964000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<39.750000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<39.751900,-1.536000,5.644700>}
//R25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.428000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.428000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<49.428000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.854000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.854000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<47.854000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<48.640000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<48.641900,-1.536000,5.644700>}
//R26 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.988000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.988000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<84.988000,-1.536000,5.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.414000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.414000,-1.536000,5.283000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<83.414000,-1.536000,5.283000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<84.200000,-1.536000,2.991300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<84.201900,-1.536000,5.644700>}
//R27 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,22.377000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,22.377000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,22.377000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,20.803000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,20.803000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,20.803000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,21.589100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,21.590900>}
//R28 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,31.267000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,31.267000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,31.267000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,-1.536000,29.693000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,-1.536000,29.693000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,-1.536000,29.693000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,-1.536000,30.479100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,-1.536000,30.480900>}
//R29 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.175000,-1.536000,95.707000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.175000,-1.536000,93.777000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<76.175000,-1.536000,93.777000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.749000,-1.536000,95.707000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.749000,-1.536000,93.777000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<77.749000,-1.536000,93.777000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<76.962800,-1.536000,96.068700>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<76.961100,-1.536000,93.415300>}
//R30 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.631000,0.000000,95.707000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.631000,0.000000,93.777000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.631000,0.000000,93.777000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.057000,0.000000,95.707000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.057000,0.000000,93.777000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.057000,0.000000,93.777000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<21.843000,0.000000,96.068700>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<21.844900,0.000000,93.415300>}
//R32 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,84.303000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,84.303000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,84.303000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,85.877000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,85.877000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,85.877000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,85.090900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,85.089100>}
//R33 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,75.413000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,75.413000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,75.413000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,76.987000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,76.987000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,76.987000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,76.200900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,76.199100>}
//R34 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,66.523000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,66.523000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,66.523000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,68.097000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,68.097000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,68.097000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,67.310900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,67.309100>}
//R35 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,57.633000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,57.633000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,57.633000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,59.207000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,59.207000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,59.207000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,58.420900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,58.419100>}
//R36 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,38.583000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,38.583000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,38.583000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,40.157000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,40.157000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,40.157000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,39.370900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,39.369100>}
//R37 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.033000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<83.033000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<83.033000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.607000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<84.607000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<84.607000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<83.820800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<83.819100,0.000000,6.406700>}
//R38 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.143000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.143000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<74.143000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.717000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.717000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<75.717000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<74.930800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<74.929100,0.000000,6.406700>}
//R39 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.253000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.253000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<65.253000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.827000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.827000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<66.827000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<66.040800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<66.039100,0.000000,6.406700>}
//R40 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.363000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.363000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<56.363000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.937000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.937000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<57.937000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<57.150800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<57.149100,0.000000,6.406700>}
//R41 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,79.527000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,79.527000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,79.527000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,77.953000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,77.953000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,77.953000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,78.739100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,78.740900>}
//R42 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,88.417000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,88.417000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,88.417000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,86.843000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,86.843000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,86.843000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,87.629100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,87.630900>}
//R43 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,70.637000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,70.637000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,70.637000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,69.063000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,69.063000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,69.063000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,69.849100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,69.850900>}
//R44 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,61.747000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,61.747000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,61.747000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,60.173000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,60.173000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,60.173000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,60.959100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,60.960900>}
//R45 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,42.697000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,42.697000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,42.697000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,41.123000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,41.123000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,41.123000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,41.909100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,41.910900>}
//R46 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,33.807000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,33.807000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,33.807000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,32.233000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,32.233000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,32.233000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,33.019100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,33.020900>}
//R47 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,24.917000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,24.917000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,24.917000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,23.343000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,23.343000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,23.343000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,24.129100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,24.130900>}
//R48 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,16.027000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,16.027000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,16.027000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.115000,0.000000,14.453000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.045000,0.000000,14.453000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.115000,0.000000,14.453000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<3.753200,0.000000,15.239100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<6.406700,0.000000,15.240900>}
//R49 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.913000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.913000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.913000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.487000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.487000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<13.487000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<12.700800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<12.699100,0.000000,6.406700>}
//R50 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.803000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.803000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<20.803000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.377000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.377000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<22.377000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<21.590800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<21.589100,0.000000,6.406700>}
//R51 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.693000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.693000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.693000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.267000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.267000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<31.267000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<30.480800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<30.479100,0.000000,6.406700>}
//R52 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.583000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.583000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<38.583000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.157000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.157000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<40.157000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<39.370800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<39.369100,0.000000,6.406700>}
//R53 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.473000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.473000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<47.473000,0.000000,6.045000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.047000,0.000000,4.115000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.047000,0.000000,6.045000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<49.047000,0.000000,6.045000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<48.260800,0.000000,3.753300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<48.259100,0.000000,6.406700>}
//R54 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,11.913000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,11.913000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,11.913000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,13.487000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,13.487000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,13.487000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,12.700900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,12.699100>}
//R55 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,20.803000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,20.803000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,20.803000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,22.377000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,22.377000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,22.377000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,21.590900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,21.589100>}
//R56 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,29.693000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,29.693000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,29.693000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<96.215000,0.000000,31.267000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<94.285000,0.000000,31.267000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<94.285000,0.000000,31.267000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<96.576600,0.000000,30.480900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<93.923300,0.000000,30.479100>}
//SIG silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.569600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.906400,-1.536000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<61.569600,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.906400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.906400,-1.536000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.906400,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.906400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.569600,-1.536000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<61.569600,-1.536000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.569600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.569600,-1.536000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.569600,-1.536000,92.202000> }
//SIG1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.982400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.645600,0.000000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<34.645600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.645600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.645600,0.000000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.645600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.645600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.982400,0.000000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<34.645600,0.000000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.982400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.982400,0.000000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.982400,0.000000,92.202000> }
//U$1 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<50.000000,0.000000,50.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<50.000000,0.000000,50.000000>}
difference{
cylinder{<50.000000,0,50.000000><50.000000,0.036000,50.000000>3.505200 translate<0,0.000000,0>}
cylinder{<50.000000,-0.1,50.000000><50.000000,0.135000,50.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<50.000000,0,50.000000><50.000000,0.036000,50.000000>0.990600 translate<0,0.000000,0>}
cylinder{<50.000000,-0.1,50.000000><50.000000,0.135000,50.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<50.000000,0,50.000000><50.000000,0.036000,50.000000>1.701600 translate<0,0.000000,0>}
cylinder{<50.000000,-0.1,50.000000><50.000000,0.135000,50.000000>1.498400 translate<0,0.000000,0>}}
//U$2 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<4.000000,0.000000,4.038100>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<4.000000,0.000000,4.038100>}
difference{
cylinder{<4.000000,0,4.038100><4.000000,0.036000,4.038100>3.505200 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.038100><4.000000,0.135000,4.038100>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,4.038100><4.000000,0.036000,4.038100>0.990600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.038100><4.000000,0.135000,4.038100>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,4.038100><4.000000,0.036000,4.038100>2.001600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.038100><4.000000,0.135000,4.038100>1.798400 translate<0,0.000000,0>}}
//U$3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<4.000000,0.000000,50.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<4.000000,0.000000,50.000000>}
difference{
cylinder{<4.000000,0,50.000000><4.000000,0.036000,50.000000>3.505200 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,50.000000><4.000000,0.135000,50.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,50.000000><4.000000,0.036000,50.000000>0.990600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,50.000000><4.000000,0.135000,50.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,50.000000><4.000000,0.036000,50.000000>2.001600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,50.000000><4.000000,0.135000,50.000000>1.798400 translate<0,0.000000,0>}}
//U$4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<4.000000,0.000000,95.962000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<4.000000,0.000000,95.962000>}
difference{
cylinder{<4.000000,0,95.962000><4.000000,0.036000,95.962000>3.505200 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,95.962000><4.000000,0.135000,95.962000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,95.962000><4.000000,0.036000,95.962000>0.990600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,95.962000><4.000000,0.135000,95.962000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,95.962000><4.000000,0.036000,95.962000>2.001600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,95.962000><4.000000,0.135000,95.962000>1.798400 translate<0,0.000000,0>}}
//U$5 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<96.000000,0.000000,95.962000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<96.000000,0.000000,95.962000>}
difference{
cylinder{<96.000000,0,95.962000><96.000000,0.036000,95.962000>3.505200 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,95.962000><96.000000,0.135000,95.962000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,95.962000><96.000000,0.036000,95.962000>0.990600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,95.962000><96.000000,0.135000,95.962000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,95.962000><96.000000,0.036000,95.962000>2.001600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,95.962000><96.000000,0.135000,95.962000>1.798400 translate<0,0.000000,0>}}
//U$6 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<96.000000,0.000000,50.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<96.000000,0.000000,50.000000>}
difference{
cylinder{<96.000000,0,50.000000><96.000000,0.036000,50.000000>3.505200 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,50.000000><96.000000,0.135000,50.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,50.000000><96.000000,0.036000,50.000000>0.990600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,50.000000><96.000000,0.135000,50.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,50.000000><96.000000,0.036000,50.000000>2.001600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,50.000000><96.000000,0.135000,50.000000>1.798400 translate<0,0.000000,0>}}
//U$7 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<96.000000,0.000000,4.038100>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<96.000000,0.000000,4.038100>}
difference{
cylinder{<96.000000,0,4.038100><96.000000,0.036000,4.038100>3.505200 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,4.038100><96.000000,0.135000,4.038100>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,4.038100><96.000000,0.036000,4.038100>0.990600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,4.038100><96.000000,0.135000,4.038100>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<96.000000,0,4.038100><96.000000,0.036000,4.038100>2.001600 translate<0,0.000000,0>}
cylinder{<96.000000,-0.1,4.038100><96.000000,0.135000,4.038100>1.798400 translate<0,0.000000,0>}}
//VCC silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.379600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.716400,-1.536000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<65.379600,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.716400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.716400,-1.536000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.716400,-1.536000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.716400,-1.536000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.379600,-1.536000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<65.379600,-1.536000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.379600,-1.536000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.379600,-1.536000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.379600,-1.536000,92.202000> }
//VCC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.426400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.089600,0.000000,97.790000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<31.089600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.089600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.089600,0.000000,97.790000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.089600,0.000000,97.790000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.089600,0.000000,92.202000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.426400,0.000000,92.202000>}
box{<0,0,-0.076200><2.336800,0.036000,0.076200> rotate<0,0.000000,0> translate<31.089600,0.000000,92.202000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.426400,0.000000,97.790000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.426400,0.000000,92.202000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.426400,0.000000,92.202000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  CUPCAKE_HEATER_BOARD(-50.000000,0,-50.000000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//GND	WIREPADSMD5-1,8	5-1,8
//GND1	WIREPADSMD5-1,8	5-1,8
//LED1		LED-1206
//LED2		LED-1206
//LED3		LED-1206
//LED4		LED-1206
//LED5		LED-1206
//LED6		LED-1206
//LED7		LED-1206
//LED8		LED-1206
//LED9		LED-1206
//LED10		LED-1206
//LED11		LED-1206
//LED12		LED-1206
//LED13		LED-1206
//LED14		LED-1206
//LED15		LED-1206
//LED16		LED-1206
//LED17		LED-1206
//LED18		LED-1206
//LED19		LED-1206
//LED20		LED-1206
//LED21		LED-1206
//LED22		LED-1206
//LED23		LED-1206
//LED24		LED-1206
//LED25		LED-1206
//LED26		LED-1206
//LED27		LED-1206
//LED28		LED-1206
//LED29		LED-1206
//LED30		LED-1206
//LED31		LED-1206
//LED32		LED-1206
//LED33		LED-1206
//LED34		LED-1206
//LED35		LED-1206
//LED36		LED-1206
//LED37		LED-1206
//LED38		LED-1206
//LED39		LED-1206
//LED40		LED-1206
//LED41		LED-1206
//LED42		LED-1206
//LED43		LED-1206
//LED44		LED-1206
//LED45		LED-1206
//LED46		LED-1206
//LED47		LED-1206
//LED48		LED-1206
//LED49		LED-1206
//LED50		LED-1206
//PAD1	WIREPADSMD5-1,8	5-1,8
//PAD2	WIREPADSMD5-1,8	5-1,8
//PAD3	WIREPADSMD5-1,8	5-1,8
//PAD4	WIREPADSMD5-1,8	5-1,8
//SIG	WIREPADSMD5-1,8	5-1,8
//SIG1	WIREPADSMD5-1,8	5-1,8
//U$1		3,0
//U$2		3,6
//U$3		3,6
//U$4		3,6
//U$5		3,6
//U$6		3,6
//U$7		3,6
//VCC	WIREPADSMD5-1,8	5-1,8
//VCC1	WIREPADSMD5-1,8	5-1,8
