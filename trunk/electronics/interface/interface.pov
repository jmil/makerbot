//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/interface/interface.brd
//3/1/10 5:54 PM

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
#local cam_y = 313;
#local cam_z = -167;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -7;
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

#local lgt1_pos_x = 34;
#local lgt1_pos_y = 51;
#local lgt1_pos_z = 38;
#local lgt1_intense = 0.794920;
#local lgt2_pos_x = -34;
#local lgt2_pos_y = 51;
#local lgt2_pos_z = 38;
#local lgt2_intense = 0.794920;
#local lgt3_pos_x = 34;
#local lgt3_pos_y = 51;
#local lgt3_pos_z = -26;
#local lgt3_intense = 0.794920;
#local lgt4_pos_x = -34;
#local lgt4_pos_y = 51;
#local lgt4_pos_z = -26;
#local lgt4_intense = 0.794920;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 91.000000;
#declare pcb_y_size = 73.015000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(400);
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
	//translate<-45.500000,0,-36.507500>
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


#macro INTERFACE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,-0.015000><91.000000,-0.015000>
<91.000000,-0.015000><91.000000,73.000000>
<91.000000,73.000000><0.000000,73.000000>
<0.000000,73.000000><0.000000,-0.015000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<4.000000,1,69.000000><4.000000,-5,69.000000>1.500000 texture{col_hls}}
cylinder{<4.000000,1,4.000000><4.000000,-5,4.000000>1.500000 texture{col_hls}}
cylinder{<87.000000,1,69.000000><87.000000,-5,69.000000>1.500000 texture{col_hls}}
cylinder{<87.000000,1,4.000000><87.000000,-5,4.000000>1.500000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_BAR) #declare global_pack_BAR=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.000000,0.000000,18.000000>}#end		//Diskrete 5MM LED BAR  LED5MM
#ifndef(pack_DEBUG) #declare global_pack_DEBUG=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.000000,0.000000,18.000000>}#end		//Diskrete 5MM LED DEBUG  LED5MM
#ifndef(pack_FOO) #declare global_pack_FOO=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.000000,0.000000,54.000000>}#end		//Diskrete 5MM LED FOO  LED5MM
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_1X16()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<62.230000,0.000000,5.715000>}#end		//Header 2,54mm Grid 16Pin 1Row (jumper.lib) JP1  1X16
#ifndef(pack_MOTHERBOARD) #declare global_pack_MOTHERBOARD=yes; object {CON_DIS_WS20G()translate<0,-0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<25.035000,-1.500000,7.270000>}#end		//Shrouded Header 20Pin MOTHERBOARD  ML20
#ifndef(pack_POWER) #declare global_pack_POWER=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<45.000000,0.000000,54.000000>}#end		//Diskrete 5MM LED POWER  LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<15.875000,0.000000,45.085000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R1 10K 1206
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_1206("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.005000,0.000000,53.975000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R2 1K 1206
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<80.645000,0.000000,64.135000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R3 10K 1206
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,22.225000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R4 10K 1206
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<62.865000,0.000000,45.720000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R5 10K 1206
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.050000,0.000000,45.085000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R6 10K 1206
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<81.915000,0.000000,45.085000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R7 10K 1206
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<45.085000,0.000000,45.720000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R8 10K 1206
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_1206("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.890000,0.000000,59.055000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R9 1K 1206
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.240000,0.000000,56.515000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R10 10K 1206
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_SMD_CHIP_1206("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.335000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R11 1K 1206
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_SMD_CHIP_1206("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<69.850000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R12 10K 1206
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_SMD_CHIP_1206("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<49.530000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R14 1K 1206
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<7.730000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_BAR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.270000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_CANCEL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<56.751600,0,38.489200> texture{col_thl}}
#ifndef(global_pack_CANCEL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<69.248400,0,38.489200> texture{col_thl}}
#ifndef(global_pack_CANCEL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<56.751600,0,33.510800> texture{col_thl}}
#ifndef(global_pack_CANCEL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<69.248400,0,33.510800> texture{col_thl}}
#ifndef(global_pack_DEBUG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<43.730000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_DEBUG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<46.270000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_FOO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<7.730000,0,54.000000> texture{col_thl}}
#ifndef(global_pack_FOO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.270000,0,54.000000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<60.960000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<66.040000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<68.580000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<71.120000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<73.660000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<76.200000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<78.740000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<81.280000,0,5.715000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.605000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.605000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.145000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.145000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<18.685000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<18.685000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.225000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.225000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<23.765000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<23.765000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.305000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.305000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<28.845000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<28.845000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.385000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.385000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.925000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.925000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.465000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_MOTHERBOARD) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.465000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_OK) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,38.489200> texture{col_thl}}
#ifndef(global_pack_OK) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,38.489200> texture{col_thl}}
#ifndef(global_pack_OK) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,33.510800> texture{col_thl}}
#ifndef(global_pack_OK) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,33.510800> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<43.730000,0,54.000000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<46.270000,0,54.000000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.875000,0.000000,43.685000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.875000,0.000000,46.485000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.005000,0.000000,52.575000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.005000,0.000000,55.375000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<80.645000,0.000000,62.735000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<80.645000,0.000000,65.535000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,20.825000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,23.625000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<62.865000,0.000000,44.320000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<62.865000,0.000000,47.120000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.050000,0.000000,43.685000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.050000,0.000000,46.485000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<83.315000,0.000000,45.085000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<80.515000,0.000000,45.085000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.085000,0.000000,44.320000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.085000,0.000000,47.120000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<7.490000,0.000000,59.055000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.290000,0.000000,59.055000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.640000,0.000000,56.515000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.840000,0.000000,56.515000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.335000,0.000000,16.380000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.335000,0.000000,19.180000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<69.850000,0.000000,19.180000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<69.850000,0.000000,16.380000>}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.460000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<65.540000,0,18.000000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<63.000000,0,20.540000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.530000,0.000000,16.380000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.530000,0.000000,19.180000>}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<38.751600,0,38.489200> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<51.248400,0,38.489200> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<38.751600,0,33.510800> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<51.248400,0,33.510800> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.751600,0,38.489200> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.248400,0,38.489200> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.751600,0,33.510800> texture{col_thl}}
#ifndef(global_pack_X_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.248400,0,33.510800> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,56.489200> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,56.489200> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,51.510800> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,51.510800> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,20.489200> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,20.489200> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,15.510800> texture{col_thl}}
#ifndef(global_pack_Y_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,15.510800> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,56.489200> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,56.489200> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,51.510800> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,51.510800> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,20.489200> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,20.489200> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<74.751600,0,15.510800> texture{col_thl}}
#ifndef(global_pack_Z_) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<87.248400,0,15.510800> texture{col_thl}}
#ifndef(global_pack_ZERO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,38.489200> texture{col_thl}}
#ifndef(global_pack_ZERO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,38.489200> texture{col_thl}}
#ifndef(global_pack_ZERO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.751600,0,33.510800> texture{col_thl}}
#ifndef(global_pack_ZERO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.803400,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<33.248400,0,33.510800> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<32.385000,0,24.511000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<52.197000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<18.923000,0,3.683000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<10.668000,0,3.683000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<34.671000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<36.830000,0,24.511000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<45.212000,0,19.431000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<60.325000,0,14.351000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<30.226000,0,10.033000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<33.020000,0,10.033000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<20.320000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<10.287000,0,34.798000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<25.654000,0,11.176000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<29.337000,0,11.176000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<35.941000,0,12.319000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<41.783000,0,12.827000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<43.815000,0,11.811000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<44.323000,0,9.144000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<41.783000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<10.795000,0,5.207000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<15.113000,0,0.762000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<23.241000,0,21.717000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<19.558000,0,11.557000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<40.894000,0,26.543000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<24.130000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<29.591000,0,14.986000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<35.941000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<52.197000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<54.483000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<54.483000,0,8.255000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<67.056000,0,15.875000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<13.843000,0,20.955000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<11.430000,0,24.638000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<11.430000,0,42.037000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<71.755000,0,24.257000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<71.755000,0,35.687000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<30.099000,0,2.286000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<41.148000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<42.037000,0,32.385000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<31.496000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<42.037000,0,10.287000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<67.945000,0,18.415000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<11.938000,0,6.477000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.751600,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.794000,0.000000,33.528000>}
box{<0,0,-0.254000><0.045756,0.035000,0.254000> rotate<0,-22.078988,0> translate<2.751600,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.751600,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.794000,0.000000,38.481000>}
box{<0,0,-0.254000><0.043186,0.035000,0.254000> rotate<0,10.944937,0> translate<2.751600,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,0.000000,22.479000>}
box{<0,0,-0.254000><14.478000,0.035000,0.254000> rotate<0,90.000000,0> translate<6.350000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,-1.535000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,-1.535000,30.861000>}
box{<0,0,-0.254000><13.462000,0.035000,0.254000> rotate<0,90.000000,0> translate<6.350000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.490000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.493000,0.000000,59.055000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,0.000000,0> translate<7.490000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.730000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,0.000000,18.034000>}
box{<0,0,-0.254000><0.038013,0.035000,0.254000> rotate<0,-63.430762,0> translate<7.730000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,0.000000,22.606000>}
box{<0,0,-0.254000><4.572000,0.035000,0.254000> rotate<0,90.000000,0> translate<7.747000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.730000,-1.535000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,-1.535000,53.975000>}
box{<0,0,-0.254000><0.030232,0.035000,0.254000> rotate<0,55.780616,0> translate<7.730000,-1.535000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,-1.535000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,15.367000>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,44.997030,0> translate<6.350000,-1.535000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,15.367000>}
box{<0,0,-0.254000><11.049000,0.035000,0.254000> rotate<0,90.000000,0> translate<8.382000,-1.535000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,-1.535000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,53.975000>}
box{<0,0,-0.254000><0.635000,0.035000,0.254000> rotate<0,0.000000,0> translate<7.747000,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.493000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.144000,0.000000,60.706000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.493000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.160000,-1.535000,2.540000>}
box{<0,0,-0.254000><2.514472,0.035000,0.254000> rotate<0,44.997030,0> translate<8.382000,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.270000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,18.034000>}
box{<0,0,-0.254000><0.038013,0.035000,0.254000> rotate<0,-63.430762,0> translate<10.270000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,-1.535000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,-1.535000,34.798000>}
box{<0,0,-0.254000><5.567759,0.035000,0.254000> rotate<0,-44.997030,0> translate<6.350000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.270000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,54.102000>}
box{<0,0,-0.254000><0.103407,0.035000,0.254000> rotate<0,-80.532363,0> translate<10.270000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,59.055000>}
box{<0,0,-0.254000><4.953000,0.035000,0.254000> rotate<0,90.000000,0> translate<10.287000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.290000,0.000000,59.055000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.287000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.541000,0.000000,26.670000>}
box{<0,0,-0.254000><5.926969,0.035000,0.254000> rotate<0,-44.997030,0> translate<6.350000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.668000,0.000000,3.683000>}
box{<0,0,-0.254000><6.106574,0.035000,0.254000> rotate<0,44.997030,0> translate<6.350000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.747000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.922000,0.000000,25.781000>}
box{<0,0,-0.254000><4.490128,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.747000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.795000,-1.535000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,-1.535000,4.572000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,44.997030,0> translate<10.795000,-1.535000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,0.000000,19.177000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,-44.997030,0> translate<10.287000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,-1.535000,42.037000>}
box{<0,0,-0.254000><17.399000,0.035000,0.254000> rotate<0,90.000000,0> translate<11.430000,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,0.000000,5.588000>}
box{<0,0,-0.254000><0.889000,0.035000,0.254000> rotate<0,-90.000000,0> translate<11.938000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,-1.535000,6.477000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,-1.535000,23.495000>}
box{<0,0,-0.254000><17.018000,0.035000,0.254000> rotate<0,90.000000,0> translate<11.938000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.192000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.192000,0.000000,15.113000>}
box{<0,0,-0.254000><7.239000,0.035000,0.254000> rotate<0,90.000000,0> translate<12.192000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.700000,-1.535000,24.257000>}
box{<0,0,-0.254000><1.077631,0.035000,0.254000> rotate<0,-44.997030,0> translate<11.938000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.700000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.700000,-1.535000,39.116000>}
box{<0,0,-0.254000><14.859000,0.035000,0.254000> rotate<0,90.000000,0> translate<12.700000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.192000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.208000,0.000000,16.129000>}
box{<0,0,-0.254000><1.436841,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.192000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,16.380000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,16.256000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.335000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.208000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,16.380000>}
box{<0,0,-0.254000><0.281301,0.035000,0.254000> rotate<0,-63.157512,0> translate<13.208000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,19.177000>}
box{<0,0,-0.254000><1.905000,0.035000,0.254000> rotate<0,0.000000,0> translate<11.430000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,19.180000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<13.335000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.287000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,34.798000>}
box{<0,0,-0.254000><3.048000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.287000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.192000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,6.477000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,44.997030,0> translate<12.192000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,6.477000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<13.589000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,35.052000>}
box{<0,0,-0.254000><0.359210,0.035000,0.254000> rotate<0,-44.997030,0> translate<13.335000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.605000,0.000000,6.000000>}
box{<0,0,-0.254000><0.097324,0.035000,0.254000> rotate<0,80.532363,0> translate<13.589000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.605000,-1.535000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716000,-1.535000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<13.605000,-1.535000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.700000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716000,-1.535000,40.132000>}
box{<0,0,-0.254000><1.436841,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.700000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,-1.535000,8.763000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<13.716000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,-1.535000,8.763000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,-1.535000,20.955000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,90.000000,0> translate<13.843000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.840000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,0.000000,56.515000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,0.000000,0> translate<13.840000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,0.000000,56.515000>}
box{<0,0,-0.254000><7.747000,0.035000,0.254000> rotate<0,90.000000,0> translate<13.843000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.224000,-1.535000,4.572000>}
box{<0,0,-0.254000><2.794000,0.035000,0.254000> rotate<0,0.000000,0> translate<11.430000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.478000,0.000000,21.590000>}
box{<0,0,-0.254000><4.310523,0.035000,0.254000> rotate<0,44.997030,0> translate<11.430000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.478000,0.000000,21.590000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,-44.997030,0> translate<13.843000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.795000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,0.000000,0.889000>}
box{<0,0,-0.254000><6.106574,0.035000,0.254000> rotate<0,44.997030,0> translate<10.795000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,0.000000,0.889000>}
box{<0,0,-0.254000><0.127000,0.035000,0.254000> rotate<0,90.000000,0> translate<15.113000,0.000000,0.889000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.794000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,0.000000,38.481000>}
box{<0,0,-0.254000><12.319000,0.035000,0.254000> rotate<0,0.000000,0> translate<2.794000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.794000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.240000,0.000000,33.528000>}
box{<0,0,-0.254000><12.446000,0.035000,0.254000> rotate<0,0.000000,0> translate<2.794000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.240000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,0.000000,33.510800>}
box{<0,0,-0.254000><0.019142,0.035000,0.254000> rotate<0,63.966186,0> translate<15.240000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,0.000000,38.489200>}
box{<0,0,-0.254000><0.135648,0.035000,0.254000> rotate<0,-3.465445,0> translate<15.113000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,-1.535000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,33.401000>}
box{<0,0,-0.254000><0.161623,0.035000,0.254000> rotate<0,42.790724,0> translate<15.248400,-1.535000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,21.463000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,33.401000>}
box{<0,0,-0.254000><11.938000,0.035000,0.254000> rotate<0,90.000000,0> translate<15.367000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,-1.535000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,38.481000>}
box{<0,0,-0.254000><0.118883,0.035000,0.254000> rotate<0,3.954873,0> translate<15.248400,-1.535000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,0.000000,38.608000>}
box{<0,0,-0.254000><0.167867,0.035000,0.254000> rotate<0,-45.045296,0> translate<15.248400,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.248400,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.494000,0.000000,33.528000>}
box{<0,0,-0.254000><0.246202,0.035000,0.254000> rotate<0,-4.005766,0> translate<15.248400,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.224000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.621000,-1.535000,5.969000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.224000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.748000,0.000000,46.355000>}
box{<0,0,-0.254000><6.106574,0.035000,0.254000> rotate<0,-44.997030,0> translate<11.430000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,39.116000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,-44.997030,0> translate<15.367000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,43.685000>}
box{<0,0,-0.254000><4.569000,0.035000,0.254000> rotate<0,90.000000,0> translate<15.875000,0.000000,43.685000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.485000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.482000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.875000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.748000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.485000>}
box{<0,0,-0.254000><0.181739,0.035000,0.254000> rotate<0,-45.665778,0> translate<15.748000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.843000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.736000>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,44.997030,0> translate<13.843000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.485000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.736000>}
box{<0,0,-0.254000><0.251000,0.035000,0.254000> rotate<0,90.000000,0> translate<15.875000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.621000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,-1.535000,5.969000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<15.621000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.129000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.145000,-1.535000,6.000000>}
box{<0,0,-0.254000><0.034886,0.035000,0.254000> rotate<0,-62.696290,0> translate<16.129000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.145000,-1.535000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256000,-1.535000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<16.145000,-1.535000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256000,-1.535000,9.906000>}
box{<0,0,-0.254000><1.270000,0.035000,0.254000> rotate<0,90.000000,0> translate<16.256000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.938000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.383000,0.000000,1.143000>}
box{<0,0,-0.254000><6.286179,0.035000,0.254000> rotate<0,44.997030,0> translate<11.938000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,20.825000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,20.701000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.510000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.478000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,23.622000>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.478000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,23.625000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<16.510000,0.000000,23.625000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.780000,-1.535000,36.068000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,44.997030,0> translate<15.367000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.780000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.780000,-1.535000,36.068000>}
box{<0,0,-0.254000><15.748000,0.035000,0.254000> rotate<0,90.000000,0> translate<17.780000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.685000,-1.535000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,-1.535000,5.969000>}
box{<0,0,-0.254000><0.115248,0.035000,0.254000> rotate<0,15.602917,0> translate<18.685000,-1.535000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.685000,0.000000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,0.000000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<18.685000,0.000000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,0.000000,9.144000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,90.000000,0> translate<18.796000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.668000,-1.535000,3.683000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.923000,-1.535000,3.683000>}
box{<0,0,-0.254000><8.255000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.668000,-1.535000,3.683000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,-1.535000,12.700000>}
box{<0,0,-0.254000><3.951313,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.256000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,43.685000>}
box{<0,0,-0.254000><3.426000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.050000,0.000000,43.685000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.875000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,46.482000>}
box{<0,0,-0.254000><3.175000,0.035000,0.254000> rotate<0,0.000000,0> translate<15.875000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,46.485000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.050000,0.000000,46.485000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,5.969000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,0.000000,0> translate<18.796000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.780000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,18.923000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,44.997030,0> translate<17.780000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,40.132000>}
box{<0,0,-0.254000><5.461000,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,46.485000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,0.000000,46.609000>}
box{<0,0,-0.254000><0.177496,0.035000,0.254000> rotate<0,-44.312298,0> translate<19.050000,0.000000,46.485000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,-1.535000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,-1.535000,11.557000>}
box{<0,0,-0.254000><1.270000,0.035000,0.254000> rotate<0,90.000000,0> translate<19.558000,-1.535000,11.557000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.144000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.685000,0.000000,60.706000>}
box{<0,0,-0.254000><10.541000,0.035000,0.254000> rotate<0,0.000000,0> translate<9.144000,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.939000,0.000000,11.557000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.558000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.335000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.066000,0.000000,16.256000>}
box{<0,0,-0.254000><6.731000,0.035000,0.254000> rotate<0,0.000000,0> translate<13.335000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.160000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.320000,-1.535000,2.540000>}
box{<0,0,-0.254000><10.160000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.160000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.447000,-1.535000,18.923000>}
box{<0,0,-0.254000><1.270000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.177000,-1.535000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.510000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.574000,0.000000,20.701000>}
box{<0,0,-0.254000><4.064000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.510000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.066000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,15.621000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,44.997030,0> translate<20.066000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.367000,-1.535000,21.463000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,16.129000>}
box{<0,0,-0.254000><7.543415,0.035000,0.254000> rotate<0,44.997030,0> translate<15.367000,-1.535000,21.463000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,16.129000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,90.000000,0> translate<20.701000,-1.535000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.574000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,20.574000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,44.997030,0> translate<20.574000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.494000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,33.528000>}
box{<0,0,-0.254000><5.207000,0.035000,0.254000> rotate<0,0.000000,0> translate<15.494000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,38.608000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,44.997030,0> translate<19.050000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,38.608000>}
box{<0,0,-0.254000><2.155261,0.035000,0.254000> rotate<0,44.997030,0> translate<19.177000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.640000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,56.515000>}
box{<0,0,-0.254000><4.061000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.640000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,15.510800>}
box{<0,0,-0.254000><0.121262,0.035000,0.254000> rotate<0,65.332750,0> translate<20.701000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,-1.535000,15.510800>}
box{<0,0,-0.254000><0.121262,0.035000,0.254000> rotate<0,65.332750,0> translate<20.701000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,20.489200>}
box{<0,0,-0.254000><0.098749,0.035000,0.254000> rotate<0,59.171647,0> translate<20.701000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,33.510800>}
box{<0,0,-0.254000><0.053443,0.035000,0.254000> rotate<0,18.772734,0> translate<20.701000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,38.489200>}
box{<0,0,-0.254000><0.129127,0.035000,0.254000> rotate<0,66.925171,0> translate<20.701000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,-1.535000,38.489200>}
box{<0,0,-0.254000><0.129127,0.035000,0.254000> rotate<0,66.925171,0> translate<20.701000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.701000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,56.489200>}
box{<0,0,-0.254000><0.056798,0.035000,0.254000> rotate<0,27.014407,0> translate<20.701000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,-1.535000,20.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,-1.535000,20.574000>}
box{<0,0,-0.254000><0.114140,0.035000,0.254000> rotate<0,-47.979771,0> translate<20.751600,-1.535000,20.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,51.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,0.000000,51.562000>}
box{<0,0,-0.254000><0.091970,0.035000,0.254000> rotate<0,-33.826063,0> translate<20.751600,0.000000,51.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,-1.535000,56.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,-1.535000,56.515000>}
box{<0,0,-0.254000><0.080639,0.035000,0.254000> rotate<0,-18.658406,0> translate<20.751600,-1.535000,56.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.955000,0.000000,33.528000>}
box{<0,0,-0.254000><0.204126,0.035000,0.254000> rotate<0,-4.833252,0> translate<20.751600,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.955000,0.000000,38.481000>}
box{<0,0,-0.254000><0.203565,0.035000,0.254000> rotate<0,2.308457,0> translate<20.751600,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.751600,0.000000,51.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,51.562000>}
box{<0,0,-0.254000><0.334344,0.035000,0.254000> rotate<0,-8.808119,0> translate<20.751600,0.000000,51.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.923000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.209000,0.000000,5.969000>}
box{<0,0,-0.254000><3.232892,0.035000,0.254000> rotate<0,-44.997030,0> translate<18.923000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.558000,-1.535000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.209000,-1.535000,8.636000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,44.997030,0> translate<19.558000,-1.535000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.209000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.225000,0.000000,6.000000>}
box{<0,0,-0.254000><0.034886,0.035000,0.254000> rotate<0,-62.696290,0> translate<21.209000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.209000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.225000,-1.535000,8.540000>}
box{<0,0,-0.254000><0.097324,0.035000,0.254000> rotate<0,80.532363,0> translate<21.209000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.463000,-1.535000,3.683000>}
box{<0,0,-0.254000><3.232892,0.035000,0.254000> rotate<0,44.997030,0> translate<19.177000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.939000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,14.859000>}
box{<0,0,-0.254000><4.669733,0.035000,0.254000> rotate<0,-44.997030,0> translate<19.939000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.447000,-1.535000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,16.129000>}
box{<0,0,-0.254000><3.951313,0.035000,0.254000> rotate<0,44.997030,0> translate<20.447000,-1.535000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,16.129000>}
box{<0,0,-0.254000><0.889000,0.035000,0.254000> rotate<0,90.000000,0> translate<23.241000,-1.535000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,21.717000>}
box{<0,0,-0.254000><6.858000,0.035000,0.254000> rotate<0,90.000000,0> translate<23.241000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.382000,-1.535000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,39.116000>}
box{<0,0,-0.254000><21.013799,0.035000,0.254000> rotate<0,44.997030,0> translate<8.382000,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,39.116000>}
box{<0,0,-0.254000><17.399000,0.035000,0.254000> rotate<0,90.000000,0> translate<23.241000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,53.975000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,-44.997030,0> translate<20.828000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.685000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,57.150000>}
box{<0,0,-0.254000><5.028943,0.035000,0.254000> rotate<0,44.997030,0> translate<19.685000,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,0.000000,57.150000>}
box{<0,0,-0.254000><3.175000,0.035000,0.254000> rotate<0,90.000000,0> translate<23.241000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.320000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.749000,0.000000,5.969000>}
box{<0,0,-0.254000><4.849338,0.035000,0.254000> rotate<0,-44.997030,0> translate<20.320000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.749000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.765000,0.000000,6.000000>}
box{<0,0,-0.254000><0.034886,0.035000,0.254000> rotate<0,-62.696290,0> translate<23.749000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.765000,0.000000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876000,0.000000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<23.765000,0.000000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.050000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.130000,-1.535000,12.700000>}
box{<0,0,-0.254000><5.080000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.050000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.384000,0.000000,8.636000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<23.876000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.384000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.781000,0.000000,10.033000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,-44.997030,0> translate<24.384000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.654000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.289000,-1.535000,10.541000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,44.997030,0> translate<25.654000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.289000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.289000,-1.535000,10.541000>}
box{<0,0,-0.254000><1.905000,0.035000,0.254000> rotate<0,90.000000,0> translate<26.289000,-1.535000,10.541000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.289000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.305000,-1.535000,8.540000>}
box{<0,0,-0.254000><0.097324,0.035000,0.254000> rotate<0,80.532363,0> translate<26.289000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.305000,-1.535000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.416000,-1.535000,5.969000>}
box{<0,0,-0.254000><0.115248,0.035000,0.254000> rotate<0,15.602917,0> translate<26.305000,-1.535000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.130000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.416000,0.000000,14.986000>}
box{<0,0,-0.254000><3.232892,0.035000,0.254000> rotate<0,-44.997030,0> translate<24.130000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.416000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.797000,-1.535000,5.969000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,0.000000,0> translate<26.416000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.797000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.194000,-1.535000,4.572000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,44.997030,0> translate<26.797000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.241000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.829000,-1.535000,9.652000>}
box{<0,0,-0.254000><7.902625,0.035000,0.254000> rotate<0,44.997030,0> translate<23.241000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.829000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.829000,-1.535000,9.652000>}
box{<0,0,-0.254000><1.016000,0.035000,0.254000> rotate<0,90.000000,0> translate<28.829000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.829000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.845000,-1.535000,8.540000>}
box{<0,0,-0.254000><0.097324,0.035000,0.254000> rotate<0,80.532363,0> translate<28.829000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.845000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.956000,0.000000,5.969000>}
box{<0,0,-0.254000><0.115248,0.035000,0.254000> rotate<0,15.602917,0> translate<28.845000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.956000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.956000,0.000000,5.969000>}
box{<0,0,-0.254000><2.540000,0.035000,0.254000> rotate<0,90.000000,0> translate<28.956000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.654000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<29.337000,0.000000,11.176000>}
box{<0,0,-0.254000><3.683000,0.035000,0.254000> rotate<0,0.000000,0> translate<25.654000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.416000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<29.591000,0.000000,14.986000>}
box{<0,0,-0.254000><3.175000,0.035000,0.254000> rotate<0,0.000000,0> translate<26.416000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.956000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.099000,0.000000,2.286000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,44.997030,0> translate<28.956000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.781000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,10.033000>}
box{<0,0,-0.254000><4.445000,0.035000,0.254000> rotate<0,0.000000,0> translate<25.781000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.113000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.353000,-1.535000,0.762000>}
box{<0,0,-0.254000><15.240000,0.035000,0.254000> rotate<0,0.000000,0> translate<15.113000,-1.535000,0.762000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.353000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.607000,-1.535000,0.508000>}
box{<0,0,-0.254000><0.359210,0.035000,0.254000> rotate<0,44.997030,0> translate<30.353000,-1.535000,0.762000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<29.591000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.607000,-1.535000,14.986000>}
box{<0,0,-0.254000><1.016000,0.035000,0.254000> rotate<0,0.000000,0> translate<29.591000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,0.000000,14.859000>}
box{<0,0,-0.254000><3.175000,0.035000,0.254000> rotate<0,-90.000000,0> translate<30.734000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,-1.535000,39.116000>}
box{<0,0,-0.254000><3.175000,0.035000,0.254000> rotate<0,90.000000,0> translate<30.734000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.099000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.988000,-1.535000,1.397000>}
box{<0,0,-0.254000><1.257236,0.035000,0.254000> rotate<0,44.997030,0> translate<30.099000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.922000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.115000,0.000000,25.781000>}
box{<0,0,-0.254000><20.193000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.922000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.369000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.369000,0.000000,8.636000>}
box{<0,0,-0.254000><5.588000,0.035000,0.254000> rotate<0,-90.000000,0> translate<31.369000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.369000,0.000000,14.224000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,44.997030,0> translate<30.734000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.369000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.385000,0.000000,8.540000>}
box{<0,0,-0.254000><0.097324,0.035000,0.254000> rotate<0,80.532363,0> translate<31.369000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.385000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.496000,0.000000,5.969000>}
box{<0,0,-0.254000><0.115248,0.035000,0.254000> rotate<0,15.602917,0> translate<31.385000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.496000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.496000,0.000000,5.969000>}
box{<0,0,-0.254000><3.429000,0.035000,0.254000> rotate<0,90.000000,0> translate<31.496000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.607000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.623000,-1.535000,13.970000>}
box{<0,0,-0.254000><1.436841,0.035000,0.254000> rotate<0,44.997030,0> translate<30.607000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.383000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.750000,0.000000,1.143000>}
box{<0,0,-0.254000><15.367000,0.035000,0.254000> rotate<0,0.000000,0> translate<16.383000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.115000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<32.385000,0.000000,24.511000>}
box{<0,0,-0.254000><1.796051,0.035000,0.254000> rotate<0,44.997030,0> translate<31.115000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,-1.535000,10.033000>}
box{<0,0,-0.254000><2.794000,0.035000,0.254000> rotate<0,0.000000,0> translate<30.226000,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.955000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,0.000000,33.528000>}
box{<0,0,-0.254000><12.065000,0.035000,0.254000> rotate<0,0.000000,0> translate<20.955000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,0.000000,51.562000>}
box{<0,0,-0.254000><11.938000,0.035000,0.254000> rotate<0,0.000000,0> translate<21.082000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,-1.535000,56.515000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,0.000000,0> translate<20.828000,-1.535000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,0.000000,20.447000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,-44.997030,0> translate<30.734000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.828000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,20.574000>}
box{<0,0,-0.254000><12.319000,0.035000,0.254000> rotate<0,0.000000,0> translate<20.828000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,33.528000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,44.997030,0> translate<30.734000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.955000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,0.000000,38.481000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,0.000000,0> translate<20.955000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.734000,-1.535000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,41.529000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,-44.997030,0> translate<30.734000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,51.435000>}
box{<0,0,-0.254000><9.906000,0.035000,0.254000> rotate<0,90.000000,0> translate<33.147000,-1.535000,51.435000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,20.489200>}
box{<0,0,-0.254000><0.109831,0.035000,0.254000> rotate<0,-22.594296,0> translate<33.147000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,-1.535000,20.489200>}
box{<0,0,-0.254000><0.132185,0.035000,0.254000> rotate<0,39.902833,0> translate<33.147000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,33.510800>}
box{<0,0,-0.254000><0.229047,0.035000,0.254000> rotate<0,4.306330,0> translate<33.020000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,-1.535000,33.510800>}
box{<0,0,-0.254000><0.102848,0.035000,0.254000> rotate<0,9.626540,0> translate<33.147000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,38.489200>}
box{<0,0,-0.254000><0.101731,0.035000,0.254000> rotate<0,-4.623021,0> translate<33.147000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,51.510800>}
box{<0,0,-0.254000><0.234068,0.035000,0.254000> rotate<0,12.634175,0> translate<33.020000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.147000,-1.535000,51.435000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,-1.535000,51.510800>}
box{<0,0,-0.254000><0.126600,0.035000,0.254000> rotate<0,-36.776956,0> translate<33.147000,-1.535000,51.435000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,-1.535000,56.489200>}
box{<0,0,-0.254000><0.229853,0.035000,0.254000> rotate<0,6.444371,0> translate<33.020000,-1.535000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,15.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,15.621000>}
box{<0,0,-0.254000><0.113134,0.035000,0.254000> rotate<0,-76.916796,0> translate<33.248400,0.000000,15.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,33.528000>}
box{<0,0,-0.254000><0.030842,0.035000,0.254000> rotate<0,-33.893930,0> translate<33.248400,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,0.000000,51.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,51.562000>}
box{<0,0,-0.254000><0.057243,0.035000,0.254000> rotate<0,-63.430762,0> translate<33.248400,0.000000,51.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.248400,-1.535000,56.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,-1.535000,56.388000>}
box{<0,0,-0.254000><0.104388,0.035000,0.254000> rotate<0,75.799008,0> translate<33.248400,-1.535000,56.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.750000,0.000000,1.143000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.909000,0.000000,3.302000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,-44.997030,0> translate<31.750000,0.000000,1.143000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.909000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.909000,0.000000,5.969000>}
box{<0,0,-0.254000><2.667000,0.035000,0.254000> rotate<0,90.000000,0> translate<33.909000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.909000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.925000,0.000000,6.000000>}
box{<0,0,-0.254000><0.034886,0.035000,0.254000> rotate<0,-62.696290,0> translate<33.909000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.925000,0.000000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.036000,0.000000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<33.925000,0.000000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.163000,0.000000,52.451000>}
box{<0,0,-0.254000><1.257236,0.035000,0.254000> rotate<0,-44.997030,0> translate<33.274000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.036000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.544000,0.000000,8.636000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<34.036000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.020000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.671000,0.000000,10.033000>}
box{<0,0,-0.254000><1.651000,0.035000,0.254000> rotate<0,0.000000,0> translate<33.020000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.541000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.671000,0.000000,26.670000>}
box{<0,0,-0.254000><24.130000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.541000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<29.337000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.798000,-1.535000,11.176000>}
box{<0,0,-0.254000><5.461000,0.035000,0.254000> rotate<0,0.000000,0> translate<29.337000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.671000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.814000,0.000000,11.176000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,-44.997030,0> translate<34.671000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.798000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.941000,-1.535000,12.319000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,-44.997030,0> translate<34.798000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.623000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.941000,-1.535000,13.970000>}
box{<0,0,-0.254000><4.318000,0.035000,0.254000> rotate<0,0.000000,0> translate<31.623000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.544000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,0.000000,10.287000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,-44.997030,0> translate<34.544000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.796000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,0.000000,26.543000>}
box{<0,0,-0.254000><24.605902,0.035000,0.254000> rotate<0,-44.997030,0> translate<18.796000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,-1.535000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,-1.535000,35.941000>}
box{<0,0,-0.254000><3.048000,0.035000,0.254000> rotate<0,90.000000,0> translate<36.195000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.465000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.576000,0.000000,6.096000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<36.465000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.465000,-1.535000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.576000,-1.535000,8.636000>}
box{<0,0,-0.254000><0.146755,0.035000,0.254000> rotate<0,-40.852680,0> translate<36.465000,-1.535000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.671000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.830000,-1.535000,24.511000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,44.997030,0> translate<34.671000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.194000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,4.572000>}
box{<0,0,-0.254000><8.890000,0.035000,0.254000> rotate<0,0.000000,0> translate<28.194000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.576000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,9.144000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,-44.997030,0> translate<36.576000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,9.144000>}
box{<0,0,-0.254000><10.668000,0.035000,0.254000> rotate<0,-90.000000,0> translate<37.084000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<32.385000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,19.812000>}
box{<0,0,-0.254000><6.645390,0.035000,0.254000> rotate<0,44.997030,0> translate<32.385000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.463000,-1.535000,3.683000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.465000,-1.535000,3.683000>}
box{<0,0,-0.254000><16.002000,0.035000,0.254000> rotate<0,0.000000,0> translate<21.463000,-1.535000,3.683000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<31.496000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.592000,-1.535000,2.540000>}
box{<0,0,-0.254000><6.096000,0.035000,0.254000> rotate<0,0.000000,0> translate<31.496000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.988000,-1.535000,1.397000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.719000,-1.535000,1.397000>}
box{<0,0,-0.254000><6.731000,0.035000,0.254000> rotate<0,0.000000,0> translate<30.988000,-1.535000,1.397000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.084000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.973000,-1.535000,5.461000>}
box{<0,0,-0.254000><1.257236,0.035000,0.254000> rotate<0,-44.997030,0> translate<37.084000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,-1.535000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.973000,-1.535000,31.115000>}
box{<0,0,-0.254000><2.514472,0.035000,0.254000> rotate<0,44.997030,0> translate<36.195000,-1.535000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.973000,-1.535000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.973000,-1.535000,31.115000>}
box{<0,0,-0.254000><25.654000,0.035000,0.254000> rotate<0,90.000000,0> translate<37.973000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.735000,0.000000,33.528000>}
box{<0,0,-0.254000><5.461000,0.035000,0.254000> rotate<0,0.000000,0> translate<33.274000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.735000,-1.535000,38.481000>}
box{<0,0,-0.254000><3.592102,0.035000,0.254000> rotate<0,-44.997030,0> translate<36.195000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.735000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.751600,0.000000,33.510800>}
box{<0,0,-0.254000><0.023904,0.035000,0.254000> rotate<0,46.013941,0> translate<38.735000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.735000,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.751600,-1.535000,38.489200>}
box{<0,0,-0.254000><0.018515,0.035000,0.254000> rotate<0,-26.286527,0> translate<38.735000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.465000,-1.535000,3.683000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,-1.535000,5.080000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,-44.997030,0> translate<37.465000,-1.535000,3.683000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,-1.535000,27.432000>}
box{<0,0,-0.254000><22.352000,0.035000,0.254000> rotate<0,90.000000,0> translate<38.862000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.751600,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,0.000000,38.608000>}
box{<0,0,-0.254000><0.162178,0.035000,0.254000> rotate<0,-47.095798,0> translate<38.751600,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.751600,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.989000,0.000000,33.528000>}
box{<0,0,-0.254000><0.238022,0.035000,0.254000> rotate<0,-4.143654,0> translate<38.751600,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.576000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.370000,0.000000,8.890000>}
box{<0,0,-0.254000><3.951313,0.035000,0.254000> rotate<0,-44.997030,0> translate<36.576000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.592000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.751000,-1.535000,4.699000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,-44.997030,0> translate<37.592000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.751000,-1.535000,4.699000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.751000,-1.535000,27.051000>}
box{<0,0,-0.254000><22.352000,0.035000,0.254000> rotate<0,90.000000,0> translate<39.751000,-1.535000,27.051000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<34.163000,0.000000,52.451000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,52.451000>}
box{<0,0,-0.254000><5.842000,0.035000,0.254000> rotate<0,0.000000,0> translate<34.163000,0.000000,52.451000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,52.451000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,52.575000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,90.000000,0> translate<40.005000,0.000000,52.575000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,55.375000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,55.372000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,-90.000000,0> translate<40.005000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.830000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.132000,0.000000,24.511000>}
box{<0,0,-0.254000><3.302000,0.035000,0.254000> rotate<0,0.000000,0> translate<36.830000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<37.719000,-1.535000,1.397000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.640000,-1.535000,4.318000>}
box{<0,0,-0.254000><4.130918,0.035000,0.254000> rotate<0,-44.997030,0> translate<37.719000,-1.535000,1.397000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.640000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.640000,-1.535000,24.638000>}
box{<0,0,-0.254000><20.320000,0.035000,0.254000> rotate<0,90.000000,0> translate<40.640000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.894000,0.000000,26.543000>}
box{<0,0,-0.254000><4.699000,0.035000,0.254000> rotate<0,0.000000,0> translate<36.195000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.640000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.148000,-1.535000,25.146000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,-44.997030,0> translate<40.640000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.814000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.275000,0.000000,11.176000>}
box{<0,0,-0.254000><5.461000,0.035000,0.254000> rotate<0,0.000000,0> translate<35.814000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.941000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.275000,0.000000,12.319000>}
box{<0,0,-0.254000><5.334000,0.035000,0.254000> rotate<0,0.000000,0> translate<35.941000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.275000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.529000,0.000000,11.430000>}
box{<0,0,-0.254000><0.359210,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.275000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.656000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.656000,0.000000,4.318000>}
box{<0,0,-0.254000><2.794000,0.035000,0.254000> rotate<0,-90.000000,0> translate<41.656000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.370000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,0.000000,8.890000>}
box{<0,0,-0.254000><2.413000,0.035000,0.254000> rotate<0,0.000000,0> translate<39.370000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.275000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,0.000000,12.827000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.275000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,-1.535000,12.827000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,-1.535000,18.034000>}
box{<0,0,-0.254000><5.207000,0.035000,0.254000> rotate<0,90.000000,0> translate<41.783000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,9.144000>}
box{<0,0,-0.254000><0.359210,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.783000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<36.195000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,0.000000,10.287000>}
box{<0,0,-0.254000><5.842000,0.035000,0.254000> rotate<0,0.000000,0> translate<36.195000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.148000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,0.000000,26.035000>}
box{<0,0,-0.254000><1.257236,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.148000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,0.000000,32.385000>}
box{<0,0,-0.254000><6.350000,0.035000,0.254000> rotate<0,90.000000,0> translate<42.037000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,-1.535000,56.388000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,47.625000>}
box{<0,0,-0.254000><12.392753,0.035000,0.254000> rotate<0,44.997030,0> translate<33.274000,-1.535000,56.388000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,47.625000>}
box{<0,0,-0.254000><15.240000,0.035000,0.254000> rotate<0,90.000000,0> translate<42.037000,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.656000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.545000,0.000000,3.429000>}
box{<0,0,-0.254000><1.257236,0.035000,0.254000> rotate<0,44.997030,0> translate<41.656000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.529000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.545000,0.000000,11.430000>}
box{<0,0,-0.254000><1.016000,0.035000,0.254000> rotate<0,0.000000,0> translate<41.529000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<39.751000,-1.535000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.672000,-1.535000,29.972000>}
box{<0,0,-0.254000><4.130918,0.035000,0.254000> rotate<0,-44.997030,0> translate<39.751000,-1.535000,27.051000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,-1.535000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<43.180000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.656000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,0.000000,8.636000>}
box{<0,0,-0.254000><2.155261,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.656000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,0.000000,8.636000>}
box{<0,0,-0.254000><2.159000,0.035000,0.254000> rotate<0,-90.000000,0> translate<43.180000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.545000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,0.000000,10.795000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,44.997030,0> translate<42.545000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,0.000000,11.811000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<43.815000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.730000,-1.535000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,-1.535000,17.907000>}
box{<0,0,-0.254000><0.125992,0.035000,0.254000> rotate<0,47.570220,0> translate<43.730000,-1.535000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,-1.535000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,-1.535000,17.907000>}
box{<0,0,-0.254000><6.096000,0.035000,0.254000> rotate<0,90.000000,0> translate<43.815000,-1.535000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.730000,0.000000,54.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,0.000000,53.975000>}
box{<0,0,-0.254000><0.088600,0.035000,0.254000> rotate<0,16.388459,0> translate<43.730000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,-1.535000,9.144000>}
box{<0,0,-0.254000><2.286000,0.035000,0.254000> rotate<0,0.000000,0> translate<42.037000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,10.922000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,44.997030,0> translate<43.815000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,10.922000>}
box{<0,0,-0.254000><1.778000,0.035000,0.254000> rotate<0,90.000000,0> translate<44.323000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,44.069000>}
box{<0,0,-0.254000><7.723020,0.035000,0.254000> rotate<0,-44.997030,0> translate<38.862000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,46.609000>}
box{<0,0,-0.254000><25.146000,0.035000,0.254000> rotate<0,0.000000,0> translate<19.177000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.831000,0.000000,47.117000>}
box{<0,0,-0.254000><0.718420,0.035000,0.254000> rotate<0,-44.997030,0> translate<44.323000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.323000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.958000,0.000000,44.069000>}
box{<0,0,-0.254000><0.635000,0.035000,0.254000> rotate<0,0.000000,0> translate<44.323000,0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.005000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.958000,0.000000,55.372000>}
box{<0,0,-0.254000><4.953000,0.035000,0.254000> rotate<0,0.000000,0> translate<40.005000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.180000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,-1.535000,3.429000>}
box{<0,0,-0.254000><2.694077,0.035000,0.254000> rotate<0,44.997030,0> translate<43.180000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,44.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,44.196000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,-90.000000,0> translate<45.085000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.958000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,44.320000>}
box{<0,0,-0.254000><0.281301,0.035000,0.254000> rotate<0,-63.157512,0> translate<44.958000,0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.831000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,47.120000>}
box{<0,0,-0.254000><0.254018,0.035000,0.254000> rotate<0,-0.676646,0> translate<44.831000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<43.815000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,52.705000>}
box{<0,0,-0.254000><1.796051,0.035000,0.254000> rotate<0,44.997030,0> translate<43.815000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,47.120000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,52.705000>}
box{<0,0,-0.254000><5.585000,0.035000,0.254000> rotate<0,90.000000,0> translate<45.085000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.132000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.212000,0.000000,19.431000>}
box{<0,0,-0.254000><7.184205,0.035000,0.254000> rotate<0,44.997030,0> translate<40.132000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,47.120000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.212000,0.000000,47.117000>}
box{<0,0,-0.254000><0.127035,0.035000,0.254000> rotate<0,1.353103,0> translate<45.085000,0.000000,47.120000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.593000,0.000000,44.196000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<45.085000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.720000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.720000,-1.535000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<41.783000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.720000,-1.535000,21.971000>}
box{<0,0,-0.254000><5.567759,0.035000,0.254000> rotate<0,-44.997030,0> translate<41.783000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<44.958000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.228000,0.000000,54.102000>}
box{<0,0,-0.254000><1.796051,0.035000,0.254000> rotate<0,44.997030,0> translate<44.958000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.228000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.270000,0.000000,54.000000>}
box{<0,0,-0.254000><0.110309,0.035000,0.254000> rotate<0,67.615402,0> translate<46.228000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.270000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.355000,0.000000,18.034000>}
box{<0,0,-0.254000><0.091548,0.035000,0.254000> rotate<0,-21.799971,0> translate<46.270000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<46.355000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<47.498000,0.000000,19.177000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,-44.997030,0> translate<46.355000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.260000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.260000,0.000000,6.096000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<48.260000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.862000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.260000,-1.535000,36.830000>}
box{<0,0,-0.254000><13.290779,0.035000,0.254000> rotate<0,-44.997030,0> translate<38.862000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<33.274000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.768000,0.000000,15.621000>}
box{<0,0,-0.254000><15.494000,0.035000,0.254000> rotate<0,0.000000,0> translate<33.274000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.720000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.022000,-1.535000,9.398000>}
box{<0,0,-0.254000><4.669733,0.035000,0.254000> rotate<0,-44.997030,0> translate<45.720000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.768000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.403000,0.000000,16.256000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,-44.997030,0> translate<48.768000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.403000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,16.380000>}
box{<0,0,-0.254000><0.177496,0.035000,0.254000> rotate<0,-44.312298,0> translate<49.403000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,16.380000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,-90.000000,0> translate<49.530000,0.000000,16.380000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<47.498000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,19.177000>}
box{<0,0,-0.254000><2.032000,0.035000,0.254000> rotate<0,0.000000,0> translate<47.498000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,19.180000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<49.530000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<50.800000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<50.800000,-1.535000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<50.800000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.607000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.054000,-1.535000,0.508000>}
box{<0,0,-0.254000><20.447000,0.035000,0.254000> rotate<0,0.000000,0> translate<30.607000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<38.989000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.181000,0.000000,33.528000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,0.000000,0> translate<38.989000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.593000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.181000,0.000000,38.608000>}
box{<0,0,-0.254000><7.902625,0.035000,0.254000> rotate<0,44.997030,0> translate<45.593000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.181000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.248400,0.000000,33.510800>}
box{<0,0,-0.254000><0.069560,0.035000,0.254000> rotate<0,14.314983,0> translate<51.181000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.181000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.248400,0.000000,38.489200>}
box{<0,0,-0.254000><0.136588,0.035000,0.254000> rotate<0,60.428033,0> translate<51.181000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.530000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,0.000000,16.383000>}
box{<0,0,-0.254000><1.778000,0.035000,0.254000> rotate<0,0.000000,0> translate<49.530000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,0.000000,16.383000>}
box{<0,0,-0.254000><16.891000,0.035000,0.254000> rotate<0,-90.000000,0> translate<51.308000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.248400,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,0.000000,33.274000>}
box{<0,0,-0.254000><0.244185,0.035000,0.254000> rotate<0,75.867695,0> translate<51.248400,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.248400,-1.535000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,-1.535000,33.528000>}
box{<0,0,-0.254000><0.062032,0.035000,0.254000> rotate<0,-16.096581,0> translate<51.248400,-1.535000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.085000,-1.535000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.435000,-1.535000,3.429000>}
box{<0,0,-0.254000><6.350000,0.035000,0.254000> rotate<0,0.000000,0> translate<45.085000,-1.535000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.260000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,0.000000,10.033000>}
box{<0,0,-0.254000><5.567759,0.035000,0.254000> rotate<0,-44.997030,0> translate<48.260000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,0.000000,11.430000>}
box{<0,0,-0.254000><1.397000,0.035000,0.254000> rotate<0,90.000000,0> translate<52.197000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<35.941000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,0.000000,13.970000>}
box{<0,0,-0.254000><16.256000,0.035000,0.254000> rotate<0,0.000000,0> translate<35.941000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.451000,-1.535000,11.176000>}
box{<0,0,-0.254000><0.359210,0.035000,0.254000> rotate<0,44.997030,0> translate<52.197000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.589000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.832000,0.000000,35.052000>}
box{<0,0,-0.254000><39.243000,0.035000,0.254000> rotate<0,0.000000,0> translate<13.589000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<50.800000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.959000,-1.535000,8.255000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,-44.997030,0> translate<50.800000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.435000,-1.535000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,-1.535000,5.334000>}
box{<0,0,-0.254000><2.694077,0.035000,0.254000> rotate<0,-44.997030,0> translate<51.435000,-1.535000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,-1.535000,5.334000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,0.000000,5.715000>}
box{<0,0,-0.254000><10.668000,0.035000,0.254000> rotate<0,-90.000000,0> translate<53.340000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,0.000000,16.383000>}
box{<0,0,-0.254000><2.032000,0.035000,0.254000> rotate<0,0.000000,0> translate<51.308000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.229000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.229000,0.000000,26.162000>}
box{<0,0,-0.254000><7.493000,0.035000,0.254000> rotate<0,-90.000000,0> translate<54.229000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.832000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.229000,0.000000,33.655000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,44.997030,0> translate<52.832000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.959000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.483000,-1.535000,8.255000>}
box{<0,0,-0.254000><1.524000,0.035000,0.254000> rotate<0,0.000000,0> translate<52.959000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.483000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.483000,0.000000,8.255000>}
box{<0,0,-0.254000><5.715000,0.035000,0.254000> rotate<0,-90.000000,0> translate<54.483000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.197000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.483000,-1.535000,13.970000>}
box{<0,0,-0.254000><2.286000,0.035000,0.254000> rotate<0,0.000000,0> translate<52.197000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<48.260000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.991000,-1.535000,36.830000>}
box{<0,0,-0.254000><6.731000,0.035000,0.254000> rotate<0,0.000000,0> translate<48.260000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.212000,-1.535000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<55.245000,-1.535000,19.431000>}
box{<0,0,-0.254000><10.033000,0.035000,0.254000> rotate<0,0.000000,0> translate<45.212000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.054000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<55.880000,-1.535000,5.334000>}
box{<0,0,-0.254000><6.824995,0.035000,0.254000> rotate<0,-44.997030,0> translate<51.054000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<55.880000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<55.880000,-1.535000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<55.880000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.894000,-1.535000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.007000,-1.535000,26.543000>}
box{<0,0,-0.254000><15.113000,0.035000,0.254000> rotate<0,0.000000,0> translate<40.894000,-1.535000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.672000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.388000,-1.535000,29.972000>}
box{<0,0,-0.254000><13.716000,0.035000,0.254000> rotate<0,0.000000,0> translate<42.672000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<51.308000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.642000,-1.535000,33.528000>}
box{<0,0,-0.254000><5.334000,0.035000,0.254000> rotate<0,0.000000,0> translate<51.308000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.991000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.642000,-1.535000,38.481000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,-44.997030,0> translate<54.991000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.642000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.751600,-1.535000,33.510800>}
box{<0,0,-0.254000><0.110941,0.035000,0.254000> rotate<0,8.918340,0> translate<56.642000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.642000,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.751600,-1.535000,38.489200>}
box{<0,0,-0.254000><0.109906,0.035000,0.254000> rotate<0,-4.278474,0> translate<56.642000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.751600,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.769000,0.000000,33.528000>}
box{<0,0,-0.254000><0.024466,0.035000,0.254000> rotate<0,-44.665866,0> translate<56.751600,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.751600,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.769000,0.000000,38.608000>}
box{<0,0,-0.254000><0.120067,0.035000,0.254000> rotate<0,-81.662050,0> translate<56.751600,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<52.451000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.801000,-1.535000,11.176000>}
box{<0,0,-0.254000><6.350000,0.035000,0.254000> rotate<0,0.000000,0> translate<52.451000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<53.340000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.928000,0.000000,16.383000>}
box{<0,0,-0.254000><5.588000,0.035000,0.254000> rotate<0,0.000000,0> translate<53.340000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.037000,-1.535000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<59.817000,-1.535000,10.287000>}
box{<0,0,-0.254000><17.780000,0.035000,0.254000> rotate<0,0.000000,0> translate<42.037000,-1.535000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<55.245000,-1.535000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.325000,-1.535000,14.351000>}
box{<0,0,-0.254000><7.184205,0.035000,0.254000> rotate<0,44.997030,0> translate<55.245000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.928000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.452000,0.000000,17.907000>}
box{<0,0,-0.254000><2.155261,0.035000,0.254000> rotate<0,-44.997030,0> translate<58.928000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.452000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.460000,0.000000,18.000000>}
box{<0,0,-0.254000><0.093343,0.035000,0.254000> rotate<0,-85.077819,0> translate<60.452000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.022000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.579000,-1.535000,9.398000>}
box{<0,0,-0.254000><11.557000,0.035000,0.254000> rotate<0,0.000000,0> translate<49.022000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.769000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.357000,0.000000,44.196000>}
box{<0,0,-0.254000><7.902625,0.035000,0.254000> rotate<0,-44.997030,0> translate<56.769000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.357000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,44.196000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<62.357000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,44.320000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,90.000000,0> translate<62.865000,0.000000,44.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.212000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,47.117000>}
box{<0,0,-0.254000><17.653000,0.035000,0.254000> rotate<0,0.000000,0> translate<45.212000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,47.120000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<62.865000,0.000000,47.120000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.801000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,-1.535000,15.367000>}
box{<0,0,-0.254000><5.926969,0.035000,0.254000> rotate<0,-44.997030,0> translate<58.801000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,-1.535000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,-1.535000,20.447000>}
box{<0,0,-0.254000><5.080000,0.035000,0.254000> rotate<0,90.000000,0> translate<62.992000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,44.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,0.000000,44.069000>}
box{<0,0,-0.254000><0.281301,0.035000,0.254000> rotate<0,63.157512,0> translate<62.865000,0.000000,44.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.865000,0.000000,47.120000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,0.000000,46.990000>}
box{<0,0,-0.254000><0.181739,0.035000,0.254000> rotate<0,45.665778,0> translate<62.865000,0.000000,47.120000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<63.000000,-1.535000,20.540000>}
box{<0,0,-0.254000><0.093343,0.035000,0.254000> rotate<0,-85.077819,0> translate<62.992000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<64.897000,0.000000,45.085000>}
box{<0,0,-0.254000><2.694077,0.035000,0.254000> rotate<0,44.997030,0> translate<62.992000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.540000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.659000,0.000000,17.907000>}
box{<0,0,-0.254000><0.151030,0.035000,0.254000> rotate<0,38.005566,0> translate<65.540000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.540000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.659000,0.000000,18.161000>}
box{<0,0,-0.254000><0.200205,0.035000,0.254000> rotate<0,-53.527233,0> translate<65.540000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<45.720000,-1.535000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,-1.535000,21.971000>}
box{<0,0,-0.254000><20.320000,0.035000,0.254000> rotate<0,0.000000,0> translate<45.720000,-1.535000,21.971000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.007000,-1.535000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.294000,-1.535000,36.830000>}
box{<0,0,-0.254000><14.548015,0.035000,0.254000> rotate<0,-44.997030,0> translate<56.007000,-1.535000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.579000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.056000,-1.535000,15.875000>}
box{<0,0,-0.254000><9.159861,0.035000,0.254000> rotate<0,-44.997030,0> translate<60.579000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.056000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.056000,0.000000,15.875000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<67.056000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.659000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.183000,0.000000,16.383000>}
box{<0,0,-0.254000><2.155261,0.035000,0.254000> rotate<0,44.997030,0> translate<65.659000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.056000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.183000,0.000000,16.383000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<67.056000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<59.817000,-1.535000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.945000,-1.535000,18.415000>}
box{<0,0,-0.254000><11.494728,0.035000,0.254000> rotate<0,-44.997030,0> translate<59.817000,-1.535000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.992000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.453000,0.000000,38.608000>}
box{<0,0,-0.254000><7.723020,0.035000,0.254000> rotate<0,44.997030,0> translate<62.992000,0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.580000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.580000,0.000000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<68.580000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<60.325000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.580000,0.000000,6.096000>}
box{<0,0,-0.254000><11.674333,0.035000,0.254000> rotate<0,44.997030,0> translate<60.325000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.945000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.088000,0.000000,18.415000>}
box{<0,0,-0.254000><1.143000,0.035000,0.254000> rotate<0,0.000000,0> translate<67.945000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.769000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.088000,0.000000,33.528000>}
box{<0,0,-0.254000><12.319000,0.035000,0.254000> rotate<0,0.000000,0> translate<56.769000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<42.545000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.215000,0.000000,3.429000>}
box{<0,0,-0.254000><26.670000,0.035000,0.254000> rotate<0,0.000000,0> translate<42.545000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.453000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.215000,0.000000,38.608000>}
box{<0,0,-0.254000><0.762000,0.035000,0.254000> rotate<0,0.000000,0> translate<68.453000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.088000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.248400,0.000000,33.510800>}
box{<0,0,-0.254000><0.161320,0.035000,0.254000> rotate<0,6.120145,0> translate<69.088000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.215000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.248400,0.000000,38.489200>}
box{<0,0,-0.254000><0.123406,0.035000,0.254000> rotate<0,74.292046,0> translate<69.215000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.248400,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.342000,0.000000,33.528000>}
box{<0,0,-0.254000><0.095167,0.035000,0.254000> rotate<0,-10.411858,0> translate<69.248400,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.088000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.723000,0.000000,19.050000>}
box{<0,0,-0.254000><0.898026,0.035000,0.254000> rotate<0,-44.997030,0> translate<69.088000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,16.380000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,-90.000000,0> translate<69.850000,0.000000,16.380000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<67.183000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,16.383000>}
box{<0,0,-0.254000><2.667000,0.035000,0.254000> rotate<0,0.000000,0> translate<67.183000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.723000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,19.180000>}
box{<0,0,-0.254000><0.181739,0.035000,0.254000> rotate<0,-45.665778,0> translate<69.723000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,19.304000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,90.000000,0> translate<69.850000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.215000,0.000000,3.429000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.120000,0.000000,5.334000>}
box{<0,0,-0.254000><2.694077,0.035000,0.254000> rotate<0,-44.997030,0> translate<69.215000,0.000000,3.429000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.120000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.120000,0.000000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,90.000000,0> translate<71.120000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<65.659000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,0.000000,24.257000>}
box{<0,0,-0.254000><8.621046,0.035000,0.254000> rotate<0,-44.997030,0> translate<65.659000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,-1.535000,35.687000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,-1.535000,24.257000>}
box{<0,0,-0.254000><11.430000,0.035000,0.254000> rotate<0,-90.000000,0> translate<71.755000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,0.000000,35.687000>}
box{<0,0,-0.254000><9.398000,0.035000,0.254000> rotate<0,-90.000000,0> translate<71.755000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<64.897000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,0.000000,45.085000>}
box{<0,0,-0.254000><6.858000,0.035000,0.254000> rotate<0,0.000000,0> translate<64.897000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,10.033000>}
box{<0,0,-0.254000><5.715000,0.035000,0.254000> rotate<0,-90.000000,0> translate<72.263000,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,-1.535000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,15.748000>}
box{<0,0,-0.254000><8.800651,0.035000,0.254000> rotate<0,44.997030,0> translate<66.040000,-1.535000,21.971000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.755000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,0.000000,45.085000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,0.000000,0> translate<71.755000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<56.388000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,45.847000>}
box{<0,0,-0.254000><22.450640,0.035000,0.254000> rotate<0,-44.997030,0> translate<56.388000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,53.975000>}
box{<0,0,-0.254000><8.128000,0.035000,0.254000> rotate<0,90.000000,0> translate<72.263000,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,0.000000,57.150000>}
box{<0,0,-0.254000><12.065000,0.035000,0.254000> rotate<0,90.000000,0> translate<72.263000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.294000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.025000,-1.535000,36.830000>}
box{<0,0,-0.254000><6.731000,0.035000,0.254000> rotate<0,0.000000,0> translate<66.294000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.850000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.533000,0.000000,19.304000>}
box{<0,0,-0.254000><3.683000,0.035000,0.254000> rotate<0,0.000000,0> translate<69.850000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.660000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.660000,0.000000,5.715000>}
box{<0,0,-0.254000><1.016000,0.035000,0.254000> rotate<0,-90.000000,0> translate<73.660000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<54.229000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.660000,0.000000,6.731000>}
box{<0,0,-0.254000><27.479584,0.035000,0.254000> rotate<0,44.997030,0> translate<54.229000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.533000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,0.000000,20.447000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,-44.997030,0> translate<73.533000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<69.342000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,0.000000,33.528000>}
box{<0,0,-0.254000><5.334000,0.035000,0.254000> rotate<0,0.000000,0> translate<69.342000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<73.025000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,-1.535000,38.481000>}
box{<0,0,-0.254000><2.334867,0.035000,0.254000> rotate<0,-44.997030,0> translate<73.025000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,-1.535000,56.388000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,-44.997030,0> translate<72.263000,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,20.489200>}
box{<0,0,-0.254000><0.086581,0.035000,0.254000> rotate<0,-29.168376,0> translate<74.676000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,33.510800>}
box{<0,0,-0.254000><0.077532,0.035000,0.254000> rotate<0,12.816522,0> translate<74.676000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,-1.535000,38.489200>}
box{<0,0,-0.254000><0.076043,0.035000,0.254000> rotate<0,-6.190012,0> translate<74.676000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.676000,-1.535000,56.388000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,-1.535000,56.489200>}
box{<0,0,-0.254000><0.126320,0.035000,0.254000> rotate<0,-53.235447,0> translate<74.676000,-1.535000,56.388000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,15.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,15.621000>}
box{<0,0,-0.254000><0.121598,0.035000,0.254000> rotate<0,-64.990203,0> translate<74.751600,0.000000,15.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,38.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,38.608000>}
box{<0,0,-0.254000><0.129443,0.035000,0.254000> rotate<0,-66.599403,0> translate<74.751600,0.000000,38.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,51.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,51.562000>}
box{<0,0,-0.254000><0.072549,0.035000,0.254000> rotate<0,-44.885350,0> translate<74.751600,0.000000,51.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,56.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,56.515000>}
box{<0,0,-0.254000><0.057512,0.035000,0.254000> rotate<0,-26.652399,0> translate<74.751600,0.000000,56.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,20.489200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.930000,0.000000,20.574000>}
box{<0,0,-0.254000><0.197529,0.035000,0.254000> rotate<0,-25.421761,0> translate<74.751600,0.000000,20.489200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.751600,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.930000,0.000000,33.528000>}
box{<0,0,-0.254000><0.179227,0.035000,0.254000> rotate<0,-5.506648,0> translate<74.751600,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<76.200000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<76.200000,-1.535000,5.715000>}
box{<0,0,-0.254000><0.381000,0.035000,0.254000> rotate<0,-90.000000,0> translate<76.200000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,-1.535000,10.033000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<76.200000,-1.535000,6.096000>}
box{<0,0,-0.254000><5.567759,0.035000,0.254000> rotate<0,44.997030,0> translate<72.263000,-1.535000,10.033000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<78.359000,0.000000,42.164000>}
box{<0,0,-0.254000><5.028943,0.035000,0.254000> rotate<0,-44.997030,0> translate<74.803000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.515000,0.000000,45.085000>}
box{<0,0,-0.254000><8.252000,0.035000,0.254000> rotate<0,0.000000,0> translate<72.263000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,62.357000>}
box{<0,0,-0.254000><8.261836,0.035000,0.254000> rotate<0,-44.997030,0> translate<74.803000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,62.357000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,62.735000>}
box{<0,0,-0.254000><0.378000,0.035000,0.254000> rotate<0,90.000000,0> translate<80.645000,0.000000,62.735000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.263000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,65.532000>}
box{<0,0,-0.254000><11.853938,0.035000,0.254000> rotate<0,-44.997030,0> translate<72.263000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,65.535000>}
box{<0,0,-0.254000><0.003000,0.035000,0.254000> rotate<0,90.000000,0> translate<80.645000,0.000000,65.535000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.645000,0.000000,62.735000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.772000,0.000000,62.865000>}
box{<0,0,-0.254000><0.181739,0.035000,0.254000> rotate<0,-45.665778,0> translate<80.645000,0.000000,62.735000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<78.359000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.312000,0.000000,42.164000>}
box{<0,0,-0.254000><4.953000,0.035000,0.254000> rotate<0,0.000000,0> translate<78.359000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.312000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.439000,0.000000,42.291000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<83.312000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.315000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.439000,0.000000,45.085000>}
box{<0,0,-0.254000><0.124000,0.035000,0.254000> rotate<0,0.000000,0> translate<83.315000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.439000,0.000000,42.291000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.439000,0.000000,45.085000>}
box{<0,0,-0.254000><2.794000,0.035000,0.254000> rotate<0,90.000000,0> translate<83.439000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,15.621000>}
box{<0,0,-0.254000><12.319000,0.035000,0.254000> rotate<0,0.000000,0> translate<74.803000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,15.875000>}
box{<0,0,-0.254000><1.397000,0.035000,0.254000> rotate<0,-90.000000,0> translate<87.122000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.930000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,20.574000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,0.000000,0> translate<74.930000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.930000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,33.528000>}
box{<0,0,-0.254000><12.192000,0.035000,0.254000> rotate<0,0.000000,0> translate<74.930000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<83.439000,0.000000,42.291000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,38.608000>}
box{<0,0,-0.254000><5.208549,0.035000,0.254000> rotate<0,44.997030,0> translate<83.439000,0.000000,42.291000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<74.803000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,51.562000>}
box{<0,0,-0.254000><12.319000,0.035000,0.254000> rotate<0,0.000000,0> translate<74.803000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<80.772000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,56.515000>}
box{<0,0,-0.254000><8.980256,0.035000,0.254000> rotate<0,44.997030,0> translate<80.772000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,15.510800>}
box{<0,0,-0.254000><0.167693,0.035000,0.254000> rotate<0,41.080361,0> translate<87.122000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,15.510800>}
box{<0,0,-0.254000><0.385511,0.035000,0.254000> rotate<0,70.855376,0> translate<87.122000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,20.489200>}
box{<0,0,-0.254000><0.152210,0.035000,0.254000> rotate<0,33.854876,0> translate<87.122000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,33.510800>}
box{<0,0,-0.254000><0.127565,0.035000,0.254000> rotate<0,7.748472,0> translate<87.122000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,38.489200>}
box{<0,0,-0.254000><0.173466,0.035000,0.254000> rotate<0,43.221827,0> translate<87.122000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,51.510800>}
box{<0,0,-0.254000><0.136376,0.035000,0.254000> rotate<0,22.049607,0> translate<87.122000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,56.489200>}
box{<0,0,-0.254000><0.129006,0.035000,0.254000> rotate<0,11.535635,0> translate<87.122000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,33.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.249000,0.000000,33.274000>}
box{<0,0,-0.254000><0.236801,0.035000,0.254000> rotate<0,89.848895,0> translate<87.248400,0.000000,33.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.248400,0.000000,51.510800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.376000,0.000000,51.308000>}
box{<0,0,-0.254000><0.239603,0.035000,0.254000> rotate<0,57.818437,0> translate<87.248400,0.000000,51.510800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.376000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.376000,0.000000,51.308000>}
box{<0,0,-0.254000><9.779000,0.035000,0.254000> rotate<0,90.000000,0> translate<87.376000,0.000000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.249000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.662000,0.000000,30.861000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,44.997030,0> translate<87.249000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.122000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,19.939000>}
box{<0,0,-0.254000><3.771708,0.035000,0.254000> rotate<0,-44.997030,0> translate<87.122000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,19.939000>}
box{<0,0,-0.254000><10.795000,0.035000,0.254000> rotate<0,-90.000000,0> translate<89.789000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.662000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,30.734000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,44.997030,0> translate<89.662000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.662000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,30.988000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<89.662000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<87.376000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,39.116000>}
box{<0,0,-0.254000><3.412497,0.035000,0.254000> rotate<0,44.997030,0> translate<87.376000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<89.789000,0.000000,39.116000>}
box{<0,0,-0.254000><8.128000,0.035000,0.254000> rotate<0,90.000000,0> translate<89.789000,0.000000,39.116000> }
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
cylinder{<7.730000,0.038000,18.000000><7.730000,-1.538000,18.000000>0.406400}
cylinder{<10.270000,0.038000,18.000000><10.270000,-1.538000,18.000000>0.406400}
cylinder{<56.751600,0.038000,38.489200><56.751600,-1.538000,38.489200>0.596900}
cylinder{<63.000000,0.038000,31.504200><63.000000,-1.538000,31.504200>0.901700 }
cylinder{<63.000000,0.038000,40.495800><63.000000,-1.538000,40.495800>0.901700 }
cylinder{<69.248400,0.038000,38.489200><69.248400,-1.538000,38.489200>0.596900}
cylinder{<63.000000,0.038000,31.504200><63.000000,-1.538000,31.504200>0.901700 }
cylinder{<63.000000,0.038000,40.495800><63.000000,-1.538000,40.495800>0.901700 }
cylinder{<56.751600,0.038000,33.510800><56.751600,-1.538000,33.510800>0.596900}
cylinder{<63.000000,0.038000,31.504200><63.000000,-1.538000,31.504200>0.901700 }
cylinder{<63.000000,0.038000,40.495800><63.000000,-1.538000,40.495800>0.901700 }
cylinder{<69.248400,0.038000,33.510800><69.248400,-1.538000,33.510800>0.596900}
cylinder{<63.000000,0.038000,31.504200><63.000000,-1.538000,31.504200>0.901700 }
cylinder{<63.000000,0.038000,40.495800><63.000000,-1.538000,40.495800>0.901700 }
cylinder{<43.730000,0.038000,18.000000><43.730000,-1.538000,18.000000>0.406400}
cylinder{<46.270000,0.038000,18.000000><46.270000,-1.538000,18.000000>0.406400}
cylinder{<7.730000,0.038000,54.000000><7.730000,-1.538000,54.000000>0.406400}
cylinder{<10.270000,0.038000,54.000000><10.270000,-1.538000,54.000000>0.406400}
cylinder{<43.180000,0.038000,5.715000><43.180000,-1.538000,5.715000>0.508000}
cylinder{<45.720000,0.038000,5.715000><45.720000,-1.538000,5.715000>0.508000}
cylinder{<48.260000,0.038000,5.715000><48.260000,-1.538000,5.715000>0.508000}
cylinder{<50.800000,0.038000,5.715000><50.800000,-1.538000,5.715000>0.508000}
cylinder{<53.340000,0.038000,5.715000><53.340000,-1.538000,5.715000>0.508000}
cylinder{<55.880000,0.038000,5.715000><55.880000,-1.538000,5.715000>0.508000}
cylinder{<58.420000,0.038000,5.715000><58.420000,-1.538000,5.715000>0.508000}
cylinder{<60.960000,0.038000,5.715000><60.960000,-1.538000,5.715000>0.508000}
cylinder{<63.500000,0.038000,5.715000><63.500000,-1.538000,5.715000>0.508000}
cylinder{<66.040000,0.038000,5.715000><66.040000,-1.538000,5.715000>0.508000}
cylinder{<68.580000,0.038000,5.715000><68.580000,-1.538000,5.715000>0.508000}
cylinder{<71.120000,0.038000,5.715000><71.120000,-1.538000,5.715000>0.508000}
cylinder{<73.660000,0.038000,5.715000><73.660000,-1.538000,5.715000>0.508000}
cylinder{<76.200000,0.038000,5.715000><76.200000,-1.538000,5.715000>0.508000}
cylinder{<78.740000,0.038000,5.715000><78.740000,-1.538000,5.715000>0.508000}
cylinder{<81.280000,0.038000,5.715000><81.280000,-1.538000,5.715000>0.508000}
cylinder{<13.605000,0.038000,8.540000><13.605000,-1.538000,8.540000>0.457200}
cylinder{<13.605000,0.038000,6.000000><13.605000,-1.538000,6.000000>0.457200}
cylinder{<16.145000,0.038000,8.540000><16.145000,-1.538000,8.540000>0.457200}
cylinder{<16.145000,0.038000,6.000000><16.145000,-1.538000,6.000000>0.457200}
cylinder{<18.685000,0.038000,8.540000><18.685000,-1.538000,8.540000>0.457200}
cylinder{<18.685000,0.038000,6.000000><18.685000,-1.538000,6.000000>0.457200}
cylinder{<21.225000,0.038000,8.540000><21.225000,-1.538000,8.540000>0.457200}
cylinder{<21.225000,0.038000,6.000000><21.225000,-1.538000,6.000000>0.457200}
cylinder{<23.765000,0.038000,8.540000><23.765000,-1.538000,8.540000>0.457200}
cylinder{<23.765000,0.038000,6.000000><23.765000,-1.538000,6.000000>0.457200}
cylinder{<26.305000,0.038000,8.540000><26.305000,-1.538000,8.540000>0.457200}
cylinder{<26.305000,0.038000,6.000000><26.305000,-1.538000,6.000000>0.457200}
cylinder{<28.845000,0.038000,8.540000><28.845000,-1.538000,8.540000>0.457200}
cylinder{<28.845000,0.038000,6.000000><28.845000,-1.538000,6.000000>0.457200}
cylinder{<31.385000,0.038000,8.540000><31.385000,-1.538000,8.540000>0.457200}
cylinder{<31.385000,0.038000,6.000000><31.385000,-1.538000,6.000000>0.457200}
cylinder{<33.925000,0.038000,8.540000><33.925000,-1.538000,8.540000>0.457200}
cylinder{<33.925000,0.038000,6.000000><33.925000,-1.538000,6.000000>0.457200}
cylinder{<36.465000,0.038000,8.540000><36.465000,-1.538000,8.540000>0.457200}
cylinder{<36.465000,0.038000,6.000000><36.465000,-1.538000,6.000000>0.457200}
cylinder{<74.751600,0.038000,38.489200><74.751600,-1.538000,38.489200>0.596900}
cylinder{<81.000000,0.038000,31.504200><81.000000,-1.538000,31.504200>0.901700 }
cylinder{<81.000000,0.038000,40.495800><81.000000,-1.538000,40.495800>0.901700 }
cylinder{<87.248400,0.038000,38.489200><87.248400,-1.538000,38.489200>0.596900}
cylinder{<81.000000,0.038000,31.504200><81.000000,-1.538000,31.504200>0.901700 }
cylinder{<81.000000,0.038000,40.495800><81.000000,-1.538000,40.495800>0.901700 }
cylinder{<74.751600,0.038000,33.510800><74.751600,-1.538000,33.510800>0.596900}
cylinder{<81.000000,0.038000,31.504200><81.000000,-1.538000,31.504200>0.901700 }
cylinder{<81.000000,0.038000,40.495800><81.000000,-1.538000,40.495800>0.901700 }
cylinder{<87.248400,0.038000,33.510800><87.248400,-1.538000,33.510800>0.596900}
cylinder{<81.000000,0.038000,31.504200><81.000000,-1.538000,31.504200>0.901700 }
cylinder{<81.000000,0.038000,40.495800><81.000000,-1.538000,40.495800>0.901700 }
cylinder{<43.730000,0.038000,54.000000><43.730000,-1.538000,54.000000>0.406400}
cylinder{<46.270000,0.038000,54.000000><46.270000,-1.538000,54.000000>0.406400}
cylinder{<60.460000,0.038000,18.000000><60.460000,-1.538000,18.000000>0.406400}
cylinder{<65.540000,0.038000,18.000000><65.540000,-1.538000,18.000000>0.406400}
cylinder{<63.000000,0.038000,20.540000><63.000000,-1.538000,20.540000>0.406400}
cylinder{<38.751600,0.038000,38.489200><38.751600,-1.538000,38.489200>0.596900}
cylinder{<45.000000,0.038000,31.504200><45.000000,-1.538000,31.504200>0.901700 }
cylinder{<45.000000,0.038000,40.495800><45.000000,-1.538000,40.495800>0.901700 }
cylinder{<51.248400,0.038000,38.489200><51.248400,-1.538000,38.489200>0.596900}
cylinder{<45.000000,0.038000,31.504200><45.000000,-1.538000,31.504200>0.901700 }
cylinder{<45.000000,0.038000,40.495800><45.000000,-1.538000,40.495800>0.901700 }
cylinder{<38.751600,0.038000,33.510800><38.751600,-1.538000,33.510800>0.596900}
cylinder{<45.000000,0.038000,31.504200><45.000000,-1.538000,31.504200>0.901700 }
cylinder{<45.000000,0.038000,40.495800><45.000000,-1.538000,40.495800>0.901700 }
cylinder{<51.248400,0.038000,33.510800><51.248400,-1.538000,33.510800>0.596900}
cylinder{<45.000000,0.038000,31.504200><45.000000,-1.538000,31.504200>0.901700 }
cylinder{<45.000000,0.038000,40.495800><45.000000,-1.538000,40.495800>0.901700 }
cylinder{<2.751600,0.038000,38.489200><2.751600,-1.538000,38.489200>0.596900}
cylinder{<9.000000,0.038000,31.504200><9.000000,-1.538000,31.504200>0.901700 }
cylinder{<9.000000,0.038000,40.495800><9.000000,-1.538000,40.495800>0.901700 }
cylinder{<15.248400,0.038000,38.489200><15.248400,-1.538000,38.489200>0.596900}
cylinder{<9.000000,0.038000,31.504200><9.000000,-1.538000,31.504200>0.901700 }
cylinder{<9.000000,0.038000,40.495800><9.000000,-1.538000,40.495800>0.901700 }
cylinder{<2.751600,0.038000,33.510800><2.751600,-1.538000,33.510800>0.596900}
cylinder{<9.000000,0.038000,31.504200><9.000000,-1.538000,31.504200>0.901700 }
cylinder{<9.000000,0.038000,40.495800><9.000000,-1.538000,40.495800>0.901700 }
cylinder{<15.248400,0.038000,33.510800><15.248400,-1.538000,33.510800>0.596900}
cylinder{<9.000000,0.038000,31.504200><9.000000,-1.538000,31.504200>0.901700 }
cylinder{<9.000000,0.038000,40.495800><9.000000,-1.538000,40.495800>0.901700 }
cylinder{<20.751600,0.038000,56.489200><20.751600,-1.538000,56.489200>0.596900}
cylinder{<27.000000,0.038000,49.504200><27.000000,-1.538000,49.504200>0.901700 }
cylinder{<27.000000,0.038000,58.495800><27.000000,-1.538000,58.495800>0.901700 }
cylinder{<33.248400,0.038000,56.489200><33.248400,-1.538000,56.489200>0.596900}
cylinder{<27.000000,0.038000,49.504200><27.000000,-1.538000,49.504200>0.901700 }
cylinder{<27.000000,0.038000,58.495800><27.000000,-1.538000,58.495800>0.901700 }
cylinder{<20.751600,0.038000,51.510800><20.751600,-1.538000,51.510800>0.596900}
cylinder{<27.000000,0.038000,49.504200><27.000000,-1.538000,49.504200>0.901700 }
cylinder{<27.000000,0.038000,58.495800><27.000000,-1.538000,58.495800>0.901700 }
cylinder{<33.248400,0.038000,51.510800><33.248400,-1.538000,51.510800>0.596900}
cylinder{<27.000000,0.038000,49.504200><27.000000,-1.538000,49.504200>0.901700 }
cylinder{<27.000000,0.038000,58.495800><27.000000,-1.538000,58.495800>0.901700 }
cylinder{<20.751600,0.038000,20.489200><20.751600,-1.538000,20.489200>0.596900}
cylinder{<27.000000,0.038000,13.504200><27.000000,-1.538000,13.504200>0.901700 }
cylinder{<27.000000,0.038000,22.495800><27.000000,-1.538000,22.495800>0.901700 }
cylinder{<33.248400,0.038000,20.489200><33.248400,-1.538000,20.489200>0.596900}
cylinder{<27.000000,0.038000,13.504200><27.000000,-1.538000,13.504200>0.901700 }
cylinder{<27.000000,0.038000,22.495800><27.000000,-1.538000,22.495800>0.901700 }
cylinder{<20.751600,0.038000,15.510800><20.751600,-1.538000,15.510800>0.596900}
cylinder{<27.000000,0.038000,13.504200><27.000000,-1.538000,13.504200>0.901700 }
cylinder{<27.000000,0.038000,22.495800><27.000000,-1.538000,22.495800>0.901700 }
cylinder{<33.248400,0.038000,15.510800><33.248400,-1.538000,15.510800>0.596900}
cylinder{<27.000000,0.038000,13.504200><27.000000,-1.538000,13.504200>0.901700 }
cylinder{<27.000000,0.038000,22.495800><27.000000,-1.538000,22.495800>0.901700 }
cylinder{<74.751600,0.038000,56.489200><74.751600,-1.538000,56.489200>0.596900}
cylinder{<81.000000,0.038000,49.504200><81.000000,-1.538000,49.504200>0.901700 }
cylinder{<81.000000,0.038000,58.495800><81.000000,-1.538000,58.495800>0.901700 }
cylinder{<87.248400,0.038000,56.489200><87.248400,-1.538000,56.489200>0.596900}
cylinder{<81.000000,0.038000,49.504200><81.000000,-1.538000,49.504200>0.901700 }
cylinder{<81.000000,0.038000,58.495800><81.000000,-1.538000,58.495800>0.901700 }
cylinder{<74.751600,0.038000,51.510800><74.751600,-1.538000,51.510800>0.596900}
cylinder{<81.000000,0.038000,49.504200><81.000000,-1.538000,49.504200>0.901700 }
cylinder{<81.000000,0.038000,58.495800><81.000000,-1.538000,58.495800>0.901700 }
cylinder{<87.248400,0.038000,51.510800><87.248400,-1.538000,51.510800>0.596900}
cylinder{<81.000000,0.038000,49.504200><81.000000,-1.538000,49.504200>0.901700 }
cylinder{<81.000000,0.038000,58.495800><81.000000,-1.538000,58.495800>0.901700 }
cylinder{<74.751600,0.038000,20.489200><74.751600,-1.538000,20.489200>0.596900}
cylinder{<81.000000,0.038000,13.504200><81.000000,-1.538000,13.504200>0.901700 }
cylinder{<81.000000,0.038000,22.495800><81.000000,-1.538000,22.495800>0.901700 }
cylinder{<87.248400,0.038000,20.489200><87.248400,-1.538000,20.489200>0.596900}
cylinder{<81.000000,0.038000,13.504200><81.000000,-1.538000,13.504200>0.901700 }
cylinder{<81.000000,0.038000,22.495800><81.000000,-1.538000,22.495800>0.901700 }
cylinder{<74.751600,0.038000,15.510800><74.751600,-1.538000,15.510800>0.596900}
cylinder{<81.000000,0.038000,13.504200><81.000000,-1.538000,13.504200>0.901700 }
cylinder{<81.000000,0.038000,22.495800><81.000000,-1.538000,22.495800>0.901700 }
cylinder{<87.248400,0.038000,15.510800><87.248400,-1.538000,15.510800>0.596900}
cylinder{<81.000000,0.038000,13.504200><81.000000,-1.538000,13.504200>0.901700 }
cylinder{<81.000000,0.038000,22.495800><81.000000,-1.538000,22.495800>0.901700 }
cylinder{<20.751600,0.038000,38.489200><20.751600,-1.538000,38.489200>0.596900}
cylinder{<27.000000,0.038000,31.504200><27.000000,-1.538000,31.504200>0.901700 }
cylinder{<27.000000,0.038000,40.495800><27.000000,-1.538000,40.495800>0.901700 }
cylinder{<33.248400,0.038000,38.489200><33.248400,-1.538000,38.489200>0.596900}
cylinder{<27.000000,0.038000,31.504200><27.000000,-1.538000,31.504200>0.901700 }
cylinder{<27.000000,0.038000,40.495800><27.000000,-1.538000,40.495800>0.901700 }
cylinder{<20.751600,0.038000,33.510800><20.751600,-1.538000,33.510800>0.596900}
cylinder{<27.000000,0.038000,31.504200><27.000000,-1.538000,31.504200>0.901700 }
cylinder{<27.000000,0.038000,40.495800><27.000000,-1.538000,40.495800>0.901700 }
cylinder{<33.248400,0.038000,33.510800><33.248400,-1.538000,33.510800>0.596900}
cylinder{<27.000000,0.038000,31.504200><27.000000,-1.538000,31.504200>0.901700 }
cylinder{<27.000000,0.038000,40.495800><27.000000,-1.538000,40.495800>0.901700 }
//Holes(fast)/Vias
cylinder{<32.385000,0.038000,24.511000><32.385000,-1.538000,24.511000>0.254000 }
cylinder{<52.197000,0.038000,11.430000><52.197000,-1.538000,11.430000>0.254000 }
cylinder{<18.923000,0.038000,3.683000><18.923000,-1.538000,3.683000>0.254000 }
cylinder{<10.668000,0.038000,3.683000><10.668000,-1.538000,3.683000>0.254000 }
cylinder{<34.671000,0.038000,26.670000><34.671000,-1.538000,26.670000>0.254000 }
cylinder{<36.830000,0.038000,24.511000><36.830000,-1.538000,24.511000>0.254000 }
cylinder{<45.212000,0.038000,19.431000><45.212000,-1.538000,19.431000>0.254000 }
cylinder{<60.325000,0.038000,14.351000><60.325000,-1.538000,14.351000>0.254000 }
cylinder{<30.226000,0.038000,10.033000><30.226000,-1.538000,10.033000>0.254000 }
cylinder{<33.020000,0.038000,10.033000><33.020000,-1.538000,10.033000>0.254000 }
cylinder{<20.320000,0.038000,2.540000><20.320000,-1.538000,2.540000>0.254000 }
cylinder{<10.287000,0.038000,34.798000><10.287000,-1.538000,34.798000>0.254000 }
cylinder{<25.654000,0.038000,11.176000><25.654000,-1.538000,11.176000>0.254000 }
cylinder{<29.337000,0.038000,11.176000><29.337000,-1.538000,11.176000>0.254000 }
cylinder{<35.941000,0.038000,12.319000><35.941000,-1.538000,12.319000>0.254000 }
cylinder{<41.783000,0.038000,12.827000><41.783000,-1.538000,12.827000>0.254000 }
cylinder{<43.815000,0.038000,11.811000><43.815000,-1.538000,11.811000>0.254000 }
cylinder{<44.323000,0.038000,9.144000><44.323000,-1.538000,9.144000>0.254000 }
cylinder{<41.783000,0.038000,8.890000><41.783000,-1.538000,8.890000>0.254000 }
cylinder{<10.795000,0.038000,5.207000><10.795000,-1.538000,5.207000>0.254000 }
cylinder{<15.113000,0.038000,0.762000><15.113000,-1.538000,0.762000>0.254000 }
cylinder{<23.241000,0.038000,21.717000><23.241000,-1.538000,21.717000>0.254000 }
cylinder{<19.558000,0.038000,11.557000><19.558000,-1.538000,11.557000>0.254000 }
cylinder{<40.894000,0.038000,26.543000><40.894000,-1.538000,26.543000>0.254000 }
cylinder{<24.130000,0.038000,12.700000><24.130000,-1.538000,12.700000>0.254000 }
cylinder{<29.591000,0.038000,14.986000><29.591000,-1.538000,14.986000>0.254000 }
cylinder{<35.941000,0.038000,13.970000><35.941000,-1.538000,13.970000>0.254000 }
cylinder{<52.197000,0.038000,13.970000><52.197000,-1.538000,13.970000>0.254000 }
cylinder{<54.483000,0.038000,13.970000><54.483000,-1.538000,13.970000>0.254000 }
cylinder{<54.483000,0.038000,8.255000><54.483000,-1.538000,8.255000>0.254000 }
cylinder{<67.056000,0.038000,15.875000><67.056000,-1.538000,15.875000>0.254000 }
cylinder{<13.843000,0.038000,20.955000><13.843000,-1.538000,20.955000>0.254000 }
cylinder{<11.430000,0.038000,24.638000><11.430000,-1.538000,24.638000>0.254000 }
cylinder{<11.430000,0.038000,42.037000><11.430000,-1.538000,42.037000>0.254000 }
cylinder{<71.755000,0.038000,24.257000><71.755000,-1.538000,24.257000>0.254000 }
cylinder{<71.755000,0.038000,35.687000><71.755000,-1.538000,35.687000>0.254000 }
cylinder{<30.099000,0.038000,2.286000><30.099000,-1.538000,2.286000>0.254000 }
cylinder{<41.148000,0.038000,25.146000><41.148000,-1.538000,25.146000>0.254000 }
cylinder{<42.037000,0.038000,32.385000><42.037000,-1.538000,32.385000>0.254000 }
cylinder{<31.496000,0.038000,2.540000><31.496000,-1.538000,2.540000>0.254000 }
cylinder{<42.037000,0.038000,10.287000><42.037000,-1.538000,10.287000>0.254000 }
cylinder{<67.945000,0.038000,18.415000><67.945000,-1.538000,18.415000>0.254000 }
cylinder{<11.938000,0.038000,6.477000><11.938000,-1.538000,6.477000>0.254000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.626600,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.626600,0.000000,71.020300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<9.626600,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.626600,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.406100,0.000000,70.240700>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,45.000705,0> translate<9.626600,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.406100,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.185700,0.000000,71.020300>}
box{<0,0,-0.101600><1.102521,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.406100,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.185700,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.185700,0.000000,68.681600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<11.185700,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.355000,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.134600,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<12.355000,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.134600,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.524400,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<13.134600,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.524400,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.524400,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,-90.000000,0> translate<13.524400,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.524400,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.355000,0.000000,68.681600>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<12.355000,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.355000,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.965300,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<11.965300,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.965300,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.355000,0.000000,69.461100>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<11.965300,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.355000,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.524400,0.000000,69.461100>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<12.355000,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.304000,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.304000,0.000000,71.020300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<14.304000,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.473300,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.304000,0.000000,69.461100>}
box{<0,0,-0.101600><1.405305,0.036000,0.101600> rotate<0,33.686713,0> translate<14.304000,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.304000,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.473300,0.000000,70.240700>}
box{<0,0,-0.101600><1.405361,0.036000,0.101600> rotate<0,-33.690105,0> translate<14.304000,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.422200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.642600,0.000000,68.681600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<16.642600,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.642600,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.252900,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<16.252900,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.252900,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.252900,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<16.252900,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.252900,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.642600,0.000000,70.240700>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<16.252900,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.642600,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.422200,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<16.642600,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.422200,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.812000,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<17.422200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.812000,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.812000,0.000000,69.461100>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.812000,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.812000,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.252900,0.000000,69.461100>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<16.252900,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.591600,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.591600,0.000000,70.240700>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,90.000000,0> translate<18.591600,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.591600,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.371100,0.000000,70.240700>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<18.591600,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.371100,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.760900,0.000000,70.240700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,0.000000,0> translate<19.371100,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.540500,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.540500,0.000000,71.020300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<20.540500,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.540500,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,71.020300>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<20.540500,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,70.630500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<21.709800,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,70.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,70.240700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.099600,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<21.709800,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,69.461100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<21.709800,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,69.071300>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.099600,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.099600,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,68.681600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<21.709800,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.540500,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<20.540500,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.540500,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.709800,0.000000,69.850900>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<20.540500,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.268900,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.048500,0.000000,68.681600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<23.268900,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.048500,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.438300,0.000000,69.071300>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<24.048500,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.438300,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.438300,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<24.438300,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.438300,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.048500,0.000000,70.240700>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<24.048500,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.048500,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.268900,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<23.268900,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.268900,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.879200,0.000000,69.850900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<22.879200,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.879200,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.879200,0.000000,69.071300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.879200,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.879200,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.268900,0.000000,68.681600>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<22.879200,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.607600,0.000000,70.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.607600,0.000000,69.071300>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.607600,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.607600,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.997400,0.000000,68.681600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,44.989680,0> translate<25.607600,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.217900,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.997400,0.000000,70.240700>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<25.217900,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.115700,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.895200,0.000000,68.681600>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<29.115700,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.505400,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.505400,0.000000,71.020300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<29.505400,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.115700,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.895200,0.000000,71.020300>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<29.115700,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.674800,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.674800,0.000000,70.240700>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,90.000000,0> translate<30.674800,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.674800,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.844100,0.000000,70.240700>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<30.674800,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.844100,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.233900,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<31.844100,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.233900,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.233900,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.233900,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.403200,0.000000,70.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.403200,0.000000,69.071300>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.403200,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.403200,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.793000,0.000000,68.681600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,44.989680,0> translate<33.403200,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.013500,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.793000,0.000000,70.240700>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<33.013500,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.741900,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.962300,0.000000,68.681600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<34.962300,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.962300,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.572600,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<34.572600,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.572600,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.572600,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<34.572600,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.572600,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.962300,0.000000,70.240700>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<34.572600,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.962300,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.741900,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<34.962300,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.741900,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.131700,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<35.741900,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.131700,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.131700,0.000000,69.461100>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.131700,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.131700,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.572600,0.000000,69.461100>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<34.572600,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.911300,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.911300,0.000000,70.240700>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,90.000000,0> translate<36.911300,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.911300,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.690800,0.000000,70.240700>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<36.911300,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.690800,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.080600,0.000000,70.240700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,0.000000,0> translate<37.690800,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.249900,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.249900,0.000000,70.630500>}
box{<0,0,-0.101600><1.948900,0.036000,0.101600> rotate<0,90.000000,0> translate<39.249900,0.000000,70.630500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.249900,0.000000,70.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.639700,0.000000,71.020300>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<39.249900,0.000000,70.630500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.860200,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.639700,0.000000,69.850900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<38.860200,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.809000,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.588600,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<40.809000,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.588600,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.978400,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<41.588600,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.978400,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.978400,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.978400,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.978400,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.809000,0.000000,68.681600>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<40.809000,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.809000,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.419300,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<40.419300,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.419300,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.809000,0.000000,69.461100>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<40.419300,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.809000,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.978400,0.000000,69.461100>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<40.809000,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.317100,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.147700,0.000000,70.240700>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<43.147700,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.147700,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.758000,0.000000,69.850900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<42.758000,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.758000,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.758000,0.000000,69.071300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.758000,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.758000,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.147700,0.000000,68.681600>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<42.758000,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.147700,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.317100,0.000000,68.681600>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<43.147700,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.266000,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.486400,0.000000,68.681600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<45.486400,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.486400,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.096700,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<45.096700,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.096700,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.096700,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<45.096700,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.096700,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.486400,0.000000,70.240700>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<45.096700,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.486400,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.266000,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<45.486400,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.266000,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.655800,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<46.266000,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.655800,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.655800,0.000000,69.461100>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.655800,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.655800,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.096700,0.000000,69.461100>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<45.096700,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.774100,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.774100,0.000000,71.020300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<49.774100,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.774100,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,71.020300>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<49.774100,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,70.630500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<50.943400,0.000000,71.020300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,70.630500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,70.240700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.333200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<50.943400,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,69.461100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<50.943400,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,69.071300>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.333200,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.333200,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,68.681600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<50.943400,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.774100,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<49.774100,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.774100,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.943400,0.000000,69.850900>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<49.774100,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.502500,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.282100,0.000000,68.681600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<52.502500,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.282100,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.671900,0.000000,69.071300>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<53.282100,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.671900,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.671900,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<53.671900,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.671900,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.282100,0.000000,70.240700>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<53.282100,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.282100,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.502500,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<52.502500,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.502500,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.112800,0.000000,69.850900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<52.112800,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.112800,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.112800,0.000000,69.071300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.112800,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.112800,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.502500,0.000000,68.681600>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<52.112800,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.841200,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.620800,0.000000,70.240700>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<54.841200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.620800,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.010600,0.000000,69.850900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<55.620800,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.010600,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.010600,0.000000,68.681600>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.010600,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.010600,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.841200,0.000000,68.681600>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<54.841200,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.841200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.451500,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<54.451500,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.451500,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.841200,0.000000,69.461100>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<54.451500,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.841200,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.010600,0.000000,69.461100>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<54.841200,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.790200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.790200,0.000000,70.240700>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,90.000000,0> translate<56.790200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.790200,0.000000,69.461100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.569700,0.000000,70.240700>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<56.790200,0.000000,69.461100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.569700,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.959500,0.000000,70.240700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,0.000000,0> translate<57.569700,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.298200,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.298200,0.000000,68.681600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<60.298200,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.298200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.128800,0.000000,68.681600>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<59.128800,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.128800,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.739100,0.000000,69.071300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<58.739100,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.739100,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.739100,0.000000,69.850900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,90.000000,0> translate<58.739100,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.739100,0.000000,69.850900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.128800,0.000000,70.240700>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<58.739100,0.000000,69.850900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.128800,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.298200,0.000000,70.240700>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,0.000000,0> translate<59.128800,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.416500,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.196000,0.000000,68.681600>}
box{<0,0,-0.101600><1.743104,0.036000,0.101600> rotate<0,63.432232,0> translate<63.416500,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.196000,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.975600,0.000000,70.240700>}
box{<0,0,-0.101600><1.743149,0.036000,0.101600> rotate<0,-63.429293,0> translate<64.196000,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.755200,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.534700,0.000000,71.020300>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<65.755200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.534700,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.534700,0.000000,68.681600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.534700,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.755200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.314300,0.000000,68.681600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<65.755200,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.093900,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.093900,0.000000,69.071300>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,90.000000,0> translate<68.093900,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.093900,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.483600,0.000000,69.071300>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,0.000000,0> translate<68.093900,0.000000,69.071300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.483600,0.000000,69.071300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.483600,0.000000,68.681600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.483600,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.483600,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.093900,0.000000,68.681600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,0.000000,0> translate<68.093900,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.263200,0.000000,70.240700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.042700,0.000000,71.020300>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<69.263200,0.000000,70.240700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.042700,0.000000,71.020300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.042700,0.000000,68.681600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<70.042700,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.263200,0.000000,68.681600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.822300,0.000000,68.681600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<69.263200,0.000000,68.681600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.143500,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<9.601200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.872300,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.872300,0.000000,67.743100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<9.872300,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,67.743100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.143500,0.000000,67.743100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<9.601200,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.692600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.692600,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<10.692600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.692600,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.506000,0.000000,67.200800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<10.692600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.506000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.777200,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<11.506000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.777200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.777200,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.777200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.329700,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.143100,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<12.329700,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.143100,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.414300,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<13.143100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.414300,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.143100,0.000000,66.658500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<13.143100,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.143100,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.600800,0.000000,66.658500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<12.600800,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.600800,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.329700,0.000000,66.929600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<12.329700,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.329700,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.600800,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<12.329700,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.600800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.414300,0.000000,67.200800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<12.600800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.237900,0.000000,67.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.237900,0.000000,66.387300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.237900,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.237900,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.509100,0.000000,66.116200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<14.237900,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.966800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.509100,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<13.966800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.058200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.058200,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<15.058200,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.058200,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.600500,0.000000,67.200800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.058200,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.600500,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.871600,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<15.600500,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.422400,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.422400,0.000000,66.387300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.422400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.422400,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.693500,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<16.422400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.693500,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.507000,0.000000,66.116200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<16.693500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.507000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.507000,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<17.507000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.144100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.330600,0.000000,67.200800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<18.330600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.330600,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.059500,0.000000,66.929600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<18.059500,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.059500,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.059500,0.000000,66.387300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.059500,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.059500,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.330600,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<18.059500,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.330600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.144100,0.000000,66.116200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<18.330600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.967700,0.000000,67.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.967700,0.000000,66.387300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.967700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.967700,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.238900,0.000000,66.116200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<19.967700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.696600,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.238900,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<19.696600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.788000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.059100,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<20.788000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.059100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.059100,0.000000,66.116200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.059100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.788000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.330300,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<20.788000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.059100,0.000000,68.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.059100,0.000000,67.743100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.059100,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.150500,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.692800,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<22.150500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.692800,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.964000,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<22.692800,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.964000,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.964000,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<22.964000,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.964000,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.692800,0.000000,67.200800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<22.692800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.692800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.150500,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<22.150500,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.150500,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.879400,0.000000,66.929600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<21.879400,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.879400,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.879400,0.000000,66.387300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.879400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.879400,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.150500,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<21.879400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.516500,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.516500,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<23.516500,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.516500,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.329900,0.000000,67.200800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<23.516500,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.329900,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.601100,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<24.329900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.601100,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.601100,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.601100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.153600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.967000,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<25.153600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.967000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.238200,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<25.967000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.238200,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.967000,0.000000,66.658500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<25.967000,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.967000,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.424700,0.000000,66.658500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.424700,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.424700,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.153600,0.000000,66.929600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<25.153600,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.153600,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.424700,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<25.153600,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.424700,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.238200,0.000000,67.200800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<25.424700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<26.790700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.929600>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.061800,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.929600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<26.790700,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,67.200800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<26.790700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<26.790700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.061800,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.061800,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<26.790700,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.790700,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<26.790700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.246300,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.246300,0.000000,66.387300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.246300,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.246300,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.517400,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.246300,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.517400,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.788600,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<29.517400,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.788600,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.059700,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.788600,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.059700,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.330900,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<30.059700,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.330900,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.330900,0.000000,67.200800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<30.330900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<30.883400,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,66.116200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.154500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.425700,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<30.883400,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,68.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,67.743100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.154500,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974800,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974800,0.000000,67.743100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<31.974800,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.788200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974800,0.000000,66.658500>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,33.689470,0> translate<31.974800,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.974800,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.788200,0.000000,67.200800>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,-33.689470,0> translate<31.974800,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.339000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.610100,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<33.339000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.610100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.610100,0.000000,66.116200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.610100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.339000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.881300,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<33.339000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.610100,0.000000,68.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.610100,0.000000,67.743100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.610100,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.430400,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.430400,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<34.430400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.430400,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.701500,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.430400,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.701500,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.701500,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.701500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.701500,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.430400,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.430400,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.248900,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.248900,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<35.248900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.248900,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.520000,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<35.248900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.520000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.791200,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<35.520000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.791200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.791200,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.791200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.791200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.062300,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<35.791200,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.062300,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.333500,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<36.062300,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.333500,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.333500,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.333500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.699400,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<37.157100,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.699400,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.970600,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<37.699400,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.970600,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.970600,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.970600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.970600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157100,0.000000,66.116200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<37.157100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157100,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.886000,0.000000,66.387300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<36.886000,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.886000,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157100,0.000000,66.658500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<36.886000,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157100,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.970600,0.000000,66.658500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<37.157100,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,67.743100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<38.523100,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.336500,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,66.658500>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,33.689470,0> translate<38.523100,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.336500,0.000000,67.200800>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,-33.689470,0> translate<38.523100,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.700700,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158400,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<40.158400,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158400,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887300,0.000000,66.387300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<39.887300,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887300,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887300,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<39.887300,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887300,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158400,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<39.887300,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158400,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.700700,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<40.158400,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.700700,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.971900,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<40.700700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.971900,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.971900,0.000000,66.658500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.971900,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.971900,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887300,0.000000,66.658500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<39.887300,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.524400,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.524400,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<41.524400,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.524400,0.000000,66.658500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.066700,0.000000,67.200800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.524400,0.000000,66.658500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.066700,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.337800,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<42.066700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.888600,0.000000,67.743100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.888600,0.000000,66.116200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.888600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.888600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.702000,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.888600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.702000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.973200,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<43.702000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.973200,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.973200,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<43.973200,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.973200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.702000,0.000000,67.200800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<43.702000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.702000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.888600,0.000000,67.200800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.888600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.796800,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339100,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<44.796800,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339100,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.610300,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<45.339100,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.610300,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.610300,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<45.610300,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.610300,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339100,0.000000,67.200800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<45.339100,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.796800,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<44.796800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.796800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.525700,0.000000,66.929600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<44.525700,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.525700,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.525700,0.000000,66.387300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.525700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.525700,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.796800,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<44.525700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.433900,0.000000,67.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.433900,0.000000,66.387300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.433900,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.433900,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.705100,0.000000,66.116200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<46.433900,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.162800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.705100,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<46.162800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.254200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.254200,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<47.254200,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.254200,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.525300,0.000000,66.387300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<47.254200,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.525300,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.525300,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.525300,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.525300,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.254200,0.000000,66.116200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<47.254200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.157300,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.343800,0.000000,67.200800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<48.343800,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.343800,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.072700,0.000000,66.929600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<48.072700,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.072700,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.072700,0.000000,66.387300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.072700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.072700,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.343800,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<48.072700,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.343800,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.157300,0.000000,66.116200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<48.343800,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.980900,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.523200,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<49.980900,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.523200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.794400,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<50.523200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.794400,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.794400,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<50.794400,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.794400,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.523200,0.000000,67.200800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<50.523200,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.523200,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.980900,0.000000,67.200800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<49.980900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.980900,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.709800,0.000000,66.929600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<49.709800,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.709800,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.709800,0.000000,66.387300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.709800,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.709800,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.980900,0.000000,66.116200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<49.709800,0.000000,66.387300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.346900,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.346900,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<51.346900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.346900,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.618000,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<51.346900,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.618000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.889200,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<51.618000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.889200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.889200,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.889200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.889200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.160300,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<51.889200,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.160300,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.431500,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<52.160300,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.431500,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.431500,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.431500,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.984000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.068600,0.000000,67.743100>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-56.306216,0> translate<52.984000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.621100,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.621100,0.000000,67.200800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<54.621100,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.621100,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.892200,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<54.621100,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.892200,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.163400,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<54.892200,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.163400,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.163400,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.163400,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.163400,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.434500,0.000000,67.200800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<55.163400,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.434500,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.705700,0.000000,66.929600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<55.434500,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.705700,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.705700,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.705700,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.258200,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.529300,0.000000,67.200800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<56.258200,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.529300,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.529300,0.000000,66.116200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.529300,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.258200,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.800500,0.000000,66.116200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<56.258200,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.529300,0.000000,68.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.529300,0.000000,67.743100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.529300,0.000000,67.743100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.349600,0.000000,67.743100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.349600,0.000000,66.116200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.349600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.349600,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.163000,0.000000,66.116200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<57.349600,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.163000,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.434200,0.000000,66.387300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<58.163000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.434200,0.000000,66.387300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.434200,0.000000,66.929600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<58.434200,0.000000,66.929600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.434200,0.000000,66.929600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.163000,0.000000,67.200800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<58.163000,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.163000,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.349600,0.000000,67.200800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<57.349600,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.986700,0.000000,67.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.529000,0.000000,67.743100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.986700,0.000000,67.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.529000,0.000000,67.743100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.529000,0.000000,66.116200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.529000,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.986700,0.000000,66.116200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.071300,0.000000,66.116200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<58.986700,0.000000,66.116200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.601200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414600,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.601200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.685800,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<10.414600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.685800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.685800,0.000000,64.932000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<10.685800,0.000000,64.932000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.685800,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414600,0.000000,65.203100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<10.414600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414600,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.601200,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.601200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.051700,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.509400,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<11.509400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.509400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.238300,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<11.238300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.238300,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.238300,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<11.238300,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.238300,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.509400,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<11.238300,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.509400,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.051700,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<11.509400,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.051700,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.322900,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<12.051700,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.322900,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.322900,0.000000,64.118500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.322900,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.322900,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.238300,0.000000,64.118500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.238300,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.875400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.688800,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<12.875400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.688800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.960000,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<13.688800,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.960000,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.688800,0.000000,64.118500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<13.688800,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.688800,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.146500,0.000000,64.118500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<13.146500,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.146500,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.875400,0.000000,64.389600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<12.875400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.875400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.146500,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<12.875400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.146500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.960000,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<13.146500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.512500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.783600,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<14.512500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.783600,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.783600,0.000000,63.576200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.783600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.512500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.054800,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<14.512500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.783600,0.000000,65.474300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.783600,0.000000,65.203100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.783600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.146200,0.000000,63.033900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.417300,0.000000,63.033900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<16.146200,0.000000,63.033900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.417300,0.000000,63.033900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.688500,0.000000,63.305100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.417300,0.000000,63.033900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.688500,0.000000,63.305100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.688500,0.000000,64.660800>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,90.000000,0> translate<16.688500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.688500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.603900,0.000000,64.389600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<15.603900,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.603900,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.603900,0.000000,63.847300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.603900,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.603900,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<15.603900,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.688500,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.241000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.241000,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<17.241000,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.241000,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.054400,0.000000,64.660800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.241000,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.054400,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.325600,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<18.054400,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.325600,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.325600,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.325600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.515200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.515200,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<20.515200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.515200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<20.515200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<21.328600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.660800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.599800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.328600,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<21.328600,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,63.847300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.599800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.599800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,63.576200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<21.328600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.515200,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<20.515200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.515200,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.328600,0.000000,64.389600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<20.515200,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.152300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.152300,0.000000,63.847300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.152300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.152300,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423400,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<22.152300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.236900,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<22.423400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.236900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.236900,0.000000,63.305100>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.236900,0.000000,63.305100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.236900,0.000000,63.305100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.965700,0.000000,63.033900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.965700,0.000000,63.033900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.965700,0.000000,63.033900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.694600,0.000000,63.033900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<22.694600,0.000000,63.033900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<23.789400,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,64.389600>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.060500,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,64.389600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<23.789400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,64.660800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<23.789400,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,63.847300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<23.789400,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,63.576200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.060500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.060500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,63.576200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<23.789400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.789400,0.000000,63.847300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<23.789400,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.245000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.245000,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<26.245000,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.245000,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.787300,0.000000,64.660800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<26.245000,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.787300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.329600,0.000000,65.203100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.787300,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.329600,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.329600,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.329600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.153200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.695500,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<28.153200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.695500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.966700,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<28.695500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.966700,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.966700,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.966700,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.966700,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.153200,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<28.153200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.153200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.882100,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<27.882100,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.882100,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.153200,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<27.882100,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.153200,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.966700,0.000000,64.118500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<28.153200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.519200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.519200,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<29.519200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.332600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.519200,0.000000,64.118500>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,33.689470,0> translate<29.519200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.519200,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.332600,0.000000,64.660800>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,-33.689470,0> translate<29.519200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.696800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<31.154500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<30.883400,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<30.883400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<30.883400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.154500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.696800,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<31.154500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.696800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.968000,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<31.696800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.968000,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.968000,0.000000,64.118500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.968000,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.968000,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.883400,0.000000,64.118500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<30.883400,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.520500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.520500,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<32.520500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.520500,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.062800,0.000000,64.660800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.520500,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.062800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.333900,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<33.062800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.884700,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.884700,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<33.884700,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.884700,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<33.884700,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<34.698100,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.660800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.969300,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.698100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<34.698100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,63.847300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.969300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.969300,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,63.576200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<34.698100,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.884700,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<33.884700,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.884700,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.698100,0.000000,64.389600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<33.884700,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792900,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.335200,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<35.792900,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.335200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.606400,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<36.335200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.606400,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.606400,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<36.606400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.606400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.335200,0.000000,64.660800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<36.335200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.335200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792900,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<35.792900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.521800,0.000000,64.389600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<35.521800,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.521800,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.521800,0.000000,63.847300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.521800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.521800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792900,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<35.521800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,63.847300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.430000,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.430000,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.701200,0.000000,63.576200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<37.430000,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.158900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.701200,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<37.158900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.429700,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.887400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.158500,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<40.158500,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.887400,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.429700,0.000000,65.203100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.887400,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.978800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.978800,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<40.978800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.978800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.792200,0.000000,64.660800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<40.978800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.792200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.063400,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<41.792200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.063400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.063400,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.063400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.700500,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.700500,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.700500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.700500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.887000,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<42.887000,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.887000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.615900,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<42.615900,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.615900,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.615900,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<42.615900,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.615900,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.887000,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<42.615900,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.887000,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.700500,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<42.887000,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.253000,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.253000,0.000000,63.847300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.253000,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.253000,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.524100,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<44.253000,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.524100,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.337600,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<44.524100,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.337600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.337600,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<45.337600,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.890100,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.703500,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<45.890100,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.703500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.974700,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<46.703500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.974700,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.703500,0.000000,64.118500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<46.703500,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.703500,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.161200,0.000000,64.118500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<46.161200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.161200,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.890100,0.000000,64.389600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<45.890100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.890100,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.161200,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<45.890100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.161200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.974700,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<46.161200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.798300,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.798300,0.000000,63.847300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.798300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.798300,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.069500,0.000000,63.576200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<47.798300,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.527200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.069500,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<47.527200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.618600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.618600,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<48.618600,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.618600,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.160900,0.000000,64.660800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.618600,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.160900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.432000,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<49.160900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.982800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.253900,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<49.982800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.253900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.253900,0.000000,63.576200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.253900,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.982800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.525100,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<49.982800,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.253900,0.000000,65.474300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.253900,0.000000,65.203100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.253900,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.887600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.345300,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<51.345300,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.345300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.074200,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<51.074200,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.074200,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.074200,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<51.074200,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.074200,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.345300,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<51.074200,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.345300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.887600,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<51.345300,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.887600,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.158800,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<51.887600,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.158800,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.158800,0.000000,64.118500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.158800,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.158800,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.074200,0.000000,64.118500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<51.074200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.711300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.524700,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<52.711300,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.524700,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795900,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<53.524700,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795900,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.524700,0.000000,64.118500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<53.524700,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.524700,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.982400,0.000000,64.118500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<52.982400,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.982400,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.711300,0.000000,64.389600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<52.711300,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.711300,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.982400,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<52.711300,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.982400,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795900,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<52.982400,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.226200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.226200,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.226200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.226200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.310800,0.000000,63.576200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<57.226200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.863300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.134400,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<58.863300,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.134400,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.134400,0.000000,63.576200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.134400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.863300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.405600,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<58.863300,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.134400,0.000000,65.474300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.134400,0.000000,65.203100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.134400,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.039300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.225800,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<60.225800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.225800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.954700,0.000000,64.389600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<59.954700,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.954700,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.954700,0.000000,63.847300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.954700,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.954700,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.225800,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<59.954700,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.225800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.039300,0.000000,63.576200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<60.225800,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.405200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.862900,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<61.862900,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.862900,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.591800,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<61.591800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.591800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.591800,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<61.591800,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.591800,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.862900,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<61.591800,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.862900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.405200,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<61.862900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.405200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.676400,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<62.405200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.676400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.676400,0.000000,64.118500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.676400,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.676400,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.591800,0.000000,64.118500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<61.591800,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.228900,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.228900,0.000000,64.660800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<63.228900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.228900,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.042300,0.000000,64.660800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<63.228900,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.042300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.313500,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<64.042300,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.313500,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.313500,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.313500,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.866000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.679400,0.000000,63.576200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<64.866000,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.679400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.950600,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<65.679400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.950600,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.679400,0.000000,64.118500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<65.679400,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.679400,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.137100,0.000000,64.118500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<65.137100,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.137100,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.866000,0.000000,64.389600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<64.866000,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.866000,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.137100,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<64.866000,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.137100,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.950600,0.000000,64.660800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<65.137100,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.316500,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.774200,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<66.774200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.774200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503100,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<66.503100,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503100,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503100,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<66.503100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503100,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.774200,0.000000,64.660800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<66.503100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.774200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.316500,0.000000,64.660800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<66.774200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.316500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.587700,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<67.316500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.587700,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.587700,0.000000,64.118500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.587700,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.587700,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503100,0.000000,64.118500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<66.503100,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,64.660800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<68.140200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,64.389600>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.411300,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,64.389600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<68.140200,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,64.660800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<68.140200,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,63.847300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<68.140200,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,63.576200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.411300,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.411300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,63.576200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<68.140200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.140200,0.000000,63.847300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<68.140200,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.680400,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.409200,0.000000,65.203100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<71.409200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.409200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866900,0.000000,65.203100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<70.866900,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866900,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.595800,0.000000,64.932000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.595800,0.000000,64.932000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.595800,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.595800,0.000000,63.847300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.595800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.595800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866900,0.000000,63.576200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<70.595800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866900,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.409200,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<70.866900,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.409200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.680400,0.000000,63.847300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<71.409200,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.680400,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.680400,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<71.680400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.680400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.138100,0.000000,64.389600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<71.138100,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.232900,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.232900,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<72.232900,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.232900,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.046300,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<72.232900,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.046300,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.317500,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<73.046300,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.317500,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.317500,0.000000,64.389600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.317500,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.317500,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.046300,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<73.046300,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.046300,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.232900,0.000000,64.118500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<72.232900,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.870000,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.870000,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.870000,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.870000,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.954600,0.000000,63.576200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<73.870000,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.507100,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.049400,0.000000,63.576200>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,63.430762,0> translate<75.507100,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.049400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.591700,0.000000,64.660800>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,-63.430762,0> translate<76.049400,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.144200,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.415300,0.000000,65.203100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.144200,0.000000,64.932000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.415300,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,65.203100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<77.415300,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<77.957600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.660800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.228800,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,64.389600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.957600,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.686500,0.000000,64.389600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<77.686500,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<77.957600,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,63.847300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.228800,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.228800,0.000000,63.847300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,63.576200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<77.957600,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.957600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.415300,0.000000,63.576200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<77.415300,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.415300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.144200,0.000000,63.847300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<77.144200,0.000000,63.847300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.621200,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.163500,0.000000,9.958100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.621200,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.163500,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.163500,0.000000,8.331200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.163500,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.621200,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.705800,0.000000,8.331200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<42.621200,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.245800,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.161200,0.000000,8.331200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<45.161200,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.161200,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.245800,0.000000,9.415800>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.161200,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.245800,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.245800,0.000000,9.687000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<46.245800,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.245800,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974600,0.000000,9.958100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<45.974600,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974600,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.432300,0.000000,9.958100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<45.432300,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.432300,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.161200,0.000000,9.687000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.161200,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.701200,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.972300,0.000000,9.958100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.701200,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.972300,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,9.958100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<47.972300,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,9.687000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<48.514600,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,9.415800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.785800,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,9.144600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.514600,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.243500,0.000000,9.144600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<48.243500,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,8.873500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<48.514600,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,8.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,8.602300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.785800,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.785800,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,8.331200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<48.514600,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.972300,0.000000,8.331200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<47.972300,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.972300,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.701200,0.000000,8.602300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<47.701200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054600,0.000000,9.958100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<51.054600,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054600,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.241200,0.000000,9.144600>}
box{<0,0,-0.076200><1.150392,0.036000,0.076200> rotate<0,-45.000552,0> translate<50.241200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.241200,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.325800,0.000000,9.144600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<50.241200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.865800,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.781200,0.000000,9.958100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<52.781200,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.781200,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.781200,0.000000,9.144600>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.781200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.781200,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.323500,0.000000,9.415800>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,-26.567524,0> translate<52.781200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.323500,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594600,0.000000,9.415800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<53.323500,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594600,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.865800,0.000000,9.144600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<53.594600,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.865800,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.865800,0.000000,8.602300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.865800,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.865800,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594600,0.000000,8.331200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<53.594600,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.052300,0.000000,8.331200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<53.052300,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.052300,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.781200,0.000000,8.602300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<52.781200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.405800,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.863500,0.000000,9.687000>}
box{<0,0,-0.076200><0.606287,0.036000,0.076200> rotate<0,-26.559072,0> translate<55.863500,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.863500,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.321200,0.000000,9.144600>}
box{<0,0,-0.076200><0.766999,0.036000,0.076200> rotate<0,-45.002312,0> translate<55.321200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.321200,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.321200,0.000000,8.602300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.321200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.321200,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.592300,0.000000,8.331200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<55.321200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.592300,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134600,0.000000,8.331200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<55.592300,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.405800,0.000000,8.602300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<56.134600,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.405800,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.405800,0.000000,8.873500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<56.405800,0.000000,8.873500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.405800,0.000000,8.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134600,0.000000,9.144600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<56.134600,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134600,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.321200,0.000000,9.144600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<55.321200,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,9.958100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<57.861200,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,9.687000>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.945800,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,8.602300>}
box{<0,0,-0.076200><1.533927,0.036000,0.076200> rotate<0,-44.999671,0> translate<57.861200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,8.331200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.861200,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,9.958100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.401200,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,9.958100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.672300,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,9.687000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<61.214600,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,9.415800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.485800,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,9.144600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.214600,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,8.873500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<61.214600,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,8.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,8.602300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.485800,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.485800,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,8.331200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<61.214600,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,8.331200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.672300,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,8.602300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<60.401200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,8.873500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<60.401200,0.000000,8.873500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,8.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,9.144600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.401200,0.000000,8.873500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,9.415800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<60.401200,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.401200,0.000000,9.687000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<60.401200,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.672300,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214600,0.000000,9.144600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<60.672300,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.941200,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,8.331200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<62.941200,0.000000,8.602300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.754600,0.000000,8.331200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<63.212300,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.754600,0.000000,8.331200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.025800,0.000000,8.602300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<63.754600,0.000000,8.331200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.025800,0.000000,8.602300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.025800,0.000000,9.687000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<64.025800,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.025800,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.754600,0.000000,9.958100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<63.754600,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.754600,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,9.958100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<63.212300,0.000000,9.958100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,9.958100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.941200,0.000000,9.687000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.941200,0.000000,9.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.941200,0.000000,9.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.941200,0.000000,9.415800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.941200,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.941200,0.000000,9.415800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,9.144600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<62.941200,0.000000,9.415800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.212300,0.000000,9.144600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.025800,0.000000,9.144600>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<63.212300,0.000000,9.144600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.844700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<65.454900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<65.454900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<66.624200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.429400,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.649800,0.000000,9.475100>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.649800,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.649800,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,9.669900>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<65.454900,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,10.059700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<65.454900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.454900,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.649800,0.000000,10.254600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<65.454900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.649800,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.429400,0.000000,10.254600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.649800,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.429400,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,10.059700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<66.429400,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,9.669900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<66.624200,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.624200,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.429400,0.000000,9.475100>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<66.429400,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.429400,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.649800,0.000000,10.254600>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,44.993355,0> translate<65.649800,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.384700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.994900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<67.994900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.994900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<67.994900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<69.164200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.384700,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.994900,0.000000,9.864800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<67.994900,0.000000,9.864800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.994900,0.000000,9.864800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,9.864800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<67.994900,0.000000,9.864800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.164200,0.000000,10.254600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<69.164200,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.924700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<70.534900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<70.534900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<71.704200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,9.475100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<71.704200,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.704200,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.924700,0.000000,10.254600>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,44.997030,0> translate<70.924700,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.924700,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.729800,0.000000,10.254600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<70.729800,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.729800,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,10.059700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<70.534900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,9.669900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<70.534900,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.534900,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.729800,0.000000,9.475100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<70.534900,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.464700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<73.074900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<73.074900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<74.244200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.269800,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,9.669900>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<73.074900,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,10.059700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<73.074900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.074900,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.269800,0.000000,10.254600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<73.074900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.269800,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.464700,0.000000,10.254600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<73.269800,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.464700,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.659600,0.000000,10.059700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<73.464700,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.659600,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.659600,0.000000,9.864800>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<73.659600,0.000000,9.864800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.659600,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.854500,0.000000,10.254600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<73.659600,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<73.854500,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.049400,0.000000,10.254600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<73.854500,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.049400,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,10.059700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<74.049400,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,9.669900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<74.244200,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.244200,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.049400,0.000000,9.475100>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<74.049400,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.004700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.614900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<75.614900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.614900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.784200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<75.614900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.784200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.784200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<76.784200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.784200,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.614900,0.000000,10.059700>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<75.614900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.614900,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.199600,0.000000,9.475100>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,44.992130,0> translate<75.614900,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.199600,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.199600,0.000000,10.254600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<76.199600,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.544700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.154900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<78.154900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.154900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<78.154900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<79.324200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.154900,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.154900,0.000000,9.475100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<78.154900,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.154900,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.739600,0.000000,9.475100>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<78.154900,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.739600,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.544700,0.000000,9.864800>}
box{<0,0,-0.050800><0.435720,0.036000,0.050800> rotate<0,63.424882,0> translate<78.544700,0.000000,9.864800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.544700,0.000000,9.864800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.544700,0.000000,10.059700>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<78.544700,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.544700,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.739600,0.000000,10.254600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<78.544700,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.739600,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.129400,0.000000,10.254600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<78.739600,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.129400,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,10.059700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<79.129400,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,9.669900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<79.324200,0.000000,9.669900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.324200,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.129400,0.000000,9.475100>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<79.129400,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.084700,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.694900,0.000000,8.695500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<80.694900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.694900,0.000000,8.695500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,8.695500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<80.694900,0.000000,8.695500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,9.085300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<81.864200,0.000000,9.085300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.694900,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.889800,0.000000,9.864800>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,63.430762,0> translate<80.694900,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.889800,0.000000,9.864800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.279600,0.000000,9.475100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<80.889800,0.000000,9.864800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.279600,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.669400,0.000000,9.475100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<81.279600,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.669400,0.000000,9.475100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,9.669900>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<81.669400,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,9.669900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,10.059700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<81.864200,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.864200,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.669400,0.000000,10.254600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<81.669400,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.669400,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.474500,0.000000,10.254600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<81.474500,0.000000,10.254600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.474500,0.000000,10.254600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.279600,0.000000,10.059700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<81.279600,0.000000,10.059700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.279600,0.000000,10.059700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.279600,0.000000,9.475100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<81.279600,0.000000,9.475100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.739100,0.000000,1.668600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.511900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<42.582300,0.000000,1.511900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.511900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.198300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.582300,0.000000,1.198300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.198300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.739100,0.000000,1.041600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<42.582300,0.000000,1.198300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.739100,0.000000,1.041600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,1.041600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<42.739100,0.000000,1.041600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,1.041600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,1.198300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.366200,0.000000,1.041600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,1.198300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,1.511900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<43.522900,0.000000,1.511900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,1.511900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,1.668600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<43.366200,0.000000,1.668600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,1.668600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.052600,0.000000,1.668600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<43.052600,0.000000,1.668600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.052600,0.000000,1.668600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.052600,0.000000,1.355100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.052600,0.000000,1.355100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<42.582300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,2.604100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<42.582300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,2.604100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<42.582300,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,2.912600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<42.582300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,3.382900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<43.522900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.522900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,3.539600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<43.366200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.366200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.739100,0.000000,3.539600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<42.739100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.739100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,3.382900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<42.582300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.582300,0.000000,2.912600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.582300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,1.041600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,1.668600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<45.592600,0.000000,1.668600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.279100,0.000000,1.355100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.906200,0.000000,1.355100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<45.279100,0.000000,1.355100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.122300,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.122300,0.000000,1.977100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.122300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.122300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<45.122300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.435900,0.000000,2.290600>}
box{<0,0,-0.038100><0.350481,0.036000,0.038100> rotate<0,63.438073,0> translate<45.435900,0.000000,2.290600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.435900,0.000000,2.290600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.435900,0.000000,2.447400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<45.435900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.435900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.435900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.592600,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.906200,0.000000,2.604100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<45.592600,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.906200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,2.447400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<45.906200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,2.133800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.062900,0.000000,2.133800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,2.133800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.906200,0.000000,1.977100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.906200,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.122300,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.749400,0.000000,2.912600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<45.122300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.749400,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,3.226100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.749400,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.062900,0.000000,3.226100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.749400,0.000000,3.539600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<45.749400,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.749400,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.122300,0.000000,3.539600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<45.122300,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.662300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.289400,0.000000,1.977100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<47.662300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.289400,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,2.290600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<48.289400,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,2.290600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.289400,0.000000,2.604100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<48.289400,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.289400,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.662300,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<47.662300,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,3.382900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<48.602900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.446200,0.000000,3.539600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<48.446200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.446200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.132600,0.000000,3.539600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<48.132600,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.132600,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.975900,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.975900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.975900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.975900,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.975900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.975900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.132600,0.000000,2.912600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<47.975900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.132600,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.446200,0.000000,2.912600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<48.132600,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.446200,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.602900,0.000000,3.069300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<48.446200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<50.202300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<50.202300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.359100,0.000000,2.604100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<50.202300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.359100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,2.604100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<50.359100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<50.672600,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<50.829400,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,2.290600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,2.604100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<50.829400,0.000000,2.290600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.359100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,3.382900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<50.202300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<50.202300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.202300,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.359100,0.000000,2.912600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<50.202300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.359100,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.515900,0.000000,2.912600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<50.359100,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.515900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,3.069300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<50.515900,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,3.382900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<50.672600,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.672600,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,3.539600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<50.672600,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.829400,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.986200,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<50.829400,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.986200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<50.986200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.142900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.142900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.986200,0.000000,2.912600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<50.986200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,1.041600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,1.041600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<52.742300,0.000000,1.041600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,1.041600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,1.511900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<52.742300,0.000000,1.511900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,1.511900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.899100,0.000000,1.668600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<52.742300,0.000000,1.511900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.899100,0.000000,1.668600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.212600,0.000000,1.668600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<52.899100,0.000000,1.668600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.212600,0.000000,1.668600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,1.511900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<53.212600,0.000000,1.668600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,1.511900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,1.041600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.369400,0.000000,1.041600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,1.355100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,1.668600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.369400,0.000000,1.355100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,2.604100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<52.742300,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,2.912600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<52.742300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,3.226100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<53.369400,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.369400,0.000000,3.226100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,3.539600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.369400,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.682900,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.742300,0.000000,3.539600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<52.742300,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,1.345900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,0.854500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<55.282500,0.000000,0.854500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,0.854500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,0.854500>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<55.282500,0.000000,0.854500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,0.854500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,1.345900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<56.019700,0.000000,1.345900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,0.854500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,1.100200>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<55.651100,0.000000,1.100200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,1.602900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,1.602900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<55.282500,0.000000,1.602900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,1.602900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.094300>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,-33.684257,0> translate<55.282500,0.000000,1.602900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.094300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,2.094300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<55.282500,0.000000,2.094300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.351300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,2.351300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<55.282500,0.000000,2.351300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,2.351300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,2.719900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<55.282500,0.000000,2.719900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,2.719900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.405400,0.000000,2.842700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<55.282500,0.000000,2.719900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.405400,0.000000,2.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.528300,0.000000,2.842700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<55.405400,0.000000,2.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.528300,0.000000,2.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,2.719900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<55.528300,0.000000,2.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,2.719900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.774000,0.000000,2.842700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<55.651100,0.000000,2.719900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.774000,0.000000,2.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.896900,0.000000,2.842700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<55.774000,0.000000,2.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.896900,0.000000,2.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.719900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<55.896900,0.000000,2.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.719900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,2.351300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.019700,0.000000,2.351300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,2.351300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.651100,0.000000,2.719900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<55.651100,0.000000,2.719900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.282500,0.000000,3.099700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,3.099700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<55.282500,0.000000,3.099700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,3.099700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.019700,0.000000,3.591100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<56.019700,0.000000,3.591100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<57.822300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<58.762900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<58.606200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<57.979100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<57.822300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.822300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,2.912600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<57.979100,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,3.069300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<57.822300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,3.382900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<57.822300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.822300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,3.539600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<57.822300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,3.539600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<57.979100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<58.606200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.762900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.762900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,2.912600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.606200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.606200,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.979100,0.000000,3.539600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<57.979100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.362300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<61.302900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.146200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.146200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.146200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<60.519100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<60.362300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.362300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.675900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,3.226100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<60.362300,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.362300,0.000000,3.226100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,3.226100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.362300,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.302900,0.000000,3.539600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<61.302900,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<62.902300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<63.842900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.686200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<63.686200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.686200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.059100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<63.059100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.059100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<62.902300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.902300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,2.912600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.842900,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.842900,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.215900,0.000000,3.539600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<63.215900,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.215900,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.059100,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<63.059100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.059100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,3.382900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<62.902300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.902300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.902300,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.059100,0.000000,2.912600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<62.902300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<65.442300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<66.382900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.226200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<66.226200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.226200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.599100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<65.599100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.599100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<65.442300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.442300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.599100,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,3.069300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<65.442300,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,3.382900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<65.442300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.442300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.599100,0.000000,3.539600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<65.442300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.599100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.755900,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<65.599100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.755900,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.912600,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.755900,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.912600,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.912600,0.000000,3.226100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.912600,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.912600,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.069400,0.000000,3.539600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<65.912600,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.069400,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.226200,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<66.069400,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.226200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<66.226200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.382900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.382900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.226200,0.000000,2.912600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<66.226200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.922900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<67.982300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.922900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.922900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<68.922900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.922900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.766200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<68.766200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.766200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.139100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<68.139100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.139100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<67.982300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<67.982300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.922900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,3.382900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<67.982300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.982300,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.452600,0.000000,2.912600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<67.982300,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.452600,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.452600,0.000000,3.539600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<68.452600,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<70.522300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<71.462900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.306200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<71.306200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.306200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.679100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<70.679100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.679100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<70.522300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<70.522300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,2.912600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<70.522300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.522300,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.992600,0.000000,2.912600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<70.522300,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.992600,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.835900,0.000000,3.226100>}
box{<0,0,-0.038100><0.350481,0.036000,0.038100> rotate<0,63.438073,0> translate<70.835900,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.835900,0.000000,3.226100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.835900,0.000000,3.382900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<70.835900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.835900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.992600,0.000000,3.539600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<70.835900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.992600,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.306200,0.000000,3.539600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<70.992600,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.306200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,3.382900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<71.306200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,3.069300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<71.462900,0.000000,3.069300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.462900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<71.306200,0.000000,2.912600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<71.306200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.062300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<73.062300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<74.002900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<73.846200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.219100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<73.219100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.219100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.062300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<73.062300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.062300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.062300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<73.062300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.062300,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.219100,0.000000,3.226100>}
box{<0,0,-0.038100><0.350526,0.036000,0.038100> rotate<0,63.423453,0> translate<73.062300,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.219100,0.000000,3.226100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.532600,0.000000,2.912600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<73.219100,0.000000,3.226100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.532600,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,2.912600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<73.532600,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,3.069300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<73.846200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,3.069300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,3.382900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<74.002900,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.002900,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,3.539600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<73.846200,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.846200,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.689400,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<73.689400,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.689400,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.532600,0.000000,3.382900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<73.532600,0.000000,3.382900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.532600,0.000000,3.382900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<73.532600,0.000000,2.912600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<73.532600,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.542900,0.000000,1.977100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<75.602300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.542900,0.000000,1.977100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.542900,0.000000,2.447400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<76.542900,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.542900,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.386200,0.000000,2.604100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<76.386200,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.386200,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.759100,0.000000,2.604100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<75.759100,0.000000,2.604100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.759100,0.000000,2.604100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,2.447400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<75.602300,0.000000,2.447400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,2.447400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,1.977100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<75.602300,0.000000,1.977100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,3.539600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<75.602300,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.602300,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.759100,0.000000,3.539600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<75.602300,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.759100,0.000000,3.539600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.386200,0.000000,2.912600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<75.759100,0.000000,3.539600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.386200,0.000000,2.912600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<76.542900,0.000000,2.912600>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<76.386200,0.000000,2.912600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.082900,0.000000,2.277600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.455900,0.000000,2.277600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<78.455900,0.000000,2.277600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.455900,0.000000,2.277600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.142300,0.000000,2.591100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<78.142300,0.000000,2.591100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.142300,0.000000,2.591100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.455900,0.000000,2.904600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<78.142300,0.000000,2.591100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.455900,0.000000,2.904600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.082900,0.000000,2.904600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<78.455900,0.000000,2.904600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.612600,0.000000,2.277600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<78.612600,0.000000,2.904600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<78.612600,0.000000,2.904600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.682300,0.000000,2.277600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.622900,0.000000,2.277600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<80.682300,0.000000,2.277600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.309400,0.000000,2.277600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.682300,0.000000,2.904600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<80.682300,0.000000,2.904600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.152600,0.000000,2.434300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.622900,0.000000,2.904600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<81.152600,0.000000,2.434300> }
//BAR silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.540000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.540000,0.000000,19.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.540000,0.000000,19.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,18.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,18.000000>}
difference{
cylinder{<9.000000,0,18.000000><9.000000,0.036000,18.000000>2.616200 translate<0,0.000000,0>}
cylinder{<9.000000,-0.1,18.000000><9.000000,0.135000,18.000000>2.463800 translate<0,0.000000,0>}}
//CANCEL silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.095000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.905000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<61.349000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<64.651000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<64.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<61.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,42.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,42.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.984000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,42.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,42.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<68.080000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,30.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.080000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.096000,0.000000,32.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.096000,0.000000,32.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,30.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,29.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<56.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,41.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.904000,0.000000,41.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.904000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,29.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.984000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,29.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.016000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.826000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<67.826000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.826000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.778000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.174000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.174000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.174000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,29.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.016000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.222000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.222000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.222000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.174000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.174000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.174000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,29.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<57.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.778000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.826000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.778000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.826000,0.000000,29.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.826000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,38.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.920000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.921000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,38.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.921000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,33.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.920000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.921000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.080000,0.000000,33.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.921000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,36.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.428000,0.000000,36.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.079000,0.000000,38.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.428000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,36.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.920000,0.000000,35.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<57.920000,0.000000,35.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,35.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,33.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.428000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.428000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.079000,0.000000,33.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.428000,0.000000,33.460000> }
difference{
cylinder{<63.000000,0,36.000000><63.000000,0.036000,36.000000>3.632200 translate<0,0.000000,0>}
cylinder{<63.000000,-0.1,36.000000><63.000000,0.135000,36.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<63.000000,0,36.000000><63.000000,0.036000,36.000000>1.041400 translate<0,0.000000,0>}
cylinder{<63.000000,-0.1,36.000000><63.000000,0.135000,36.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<63.000000,0,36.000000><63.000000,0.036000,36.000000>0.787400 translate<0,0.000000,0>}
cylinder{<63.000000,-0.1,36.000000><63.000000,0.135000,36.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<58.428000,0,38.540000><58.428000,0.036000,38.540000>0.203200 translate<0,0.000000,0>}
cylinder{<58.428000,-0.1,38.540000><58.428000,0.135000,38.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<58.428000,0,33.460000><58.428000,0.036000,33.460000>0.203200 translate<0,0.000000,0>}
cylinder{<58.428000,-0.1,33.460000><58.428000,0.135000,33.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<69.350000,0.000000,33.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<69.350000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<56.650000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<56.650000,0.000000,33.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.365500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<59.634500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.365500,0.000000,29.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<59.634500,0.000000,29.904000>}
//DEBUG silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.540000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.540000,0.000000,19.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<47.540000,0.000000,19.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,18.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,18.000000>}
difference{
cylinder{<45.000000,0,18.000000><45.000000,0.036000,18.000000>2.616200 translate<0,0.000000,0>}
cylinder{<45.000000,-0.1,18.000000><45.000000,0.135000,18.000000>2.463800 translate<0,0.000000,0>}}
//FOO silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.540000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.540000,0.000000,55.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.540000,0.000000,55.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<9.000000,0.000000,54.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<9.000000,0.000000,54.000000>}
difference{
cylinder{<9.000000,0,54.000000><9.000000,0.036000,54.000000>2.616200 translate<0,0.000000,0>}
cylinder{<9.000000,-0.1,54.000000><9.000000,0.135000,54.000000>2.463800 translate<0,0.000000,0>}}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.470000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<79.375000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.010000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<79.375000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<77.470000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.025000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<74.295000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.930000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.295000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.930000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.565000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<76.835000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.470000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.835000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.565000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<74.930000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<69.850000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.755000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.755000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<71.755000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.390000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.755000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.755000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.755000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<69.850000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.390000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.390000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.025000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.405000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.675000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.310000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.675000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.310000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.945000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<69.215000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.850000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<69.215000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.945000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.945000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<67.310000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.230000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.135000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.770000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.135000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.230000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.770000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.770000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.405000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.690000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<61.595000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.230000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.595000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.690000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<51.435000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.435000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.070000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<53.975000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.975000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<52.070000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.990000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<48.895000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.895000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.990000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.530000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.530000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.815000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.815000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.450000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.355000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.355000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.450000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.910000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.910000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.010000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.645000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<81.915000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.550000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.915000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.645000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<80.010000,0.000000,5.080000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<78.740000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<76.200000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<73.660000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<71.120000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<68.580000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.040000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<63.500000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<60.960000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<58.420000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.880000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.340000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.800000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<48.260000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.720000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.180000,0.000000,5.715000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<81.280000,0.000000,5.715000>}
//MOTHERBOARD silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,4.095000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,4.095000>}
box{<0,0,-0.063500><30.480000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.795000,-1.536000,4.095000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,4.095000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.275000,-1.536000,4.095000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,4.095000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,10.445000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.795000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.525000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,2.825000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.525000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.545000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.846000,-1.536000,11.715000>}
box{<0,0,-0.063500><4.699000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.846000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.545000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.545000,-1.536000,2.825000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<41.545000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.525000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.525000,-1.536000,11.715000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<8.525000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,10.445000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.957000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,9.683000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.003000,-1.536000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,9.683000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.003000,-1.536000,9.683000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,10.445000>}
box{<0,0,-0.063500><4.826000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.177000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,9.683000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,10.445000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.067000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.067000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,2.571000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.275000,-1.536000,2.571000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.005000,-1.536000,2.571000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.005000,-1.536000,2.571000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.005000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.005000,-1.536000,2.571000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.005000,-1.536000,2.571000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.275000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.545000,-1.536000,2.825000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.275000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.670000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.400000,-1.536000,2.571000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.400000,-1.536000,2.571000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.670000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.670000,-1.536000,2.825000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.670000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.670000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.005000,-1.536000,2.825000>}
box{<0,0,-0.063500><13.335000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.670000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.400000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.400000,-1.536000,2.825000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.400000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.065000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,2.571000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.795000,-1.536000,2.571000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,2.825000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.795000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.065000,-1.536000,2.571000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.065000,-1.536000,2.825000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.065000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.065000,-1.536000,2.825000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.400000,-1.536000,2.825000>}
box{<0,0,-0.063500><13.335000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.065000,-1.536000,2.825000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.544000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,11.715000>}
box{<0,0,-0.063500><6.477000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.067000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,11.715000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.003000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.433000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,10.445000>}
box{<0,0,-0.063500><7.366000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.067000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.957000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,10.445000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.433000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.544000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.925000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,53.126596,0> translate<33.544000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.465000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.846000,-1.536000,11.715000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-53.126596,0> translate<36.465000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.465000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.957000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<34.433000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.067000,-1.536000,10.699000>}
box{<0,0,-0.025400><7.366000,0.036000,0.025400> rotate<0,0.000000,0> translate<27.067000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.067000,-1.536000,11.715000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.067000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<35.957000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.529000,-1.536000,10.699000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<35.957000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.529000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.529000,-1.536000,3.841000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<40.529000,-1.536000,3.841000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.529000,-1.536000,3.841000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.541000,-1.536000,3.841000>}
box{<0,0,-0.025400><30.988000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.541000,-1.536000,3.841000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.541000,-1.536000,3.841000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.541000,-1.536000,10.699000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<9.541000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.541000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.653000,-1.536000,10.699000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.541000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.003000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,11.715000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.003000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.433000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.925000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.925000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.957000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.957000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.433000,-1.536000,11.207000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.433000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.525000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.843000,-1.536000,11.715000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.525000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.843000,-1.536000,11.588000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.843000,-1.536000,11.715000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.843000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.843000,-1.536000,11.588000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.367000,-1.536000,11.588000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.843000,-1.536000,11.588000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.367000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.367000,-1.536000,11.588000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.367000,-1.536000,11.588000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.367000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.764000,-1.536000,11.715000>}
box{<0,0,-0.063500><1.397000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.367000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.653000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.177000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.177000,-1.536000,10.699000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.003000,-1.536000,10.699000>}
box{<0,0,-0.025400><4.826000,0.036000,0.025400> rotate<0,0.000000,0> translate<18.177000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.653000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.795000,-1.536000,10.445000>}
box{<0,0,-0.063500><6.858000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.795000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,10.699000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.177000,-1.536000,10.699000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,10.445000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.653000,-1.536000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,11.207000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.653000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.653000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.145000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.145000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.764000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.145000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,53.126596,0> translate<15.764000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.685000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.066000,-1.536000,11.715000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-53.126596,0> translate<18.685000,-1.536000,11.207000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.066000,-1.536000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.003000,-1.536000,11.715000>}
box{<0,0,-0.063500><3.937000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.066000,-1.536000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.685000,-1.536000,11.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.177000,-1.536000,11.207000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.177000,-1.536000,11.207000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.465000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.465000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.925000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.845000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.845000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.925000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<16.145000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.605000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.685000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.305000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.765000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<16.145000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.605000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.685000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.305000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.765000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.225000,-1.536000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.225000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.385000,-1.536000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.385000,-1.536000,8.540000>}
//OK silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.905000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<82.651000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<79.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,42.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,42.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,42.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,42.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<86.080000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,30.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.080000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,32.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,32.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,30.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,29.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<74.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,41.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.904000,0.000000,41.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,29.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,29.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<85.826000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,29.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,29.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<75.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,29.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.826000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,38.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,38.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,33.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,33.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,36.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,36.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,38.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,36.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,35.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<75.920000,0.000000,35.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,35.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,33.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,33.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,33.460000> }
difference{
cylinder{<81.000000,0,36.000000><81.000000,0.036000,36.000000>3.632200 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,36.000000><81.000000,0.135000,36.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,36.000000><81.000000,0.036000,36.000000>1.041400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,36.000000><81.000000,0.135000,36.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,36.000000><81.000000,0.036000,36.000000>0.787400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,36.000000><81.000000,0.135000,36.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,38.540000><76.428000,0.036000,38.540000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,38.540000><76.428000,0.135000,38.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,33.460000><76.428000,0.036000,33.460000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,33.460000><76.428000,0.135000,33.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,33.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,33.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,29.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,29.904000>}
//POWER silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.540000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.540000,0.000000,55.905000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<47.540000,0.000000,55.905000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<45.000000,0.000000,54.000000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<45.000000,0.000000,54.000000>}
difference{
cylinder{<45.000000,0,54.000000><45.000000,0.036000,54.000000>2.616200 translate<0,0.000000,0>}
cylinder{<45.000000,-0.1,54.000000><45.000000,0.135000,54.000000>2.463800 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.088000,0.000000,44.120000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.088000,0.000000,46.050000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<15.088000,0.000000,46.050000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.662000,0.000000,44.120000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.662000,0.000000,46.050000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<16.662000,0.000000,46.050000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<15.875800,0.000000,43.758300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<15.874100,0.000000,46.411700>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.218000,0.000000,53.010000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.218000,0.000000,54.940000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<39.218000,0.000000,54.940000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.792000,0.000000,53.010000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.792000,0.000000,54.940000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<40.792000,0.000000,54.940000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<40.005800,0.000000,52.648300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<40.004100,0.000000,55.301700>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.858000,0.000000,63.170000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<79.858000,0.000000,65.100000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<79.858000,0.000000,65.100000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.432000,0.000000,63.170000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.432000,0.000000,65.100000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<81.432000,0.000000,65.100000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<80.645800,0.000000,62.808300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<80.644100,0.000000,65.461700>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.723000,0.000000,21.260000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.723000,0.000000,23.190000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<15.723000,0.000000,23.190000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,21.260000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,23.190000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<17.297000,0.000000,23.190000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<16.510800,0.000000,20.898300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<16.509100,0.000000,23.551700>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.078000,0.000000,44.755000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.078000,0.000000,46.685000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<62.078000,0.000000,46.685000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.652000,0.000000,44.755000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.652000,0.000000,46.685000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<63.652000,0.000000,46.685000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<62.865800,0.000000,44.393300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<62.864100,0.000000,47.046700>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.263000,0.000000,44.120000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.263000,0.000000,46.050000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<18.263000,0.000000,46.050000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.837000,0.000000,44.120000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.837000,0.000000,46.050000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<19.837000,0.000000,46.050000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<19.050800,0.000000,43.758300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<19.049100,0.000000,46.411700>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.880000,0.000000,44.298000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.950000,0.000000,44.298000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<80.950000,0.000000,44.298000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<82.880000,0.000000,45.872000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<80.950000,0.000000,45.872000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<80.950000,0.000000,45.872000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<83.241600,0.000000,45.085900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<80.588300,0.000000,45.084100>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.298000,0.000000,44.755000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.298000,0.000000,46.685000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<44.298000,0.000000,46.685000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.872000,0.000000,44.755000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.872000,0.000000,46.685000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<45.872000,0.000000,46.685000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<45.085800,0.000000,44.393300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<45.084100,0.000000,47.046700>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.925000,0.000000,59.842000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.855000,0.000000,59.842000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.925000,0.000000,59.842000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.925000,0.000000,58.268000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.855000,0.000000,58.268000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.925000,0.000000,58.268000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<7.563200,0.000000,59.054100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-0.000000,0> translate<10.216700,0.000000,59.055900>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205000,0.000000,55.728000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.275000,0.000000,55.728000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.275000,0.000000,55.728000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205000,0.000000,57.302000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.275000,0.000000,57.302000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.275000,0.000000,57.302000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<16.566600,0.000000,56.515900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<13.913300,0.000000,56.514100>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.548000,0.000000,16.815000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.548000,0.000000,18.745000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<12.548000,0.000000,18.745000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.122000,0.000000,16.815000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.122000,0.000000,18.745000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<14.122000,0.000000,18.745000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<13.335800,0.000000,16.453300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<13.334100,0.000000,19.106700>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.637000,0.000000,18.745000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.637000,0.000000,16.815000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<70.637000,0.000000,16.815000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.063000,0.000000,18.745000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.063000,0.000000,16.815000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<69.063000,0.000000,16.815000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<69.849000,0.000000,19.106700>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-270.000000,0> translate<69.850900,0.000000,16.453300>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.175000,0.000000,21.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.825000,0.000000,21.429000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.825000,0.000000,21.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.825000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.460000,0.000000,14.571000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.825000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.175000,0.000000,21.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,21.175000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<66.175000,0.000000,21.429000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.175000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,14.825000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.175000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,14.825000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,16.476000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.429000,0.000000,16.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,16.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,17.746000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.429000,0.000000,17.746000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,17.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.429000,0.000000,21.175000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.429000,0.000000,21.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.825000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,14.825000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<59.571000,0.000000,14.825000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.825000,0.000000,21.429000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,21.175000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.571000,0.000000,21.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,21.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,17.746000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.571000,0.000000,17.746000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,17.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,16.476000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.571000,0.000000,16.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,16.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.571000,0.000000,14.825000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.571000,0.000000,14.825000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.524000,0.000000,18.000000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.762000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.524000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.524000,0.000000,18.762000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.524000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.524000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762000,0.000000,18.762000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.762000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,19.143000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<63.381000,0.000000,19.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,19.524000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.381000,0.000000,19.524000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,20.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,20.286000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.619000,0.000000,20.286000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,20.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,19.524000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.619000,0.000000,19.524000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.238000,0.000000,18.762000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.238000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.238000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.476000,0.000000,18.762000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.476000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.476000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.476000,0.000000,18.000000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.476000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.476000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.238000,0.000000,18.000000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.476000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,17.619000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.238000,0.000000,18.000000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<62.238000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,17.619000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,17.238000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.619000,0.000000,17.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,16.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,16.476000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.619000,0.000000,16.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,16.476000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,17.238000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.381000,0.000000,17.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,17.619000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762000,0.000000,18.000000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.381000,0.000000,17.619000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.222000,0.000000,16.603000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.968000,0.000000,16.349000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<60.968000,0.000000,16.349000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.778000,0.000000,16.603000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.032000,0.000000,16.349000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<64.778000,0.000000,16.603000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.387600,0.000000,18.381000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.768600,0.000000,18.381000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<65.387600,0.000000,18.381000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<64.778000,0.000000,20.032000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<65.032000,0.000000,20.286000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<64.778000,0.000000,20.032000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.000000,0.000000,20.717800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<63.000000,0.000000,21.098800>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,90.000000,0> translate<63.000000,0.000000,21.098800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<61.095000,0.000000,20.032000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.841000,0.000000,20.286000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<60.841000,0.000000,20.286000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.612400,0.000000,18.381000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<60.231400,0.000000,18.381000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<60.231400,0.000000,18.381000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,19.524000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,19.524000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.619000,0.000000,19.524000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,19.524000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,20.286000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.381000,0.000000,20.286000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,19.524000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,19.143000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.619000,0.000000,19.143000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,17.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,17.238000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.619000,0.000000,17.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,17.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.381000,0.000000,17.619000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.381000,0.000000,17.619000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,17.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.619000,0.000000,16.476000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.619000,0.000000,16.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.460000,0.000000,14.952000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.460000,0.000000,14.571000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.460000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,14.952000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,14.952000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.984000,0.000000,14.952000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.540000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.540000,0.000000,14.952000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.540000,0.000000,14.952000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.460000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.365000,0.000000,14.571000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.460000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.365000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.635000,0.000000,14.571000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.365000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.635000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.540000,0.000000,14.571000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.635000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.540000,0.000000,14.571000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.175000,0.000000,14.571000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.540000,0.000000,14.571000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.460000,0.000000,14.952000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.984000,0.000000,14.952000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.460000,0.000000,14.952000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.016000,0.000000,14.952000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.540000,0.000000,14.952000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.016000,0.000000,14.952000> }
difference{
cylinder{<63.000000,0,18.381000><63.000000,0.036000,18.381000>2.108200 translate<0,0.000000,0>}
cylinder{<63.000000,-0.1,18.381000><63.000000,0.135000,18.381000>1.955800 translate<0,0.000000,0>}}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.743000,0.000000,16.815000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.743000,0.000000,18.745000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<48.743000,0.000000,18.745000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.317000,0.000000,16.815000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.317000,0.000000,18.745000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,90.000000,0> translate<50.317000,0.000000,18.745000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<49.530800,0.000000,16.453300>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-90.000000,0> translate<49.529100,0.000000,19.106700>}
//U$1 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<4.000000,0.000000,69.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<4.000000,0.000000,69.000000>}
difference{
cylinder{<4.000000,0,69.000000><4.000000,0.036000,69.000000>3.505200 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,69.000000><4.000000,0.135000,69.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,69.000000><4.000000,0.036000,69.000000>0.990600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,69.000000><4.000000,0.135000,69.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,69.000000><4.000000,0.036000,69.000000>1.701600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,69.000000><4.000000,0.135000,69.000000>1.498400 translate<0,0.000000,0>}}
//U$2 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<4.000000,0.000000,4.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<4.000000,0.000000,4.000000>}
difference{
cylinder{<4.000000,0,4.000000><4.000000,0.036000,4.000000>3.505200 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.000000><4.000000,0.135000,4.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,4.000000><4.000000,0.036000,4.000000>0.990600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.000000><4.000000,0.135000,4.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<4.000000,0,4.000000><4.000000,0.036000,4.000000>1.701600 translate<0,0.000000,0>}
cylinder{<4.000000,-0.1,4.000000><4.000000,0.135000,4.000000>1.498400 translate<0,0.000000,0>}}
//U$3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<87.000000,0.000000,69.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<87.000000,0.000000,69.000000>}
difference{
cylinder{<87.000000,0,69.000000><87.000000,0.036000,69.000000>3.505200 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,69.000000><87.000000,0.135000,69.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<87.000000,0,69.000000><87.000000,0.036000,69.000000>0.990600 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,69.000000><87.000000,0.135000,69.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<87.000000,0,69.000000><87.000000,0.036000,69.000000>1.701600 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,69.000000><87.000000,0.135000,69.000000>1.498400 translate<0,0.000000,0>}}
//U$4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<87.000000,0.000000,4.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<87.000000,0.000000,4.000000>}
difference{
cylinder{<87.000000,0,4.000000><87.000000,0.036000,4.000000>3.505200 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,4.000000><87.000000,0.135000,4.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<87.000000,0,4.000000><87.000000,0.036000,4.000000>0.990600 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,4.000000><87.000000,0.135000,4.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<87.000000,0,4.000000><87.000000,0.036000,4.000000>1.701600 translate<0,0.000000,0>}
cylinder{<87.000000,-0.1,4.000000><87.000000,0.135000,4.000000>1.498400 translate<0,0.000000,0>}}
//X+ silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.095000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.905000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<43.349000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<46.651000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<43.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<43.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,42.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,42.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.984000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,42.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,42.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<50.080000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,30.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.080000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.096000,0.000000,32.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.096000,0.000000,32.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,30.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,29.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<38.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,41.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.904000,0.000000,41.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.904000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,29.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.984000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,29.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.016000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.826000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<49.826000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.826000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.778000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.174000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.174000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.174000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,29.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.016000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.222000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.222000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.222000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.174000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.174000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.174000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,29.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<39.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.778000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.826000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.778000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.826000,0.000000,29.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.826000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,38.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.920000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.921000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,38.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.921000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,33.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.920000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.921000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.080000,0.000000,33.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.921000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,36.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.428000,0.000000,36.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.079000,0.000000,38.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.428000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,36.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.920000,0.000000,35.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<39.920000,0.000000,35.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,35.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,33.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.428000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.428000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.079000,0.000000,33.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.428000,0.000000,33.460000> }
difference{
cylinder{<45.000000,0,36.000000><45.000000,0.036000,36.000000>3.632200 translate<0,0.000000,0>}
cylinder{<45.000000,-0.1,36.000000><45.000000,0.135000,36.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<45.000000,0,36.000000><45.000000,0.036000,36.000000>1.041400 translate<0,0.000000,0>}
cylinder{<45.000000,-0.1,36.000000><45.000000,0.135000,36.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<45.000000,0,36.000000><45.000000,0.036000,36.000000>0.787400 translate<0,0.000000,0>}
cylinder{<45.000000,-0.1,36.000000><45.000000,0.135000,36.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<40.428000,0,38.540000><40.428000,0.036000,38.540000>0.203200 translate<0,0.000000,0>}
cylinder{<40.428000,-0.1,38.540000><40.428000,0.135000,38.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<40.428000,0,33.460000><40.428000,0.036000,33.460000>0.203200 translate<0,0.000000,0>}
cylinder{<40.428000,-0.1,33.460000><40.428000,0.135000,33.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<51.350000,0.000000,33.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<51.350000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<38.650000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<38.650000,0.000000,33.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<48.365500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.634500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<48.365500,0.000000,29.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.634500,0.000000,29.904000>}
//X- silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.095000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.905000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<7.349000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.651000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<7.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<7.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<7.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,42.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,42.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.984000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,42.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,42.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<14.080000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,30.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.080000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.096000,0.000000,32.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.096000,0.000000,32.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,30.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,29.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<2.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,41.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.904000,0.000000,41.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.904000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,29.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.984000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,29.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.016000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.826000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<13.826000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.826000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.778000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.174000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.174000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.174000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,29.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.016000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.222000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.222000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.222000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.174000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.174000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.174000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,29.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<3.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.778000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.826000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.778000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.826000,0.000000,29.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.826000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,38.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.920000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.921000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,38.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.921000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,33.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.920000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.921000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.080000,0.000000,33.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.921000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,36.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.428000,0.000000,36.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.079000,0.000000,38.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.428000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,36.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.920000,0.000000,35.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<3.920000,0.000000,35.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,35.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,33.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.428000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.428000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.079000,0.000000,33.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.428000,0.000000,33.460000> }
difference{
cylinder{<9.000000,0,36.000000><9.000000,0.036000,36.000000>3.632200 translate<0,0.000000,0>}
cylinder{<9.000000,-0.1,36.000000><9.000000,0.135000,36.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<9.000000,0,36.000000><9.000000,0.036000,36.000000>1.041400 translate<0,0.000000,0>}
cylinder{<9.000000,-0.1,36.000000><9.000000,0.135000,36.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<9.000000,0,36.000000><9.000000,0.036000,36.000000>0.787400 translate<0,0.000000,0>}
cylinder{<9.000000,-0.1,36.000000><9.000000,0.135000,36.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<4.428000,0,38.540000><4.428000,0.036000,38.540000>0.203200 translate<0,0.000000,0>}
cylinder{<4.428000,-0.1,38.540000><4.428000,0.135000,38.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<4.428000,0,33.460000><4.428000,0.036000,33.460000>0.203200 translate<0,0.000000,0>}
cylinder{<4.428000,-0.1,33.460000><4.428000,0.135000,33.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<15.350000,0.000000,33.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<15.350000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<2.650000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<2.650000,0.000000,33.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.365500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<5.634500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.365500,0.000000,29.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<5.634500,0.000000,29.904000>}
//Y+ silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,55.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,55.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,55.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,55.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.905000,0.000000,55.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,52.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,52.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,55.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,52.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.095000,0.000000,52.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,55.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,55.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,55.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,52.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,55.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<28.651000,0.000000,55.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,52.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,52.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,52.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,55.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,52.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.349000,0.000000,52.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,60.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,60.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,60.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,60.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,60.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,60.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,60.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,60.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,60.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<32.080000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,60.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,57.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,57.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,52.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,52.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,48.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.080000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,48.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,50.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,50.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,57.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,52.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,52.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,48.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,48.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,48.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,47.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<20.904000,0.000000,48.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,47.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,60.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,59.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.904000,0.000000,59.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,57.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,47.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,47.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,47.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,47.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,47.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,47.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,47.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,60.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<31.826000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,60.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,60.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,60.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,60.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,60.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,60.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,60.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.920000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,47.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,47.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,47.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,47.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,47.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,47.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<21.920000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,47.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,47.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,47.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,47.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.826000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,56.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,56.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,51.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,51.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,54.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,54.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,56.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,54.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,53.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<21.920000,0.000000,53.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,53.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,51.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,51.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,51.460000> }
difference{
cylinder{<27.000000,0,54.000000><27.000000,0.036000,54.000000>3.632200 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,54.000000><27.000000,0.135000,54.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,54.000000><27.000000,0.036000,54.000000>1.041400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,54.000000><27.000000,0.135000,54.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,54.000000><27.000000,0.036000,54.000000>0.787400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,54.000000><27.000000,0.135000,54.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,56.540000><22.428000,0.036000,56.540000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,56.540000><22.428000,0.135000,56.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,51.460000><22.428000,0.036000,51.460000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,51.460000><22.428000,0.135000,51.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,51.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,56.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,56.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,51.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,60.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,60.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,47.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,47.904000>}
//Y- silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,19.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,19.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,19.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,19.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.905000,0.000000,19.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,16.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,16.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,19.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,16.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.095000,0.000000,16.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,19.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,19.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,19.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,16.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,19.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<28.651000,0.000000,19.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,16.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,16.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,16.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,19.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,16.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.349000,0.000000,16.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,24.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,24.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,24.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,24.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,24.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,24.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,24.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,24.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,24.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<32.080000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,24.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,21.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,21.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,16.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,16.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,12.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.080000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,12.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,14.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,14.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,21.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,16.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,16.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,12.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,12.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,12.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,11.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<20.904000,0.000000,12.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,24.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,23.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.904000,0.000000,23.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,21.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,11.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,11.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,11.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,11.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,11.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,11.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,11.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,24.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<31.826000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,24.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,24.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,24.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,24.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,24.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,24.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,24.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.920000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,11.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,11.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,11.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,11.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,11.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<21.920000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,11.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,11.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,11.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,11.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.826000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,20.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,20.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,15.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,15.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,18.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,20.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,17.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<21.920000,0.000000,17.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,17.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,15.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,15.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,15.460000> }
difference{
cylinder{<27.000000,0,18.000000><27.000000,0.036000,18.000000>3.632200 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,18.000000><27.000000,0.135000,18.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,18.000000><27.000000,0.036000,18.000000>1.041400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,18.000000><27.000000,0.135000,18.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,18.000000><27.000000,0.036000,18.000000>0.787400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,18.000000><27.000000,0.135000,18.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,20.540000><22.428000,0.036000,20.540000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,20.540000><22.428000,0.135000,20.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,15.460000><22.428000,0.036000,15.460000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,15.460000><22.428000,0.135000,15.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,15.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,20.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,20.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,15.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,24.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,24.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,11.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,11.904000>}
//Z+ silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,55.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,55.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,55.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,55.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.905000,0.000000,55.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,52.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,52.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,55.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,52.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.095000,0.000000,52.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,55.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,55.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,55.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,52.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,55.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<82.651000,0.000000,55.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,52.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,52.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,52.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,55.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,52.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<79.349000,0.000000,52.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,60.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,60.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,60.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,60.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,60.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,60.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,60.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,60.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,60.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<86.080000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,60.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,57.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,57.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,52.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,52.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,48.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.080000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,48.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,50.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,50.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,57.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,55.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,52.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,52.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,52.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,48.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,48.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,48.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,47.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<74.904000,0.000000,48.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,47.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,60.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,59.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.904000,0.000000,59.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,59.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,57.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,57.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,47.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,47.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,47.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,47.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,47.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,47.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,47.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,60.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<85.826000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,60.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,60.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,60.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,60.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,60.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,60.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,60.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,60.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,60.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,60.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.920000,0.000000,60.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,47.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,47.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,47.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,47.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,47.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,47.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<75.920000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,47.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,47.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,47.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,47.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,47.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,47.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.826000,0.000000,47.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,56.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,56.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,51.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,51.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,54.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,54.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,56.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,56.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,56.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,54.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,53.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<75.920000,0.000000,53.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,53.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,51.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,51.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,51.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,51.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,51.460000> }
difference{
cylinder{<81.000000,0,54.000000><81.000000,0.036000,54.000000>3.632200 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,54.000000><81.000000,0.135000,54.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,54.000000><81.000000,0.036000,54.000000>1.041400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,54.000000><81.000000,0.135000,54.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,54.000000><81.000000,0.036000,54.000000>0.787400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,54.000000><81.000000,0.135000,54.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,56.540000><76.428000,0.036000,56.540000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,56.540000><76.428000,0.135000,56.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,51.460000><76.428000,0.036000,51.460000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,51.460000><76.428000,0.135000,51.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,51.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,56.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,56.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,51.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,60.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,60.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,47.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,47.904000>}
//Z- silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,19.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,19.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,19.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,19.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.905000,0.000000,19.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.905000,0.000000,16.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,16.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.095000,0.000000,16.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,19.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.095000,0.000000,16.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.095000,0.000000,16.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,19.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,19.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,19.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,16.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,19.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<82.651000,0.000000,19.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<82.651000,0.000000,16.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,16.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<79.349000,0.000000,16.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,19.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<79.349000,0.000000,16.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<79.349000,0.000000,16.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,24.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,24.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,24.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,24.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,24.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,24.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,24.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,24.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,24.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<86.080000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,24.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,21.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,21.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,16.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<87.096000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,16.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,12.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.080000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,12.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.096000,0.000000,14.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.096000,0.000000,14.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,21.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,19.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,16.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,16.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.904000,0.000000,16.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,14.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,12.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,12.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,12.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,11.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<74.904000,0.000000,12.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,11.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,24.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,23.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.904000,0.000000,23.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,23.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.904000,0.000000,21.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.904000,0.000000,21.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,11.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,11.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,11.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,11.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,11.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<79.984000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,11.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.016000,0.000000,11.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,24.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<85.826000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,24.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,24.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,24.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,24.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,24.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,24.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,24.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,24.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,24.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,24.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.920000,0.000000,24.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,11.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.984000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.016000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,11.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.016000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,11.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.222000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.984000,0.000000,11.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<79.222000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.222000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,11.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.174000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.174000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,11.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<75.920000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,11.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.778000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,11.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,11.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,11.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.778000,0.000000,11.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.778000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,11.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.826000,0.000000,11.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.826000,0.000000,11.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,20.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,20.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,15.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.920000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.921000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.080000,0.000000,15.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.921000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,18.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,18.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,20.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,20.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,20.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,18.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.920000,0.000000,17.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<75.920000,0.000000,17.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,17.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,15.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.428000,0.000000,15.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.428000,0.000000,15.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.079000,0.000000,15.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.428000,0.000000,15.460000> }
difference{
cylinder{<81.000000,0,18.000000><81.000000,0.036000,18.000000>3.632200 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,18.000000><81.000000,0.135000,18.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,18.000000><81.000000,0.036000,18.000000>1.041400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,18.000000><81.000000,0.135000,18.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<81.000000,0,18.000000><81.000000,0.036000,18.000000>0.787400 translate<0,0.000000,0>}
cylinder{<81.000000,-0.1,18.000000><81.000000,0.135000,18.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,20.540000><76.428000,0.036000,20.540000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,20.540000><76.428000,0.135000,20.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<76.428000,0,15.460000><76.428000,0.036000,15.460000>0.203200 translate<0,0.000000,0>}
cylinder{<76.428000,-0.1,15.460000><76.428000,0.135000,15.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,15.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<87.350000,0.000000,20.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,20.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<74.650000,0.000000,15.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,24.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,24.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<84.365500,0.000000,11.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<77.634500,0.000000,11.904000>}
//ZERO silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,37.905000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.905000,0.000000,37.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.905000,0.000000,34.095000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,37.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.095000,0.000000,34.095000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.095000,0.000000,34.095000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,37.651000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,90.000000,0> translate<28.651000,0.000000,37.651000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.651000,0.000000,34.349000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,0.000000,0> translate<25.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,37.651000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.349000,0.000000,34.349000>}
box{<0,0,-0.025400><3.302000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.349000,0.000000,34.349000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,42.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,42.096000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,42.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,42.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,42.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,42.096000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<32.080000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,30.920000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.080000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.096000,0.000000,32.190000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.096000,0.000000,32.190000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,39.810000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,37.143000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,34.857000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.904000,0.000000,34.857000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,32.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,30.920000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,30.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,29.904000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,44.997030,0> translate<20.904000,0.000000,30.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,42.096000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,41.080000>}
box{<0,0,-0.076200><1.436841,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.904000,0.000000,41.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,41.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.904000,0.000000,39.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.904000,0.000000,39.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,29.523000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,29.523000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,29.523000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.016000,0.000000,29.523000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<31.826000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,42.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,42.096000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,42.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,42.350000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,42.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,42.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,42.350000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.920000,0.000000,42.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,29.904000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.984000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.016000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.016000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.222000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.984000,0.000000,29.904000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.222000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.174000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.174000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,29.904000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<21.920000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,29.650000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,29.904000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,29.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.778000,0.000000,29.650000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.778000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,29.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.826000,0.000000,29.650000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.826000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,38.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,38.540000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,33.460000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.920000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.921000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.080000,0.000000,33.460000>}
box{<0,0,-0.076200><2.159000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.921000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,36.762000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,36.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,38.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,38.540000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,38.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,36.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.920000,0.000000,35.238000>}
box{<0,0,-0.076200><1.606437,0.036000,0.076200> rotate<0,-71.560328,0> translate<21.920000,0.000000,35.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,35.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,33.460000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.428000,0.000000,33.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.428000,0.000000,33.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.079000,0.000000,33.460000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.428000,0.000000,33.460000> }
difference{
cylinder{<27.000000,0,36.000000><27.000000,0.036000,36.000000>3.632200 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,36.000000><27.000000,0.135000,36.000000>3.479800 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,36.000000><27.000000,0.036000,36.000000>1.041400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,36.000000><27.000000,0.135000,36.000000>0.990600 translate<0,0.000000,0>}}
difference{
cylinder{<27.000000,0,36.000000><27.000000,0.036000,36.000000>0.787400 translate<0,0.000000,0>}
cylinder{<27.000000,-0.1,36.000000><27.000000,0.135000,36.000000>0.736600 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,38.540000><22.428000,0.036000,38.540000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,38.540000><22.428000,0.135000,38.540000>0.050800 translate<0,0.000000,0>}}
difference{
cylinder{<22.428000,0,33.460000><22.428000,0.036000,33.460000>0.203200 translate<0,0.000000,0>}
cylinder{<22.428000,-0.1,33.460000><22.428000,0.135000,33.460000>0.050800 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,33.523500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<33.350000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,38.476500>}
box{<-0.254000,0,-0.444500><0.254000,0.036000,0.444500> rotate<0,-0.000000,0> translate<20.650000,0.000000,33.523500>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,42.096000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.365500,0.000000,29.904000>}
box{<-1.079500,0,-0.254000><1.079500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.634500,0.000000,29.904000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  INTERFACE(-45.500000,0,-36.492500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//CANCEL		B3F-40XX
//OK		B3F-40XX
//R13	20K	B25P
//U$1		3,0
//U$2		3,0
//U$3		3,0
//U$4		3,0
//X+		B3F-40XX
//X-		B3F-40XX
//Y+		B3F-40XX
//Y-		B3F-40XX
//Z+		B3F-40XX
//Z-		B3F-40XX
//ZERO		B3F-40XX
