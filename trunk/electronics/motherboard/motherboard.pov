//POVRay-File created by 3d41.ulp v1.05
///Users/zachsmith/makerbot/trunk/electronics/motherboard/motherboard.brd
//10/29/09 1:50 PM

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
#local cam_y = 349;
#local cam_z = -186;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -8;
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
#local lgt1_pos_y = 57;
#local lgt1_pos_z = 43;
#local lgt1_intense = 0.817972;
#local lgt2_pos_x = -38;
#local lgt2_pos_y = 57;
#local lgt2_pos_z = 43;
#local lgt2_intense = 0.817972;
#local lgt3_pos_x = 38;
#local lgt3_pos_y = 57;
#local lgt3_pos_z = -29;
#local lgt3_intense = 0.817972;
#local lgt4_pos_x = -38;
#local lgt4_pos_y = 57;
#local lgt4_pos_z = -29;
#local lgt4_intense = 0.817972;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 101.600000;
#declare pcb_y_size = 81.280000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(401);
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
	//translate<-50.800000,0,-40.640000>
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


#macro MOTHERBOARD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><101.600000,0.000000>
<101.600000,0.000000><101.600000,81.280000>
<101.600000,81.280000><0.000000,81.280000>
<0.000000,81.280000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<48.260000,1,3.302000><48.260000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<59.690000,1,3.302000><59.690000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<32.385000,1,3.302000><32.385000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<43.815000,1,3.302000><43.815000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<64.135000,1,3.302000><64.135000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<75.565000,1,3.302000><75.565000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<80.010000,1,3.302000><80.010000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<91.440000,1,3.302000><91.440000,-5,3.302000>1.625600 texture{col_hls}}
cylinder{<3.810000,1,77.470000><3.810000,-5,77.470000>1.500000 texture{col_hls}}
cylinder{<97.790000,1,77.470000><97.790000,-5,77.470000>1.500000 texture{col_hls}}
cylinder{<97.790000,1,3.810000><97.790000,-5,3.810000>1.500000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.500000 texture{col_hls}}
cylinder{<39.265000,1,18.665000><39.265000,-5,18.665000>1.500000 texture{col_hls}}
cylinder{<86.465000,1,18.665000><86.465000,-5,18.665000>1.500000 texture{col_hls}}
cylinder{<91.186000,1,77.851000><91.186000,-5,77.851000>1.701800 texture{col_hls}}
cylinder{<75.438000,1,77.851000><75.438000,-5,77.851000>1.701800 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<3.175000,0.095000,58.135000><3.175000,-1.595000,58.135000>1.100000 texture{col_hls}}
cylinder{<3.175000,0.095000,70.135000><3.175000,-1.595000,70.135000>1.100000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_I2C) #declare global_pack_I2C=yes; object {PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<82.550000,0.000000,69.850000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) I2C  1X04
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO8("SN75176ASOIC","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.907000,0.000000,4.445000>translate<0,0.035000,0> }#end		//SMD IC SO8 Package IC1 SN75176ASOIC SO08
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {QFP_TQFP_100_050MM("ATMEGA1280-16AU","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.400200,0.000000,46.685200>translate<0,0.035000,0> }#end		//TQFP-100 IC2 ATMEGA1280-16AU TQFP100
#ifndef(pack_IC6) #declare global_pack_IC6=yes; object {IC_SMD_SSOP28("FT232RL","FTDI",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<16.764000,0.000000,57.531000>translate<0,0.035000,0> }#end		//SSOP28 IC6 FT232RL SSOP28
#ifndef(pack_IC7) #declare global_pack_IC7=yes; object {IC_SMD_SO8("LM358D","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<18.796000,0.000000,46.736000>translate<0,0.035000,0> }#end		//SMD IC SO8 Package IC7 LM358D SO08
#ifndef(pack_ICSP) #declare global_pack_ICSP=yes; object {PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.995600,0.000000,35.407600>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) ICSP ICSP 2X03
#ifndef(pack_INTERFACE) #declare global_pack_INTERFACE=yes; object {CON_DIS_WS20G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<94.564200,0.000000,55.778400>}#end		//Shrouded Header 20Pin INTERFACE  ML20
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.416000,0.000000,4.191000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP2  1X02
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {SPC_XTAL_5MM("16MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<69.723000,0.000000,65.405000>}#end		//Quarz 4,9MM Q2 16MHz HC49/S
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.414000,0.000000,6.350000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R15 10K R0805
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.515600,0.000000,3.632200>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R16 10K R0805
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<23.368000,0.000000,4.572000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R17  R0805
#ifndef(pack_R19) #declare global_pack_R19=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<26.225500,0.000000,28.257500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R19 10K R0805
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.035000,0.000000,25.400000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R20 3.3K R0805
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.035000,0.000000,22.225000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R21 3.3K R0805
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.035000,0.000000,18.415000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R22 3.3K R0805
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.099000,0.000000,25.400000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R23 1.8K R0805
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.099000,0.000000,22.225000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R24 1.8K R0805
#ifndef(pack_R25) #declare global_pack_R25=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.099000,0.000000,18.415000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R25 1.8K R0805
#ifndef(pack_RESET) #declare global_pack_RESET=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<80.137000,0.000000,60.325000>}#end		//Tactile Switch-Omron RESET  B3F-10XX
#ifndef(pack_T1) #declare global_pack_T1=yes; object {IC_SMD_SOT223("NDT2955","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.477000,0.000000,45.847000>translate<0,0.035000,0> }#end		//SOT223 T1 NDT2955 SOT223
#ifndef(pack_T2) #declare global_pack_T2=yes; object {IC_SMD_SOT223("NDT2955","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.350000,0.000000,38.100000>translate<0,0.035000,0> }#end		//SOT223 T2 NDT2955 SOT223
#ifndef(pack_X_AXIS) #declare global_pack_X_AXIS=yes; object {CON_DIS_WS10G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<60.960000,0.000000,75.565000>}#end		//Shrouded Header 10Pin X-AXIS  ML10
#ifndef(pack_X5) #declare global_pack_X5=yes; object {CON_PHOENIX_508_MSTBV_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<96.520000,0.000000,17.780000>}#end		//Connector PHOENIX type MSTBV vertical 2 pins X5 MSTBV2 MSTBV2
#ifndef(pack_Y_AXIS) #declare global_pack_Y_AXIS=yes; object {CON_DIS_WS10G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.005000,0.000000,75.565000>}#end		//Shrouded Header 10Pin Y-AXIS  ML10
#ifndef(pack_Z_AXIS) #declare global_pack_Z_AXIS=yes; object {CON_DIS_WS10G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<19.050000,0.000000,75.565000>}#end		//Shrouded Header 10Pin Z-AXIS  ML10
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<79.629000,0.000000,40.767000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<79.629000,0.000000,43.053000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<82.042000,0.000000,40.767000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<82.042000,0.000000,43.053000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<84.455000,0.000000,40.767000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<84.455000,0.000000,43.053000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<77.139800,0.000000,36.411800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<77.139800,0.000000,38.365800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<68.287000,0.000000,69.342000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<66.333000,0.000000,69.342000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<71.159000,0.000000,69.342000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<73.113000,0.000000,69.342000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<55.841000,0.000000,35.814000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<53.887000,0.000000,35.814000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<87.249000,0.000000,23.534000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<87.249000,0.000000,25.488000>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<82.194000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<88.494000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.236000,0.000000,28.765500>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.936000,0.000000,28.765500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<60.032000,0.000000,35.814000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<58.078000,0.000000,35.814000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<73.355200,0.000000,56.985800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<73.355200,0.000000,58.939800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<70.662800,0.000000,58.939800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<70.662800,0.000000,56.985800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<17.526000,0.000000,37.377000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<17.526000,0.000000,39.331000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<2.794000,0.000000,51.474000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<2.794000,0.000000,53.428000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<13.056500,0.000000,67.500500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<15.010500,0.000000,67.500500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<15.010500,0.000000,65.151000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<13.056500,0.000000,65.151000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<46.417600,0.000000,27.635200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<44.463600,0.000000,27.635200>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<77.445000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(2.400000,2.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.145000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<70.993000,0.000000,54.762400>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<73.279000,0.000000,54.762400>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.985000,0.000000,51.263000>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.985000,0.000000,55.163000>}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<86.360000,0,69.850000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<83.820000,0,69.850000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<81.280000,0,69.850000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<78.740000,0,69.850000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.307000,0.000000,6.350000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.307000,0.000000,5.080000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.307000,0.000000,3.810000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.307000,0.000000,2.540000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.507000,0.000000,2.540000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.507000,0.000000,3.810000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.507000,0.000000,5.080000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.507000,0.000000,6.350000>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,40.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,41.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,41.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,42.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,42.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,43.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,43.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,44.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,44.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,45.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,45.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,46.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,46.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,47.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,47.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,48.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,48.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,49.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,49.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,50.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,50.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,51.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,51.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,52.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.400200,0.000000,52.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<53.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<53.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.900200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.400200,0.000000,54.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,52.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,52.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,51.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,51.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,50.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,50.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,49.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,49.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,48.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,48.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,47.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,47.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,46.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,46.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,45.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,45.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,44.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,44.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,43.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,43.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,42.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,42.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,41.685200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,41.185200>}
object{TOOLS_PCB_SMD(1.500000,0.350000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.400200,0.000000,40.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<53.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<53.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.900200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.350000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.400200,0.000000,38.685200>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<12.539000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<13.189000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<13.839000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<14.489000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<15.139000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<15.789000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<16.439000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<17.089000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<17.739000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<18.389000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<19.039000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<19.689000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<20.339000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<20.989000,0.000000,53.906000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<20.989000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<20.339000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<19.689000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<19.039000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<18.389000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<17.739000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<17.089000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<16.439000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<15.789000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<15.139000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<14.489000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<13.839000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<13.189000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<12.539000,0.000000,61.156000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.196000,0.000000,48.641000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.196000,0.000000,47.371000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.196000,0.000000,46.101000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.196000,0.000000,44.831000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.396000,0.000000,44.831000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.396000,0.000000,46.101000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.396000,0.000000,47.371000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.396000,0.000000,48.641000>}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<43.535600,0,36.677600> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<43.535600,0,34.137600> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.995600,0,36.677600> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.995600,0,34.137600> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.455600,0,36.677600> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.455600,0,34.137600> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,44.348400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,44.348400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,46.888400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,46.888400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,49.428400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,49.428400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,51.968400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,51.968400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,54.508400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,54.508400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,57.048400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,57.048400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,59.588400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,59.588400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,62.128400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,62.128400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,64.668400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,64.668400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<95.834200,0,67.208400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<93.294200,0,67.208400> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<49.530000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<52.070000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<54.610000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<57.150000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<58.420000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.655000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<34.925000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<36.195000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<37.465000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<38.735000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<40.005000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<41.275000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<42.545000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<65.405000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<66.675000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<67.945000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<69.215000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<70.485000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<71.755000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.025000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<74.295000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<81.280000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<82.550000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<83.820000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<85.090000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<86.360000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<87.630000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<88.900000,0,9.652000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<90.170000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.416000,0,5.461000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.416000,0,2.921000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,65.405000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<72.136000,0,65.405000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<66.510800,0.000000,54.762400>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<68.464800,0.000000,54.762400>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<77.001000,0.000000,66.421000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<78.955000,0.000000,66.421000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<83.654000,0.000000,66.294000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<81.700000,0.000000,66.294000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<88.837400,0.000000,36.677600>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<90.791400,0.000000,36.677600>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<68.021200,0.000000,56.985800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<68.021200,0.000000,58.939800>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<20.066000,0.000000,37.377000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<20.066000,0.000000,39.331000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<27.178000,0.000000,58.698500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<27.178000,0.000000,56.744500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<79.629000,0.000000,36.488000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<79.629000,0.000000,38.442000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<24.701500,0.000000,58.698500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-270.000000,0> texture{col_pds} translate<24.701500,0.000000,56.744500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<17.692000,0.000000,42.164000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<19.646000,0.000000,42.164000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<24.257000,0.000000,51.003200>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<26.543000,0.000000,51.003200>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<24.257000,0.000000,53.111400>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<26.543000,0.000000,53.111400>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<82.042000,0.000000,36.488000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<82.042000,0.000000,38.442000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<84.455000,0.000000,36.488000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,100) rotate<0,-90.000000,0> texture{col_pds} translate<84.455000,0.000000,38.442000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.264000,0.000000,6.350000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.564000,0.000000,6.350000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.365600,0.000000,3.632200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.665600,0.000000,3.632200>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.368000,0.000000,3.722000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.368000,0.000000,5.422000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.075500,0.000000,28.257500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.375500,0.000000,28.257500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.185000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.885000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.185000,0.000000,22.225000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.885000,0.000000,22.225000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.185000,0.000000,18.415000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.885000,0.000000,18.415000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.249000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.949000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.249000,0.000000,22.225000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.949000,0.000000,22.225000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.249000,0.000000,18.415000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.949000,0.000000,18.415000>}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<76.885800,0,62.585600> texture{col_thl}}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<83.388200,0,62.585600> texture{col_thl}}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<76.885800,0,58.064400> texture{col_thl}}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<83.388200,0,58.064400> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<27.178000,0.000000,61.023500>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<27.178000,0.000000,63.309500>}
#ifndef(global_pack_SG1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.528000,0,41.084500> texture{col_thl}}
#ifndef(global_pack_SG1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.908000,0,41.084500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.575800,0.000000,43.535600>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.575800,0.000000,45.847000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.575800,0.000000,48.158400>}
object{TOOLS_PCB_SMD(3.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<3.378000,0.000000,45.847000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.448800,0.000000,35.788600>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.448800,0.000000,38.100000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.448800,0.000000,40.411400>}
object{TOOLS_PCB_SMD(3.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<3.251000,0.000000,38.100000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<24.701500,0.000000,61.023500>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<24.701500,0.000000,63.309500>}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.250000,1.500000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<95.565000,0,28.380000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.250000,1.500000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<95.575000,0,36.360000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.250000,1.500000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<95.575000,0,32.370000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,16.320000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,17.620000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,18.920000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,22.820000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,24.120000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,25.420000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,26.720000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,28.020000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,15.020000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,20.220000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,21.520000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.375000,0.000000,32.670000>}
object{TOOLS_PCB_SMD(1.200000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.875000,0.000000,29.820000>}
object{TOOLS_PCB_SMD(3.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.175000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.800000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.375000,0.000000,33.020000>}
object{TOOLS_PCB_SMD(1.800000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.375000,0.000000,9.320000>}
object{TOOLS_PCB_SMD(3.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.175000,0.000000,9.320000>}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<66.040000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<66.040000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<60.960000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<60.960000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<58.420000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<58.420000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<55.880000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<55.880000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<43.965000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<48.165000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<52.365000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<56.565000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<60.765000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<64.965000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<69.165000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<73.365000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<77.565000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<81.765000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<43.965000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<48.165000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<52.365000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<56.565000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<60.765000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<64.965000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<69.165000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<73.365000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<77.565000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<81.765000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<87.122000,0,77.089000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<84.582000,0,77.089000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<82.042000,0,77.089000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<79.502000,0,77.089000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.885000,0,62.885000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.885000,0,65.385000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<5.885000,0,65.385000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<5.885000,0,62.885000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.216000,2.200000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.175000,0,70.135000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.216000,2.200000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.175000,0,58.135000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.095600,1.397000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<96.520000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.095600,1.397000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<96.520000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<45.085000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<45.085000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<42.545000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<42.545000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.005000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.005000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<37.465000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<37.465000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.925000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.925000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.130000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.130000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.590000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.590000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<19.050000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<19.050000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.510000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.510000,0,74.295000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,76.835000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,74.295000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<13.843000,0,47.371000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<9.461500,0,68.834000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<22.860000,0,8.191500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<9.017000,0,8.178800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<24.003000,0,30.353000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<79.121000,0,72.263000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<16.052800,0,51.181000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<38.201600,0,22.453600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<55.880000,0,52.146200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<49.606200,0,52.578000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<46.443900,0,45.897800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<7.035800,0,41.910000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<49.987200,0,34.112200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<21.399500,0,59.055000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<20.320000,0,57.848500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<72.999600,0,41.173400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<69.443600,0,39.319200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<91.668600,0,71.932800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<86.207600,0,48.818800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<19.507200,0,33.985200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<58.420000,0,52.705000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<28.448000,0,14.427200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<60.401200,0,55.143400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<46.863000,0,51.739800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<20.701000,0,8.636000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<16.738600,0,8.509000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<48.056800,0,56.769000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<54.432200,0,41.986200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<52.781200,0,42.849800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<54.508400,0,43.916600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<48.691800,0,35.356800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<48.082200,0,33.629600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<44.881800,0,54.686200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<18.669000,0,9.525000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<42.011600,0,55.626000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<14.401800,0,8.585200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<55.905400,0,46.583600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<71.272400,0,50.368200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<70.637400,0,60.528200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<13.144500,0,57.086500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<2.984500,0,29.781500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<78.841600,0,56.286400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<54.406800,0,31.140400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<52.019200,0,36.728400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<26.797000,0,10.261600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<23.368000,0,1.778000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<10.858500,0,53.911500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<21.920200,0,51.536600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<15.621000,0,56.134000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<22.694900,0,53.428900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<17.754600,0,28.219400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<62.026800,0,55.143400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<33.553400,0,22.428200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<63.779400,0,53.517800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<23.114000,0,23.876000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<28.067000,0,24.003000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<22.733000,0,17.653000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<26.924000,0,20.447000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<7.747000,0,59.563000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<56.438800,0,49.072800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<35.966400,0,38.201600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<33.782000,0,25.781000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<66.421000,0,51.968400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<45.694600,0,31.775400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<56.362600,0,60.223400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<51.638200,0,69.138800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.008000,0.500000,1,16,1,0) translate<58.343800,0,60.706000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<49.885600,0,69.189600> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,0.000000,53.428000>}
box{<0,0,-0.152400><4.230000,0.035000,0.152400> rotate<0,-90.000000,0> translate<2.794000,0.000000,53.428000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,58.039000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<2.794000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.984500,-1.535000,57.944500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,58.135000>}
box{<0,0,-0.127000><0.269408,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.984500,-1.535000,57.944500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,58.135000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,58.039000>}
box{<0,0,-0.152400><0.096000,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.175000,0.000000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,58.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,60.175000>}
box{<0,0,-0.127000><2.040000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.175000,0.000000,60.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.984500,-1.535000,29.781500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.984500,-1.535000,57.944500>}
box{<0,0,-0.127000><28.163000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.984500,-1.535000,57.944500> }
}cylinder{<3.175000,1,58.135000><3.175000,-2.500000,58.135000>1.100000 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,-1.535000,70.135000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,-1.535000,70.231000>}
box{<0,0,-0.152400><0.096000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.175000,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,70.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.809500,0.000000,67.500500>}
box{<0,0,-0.127000><3.725746,0.035000,0.127000> rotate<0,44.997030,0> translate<3.175000,0.000000,70.135000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,-1.535000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.091400,-1.535000,70.231000>}
box{<0,0,-0.152400><16.916400,0.035000,0.152400> rotate<0,0.000000,0> translate<3.175000,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,70.135000>}
box{<0,0,-0.127000><4.603000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.175000,0.000000,70.135000> }
}cylinder{<3.175000,1,70.135000><3.175000,-2.500000,70.135000>1.100000 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,9.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,9.398000>}
box{<0,0,-0.152400><0.078000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.175000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.984500,0.000000,29.781500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,29.972000>}
box{<0,0,-0.127000><0.269408,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.984500,0.000000,29.781500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,29.972000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,-90.000000,0> translate<3.175000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,61.976000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,65.976500>}
box{<0,0,-0.127000><4.000500,0.035000,0.127000> rotate<0,90.000000,0> translate<3.175000,-1.535000,65.976500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,32.893000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<3.175000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.318000,0.000000,9.398000>}
box{<0,0,-0.152400><1.143000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.175000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.105400,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.130800,-1.535000,31.572200>}
box{<0,0,-0.127000><11.353828,0.035000,0.127000> rotate<0,89.865891,0> translate<5.105400,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.626100,0.000000,39.522400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.626100,0.000000,44.475400>}
box{<0,0,-0.127000><4.953000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.626100,0.000000,44.475400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.130800,-1.535000,31.572200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.816600,-1.535000,30.353000>}
box{<0,0,-0.127000><1.398846,0.035000,0.127000> rotate<0,60.638244,0> translate<5.130800,-1.535000,31.572200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.816600,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.816600,-1.535000,30.353000>}
box{<0,0,-0.127000><15.443200,0.035000,0.127000> rotate<0,90.000000,0> translate<5.816600,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.822000,0.000000,62.885000>}
box{<0,0,-0.127000><3.743423,0.035000,0.127000> rotate<0,44.997030,0> translate<3.175000,0.000000,65.532000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.105400,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.867400,-1.535000,43.688000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.105400,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,60.175000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,0.000000,62.885000>}
box{<0,0,-0.127000><3.832519,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.175000,0.000000,60.175000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.822000,0.000000,62.885000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,0.000000,62.885000>}
box{<0,0,-0.127000><0.063000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.822000,0.000000,62.885000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,-1.535000,65.385000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,-1.535000,66.210000>}
box{<0,0,-0.127000><0.825000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.885000,-1.535000,66.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,65.976500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.159500,-1.535000,68.961000>}
box{<0,0,-0.127000><4.220720,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.175000,-1.535000,65.976500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,0.000000,51.474000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.774000,0.000000,51.474000>}
box{<0,0,-0.127000><3.980000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.794000,0.000000,51.474000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,61.976000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.921500,-1.535000,58.229500>}
box{<0,0,-0.127000><5.298351,0.035000,0.127000> rotate<0,44.997030,0> translate<3.175000,-1.535000,61.976000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.921500,-1.535000,53.911500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.921500,-1.535000,58.229500>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.921500,-1.535000,58.229500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.774000,0.000000,51.474000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,51.263000>}
box{<0,0,-0.127000><0.298399,0.035000,0.127000> rotate<0,44.997030,0> translate<6.774000,0.000000,51.474000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,51.263000>}
box{<0,0,-0.127000><4.590500,0.035000,0.127000> rotate<0,90.000000,0> translate<6.985000,0.000000,51.263000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,55.163000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,58.801000>}
box{<0,0,-0.127000><3.638000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.985000,0.000000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,-1.535000,66.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,67.310000>}
box{<0,0,-0.127000><1.555635,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.885000,-1.535000,66.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.086600,-1.535000,15.900400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.086600,-1.535000,30.353000>}
box{<0,0,-0.127000><14.452600,0.035000,0.127000> rotate<0,90.000000,0> translate<7.086600,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,58.801000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,0.000000,59.563000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.985000,0.000000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,62.747000>}
box{<0,0,-0.127000><3.184000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.747000,-1.535000,62.747000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.810500,0.000000,45.847000>}
box{<0,0,-0.127000><1.167433,0.035000,0.127000> rotate<0,44.997030,0> translate<6.985000,0.000000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,5.080000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.874000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,5.842000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,44.997030,0> translate<4.318000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,62.747000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.885000,-1.535000,62.885000>}
box{<0,0,-0.127000><0.195161,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.747000,-1.535000,62.747000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.626100,0.000000,39.522400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.937500,0.000000,38.100000>}
box{<0,0,-0.127000><2.713999,0.035000,0.127000> rotate<0,31.605416,0> translate<5.626100,0.000000,39.522400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.626100,0.000000,44.475400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.937500,0.000000,45.847000>}
box{<0,0,-0.127000><2.687723,0.035000,0.127000> rotate<0,-30.683148,0> translate<5.626100,0.000000,44.475400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.810500,0.000000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.937500,0.000000,45.847000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.810500,0.000000,45.847000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.950200,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.950200,-1.535000,29.895800>}
box{<0,0,-0.127000><13.360400,0.035000,0.127000> rotate<0,90.000000,0> translate<7.950200,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.035800,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.534400,0.000000,40.411400>}
box{<0,0,-0.127000><2.119340,0.035000,0.127000> rotate<0,44.997030,0> translate<7.035800,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.940800,-1.535000,16.941800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.940800,-1.535000,29.591000>}
box{<0,0,-0.127000><12.649200,0.035000,0.127000> rotate<0,90.000000,0> translate<8.940800,-1.535000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.321800,0.000000,3.632200>}
box{<0,0,-0.203200><2.047498,0.035000,0.203200> rotate<0,44.997030,0> translate<7.874000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.159500,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.334500,-1.535000,68.961000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.159500,-1.535000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.937500,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.448800,0.000000,38.100000>}
box{<0,0,-0.127000><1.511300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.937500,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.534400,0.000000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.448800,0.000000,40.411400>}
box{<0,0,-0.127000><0.914400,0.035000,0.127000> rotate<0,0.000000,0> translate<8.534400,0.000000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.334500,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.461500,-1.535000,68.834000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<9.334500,-1.535000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.448800,0.000000,35.788600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.486900,0.000000,35.750500>}
box{<0,0,-0.152400><0.053882,0.035000,0.152400> rotate<0,44.997030,0> translate<9.448800,0.000000,35.788600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.017000,0.000000,8.178800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.564000,0.000000,7.631800>}
box{<0,0,-0.203200><0.773575,0.035000,0.203200> rotate<0,44.997030,0> translate<9.017000,0.000000,8.178800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.564000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.564000,0.000000,7.631800>}
box{<0,0,-0.203200><1.281800,0.035000,0.203200> rotate<0,90.000000,0> translate<9.564000,0.000000,7.631800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.937500,0.000000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.575800,0.000000,45.847000>}
box{<0,0,-0.127000><1.638300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.937500,0.000000,45.847000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.321800,0.000000,3.632200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.665600,0.000000,3.632200>}
box{<0,0,-0.203200><0.343800,0.035000,0.203200> rotate<0,0.000000,0> translate<9.321800,0.000000,3.632200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.880600,-1.535000,17.297400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.880600,-1.535000,29.083000>}
box{<0,0,-0.127000><11.785600,0.035000,0.127000> rotate<0,90.000000,0> translate<9.880600,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.461500,0.000000,68.834000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,68.834000>}
box{<0,0,-0.127000><0.952500,0.035000,0.127000> rotate<0,0.000000,0> translate<9.461500,0.000000,68.834000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.575800,0.000000,43.535600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.566400,0.000000,43.535600>}
box{<0,0,-0.152400><0.990600,0.035000,0.152400> rotate<0,0.000000,0> translate<9.575800,0.000000,43.535600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.486900,0.000000,35.750500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.668000,0.000000,35.750500>}
box{<0,0,-0.152400><1.181100,0.035000,0.152400> rotate<0,0.000000,0> translate<9.486900,0.000000,35.750500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.858500,0.000000,53.911500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.864000,0.000000,53.906000>}
box{<0,0,-0.127000><0.007778,0.035000,0.127000> rotate<0,44.997030,0> translate<10.858500,0.000000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,68.834000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.922000,0.000000,69.342000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.414000,0.000000,68.834000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.318000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.303000,0.000000,9.398000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.318000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.303000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.375000,0.000000,9.320000>}
box{<0,0,-0.152400><0.106151,0.035000,0.152400> rotate<0,47.287489,0> translate<11.303000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.575800,0.000000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.391900,0.000000,48.158400>}
box{<0,0,-0.127000><1.816100,0.035000,0.127000> rotate<0,0.000000,0> translate<9.575800,0.000000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.375000,0.000000,9.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,9.271000>}
box{<0,0,-0.152400><0.073661,0.035000,0.152400> rotate<0,41.695382,0> translate<11.375000,0.000000,9.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,11.353800>}
box{<0,0,-0.127000><2.082800,0.035000,0.127000> rotate<0,90.000000,0> translate<11.430000,0.000000,11.353800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,32.893000>}
box{<0,0,-0.127000><8.128000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.302000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.375000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,32.893000>}
box{<0,0,-0.152400><0.138398,0.035000,0.152400> rotate<0,66.579575,0> translate<11.375000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,32.893000>}
box{<0,0,-0.127000><4.699000,0.035000,0.127000> rotate<0,90.000000,0> translate<11.430000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.885000,-1.535000,65.385000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.513500,-1.535000,65.385000>}
box{<0,0,-0.127000><3.628500,0.035000,0.127000> rotate<0,0.000000,0> translate<7.885000,-1.535000,65.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.365600,0.000000,3.632200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.543400,0.000000,3.810000>}
box{<0,0,-0.203200><0.251447,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.365600,0.000000,3.632200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.668000,0.000000,35.750500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.874500,0.000000,36.957000>}
box{<0,0,-0.152400><1.706249,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.668000,0.000000,35.750500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.874500,0.000000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.874500,0.000000,37.084000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.874500,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.874500,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.938000,0.000000,37.147500>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.874500,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.566400,0.000000,43.535600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.938000,0.000000,42.164000>}
box{<0,0,-0.152400><1.939735,0.035000,0.152400> rotate<0,44.997030,0> translate<10.566400,0.000000,43.535600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.938000,0.000000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.938000,0.000000,42.164000>}
box{<0,0,-0.152400><5.016500,0.035000,0.152400> rotate<0,90.000000,0> translate<11.938000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.938000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.938000,0.000000,47.180500>}
box{<0,0,-0.127000><5.016500,0.035000,0.127000> rotate<0,90.000000,0> translate<11.938000,0.000000,47.180500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.867400,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,-1.535000,43.688000>}
box{<0,0,-0.127000><6.197600,0.035000,0.127000> rotate<0,0.000000,0> translate<5.867400,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.319000,-1.535000,67.310000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.985000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.864000,0.000000,53.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.539000,0.000000,53.906000>}
box{<0,0,-0.127000><1.675000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.864000,0.000000,53.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.264000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,6.350000>}
box{<0,0,-0.203200><1.563000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.264000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,7.010400>}
box{<0,0,-0.203200><0.660400,0.035000,0.203200> rotate<0,90.000000,0> translate<12.827000,0.000000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.816600,-1.535000,14.909800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.979400,-1.535000,7.747000>}
box{<0,0,-0.127000><10.129729,0.035000,0.127000> rotate<0,44.997030,0> translate<5.816600,-1.535000,14.909800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.979400,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.979400,-1.535000,7.747000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.979400,-1.535000,7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.056500,0.000000,65.151000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.056500,0.000000,63.524500>}
box{<0,0,-0.152400><1.626500,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.056500,0.000000,63.524500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.056500,0.000000,67.500500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.056500,0.000000,65.151000>}
box{<0,0,-0.152400><2.349500,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.056500,0.000000,65.151000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.809500,0.000000,67.500500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.056500,0.000000,67.500500>}
box{<0,0,-0.127000><7.247000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.809500,0.000000,67.500500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.144500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.189000,0.000000,56.153000>}
box{<0,0,-0.127000><0.934560,0.035000,0.127000> rotate<0,87.265013,0> translate<13.144500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.189000,0.000000,53.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.189000,0.000000,56.153000>}
box{<0,0,-0.127000><2.247000,0.035000,0.127000> rotate<0,90.000000,0> translate<13.189000,0.000000,56.153000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.086600,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,36.474400>}
box{<0,0,-0.127000><8.656967,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.086600,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,36.474400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,40.081200>}
box{<0,0,-0.127000><3.606800,0.035000,0.127000> rotate<0,90.000000,0> translate<13.208000,-1.535000,40.081200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.144500,-1.535000,57.086500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,57.086500>}
box{<0,0,-0.127000><0.063500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.144500,-1.535000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,11.353800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.233400,0.000000,13.157200>}
box{<0,0,-0.127000><2.550393,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.430000,0.000000,11.353800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.233400,-1.535000,44.856400>}
box{<0,0,-0.127000><1.652367,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.065000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,29.019500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,46.418500>}
box{<0,0,-0.304800><17.399000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.335000,0.000000,46.418500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,30.657800>}
box{<0,0,-0.127000><0.101600,0.035000,0.127000> rotate<0,90.000000,0> translate<13.462000,-1.535000,30.657800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.921500,-1.535000,53.911500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,47.371000>}
box{<0,0,-0.127000><9.249664,0.035000,0.127000> rotate<0,44.997030,0> translate<6.921500,-1.535000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.017000,-1.535000,8.178800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.487400,-1.535000,6.350000>}
box{<0,0,-0.152400><4.830009,0.035000,0.152400> rotate<0,22.247555,0> translate<9.017000,-1.535000,8.178800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.979400,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.487400,-1.535000,6.350000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<12.979400,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.035800,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.538200,-1.535000,41.910000>}
box{<0,0,-0.127000><6.502400,0.035000,0.127000> rotate<0,0.000000,0> translate<7.035800,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,-1.535000,47.371000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.462000,-1.535000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.839000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.843000,0.000000,61.214000>}
box{<0,0,-0.152400><0.058138,0.035000,0.152400> rotate<0,-86.049134,0> translate<13.839000,0.000000,61.156000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.843000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.843000,0.000000,61.214000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.843000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.056500,0.000000,63.524500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.843000,0.000000,62.738000>}
box{<0,0,-0.152400><1.112279,0.035000,0.152400> rotate<0,44.997030,0> translate<13.056500,0.000000,63.524500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,76.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,76.835000>}
box{<0,0,-0.127000><0.190500,0.035000,0.127000> rotate<0,90.000000,0> translate<13.970000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.097000,0.000000,5.080000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<12.827000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,37.655500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,45.720000>}
box{<0,0,-0.127000><8.064500,0.035000,0.127000> rotate<0,90.000000,0> translate<14.351000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.086600,-1.535000,15.900400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.401800,-1.535000,8.585200>}
box{<0,0,-0.127000><10.345255,0.035000,0.127000> rotate<0,44.997030,0> translate<7.086600,-1.535000,15.900400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,7.010400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.401800,0.000000,8.585200>}
box{<0,0,-0.203200><2.227104,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.827000,0.000000,7.010400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.922000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.414500,0.000000,69.342000>}
box{<0,0,-0.127000><3.492500,0.035000,0.127000> rotate<0,0.000000,0> translate<10.922000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,46.418500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.478000,0.000000,47.371000>}
box{<0,0,-0.304800><1.487853,0.035000,0.304800> rotate<0,-39.802944,0> translate<13.335000,0.000000,46.418500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.391900,0.000000,48.158400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,51.244500>}
box{<0,0,-0.127000><4.364404,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.391900,0.000000,48.158400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,51.358800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,51.244500>}
box{<0,0,-0.127000><0.114300,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.478000,0.000000,51.244500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,51.358800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,53.895000>}
box{<0,0,-0.127000><2.536200,0.035000,0.127000> rotate<0,90.000000,0> translate<14.478000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,53.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,57.086500>}
box{<0,0,-0.127000><3.169500,0.035000,0.127000> rotate<0,90.000000,0> translate<14.478000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,57.086500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,-1.535000,58.356500>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.208000,-1.535000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.843000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.478000,0.000000,61.214000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.843000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,53.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.489000,0.000000,53.906000>}
box{<0,0,-0.127000><0.015556,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.478000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,53.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.489000,0.000000,53.906000>}
box{<0,0,-0.127000><0.015556,0.035000,0.127000> rotate<0,44.997030,0> translate<14.478000,0.000000,53.917000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.489000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.489000,0.000000,59.933000>}
box{<0,0,-0.152400><1.223000,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.489000,0.000000,59.933000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.478000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.489000,0.000000,61.156000>}
box{<0,0,-0.152400><0.059034,0.035000,0.152400> rotate<0,79.255872,0> translate<14.478000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.478000,0.000000,61.341000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.489000,0.000000,61.156000>}
box{<0,0,-0.152400><0.185327,0.035000,0.152400> rotate<0,86.591515,0> translate<14.478000,0.000000,61.341000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.950200,-1.535000,29.895800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.528800,-1.535000,36.474400>}
box{<0,0,-0.127000><9.303545,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.950200,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.528800,-1.535000,36.474400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.528800,-1.535000,39.598600>}
box{<0,0,-0.127000><3.124200,0.035000,0.127000> rotate<0,90.000000,0> translate<14.528800,-1.535000,39.598600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,51.358800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.655800,0.000000,51.181000>}
box{<0,0,-0.127000><0.251447,0.035000,0.127000> rotate<0,44.997030,0> translate<14.478000,0.000000,51.358800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.668500,0.000000,46.101000>}
box{<0,0,-0.127000><0.495951,0.035000,0.127000> rotate<0,-50.191116,0> translate<14.351000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,76.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.763700,0.000000,75.850800>}
box{<0,0,-0.127000><1.122461,0.035000,0.127000> rotate<0,44.997030,0> translate<13.970000,0.000000,76.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.938000,0.000000,47.180500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,50.101500>}
box{<0,0,-0.127000><4.130918,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.938000,0.000000,47.180500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,40.081200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.935200,-1.535000,41.808400>}
box{<0,0,-0.127000><2.442630,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.208000,-1.535000,40.081200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.489000,0.000000,59.933000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.986000,0.000000,59.436000>}
box{<0,0,-0.152400><0.702864,0.035000,0.152400> rotate<0,44.997030,0> translate<14.489000,0.000000,59.933000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.763700,0.000000,75.850800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.113000,0.000000,75.501500>}
box{<0,0,-0.127000><0.493985,0.035000,0.127000> rotate<0,44.997030,0> translate<14.763700,0.000000,75.850800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.139000,0.000000,53.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.139000,0.000000,55.271000>}
box{<0,0,-0.127000><1.365000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.139000,0.000000,55.271000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010500,0.000000,67.500500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.176500,0.000000,67.666500>}
box{<0,0,-0.127000><0.234759,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.010500,0.000000,67.500500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.176500,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.176500,0.000000,67.666500>}
box{<0,0,-0.127000><0.913500,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.176500,0.000000,67.666500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.414500,0.000000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.176500,0.000000,68.580000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<14.414500,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.538200,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,-1.535000,43.586400>}
box{<0,0,-0.127000><2.370788,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.538200,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.940800,-1.535000,29.591000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,35.890200>}
box{<0,0,-0.127000><8.908414,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.940800,-1.535000,29.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,35.890200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,39.166800>}
box{<0,0,-0.127000><3.276600,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,-1.535000,39.166800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.763700,0.000000,75.850800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,75.374500>}
box{<0,0,-0.127000><0.673590,0.035000,0.127000> rotate<0,44.997030,0> translate<14.763700,0.000000,75.850800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,73.469500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,75.374500>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,0.000000,75.374500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.543400,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.307000,0.000000,3.810000>}
box{<0,0,-0.203200><3.763600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.543400,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.097000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.307000,0.000000,5.080000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.097000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.307000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.307000,0.000000,7.369500>}
box{<0,0,-0.152400><1.019500,0.035000,0.152400> rotate<0,90.000000,0> translate<15.307000,0.000000,7.369500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.307000,0.000000,7.369500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.307000,0.000000,7.527600>}
box{<0,0,-0.127000><0.158100,0.035000,0.127000> rotate<0,90.000000,0> translate<15.307000,0.000000,7.527600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.139000,0.000000,55.271000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,0.000000,56.134000>}
box{<0,0,-0.127000><0.988480,0.035000,0.127000> rotate<0,-60.811894,0> translate<15.139000,0.000000,55.271000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.940800,-1.535000,16.941800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.773400,-1.535000,10.109200>}
box{<0,0,-0.127000><9.662756,0.035000,0.127000> rotate<0,44.997030,0> translate<8.940800,-1.535000,16.941800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.528800,-1.535000,39.598600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.773400,-1.535000,40.843200>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.528800,-1.535000,39.598600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.789000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.789000,0.000000,62.906000>}
box{<0,0,-0.152400><1.750000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.789000,0.000000,62.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.950200,-1.535000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.976600,-1.535000,8.509000>}
box{<0,0,-0.127000><11.351044,0.035000,0.127000> rotate<0,44.997030,0> translate<7.950200,-1.535000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.233400,-1.535000,44.856400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.976600,-1.535000,44.856400>}
box{<0,0,-0.127000><2.743200,0.035000,0.127000> rotate<0,0.000000,0> translate<13.233400,-1.535000,44.856400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.375000,0.000000,32.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.035400,0.000000,32.670000>}
box{<0,0,-0.127000><0.660400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.375000,0.000000,32.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,39.166800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,-1.535000,39.979600>}
box{<0,0,-0.127000><1.149473,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.240000,-1.535000,39.166800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.655800,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,0.000000,51.181000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.655800,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,-1.535000,48.463200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,-1.535000,51.181000>}
box{<0,0,-0.127000><2.717800,0.035000,0.127000> rotate<0,90.000000,0> translate<16.052800,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.880600,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,35.280600>}
box{<0,0,-0.127000><8.764730,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.880600,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,35.280600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,38.455600>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.078200,-1.535000,38.455600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.880600,-1.535000,17.297400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,-1.535000,11.074400>}
box{<0,0,-0.127000><8.800651,0.035000,0.127000> rotate<0,44.997030,0> translate<9.880600,-1.535000,17.297400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,32.537400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,31.877000>}
box{<0,0,-0.127000><0.660400,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.168000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.035400,0.000000,32.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,32.537400>}
box{<0,0,-0.127000><0.187525,0.035000,0.127000> rotate<0,44.997030,0> translate<16.035400,0.000000,32.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,32.537400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,32.703400>}
box{<0,0,-0.127000><0.166000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.168000,0.000000,32.703400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.668500,0.000000,46.101000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.196000,0.000000,46.101000>}
box{<0,0,-0.127000><1.527500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.668500,0.000000,46.101000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.196000,0.000000,47.371000>}
box{<0,0,-0.127000><2.353000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.843000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.478000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.196000,0.000000,47.371000>}
box{<0,0,-0.304800><1.718000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.478000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,38.608000>}
box{<0,0,-0.152400><5.029200,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.256000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.196000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,44.831000>}
box{<0,0,-0.152400><0.060000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.196000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,44.831000>}
box{<0,0,-0.152400><1.193800,0.035000,0.152400> rotate<0,90.000000,0> translate<16.256000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,37.655500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.319500,0.000000,35.623500>}
box{<0,0,-0.127000><2.829137,0.035000,0.127000> rotate<0,45.906351,0> translate<14.351000,0.000000,37.655500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.383000,0.000000,61.212000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.383000,0.000000,62.103000>}
box{<0,0,-0.152400><0.891000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.383000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,0.000000,53.848000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.433800,0.000000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.433800,0.000000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.439000,0.000000,53.906000>}
box{<0,0,-0.152400><0.058233,0.035000,0.152400> rotate<0,-84.871233,0> translate<16.433800,0.000000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.383000,0.000000,61.212000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.439000,0.000000,61.156000>}
box{<0,0,-0.152400><0.079196,0.035000,0.152400> rotate<0,44.997030,0> translate<16.383000,0.000000,61.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.439000,0.000000,53.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.446500,0.000000,53.913500>}
box{<0,0,-0.127000><0.010607,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.439000,0.000000,53.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.446500,0.000000,53.913500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.446500,0.000000,55.181500>}
box{<0,0,-0.127000><1.268000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.446500,0.000000,55.181500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.383000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,62.230000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.383000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,62.611000>}
box{<0,0,-0.152400><0.381000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.510000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.010500,0.000000,65.151000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,65.151000>}
box{<0,0,-0.152400><1.499500,0.035000,0.152400> rotate<0,0.000000,0> translate<15.010500,0.000000,65.151000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,76.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,76.835000>}
box{<0,0,-0.127000><0.190500,0.035000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,0.000000,74.168000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<16.510000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,0.000000,73.215500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,0.000000,74.168000>}
box{<0,0,-0.127000><0.952500,0.035000,0.127000> rotate<0,90.000000,0> translate<16.637000,0.000000,74.168000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.986000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.700500,0.000000,59.436000>}
box{<0,0,-0.152400><1.714500,0.035000,0.152400> rotate<0,0.000000,0> translate<14.986000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.307000,0.000000,7.527600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,0.000000,8.509000>}
box{<0,0,-0.127000><1.735691,0.035000,0.127000> rotate<0,-34.429405,0> translate<15.307000,0.000000,7.527600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.976600,-1.535000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.738600,-1.535000,8.509000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.976600,-1.535000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.078200,-1.535000,38.455600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.789400,-1.535000,39.166800>}
box{<0,0,-0.127000><1.005789,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.078200,-1.535000,38.455600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,52.197000>}
box{<0,0,-0.127000><0.595141,0.035000,0.127000> rotate<0,39.802944,0> translate<16.433800,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.976600,-1.535000,44.856400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.967200,-1.535000,45.847000>}
box{<0,0,-0.127000><1.400920,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.976600,-1.535000,44.856400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,-1.535000,48.463200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.967200,-1.535000,46.786800>}
box{<0,0,-0.127000><1.909567,0.035000,0.127000> rotate<0,61.385489,0> translate<16.052800,-1.535000,48.463200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.967200,-1.535000,45.847000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.967200,-1.535000,46.786800>}
box{<0,0,-0.127000><0.939800,0.035000,0.127000> rotate<0,90.000000,0> translate<16.967200,-1.535000,46.786800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.700500,0.000000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.081500,0.000000,59.817000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.700500,0.000000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.081500,0.000000,59.817000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.081500,0.000000,61.148500>}
box{<0,0,-0.152400><1.331500,0.035000,0.152400> rotate<0,90.000000,0> translate<17.081500,0.000000,61.148500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.081500,0.000000,61.148500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.089000,0.000000,61.156000>}
box{<0,0,-0.152400><0.010607,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.081500,0.000000,61.148500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.935200,-1.535000,41.808400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.094200,-1.535000,41.808400>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.935200,-1.535000,41.808400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.233400,0.000000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.195800,0.000000,13.157200>}
box{<0,0,-0.127000><3.962400,0.035000,0.127000> rotate<0,0.000000,0> translate<13.233400,0.000000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.214600,-1.535000,43.586400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,-1.535000,43.586400>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.214600,-1.535000,43.586400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.335500,-1.535000,56.134000>}
box{<0,0,-0.127000><1.714500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.621000,-1.535000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.773400,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348200,-1.535000,40.843200>}
box{<0,0,-0.127000><1.574800,0.035000,0.127000> rotate<0,0.000000,0> translate<15.773400,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,37.465000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<16.256000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,37.377000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,37.338000>}
box{<0,0,-0.152400><0.039000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.526000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,37.377000>}
box{<0,0,-0.152400><0.154509,0.035000,0.152400> rotate<0,34.716315,0> translate<17.399000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.196000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.589500,0.000000,48.641000>}
box{<0,0,-0.127000><1.393500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.196000,0.000000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,50.101500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,0.000000,50.101500>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.859000,0.000000,50.101500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.526000,0.000000,39.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.692000,0.000000,39.497000>}
box{<0,0,-0.127000><0.234759,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.526000,0.000000,39.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.692000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.692000,0.000000,42.164000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.692000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.168000,0.000000,32.703400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703800,0.000000,34.239200>}
box{<0,0,-0.127000><2.171949,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.168000,0.000000,32.703400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,-1.535000,58.356500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.716500,-1.535000,58.356500>}
box{<0,0,-0.127000><3.238500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.478000,-1.535000,58.356500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,30.556200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.729200,-1.535000,26.289000>}
box{<0,0,-0.127000><6.034732,0.035000,0.127000> rotate<0,44.997030,0> translate<13.462000,-1.535000,30.556200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.729200,-1.535000,17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.729200,-1.535000,26.289000>}
box{<0,0,-0.127000><8.940800,0.035000,0.127000> rotate<0,90.000000,0> translate<17.729200,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,57.086500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.739000,0.000000,59.331500>}
box{<0,0,-0.127000><3.959059,0.035000,0.127000> rotate<0,-34.542765,0> translate<14.478000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.739000,0.000000,59.331500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.739000,0.000000,61.156000>}
box{<0,0,-0.127000><1.824500,0.035000,0.127000> rotate<0,90.000000,0> translate<17.739000,0.000000,61.156000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,61.236500>}
box{<0,0,-0.152400><0.080500,0.035000,0.152400> rotate<0,90.000000,0> translate<17.739000,0.000000,61.236500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,62.570000>}
box{<0,0,-0.152400><1.414000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.739000,0.000000,62.570000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.754600,-1.535000,28.219400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.754600,-1.535000,29.895800>}
box{<0,0,-0.127000><1.676400,0.035000,0.127000> rotate<0,90.000000,0> translate<17.754600,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,61.236500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,61.277500>}
box{<0,0,-0.152400><0.057983,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.739000,0.000000,61.236500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.307000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.843500,0.000000,3.810000>}
box{<0,0,-0.152400><2.536500,0.035000,0.152400> rotate<0,0.000000,0> translate<15.307000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,76.644500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.843500,0.000000,75.311000>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,44.997030,0> translate<16.510000,0.000000,76.644500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.843500,0.000000,73.406000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.843500,0.000000,75.311000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.843500,0.000000,75.311000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.446500,0.000000,55.181500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.894300,0.000000,56.629300>}
box{<0,0,-0.127000><2.047498,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.446500,0.000000,55.181500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.335500,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.907000,-1.535000,55.562500>}
box{<0,0,-0.127000><0.808223,0.035000,0.127000> rotate<0,44.997030,0> translate<17.335500,-1.535000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,-1.535000,39.979600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.932400,-1.535000,39.979600>}
box{<0,0,-0.127000><1.879600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.052800,-1.535000,39.979600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.195800,0.000000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.995900,0.000000,13.957300>}
box{<0,0,-0.127000><1.131512,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.195800,0.000000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.843500,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,4.000500>}
box{<0,0,-0.152400><0.269408,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.843500,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,4.000500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,7.620000>}
box{<0,0,-0.152400><3.619500,0.035000,0.152400> rotate<0,90.000000,0> translate<18.034000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,8.001000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.034000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.773400,-1.535000,10.109200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.084800,-1.535000,10.109200>}
box{<0,0,-0.127000><2.311400,0.035000,0.127000> rotate<0,0.000000,0> translate<15.773400,-1.535000,10.109200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.995900,0.000000,13.957300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.110200,0.000000,14.071600>}
box{<0,0,-0.127000><0.161645,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.995900,0.000000,13.957300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.110200,0.000000,14.071600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.110200,0.000000,17.881600>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.110200,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.052800,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.135600,0.000000,51.181000>}
box{<0,0,-0.127000><2.082800,0.035000,0.127000> rotate<0,0.000000,0> translate<16.052800,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.307000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,0.000000,2.540000>}
box{<0,0,-0.152400><2.854000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.307000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.589500,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.224500,0.000000,48.006000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<17.589500,0.000000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.224500,0.000000,46.164500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.224500,0.000000,48.006000>}
box{<0,0,-0.127000><1.841500,0.035000,0.127000> rotate<0,90.000000,0> translate<18.224500,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.739000,0.000000,62.570000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,63.119000>}
box{<0,0,-0.152400><0.776403,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.739000,0.000000,62.570000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,63.119000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,63.182500>}
box{<0,0,-0.152400><0.063500,0.035000,0.152400> rotate<0,90.000000,0> translate<18.288000,0.000000,63.182500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.894300,0.000000,56.629300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.364200,0.000000,56.159400>}
box{<0,0,-0.127000><0.664539,0.035000,0.127000> rotate<0,44.997030,0> translate<17.894300,0.000000,56.629300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.739000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.389000,0.000000,61.156000>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.739000,0.000000,61.156000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.789400,-1.535000,39.166800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.440400,-1.535000,39.166800>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.789400,-1.535000,39.166800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.669000,0.000000,9.525000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,-67.375688,0> translate<18.034000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.084800,-1.535000,10.109200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.669000,-1.535000,9.525000>}
box{<0,0,-0.127000><0.826184,0.035000,0.127000> rotate<0,44.997030,0> translate<18.084800,-1.535000,10.109200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.669000,0.000000,66.548000>}
box{<0,0,-0.152400><2.571554,0.035000,0.152400> rotate<0,-32.903071,0> translate<16.510000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.995900,0.000000,13.957300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,13.258800>}
box{<0,0,-0.203200><0.987828,0.035000,0.203200> rotate<0,44.997030,0> translate<17.995900,0.000000,13.957300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,3.175000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.161000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,7.366000>}
box{<0,0,-0.152400><4.191000,0.035000,0.152400> rotate<0,90.000000,0> translate<18.796000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.843500,0.000000,73.406000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,72.453500>}
box{<0,0,-0.127000><1.347038,0.035000,0.127000> rotate<0,44.997030,0> translate<17.843500,0.000000,73.406000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.859500,0.000000,7.429500>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.796000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.789000,0.000000,62.906000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.859500,0.000000,65.595500>}
box{<0,0,-0.152400><4.081835,0.035000,0.152400> rotate<0,-41.212916,0> translate<15.789000,0.000000,62.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.894300,0.000000,56.629300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.039000,0.000000,57.774000>}
box{<0,0,-0.127000><1.618850,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.894300,0.000000,56.629300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.039000,0.000000,57.774000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.039000,0.000000,61.156000>}
box{<0,0,-0.127000><3.382000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.039000,0.000000,61.156000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,52.197000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.891000,0.000000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,72.453500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,72.453500>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.796000,0.000000,72.453500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,73.469500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,74.295000>}
box{<0,0,-0.127000><0.825500,0.035000,0.127000> rotate<0,90.000000,0> translate<19.050000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,0.000000,19.761200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,0.000000,20.421600>}
box{<0,0,-0.152400><0.660400,0.035000,0.152400> rotate<0,90.000000,0> translate<19.177000,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.716500,-1.535000,58.356500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,-1.535000,56.769000>}
box{<0,0,-0.127000><2.157132,0.035000,0.127000> rotate<0,47.382817,0> translate<17.716500,-1.535000,58.356500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.110200,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.202400,0.000000,18.973800>}
box{<0,0,-0.127000><1.544604,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.110200,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.202400,0.000000,20.447000>}
box{<0,0,-0.152400><10.973888,0.035000,0.152400> rotate<0,44.903263,0> translate<11.430000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,0.000000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.202400,0.000000,20.447000>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.177000,0.000000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.240500,0.000000,64.897000>}
box{<0,0,-0.152400><3.561099,0.035000,0.152400> rotate<0,-39.933748,0> translate<16.510000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.010500,0.000000,67.500500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.240500,0.000000,67.500500>}
box{<0,0,-0.127000><4.230000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.010500,0.000000,67.500500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.703800,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.253200,0.000000,34.239200>}
box{<0,0,-0.127000><1.549400,0.035000,0.127000> rotate<0,0.000000,0> translate<17.703800,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.754600,0.000000,28.219400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.254000,0.000000,26.720000>}
box{<0,0,-0.127000><2.120472,0.035000,0.127000> rotate<0,44.997030,0> translate<17.754600,0.000000,28.219400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304000,-1.535000,17.449800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304000,-1.535000,28.829000>}
box{<0,0,-0.127000><11.379200,0.035000,0.127000> rotate<0,90.000000,0> translate<19.304000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.367500,0.000000,48.387000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.367500,0.000000,47.117000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.367500,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.653000,0.000000,50.101500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.367500,0.000000,48.387000>}
box{<0,0,-0.127000><2.424669,0.035000,0.127000> rotate<0,44.997030,0> translate<17.653000,0.000000,50.101500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.253200,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.507200,0.000000,33.985200>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<19.253200,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,29.019500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.558000,0.000000,22.860000>}
box{<0,0,-0.304800><8.755865,0.035000,0.304800> rotate<0,44.703228,0> translate<13.335000,0.000000,29.019500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.224500,0.000000,46.164500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,44.831000>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,44.997030,0> translate<18.224500,0.000000,46.164500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.240500,0.000000,67.500500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,67.183000>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,44.997030,0> translate<19.240500,0.000000,67.500500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.621500,0.000000,62.420500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.621500,0.000000,61.223500>}
box{<0,0,-0.127000><1.197000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.621500,0.000000,61.223500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,0.000000,63.182500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.621500,0.000000,63.944500>}
box{<0,0,-0.152400><1.535860,0.035000,0.152400> rotate<0,-29.742918,0> translate<18.288000,0.000000,63.182500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.646000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.685000,0.000000,42.164000>}
box{<0,0,-0.304800><0.039000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.646000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.685000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.685000,0.000000,42.164000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<19.685000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.367500,0.000000,47.117000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,0.000000,46.799500>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,44.997030,0> translate<19.367500,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.621500,0.000000,61.223500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.689000,0.000000,61.156000>}
box{<0,0,-0.127000><0.095459,0.035000,0.127000> rotate<0,44.997030,0> translate<19.621500,0.000000,61.223500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.685000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,40.767000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,44.997030,0> translate<19.685000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.858500,-1.535000,53.911500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.002500,-1.535000,53.911500>}
box{<0,0,-0.127000><9.144000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.858500,-1.535000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,37.338000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.526000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,37.377000>}
box{<0,0,-0.152400><0.039000,0.035000,0.152400> rotate<0,90.000000,0> translate<20.066000,0.000000,37.377000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.526000,0.000000,39.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,0.000000,39.331000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.526000,0.000000,39.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,0.000000,39.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.090500,0.000000,39.306500>}
box{<0,0,-0.127000><0.034648,0.035000,0.127000> rotate<0,44.997030,0> translate<20.066000,0.000000,39.331000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.177000,0.000000,19.761200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.142200,0.000000,18.796000>}
box{<0,0,-0.152400><1.364999,0.035000,0.152400> rotate<0,44.997030,0> translate<19.177000,0.000000,19.761200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.507200,-1.535000,33.985200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,33.985200>}
box{<0,0,-0.127000><0.812800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.507200,-1.535000,33.985200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.513500,-1.535000,65.385000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,57.848500>}
box{<0,0,-0.127000><11.591086,0.035000,0.127000> rotate<0,40.553849,0> translate<11.513500,-1.535000,65.385000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,0.000000,57.848500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,0.000000,61.137000>}
box{<0,0,-0.127000><3.288500,0.035000,0.127000> rotate<0,90.000000,0> translate<20.320000,0.000000,61.137000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,0.000000,61.137000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.339000,0.000000,61.156000>}
box{<0,0,-0.127000><0.026870,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.320000,0.000000,61.137000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.621500,0.000000,62.420500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,63.182500>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.621500,0.000000,62.420500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,75.501500>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,44.997030,0> translate<19.050000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,73.215500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,75.501500>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.383500,0.000000,75.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.729200,-1.535000,17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.650200,-1.535000,14.427200>}
box{<0,0,-0.127000><4.130918,0.035000,0.127000> rotate<0,44.997030,0> translate<17.729200,-1.535000,17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.103600,-1.535000,11.074400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.675600,-1.535000,11.074400>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.103600,-1.535000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.135600,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.675600,0.000000,48.641000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<18.135600,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.859500,0.000000,7.429500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.701000,0.000000,8.636000>}
box{<0,0,-0.152400><2.201537,0.035000,0.152400> rotate<0,-33.229518,0> translate<18.859500,0.000000,7.429500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.675600,-1.535000,11.074400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,-1.535000,8.636000>}
box{<0,0,-0.127000><2.438532,0.035000,0.127000> rotate<0,89.397290,0> translate<20.675600,-1.535000,11.074400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304000,-1.535000,17.449800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,-1.535000,16.052800>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<19.304000,-1.535000,17.449800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,73.469500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,0.000000,68.008500>}
box{<0,0,-0.127000><7.723020,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,0.000000,73.469500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.202400,0.000000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.821200,0.000000,18.973800>}
box{<0,0,-0.127000><1.618800,0.035000,0.127000> rotate<0,0.000000,0> translate<19.202400,0.000000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.142200,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,0.000000,18.796000>}
box{<0,0,-0.152400><0.685800,0.035000,0.152400> rotate<0,0.000000,0> translate<20.142200,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.558000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,22.860000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.558000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,-1.535000,28.829000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,-1.535000,30.353000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.304000,-1.535000,28.829000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.574000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,18.920000>}
box{<0,0,-0.152400><0.301015,0.035000,0.152400> rotate<0,0.570998,0> translate<20.574000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.821200,0.000000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875000,0.000000,18.920000>}
box{<0,0,-0.127000><0.076085,0.035000,0.127000> rotate<0,44.997030,0> translate<20.821200,0.000000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,18.920000>}
box{<0,0,-0.152400><0.132608,0.035000,0.152400> rotate<0,-69.237106,0> translate<20.828000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.875000,0.000000,22.820000>}
box{<0,0,-0.304800><0.061717,0.035000,0.304800> rotate<0,40.397238,0> translate<20.828000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.254000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.875000,0.000000,26.720000>}
box{<0,0,-0.127000><1.621000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.254000,0.000000,26.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,29.820000>}
box{<0,0,-0.152400><0.159101,0.035000,0.152400> rotate<0,72.813035,0> translate<20.828000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,18.920000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,18.796000>}
box{<0,0,-0.152400><0.147567,0.035000,0.152400> rotate<0,57.167685,0> translate<20.875000,0.000000,18.920000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,25.420000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,25.400000>}
box{<0,0,-0.152400><0.082462,0.035000,0.152400> rotate<0,14.035317,0> translate<20.875000,0.000000,25.420000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,29.820000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,29.718000>}
box{<0,0,-0.152400><0.129630,0.035000,0.152400> rotate<0,51.888998,0> translate<20.875000,0.000000,29.820000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,0.000000,73.215500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.145500,0.000000,68.707000>}
box{<0,0,-0.127000><6.375982,0.035000,0.127000> rotate<0,44.997030,0> translate<16.637000,0.000000,73.215500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,0.000000,46.799500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.332500,0.000000,46.799500>}
box{<0,0,-0.127000><1.647500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.685000,0.000000,46.799500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,49.860200>}
box{<0,0,-0.127000><3.269011,0.035000,0.127000> rotate<0,45.626587,0> translate<19.050000,0.000000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,44.831000>}
box{<0,0,-0.127000><1.838000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.558000,0.000000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,46.101000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.396000,0.000000,46.101000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.332500,0.000000,46.799500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,46.736000>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<21.332500,0.000000,46.799500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,47.371000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.396000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.675600,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,48.641000>}
box{<0,0,-0.127000><0.720400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.675600,0.000000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.828000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.396000,0.000000,48.641000>}
box{<0,0,-0.127000><0.568000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.828000,0.000000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.507000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.399500,0.000000,6.350000>}
box{<0,0,-0.152400><0.892500,0.035000,0.152400> rotate<0,0.000000,0> translate<20.507000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.090500,0.000000,39.306500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,0.000000,39.306500>}
box{<0,0,-0.127000><1.309000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.090500,0.000000,39.306500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,-1.535000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,-1.535000,56.769000>}
box{<0,0,-0.127000><2.222500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.177000,-1.535000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.319000,-1.535000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,-1.535000,59.055000>}
box{<0,0,-0.127000><12.271940,0.035000,0.127000> rotate<0,42.270899,0> translate<12.319000,-1.535000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.989000,0.000000,61.156000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,0.000000,60.745500>}
box{<0,0,-0.127000><0.580535,0.035000,0.127000> rotate<0,44.997030,0> translate<20.989000,0.000000,61.156000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,0.000000,60.745500>}
box{<0,0,-0.127000><1.690500,0.035000,0.127000> rotate<0,90.000000,0> translate<21.399500,0.000000,60.745500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.437600,0.000000,29.718000>}
box{<0,0,-0.152400><0.482600,0.035000,0.152400> rotate<0,0.000000,0> translate<20.955000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.507000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.463000,0.000000,2.540000>}
box{<0,0,-0.203200><0.956000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.507000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.463000,0.000000,43.637200>}
box{<0,0,-0.152400><5.207000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.256000,0.000000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.907000,-1.535000,55.562500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.479600,-1.535000,55.486300>}
box{<0,0,-0.127000><3.573413,0.035000,0.127000> rotate<0,1.221796,0> translate<17.907000,-1.535000,55.562500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.364200,0.000000,56.159400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,0.000000,56.159400>}
box{<0,0,-0.127000><3.149600,0.035000,0.127000> rotate<0,0.000000,0> translate<18.364200,0.000000,56.159400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.319500,0.000000,35.623500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.526500,0.000000,35.623500>}
box{<0,0,-0.127000><5.207000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.319500,0.000000,35.623500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,-1.535000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,57.086500>}
box{<0,0,-0.127000><0.370265,0.035000,0.127000> rotate<0,-59.032347,0> translate<21.399500,-1.535000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,73.914000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,74.295000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.590000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.479600,-1.535000,55.486300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635600,-1.535000,55.406500>}
box{<0,0,-0.127000><0.175226,0.035000,0.127000> rotate<0,27.089703,0> translate<21.479600,-1.535000,55.486300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,30.657800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.640800,-1.535000,38.836600>}
box{<0,0,-0.127000><11.566570,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.462000,-1.535000,30.657800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,63.182500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,63.182500>}
box{<0,0,-0.127000><1.460500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.383500,0.000000,63.182500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.002500,-1.535000,53.911500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920200,-1.535000,51.536600>}
box{<0,0,-0.127000><3.052495,0.035000,0.127000> rotate<0,51.076218,0> translate<20.002500,-1.535000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.487400,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.034500,-1.535000,6.350000>}
box{<0,0,-0.152400><8.547100,0.035000,0.152400> rotate<0,0.000000,0> translate<13.487400,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,72.453500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.034500,0.000000,69.469000>}
box{<0,0,-0.127000><4.220720,0.035000,0.127000> rotate<0,44.997030,0> translate<19.050000,0.000000,72.453500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.098000,0.000000,40.767000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.812000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.463000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,1.778000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<21.463000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,63.182500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,62.674500>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<21.844000,0.000000,63.182500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,62.674500>}
box{<0,0,-0.127000><5.905500,0.035000,0.127000> rotate<0,90.000000,0> translate<22.352000,0.000000,62.674500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,73.469500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,70.167500>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,44.997030,0> translate<19.050000,0.000000,73.469500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.621500,0.000000,63.944500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,0.000000,63.944500>}
box{<0,0,-0.152400><2.857500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.621500,0.000000,63.944500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.555200,0.000000,25.400000>}
box{<0,0,-0.152400><1.600200,0.035000,0.152400> rotate<0,0.000000,0> translate<20.955000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.437600,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.555200,0.000000,28.575000>}
box{<0,0,-0.152400><1.598586,0.035000,0.152400> rotate<0,45.640733,0> translate<21.437600,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.555200,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.555200,0.000000,28.575000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<22.555200,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.383500,0.000000,73.215500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.669500,0.000000,70.929500>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<20.383500,0.000000,73.215500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.635600,-1.535000,55.406500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.694900,-1.535000,53.428900>}
box{<0,0,-0.127000><2.243439,0.035000,0.127000> rotate<0,61.820224,0> translate<21.635600,-1.535000,55.406500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,17.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.700000,0.000000,17.620000>}
box{<0,0,-0.152400><1.825000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.875000,0.000000,17.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.700000,0.000000,17.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.733000,0.000000,17.653000>}
box{<0,0,-0.152400><0.046669,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.700000,0.000000,17.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.526500,0.000000,35.623500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,36.830000>}
box{<0,0,-0.127000><1.706249,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.526500,0.000000,35.623500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.399500,0.000000,39.306500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,37.973000>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,44.997030,0> translate<21.399500,0.000000,39.306500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,37.973000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.733000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.336000,0.000000,49.860200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834600,0.000000,49.834800>}
box{<0,0,-0.127000><1.498815,0.035000,0.127000> rotate<0,0.970958,0> translate<21.336000,0.000000,49.860200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.399500,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,0.000000,8.191500>}
box{<0,0,-0.152400><2.350358,0.035000,0.152400> rotate<0,-51.578540,0> translate<21.399500,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.034500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,8.191500>}
box{<0,0,-0.152400><2.018062,0.035000,0.152400> rotate<0,-65.850112,0> translate<22.034500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,8.191500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,11.176000>}
box{<0,0,-0.203200><2.984500,0.035000,0.203200> rotate<0,90.000000,0> translate<22.860000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,75.565000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<21.590000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,75.565000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.860000,0.000000,75.565000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.870000,0.000000,24.120000>}
box{<0,0,-0.152400><1.995000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.875000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.923500,0.000000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.923500,0.000000,57.340500>}
box{<0,0,-0.152400><6.667500,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.923500,0.000000,57.340500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,0.000000,63.944500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.923500,0.000000,64.008000>}
box{<0,0,-0.152400><0.449013,0.035000,0.152400> rotate<0,-8.129566,0> translate<22.479000,0.000000,63.944500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.513800,0.000000,56.159400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.037800,0.000000,54.610000>}
box{<0,0,-0.127000><2.173296,0.035000,0.127000> rotate<0,45.470507,0> translate<21.513800,0.000000,56.159400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.870000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,23.876000>}
box{<0,0,-0.152400><0.345068,0.035000,0.152400> rotate<0,44.997030,0> translate<22.870000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.507000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.153000,0.000000,3.810000>}
box{<0,0,-0.203200><2.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.507000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.507000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.153000,0.000000,5.080000>}
box{<0,0,-0.203200><2.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.507000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.694900,0.000000,53.428900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.304500,0.000000,53.454300>}
box{<0,0,-0.127000><0.610129,0.035000,0.127000> rotate<0,-2.385787,0> translate<22.694900,0.000000,53.428900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,1.778000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,1.778000>}
box{<0,0,-0.203200><4.191000,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.368000,-1.535000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.153000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,3.722000>}
box{<0,0,-0.203200><0.232312,0.035000,0.203200> rotate<0,22.257931,0> translate<23.153000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.153000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,5.422000>}
box{<0,0,-0.203200><0.403967,0.035000,0.203200> rotate<0,-57.840456,0> translate<23.153000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834600,0.000000,49.834800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,0.000000,49.352200>}
box{<0,0,-0.127000><0.817943,0.035000,0.127000> rotate<0,36.155799,0> translate<22.834600,0.000000,49.834800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,0.000000,48.209200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,0.000000,49.352200>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.495000,0.000000,49.352200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.749000,0.000000,55.372000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<22.352000,0.000000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.463000,0.000000,43.637200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.876000,0.000000,41.198800>}
box{<0,0,-0.152400><3.430505,0.035000,0.152400> rotate<0,45.296986,0> translate<21.463000,0.000000,43.637200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,73.914000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,71.628000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<21.590000,0.000000,73.914000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,72.644000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.003000,-1.535000,12.319000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.828000,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.003000,-1.535000,30.353000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.828000,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.733000,-1.535000,17.653000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,17.653000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.733000,-1.535000,17.653000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,18.796000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.955000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,21.590000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<24.130000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.923500,0.000000,57.340500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,56.769000>}
box{<0,0,-0.152400><1.335011,0.035000,0.152400> rotate<0,25.344503,0> translate<22.923500,0.000000,57.340500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.240500,0.000000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,64.897000>}
box{<0,0,-0.152400><4.889500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.240500,0.000000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.091400,-1.535000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.155400,-1.535000,74.295000>}
box{<0,0,-0.152400><5.747364,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.091400,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.155400,-1.535000,74.295000>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,0.000000,0> translate<24.130000,-1.535000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.920200,0.000000,51.536600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,0.000000,51.003200>}
box{<0,0,-0.127000><2.396904,0.035000,0.127000> rotate<0,12.857242,0> translate<21.920200,0.000000,51.536600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.304500,0.000000,53.454300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,0.000000,53.111400>}
box{<0,0,-0.127000><1.012342,0.035000,0.127000> rotate<0,19.797570,0> translate<23.304500,0.000000,53.454300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.155400,-1.535000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.257000,-1.535000,74.295000>}
box{<0,0,-0.152400><0.101600,0.035000,0.152400> rotate<0,0.000000,0> translate<24.155400,-1.535000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,33.985200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.333200,-1.535000,37.998400>}
box{<0,0,-0.127000><5.675522,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.320000,-1.535000,33.985200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.094200,-1.535000,41.808400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460200,-1.535000,49.174400>}
box{<0,0,-0.127000><10.417097,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.094200,-1.535000,41.808400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460200,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460200,-1.535000,49.225200>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,90.000000,0> translate<24.460200,-1.535000,49.225200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.511000,0.000000,18.415000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,44.997030,0> translate<24.130000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.574500,0.000000,64.389000>}
box{<0,0,-0.152400><0.675014,0.035000,0.152400> rotate<0,48.810853,0> translate<24.130000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,22.098000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.130000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,25.273000>}
box{<0,0,-0.152400><3.048000,0.035000,0.152400> rotate<0,90.000000,0> translate<24.638000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701500,0.000000,58.698500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.701500,0.000000,61.023500>}
box{<0,0,-0.127000><2.325000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.701500,0.000000,61.023500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.574500,0.000000,64.389000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.701500,0.000000,63.309500>}
box{<0,0,-0.152400><1.086945,0.035000,0.152400> rotate<0,83.284666,0> translate<24.574500,0.000000,64.389000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.754600,-1.535000,29.895800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.790400,-1.535000,36.931600>}
box{<0,0,-0.127000><9.950124,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.754600,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.859500,0.000000,65.595500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.019000,0.000000,65.595500>}
box{<0,0,-0.152400><6.159500,0.035000,0.152400> rotate<0,0.000000,0> translate<18.859500,0.000000,65.595500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.058000,0.000000,56.769000>}
box{<0,0,-0.152400><0.928000,0.035000,0.152400> rotate<0,0.000000,0> translate<24.130000,0.000000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.701500,0.000000,56.744500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.058000,0.000000,56.769000>}
box{<0,0,-0.152400><0.357341,0.035000,0.152400> rotate<0,-3.931137,0> translate<24.701500,0.000000,56.744500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,18.415000>}
box{<0,0,-0.152400><1.170935,0.035000,0.152400> rotate<0,25.709890,0> translate<24.130000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.511000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,18.415000>}
box{<0,0,-0.152400><0.674000,0.035000,0.152400> rotate<0,0.000000,0> translate<24.511000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,22.225000>}
box{<0,0,-0.152400><0.561550,0.035000,0.152400> rotate<0,-13.070230,0> translate<24.638000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,22.225000>}
box{<0,0,-0.152400><0.547000,0.035000,0.152400> rotate<0,0.000000,0> translate<24.638000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.555200,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,25.400000>}
box{<0,0,-0.152400><2.629800,0.035000,0.152400> rotate<0,0.000000,0> translate<22.555200,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.638000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.185000,0.000000,25.400000>}
box{<0,0,-0.152400><0.561550,0.035000,0.152400> rotate<0,-13.070230,0> translate<24.638000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.257000,-1.535000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.196800,-1.535000,75.539600>}
box{<0,0,-0.152400><1.559568,0.035000,0.152400> rotate<0,-52.939978,0> translate<24.257000,-1.535000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.273000,0.000000,13.258800>}
box{<0,0,-0.203200><6.578600,0.035000,0.203200> rotate<0,0.000000,0> translate<18.694400,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.375500,0.000000,28.980500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.375500,0.000000,28.257500>}
box{<0,0,-0.152400><0.723000,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.375500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.003000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.375500,0.000000,28.980500>}
box{<0,0,-0.152400><1.941008,0.035000,0.152400> rotate<0,44.997030,0> translate<24.003000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,57.086500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.476200,-1.535000,60.071000>}
box{<0,0,-0.127000><4.899979,0.035000,0.127000> rotate<0,-37.520844,0> translate<21.590000,-1.535000,57.086500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,8.255000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.368000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,8.255000>}
box{<0,0,-0.203200><0.863600,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.654000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,3.722000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.742000,0.000000,3.595000>}
box{<0,0,-0.203200><2.377395,0.035000,0.203200> rotate<0,3.061986,0> translate<23.368000,0.000000,3.722000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.875000,0.000000,16.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.845000,0.000000,16.320000>}
box{<0,0,-0.152400><4.970000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.875000,0.000000,16.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.876000,0.000000,41.198800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.908000,0.000000,41.148000>}
box{<0,0,-0.152400><2.032635,0.035000,0.152400> rotate<0,1.432002,0> translate<23.876000,0.000000,41.198800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.908000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.908000,0.000000,41.148000>}
box{<0,0,-0.152400><0.063500,0.035000,0.152400> rotate<0,90.000000,0> translate<25.908000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.908000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,41.021000>}
box{<0,0,-0.152400><0.141990,0.035000,0.152400> rotate<0,26.563298,0> translate<25.908000,0.000000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.168000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.162000,0.000000,31.877000>}
box{<0,0,-0.152400><9.994000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.168000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.669000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.162000,0.000000,66.548000>}
box{<0,0,-0.152400><7.493000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.669000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,5.422000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.250000,0.000000,5.295000>}
box{<0,0,-0.203200><2.884797,0.035000,0.203200> rotate<0,2.523032,0> translate<23.368000,0.000000,5.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.742000,0.000000,3.595000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,2.921000>}
box{<0,0,-0.203200><0.953180,0.035000,0.203200> rotate<0,44.997030,0> translate<25.742000,0.000000,3.595000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.250000,0.000000,5.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,5.461000>}
box{<0,0,-0.203200><0.234759,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.250000,0.000000,5.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,51.003200>}
box{<0,0,-0.127000><1.981200,0.035000,0.127000> rotate<0,90.000000,0> translate<26.543000,0.000000,51.003200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.019000,0.000000,65.595500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,0.000000,65.278000>}
box{<0,0,-0.152400><1.681252,0.035000,0.152400> rotate<0,10.884809,0> translate<25.019000,0.000000,65.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,0.000000,2.921000>}
box{<0,0,-0.203200><0.381000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.416000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,9.118600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,-1.535000,10.261600>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,-1.535000,9.118600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,0.000000,11.734800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,0.000000,10.261600>}
box{<0,0,-0.203200><1.473200,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.797000,0.000000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.273000,0.000000,13.258800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,0.000000,11.734800>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<25.273000,0.000000,13.258800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.845000,0.000000,16.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.797000,0.000000,17.272000>}
box{<0,0,-0.152400><1.346331,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.845000,0.000000,16.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.797000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.797000,0.000000,18.327000>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,90.000000,0> translate<26.797000,0.000000,18.327000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.908000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,41.973500>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.908000,0.000000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,0.000000,48.209200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,47.117000>}
box{<0,0,-0.127000><3.477945,0.035000,0.127000> rotate<0,18.301418,0> translate<23.495000,0.000000,48.209200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,41.973500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,47.117000>}
box{<0,0,-0.127000><5.143500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.797000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.797000,0.000000,18.327000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.885000,0.000000,18.415000>}
box{<0,0,-0.152400><0.124451,0.035000,0.152400> rotate<0,-44.997030,0> translate<26.797000,0.000000,18.327000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,17.653000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,-1.535000,20.447000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.130000,-1.535000,17.653000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.885000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,0.000000,22.186000>}
box{<0,0,-0.152400><0.055154,0.035000,0.152400> rotate<0,44.997030,0> translate<26.885000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,0.000000,22.186000>}
box{<0,0,-0.152400><1.739000,0.035000,0.152400> rotate<0,90.000000,0> translate<26.924000,0.000000,22.186000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.051000,0.000000,5.461000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.416000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.075500,0.000000,30.963500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.075500,0.000000,28.257500>}
box{<0,0,-0.152400><2.706000,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.075500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.162000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.075500,0.000000,30.963500>}
box{<0,0,-0.152400><1.291884,0.035000,0.152400> rotate<0,44.997030,0> translate<26.162000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.037800,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,54.610000>}
box{<0,0,-0.127000><4.140200,0.035000,0.127000> rotate<0,0.000000,0> translate<23.037800,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.701500,0.000000,56.744500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.178000,0.000000,56.744500>}
box{<0,0,-0.152400><2.476500,0.035000,0.152400> rotate<0,0.000000,0> translate<24.701500,0.000000,56.744500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,58.698500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,61.023500>}
box{<0,0,-0.127000><2.325000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.178000,0.000000,61.023500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,67.183000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.495500,0.000000,67.183000>}
box{<0,0,-0.127000><7.937500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.558000,0.000000,67.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,47.904400>}
box{<0,0,-0.127000><1.510393,0.035000,0.127000> rotate<0,47.723161,0> translate<26.543000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,42.824400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,47.904400>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.559000,0.000000,47.904400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,0.000000,65.278000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.559000,0.000000,63.373000>}
box{<0,0,-0.152400><2.102224,0.035000,0.152400> rotate<0,64.978818,0> translate<26.670000,0.000000,65.278000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.178000,0.000000,63.309500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.559000,0.000000,63.373000>}
box{<0,0,-0.152400><0.386255,0.035000,0.152400> rotate<0,-9.461698,0> translate<27.178000,0.000000,63.309500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,42.824400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.703200,0.000000,42.569500>}
box{<0,0,-0.127000><0.292861,0.035000,0.127000> rotate<0,60.498643,0> translate<27.559000,0.000000,42.824400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.178000,0.000000,56.744500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.725000,0.000000,56.642000>}
box{<0,0,-0.152400><0.556521,0.035000,0.152400> rotate<0,10.612630,0> translate<27.178000,0.000000,56.744500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,23.876000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,0.000000,0> translate<23.114000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.885000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,25.400000>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.885000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.067000,-1.535000,24.003000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<27.940000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.067000,0.000000,25.273000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<27.940000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.067000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.067000,0.000000,25.273000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<28.067000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.703200,0.000000,42.569500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,42.078700>}
box{<0,0,-0.127000><0.694096,0.035000,0.127000> rotate<0,44.997030,0> translate<27.703200,0.000000,42.569500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,42.078700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,40.055800>}
box{<0,0,-0.127000><2.023059,0.035000,0.127000> rotate<0,89.274727,0> translate<28.194000,0.000000,42.078700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,0.000000,53.111400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,51.790600>}
box{<0,0,-0.127000><2.134205,0.035000,0.127000> rotate<0,38.231302,0> translate<26.543000,0.000000,53.111400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,43.103800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,51.790600>}
box{<0,0,-0.127000><8.686800,0.035000,0.127000> rotate<0,90.000000,0> translate<28.219400,0.000000,51.790600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.725000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.257500,0.000000,56.642000>}
box{<0,0,-0.152400><0.532500,0.035000,0.152400> rotate<0,0.000000,0> translate<27.725000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.650200,-1.535000,14.427200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.448000,-1.535000,14.427200>}
box{<0,0,-0.127000><7.797800,0.035000,0.127000> rotate<0,0.000000,0> translate<20.650200,-1.535000,14.427200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.749000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.511500,0.000000,55.372000>}
box{<0,0,-0.127000><4.762500,0.035000,0.127000> rotate<0,0.000000,0> translate<23.749000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.003000,-1.535000,12.319000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,-1.535000,12.319000>}
box{<0,0,-0.203200><4.699000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.003000,-1.535000,12.319000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.098000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.702000,0.000000,34.163000>}
box{<0,0,-0.304800><9.339466,0.035000,0.304800> rotate<0,44.997030,0> translate<22.098000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.257500,0.000000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.765500,0.000000,57.848500>}
box{<0,0,-0.152400><1.309086,0.035000,0.152400> rotate<0,-67.161913,0> translate<28.257500,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.162000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.765500,0.000000,64.579500>}
box{<0,0,-0.152400><3.263925,0.035000,0.152400> rotate<0,37.090389,0> translate<26.162000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.765500,0.000000,57.848500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.765500,0.000000,64.579500>}
box{<0,0,-0.152400><6.731000,0.035000,0.152400> rotate<0,90.000000,0> translate<28.765500,0.000000,64.579500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,-1.535000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,10.261600>}
box{<0,0,-0.203200><2.006600,0.035000,0.203200> rotate<0,0.000000,0> translate<26.797000,-1.535000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.702000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,34.163000>}
box{<0,0,-0.304800><0.254000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.702000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,43.103800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,0.000000,42.367200>}
box{<0,0,-0.127000><1.041710,0.035000,0.127000> rotate<0,44.997030,0> translate<28.219400,0.000000,43.103800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,0.000000,42.367200>}
box{<0,0,-0.127000><2.108200,0.035000,0.127000> rotate<0,90.000000,0> translate<28.956000,0.000000,42.367200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.032200,0.000000,52.679600>}
box{<0,0,-0.127000><2.676659,0.035000,0.127000> rotate<0,46.150405,0> translate<27.178000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.032200,0.000000,52.679600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,43.535600>}
box{<0,0,-0.127000><9.144141,0.035000,0.127000> rotate<0,89.675775,0> translate<29.032200,0.000000,52.679600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.885000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.249000,0.000000,18.415000>}
box{<0,0,-0.152400><2.364000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.885000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.885000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.249000,0.000000,22.225000>}
box{<0,0,-0.152400><2.364000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.885000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.249000,0.000000,25.400000>}
box{<0,0,-0.152400><1.309000,0.035000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,0.000000,68.008500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.527500,0.000000,68.008500>}
box{<0,0,-0.127000><8.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.701000,0.000000,68.008500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.511500,0.000000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.654500,0.000000,56.515000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.511500,0.000000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.654500,0.000000,65.024000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.654500,0.000000,56.515000>}
box{<0,0,-0.127000><8.509000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.654500,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.495500,0.000000,67.183000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.654500,0.000000,65.024000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,44.997030,0> translate<27.495500,0.000000,67.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.743400,0.000000,42.875200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.743400,0.000000,40.563800>}
box{<0,0,-0.127000><2.311400,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.743400,0.000000,40.563800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,43.535600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.743400,0.000000,42.875200>}
box{<0,0,-0.127000><0.933947,0.035000,0.127000> rotate<0,44.997030,0> translate<29.083000,0.000000,43.535600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.527500,0.000000,68.008500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,67.183000>}
box{<0,0,-0.127000><1.167433,0.035000,0.127000> rotate<0,44.997030,0> translate<29.527500,0.000000,68.008500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,51.498500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,67.183000>}
box{<0,0,-0.127000><15.684500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,0.000000,67.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.145500,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,68.707000>}
box{<0,0,-0.127000><9.207500,0.035000,0.127000> rotate<0,0.000000,0> translate<21.145500,0.000000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,-1.535000,43.586400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,57.200800>}
box{<0,0,-0.127000><19.253669,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.246600,-1.535000,43.586400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.034500,0.000000,69.469000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,69.469000>}
box{<0,0,-0.127000><8.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.034500,0.000000,69.469000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.448000,0.000000,14.427200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.949000,0.000000,16.928200>}
box{<0,0,-0.127000><3.536948,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.448000,0.000000,14.427200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.949000,0.000000,16.928200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.949000,0.000000,18.415000>}
box{<0,0,-0.127000><1.486800,0.035000,0.127000> rotate<0,90.000000,0> translate<30.949000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.460200,-1.535000,49.225200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.962600,-1.535000,55.727600>}
box{<0,0,-0.127000><9.195782,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.460200,-1.535000,49.225200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.440400,-1.535000,39.166800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.013400,-1.535000,51.739800>}
box{<0,0,-0.127000><17.780907,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.440400,-1.535000,39.166800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.932400,-1.535000,39.979600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.064200,-1.535000,53.111400>}
box{<0,0,-0.127000><18.571170,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.932400,-1.535000,39.979600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,0.000000,67.945000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<30.353000,0.000000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,0.000000,51.752500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,0.000000,67.945000>}
box{<0,0,-0.127000><16.192500,0.035000,0.127000> rotate<0,90.000000,0> translate<31.115000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.949000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.152200,0.000000,22.428200>}
box{<0,0,-0.127000><0.287368,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.949000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,0.000000,40.360600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,0.000000,42.545000>}
box{<0,0,-0.127000><2.184400,0.035000,0.127000> rotate<0,90.000000,0> translate<31.165800,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,70.167500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.178500,0.000000,70.167500>}
box{<0,0,-0.127000><8.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.352000,0.000000,70.167500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.051000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,9.652000>}
box{<0,0,-0.203200><5.926969,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.051000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.348200,-1.535000,40.843200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.318200,-1.535000,54.635400>}
box{<0,0,-0.127000><19.631242,0.035000,0.127000> rotate<0,-44.630115,0> translate<17.348200,-1.535000,40.843200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,-1.535000,16.052800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.343600,-1.535000,16.052800>}
box{<0,0,-0.127000><10.642600,0.035000,0.127000> rotate<0,0.000000,0> translate<20.701000,-1.535000,16.052800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.343600,-1.535000,16.052800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.546800,-1.535000,15.849600>}
box{<0,0,-0.127000><0.287368,0.035000,0.127000> rotate<0,44.997030,0> translate<31.343600,-1.535000,16.052800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.064200,-1.535000,53.111400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.572200,-1.535000,53.111400>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.064200,-1.535000,53.111400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.669500,0.000000,70.929500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,0.000000,70.929500>}
box{<0,0,-0.127000><8.953500,0.035000,0.127000> rotate<0,0.000000,0> translate<22.669500,0.000000,70.929500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.572200,-1.535000,53.111400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724600,-1.535000,52.959000>}
box{<0,0,-0.127000><0.215526,0.035000,0.127000> rotate<0,44.997030,0> translate<31.572200,-1.535000,53.111400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.476200,-1.535000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724600,-1.535000,60.071000>}
box{<0,0,-0.127000><6.248400,0.035000,0.127000> rotate<0,0.000000,0> translate<25.476200,-1.535000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,69.469000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,68.453000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<30.861000,0.000000,69.469000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,68.453000>}
box{<0,0,-0.127000><16.510000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.877000,0.000000,68.453000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,-1.535000,12.319000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.889700,-1.535000,15.506700>}
box{<0,0,-0.203200><4.508089,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.702000,-1.535000,12.319000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.546800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889700,-1.535000,15.506700>}
box{<0,0,-0.127000><0.484934,0.035000,0.127000> rotate<0,44.997030,0> translate<31.546800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.797000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,8.128000>}
box{<0,0,-0.203200><7.363810,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.797000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,71.628000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,71.628000>}
box{<0,0,-0.127000><8.128000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.876000,0.000000,71.628000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724600,-1.535000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,60.045600>}
box{<0,0,-0.127000><0.534004,0.035000,0.127000> rotate<0,2.726131,0> translate<31.724600,-1.535000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,0.000000,72.644000>}
box{<0,0,-0.127000><8.382000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.876000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588200,0.000000,43.967400>}
box{<0,0,-0.127000><2.011577,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.165800,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.803600,-1.535000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.613600,-1.535000,6.451600>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,44.997030,0> translate<28.803600,-1.535000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.178500,0.000000,70.167500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,68.707000>}
box{<0,0,-0.127000><2.065459,0.035000,0.127000> rotate<0,44.997030,0> translate<31.178500,0.000000,70.167500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,52.133500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,68.707000>}
box{<0,0,-0.127000><16.573500,0.035000,0.127000> rotate<0,90.000000,0> translate<32.639000,0.000000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,73.406000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,74.930000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.165800,0.000000,40.360600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.121600,0.000000,38.404800>}
box{<0,0,-0.127000><2.765919,0.035000,0.127000> rotate<0,44.997030,0> translate<31.165800,0.000000,40.360600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.889700,-1.535000,15.506700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.159700,-1.535000,14.236700>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<31.889700,-1.535000,15.506700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.159700,-1.535000,14.236700>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,14.351000>}
box{<0,0,-0.152400><0.161645,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.159700,-1.535000,14.236700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.949000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401000,0.000000,25.400000>}
box{<0,0,-0.127000><2.452000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.949000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.152200,0.000000,22.428200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.553400,0.000000,22.428200>}
box{<0,0,-0.127000><2.401200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.152200,0.000000,22.428200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,0.000000,70.929500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.591500,0.000000,69.024500>}
box{<0,0,-0.127000><2.739346,0.035000,0.127000> rotate<0,44.057901,0> translate<31.623000,0.000000,70.929500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.591500,0.000000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.591500,0.000000,69.024500>}
box{<0,0,-0.127000><16.827500,0.035000,0.127000> rotate<0,90.000000,0> translate<33.591500,0.000000,69.024500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,9.525000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.655000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,0.000000,9.652000>}
box{<0,0,-0.203200><2.413000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.242000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,25.781000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.401000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.588200,0.000000,43.967400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858200,0.000000,43.967400>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.588200,0.000000,43.967400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,-1.535000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.883600,-1.535000,25.781000>}
box{<0,0,-0.127000><0.101600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.782000,-1.535000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,0.000000,8.128000>}
box{<0,0,-0.203200><2.159000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.004000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.333200,-1.535000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.391600,-1.535000,37.998400>}
box{<0,0,-0.127000><10.058400,0.035000,0.127000> rotate<0,0.000000,0> translate<24.333200,-1.535000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.640800,-1.535000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,-1.535000,38.836600>}
box{<0,0,-0.127000><12.776200,0.035000,0.127000> rotate<0,0.000000,0> translate<21.640800,-1.535000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.004000,0.000000,71.628000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,69.088000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<32.004000,0.000000,71.628000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,69.088000>}
box{<0,0,-0.127000><16.764000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.544000,0.000000,69.088000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.121600,0.000000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620200,0.000000,38.404800>}
box{<0,0,-0.127000><1.498600,0.035000,0.127000> rotate<0,0.000000,0> translate<33.121600,0.000000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,8.255000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<33.655000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,0.000000,8.890000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.163000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,12.065000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.925000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,0.000000,12.192000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.925000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,76.835000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.020000,0.000000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,69.596000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,44.997030,0> translate<32.258000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,69.596000>}
box{<0,0,-0.127000><17.018000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.306000,0.000000,69.596000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.356800,0.000000,27.305000>}
box{<0,0,-0.304800><9.380960,0.035000,0.304800> rotate<0,46.971834,0> translate<28.956000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.356800,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.356800,0.000000,27.305000>}
box{<0,0,-0.304800><13.081000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.356800,0.000000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.966400,0.000000,37.668200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.966400,0.000000,38.201600>}
box{<0,0,-0.127000><0.533400,0.035000,0.127000> rotate<0,90.000000,0> translate<35.966400,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.858200,0.000000,43.967400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144200,0.000000,41.681400>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<33.858200,0.000000,43.967400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.743400,0.000000,40.563800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.169600,0.000000,34.137600>}
box{<0,0,-0.127000><9.088019,0.035000,0.127000> rotate<0,44.997030,0> translate<29.743400,0.000000,40.563800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.790400,-1.535000,36.931600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.169600,-1.535000,36.931600>}
box{<0,0,-0.127000><11.379200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.790400,-1.535000,36.931600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.195000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.195000,0.000000,9.652000>}
box{<0,0,-0.635000><2.032000,0.035000,0.635000> rotate<0,90.000000,0> translate<36.195000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,-1.535000,10.795000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<34.925000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,73.406000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,70.231000>}
box{<0,0,-0.127000><4.490128,0.035000,0.127000> rotate<0,44.997030,0> translate<33.020000,0.000000,73.406000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,52.641500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,70.231000>}
box{<0,0,-0.127000><17.589500,0.035000,0.127000> rotate<0,90.000000,0> translate<36.195000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.620200,0.000000,38.404800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.347400,0.000000,40.132000>}
box{<0,0,-0.127000><2.442630,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.620200,0.000000,38.404800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.398200,0.000000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.398200,0.000000,23.799800>}
box{<0,0,-0.127000><8.610600,0.035000,0.127000> rotate<0,90.000000,0> translate<36.398200,0.000000,23.799800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.398200,0.000000,30.759400>}
box{<0,0,-0.152400><14.584113,0.035000,0.152400> rotate<0,44.714806,0> translate<26.035000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.398200,0.000000,30.759400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.665800,0.000000,27.877400>}
box{<0,0,-0.127000><2.894397,0.035000,0.127000> rotate<0,84.689582,0> translate<36.398200,0.000000,30.759400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.398200,0.000000,23.799800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742000,0.000000,25.896200>}
box{<0,0,-0.127000><2.124404,0.035000,0.127000> rotate<0,-80.681332,0> translate<36.398200,0.000000,23.799800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.665800,0.000000,27.877400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.742000,0.000000,25.896200>}
box{<0,0,-0.127000><1.982665,0.035000,0.127000> rotate<0,87.791608,0> translate<36.665800,0.000000,27.877400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.893500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.893500,0.000000,72.453500>}
box{<0,0,-0.127000><19.685000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.893500,0.000000,72.453500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.195000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.957000,0.000000,6.705600>}
box{<0,0,-0.635000><1.190282,0.035000,0.635000> rotate<0,50.191116,0> translate<36.195000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.966400,0.000000,37.668200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.957000,0.000000,36.677600>}
box{<0,0,-0.127000><1.400920,0.035000,0.127000> rotate<0,44.997030,0> translate<35.966400,0.000000,37.668200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.356800,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,0.000000,12.700000>}
box{<0,0,-0.304800><2.499546,0.035000,0.304800> rotate<0,37.566113,0> translate<35.356800,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.195000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.401500,0.000000,10.858500>}
box{<0,0,-0.635000><1.706249,0.035000,0.635000> rotate<0,-44.997030,0> translate<36.195000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.401500,0.000000,10.858500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.465000,0.000000,10.922000>}
box{<0,0,-0.635000><0.089803,0.035000,0.635000> rotate<0,-44.997030,0> translate<37.401500,0.000000,10.858500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.338000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.465000,0.000000,12.192000>}
box{<0,0,-0.304800><0.523634,0.035000,0.304800> rotate<0,75.958743,0> translate<37.338000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.465000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.465000,0.000000,12.192000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,90.000000,0> translate<37.465000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.893500,0.000000,72.453500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,74.295000>}
box{<0,0,-0.127000><1.928143,0.035000,0.127000> rotate<0,-72.753739,0> translate<36.893500,0.000000,72.453500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,76.835000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.465000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.592000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.592000,0.000000,70.993000>}
box{<0,0,-0.127000><18.034000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.592000,0.000000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.169600,-1.535000,36.931600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.074600,-1.535000,38.836600>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.169600,-1.535000,36.931600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.546800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.150800,-1.535000,22.453600>}
box{<0,0,-0.127000><9.339466,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.546800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.150800,-1.535000,22.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201600,-1.535000,22.453600>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,0.000000,0> translate<38.150800,-1.535000,22.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,0.000000,53.149500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,0.000000,70.040500>}
box{<0,0,-0.127000><16.891000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.354000,0.000000,70.040500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.169600,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.455600,0.000000,34.137600>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.169600,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.957000,0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.455600,0.000000,36.677600>}
box{<0,0,-0.127000><1.498600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.957000,0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.401500,0.000000,10.858500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.608000,0.000000,9.652000>}
box{<0,0,-0.635000><1.706249,0.035000,0.635000> rotate<0,44.997030,0> translate<37.401500,0.000000,10.858500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,52.133500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,46.164500>}
box{<0,0,-0.127000><8.441441,0.035000,0.127000> rotate<0,44.997030,0> translate<32.639000,0.000000,52.133500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,48.196500>}
box{<0,0,-0.127000><5.792439,0.035000,0.127000> rotate<0,45.441145,0> translate<34.544000,0.000000,52.324000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.592000,0.000000,70.993000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.671500,0.000000,73.342500>}
box{<0,0,-0.127000><2.585628,0.035000,0.127000> rotate<0,-65.318826,0> translate<37.592000,0.000000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.671500,0.000000,75.374500>}
box{<0,0,-0.127000><1.706249,0.035000,0.127000> rotate<0,44.997030,0> translate<37.465000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.671500,0.000000,73.342500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.671500,0.000000,75.374500>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.671500,0.000000,75.374500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.608000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.735000,0.000000,9.652000>}
box{<0,0,-0.635000><0.127000,0.035000,0.635000> rotate<0,0.000000,0> translate<38.608000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.219400,0.000000,40.055800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.785800,0.000000,29.489400>}
box{<0,0,-0.127000><14.943146,0.035000,0.127000> rotate<0,44.997030,0> translate<28.219400,0.000000,40.055800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.887400,0.000000,30.327600>}
box{<0,0,-0.127000><14.045121,0.035000,0.127000> rotate<0,44.997030,0> translate<28.956000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,69.532500>}
box{<0,0,-0.127000><16.192500,0.035000,0.127000> rotate<0,90.000000,0> translate<38.989000,0.000000,69.532500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.591500,0.000000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.103300,0.000000,46.685200>}
box{<0,0,-0.127000><7.794862,0.035000,0.127000> rotate<0,44.997030,0> translate<33.591500,0.000000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.198800,0.000000,48.685200>}
box{<0,0,-0.127000><5.505251,0.035000,0.127000> rotate<0,44.997030,0> translate<35.306000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,52.641500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,49.212500>}
box{<0,0,-0.127000><4.849338,0.035000,0.127000> rotate<0,44.997030,0> translate<36.195000,0.000000,52.641500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,53.784500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,68.961000>}
box{<0,0,-0.127000><15.176500,0.035000,0.127000> rotate<0,90.000000,0> translate<39.624000,0.000000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,51.498500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.666300,0.000000,42.185200>}
box{<0,0,-0.127000><13.170995,0.035000,0.127000> rotate<0,44.997030,0> translate<30.353000,0.000000,51.498500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,-1.535000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.700200,-1.535000,44.119800>}
box{<0,0,-0.127000><7.471573,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.417000,-1.535000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.883600,-1.535000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.725600,-1.535000,31.953200>}
box{<0,0,-0.127000><8.498530,0.035000,0.127000> rotate<0,-46.571255,0> translate<33.883600,-1.535000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.674800,-1.535000,35.331400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.725600,-1.535000,31.953200>}
box{<0,0,-0.127000><3.378582,0.035000,0.127000> rotate<0,89.132591,0> translate<39.674800,-1.535000,35.331400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.700200,0.000000,35.331400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.725600,0.000000,32.054800>}
box{<0,0,-0.127000><3.276698,0.035000,0.127000> rotate<0,89.549945,0> translate<39.700200,0.000000,35.331400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.893500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.976800,0.000000,49.685200>}
box{<0,0,-0.127000><4.360445,0.035000,0.127000> rotate<0,44.997030,0> translate<36.893500,0.000000,52.768500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.398200,0.000000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,12.192000>}
box{<0,0,-0.127000><4.689586,0.035000,0.127000> rotate<0,39.723482,0> translate<36.398200,0.000000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.391600,-1.535000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,43.611800>}
box{<0,0,-0.127000><7.938546,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.391600,-1.535000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,76.835000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.005000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,0.000000,70.040500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.068500,0.000000,73.025000>}
box{<0,0,-0.127000><3.441911,0.035000,0.127000> rotate<0,-60.120039,0> translate<38.354000,0.000000,70.040500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.068500,0.000000,74.231500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<40.005000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.068500,0.000000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.068500,0.000000,74.231500>}
box{<0,0,-0.127000><1.206500,0.035000,0.127000> rotate<0,90.000000,0> translate<40.068500,0.000000,74.231500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,0.000000,51.752500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.182300,0.000000,42.685200>}
box{<0,0,-0.127000><12.823099,0.035000,0.127000> rotate<0,44.997030,0> translate<31.115000,0.000000,51.752500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.966400,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.233600,-1.535000,42.926000>}
box{<0,0,-0.127000><6.366235,0.035000,0.127000> rotate<0,-47.907676,0> translate<35.966400,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.322500,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.322500,0.000000,68.453000>}
box{<0,0,-0.127000><14.351000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.322500,0.000000,68.453000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.725600,0.000000,32.054800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.335200,0.000000,31.775400>}
box{<0,0,-0.127000><0.670579,0.035000,0.127000> rotate<0,24.621940,0> translate<39.725600,0.000000,32.054800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.592000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,0.000000,50.165000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,44.997030,0> translate<37.592000,0.000000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,43.180000>}
box{<0,0,-0.127000><12.392753,0.035000,0.127000> rotate<0,44.997030,0> translate<31.877000,0.000000,51.943000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.318200,-1.535000,54.635400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.690800,-1.535000,54.686200>}
box{<0,0,-0.127000><9.372738,0.035000,0.127000> rotate<0,-0.310523,0> translate<31.318200,-1.535000,54.635400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,0.000000,53.149500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.818300,0.000000,50.685200>}
box{<0,0,-0.127000><3.485046,0.035000,0.127000> rotate<0,44.997030,0> translate<38.354000,0.000000,53.149500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.553400,-1.535000,22.428200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970200,-1.535000,30.276800>}
box{<0,0,-0.127000><10.798585,0.035000,0.127000> rotate<0,-46.617171,0> translate<33.553400,-1.535000,22.428200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.970200,-1.535000,30.276800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.995600,-1.535000,34.137600>}
box{<0,0,-0.127000><3.860884,0.035000,0.127000> rotate<0,-89.617145,0> translate<40.970200,-1.535000,30.276800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.674800,-1.535000,35.331400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.995600,-1.535000,36.677600>}
box{<0,0,-0.127000><1.885939,0.035000,0.127000> rotate<0,-45.542652,0> translate<39.674800,-1.535000,35.331400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.700200,0.000000,35.331400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.995600,0.000000,36.677600>}
box{<0,0,-0.127000><1.868239,0.035000,0.127000> rotate<0,-46.098664,0> translate<39.700200,0.000000,35.331400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.148000,0.000000,51.181000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,44.997030,0> translate<38.989000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,52.133500>}
box{<0,0,-0.127000><0.063500,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.211500,0.000000,52.133500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,53.784500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,52.197000>}
box{<0,0,-0.127000><2.245064,0.035000,0.127000> rotate<0,44.997030,0> translate<39.624000,0.000000,53.784500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.989000,0.000000,69.532500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,73.025000>}
box{<0,0,-0.127000><4.139694,0.035000,0.127000> rotate<0,-57.525011,0> translate<38.989000,0.000000,69.532500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,75.374500>}
box{<0,0,-0.127000><1.706249,0.035000,0.127000> rotate<0,44.997030,0> translate<40.005000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,75.374500>}
box{<0,0,-0.127000><2.349500,0.035000,0.127000> rotate<0,90.000000,0> translate<41.211500,0.000000,75.374500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.995600,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.325800,-1.535000,34.798000>}
box{<0,0,-0.127000><0.738350,0.035000,0.127000> rotate<0,-63.430762,0> translate<40.995600,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.690800,-1.535000,54.686200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.376600,-1.535000,54.483000>}
box{<0,0,-0.127000><0.715270,0.035000,0.127000> rotate<0,16.503272,0> translate<40.690800,-1.535000,54.686200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.211500,0.000000,52.133500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.659800,0.000000,51.685200>}
box{<0,0,-0.127000><0.633992,0.035000,0.127000> rotate<0,44.997030,0> translate<41.211500,0.000000,52.133500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.005000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.783000,0.000000,12.192000>}
box{<0,0,-0.635000><1.778000,0.035000,0.635000> rotate<0,0.000000,0> translate<40.005000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,8.255000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.925000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.325800,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.960800,-1.535000,35.433000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.325800,-1.535000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.376600,-1.535000,54.483000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,54.229000>}
box{<0,0,-0.127000><0.660400,0.035000,0.127000> rotate<0,22.618372,0> translate<41.376600,-1.535000,54.483000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.962600,-1.535000,55.727600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.011600,-1.535000,55.626000>}
box{<0,0,-0.127000><11.049467,0.035000,0.127000> rotate<0,0.526808,0> translate<30.962600,-1.535000,55.727600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,57.200800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.138600,-1.535000,57.200800>}
box{<0,0,-0.127000><11.277600,0.035000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.535000,57.200800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.275000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.164000,0.000000,10.541000>}
box{<0,0,-0.635000><1.257236,0.035000,0.635000> rotate<0,-44.997030,0> translate<41.275000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.164000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.164000,0.000000,10.541000>}
box{<0,0,-0.635000><1.143000,0.035000,0.635000> rotate<0,-90.000000,0> translate<42.164000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<41.783000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.164000,0.000000,11.684000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,53.126596,0> translate<41.783000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.347400,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,40.132000>}
box{<0,0,-0.127000><5.943600,0.035000,0.127000> rotate<0,0.000000,0> translate<36.347400,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.322500,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,52.133500>}
box{<0,0,-0.127000><2.783879,0.035000,0.127000> rotate<0,44.997030,0> translate<40.322500,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,8.890000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.910000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.164000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.545000,0.000000,12.192000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,-53.126596,0> translate<42.164000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,73.152000>}
box{<0,0,-0.127000><5.108495,0.035000,0.127000> rotate<0,-55.121034,0> translate<39.624000,0.000000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,73.152000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,74.295000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.545000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,76.517500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,76.835000>}
box{<0,0,-0.127000><0.317500,0.035000,0.127000> rotate<0,90.000000,0> translate<42.545000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.074600,-1.535000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.849800,-1.535000,38.836600>}
box{<0,0,-0.127000><4.775200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.074600,-1.535000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,60.045600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900600,-1.535000,60.071000>}
box{<0,0,-0.127000><10.642630,0.035000,0.127000> rotate<0,-0.136735,0> translate<32.258000,-1.535000,60.045600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.989500,0.000000,41.084500>}
box{<0,0,-0.127000><9.461500,0.035000,0.127000> rotate<0,0.000000,0> translate<33.528000,0.000000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.989500,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.053000,0.000000,41.148000>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.989500,0.000000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.724600,-1.535000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.256200,-1.535000,52.959000>}
box{<0,0,-0.127000><11.531600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.724600,-1.535000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.900600,-1.535000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.281600,-1.535000,60.020200>}
box{<0,0,-0.127000><0.384372,0.035000,0.127000> rotate<0,7.594142,0> translate<42.900600,-1.535000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201600,0.000000,22.453600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.383200,0.000000,27.635200>}
box{<0,0,-0.127000><7.327889,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.201600,0.000000,22.453600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.986200,-1.535000,54.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,54.914800>}
box{<0,0,-0.127000><1.579096,0.035000,0.127000> rotate<0,-25.739010,0> translate<41.986200,-1.535000,54.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,54.914800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,55.473600>}
box{<0,0,-0.127000><0.558800,0.035000,0.127000> rotate<0,90.000000,0> translate<43.408600,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.408600,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.586400,-1.535000,56.184800>}
box{<0,0,-0.127000><0.733088,0.035000,0.127000> rotate<0,-75.958743,0> translate<43.408600,-1.535000,55.473600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.138600,-1.535000,57.200800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.637200,-1.535000,58.699400>}
box{<0,0,-0.127000><2.119340,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.138600,-1.535000,57.200800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.196800,-1.535000,75.539600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.688000,-1.535000,75.539600>}
box{<0,0,-0.152400><18.491200,0.035000,0.152400> rotate<0,0.000000,0> translate<25.196800,-1.535000,75.539600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.011600,0.000000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.707800,0.000000,52.685200>}
box{<0,0,-0.127000><3.394908,0.035000,0.127000> rotate<0,60.020472,0> translate<42.011600,0.000000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.535600,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.738800,-1.535000,34.010600>}
box{<0,0,-0.127000><0.239623,0.035000,0.127000> rotate<0,32.003271,0> translate<43.535600,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.738800,-1.535000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.738800,-1.535000,34.010600>}
box{<0,0,-0.127000><5.207000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.738800,-1.535000,34.010600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.322500,0.000000,68.453000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,73.215500>}
box{<0,0,-0.127000><5.905841,0.035000,0.127000> rotate<0,-53.742615,0> translate<40.322500,0.000000,68.453000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,76.517500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,75.247500>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<42.545000,0.000000,76.517500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,73.215500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,75.247500>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.815000,0.000000,75.247500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.535600,-1.535000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,36.703000>}
box{<0,0,-0.127000><0.356506,0.035000,0.127000> rotate<0,-4.085347,0> translate<43.535600,-1.535000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,36.703000>}
box{<0,0,-0.127000><1.092200,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.891200,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.849800,-1.535000,38.836600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,37.795200>}
box{<0,0,-0.127000><1.472762,0.035000,0.127000> rotate<0,44.997030,0> translate<42.849800,-1.535000,38.836600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,41.478200>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.891200,-1.535000,41.478200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.281600,-1.535000,60.020200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.043600,-1.535000,59.994800>}
box{<0,0,-0.127000><0.762423,0.035000,0.127000> rotate<0,1.909026,0> translate<43.281600,-1.535000,60.020200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.586400,-1.535000,56.184800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.246800,-1.535000,56.667400>}
box{<0,0,-0.127000><0.817943,0.035000,0.127000> rotate<0,-36.155799,0> translate<43.586400,-1.535000,56.184800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,46.164500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.252500,0.000000,46.164500>}
box{<0,0,-0.127000><5.644500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.608000,0.000000,46.164500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,52.133500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.348500,0.000000,52.133500>}
box{<0,0,-0.127000><2.057500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.291000,0.000000,52.133500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.053000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.363000,0.000000,41.148000>}
box{<0,0,-0.127000><1.310000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.053000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,49.212500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.372900,0.000000,49.212500>}
box{<0,0,-0.127000><4.748900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.624000,0.000000,49.212500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.380000,0.000000,50.165000>}
box{<0,0,-0.127000><3.994000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.386000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,48.196500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.388900,0.000000,48.196500>}
box{<0,0,-0.127000><5.780900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.608000,0.000000,48.196500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.395000,0.000000,43.180000>}
box{<0,0,-0.127000><3.755000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.640000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.148000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.396000,0.000000,51.181000>}
box{<0,0,-0.127000><3.248000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.148000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.363000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,41.185200>}
box{<0,0,-0.127000><0.052609,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.363000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.666300,0.000000,42.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,42.185200>}
box{<0,0,-0.127000><4.733900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.666300,0.000000,42.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.182300,0.000000,42.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,42.685200>}
box{<0,0,-0.127000><4.217900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.182300,0.000000,42.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.395000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,43.185200>}
box{<0,0,-0.127000><0.007354,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.395000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.252500,0.000000,46.164500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,46.185200>}
box{<0,0,-0.127000><0.149143,0.035000,0.127000> rotate<0,-7.977454,0> translate<44.252500,0.000000,46.164500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.103300,0.000000,46.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,46.685200>}
box{<0,0,-0.127000><5.296900,0.035000,0.127000> rotate<0,0.000000,0> translate<39.103300,0.000000,46.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.390800,0.000000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,47.685200>}
box{<0,0,-0.127000><0.013294,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.390800,0.000000,47.675800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.388900,0.000000,48.196500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,48.185200>}
box{<0,0,-0.127000><0.015981,0.035000,0.127000> rotate<0,44.997030,0> translate<44.388900,0.000000,48.196500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.198800,0.000000,48.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,48.685200>}
box{<0,0,-0.127000><5.201400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.198800,0.000000,48.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.372900,0.000000,49.212500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,49.185200>}
box{<0,0,-0.127000><0.038608,0.035000,0.127000> rotate<0,44.997030,0> translate<44.372900,0.000000,49.212500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.976800,0.000000,49.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,49.685200>}
box{<0,0,-0.127000><4.423400,0.035000,0.127000> rotate<0,0.000000,0> translate<39.976800,0.000000,49.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.380000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,50.185200>}
box{<0,0,-0.127000><0.028567,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.380000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.818300,0.000000,50.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,50.685200>}
box{<0,0,-0.127000><3.581900,0.035000,0.127000> rotate<0,0.000000,0> translate<40.818300,0.000000,50.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.396000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,51.185200>}
box{<0,0,-0.127000><0.005940,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.396000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.659800,0.000000,51.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,51.685200>}
box{<0,0,-0.127000><2.740400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.659800,0.000000,51.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.348500,0.000000,52.133500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,52.185200>}
box{<0,0,-0.127000><0.073115,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.348500,0.000000,52.133500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.707800,0.000000,52.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,52.685200>}
box{<0,0,-0.127000><0.692400,0.035000,0.127000> rotate<0,0.000000,0> translate<43.707800,0.000000,52.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.144200,0.000000,41.681400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.404000,0.000000,41.681400>}
box{<0,0,-0.127000><8.259800,0.035000,0.127000> rotate<0,0.000000,0> translate<36.144200,0.000000,41.681400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,41.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.404000,0.000000,41.681400>}
box{<0,0,-0.127000><0.005374,0.035000,0.127000> rotate<0,44.997030,0> translate<44.400200,0.000000,41.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,47.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.408200,0.000000,47.193200>}
box{<0,0,-0.127000><0.011314,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.400200,0.000000,47.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.383200,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.463600,0.000000,27.635200>}
box{<0,0,-0.127000><1.080400,0.035000,0.127000> rotate<0,0.000000,0> translate<43.383200,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.246800,-1.535000,56.667400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.551600,-1.535000,57.175400>}
box{<0,0,-0.127000><0.592425,0.035000,0.127000> rotate<0,-59.032347,0> translate<44.246800,-1.535000,56.667400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400200,0.000000,40.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,0.000000,40.685200>}
box{<0,0,-0.127000><0.176800,0.035000,0.127000> rotate<0,0.000000,0> translate<44.400200,0.000000,40.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.557900,0.000000,39.352400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,0.000000,40.685200>}
box{<0,0,-0.127000><1.332937,0.035000,0.127000> rotate<0,-89.173080,0> translate<44.557900,0.000000,39.352400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,38.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,40.919400>}
box{<0,0,-0.127000><2.743200,0.035000,0.127000> rotate<0,90.000000,0> translate<44.577000,-1.535000,40.919400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.551600,-1.535000,57.175400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,57.251600>}
box{<0,0,-0.127000><0.080322,0.035000,0.127000> rotate<0,-71.560328,0> translate<44.551600,-1.535000,57.175400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.551600,-1.535000,57.226200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,57.251600>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.551600,-1.535000,57.226200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.891200,-1.535000,41.478200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.678600,-1.535000,42.265600>}
box{<0,0,-0.127000><1.113552,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.891200,-1.535000,41.478200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.256200,-1.535000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881800,-1.535000,54.584600>}
box{<0,0,-0.127000><2.298946,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.256200,-1.535000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881800,-1.535000,54.584600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881800,-1.535000,54.686200>}
box{<0,0,-0.127000><0.101600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.881800,-1.535000,54.686200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.881800,0.000000,54.686200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.882800,0.000000,54.685200>}
box{<0,0,-0.127000><0.001414,0.035000,0.127000> rotate<0,44.997030,0> translate<44.881800,0.000000,54.686200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.557900,0.000000,39.352400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.989600,0.000000,38.912800>}
box{<0,0,-0.127000><0.616127,0.035000,0.127000> rotate<0,45.516477,0> translate<44.557900,0.000000,39.352400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.688000,-1.535000,75.539600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.034200,-1.535000,74.295000>}
box{<0,0,-0.152400><1.833380,0.035000,0.152400> rotate<0,42.751436,0> translate<43.688000,-1.535000,75.539600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.059600,0.000000,37.439600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.059600,0.000000,36.398200>}
box{<0,0,-0.127000><1.041400,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.059600,0.000000,36.398200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,37.465000>}
box{<0,0,-0.127000><3.862554,0.035000,0.127000> rotate<0,43.664898,0> translate<42.291000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.059600,0.000000,37.439600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,37.465000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.059600,0.000000,37.439600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.034200,-1.535000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.085000,-1.535000,74.295000>}
box{<0,0,-0.152400><0.050800,0.035000,0.152400> rotate<0,0.000000,0> translate<45.034200,-1.535000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.960800,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.110400,-1.535000,35.433000>}
box{<0,0,-0.127000><3.149600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.960800,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,40.919400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,-1.535000,41.554400>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.577000,-1.535000,40.919400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.110400,-1.535000,35.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.389800,-1.535000,35.712400>}
box{<0,0,-0.127000><0.395131,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.110400,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,38.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.389800,-1.535000,37.363400>}
box{<0,0,-0.127000><1.149473,0.035000,0.127000> rotate<0,44.997030,0> translate<44.577000,-1.535000,38.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.389800,-1.535000,35.712400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.389800,-1.535000,37.363400>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.389800,-1.535000,37.363400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.989600,0.000000,38.912800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.618400,0.000000,38.284000>}
box{<0,0,-0.127000><0.889257,0.035000,0.127000> rotate<0,44.997030,0> translate<44.989600,0.000000,38.912800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.618400,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.618400,0.000000,38.284000>}
box{<0,0,-0.127000><0.514200,0.035000,0.127000> rotate<0,90.000000,0> translate<45.618400,0.000000,38.284000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.335200,0.000000,31.775400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.694600,0.000000,31.775400>}
box{<0,0,-0.127000><5.359400,0.035000,0.127000> rotate<0,0.000000,0> translate<40.335200,0.000000,31.775400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.738800,-1.535000,28.803600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.872400,-1.535000,26.670000>}
box{<0,0,-0.127000><3.017366,0.035000,0.127000> rotate<0,44.997030,0> translate<43.738800,-1.535000,28.803600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.390800,0.000000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.929800,0.000000,47.675800>}
box{<0,0,-0.127000><1.539000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.390800,0.000000,47.675800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.694600,-1.535000,31.775400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.101000,-1.535000,32.181800>}
box{<0,0,-0.127000><0.574736,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.694600,-1.535000,31.775400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.101000,-1.535000,32.181800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.101000,-1.535000,34.163000>}
box{<0,0,-0.127000><1.981200,0.035000,0.127000> rotate<0,90.000000,0> translate<46.101000,-1.535000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.618400,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.202600,0.000000,37.185600>}
box{<0,0,-0.127000><0.826184,0.035000,0.127000> rotate<0,44.997030,0> translate<45.618400,0.000000,37.769800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.400200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.400200,0.000000,40.761400>}
box{<0,0,-0.127000><2.076200,0.035000,0.127000> rotate<0,90.000000,0> translate<46.400200,0.000000,40.761400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.882800,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.400200,0.000000,54.685200>}
box{<0,0,-0.127000><1.517400,0.035000,0.127000> rotate<0,0.000000,0> translate<44.882800,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.408200,0.000000,47.193200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.405800,0.000000,47.193200>}
box{<0,0,-0.127000><1.997600,0.035000,0.127000> rotate<0,0.000000,0> translate<44.408200,0.000000,47.193200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.545000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.482000,0.000000,12.192000>}
box{<0,0,-0.635000><3.937000,0.035000,0.635000> rotate<0,0.000000,0> translate<42.545000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.700200,-1.535000,44.119800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.558200,-1.535000,44.094400>}
box{<0,0,-0.127000><6.858047,0.035000,0.127000> rotate<0,0.212192,0> translate<39.700200,-1.535000,44.119800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.887400,0.000000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.583600,0.000000,30.327600>}
box{<0,0,-0.127000><7.696200,0.035000,0.127000> rotate<0,0.000000,0> translate<38.887400,0.000000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.059600,0.000000,36.398200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.583600,0.000000,34.899600>}
box{<0,0,-0.127000><2.137376,0.035000,0.127000> rotate<0,44.515596,0> translate<45.059600,0.000000,36.398200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,43.611800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.786800,-1.535000,43.561000>}
box{<0,0,-0.127000><6.781990,0.035000,0.127000> rotate<0,0.429146,0> translate<40.005000,-1.535000,43.611800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.785800,0.000000,29.489400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.812200,0.000000,29.464000>}
box{<0,0,-0.127000><8.026440,0.035000,0.127000> rotate<0,0.181303,0> translate<38.785800,0.000000,29.489400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.013400,-1.535000,51.739800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,-1.535000,51.739800>}
box{<0,0,-0.127000><15.849600,0.035000,0.127000> rotate<0,0.000000,0> translate<31.013400,-1.535000,51.739800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.202600,0.000000,37.185600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,37.160200>}
box{<0,0,-0.127000><0.686270,0.035000,0.127000> rotate<0,2.120956,0> translate<46.202600,0.000000,37.185600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,38.697000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,40.411400>}
box{<0,0,-0.127000><1.714400,0.035000,0.127000> rotate<0,90.000000,0> translate<46.888400,0.000000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,38.697000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.900200,0.000000,38.685200>}
box{<0,0,-0.127000><0.016688,0.035000,0.127000> rotate<0,44.997030,0> translate<46.888400,0.000000,38.697000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.101000,-1.535000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.066200,-1.535000,35.128200>}
box{<0,0,-0.127000><1.364999,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.101000,-1.535000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.066200,-1.535000,35.128200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.066200,-1.535000,39.243000>}
box{<0,0,-0.127000><4.114800,0.035000,0.127000> rotate<0,90.000000,0> translate<47.066200,-1.535000,39.243000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.233600,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.091600,-1.535000,42.900600>}
box{<0,0,-0.127000><6.858047,0.035000,0.127000> rotate<0,0.212192,0> translate<40.233600,-1.535000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.583600,0.000000,34.899600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.142400,0.000000,34.899600>}
box{<0,0,-0.127000><0.558800,0.035000,0.127000> rotate<0,0.000000,0> translate<46.583600,0.000000,34.899600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.443900,0.000000,45.897800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.308000,0.000000,44.932100>}
box{<0,0,-0.127000><1.295857,0.035000,0.127000> rotate<0,48.174916,0> translate<46.443900,0.000000,45.897800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.400200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.400200,0.000000,39.881800>}
box{<0,0,-0.127000><1.196600,0.035000,0.127000> rotate<0,90.000000,0> translate<47.400200,0.000000,39.881800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.678600,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.548800,-1.535000,42.291000>}
box{<0,0,-0.127000><2.870312,0.035000,0.127000> rotate<0,-0.506996,0> translate<44.678600,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.551600,-1.535000,57.226200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.599600,-1.535000,57.226200>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.551600,-1.535000,57.226200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,-1.535000,41.554400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.904400,-1.535000,41.579800>}
box{<0,0,-0.127000><2.692520,0.035000,0.127000> rotate<0,-0.540475,0> translate<45.212000,-1.535000,41.554400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.599600,-1.535000,57.226200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.056800,-1.535000,56.769000>}
box{<0,0,-0.127000><0.646578,0.035000,0.127000> rotate<0,44.997030,0> translate<47.599600,-1.535000,57.226200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.142400,0.000000,34.899600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.082200,0.000000,33.629600>}
box{<0,0,-0.127000><1.579913,0.035000,0.127000> rotate<0,53.495028,0> translate<47.142400,0.000000,34.899600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.082200,-1.535000,33.629600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.107600,-1.535000,33.629600>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<48.082200,-1.535000,33.629600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.056800,0.000000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.107600,0.000000,56.769000>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,0.000000,0> translate<48.056800,0.000000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.082200,-1.535000,33.629600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.234600,-1.535000,33.426400>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,53.126596,0> translate<48.082200,-1.535000,33.629600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,8.890000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,0.000000,0> translate<42.545000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,37.324800>}
box{<0,0,-0.127000><1.360400,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.400200,0.000000,37.324800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,39.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,38.685200>}
box{<0,0,-0.127000><1.256800,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.400200,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,0.000000,51.739800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,53.277000>}
box{<0,0,-0.127000><2.173929,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.863000,0.000000,51.739800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,53.277000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,54.685200>}
box{<0,0,-0.127000><1.408200,0.035000,0.127000> rotate<0,90.000000,0> translate<48.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.637200,-1.535000,58.699400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.488600,-1.535000,58.699400>}
box{<0,0,-0.127000><4.851400,0.035000,0.127000> rotate<0,0.000000,0> translate<43.637200,-1.535000,58.699400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,37.160200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.691800,0.000000,35.356800>}
box{<0,0,-0.127000><2.550393,0.035000,0.127000> rotate<0,44.997030,0> translate<46.888400,0.000000,37.160200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.691800,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.691800,-1.535000,36.347400>}
box{<0,0,-0.127000><0.990600,0.035000,0.127000> rotate<0,90.000000,0> translate<48.691800,-1.535000,36.347400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.417600,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.805700,0.000000,27.635200>}
box{<0,0,-0.127000><2.388100,0.035000,0.127000> rotate<0,0.000000,0> translate<46.417600,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,-1.535000,10.795000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.195000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,38.680000>}
box{<0,0,-0.152400><0.961000,0.035000,0.152400> rotate<0,90.000000,0> translate<48.895000,0.000000,38.680000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.895000,0.000000,55.981600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.895000,0.000000,54.690400>}
box{<0,0,-0.127000><1.291200,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.895000,0.000000,54.690400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.107600,0.000000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.895000,0.000000,55.981600>}
box{<0,0,-0.127000><1.113552,0.035000,0.127000> rotate<0,44.997030,0> translate<48.107600,0.000000,56.769000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,38.680000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.900200,0.000000,38.685200>}
box{<0,0,-0.152400><0.007354,0.035000,0.152400> rotate<0,-44.997030,0> translate<48.895000,0.000000,38.680000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.900200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.900200,0.000000,39.654600>}
box{<0,0,-0.127000><0.969400,0.035000,0.127000> rotate<0,90.000000,0> translate<48.900200,0.000000,39.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.895000,0.000000,54.690400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.007354,0.035000,0.127000> rotate<0,44.997030,0> translate<48.895000,0.000000,54.690400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.945800,0.000000,58.724800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.945800,0.000000,65.356300>}
box{<0,0,-0.127000><6.631500,0.035000,0.127000> rotate<0,90.000000,0> translate<48.945800,0.000000,65.356300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.583600,0.000000,30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.301400,0.000000,33.045400>}
box{<0,0,-0.127000><3.843550,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.583600,0.000000,30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.888400,0.000000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.301400,0.000000,42.824400>}
box{<0,0,-0.127000><3.412497,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.888400,0.000000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.400200,0.000000,39.881800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,41.833800>}
box{<0,0,-0.127000><2.796697,0.035000,0.127000> rotate<0,-44.261146,0> translate<47.400200,0.000000,39.881800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,54.688000>}
box{<0,0,-0.127000><0.003960,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.945800,0.000000,58.724800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,58.267600>}
box{<0,0,-0.127000><0.646578,0.035000,0.127000> rotate<0,44.997030,0> translate<48.945800,0.000000,58.724800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,54.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,58.267600>}
box{<0,0,-0.127000><3.579600,0.035000,0.127000> rotate<0,90.000000,0> translate<49.403000,0.000000,58.267600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.400200,0.000000,40.761400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.479200,0.000000,43.840400>}
box{<0,0,-0.127000><4.354364,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.400200,0.000000,40.761400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.400200,0.000000,39.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504600,0.000000,41.021000>}
box{<0,0,-0.127000><1.544001,0.035000,0.127000> rotate<0,-44.330569,0> translate<48.400200,0.000000,39.942000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,9.525000>}
box{<0,0,-0.152400><1.419903,0.035000,0.152400> rotate<0,-26.563298,0> translate<48.260000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,9.652000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.530000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.812200,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.580800,0.000000,32.232600>}
box{<0,0,-0.127000><3.915392,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.812200,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.929800,0.000000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.612700,0.000000,51.358700>}
box{<0,0,-0.127000><5.208407,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.929800,0.000000,47.675800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.612700,0.000000,52.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.612700,0.000000,51.358700>}
box{<0,0,-0.127000><1.212800,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.612700,0.000000,51.358700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.606200,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.612700,0.000000,52.571500>}
box{<0,0,-0.127000><0.009192,0.035000,0.127000> rotate<0,44.997030,0> translate<49.606200,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.443900,-1.535000,45.897800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.618900,-1.535000,50.203100>}
box{<0,0,-0.127000><5.349414,0.035000,0.127000> rotate<0,-53.589057,0> translate<46.443900,-1.535000,45.897800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.606200,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.618900,-1.535000,50.203100>}
box{<0,0,-0.127000><2.374934,0.035000,0.127000> rotate<0,89.687689,0> translate<49.606200,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.900200,0.000000,39.654600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631600,0.000000,40.386000>}
box{<0,0,-0.127000><1.034356,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.900200,0.000000,39.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.657000,0.000000,58.851800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.657000,0.000000,65.024000>}
box{<0,0,-0.127000><6.172200,0.035000,0.127000> rotate<0,90.000000,0> translate<49.657000,0.000000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,78.994000>}
box{<0,0,-0.203200><6.645390,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.085000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.657000,0.000000,58.851800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,0.000000,58.547000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,53.126596,0> translate<49.657000,0.000000,58.851800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,0.000000,54.696000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,0.000000,58.547000>}
box{<0,0,-0.127000><3.851000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.885600,0.000000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.043600,-1.535000,59.994800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,-1.535000,59.994800>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.043600,-1.535000,59.994800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,0.000000,54.696000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.018160,0.035000,0.127000> rotate<0,36.488888,0> translate<49.885600,0.000000,54.696000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.911000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.911000,0.000000,29.337000>}
box{<0,0,-0.635000><1.397000,0.035000,0.635000> rotate<0,90.000000,0> translate<49.911000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.900200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.911000,0.000000,54.696000>}
box{<0,0,-0.152400><0.015274,0.035000,0.152400> rotate<0,-44.997030,0> translate<49.900200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.945800,0.000000,65.356300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.914000,0.000000,66.324500>}
box{<0,0,-0.127000><1.369242,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.945800,0.000000,65.356300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,0.000000,69.189600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.914000,0.000000,69.161200>}
box{<0,0,-0.127000><0.040164,0.035000,0.127000> rotate<0,44.997030,0> translate<49.885600,0.000000,69.189600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.914000,0.000000,66.324500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.914000,0.000000,69.161200>}
box{<0,0,-0.127000><2.836700,0.035000,0.127000> rotate<0,90.000000,0> translate<49.914000,0.000000,69.161200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.805700,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.936000,0.000000,28.765500>}
box{<0,0,-0.127000><1.598486,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.805700,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.911000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.936000,0.000000,28.765500>}
box{<0,0,-0.635000><0.572047,0.035000,0.635000> rotate<0,87.489445,0> translate<49.911000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,-1.535000,69.189600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.963700,-1.535000,61.301500>}
box{<0,0,-0.127000><7.888487,0.035000,0.127000> rotate<0,89.426831,0> translate<49.885600,-1.535000,69.189600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.936400,0.000000,34.493200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.987200,0.000000,34.112200>}
box{<0,0,-0.127000><0.384372,0.035000,0.127000> rotate<0,82.399918,0> translate<49.936400,0.000000,34.493200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<46.482000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.038000,0.000000,15.748000>}
box{<0,0,-0.635000><5.028943,0.035000,0.635000> rotate<0,-44.997030,0> translate<46.482000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.911000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.038000,0.000000,27.813000>}
box{<0,0,-0.635000><0.179605,0.035000,0.635000> rotate<0,44.997030,0> translate<49.911000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.400200,0.000000,37.324800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.368200,0.000000,35.356800>}
box{<0,0,-0.152400><2.783172,0.035000,0.152400> rotate<0,44.997030,0> translate<48.400200,0.000000,37.324800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.936400,0.000000,34.493200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.368200,0.000000,35.356800>}
box{<0,0,-0.127000><0.965534,0.035000,0.127000> rotate<0,-63.430762,0> translate<49.936400,0.000000,34.493200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.406300,0.000000,54.729900>}
box{<0,0,-0.127000><0.045114,0.035000,0.127000> rotate<0,-82.223687,0> translate<50.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.406300,0.000000,54.729900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.406300,0.000000,64.770000>}
box{<0,0,-0.127000><10.040100,0.035000,0.127000> rotate<0,90.000000,0> translate<50.406300,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.691800,-1.535000,36.347400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.520600,-1.535000,38.176200>}
box{<0,0,-0.127000><2.586314,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.691800,-1.535000,36.347400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,-1.535000,8.509000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<49.530000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.368200,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,0.000000,35.052000>}
box{<0,0,-0.152400><0.431052,0.035000,0.152400> rotate<0,44.997030,0> translate<50.368200,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,0.000000,35.941000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,44.997030,0> translate<48.895000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,12.065000>}
box{<0,0,-0.152400><2.289525,0.035000,0.152400> rotate<0,-33.687844,0> translate<48.895000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,12.192000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<50.800000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.888900,0.000000,54.747300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.888900,0.000000,64.427100>}
box{<0,0,-0.127000><9.679800,0.035000,0.127000> rotate<0,90.000000,0> translate<50.888900,0.000000,64.427100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.888900,0.000000,54.747300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.063120,0.035000,0.127000> rotate<0,79.681776,0> translate<50.888900,0.000000,54.747300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.606200,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.028600,-1.535000,52.603400>}
box{<0,0,-0.127000><1.422627,0.035000,0.127000> rotate<0,-1.022963,0> translate<49.606200,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.003200,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.028600,-1.535000,52.603400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.003200,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.028600,-1.535000,56.159400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.028600,-1.535000,52.603400>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,-90.000000,0> translate<51.028600,-1.535000,52.603400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.488600,-1.535000,58.699400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.028600,-1.535000,56.159400>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<48.488600,-1.535000,58.699400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.405800,0.000000,47.193200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.181000,0.000000,51.968400>}
box{<0,0,-0.127000><6.753153,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.405800,0.000000,47.193200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.038000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,27.813000>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,0.000000,0> translate<50.038000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,27.813000>}
box{<0,0,-0.635000><2.794000,0.035000,0.635000> rotate<0,90.000000,0> translate<51.308000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,29.210000>}
box{<0,0,-0.635000><1.397000,0.035000,0.635000> rotate<0,90.000000,0> translate<51.308000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.400200,0.000000,64.100200>}
box{<0,0,-0.127000><9.415000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.400200,0.000000,64.100200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.657000,0.000000,65.024000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.587400,0.000000,66.954400>}
box{<0,0,-0.127000><2.729998,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.657000,0.000000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.587400,0.000000,66.954400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.612800,0.000000,66.954400>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<51.587400,0.000000,66.954400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.612800,0.000000,66.954400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.638200,0.000000,66.979800>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.612800,0.000000,66.954400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.638200,0.000000,66.979800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.638200,0.000000,69.138800>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.638200,0.000000,69.138800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.638200,-1.535000,69.138800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.660100,-1.535000,61.430000>}
box{<0,0,-0.127000><7.708831,0.035000,0.127000> rotate<0,89.831299,0> translate<51.638200,-1.535000,69.138800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.689000,0.000000,29.210000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,0.000000,0> translate<51.308000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.879500,0.000000,54.705900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.879500,0.000000,63.309500>}
box{<0,0,-0.127000><8.603600,0.035000,0.127000> rotate<0,90.000000,0> translate<51.879500,0.000000,63.309500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.879500,0.000000,54.705900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.029274,0.035000,0.127000> rotate<0,44.997030,0> translate<51.879500,0.000000,54.705900> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<50.038000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.943000,0.000000,15.748000>}
box{<0,0,-0.635000><1.905000,0.035000,0.635000> rotate<0,0.000000,0> translate<50.038000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.885600,-1.535000,59.994800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,-1.535000,57.912000>}
box{<0,0,-0.127000><2.945524,0.035000,0.127000> rotate<0,44.997030,0> translate<49.885600,-1.535000,59.994800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019200,0.000000,36.728400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019200,0.000000,35.892800>}
box{<0,0,-0.127000><0.835600,0.035000,0.127000> rotate<0,-90.000000,0> translate<52.019200,0.000000,35.892800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.024400,0.000000,35.887600>}
box{<0,0,-0.152400><1.352455,0.035000,0.152400> rotate<0,2.262692,0> translate<50.673000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019200,0.000000,35.892800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.024400,0.000000,35.887600>}
box{<0,0,-0.127000><0.007354,0.035000,0.127000> rotate<0,44.997030,0> translate<52.019200,0.000000,35.892800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,10.795000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<50.800000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.308000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,0.000000,24.257000>}
box{<0,0,-0.635000><1.077631,0.035000,0.635000> rotate<0,44.997030,0> translate<51.308000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,0.000000,35.052000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.673000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.963700,-1.535000,61.301500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.359800,-1.535000,58.928000>}
box{<0,0,-0.127000><3.372654,0.035000,0.127000> rotate<0,44.725563,0> translate<49.963700,-1.535000,61.301500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.365000,0.000000,23.705000>}
box{<0,0,-0.635000><0.625883,0.035000,0.635000> rotate<0,61.874965,0> translate<52.070000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400200,0.000000,63.004700>}
box{<0,0,-0.127000><8.319500,0.035000,0.127000> rotate<0,90.000000,0> translate<52.400200,0.000000,63.004700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.943000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,16.129000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,-36.867464,0> translate<51.943000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.365000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,18.161000>}
box{<0,0,-0.635000><0.096602,0.035000,0.635000> rotate<0,27.093764,0> translate<52.365000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,18.161000>}
box{<0,0,-0.635000><2.032000,0.035000,0.635000> rotate<0,90.000000,0> translate<52.451000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.365000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,18.796000>}
box{<0,0,-0.635000><0.597224,0.035000,0.635000> rotate<0,-81.715262,0> translate<52.365000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.365000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,23.622000>}
box{<0,0,-0.635000><0.119520,0.035000,0.635000> rotate<0,43.980119,0> translate<52.365000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,23.622000>}
box{<0,0,-0.635000><4.826000,0.035000,0.635000> rotate<0,90.000000,0> translate<52.451000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,14.351000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.514500,-1.535000,14.351000>}
box{<0,0,-0.152400><19.240500,0.035000,0.152400> rotate<0,0.000000,0> translate<33.274000,-1.535000,14.351000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.070000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.705000,0.000000,9.652000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,0.000000,0> translate<52.070000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.181000,0.000000,51.968400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,0.000000,51.968400>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.181000,0.000000,51.968400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.689000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.755800,0.000000,29.210000>}
box{<0,0,-0.127000><1.066800,0.035000,0.127000> rotate<0,0.000000,0> translate<51.689000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.558200,-1.535000,44.094400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.755800,-1.535000,50.546000>}
box{<0,0,-0.127000><8.946138,0.035000,0.127000> rotate<0,-46.147317,0> translate<46.558200,-1.535000,44.094400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.301400,0.000000,42.824400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.781200,0.000000,42.849800>}
box{<0,0,-0.127000><3.479893,0.035000,0.127000> rotate<0,-0.418182,0> translate<49.301400,0.000000,42.824400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.301400,0.000000,33.045400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,33.083500>}
box{<0,0,-0.127000><3.530806,0.035000,0.127000> rotate<0,-0.618235,0> translate<49.301400,0.000000,33.045400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,0.000000,51.968400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,51.841400>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<52.705000,0.000000,51.968400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,47.828200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,51.841400>}
box{<0,0,-0.127000><4.013200,0.035000,0.127000> rotate<0,90.000000,0> translate<52.832000,0.000000,51.841400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.660100,-1.535000,61.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.894500,-1.535000,60.198000>}
box{<0,0,-0.127000><1.744009,0.035000,0.127000> rotate<0,44.941281,0> translate<51.660100,-1.535000,61.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.895500,0.000000,54.689900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.895500,0.000000,62.293500>}
box{<0,0,-0.127000><7.603600,0.035000,0.127000> rotate<0,90.000000,0> translate<52.895500,0.000000,62.293500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.895500,0.000000,54.689900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.006647,0.035000,0.127000> rotate<0,44.997030,0> translate<52.895500,0.000000,54.689900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.781200,-1.535000,42.849800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.908200,-1.535000,42.900600>}
box{<0,0,-0.127000><0.136783,0.035000,0.127000> rotate<0,-21.799971,0> translate<52.781200,-1.535000,42.849800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.403000,0.000000,41.833800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.959000,0.000000,41.833800>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.403000,0.000000,41.833800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,33.083500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.009800,0.000000,33.032700>}
box{<0,0,-0.127000><0.184915,0.035000,0.127000> rotate<0,15.944344,0> translate<52.832000,0.000000,33.083500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.479200,0.000000,43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.009800,0.000000,43.840400>}
box{<0,0,-0.127000><3.530600,0.035000,0.127000> rotate<0,0.000000,0> translate<49.479200,0.000000,43.840400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.066200,-1.535000,39.243000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.060600,-1.535000,45.237400>}
box{<0,0,-0.127000><8.477362,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.066200,-1.535000,39.243000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.786800,-1.535000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.162200,-1.535000,49.987200>}
box{<0,0,-0.127000><9.052169,0.035000,0.127000> rotate<0,-45.224378,0> translate<46.786800,-1.535000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.705000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.340000,0.000000,12.192000>}
box{<0,0,-0.635000><2.618172,0.035000,0.635000> rotate<0,-75.958743,0> translate<52.705000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.400200,0.000000,62.036200>}
box{<0,0,-0.127000><7.351000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.400200,0.000000,62.036200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.872400,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.441600,-1.535000,26.670000>}
box{<0,0,-0.127000><7.569200,0.035000,0.127000> rotate<0,0.000000,0> translate<45.872400,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.467000,0.000000,33.909000>}
box{<0,0,-0.152400><1.708610,0.035000,0.152400> rotate<0,41.984442,0> translate<52.197000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.091600,-1.535000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.517800,-1.535000,49.174400>}
box{<0,0,-0.127000><8.980903,0.035000,0.127000> rotate<0,-44.309559,0> translate<47.091600,-1.535000,42.900600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.406300,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.530500,0.000000,67.945000>}
box{<0,0,-0.127000><4.454352,0.035000,0.127000> rotate<0,-45.459052,0> translate<50.406300,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.530500,0.000000,67.945000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.530500,0.000000,75.501500>}
box{<0,0,-0.127000><7.556500,0.035000,0.127000> rotate<0,90.000000,0> translate<53.530500,0.000000,75.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.548800,-1.535000,42.291000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.797200,-1.535000,48.539400>}
box{<0,0,-0.127000><8.836572,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.548800,-1.535000,42.291000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.904400,-1.535000,41.579800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.873400,-1.535000,47.498000>}
box{<0,0,-0.127000><8.405596,0.035000,0.127000> rotate<0,-44.752194,0> translate<47.904400,-1.535000,41.579800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.887000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.887000,0.000000,35.267000>}
box{<0,0,-0.152400><0.547000,0.035000,0.152400> rotate<0,-90.000000,0> translate<53.887000,0.000000,35.267000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.024400,0.000000,35.887600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.887000,0.000000,35.814000>}
box{<0,0,-0.152400><1.864054,0.035000,0.152400> rotate<0,2.262696,0> translate<52.024400,0.000000,35.887600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.873400,0.000000,48.285400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.898800,0.000000,54.356000>}
box{<0,0,-0.127000><6.070653,0.035000,0.127000> rotate<0,-89.754346,0> translate<53.873400,0.000000,48.285400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.898800,0.000000,54.356000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.900200,0.000000,54.433600>}
box{<0,0,-0.127000><0.077613,0.035000,0.127000> rotate<0,-88.960554,0> translate<53.898800,0.000000,54.356000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.900200,0.000000,54.433600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.251600,0.035000,0.127000> rotate<0,90.000000,0> translate<53.900200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.957000,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.051200,0.000000,6.680200>}
box{<0,0,-0.635000><17.094219,0.035000,0.635000> rotate<0,0.085129,0> translate<36.957000,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.514500,-1.535000,14.351000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.292500,-1.535000,16.129000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.514500,-1.535000,14.351000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.292500,-1.535000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.292500,-1.535000,19.494500>}
box{<0,0,-0.152400><3.365500,0.035000,0.152400> rotate<0,90.000000,0> translate<54.292500,-1.535000,19.494500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.051200,0.000000,6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.356000,0.000000,9.144000>}
box{<0,0,-0.635000><2.482582,0.035000,0.635000> rotate<0,-82.942220,0> translate<54.051200,0.000000,6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019200,-1.535000,36.728400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.381400,-1.535000,33.883600>}
box{<0,0,-0.127000><3.697685,0.035000,0.127000> rotate<0,50.291894,0> translate<52.019200,-1.535000,36.728400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.400200,0.000000,61.893200>}
box{<0,0,-0.127000><7.208000,0.035000,0.127000> rotate<0,90.000000,0> translate<54.400200,0.000000,61.893200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.755800,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.406800,0.000000,31.140400>}
box{<0,0,-0.127000><2.540127,0.035000,0.127000> rotate<0,-49.457584,0> translate<52.755800,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.381400,-1.535000,33.883600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.406800,-1.535000,31.140400>}
box{<0,0,-0.127000><2.743318,0.035000,0.127000> rotate<0,89.463594,0> translate<54.381400,-1.535000,33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.959000,0.000000,41.833800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.432200,0.000000,41.986200>}
box{<0,0,-0.127000><1.481062,0.035000,0.127000> rotate<0,-5.905751,0> translate<52.959000,0.000000,41.833800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.009800,0.000000,43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.508400,0.000000,43.916600>}
box{<0,0,-0.127000><1.500536,0.035000,0.127000> rotate<0,-2.910646,0> translate<53.009800,0.000000,43.840400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.705000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,0.000000,9.652000>}
box{<0,0,-0.635000><1.905000,0.035000,0.635000> rotate<0,0.000000,0> translate<52.705000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.356000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.610000,0.000000,9.652000>}
box{<0,0,-0.635000><0.567961,0.035000,0.635000> rotate<0,-63.430762,0> translate<54.356000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.887000,0.000000,35.267000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,34.544000>}
box{<0,0,-0.152400><1.022476,0.035000,0.152400> rotate<0,44.997030,0> translate<53.887000,0.000000,35.267000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.686200,0.000000,52.171600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.711600,0.000000,48.869600>}
box{<0,0,-0.127000><3.302098,0.035000,0.127000> rotate<0,89.553361,0> translate<54.686200,0.000000,52.171600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.530500,0.000000,75.501500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.864000,0.000000,76.835000>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.530500,0.000000,75.501500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.900200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.914800,0.000000,54.746800>}
box{<0,0,-0.152400><0.063307,0.035000,0.152400> rotate<0,-76.661139,0> translate<54.900200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.914800,0.000000,54.746800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.914800,0.000000,61.442600>}
box{<0,0,-0.127000><6.695800,0.035000,0.127000> rotate<0,90.000000,0> translate<54.914800,0.000000,61.442600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.308000,0.000000,44.932100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.194200,0.000000,44.958000>}
box{<0,0,-0.127000><7.886243,0.035000,0.127000> rotate<0,-0.188159,0> translate<47.308000,0.000000,44.932100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,47.828200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.270400,0.000000,45.542200>}
box{<0,0,-0.127000><3.342393,0.035000,0.127000> rotate<0,43.149542,0> translate<52.832000,0.000000,47.828200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.686200,0.000000,52.171600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,53.673000>}
box{<0,0,-0.127000><1.662528,0.035000,0.127000> rotate<0,-64.562027,0> translate<54.686200,0.000000,52.171600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,53.673000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,54.685200>}
box{<0,0,-0.127000><1.012200,0.035000,0.127000> rotate<0,90.000000,0> translate<55.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,57.305200>}
box{<0,0,-0.127000><2.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<55.400200,0.000000,57.305200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.797200,-1.535000,48.539400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.473600,-1.535000,48.514000>}
box{<0,0,-0.127000><1.676592,0.035000,0.127000> rotate<0,0.867994,0> translate<53.797200,-1.535000,48.539400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,0.000000,13.716000>}
box{<0,0,-0.635000><3.887528,0.035000,0.635000> rotate<0,38.364953,0> translate<52.451000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,0.000000,13.716000>}
box{<0,0,-0.635000><1.016000,0.035000,0.635000> rotate<0,90.000000,0> translate<55.499000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.504600,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.676800,0.000000,40.995600>}
box{<0,0,-0.127000><6.172252,0.035000,0.127000> rotate<0,0.235768,0> translate<49.504600,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.676800,0.000000,41.833800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.676800,0.000000,40.995600>}
box{<0,0,-0.127000><0.838200,0.035000,0.127000> rotate<0,-90.000000,0> translate<55.676800,0.000000,40.995600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.194200,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.702200,0.000000,44.932600>}
box{<0,0,-0.127000><0.508635,0.035000,0.127000> rotate<0,2.862216,0> translate<55.194200,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.676800,0.000000,41.833800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.702200,0.000000,44.932600>}
box{<0,0,-0.127000><3.098904,0.035000,0.127000> rotate<0,-89.524464,0> translate<55.676800,0.000000,41.833800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.234600,-1.535000,33.426400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.753000,-1.535000,26.289000>}
box{<0,0,-0.127000><10.366717,0.035000,0.127000> rotate<0,43.507972,0> translate<48.234600,-1.535000,33.426400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.587000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.841000,0.000000,35.814000>}
box{<0,0,-0.152400><0.457905,0.035000,0.152400> rotate<0,56.306216,0> translate<55.587000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,0.000000,12.192000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,53.126596,0> translate<55.499000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.473600,-1.535000,48.514000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,48.107600>}
box{<0,0,-0.127000><0.574736,0.035000,0.127000> rotate<0,44.997030,0> translate<55.473600,-1.535000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.003200,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,52.146200>}
box{<0,0,-0.127000><4.895879,0.035000,0.127000> rotate<0,5.059535,0> translate<51.003200,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,54.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,56.642000>}
box{<0,0,-0.127000><1.936600,0.035000,0.127000> rotate<0,90.000000,0> translate<55.880000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.400200,0.000000,61.893200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,63.347600>}
box{<0,0,-0.127000><2.074870,0.035000,0.127000> rotate<0,-44.501092,0> translate<54.400200,0.000000,61.893200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.864000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,76.835000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.864000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,52.146200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.900200,0.000000,52.075200>}
box{<0,0,-0.127000><0.073818,0.035000,0.127000> rotate<0,74.113683,0> translate<55.880000,0.000000,52.146200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,54.705400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.900200,0.000000,54.685200>}
box{<0,0,-0.127000><0.028567,0.035000,0.127000> rotate<0,44.997030,0> translate<55.880000,0.000000,54.705400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.900200,0.000000,52.075200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.900200,0.000000,54.685200>}
box{<0,0,-0.127000><2.610000,0.035000,0.127000> rotate<0,90.000000,0> translate<55.900200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.873400,0.000000,48.285400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.905400,0.000000,46.583600>}
box{<0,0,-0.127000><2.650499,0.035000,0.127000> rotate<0,39.943538,0> translate<53.873400,0.000000,48.285400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.914800,0.000000,61.442600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,0.000000,62.484000>}
box{<0,0,-0.127000><1.472762,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.914800,0.000000,61.442600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.755800,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,-1.535000,50.571400>}
box{<0,0,-0.127000><3.251299,0.035000,0.127000> rotate<0,-0.447585,0> translate<52.755800,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.587000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,0.000000,36.195000>}
box{<0,0,-0.152400><0.547000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.587000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,25.908000>}
box{<0,0,-0.635000><1.905000,0.035000,0.635000> rotate<0,90.000000,0> translate<56.261000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.236000,0.000000,28.765500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,29.337000>}
box{<0,0,-0.635000><0.572047,0.035000,0.635000> rotate<0,-87.489445,0> translate<56.236000,0.000000,28.765500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,29.337000>}
box{<0,0,-0.635000><3.429000,0.035000,0.635000> rotate<0,90.000000,0> translate<56.261000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.162200,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.261000,-1.535000,49.987200>}
box{<0,0,-0.127000><3.098800,0.035000,0.127000> rotate<0,0.000000,0> translate<53.162200,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.956200,0.000000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.261000,0.000000,62.763400>}
box{<0,0,-0.127000><0.413482,0.035000,0.127000> rotate<0,-42.507642,0> translate<55.956200,0.000000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.987200,-1.535000,34.112200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.286400,-1.535000,27.482800>}
box{<0,0,-0.127000><9.144882,0.035000,0.127000> rotate<0,46.459966,0> translate<49.987200,-1.535000,34.112200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.631600,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.362600,0.000000,40.386000>}
box{<0,0,-0.127000><6.731000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.631600,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.894500,-1.535000,60.198000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.362600,-1.535000,60.223400>}
box{<0,0,-0.127000><3.468193,0.035000,0.127000> rotate<0,-0.419593,0> translate<52.894500,-1.535000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.400200,0.000000,53.302400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.400200,0.000000,54.685200>}
box{<0,0,-0.127000><1.382800,0.035000,0.127000> rotate<0,90.000000,0> translate<56.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.441600,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.406600,-1.535000,23.705000>}
box{<0,0,-0.127000><4.193143,0.035000,0.127000> rotate<0,44.997030,0> translate<53.441600,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.362600,0.000000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,43.256200>}
box{<0,0,-0.127000><2.870650,0.035000,0.127000> rotate<0,-88.980149,0> translate<56.362600,0.000000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.270400,0.000000,45.542200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,45.542200>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.270400,0.000000,45.542200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,43.256200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,45.542200>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,90.000000,0> translate<56.413400,0.000000,45.542200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,54.774600>}
box{<0,0,-0.127000><0.090369,0.035000,0.127000> rotate<0,-81.595520,0> translate<56.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,54.774600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,56.362600>}
box{<0,0,-0.127000><1.588000,0.035000,0.127000> rotate<0,90.000000,0> translate<56.413400,0.000000,56.362600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.517800,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.438800,-1.535000,49.072800>}
box{<0,0,-0.127000><2.922766,0.035000,0.127000> rotate<0,1.991962,0> translate<53.517800,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.362600,0.000000,60.223400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.456500,0.000000,61.068500>}
box{<0,0,-0.152400><0.850301,0.035000,0.152400> rotate<0,-83.654287,0> translate<56.362600,0.000000,60.223400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.515000,0.000000,23.749000>}
box{<0,0,-0.635000><0.359210,0.035000,0.635000> rotate<0,44.997030,0> translate<56.261000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.406600,-1.535000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.565000,-1.535000,23.705000>}
box{<0,0,-0.127000><0.158400,0.035000,0.127000> rotate<0,0.000000,0> translate<56.406600,-1.535000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.515000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.565000,0.000000,23.705000>}
box{<0,0,-0.635000><0.066603,0.035000,0.635000> rotate<0,41.345048,0> translate<56.515000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.292500,-1.535000,19.494500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.578500,-1.535000,21.780500>}
box{<0,0,-0.152400><3.232892,0.035000,0.152400> rotate<0,-44.997030,0> translate<54.292500,-1.535000,19.494500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.565000,-1.535000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.578500,-1.535000,23.691500>}
box{<0,0,-0.152400><0.019092,0.035000,0.152400> rotate<0,44.997030,0> translate<56.565000,-1.535000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.578500,-1.535000,21.780500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.578500,-1.535000,23.691500>}
box{<0,0,-0.152400><1.911000,0.035000,0.152400> rotate<0,90.000000,0> translate<56.578500,-1.535000,23.691500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.565000,-1.535000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,18.161000>}
box{<0,0,-0.152400><0.088685,0.035000,0.152400> rotate<0,29.742918,0> translate<56.565000,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.359800,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.896000,-1.535000,58.978800>}
box{<0,0,-0.127000><4.536484,0.035000,0.127000> rotate<0,-0.641575,0> translate<52.359800,-1.535000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,48.107600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.946800,-1.535000,48.107600>}
box{<0,0,-0.127000><1.066800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.880000,-1.535000,48.107600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,-1.535000,50.571400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,-1.535000,51.587400>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.007000,-1.535000,50.571400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,-1.535000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,-1.535000,54.533800>}
box{<0,0,-0.127000><2.946400,0.035000,0.127000> rotate<0,90.000000,0> translate<57.023000,-1.535000,54.533800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,0.000000,44.653200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.048400,0.000000,40.678100>}
box{<0,0,-0.127000><3.975181,0.035000,0.127000> rotate<0,89.627982,0> translate<57.023000,0.000000,44.653200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.456500,0.000000,61.068500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.300200,0.000000,61.823600>}
box{<0,0,-0.152400><1.132257,0.035000,0.152400> rotate<0,-41.825349,0> translate<56.456500,0.000000,61.068500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.873400,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.327800,-1.535000,47.498000>}
box{<0,0,-0.127000><3.454400,0.035000,0.127000> rotate<0,0.000000,0> translate<53.873400,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.438800,0.000000,49.072800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.327800,0.000000,50.571400>}
box{<0,0,-0.127000><1.742447,0.035000,0.127000> rotate<0,-59.318805,0> translate<56.438800,0.000000,49.072800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.302400,0.000000,50.723800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.327800,0.000000,50.571400>}
box{<0,0,-0.127000><0.154502,0.035000,0.127000> rotate<0,80.532363,0> translate<57.302400,0.000000,50.723800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.302400,0.000000,50.723800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.353200,0.000000,50.927000>}
box{<0,0,-0.127000><0.209454,0.035000,0.127000> rotate<0,-75.958743,0> translate<57.302400,0.000000,50.723800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.400200,0.000000,53.302400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.353200,0.000000,52.349400>}
box{<0,0,-0.127000><1.347746,0.035000,0.127000> rotate<0,44.997030,0> translate<56.400200,0.000000,53.302400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.353200,0.000000,50.927000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.353200,0.000000,52.349400>}
box{<0,0,-0.127000><1.422400,0.035000,0.127000> rotate<0,90.000000,0> translate<57.353200,0.000000,52.349400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.400200,0.000000,37.461200>}
box{<0,0,-0.152400><1.790677,0.035000,0.152400> rotate<0,-44.997030,0> translate<56.134000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.400200,0.000000,37.461200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.400200,0.000000,38.685200>}
box{<0,0,-0.152400><1.224000,0.035000,0.152400> rotate<0,90.000000,0> translate<57.400200,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,0.000000,34.544000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.610000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.946800,-1.535000,48.107600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.480200,-1.535000,48.641000>}
box{<0,0,-0.127000><0.754342,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.946800,-1.535000,48.107600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.480200,-1.535000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.480200,-1.535000,50.190400>}
box{<0,0,-0.127000><1.549400,0.035000,0.127000> rotate<0,90.000000,0> translate<57.480200,-1.535000,50.190400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,-1.535000,54.533800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,-1.535000,55.143400>}
box{<0,0,-0.127000><0.862105,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.023000,-1.535000,54.533800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.261000,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,51.384200>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.261000,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,51.384200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,52.197000>}
box{<0,0,-0.127000><0.812800,0.035000,0.127000> rotate<0,90.000000,0> translate<57.658000,-1.535000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,40.919400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.683400,0.000000,44.145200>}
box{<0,0,-0.127000><3.226200,0.035000,0.127000> rotate<0,-89.091899,0> translate<57.632600,0.000000,40.919400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.711600,0.000000,48.869600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.721500,0.000000,46.672500>}
box{<0,0,-0.127000><3.726493,0.035000,0.127000> rotate<0,36.125483,0> translate<54.711600,0.000000,48.869600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.023000,0.000000,44.653200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.721500,0.000000,46.672500>}
box{<0,0,-0.127000><2.136697,0.035000,0.127000> rotate<0,-70.914205,0> translate<57.023000,0.000000,44.653200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.400200,0.000000,57.305200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.759600,0.000000,59.664600>}
box{<0,0,-0.127000><3.336695,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.400200,0.000000,57.305200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.900200,0.000000,37.999400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.900200,0.000000,38.685200>}
box{<0,0,-0.152400><0.685800,0.035000,0.152400> rotate<0,90.000000,0> translate<57.900200,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.048400,0.000000,40.678100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.900200,0.000000,39.826300>}
box{<0,0,-0.127000><1.204627,0.035000,0.127000> rotate<0,44.997030,0> translate<57.048400,0.000000,40.678100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.900200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.900200,0.000000,39.826300>}
box{<0,0,-0.127000><1.141100,0.035000,0.127000> rotate<0,90.000000,0> translate<57.900200,0.000000,39.826300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.467000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.000000,0.000000,33.909000>}
box{<0,0,-0.152400><4.533000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.467000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.413400,0.000000,56.362600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.001800,0.000000,57.874800>}
box{<0,0,-0.127000><2.193117,0.035000,0.127000> rotate<0,-43.589312,0> translate<56.413400,0.000000,56.362600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,35.179000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.404000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,35.775000>}
box{<0,0,-0.152400><0.596000,0.035000,0.152400> rotate<0,90.000000,0> translate<58.039000,0.000000,35.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.001800,0.000000,57.874800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,57.912000>}
box{<0,0,-0.203200><0.052609,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.001800,0.000000,57.874800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,63.347600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.039000,0.000000,65.354200>}
box{<0,0,-0.127000><2.947495,0.035000,0.127000> rotate<0,-42.901916,0> translate<55.880000,0.000000,63.347600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.962800,0.000000,65.278000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.039000,0.000000,65.354200>}
box{<0,0,-0.127000><0.107763,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.962800,0.000000,65.278000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.261000,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.064400,0.000000,64.236600>}
box{<0,0,-0.127000><2.328641,0.035000,0.127000> rotate<0,-39.242845,0> translate<56.261000,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.962800,0.000000,65.278000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.064400,0.000000,65.354200>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,-36.867464,0> translate<57.962800,0.000000,65.278000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.900200,0.000000,37.999400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.078000,0.000000,35.814000>}
box{<0,0,-0.152400><2.192621,0.035000,0.152400> rotate<0,85.343136,0> translate<57.900200,0.000000,37.999400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,35.775000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.078000,0.000000,35.814000>}
box{<0,0,-0.152400><0.055154,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.039000,0.000000,35.775000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.683400,0.000000,44.145200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.115200,0.000000,44.577000>}
box{<0,0,-0.127000><0.610657,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.683400,0.000000,44.145200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.166000,-1.535000,52.705000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.658000,-1.535000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.177800,0.000000,58.939800>}
box{<0,0,-0.127000><3.249580,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.880000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.721500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,0.000000,45.720000>}
box{<0,0,-0.127000><1.110796,0.035000,0.127000> rotate<0,59.032347,0> translate<57.721500,0.000000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.327800,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,-1.535000,48.488600>}
box{<0,0,-0.127000><1.383076,0.035000,0.127000> rotate<0,-45.741040,0> translate<57.327800,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,-1.535000,48.488600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,-1.535000,48.996600>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<58.293000,-1.535000,48.996600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,40.919400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.369200,0.000000,40.182800>}
box{<0,0,-0.127000><1.041710,0.035000,0.127000> rotate<0,44.997030,0> translate<57.632600,0.000000,40.919400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.400200,0.000000,54.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.410100,0.000000,55.698900>}
box{<0,0,-0.127000><1.013748,0.035000,0.127000> rotate<0,-89.434553,0> translate<58.400200,0.000000,54.685200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.880000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,0.000000,12.192000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<55.880000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.150000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,0.000000,12.192000>}
box{<0,0,-0.635000><2.839806,0.035000,0.635000> rotate<0,-63.430762,0> translate<57.150000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.166000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.420000,0.000000,12.192000>}
box{<0,0,-0.635000><0.567961,0.035000,0.635000> rotate<0,63.430762,0> translate<58.166000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.369200,0.000000,40.182800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,38.705000>}
box{<0,0,-0.127000><1.478673,0.035000,0.127000> rotate<0,88.025399,0> translate<58.369200,0.000000,40.182800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.400200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,38.705000>}
box{<0,0,-0.127000><0.028001,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.400200,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.166000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,52.705000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.166000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,52.857400>}
box{<0,0,-0.127000><0.152400,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,0.000000,52.857400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.896000,-1.535000,58.978800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,60.502800>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.896000,-1.535000,58.978800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.343800,-1.535000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,60.502800>}
box{<0,0,-0.127000><0.217018,0.035000,0.127000> rotate<0,69.439372,0> translate<58.343800,-1.535000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.888900,0.000000,64.427100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.445400,0.000000,71.983600>}
box{<0,0,-0.127000><10.686505,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.888900,0.000000,64.427100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.445400,0.000000,71.983600>}
box{<0,0,-0.127000><2.311540,0.035000,0.127000> rotate<0,89.364503,0> translate<58.420000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.115200,0.000000,44.577000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.520200,0.000000,45.185200>}
box{<0,0,-0.127000><0.730707,0.035000,0.127000> rotate<0,-56.336661,0> translate<58.115200,0.000000,44.577000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.400200,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.850800,0.000000,38.685200>}
box{<0,0,-0.152400><0.450600,0.035000,0.152400> rotate<0,0.000000,0> translate<58.400200,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.410100,0.000000,55.698900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.919200,0.000000,56.188300>}
box{<0,0,-0.127000><0.706184,0.035000,0.127000> rotate<0,-43.866829,0> translate<58.410100,0.000000,55.698900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.480200,-1.535000,50.190400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.953400,-1.535000,51.663600>}
box{<0,0,-0.127000><2.083419,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.480200,-1.535000,50.190400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.978800,0.000000,52.146200>}
box{<0,0,-0.127000><0.790263,0.035000,0.127000> rotate<0,44.997030,0> translate<58.420000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,39.598600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,41.656000>}
box{<0,0,-0.127000><2.057400,0.035000,0.127000> rotate<0,90.000000,0> translate<59.055000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.953400,-1.535000,51.663600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.334400,-1.535000,51.663600>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.953400,-1.535000,51.663600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.400200,0.000000,64.100200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.753500,0.000000,72.453500>}
box{<0,0,-0.127000><11.813350,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.400200,0.000000,64.100200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.753500,0.000000,75.501500>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,44.997030,0> translate<58.420000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.753500,0.000000,72.453500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.753500,0.000000,75.501500>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.753500,0.000000,75.501500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.334400,-1.535000,51.663600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.817000,-1.535000,52.146200>}
box{<0,0,-0.127000><0.682499,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.334400,-1.535000,51.663600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.817000,-1.535000,52.146200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.817000,-1.535000,52.984400>}
box{<0,0,-0.127000><0.838200,0.035000,0.127000> rotate<0,90.000000,0> translate<59.817000,-1.535000,52.984400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.850800,0.000000,38.685200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,37.592000>}
box{<0,0,-0.152400><1.546018,0.035000,0.152400> rotate<0,44.997030,0> translate<58.850800,0.000000,38.685200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,36.488000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,37.592000>}
box{<0,0,-0.152400><1.104000,0.035000,0.152400> rotate<0,90.000000,0> translate<59.944000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.009800,0.000000,33.032700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.994800,0.000000,33.032700>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.009800,0.000000,33.032700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.000000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.032000,0.000000,35.814000>}
box{<0,0,-0.152400><2.785327,0.035000,0.152400> rotate<0,-43.149542,0> translate<58.000000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,36.488000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.032000,0.000000,35.814000>}
box{<0,0,-0.152400><0.679721,0.035000,0.152400> rotate<0,82.555875,0> translate<59.944000,0.000000,36.488000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.642000,-1.535000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.071000,-1.535000,14.732000>}
box{<0,0,-0.152400><4.849338,0.035000,0.152400> rotate<0,44.997030,0> translate<56.642000,-1.535000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.978800,0.000000,52.146200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.361200,0.000000,52.146200>}
box{<0,0,-0.127000><1.382400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.978800,0.000000,52.146200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.365400,0.000000,45.720000>}
box{<0,0,-0.127000><2.072400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.293000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.371000,0.000000,41.656000>}
box{<0,0,-0.127000><1.316000,0.035000,0.127000> rotate<0,0.000000,0> translate<59.055000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.350400,0.000000,46.710600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.375800,0.000000,46.685200>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<60.350400,0.000000,46.710600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.371000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,41.685200>}
box{<0,0,-0.127000><0.041295,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.371000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.520200,0.000000,45.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,45.185200>}
box{<0,0,-0.127000><1.880000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.520200,0.000000,45.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.365400,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,45.685200>}
box{<0,0,-0.127000><0.049215,0.035000,0.127000> rotate<0,44.997030,0> translate<60.365400,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.375800,0.000000,46.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,46.685200>}
box{<0,0,-0.127000><0.024400,0.035000,0.127000> rotate<0,0.000000,0> translate<60.375800,0.000000,46.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.370600,0.000000,51.155600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,51.185200>}
box{<0,0,-0.127000><0.041861,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.370600,0.000000,51.155600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.361200,0.000000,52.146200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,52.185200>}
box{<0,0,-0.127000><0.055154,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.361200,0.000000,52.146200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.394600,0.000000,52.679600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,52.685200>}
box{<0,0,-0.127000><0.007920,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.394600,0.000000,52.679600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,-1.535000,55.143400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.401200,-1.535000,55.143400>}
box{<0,0,-0.127000><2.768600,0.035000,0.127000> rotate<0,0.000000,0> translate<57.632600,-1.535000,55.143400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.394600,0.000000,52.679600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.401200,0.000000,55.143400>}
box{<0,0,-0.127000><2.463809,0.035000,0.127000> rotate<0,-89.840588,0> translate<60.394600,0.000000,52.679600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,42.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.413400,0.000000,42.672000>}
box{<0,0,-0.127000><0.018668,0.035000,0.127000> rotate<0,44.997030,0> translate<60.400200,0.000000,42.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,50.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.464200,0.000000,50.749200>}
box{<0,0,-0.127000><0.090510,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.400200,0.000000,50.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.580800,0.000000,32.232600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.502800,0.000000,32.245300>}
box{<0,0,-0.127000><10.922007,0.035000,0.127000> rotate<0,-0.066619,0> translate<49.580800,0.000000,32.232600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<58.166000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.706000,0.000000,15.240000>}
box{<0,0,-0.635000><3.592102,0.035000,0.635000> rotate<0,-44.997030,0> translate<58.166000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.706000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.706000,0.000000,15.240000>}
box{<0,0,-0.635000><2.921000,0.035000,0.635000> rotate<0,-90.000000,0> translate<60.706000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.299600,-1.535000,54.965600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,54.965600>}
box{<0,0,-0.127000><0.457200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.299600,-1.535000,54.965600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.401200,-1.535000,55.143400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,54.965600>}
box{<0,0,-0.127000><0.397573,0.035000,0.127000> rotate<0,26.563298,0> translate<60.401200,-1.535000,55.143400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.706000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.765000,0.000000,18.205000>}
box{<0,0,-0.635000><0.073600,0.035000,0.635000> rotate<0,-36.711780,0> translate<60.706000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.765000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.833000,0.000000,18.796000>}
box{<0,0,-0.635000><0.594899,0.035000,0.635000> rotate<0,-83.430948,0> translate<60.765000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.765000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.833000,0.000000,23.622000>}
box{<0,0,-0.635000><0.107299,0.035000,0.635000> rotate<0,50.669678,0> translate<60.765000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.833000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.833000,0.000000,23.622000>}
box{<0,0,-0.635000><4.826000,0.035000,0.635000> rotate<0,90.000000,0> translate<60.833000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,39.598600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,37.846000>}
box{<0,0,-0.127000><2.588558,0.035000,0.127000> rotate<0,42.611244,0> translate<59.055000,0.000000,39.598600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.879500,0.000000,63.309500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,72.390000>}
box{<0,0,-0.127000><12.841766,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.879500,0.000000,63.309500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,74.295000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<60.960000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,51.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.218200,0.000000,51.185200>}
box{<0,0,-0.127000><0.818000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,51.185200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.765000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<61.341000,0.000000,18.288000>}
box{<0,0,-0.635000><0.581949,0.035000,0.635000> rotate<0,-8.199179,0> translate<60.765000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.658500,0.000000,37.719000>}
box{<0,0,-0.127000><0.709952,0.035000,0.127000> rotate<0,10.304166,0> translate<60.960000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.218200,0.000000,51.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.722000,0.000000,51.689000>}
box{<0,0,-0.127000><0.712481,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.218200,0.000000,51.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.696600,0.000000,54.813200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.722000,0.000000,51.689000>}
box{<0,0,-0.127000><3.124303,0.035000,0.127000> rotate<0,89.528282,0> translate<61.696600,0.000000,54.813200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.464200,0.000000,50.749200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.950600,0.000000,50.749200>}
box{<0,0,-0.127000><1.486400,0.035000,0.127000> rotate<0,0.000000,0> translate<60.464200,0.000000,50.749200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.994800,0.000000,33.032700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,0.000000,34.988500>}
box{<0,0,-0.127000><2.783937,0.035000,0.127000> rotate<0,-44.627410,0> translate<59.994800,0.000000,33.032700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.658500,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,0.000000,37.401500>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,44.997030,0> translate<61.658500,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,0.000000,34.988500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,0.000000,37.401500>}
box{<0,0,-0.127000><2.413000,0.035000,0.127000> rotate<0,90.000000,0> translate<61.976000,0.000000,37.401500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.817000,-1.535000,52.984400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,-1.535000,55.143400>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.817000,-1.535000,52.984400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.696600,0.000000,54.813200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.026800,0.000000,55.143400>}
box{<0,0,-0.127000><0.466973,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.696600,0.000000,54.813200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.976000,-1.535000,55.143400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.026800,-1.535000,55.143400>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.976000,-1.535000,55.143400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.400200,0.000000,63.004700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.230000,0.000000,72.834500>}
box{<0,0,-0.127000><13.901436,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.400200,0.000000,63.004700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.230000,0.000000,75.565000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<60.960000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.230000,0.000000,72.834500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.230000,0.000000,75.565000>}
box{<0,0,-0.127000><2.730500,0.035000,0.127000> rotate<0,90.000000,0> translate<62.230000,0.000000,75.565000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.502800,0.000000,32.245300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.534800,0.000000,34.340800>}
box{<0,0,-0.127000><2.918929,0.035000,0.127000> rotate<0,-45.878376,0> translate<60.502800,0.000000,32.245300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.534800,0.000000,34.340800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.547500,0.000000,34.988500>}
box{<0,0,-0.127000><0.647824,0.035000,0.127000> rotate<0,-88.870832,0> translate<62.534800,0.000000,34.340800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.547500,0.000000,34.988500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.547500,0.000000,38.036500>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<62.547500,0.000000,38.036500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.261000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.738000,0.000000,25.908000>}
box{<0,0,-0.635000><6.477000,0.035000,0.635000> rotate<0,0.000000,0> translate<56.261000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.293000,-1.535000,48.996600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.814200,-1.535000,53.517800>}
box{<0,0,-0.127000><6.393942,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.293000,-1.535000,48.996600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.992000,-1.535000,57.912000>}
box{<0,0,-0.127000><11.023600,0.035000,0.127000> rotate<0,0.000000,0> translate<51.968400,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.895500,0.000000,62.293500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,72.898000>}
box{<0,0,-0.127000><14.997028,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.895500,0.000000,62.293500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,72.898000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,74.295000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<63.500000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.950600,0.000000,50.749200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.779400,0.000000,52.578000>}
box{<0,0,-0.127000><2.586314,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.950600,0.000000,50.749200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.779400,0.000000,53.517800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.779400,0.000000,52.578000>}
box{<0,0,-0.127000><0.939800,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.779400,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.814200,-1.535000,53.517800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.779400,-1.535000,53.517800>}
box{<0,0,-0.127000><0.965200,0.035000,0.127000> rotate<0,0.000000,0> translate<62.814200,-1.535000,53.517800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.547500,0.000000,38.036500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.982600,0.000000,39.319200>}
box{<0,0,-0.127000><1.924794,0.035000,0.127000> rotate<0,-41.787756,0> translate<62.547500,0.000000,38.036500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,50.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.637800,0.000000,50.185200>}
box{<0,0,-0.127000><4.237600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,50.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.400200,0.000000,62.036200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.770000,0.000000,73.406000>}
box{<0,0,-0.127000><16.079325,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.400200,0.000000,62.036200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.770000,0.000000,75.565000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<63.500000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.770000,0.000000,73.406000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.770000,0.000000,75.565000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,90.000000,0> translate<64.770000,0.000000,75.565000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,-1.535000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,-1.535000,8.509000>}
box{<0,0,-0.152400><14.224000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.673000,-1.535000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<61.341000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.897000,0.000000,18.288000>}
box{<0,0,-0.635000><3.556000,0.035000,0.635000> rotate<0,0.000000,0> translate<61.341000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.738000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.897000,0.000000,23.749000>}
box{<0,0,-0.635000><3.053287,0.035000,0.635000> rotate<0,44.997030,0> translate<62.738000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.897000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.965000,0.000000,18.205000>}
box{<0,0,-0.635000><0.107299,0.035000,0.635000> rotate<0,50.669678,0> translate<64.897000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.897000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.965000,0.000000,23.705000>}
box{<0,0,-0.635000><0.080994,0.035000,0.635000> rotate<0,32.903071,0> translate<64.897000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.965000,-1.535000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.024000,-1.535000,23.622000>}
box{<0,0,-0.635000><0.101833,0.035000,0.635000> rotate<0,54.589531,0> translate<64.965000,-1.535000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.024000,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.100200,-1.535000,23.622000>}
box{<0,0,-0.635000><0.076200,0.035000,0.635000> rotate<0,0.000000,0> translate<65.024000,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.919200,0.000000,56.188300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.151000,0.000000,56.235600>}
box{<0,0,-0.127000><6.231980,0.035000,0.127000> rotate<0,-0.434844,0> translate<58.919200,0.000000,56.188300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,-1.535000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.405000,-1.535000,9.652000>}
box{<0,0,-0.152400><1.250805,0.035000,0.152400> rotate<0,-66.033153,0> translate<64.897000,-1.535000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.405000,-1.535000,10.795000>}
box{<0,0,-0.152400><13.335000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.070000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.405000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.532000,-1.535000,9.652000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<65.405000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.965000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.532000,0.000000,18.288000>}
box{<0,0,-0.635000><0.573043,0.035000,0.635000> rotate<0,-8.327514,0> translate<64.965000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.992000,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.659000,-1.535000,60.553600>}
box{<0,0,-0.127000><3.753790,0.035000,0.127000> rotate<0,-44.722908,0> translate<62.992000,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,57.912000>}
box{<0,0,-0.203200><8.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.039000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.300200,0.000000,61.823600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.040000,0.000000,61.823600>}
box{<0,0,-0.152400><8.739800,0.035000,0.152400> rotate<0,0.000000,0> translate<57.300200,0.000000,61.823600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.759600,0.000000,59.664600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.192400,0.000000,59.664600>}
box{<0,0,-0.127000><8.432800,0.035000,0.127000> rotate<0,0.000000,0> translate<57.759600,0.000000,59.664600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.343800,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.192400,0.000000,60.934600>}
box{<0,0,-0.127000><7.851928,0.035000,0.127000> rotate<0,-1.668227,0> translate<58.343800,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.333000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.344800,0.000000,69.342000>}
box{<0,0,-0.127000><0.011800,0.035000,0.127000> rotate<0,0.000000,0> translate<66.333000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.344800,0.000000,67.614800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.344800,0.000000,69.342000>}
box{<0,0,-0.127000><1.727200,0.035000,0.127000> rotate<0,90.000000,0> translate<66.344800,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.637800,0.000000,50.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.421000,0.000000,51.968400>}
box{<0,0,-0.127000><2.521826,0.035000,0.127000> rotate<0,-44.997030,0> translate<64.637800,0.000000,50.185200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.040000,0.000000,61.823600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.421000,0.000000,61.849000>}
box{<0,0,-0.152400><0.381846,0.035000,0.152400> rotate<0,-3.813823,0> translate<66.040000,0.000000,61.823600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.167000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,0.000000,74.295000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<66.167000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.510800,0.000000,54.875800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.510800,0.000000,54.762400>}
box{<0,0,-0.127000><0.113400,0.035000,0.127000> rotate<0,-90.000000,0> translate<66.510800,0.000000,54.762400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.151000,0.000000,56.235600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.510800,0.000000,54.875800>}
box{<0,0,-0.127000><1.923048,0.035000,0.127000> rotate<0,44.997030,0> translate<65.151000,0.000000,56.235600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.405000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,-1.535000,12.065000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<65.405000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,-1.535000,12.192000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<66.675000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.532000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.802000,-1.535000,8.382000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<65.532000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.192400,0.000000,59.664600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.827400,0.000000,60.299600>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<66.192400,0.000000,59.664600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.192400,0.000000,60.934600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.929000,0.000000,60.960000>}
box{<0,0,-0.127000><0.737038,0.035000,0.127000> rotate<0,-1.974804,0> translate<66.192400,0.000000,60.934600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.966200,0.000000,56.985800>}
box{<0,0,-0.203200><1.309845,0.035000,0.203200> rotate<0,44.997030,0> translate<66.040000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.310000,-1.535000,10.795000>}
box{<0,0,-0.152400><1.419903,0.035000,0.152400> rotate<0,63.430762,0> translate<66.675000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.064400,0.000000,65.354200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,65.405000>}
box{<0,0,-0.127000><9.245740,0.035000,0.127000> rotate<0,-0.314788,0> translate<58.064400,0.000000,65.354200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.344800,0.000000,67.614800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,66.649600>}
box{<0,0,-0.127000><1.364999,0.035000,0.127000> rotate<0,44.997030,0> translate<66.344800,0.000000,67.614800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,66.649600>}
box{<0,0,-0.127000><1.244600,0.035000,0.127000> rotate<0,90.000000,0> translate<67.310000,0.000000,66.649600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.784000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,78.994000>}
box{<0,0,-0.203200><17.526000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.784000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.905400,-1.535000,46.583600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.513200,-1.535000,46.583600>}
box{<0,0,-0.127000><11.607800,0.035000,0.127000> rotate<0,0.000000,0> translate<55.905400,-1.535000,46.583600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.051200,0.000000,6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.894200,0.000000,6.680200>}
box{<0,0,-0.635000><13.843000,0.035000,0.635000> rotate<0,0.000000,0> translate<54.051200,0.000000,6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.894200,0.000000,6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,9.144000>}
box{<0,0,-0.635000><2.464324,0.035000,0.635000> rotate<0,-88.812949,0> translate<67.894200,0.000000,6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.966200,0.000000,56.985800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.021200,0.000000,56.985800>}
box{<0,0,-0.203200><1.055000,0.035000,0.203200> rotate<0,0.000000,0> translate<66.966200,0.000000,56.985800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.177800,0.000000,58.939800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.021200,0.000000,58.939800>}
box{<0,0,-0.127000><9.843400,0.035000,0.127000> rotate<0,0.000000,0> translate<58.177800,0.000000,58.939800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.421000,0.000000,61.849000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.072000,0.000000,61.849000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<66.421000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.064400,0.000000,64.236600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.072000,0.000000,64.185800>}
box{<0,0,-0.127000><10.007729,0.035000,0.127000> rotate<0,0.290820,0> translate<58.064400,0.000000,64.236600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.199000,0.000000,9.652000>}
box{<0,0,-0.635000><0.567961,0.035000,0.635000> rotate<0,-63.430762,0> translate<67.945000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.199000,0.000000,9.652000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,0.000000,0> translate<67.945000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.199000,0.000000,9.652000>}
box{<0,0,-0.635000><1.047269,0.035000,0.635000> rotate<0,75.958743,0> translate<67.945000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.040000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.199000,0.000000,72.136000>}
box{<0,0,-0.152400><3.053287,0.035000,0.152400> rotate<0,44.997030,0> translate<66.040000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.199000,0.000000,69.469000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.199000,0.000000,72.136000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<68.199000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.100200,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.275200,-1.535000,20.447000>}
box{<0,0,-0.635000><4.490128,0.035000,0.635000> rotate<0,44.997030,0> translate<65.100200,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.199000,0.000000,69.469000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.287000,0.000000,69.342000>}
box{<0,0,-0.152400><0.154509,0.035000,0.152400> rotate<0,55.277745,0> translate<68.199000,0.000000,69.469000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.453000,0.000000,10.287000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,36.867464,0> translate<67.945000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.929000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.453000,0.000000,60.960000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.929000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.421000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.453000,0.000000,76.327000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<66.421000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.453000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.453000,0.000000,76.327000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.453000,0.000000,76.327000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.453000,0.000000,77.851000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,44.997030,0> translate<67.310000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.532000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,0.000000,18.288000>}
box{<0,0,-0.635000><3.048000,0.035000,0.635000> rotate<0,0.000000,0> translate<65.532000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.827400,0.000000,60.299600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.834000,0.000000,60.299600>}
box{<0,0,-0.127000><2.006600,0.035000,0.127000> rotate<0,0.000000,0> translate<66.827400,0.000000,60.299600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,27.178000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,90.000000,0> translate<68.961000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,27.305000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<68.961000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.453000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.088000,0.000000,9.652000>}
box{<0,0,-0.635000><0.898026,0.035000,0.635000> rotate<0,44.997030,0> translate<68.453000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.088000,0.000000,27.178000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<68.961000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.165000,0.000000,18.205000>}
box{<0,0,-0.635000><0.590859,0.035000,0.635000> rotate<0,8.074715,0> translate<68.580000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.961000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.165000,0.000000,23.705000>}
box{<0,0,-0.152400><0.588490,0.035000,0.152400> rotate<0,69.712840,0> translate<68.961000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.945000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,12.192000>}
box{<0,0,-0.635000><1.983803,0.035000,0.635000> rotate<0,-50.191116,0> translate<67.945000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.165000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,18.161000>}
box{<0,0,-0.635000><0.066603,0.035000,0.635000> rotate<0,41.345048,0> translate<69.165000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,18.161000>}
box{<0,0,-0.635000><2.921000,0.035000,0.635000> rotate<0,90.000000,0> translate<69.215000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.165000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,18.796000>}
box{<0,0,-0.635000><0.593111,0.035000,0.635000> rotate<0,-85.158537,0> translate<69.165000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.165000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,23.622000>}
box{<0,0,-0.635000><0.096897,0.035000,0.635000> rotate<0,58.930946,0> translate<69.165000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,23.622000>}
box{<0,0,-0.635000><4.826000,0.035000,0.635000> rotate<0,90.000000,0> translate<69.215000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,49.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.243200,0.000000,49.685200>}
box{<0,0,-0.127000><8.843000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,49.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.982600,0.000000,39.319200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.443600,0.000000,39.319200>}
box{<0,0,-0.127000><5.461000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.982600,0.000000,39.319200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.072000,0.000000,61.849000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,0.000000,63.246000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<68.072000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.453000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.596000,0.000000,62.103000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.453000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.072000,0.000000,64.185800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.723000,0.000000,65.405000>}
box{<0,0,-0.152400><2.052377,0.035000,0.152400> rotate<0,-36.442037,0> translate<68.072000,0.000000,64.185800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.243200,0.000000,49.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.748400,0.000000,50.190400>}
box{<0,0,-0.127000><0.714461,0.035000,0.127000> rotate<0,-44.997030,0> translate<69.243200,0.000000,49.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.748400,0.000000,50.190400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.748400,0.000000,50.876200>}
box{<0,0,-0.127000><0.685800,0.035000,0.127000> rotate<0,90.000000,0> translate<69.748400,0.000000,50.876200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.834000,0.000000,60.299600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.053200,0.000000,61.518800>}
box{<0,0,-0.127000><1.724209,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.834000,0.000000,60.299600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,41.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.192000,0.000000,41.185200>}
box{<0,0,-0.127000><9.791800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,41.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.443600,-1.535000,39.319200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.434200,-1.535000,40.335200>}
box{<0,0,-0.127000><1.418994,0.035000,0.127000> rotate<0,-45.722207,0> translate<69.443600,-1.535000,39.319200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.748400,0.000000,50.876200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.459600,0.000000,51.587400>}
box{<0,0,-0.127000><1.005789,0.035000,0.127000> rotate<0,-44.997030,0> translate<69.748400,0.000000,50.876200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.088000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.485000,0.000000,9.652000>}
box{<0,0,-0.635000><1.397000,0.035000,0.635000> rotate<0,0.000000,0> translate<69.088000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.659000,-1.535000,60.553600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.637400,-1.535000,60.528200>}
box{<0,0,-0.127000><4.978465,0.035000,0.127000> rotate<0,0.292304,0> translate<65.659000,-1.535000,60.553600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.021200,0.000000,56.985800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.662800,0.000000,56.985800>}
box{<0,0,-0.203200><2.641600,0.035000,0.203200> rotate<0,0.000000,0> translate<68.021200,0.000000,56.985800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.662800,0.000000,60.528200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.662800,0.000000,58.939800>}
box{<0,0,-0.127000><1.588400,0.035000,0.127000> rotate<0,-90.000000,0> translate<70.662800,0.000000,58.939800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.637400,0.000000,60.528200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.662800,0.000000,60.528200>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<70.637400,0.000000,60.528200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.060600,-1.535000,45.237400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.967600,-1.535000,45.237400>}
box{<0,0,-0.127000><17.907000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.060600,-1.535000,45.237400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.464800,0.000000,54.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.993000,0.000000,54.762400>}
box{<0,0,-0.203200><2.528200,0.035000,0.203200> rotate<0,0.000000,0> translate<68.464800,0.000000,54.762400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.088000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,29.210000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.088000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.145000,0.000000,29.210000>}
box{<0,0,-0.152400><0.025000,0.035000,0.152400> rotate<0,0.000000,0> translate<71.120000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.145000,0.000000,29.210000>}
box{<0,0,-0.152400><0.129437,0.035000,0.152400> rotate<0,78.858486,0> translate<71.120000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.287000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.159000,0.000000,69.342000>}
box{<0,0,-0.152400><2.872000,0.035000,0.152400> rotate<0,0.000000,0> translate<68.287000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.221600,0.000000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.221600,0.000000,32.308800>}
box{<0,0,-0.203200><2.362200,0.035000,0.203200> rotate<0,90.000000,0> translate<71.221600,0.000000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.167000,0.000000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.247000,0.000000,69.215000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,44.997030,0> translate<66.167000,0.000000,74.295000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.159000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.247000,0.000000,69.215000>}
box{<0,0,-0.152400><0.154509,0.035000,0.152400> rotate<0,55.277745,0> translate<71.159000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,0.000000,16.332200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,0.000000,25.323800>}
box{<0,0,-0.127000><8.991600,0.035000,0.127000> rotate<0,90.000000,0> translate<71.272400,0.000000,25.323800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.513200,-1.535000,46.583600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,-1.535000,50.368200>}
box{<0,0,-0.127000><5.334302,0.035000,0.127000> rotate<0,-45.189932,0> translate<67.513200,-1.535000,46.583600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.145000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.348200,0.000000,29.413200>}
box{<0,0,-0.203200><0.287368,0.035000,0.203200> rotate<0,-44.997030,0> translate<71.145000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.215000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,0.000000,13.716000>}
box{<0,0,-0.635000><2.642699,0.035000,0.635000> rotate<0,35.215269,0> translate<69.215000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,0.000000,13.716000>}
box{<0,0,-0.635000><1.016000,0.035000,0.635000> rotate<0,90.000000,0> translate<71.374000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.053200,0.000000,61.518800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.704200,0.000000,61.518800>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,0.000000,0> translate<70.053200,0.000000,61.518800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.755000,0.000000,12.192000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,53.126596,0> translate<71.374000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.221600,0.000000,29.946600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.755000,0.000000,29.413200>}
box{<0,0,-0.203200><0.754342,0.035000,0.203200> rotate<0,44.997030,0> translate<71.221600,0.000000,29.946600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.348200,0.000000,29.413200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.755000,0.000000,29.413200>}
box{<0,0,-0.203200><0.406800,0.035000,0.203200> rotate<0,0.000000,0> translate<71.348200,0.000000,29.413200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,0.000000,16.332200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,15.621000>}
box{<0,0,-0.127000><0.936706,0.035000,0.127000> rotate<0,49.395445,0> translate<71.272400,0.000000,16.332200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.723000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.136000,0.000000,65.405000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,0.000000,0> translate<69.723000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.421000,-1.535000,51.968400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.263000,-1.535000,51.968400>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.421000,-1.535000,51.968400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,49.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.477000,0.000000,49.185200>}
box{<0,0,-0.127000><12.076800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,49.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.596000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.517000,0.000000,62.103000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,0.000000,0> translate<69.596000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.469000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.517000,0.000000,63.246000>}
box{<0,0,-0.152400><3.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<69.469000,0.000000,63.246000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,0.000000,50.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.618600,0.000000,50.368200>}
box{<0,0,-0.127000><1.346200,0.035000,0.127000> rotate<0,0.000000,0> translate<71.272400,0.000000,50.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.459600,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.618600,0.000000,51.587400>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<70.459600,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.520600,-1.535000,38.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.974200,-1.535000,38.176200>}
box{<0,0,-0.127000><22.453600,0.035000,0.127000> rotate<0,0.000000,0> translate<50.520600,-1.535000,38.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.192000,0.000000,41.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.999600,0.000000,41.173400>}
box{<0,0,-0.127000><2.807625,0.035000,0.127000> rotate<0,0.240790,0> translate<70.192000,0.000000,41.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.434200,-1.535000,40.335200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.999600,-1.535000,41.173400>}
box{<0,0,-0.127000><2.698862,0.035000,0.127000> rotate<0,-18.092712,0> translate<70.434200,-1.535000,40.335200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.755000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.025000,0.000000,9.652000>}
box{<0,0,-0.635000><2.839806,0.035000,0.635000> rotate<0,63.430762,0> translate<71.755000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,48.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.094600,0.000000,48.685200>}
box{<0,0,-0.127000><12.694400,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,48.685200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.136000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.113000,0.000000,66.382000>}
box{<0,0,-0.203200><1.381687,0.035000,0.203200> rotate<0,-44.997030,0> translate<72.136000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.113000,0.000000,66.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.113000,0.000000,69.342000>}
box{<0,0,-0.203200><2.960000,0.035000,0.203200> rotate<0,90.000000,0> translate<73.113000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,43.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.200000,0.000000,43.685200>}
box{<0,0,-0.127000><12.799800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,43.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.704200,0.000000,61.518800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.279000,0.000000,59.944000>}
box{<0,0,-0.127000><2.227104,0.035000,0.127000> rotate<0,44.997030,0> translate<71.704200,0.000000,61.518800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.272400,0.000000,25.323800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.329800,0.000000,27.381200>}
box{<0,0,-0.127000><2.909603,0.035000,0.127000> rotate<0,-44.997030,0> translate<71.272400,0.000000,25.323800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.329800,0.000000,27.381200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.329800,0.000000,31.902400>}
box{<0,0,-0.127000><4.521200,0.035000,0.127000> rotate<0,90.000000,0> translate<73.329800,0.000000,31.902400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.662800,0.000000,56.985800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.355200,0.000000,56.985800>}
box{<0,0,-0.203200><2.692400,0.035000,0.203200> rotate<0,0.000000,0> translate<70.662800,0.000000,56.985800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.279000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.355200,0.000000,58.939800>}
box{<0,0,-0.152400><1.007087,0.035000,0.152400> rotate<0,85.654984,0> translate<73.279000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,48.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.534400,0.000000,48.185200>}
box{<0,0,-0.127000><13.134200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,48.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,40.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.578200,0.000000,40.202600>}
box{<0,0,-0.127000><13.186834,0.035000,0.127000> rotate<0,2.097190,0> translate<60.400200,0.000000,40.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,43.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.716000,0.000000,43.185200>}
box{<0,0,-0.127000><13.315800,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,43.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.413400,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.015600,0.000000,42.672000>}
box{<0,0,-0.127000><13.602200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.413400,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.517000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.041000,0.000000,64.770000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.517000,0.000000,63.246000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,47.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.075800,0.000000,47.685200>}
box{<0,0,-0.127000><13.675600,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,47.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.967600,-1.535000,45.237400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.091800,-1.535000,48.361600>}
box{<0,0,-0.127000><4.418286,0.035000,0.127000> rotate<0,-44.997030,0> translate<70.967600,-1.535000,45.237400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.263000,-1.535000,51.968400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.091800,-1.535000,50.139600>}
box{<0,0,-0.127000><2.586314,0.035000,0.127000> rotate<0,44.997030,0> translate<72.263000,-1.535000,51.968400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.091800,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.091800,-1.535000,50.139600>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<74.091800,-1.535000,50.139600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.350400,0.000000,46.710600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.142600,0.000000,46.710600>}
box{<0,0,-0.127000><13.792200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.350400,0.000000,46.710600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.755000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<74.295000,0.000000,12.192000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<71.755000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.517000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.549000,0.000000,64.135000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.517000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.400200,0.000000,46.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.582400,0.000000,46.185200>}
box{<0,0,-0.127000><14.182200,0.035000,0.127000> rotate<0,0.000000,0> translate<60.400200,0.000000,46.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.329800,0.000000,31.902400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.676000,0.000000,33.248600>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.329800,0.000000,31.902400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.753000,-1.535000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.777600,-1.535000,26.289000>}
box{<0,0,-0.127000><19.024600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.753000,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.279000,0.000000,54.762400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.828400,0.000000,55.118000>}
box{<0,0,-0.152400><1.589683,0.035000,0.152400> rotate<0,-12.925146,0> translate<73.279000,0.000000,54.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.866500,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.866500,0.000000,31.559500>}
box{<0,0,-0.203200><5.270500,0.035000,0.203200> rotate<0,90.000000,0> translate<74.866500,0.000000,31.559500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.508400,-1.535000,43.916600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.980800,-1.535000,43.891200>}
box{<0,0,-0.127000><20.472416,0.035000,0.127000> rotate<0,0.071082,0> translate<54.508400,-1.535000,43.916600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.908200,-1.535000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.133200,-1.535000,42.900600>}
box{<0,0,-0.127000><22.225000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.908200,-1.535000,42.900600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.286400,-1.535000,27.482800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.311000,-1.535000,27.482800>}
box{<0,0,-0.127000><19.024600,0.035000,0.127000> rotate<0,0.000000,0> translate<56.286400,-1.535000,27.482800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.275200,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<75.438000,-1.535000,20.447000>}
box{<0,0,-0.635000><7.162800,0.035000,0.635000> rotate<0,0.000000,0> translate<68.275200,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.432200,-1.535000,41.986200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.539600,-1.535000,42.164000>}
box{<0,0,-0.127000><21.108149,0.035000,0.127000> rotate<0,-0.482593,0> translate<54.432200,-1.535000,41.986200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,25.501600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,22.428200>}
box{<0,0,-0.127000><3.073400,0.035000,0.127000> rotate<0,-90.000000,0> translate<75.565000,-1.535000,22.428200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.777600,-1.535000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,25.501600>}
box{<0,0,-0.127000><1.113552,0.035000,0.127000> rotate<0,44.997030,0> translate<74.777600,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.866500,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,25.590500>}
box{<0,0,-0.203200><0.987828,0.035000,0.203200> rotate<0,44.997030,0> translate<74.866500,0.000000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,20.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,25.590500>}
box{<0,0,-0.203200><5.385500,0.035000,0.203200> rotate<0,90.000000,0> translate<75.565000,0.000000,25.590500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.279000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.565000,0.000000,61.214000>}
box{<0,0,-0.152400><2.615090,0.035000,0.152400> rotate<0,-29.052687,0> translate<73.279000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,22.428200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.073000,-1.535000,21.920200>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<75.565000,-1.535000,22.428200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.355200,0.000000,56.985800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.084800,0.000000,57.048400>}
box{<0,0,-0.203200><2.730318,0.035000,0.203200> rotate<0,-1.313691,0> translate<73.355200,0.000000,56.985800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.618600,0.000000,51.587400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.098400,0.000000,55.067200>}
box{<0,0,-0.127000><4.921180,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.618600,0.000000,51.587400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.618600,0.000000,50.368200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.276200,0.000000,54.025800>}
box{<0,0,-0.127000><5.172628,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.618600,0.000000,50.368200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.828400,0.000000,55.118000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,56.261000>}
box{<0,0,-0.127000><1.884742,0.035000,0.127000> rotate<0,-37.330732,0> translate<74.828400,0.000000,55.118000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.327000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.428600,0.000000,58.064400>}
box{<0,0,-0.203200><0.143684,0.035000,0.203200> rotate<0,44.997030,0> translate<76.327000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.477000,0.000000,49.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.454000,0.000000,53.162200>}
box{<0,0,-0.127000><5.624327,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.477000,0.000000,49.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.094600,0.000000,48.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.581000,0.000000,52.171600>}
box{<0,0,-0.127000><4.930514,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.094600,0.000000,48.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.534400,0.000000,48.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.733400,0.000000,51.384200>}
box{<0,0,-0.127000><4.524069,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.534400,0.000000,48.185200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.327000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.784200,0.000000,58.166000>}
box{<0,0,-0.203200><0.457200,0.035000,0.203200> rotate<0,0.000000,0> translate<76.327000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.582400,0.000000,46.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.835000,0.000000,48.437800>}
box{<0,0,-0.127000><3.185657,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.582400,0.000000,46.185200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.565000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,62.484000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<75.565000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.084800,0.000000,57.048400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.885800,0.000000,58.064400>}
box{<0,0,-0.203200><1.293776,0.035000,0.203200> rotate<0,-51.744840,0> translate<76.084800,0.000000,57.048400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.428600,0.000000,58.064400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.885800,0.000000,58.064400>}
box{<0,0,-0.203200><0.457200,0.035000,0.203200> rotate<0,0.000000,0> translate<76.428600,0.000000,58.064400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.784200,0.000000,58.166000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.885800,0.000000,58.064400>}
box{<0,0,-0.203200><0.143684,0.035000,0.203200> rotate<0,44.997030,0> translate<76.784200,0.000000,58.166000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.885800,0.000000,62.585600>}
box{<0,0,-0.152400><0.113592,0.035000,0.152400> rotate<0,-63.430762,0> translate<76.835000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<74.295000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<76.962000,0.000000,12.192000>}
box{<0,0,-0.635000><2.667000,0.035000,0.635000> rotate<0,0.000000,0> translate<74.295000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.200000,0.000000,43.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.962000,0.000000,47.447200>}
box{<0,0,-0.127000><5.320271,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.200000,0.000000,43.685200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.885800,0.000000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.962000,0.000000,62.611000>}
box{<0,0,-0.152400><0.080322,0.035000,0.152400> rotate<0,-18.433732,0> translate<76.885800,0.000000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.001000,0.000000,71.559400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.001000,0.000000,66.421000>}
box{<0,0,-0.203200><5.138400,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.001000,0.000000,66.421000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.075800,0.000000,47.685200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.012800,0.000000,50.622200>}
box{<0,0,-0.127000><4.153545,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.075800,0.000000,47.685200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.142600,0.000000,46.710600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.038200,0.000000,49.606200>}
box{<0,0,-0.127000><4.094997,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.142600,0.000000,46.710600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.015600,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.063600,0.000000,45.720000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.015600,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.716000,0.000000,43.185200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.063600,0.000000,46.532800>}
box{<0,0,-0.127000><4.734221,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.716000,0.000000,43.185200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.676000,0.000000,33.248600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.139800,0.000000,36.411800>}
box{<0,0,-0.127000><4.009507,0.035000,0.127000> rotate<0,-52.081724,0> translate<74.676000,0.000000,33.248600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.221600,0.000000,32.308800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.139800,0.000000,38.227000>}
box{<0,0,-0.203200><8.369599,0.035000,0.203200> rotate<0,-44.997030,0> translate<71.221600,0.000000,32.308800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.139800,0.000000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.139800,0.000000,38.365800>}
box{<0,0,-0.203200><0.138800,0.035000,0.203200> rotate<0,90.000000,0> translate<77.139800,0.000000,38.365800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.139800,0.000000,38.365800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.139800,0.000000,40.411400>}
box{<0,0,-0.127000><2.045600,0.035000,0.127000> rotate<0,90.000000,0> translate<77.139800,0.000000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.445000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.445000,0.000000,29.693000>}
box{<0,0,-0.203200><0.483000,0.035000,0.203200> rotate<0,90.000000,0> translate<77.445000,0.000000,29.693000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.445000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.470000,0.000000,29.210000>}
box{<0,0,-0.635000><0.025000,0.035000,0.635000> rotate<0,0.000000,0> translate<77.445000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.470000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.470000,0.000000,29.210000>}
box{<0,0,-0.635000><1.651000,0.035000,0.635000> rotate<0,90.000000,0> translate<77.470000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,20.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.565000,0.000000,18.205000>}
box{<0,0,-0.203200><2.828427,0.035000,0.203200> rotate<0,44.997030,0> translate<75.565000,0.000000,20.205000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.565000,-1.535000,25.228800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.565000,-1.535000,23.705000>}
box{<0,0,-0.127000><1.523800,0.035000,0.127000> rotate<0,-90.000000,0> translate<77.565000,-1.535000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.311000,-1.535000,27.482800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.565000,-1.535000,25.228800>}
box{<0,0,-0.127000><3.187637,0.035000,0.127000> rotate<0,44.997030,0> translate<75.311000,-1.535000,27.482800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<75.438000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,-1.535000,18.288000>}
box{<0,0,-0.635000><3.053287,0.035000,0.635000> rotate<0,44.997030,0> translate<75.438000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.565000,0.000000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,18.288000>}
box{<0,0,-0.635000><0.088955,0.035000,0.635000> rotate<0,-68.911697,0> translate<77.565000,0.000000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.565000,-1.535000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,-1.535000,18.288000>}
box{<0,0,-0.635000><0.088955,0.035000,0.635000> rotate<0,-68.911697,0> translate<77.565000,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.565000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,23.749000>}
box{<0,0,-0.635000><0.054406,0.035000,0.635000> rotate<0,-53.969065,0> translate<77.565000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.470000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,27.432000>}
box{<0,0,-0.635000><0.179605,0.035000,0.635000> rotate<0,44.997030,0> translate<77.470000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,27.432000>}
box{<0,0,-0.635000><3.683000,0.035000,0.635000> rotate<0,90.000000,0> translate<77.597000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.885800,0.000000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.724000,0.000000,62.738000>}
box{<0,0,-0.152400><0.851942,0.035000,0.152400> rotate<0,-10.304166,0> translate<76.885800,0.000000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.001000,0.000000,71.559400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.743500,0.000000,72.288300>}
box{<0,0,-0.203200><1.040481,0.035000,0.203200> rotate<0,-44.467501,0> translate<77.001000,0.000000,71.559400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.073000,-1.535000,21.920200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.927200,-1.535000,21.920200>}
box{<0,0,-0.127000><1.854200,0.035000,0.127000> rotate<0,0.000000,0> translate<76.073000,-1.535000,21.920200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.041000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.359000,0.000000,64.770000>}
box{<0,0,-0.152400><4.318000,0.035000,0.152400> rotate<0,0.000000,0> translate<74.041000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.139800,0.000000,40.411400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.663800,0.000000,43.053000>}
box{<0,0,-0.127000><3.049693,0.035000,0.127000> rotate<0,-60.014400,0> translate<77.139800,0.000000,40.411400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.841600,0.000000,56.286400>}
box{<0,0,-0.127000><2.514728,0.035000,0.127000> rotate<0,-0.578687,0> translate<76.327000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.511400,-1.535000,55.930800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.841600,-1.535000,56.286400>}
box{<0,0,-0.127000><0.485266,0.035000,0.127000> rotate<0,-47.117987,0> translate<78.511400,-1.535000,55.930800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<76.962000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<78.867000,0.000000,14.097000>}
box{<0,0,-0.635000><2.694077,0.035000,0.635000> rotate<0,-44.997030,0> translate<76.962000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.578200,0.000000,40.202600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.867000,0.000000,45.085000>}
box{<0,0,-0.127000><7.197863,0.035000,0.127000> rotate<0,-42.709091,0> translate<73.578200,0.000000,40.202600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.359000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.955000,0.000000,65.366000>}
box{<0,0,-0.152400><0.842871,0.035000,0.152400> rotate<0,-44.997030,0> translate<78.359000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.955000,0.000000,65.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.955000,0.000000,66.421000>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,90.000000,0> translate<78.955000,0.000000,66.421000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.955000,-1.535000,69.635000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.955000,-1.535000,67.487800>}
box{<0,0,-0.127000><2.147200,0.035000,0.127000> rotate<0,-90.000000,0> translate<78.955000,-1.535000,67.487800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.740000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.955000,-1.535000,69.635000>}
box{<0,0,-0.127000><0.304056,0.035000,0.127000> rotate<0,44.997030,0> translate<78.740000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.955000,0.000000,69.635000>}
box{<0,0,-0.203200><0.304056,0.035000,0.203200> rotate<0,44.997030,0> translate<78.740000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.955000,0.000000,66.421000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.955000,0.000000,69.635000>}
box{<0,0,-0.203200><3.214000,0.035000,0.203200> rotate<0,90.000000,0> translate<78.955000,0.000000,69.635000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.743500,0.000000,72.288300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.121000,0.000000,72.263000>}
box{<0,0,-0.203200><1.377732,0.035000,0.203200> rotate<0,1.052141,0> translate<77.743500,0.000000,72.288300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.511400,-1.535000,55.930800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.171800,-1.535000,57.200800>}
box{<0,0,-0.127000><1.431443,0.035000,0.127000> rotate<0,-62.521442,0> translate<78.511400,-1.535000,55.930800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.885800,-1.535000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,60.248800>}
box{<0,0,-0.127000><3.286823,0.035000,0.127000> rotate<0,45.310098,0> translate<76.885800,-1.535000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.171800,-1.535000,57.200800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,60.248800>}
box{<0,0,-0.127000><3.048106,0.035000,0.127000> rotate<0,-89.516638,0> translate<79.171800,-1.535000,57.200800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,67.245600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,62.484000>}
box{<0,0,-0.127000><4.761600,0.035000,0.127000> rotate<0,-90.000000,0> translate<79.197200,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.955000,-1.535000,67.487800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,67.245600>}
box{<0,0,-0.127000><0.342523,0.035000,0.127000> rotate<0,44.997030,0> translate<78.955000,-1.535000,67.487800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.549000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.375000,0.000000,64.135000>}
box{<0,0,-0.127000><4.826000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.549000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,74.066400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,76.149200>}
box{<0,0,-0.127000><2.082800,0.035000,0.127000> rotate<0,90.000000,0> translate<79.425800,-1.535000,76.149200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,76.149200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,-1.535000,77.089000>}
box{<0,0,-0.127000><0.942884,0.035000,0.127000> rotate<0,-85.358903,0> translate<79.425800,-1.535000,76.149200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.866500,0.000000,31.559500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.629000,0.000000,36.322000>}
box{<0,0,-0.203200><6.735192,0.035000,0.203200> rotate<0,-44.997030,0> translate<74.866500,0.000000,31.559500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.629000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.629000,0.000000,36.488000>}
box{<0,0,-0.203200><0.166000,0.035000,0.203200> rotate<0,90.000000,0> translate<79.629000,0.000000,36.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.629000,0.000000,38.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.629000,0.000000,40.767000>}
box{<0,0,-0.203200><2.325000,0.035000,0.203200> rotate<0,90.000000,0> translate<79.629000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.663800,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.629000,0.000000,43.053000>}
box{<0,0,-0.127000><0.965200,0.035000,0.127000> rotate<0,0.000000,0> translate<78.663800,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.654400,-1.535000,20.193000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.654400,-1.535000,16.789400>}
box{<0,0,-0.127000><3.403600,0.035000,0.127000> rotate<0,-90.000000,0> translate<79.654400,-1.535000,16.789400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.927200,-1.535000,21.920200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.654400,-1.535000,20.193000>}
box{<0,0,-0.127000><2.442630,0.035000,0.127000> rotate<0,44.997030,0> translate<77.927200,-1.535000,21.920200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,74.066400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.933800,-1.535000,73.558400>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<79.425800,-1.535000,74.066400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.565000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.111800,0.000000,21.158200>}
box{<0,0,-0.127000><3.601719,0.035000,0.127000> rotate<0,44.997030,0> translate<77.565000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.802000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.137000,-1.535000,8.382000>}
box{<0,0,-0.152400><13.335000,0.035000,0.152400> rotate<0,0.000000,0> translate<66.802000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.629000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.137000,0.000000,43.180000>}
box{<0,0,-0.152400><0.523634,0.035000,0.152400> rotate<0,-14.035317,0> translate<79.629000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.213200,-1.535000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.213200,-1.535000,62.865000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,-90.000000,0> translate<80.213200,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.654400,-1.535000,16.789400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.695800,-1.535000,15.748000>}
box{<0,0,-0.127000><1.472762,0.035000,0.127000> rotate<0,44.997030,0> translate<79.654400,-1.535000,16.789400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.137000,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.280000,-1.535000,9.525000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,-44.997030,0> translate<80.137000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.280000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.280000,-1.535000,9.652000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<81.280000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.310000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.280000,-1.535000,10.795000>}
box{<0,0,-0.152400><13.970000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.310000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.213200,-1.535000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,66.852800>}
box{<0,0,-0.127000><1.508683,0.035000,0.127000> rotate<0,-44.997030,0> translate<80.213200,-1.535000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,66.852800>}
box{<0,0,-0.127000><2.997200,0.035000,0.127000> rotate<0,-90.000000,0> translate<81.280000,-1.535000,66.852800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.280000,0.000000,66.714000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.280000,0.000000,69.850000>}
box{<0,0,-0.203200><3.136000,0.035000,0.203200> rotate<0,90.000000,0> translate<81.280000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.894200,0.000000,6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.381600,0.000000,6.680200>}
box{<0,0,-0.635000><13.487400,0.035000,0.635000> rotate<0,0.000000,0> translate<67.894200,0.000000,6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.375000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.534000,0.000000,66.294000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.375000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<77.597000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.661000,0.000000,18.288000>}
box{<0,0,-0.635000><4.064000,0.035000,0.635000> rotate<0,0.000000,0> translate<77.597000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.280000,0.000000,66.714000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.700000,0.000000,66.294000>}
box{<0,0,-0.203200><0.593970,0.035000,0.203200> rotate<0,44.997030,0> translate<81.280000,0.000000,66.714000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.534000,0.000000,66.294000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.700000,0.000000,66.294000>}
box{<0,0,-0.127000><0.166000,0.035000,0.127000> rotate<0,0.000000,0> translate<81.534000,0.000000,66.294000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.661000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.765000,0.000000,18.205000>}
box{<0,0,-0.635000><0.133060,0.035000,0.635000> rotate<0,38.590013,0> translate<81.661000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.765000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.788000,0.000000,23.622000>}
box{<0,0,-0.635000><0.086128,0.035000,0.635000> rotate<0,74.506581,0> translate<81.765000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.381600,0.000000,6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.915000,0.000000,6.985000>}
box{<0,0,-0.635000><0.614344,0.035000,0.635000> rotate<0,-29.742918,0> translate<81.381600,0.000000,6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.788000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.915000,0.000000,23.495000>}
box{<0,0,-0.635000><0.179605,0.035000,0.635000> rotate<0,44.997030,0> translate<81.788000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.445000,0.000000,29.693000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.042000,0.000000,34.290000>}
box{<0,0,-0.203200><6.501140,0.035000,0.203200> rotate<0,-44.997030,0> translate<77.445000,0.000000,29.693000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.042000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.042000,0.000000,36.488000>}
box{<0,0,-0.203200><2.198000,0.035000,0.203200> rotate<0,90.000000,0> translate<82.042000,0.000000,36.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.042000,0.000000,38.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.042000,0.000000,40.767000>}
box{<0,0,-0.203200><2.325000,0.035000,0.203200> rotate<0,90.000000,0> translate<82.042000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.629000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.042000,0.000000,43.053000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,0.000000,0> translate<79.629000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.765000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<82.169000,0.000000,24.130000>}
box{<0,0,-0.635000><0.586380,0.035000,0.635000> rotate<0,-46.448025,0> translate<81.765000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<82.169000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<82.169000,0.000000,29.210000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,90.000000,0> translate<82.169000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.169000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.169000,0.000000,30.861000>}
box{<0,0,-0.304800><1.143000,0.035000,0.304800> rotate<0,90.000000,0> translate<82.169000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<82.169000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<82.194000,0.000000,29.210000>}
box{<0,0,-0.635000><0.025000,0.035000,0.635000> rotate<0,0.000000,0> translate<82.169000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.169000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.194000,0.000000,29.210000>}
box{<0,0,-0.304800><0.508615,0.035000,0.304800> rotate<0,87.176845,0> translate<82.169000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.197200,-1.535000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.270600,-1.535000,59.410600>}
box{<0,0,-0.127000><4.346444,0.035000,0.127000> rotate<0,44.997030,0> translate<79.197200,-1.535000,62.484000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.280000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.550000,-1.535000,12.065000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<81.280000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.550000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.550000,-1.535000,12.192000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<82.550000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,15.621000>}
box{<0,0,-0.127000><10.820400,0.035000,0.127000> rotate<0,0.000000,0> translate<71.882000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.111800,0.000000,21.158200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,21.158200>}
box{<0,0,-0.127000><2.590600,0.035000,0.127000> rotate<0,0.000000,0> translate<80.111800,0.000000,21.158200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.213200,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.804000,-1.535000,60.274200>}
box{<0,0,-0.127000><3.663944,0.035000,0.127000> rotate<0,44.997030,0> translate<80.213200,-1.535000,62.865000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.765000,-1.535000,18.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.134200,-1.535000,19.574200>}
box{<0,0,-0.203200><1.936341,0.035000,0.203200> rotate<0,-44.997030,0> translate<81.765000,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.134200,-1.535000,19.574200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.134200,-1.535000,20.421600>}
box{<0,0,-0.203200><0.847400,0.035000,0.203200> rotate<0,90.000000,0> translate<83.134200,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.962000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.312000,0.000000,62.611000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<76.962000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.276200,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.388200,0.000000,54.025800>}
box{<0,0,-0.127000><7.112000,0.035000,0.127000> rotate<0,0.000000,0> translate<76.276200,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.885800,0.000000,58.064400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.388200,0.000000,58.064400>}
box{<0,0,-0.203200><6.502400,0.035000,0.203200> rotate<0,0.000000,0> translate<76.885800,0.000000,58.064400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.312000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.388200,0.000000,62.585600>}
box{<0,0,-0.152400><0.080322,0.035000,0.152400> rotate<0,18.433732,0> translate<83.312000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.098400,0.000000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.413600,0.000000,55.067200>}
box{<0,0,-0.127000><7.315200,0.035000,0.127000> rotate<0,0.000000,0> translate<76.098400,0.000000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.388200,-1.535000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.439000,-1.535000,62.611000>}
box{<0,0,-0.152400><0.056796,0.035000,0.152400> rotate<0,-26.563298,0> translate<83.388200,-1.535000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.581000,0.000000,52.171600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.515200,0.000000,52.171600>}
box{<0,0,-0.127000><6.934200,0.035000,0.127000> rotate<0,0.000000,0> translate<76.581000,0.000000,52.171600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.454000,0.000000,53.162200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.515200,0.000000,53.162200>}
box{<0,0,-0.127000><7.061200,0.035000,0.127000> rotate<0,0.000000,0> translate<76.454000,0.000000,53.162200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.169000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.566000,0.000000,32.258000>}
box{<0,0,-0.304800><1.975656,0.035000,0.304800> rotate<0,-44.997030,0> translate<82.169000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.566000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.566000,0.000000,36.195000>}
box{<0,0,-0.304800><3.937000,0.035000,0.304800> rotate<0,90.000000,0> translate<83.566000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.835000,0.000000,48.437800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.616800,0.000000,48.437800>}
box{<0,0,-0.127000><6.781800,0.035000,0.127000> rotate<0,0.000000,0> translate<76.835000,0.000000,48.437800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.718400,0.000000,16.865600>}
box{<0,0,-0.127000><1.606638,0.035000,0.127000> rotate<0,-50.770975,0> translate<82.702400,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.718400,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.718400,0.000000,16.865600>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,-90.000000,0> translate<83.718400,0.000000,16.865600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,21.158200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.718400,0.000000,19.913600>}
box{<0,0,-0.127000><1.606638,0.035000,0.127000> rotate<0,50.770975,0> translate<82.702400,0.000000,21.158200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.733400,0.000000,51.384200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.743800,0.000000,51.384200>}
box{<0,0,-0.127000><7.010400,0.035000,0.127000> rotate<0,0.000000,0> translate<76.733400,0.000000,51.384200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.915000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.820000,0.000000,8.890000>}
box{<0,0,-0.635000><2.694077,0.035000,0.635000> rotate<0,-44.997030,0> translate<81.915000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.820000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.820000,0.000000,9.652000>}
box{<0,0,-0.635000><0.762000,0.035000,0.635000> rotate<0,90.000000,0> translate<83.820000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.566000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,36.449000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<83.566000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.439000,-1.535000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,-1.535000,62.992000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<83.439000,-1.535000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,-1.535000,62.992000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,-1.535000,69.850000>}
box{<0,0,-0.152400><6.858000,0.035000,0.152400> rotate<0,90.000000,0> translate<83.820000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,0.000000,75.565000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,90.000000,0> translate<83.820000,0.000000,75.565000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.012800,0.000000,50.622200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.896200,0.000000,50.622200>}
box{<0,0,-0.127000><6.883400,0.035000,0.127000> rotate<0,0.000000,0> translate<77.012800,0.000000,50.622200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.038200,0.000000,49.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.921600,0.000000,49.606200>}
box{<0,0,-0.127000><6.883400,0.035000,0.127000> rotate<0,0.000000,0> translate<77.038200,0.000000,49.606200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.455000,0.000000,36.449000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<83.820000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.455000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.455000,0.000000,36.488000>}
box{<0,0,-0.304800><0.039000,0.035000,0.304800> rotate<0,90.000000,0> translate<84.455000,0.000000,36.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.455000,0.000000,38.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.455000,0.000000,40.767000>}
box{<0,0,-0.203200><2.325000,0.035000,0.203200> rotate<0,90.000000,0> translate<84.455000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.042000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.455000,0.000000,43.053000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,0.000000,0> translate<82.042000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.455000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.582000,0.000000,43.053000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<84.455000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.042000,0.000000,77.089000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.582000,0.000000,77.089000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<82.042000,0.000000,77.089000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.820000,0.000000,75.565000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.582000,0.000000,77.089000>}
box{<0,0,-0.152400><1.703884,0.035000,0.152400> rotate<0,-63.430762,0> translate<83.820000,0.000000,75.565000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.804000,-1.535000,60.274200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.683600,-1.535000,60.274200>}
box{<0,0,-0.127000><1.879600,0.035000,0.127000> rotate<0,0.000000,0> translate<82.804000,-1.535000,60.274200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.063600,0.000000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.810600,0.000000,46.532800>}
box{<0,0,-0.127000><7.747000,0.035000,0.127000> rotate<0,0.000000,0> translate<77.063600,0.000000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.962000,0.000000,47.447200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.836000,0.000000,47.447200>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<76.962000,0.000000,47.447200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.063600,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.861400,0.000000,45.720000>}
box{<0,0,-0.127000><7.797800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.063600,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<78.867000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.963000,0.000000,14.097000>}
box{<0,0,-0.635000><6.096000,0.035000,0.635000> rotate<0,0.000000,0> translate<78.867000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.980800,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.064600,-1.535000,53.975000>}
box{<0,0,-0.127000><14.260647,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.980800,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.820000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.090000,0.000000,10.160000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<83.820000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.090000,0.000000,10.160000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,0.000000,0> translate<84.455000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.090000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.090000,0.000000,12.192000>}
box{<0,0,-0.635000><2.032000,0.035000,0.635000> rotate<0,90.000000,0> translate<85.090000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.515200,0.000000,52.171600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.140800,0.000000,53.797200>}
box{<0,0,-0.127000><2.298946,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.515200,0.000000,52.171600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.133200,-1.535000,42.900600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.191600,-1.535000,52.959000>}
box{<0,0,-0.127000><14.224726,0.035000,0.127000> rotate<0,-44.997030,0> translate<75.133200,-1.535000,42.900600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.515200,0.000000,53.162200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.191600,0.000000,54.838600>}
box{<0,0,-0.127000><2.370788,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.515200,0.000000,53.162200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.388200,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.217000,0.000000,55.854600>}
box{<0,0,-0.127000><2.586314,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.388200,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.413600,0.000000,55.067200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.293200,0.000000,56.946800>}
box{<0,0,-0.127000><2.658156,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.413600,0.000000,55.067200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.867000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.394800,0.000000,45.085000>}
box{<0,0,-0.127000><6.527800,0.035000,0.127000> rotate<0,0.000000,0> translate<78.867000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.743800,0.000000,51.384200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.420200,0.000000,53.060600>}
box{<0,0,-0.127000><2.370788,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.743800,0.000000,51.384200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.539600,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,52.095400>}
box{<0,0,-0.127000><14.045121,0.035000,0.127000> rotate<0,-44.997030,0> translate<75.539600,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.121000,-1.535000,72.263000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.471000,-1.535000,72.263000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<79.121000,-1.535000,72.263000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.064600,-1.535000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.521800,-1.535000,53.975000>}
box{<0,0,-0.127000><0.457200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.064600,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.896200,0.000000,50.622200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.547200,0.000000,52.273200>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.896200,0.000000,50.622200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.270600,-1.535000,59.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.547200,-1.535000,59.410600>}
box{<0,0,-0.127000><3.276600,0.035000,0.127000> rotate<0,0.000000,0> translate<82.270600,-1.535000,59.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.616800,0.000000,48.437800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.648800,0.000000,50.469800>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.616800,0.000000,48.437800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.613600,-1.535000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.674200,-1.535000,6.451600>}
box{<0,0,-0.203200><53.060600,0.035000,0.203200> rotate<0,0.000000,0> translate<32.613600,-1.535000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.974200,-1.535000,38.176200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.775800,-1.535000,50.977800>}
box{<0,0,-0.127000><18.104196,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.974200,-1.535000,38.176200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.191600,-1.535000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.775800,-1.535000,52.959000>}
box{<0,0,-0.127000><0.584200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.191600,-1.535000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.921600,0.000000,49.606200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.826600,0.000000,51.511200>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.921600,0.000000,49.606200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.394800,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.877400,0.000000,45.567600>}
box{<0,0,-0.127000><0.682499,0.035000,0.127000> rotate<0,-44.997030,0> translate<85.394800,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.810600,0.000000,46.532800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.902800,0.000000,47.625000>}
box{<0,0,-0.127000><1.544604,0.035000,0.127000> rotate<0,-44.997030,0> translate<84.810600,0.000000,46.532800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.582000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.979000,0.000000,44.450000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<84.582000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.861400,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.029800,0.000000,46.888400>}
box{<0,0,-0.127000><1.652367,0.035000,0.127000> rotate<0,-44.997030,0> translate<84.861400,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,52.095400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.055200,-1.535000,52.095400>}
box{<0,0,-0.127000><0.584200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.471000,-1.535000,52.095400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.836000,0.000000,47.447200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.207600,0.000000,48.818800>}
box{<0,0,-0.127000><1.939735,0.035000,0.127000> rotate<0,-44.997030,0> translate<84.836000,0.000000,47.447200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.360000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.360000,0.000000,6.985000>}
box{<0,0,-0.635000><2.667000,0.035000,0.635000> rotate<0,-90.000000,0> translate<86.360000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.360000,0.000000,9.652000>}
box{<0,0,-0.635000><1.971570,0.035000,0.635000> rotate<0,14.930432,0> translate<84.455000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.654000,0.000000,66.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,69.000000>}
box{<0,0,-0.203200><3.826862,0.035000,0.203200> rotate<0,-44.997030,0> translate<83.654000,0.000000,66.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,69.000000>}
box{<0,0,-0.203200><0.850000,0.035000,0.203200> rotate<0,-90.000000,0> translate<86.360000,0.000000,69.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.471000,-1.535000,72.263000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,71.374000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<85.471000,-1.535000,72.263000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,70.612000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,71.374000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,90.000000,0> translate<86.360000,-1.535000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.933800,-1.535000,73.558400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.690200,-1.535000,73.558400>}
box{<0,0,-0.127000><6.756400,0.035000,0.127000> rotate<0,0.000000,0> translate<79.933800,-1.535000,73.558400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,70.231000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.360000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,-1.535000,70.612000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.741000,-1.535000,70.231000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<86.360000,-1.535000,70.612000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.293200,0.000000,56.946800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.842600,0.000000,56.946800>}
box{<0,0,-0.127000><1.549400,0.035000,0.127000> rotate<0,0.000000,0> translate<85.293200,0.000000,56.946800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.134200,-1.535000,20.421600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,24.155400>}
box{<0,0,-0.203200><5.280391,0.035000,0.203200> rotate<0,-44.997030,0> translate<83.134200,-1.535000,20.421600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,24.155400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,27.203400>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<86.868000,-1.535000,27.203400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.674200,-1.535000,6.451600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.995000,-1.535000,7.772400>}
box{<0,0,-0.203200><1.867893,0.035000,0.203200> rotate<0,-44.997030,0> translate<85.674200,-1.535000,6.451600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.360000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.995000,0.000000,70.485000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.360000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.995000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.122000,0.000000,77.089000>}
box{<0,0,-0.203200><6.605221,0.035000,0.203200> rotate<0,-88.892427,0> translate<86.995000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.020400,0.000000,76.225400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.122000,0.000000,77.089000>}
box{<0,0,-0.203200><0.869556,0.035000,0.203200> rotate<0,-83.284666,0> translate<87.020400,0.000000,76.225400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.915000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,23.495000>}
box{<0,0,-0.635000><5.334000,0.035000,0.635000> rotate<0,0.000000,0> translate<81.915000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,23.534000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,23.495000>}
box{<0,0,-0.635000><0.039000,0.035000,0.635000> rotate<0,-90.000000,0> translate<87.249000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,25.488000>}
box{<0,0,-0.635000><0.039000,0.035000,0.635000> rotate<0,-90.000000,0> translate<87.249000,0.000000,25.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.791800,0.000000,75.971400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.579200,0.000000,76.174600>}
box{<0,0,-0.203200><0.813197,0.035000,0.203200> rotate<0,-14.469339,0> translate<86.791800,0.000000,75.971400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.020400,0.000000,76.225400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.579200,0.000000,76.174600>}
box{<0,0,-0.203200><0.561104,0.035000,0.203200> rotate<0,5.194086,0> translate<87.020400,0.000000,76.225400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,23.534000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.630000,0.000000,22.987000>}
box{<0,0,-0.635000><0.666611,0.035000,0.635000> rotate<0,55.138127,0> translate<87.249000,0.000000,23.534000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.791800,0.000000,75.971400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.807800,0.000000,75.463400>}
box{<0,0,-0.203200><1.135923,0.035000,0.203200> rotate<0,26.563298,0> translate<86.791800,0.000000,75.971400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.630000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.884000,0.000000,12.700000>}
box{<0,0,-0.635000><0.567961,0.035000,0.635000> rotate<0,-63.430762,0> translate<87.630000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.963000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.884000,0.000000,14.351000>}
box{<0,0,-0.635000><2.932023,0.035000,0.635000> rotate<0,-4.969413,0> translate<84.963000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.884000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.884000,0.000000,14.351000>}
box{<0,0,-0.635000><1.651000,0.035000,0.635000> rotate<0,90.000000,0> translate<87.884000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.011000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.011000,0.000000,25.527000>}
box{<0,0,-0.635000><1.524000,0.035000,0.635000> rotate<0,-90.000000,0> translate<88.011000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.695800,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.112600,-1.535000,15.748000>}
box{<0,0,-0.127000><7.416800,0.035000,0.127000> rotate<0,0.000000,0> translate<80.695800,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.360000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.265000,0.000000,6.908800>}
box{<0,0,-0.635000><1.906523,0.035000,0.635000> rotate<0,2.290459,0> translate<86.360000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.690200,-1.535000,73.558400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.315800,-1.535000,71.932800>}
box{<0,0,-0.127000><2.298946,0.035000,0.127000> rotate<0,44.997030,0> translate<86.690200,-1.535000,73.558400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.630000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.392000,0.000000,22.225000>}
box{<0,0,-0.635000><1.077631,0.035000,0.635000> rotate<0,44.997030,0> translate<87.630000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.011000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.519000,0.000000,27.559000>}
box{<0,0,-0.635000><0.718420,0.035000,0.635000> rotate<0,-44.997030,0> translate<88.011000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.519000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.519000,0.000000,27.559000>}
box{<0,0,-0.635000><1.651000,0.035000,0.635000> rotate<0,-90.000000,0> translate<88.519000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.494000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.519000,0.000000,29.210000>}
box{<0,0,-0.635000><0.025000,0.035000,0.635000> rotate<0,0.000000,0> translate<88.494000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.494000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.519000,0.000000,29.718000>}
box{<0,0,-0.304800><0.508615,0.035000,0.304800> rotate<0,-87.176845,0> translate<88.494000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.519000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.519000,0.000000,29.718000>}
box{<0,0,-0.304800><1.143000,0.035000,0.304800> rotate<0,-90.000000,0> translate<88.519000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.071000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.790100,-1.535000,14.732000>}
box{<0,0,-0.152400><28.719100,0.035000,0.152400> rotate<0,0.000000,0> translate<60.071000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.747600,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.837400,0.000000,36.677600>}
box{<0,0,-0.304800><0.245605,0.035000,0.304800> rotate<0,-68.549290,0> translate<88.747600,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.995000,-1.535000,7.772400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.900000,-1.535000,9.652000>}
box{<0,0,-0.203200><2.676177,0.035000,0.203200> rotate<0,-44.612526,0> translate<86.995000,-1.535000,7.772400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.249000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.900000,0.000000,25.527000>}
box{<0,0,-0.635000><1.651000,0.035000,0.635000> rotate<0,0.000000,0> translate<87.249000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.011000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.900000,0.000000,25.527000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,0.000000,0> translate<88.011000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.837400,0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.900000,0.000000,38.379400>}
box{<0,0,-0.152400><1.702951,0.035000,0.152400> rotate<0,-87.887548,0> translate<88.837400,0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.519000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.950800,0.000000,32.435800>}
box{<0,0,-0.304800><1.632926,0.035000,0.304800> rotate<0,-74.661787,0> translate<88.519000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.950800,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.950800,0.000000,32.435800>}
box{<0,0,-0.304800><2.921000,0.035000,0.304800> rotate<0,-90.000000,0> translate<88.950800,0.000000,32.435800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.747600,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.950800,0.000000,35.356800>}
box{<0,0,-0.304800><1.110942,0.035000,0.304800> rotate<0,79.455572,0> translate<88.747600,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.900000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.281000,0.000000,25.146000>}
box{<0,0,-0.635000><0.538815,0.035000,0.635000> rotate<0,44.997030,0> translate<88.900000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.112600,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.382600,-1.535000,17.018000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<88.112600,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.382600,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.382600,-1.535000,27.838400>}
box{<0,0,-0.127000><10.820400,0.035000,0.127000> rotate<0,90.000000,0> translate<89.382600,-1.535000,27.838400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.807800,0.000000,75.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.382600,0.000000,73.914000>}
box{<0,0,-0.203200><2.209216,0.035000,0.203200> rotate<0,44.531252,0> translate<87.807800,0.000000,75.463400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.392000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.408000,0.000000,22.225000>}
box{<0,0,-0.635000><1.016000,0.035000,0.635000> rotate<0,0.000000,0> translate<88.392000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<88.900000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<89.535000,0.000000,10.287000>}
box{<0,0,-0.711200><0.898026,0.035000,0.711200> rotate<0,-44.997030,0> translate<88.900000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.900000,0.000000,38.379400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<89.535000,0.000000,38.887400>}
box{<0,0,-0.152400><0.813197,0.035000,0.152400> rotate<0,-38.657257,0> translate<88.900000,0.000000,38.379400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,27.203400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.712800,-1.535000,30.048200>}
box{<0,0,-0.203200><4.023155,0.035000,0.203200> rotate<0,-44.997030,0> translate<86.868000,-1.535000,27.203400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.712800,-1.535000,30.048200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.712800,-1.535000,36.703000>}
box{<0,0,-0.203200><6.654800,0.035000,0.203200> rotate<0,90.000000,0> translate<89.712800,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.775800,-1.535000,50.977800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.093800,-1.535000,50.977800>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.775800,-1.535000,50.977800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.207600,-1.535000,48.818800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.144600,-1.535000,48.818800>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<86.207600,-1.535000,48.818800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<87.630000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<90.170000,0.000000,12.192000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<87.630000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.535000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<90.170000,0.000000,12.192000>}
box{<0,0,-0.635000><2.008046,0.035000,0.635000> rotate<0,-71.560328,0> translate<89.535000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.648800,0.000000,50.469800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.246200,0.000000,50.469800>}
box{<0,0,-0.127000><4.597400,0.035000,0.127000> rotate<0,0.000000,0> translate<85.648800,0.000000,50.469800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.683600,-1.535000,60.274200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.297000,-1.535000,65.887600>}
box{<0,0,-0.127000><7.938546,0.035000,0.127000> rotate<0,-44.997030,0> translate<84.683600,-1.535000,60.274200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.217000,0.000000,55.854600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.601800,0.000000,55.854600>}
box{<0,0,-0.127000><5.384800,0.035000,0.127000> rotate<0,0.000000,0> translate<85.217000,0.000000,55.854600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.842600,0.000000,56.946800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.627200,0.000000,60.731400>}
box{<0,0,-0.127000><5.352233,0.035000,0.127000> rotate<0,-44.997030,0> translate<86.842600,0.000000,56.946800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.627200,0.000000,60.731400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.627200,0.000000,62.763400>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<90.627200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.790100,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.678000,-1.535000,16.619900>}
box{<0,0,-0.152400><2.669894,0.035000,0.152400> rotate<0,-44.997030,0> translate<88.790100,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.678000,-1.535000,16.619900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.678000,-1.535000,27.432000>}
box{<0,0,-0.152400><10.812100,0.035000,0.152400> rotate<0,90.000000,0> translate<90.678000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.547200,-1.535000,59.410600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.805000,-1.535000,64.668400>}
box{<0,0,-0.127000><7.435652,0.035000,0.127000> rotate<0,-44.997030,0> translate<85.547200,-1.535000,59.410600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.191600,0.000000,54.838600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.906600,0.000000,54.838600>}
box{<0,0,-0.127000><5.715000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.191600,0.000000,54.838600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.979000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.059000,0.000000,44.450000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<85.979000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<89.535000,0.000000,38.887400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.059000,0.000000,44.450000>}
box{<0,0,-0.152400><5.767590,0.035000,0.152400> rotate<0,-74.673561,0> translate<89.535000,0.000000,38.887400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.140800,0.000000,53.797200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.059000,0.000000,53.797200>}
box{<0,0,-0.127000><5.918200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.140800,0.000000,53.797200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.791400,0.000000,36.677600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.109000,0.000000,36.360000>}
box{<0,0,-0.127000><0.449154,0.035000,0.127000> rotate<0,44.997030,0> translate<90.791400,0.000000,36.677600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.627200,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.186000,0.000000,63.322200>}
box{<0,0,-0.127000><0.790263,0.035000,0.127000> rotate<0,-44.997030,0> translate<90.627200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.826600,0.000000,51.511200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.211400,0.000000,51.511200>}
box{<0,0,-0.127000><5.384800,0.035000,0.127000> rotate<0,0.000000,0> translate<85.826600,0.000000,51.511200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.246200,0.000000,50.469800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.313000,0.000000,49.403000>}
box{<0,0,-0.127000><1.508683,0.035000,0.127000> rotate<0,44.997030,0> translate<90.246200,0.000000,50.469800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<88.265000,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<91.440000,0.000000,6.908800>}
box{<0,0,-0.635000><3.175000,0.035000,0.635000> rotate<0,0.000000,0> translate<88.265000,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.315800,-1.535000,71.932800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.668600,-1.535000,71.932800>}
box{<0,0,-0.127000><3.352800,0.035000,0.127000> rotate<0,0.000000,0> translate<88.315800,-1.535000,71.932800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.059000,0.000000,53.797200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.694000,0.000000,54.432200>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<91.059000,0.000000,53.797200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.906600,0.000000,54.838600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.795600,0.000000,55.727600>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<90.906600,0.000000,54.838600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.601800,0.000000,55.854600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.846400,0.000000,57.099200>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,-44.997030,0> translate<90.601800,0.000000,55.854600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.902800,0.000000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.922600,0.000000,47.625000>}
box{<0,0,-0.127000><6.019800,0.035000,0.127000> rotate<0,0.000000,0> translate<85.902800,0.000000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.211400,0.000000,51.511200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.075000,0.000000,50.749200>}
box{<0,0,-0.127000><1.151716,0.035000,0.127000> rotate<0,41.420932,0> translate<91.211400,0.000000,51.511200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.144600,-1.535000,48.818800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.100400,-1.535000,50.774600>}
box{<0,0,-0.127000><2.765919,0.035000,0.127000> rotate<0,-44.997030,0> translate<90.144600,-1.535000,48.818800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.382600,-1.535000,27.838400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.176600,-1.535000,30.632400>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<89.382600,-1.535000,27.838400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.176600,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.176600,-1.535000,34.696400>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,90.000000,0> translate<92.176600,-1.535000,34.696400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.281000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.202000,0.000000,25.146000>}
box{<0,0,-0.635000><2.921000,0.035000,0.635000> rotate<0,0.000000,0> translate<89.281000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.093800,-1.535000,50.977800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.303600,-1.535000,53.187600>}
box{<0,0,-0.127000><3.125129,0.035000,0.127000> rotate<0,-44.997030,0> translate<90.093800,-1.535000,50.977800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.055200,-1.535000,52.095400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.329000,-1.535000,58.369200>}
box{<0,0,-0.127000><8.872493,0.035000,0.127000> rotate<0,-44.997030,0> translate<86.055200,-1.535000,52.095400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.420200,0.000000,53.060600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.354400,0.000000,53.060600>}
box{<0,0,-0.127000><6.934200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.420200,0.000000,53.060600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.775800,-1.535000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.405200,-1.535000,59.588400>}
box{<0,0,-0.127000><9.375387,0.035000,0.127000> rotate<0,-44.997030,0> translate<85.775800,-1.535000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.521800,-1.535000,53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.405200,-1.535000,60.858400>}
box{<0,0,-0.127000><9.734598,0.035000,0.127000> rotate<0,-44.997030,0> translate<85.521800,-1.535000,53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.922600,0.000000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.430600,0.000000,48.133000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<91.922600,0.000000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.354400,0.000000,53.060600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.481400,0.000000,53.187600>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<92.354400,0.000000,53.060600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.202000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.583000,0.000000,24.638000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,53.126596,0> translate<92.202000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.710000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.710000,0.000000,23.749000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,-90.000000,0> translate<92.710000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.583000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.710000,0.000000,24.638000>}
box{<0,0,-0.635000><0.127000,0.035000,0.635000> rotate<0,0.000000,0> translate<92.583000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.547200,0.000000,52.273200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.989400,0.000000,52.273200>}
box{<0,0,-0.127000><7.442200,0.035000,0.127000> rotate<0,0.000000,0> translate<85.547200,0.000000,52.273200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.176600,-1.535000,34.696400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.141800,-1.535000,35.661600>}
box{<0,0,-0.127000><1.364999,0.035000,0.127000> rotate<0,-44.997030,0> translate<92.176600,-1.535000,34.696400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.694000,0.000000,54.432200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.218000,0.000000,54.432200>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<91.694000,0.000000,54.432200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.846400,0.000000,57.099200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.243400,0.000000,57.099200>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<91.846400,0.000000,57.099200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.313000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.268800,0.000000,49.403000>}
box{<0,0,-0.127000><1.955800,0.035000,0.127000> rotate<0,0.000000,0> translate<91.313000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.059000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<93.294200,0.000000,44.348400>}
box{<0,0,-0.152400><2.237508,0.035000,0.152400> rotate<0,2.602390,0> translate<91.059000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.029800,0.000000,46.888400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,0.000000,46.888400>}
box{<0,0,-0.127000><7.264400,0.035000,0.127000> rotate<0,0.000000,0> translate<86.029800,0.000000,46.888400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.268800,0.000000,49.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,0.000000,49.428400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<93.268800,0.000000,49.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.989400,0.000000,52.273200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,0.000000,51.968400>}
box{<0,0,-0.127000><0.431052,0.035000,0.127000> rotate<0,44.997030,0> translate<92.989400,0.000000,52.273200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.218000,0.000000,54.432200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,0.000000,54.508400>}
box{<0,0,-0.127000><0.107763,0.035000,0.127000> rotate<0,-44.997030,0> translate<93.218000,0.000000,54.432200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.243400,0.000000,57.099200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,0.000000,57.048400>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,44.997030,0> translate<93.243400,0.000000,57.099200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.405200,-1.535000,59.588400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,-1.535000,59.588400>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,0.000000,0> translate<92.405200,-1.535000,59.588400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.805000,-1.535000,64.668400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,-1.535000,64.668400>}
box{<0,0,-0.127000><2.489200,0.035000,0.127000> rotate<0,0.000000,0> translate<90.805000,-1.535000,64.668400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.382600,0.000000,73.914000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.700600,0.000000,73.914000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<89.382600,0.000000,73.914000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.668600,0.000000,71.932800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.827600,0.000000,71.958200>}
box{<0,0,-0.127000><2.159149,0.035000,0.127000> rotate<0,-0.673992,0> translate<91.668600,0.000000,71.932800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.075000,0.000000,50.749200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.411800,0.000000,50.749200>}
box{<0,0,-0.127000><2.336800,0.035000,0.127000> rotate<0,0.000000,0> translate<92.075000,0.000000,50.749200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.297000,-1.535000,65.887600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.437200,-1.535000,65.887600>}
box{<0,0,-0.127000><4.140200,0.035000,0.127000> rotate<0,0.000000,0> translate<90.297000,-1.535000,65.887600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.100400,-1.535000,50.774600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.488000,-1.535000,50.774600>}
box{<0,0,-0.127000><2.387600,0.035000,0.127000> rotate<0,0.000000,0> translate<92.100400,-1.535000,50.774600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.186000,0.000000,63.322200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.488000,0.000000,63.322200>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<91.186000,0.000000,63.322200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.877400,0.000000,45.567600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,45.567600>}
box{<0,0,-0.127000><8.636000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.877400,0.000000,45.567600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.481400,0.000000,53.187600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,53.187600>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<92.481400,0.000000,53.187600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.795600,0.000000,55.727600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,55.727600>}
box{<0,0,-0.127000><2.717800,0.035000,0.127000> rotate<0,0.000000,0> translate<91.795600,0.000000,55.727600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.294200,-1.535000,62.128400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.538800,-1.535000,63.373000>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,-44.997030,0> translate<93.294200,-1.535000,62.128400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.405200,-1.535000,60.858400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.564200,-1.535000,60.858400>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<92.405200,-1.535000,60.858400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.329000,-1.535000,58.369200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.615000,-1.535000,58.369200>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<92.329000,-1.535000,58.369200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.141800,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.876600,-1.535000,35.661600>}
box{<0,0,-0.127000><1.734800,0.035000,0.127000> rotate<0,0.000000,0> translate<93.141800,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.700600,0.000000,73.914000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.970600,0.000000,72.618600>}
box{<0,0,-0.203200><1.814101,0.035000,0.203200> rotate<0,45.564259,0> translate<93.700600,0.000000,73.914000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.678000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,32.258000>}
box{<0,0,-0.152400><6.824995,0.035000,0.152400> rotate<0,-44.997030,0> translate<90.678000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.504000,0.000000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.554800,0.000000,44.348400>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,-44.997030,0> translate<95.504000,0.000000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.575000,-1.535000,32.370000>}
box{<0,0,-0.152400><0.132608,0.035000,0.152400> rotate<0,-57.624419,0> translate<95.504000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<91.109000,0.000000,36.360000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.575000,0.000000,36.360000>}
box{<0,0,-0.127000><4.466000,0.035000,0.127000> rotate<0,0.000000,0> translate<91.109000,0.000000,36.360000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.876600,-1.535000,35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.575000,-1.535000,36.360000>}
box{<0,0,-0.127000><0.987687,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.876600,-1.535000,35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.437200,-1.535000,65.887600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.758000,-1.535000,67.208400>}
box{<0,0,-0.127000><1.867893,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.437200,-1.535000,65.887600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.712800,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.834200,-1.535000,42.824400>}
box{<0,0,-0.203200><8.656967,0.035000,0.203200> rotate<0,-44.997030,0> translate<89.712800,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.554800,0.000000,44.348400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,44.348400>}
box{<0,0,-0.127000><0.279400,0.035000,0.127000> rotate<0,0.000000,0> translate<95.554800,0.000000,44.348400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.834200,-1.535000,42.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.834200,-1.535000,44.348400>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<95.834200,-1.535000,44.348400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,45.567600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,46.888400>}
box{<0,0,-0.127000><1.867893,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.513400,0.000000,45.567600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.488000,-1.535000,50.774600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,-1.535000,49.428400>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,44.997030,0> translate<94.488000,-1.535000,50.774600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.411800,0.000000,50.749200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,51.968400>}
box{<0,0,-0.127000><1.873411,0.035000,0.127000> rotate<0,-40.598615,0> translate<94.411800,0.000000,50.749200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,53.187600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,54.508400>}
box{<0,0,-0.127000><1.867893,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.513400,0.000000,53.187600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.513400,0.000000,55.727600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,57.048400>}
box{<0,0,-0.127000><1.867893,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.513400,0.000000,55.727600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.615000,-1.535000,58.369200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,-1.535000,59.588400>}
box{<0,0,-0.127000><1.724209,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.615000,-1.535000,58.369200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.564200,-1.535000,60.858400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,-1.535000,62.128400>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.564200,-1.535000,60.858400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.488000,0.000000,63.322200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,0.000000,64.668400>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,-44.997030,0> translate<94.488000,0.000000,63.322200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.758000,-1.535000,67.208400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.834200,-1.535000,67.208400>}
box{<0,0,-0.127000><0.076200,0.035000,0.127000> rotate<0,0.000000,0> translate<95.758000,-1.535000,67.208400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.408000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.012000,0.000000,15.621000>}
box{<0,0,-0.635000><9.339466,0.035000,0.635000> rotate<0,44.997030,0> translate<89.408000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.710000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.139000,0.000000,20.320000>}
box{<0,0,-0.635000><4.849338,0.035000,0.635000> rotate<0,44.997030,0> translate<92.710000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<91.440000,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.520000,0.000000,11.430000>}
box{<0,0,-0.635000><6.800562,0.035000,0.635000> rotate<0,-41.666333,0> translate<91.440000,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.012000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.520000,0.000000,15.240000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,36.867464,0> translate<96.012000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.520000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.520000,0.000000,15.240000>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,90.000000,0> translate<96.520000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.139000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<96.520000,0.000000,20.320000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,0.000000,0> translate<96.139000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<94.538800,-1.535000,63.373000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<96.824800,-1.535000,63.373000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<94.538800,-1.535000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.303600,-1.535000,53.187600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<96.951800,-1.535000,53.187600>}
box{<0,0,-0.127000><4.648200,0.035000,0.127000> rotate<0,0.000000,0> translate<92.303600,-1.535000,53.187600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<96.951800,-1.535000,53.187600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.561400,-1.535000,53.797200>}
box{<0,0,-0.127000><0.862105,0.035000,0.127000> rotate<0,-44.997030,0> translate<96.951800,-1.535000,53.187600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<96.824800,-1.535000,63.373000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.561400,-1.535000,62.636400>}
box{<0,0,-0.127000><1.041710,0.035000,0.127000> rotate<0,44.997030,0> translate<96.824800,-1.535000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.561400,-1.535000,53.797200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.561400,-1.535000,62.636400>}
box{<0,0,-0.127000><8.839200,0.035000,0.127000> rotate<0,90.000000,0> translate<97.561400,-1.535000,62.636400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.430600,0.000000,48.133000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.577400,0.000000,48.133000>}
box{<0,0,-0.127000><6.146800,0.035000,0.127000> rotate<0,0.000000,0> translate<92.430600,0.000000,48.133000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<93.827600,0.000000,71.958200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.009200,0.000000,71.958200>}
box{<0,0,-0.127000><5.181600,0.035000,0.127000> rotate<0,0.000000,0> translate<93.827600,0.000000,71.958200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.577400,0.000000,48.133000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.415600,0.000000,48.971200>}
box{<0,0,-0.127000><1.185394,0.035000,0.127000> rotate<0,-44.997030,0> translate<98.577400,0.000000,48.133000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.009200,0.000000,71.958200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.415600,0.000000,71.551800>}
box{<0,0,-0.127000><0.574736,0.035000,0.127000> rotate<0,44.997030,0> translate<99.009200,0.000000,71.958200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.415600,0.000000,48.971200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.415600,0.000000,71.551800>}
box{<0,0,-0.127000><22.580600,0.035000,0.127000> rotate<0,90.000000,0> translate<99.415600,0.000000,71.551800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<95.504000,0.000000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<99.441000,0.000000,44.297600>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<95.504000,0.000000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.970600,0.000000,72.618600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<99.593400,0.000000,72.618600>}
box{<0,0,-0.203200><4.622800,0.035000,0.203200> rotate<0,0.000000,0> translate<94.970600,0.000000,72.618600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<99.441000,0.000000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<100.152200,0.000000,45.008800>}
box{<0,0,-0.203200><1.005789,0.035000,0.203200> rotate<0,-44.997030,0> translate<99.441000,0.000000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<99.593400,0.000000,72.618600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<100.152200,0.000000,72.059800>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,44.997030,0> translate<99.593400,0.000000,72.618600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<100.152200,0.000000,45.008800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<100.152200,0.000000,72.059800>}
box{<0,0,-0.203200><27.051000,0.035000,0.203200> rotate<0,90.000000,0> translate<100.152200,0.000000,72.059800> }
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
cylinder{<86.360000,0.038000,69.850000><86.360000,-1.538000,69.850000>0.508000}
cylinder{<83.820000,0.038000,69.850000><83.820000,-1.538000,69.850000>0.508000}
cylinder{<81.280000,0.038000,69.850000><81.280000,-1.538000,69.850000>0.508000}
cylinder{<78.740000,0.038000,69.850000><78.740000,-1.538000,69.850000>0.508000}
cylinder{<43.535600,0.038000,36.677600><43.535600,-1.538000,36.677600>0.508000}
cylinder{<43.535600,0.038000,34.137600><43.535600,-1.538000,34.137600>0.508000}
cylinder{<40.995600,0.038000,36.677600><40.995600,-1.538000,36.677600>0.508000}
cylinder{<40.995600,0.038000,34.137600><40.995600,-1.538000,34.137600>0.508000}
cylinder{<38.455600,0.038000,36.677600><38.455600,-1.538000,36.677600>0.508000}
cylinder{<38.455600,0.038000,34.137600><38.455600,-1.538000,34.137600>0.508000}
cylinder{<95.834200,0.038000,44.348400><95.834200,-1.538000,44.348400>0.457200}
cylinder{<93.294200,0.038000,44.348400><93.294200,-1.538000,44.348400>0.457200}
cylinder{<95.834200,0.038000,46.888400><95.834200,-1.538000,46.888400>0.457200}
cylinder{<93.294200,0.038000,46.888400><93.294200,-1.538000,46.888400>0.457200}
cylinder{<95.834200,0.038000,49.428400><95.834200,-1.538000,49.428400>0.457200}
cylinder{<93.294200,0.038000,49.428400><93.294200,-1.538000,49.428400>0.457200}
cylinder{<95.834200,0.038000,51.968400><95.834200,-1.538000,51.968400>0.457200}
cylinder{<93.294200,0.038000,51.968400><93.294200,-1.538000,51.968400>0.457200}
cylinder{<95.834200,0.038000,54.508400><95.834200,-1.538000,54.508400>0.457200}
cylinder{<93.294200,0.038000,54.508400><93.294200,-1.538000,54.508400>0.457200}
cylinder{<95.834200,0.038000,57.048400><95.834200,-1.538000,57.048400>0.457200}
cylinder{<93.294200,0.038000,57.048400><93.294200,-1.538000,57.048400>0.457200}
cylinder{<95.834200,0.038000,59.588400><95.834200,-1.538000,59.588400>0.457200}
cylinder{<93.294200,0.038000,59.588400><93.294200,-1.538000,59.588400>0.457200}
cylinder{<95.834200,0.038000,62.128400><95.834200,-1.538000,62.128400>0.457200}
cylinder{<93.294200,0.038000,62.128400><93.294200,-1.538000,62.128400>0.457200}
cylinder{<95.834200,0.038000,64.668400><95.834200,-1.538000,64.668400>0.457200}
cylinder{<93.294200,0.038000,64.668400><93.294200,-1.538000,64.668400>0.457200}
cylinder{<95.834200,0.038000,67.208400><95.834200,-1.538000,67.208400>0.457200}
cylinder{<93.294200,0.038000,67.208400><93.294200,-1.538000,67.208400>0.457200}
cylinder{<49.530000,0.038000,9.652000><49.530000,-1.538000,9.652000>0.444500}
cylinder{<50.800000,0.038000,12.192000><50.800000,-1.538000,12.192000>0.444500}
cylinder{<52.070000,0.038000,9.652000><52.070000,-1.538000,9.652000>0.444500}
cylinder{<53.340000,0.038000,12.192000><53.340000,-1.538000,12.192000>0.444500}
cylinder{<54.610000,0.038000,9.652000><54.610000,-1.538000,9.652000>0.444500}
cylinder{<55.880000,0.038000,12.192000><55.880000,-1.538000,12.192000>0.444500}
cylinder{<57.150000,0.038000,9.652000><57.150000,-1.538000,9.652000>0.444500}
cylinder{<58.420000,0.038000,12.192000><58.420000,-1.538000,12.192000>0.444500}
cylinder{<33.655000,0.038000,9.652000><33.655000,-1.538000,9.652000>0.444500}
cylinder{<34.925000,0.038000,12.192000><34.925000,-1.538000,12.192000>0.444500}
cylinder{<36.195000,0.038000,9.652000><36.195000,-1.538000,9.652000>0.444500}
cylinder{<37.465000,0.038000,12.192000><37.465000,-1.538000,12.192000>0.444500}
cylinder{<38.735000,0.038000,9.652000><38.735000,-1.538000,9.652000>0.444500}
cylinder{<40.005000,0.038000,12.192000><40.005000,-1.538000,12.192000>0.444500}
cylinder{<41.275000,0.038000,9.652000><41.275000,-1.538000,9.652000>0.444500}
cylinder{<42.545000,0.038000,12.192000><42.545000,-1.538000,12.192000>0.444500}
cylinder{<65.405000,0.038000,9.652000><65.405000,-1.538000,9.652000>0.444500}
cylinder{<66.675000,0.038000,12.192000><66.675000,-1.538000,12.192000>0.444500}
cylinder{<67.945000,0.038000,9.652000><67.945000,-1.538000,9.652000>0.444500}
cylinder{<69.215000,0.038000,12.192000><69.215000,-1.538000,12.192000>0.444500}
cylinder{<70.485000,0.038000,9.652000><70.485000,-1.538000,9.652000>0.444500}
cylinder{<71.755000,0.038000,12.192000><71.755000,-1.538000,12.192000>0.444500}
cylinder{<73.025000,0.038000,9.652000><73.025000,-1.538000,9.652000>0.444500}
cylinder{<74.295000,0.038000,12.192000><74.295000,-1.538000,12.192000>0.444500}
cylinder{<81.280000,0.038000,9.652000><81.280000,-1.538000,9.652000>0.444500}
cylinder{<82.550000,0.038000,12.192000><82.550000,-1.538000,12.192000>0.444500}
cylinder{<83.820000,0.038000,9.652000><83.820000,-1.538000,9.652000>0.444500}
cylinder{<85.090000,0.038000,12.192000><85.090000,-1.538000,12.192000>0.444500}
cylinder{<86.360000,0.038000,9.652000><86.360000,-1.538000,9.652000>0.444500}
cylinder{<87.630000,0.038000,12.192000><87.630000,-1.538000,12.192000>0.444500}
cylinder{<88.900000,0.038000,9.652000><88.900000,-1.538000,9.652000>0.444500}
cylinder{<90.170000,0.038000,12.192000><90.170000,-1.538000,12.192000>0.444500}
cylinder{<26.416000,0.038000,5.461000><26.416000,-1.538000,5.461000>0.508000}
cylinder{<26.416000,0.038000,2.921000><26.416000,-1.538000,2.921000>0.508000}
cylinder{<67.310000,0.038000,65.405000><67.310000,-1.538000,65.405000>0.406400}
cylinder{<72.136000,0.038000,65.405000><72.136000,-1.538000,65.405000>0.406400}
cylinder{<76.885800,0.038000,62.585600><76.885800,-1.538000,62.585600>0.508000}
cylinder{<83.388200,0.038000,62.585600><83.388200,-1.538000,62.585600>0.508000}
cylinder{<76.885800,0.038000,58.064400><76.885800,-1.538000,58.064400>0.508000}
cylinder{<83.388200,0.038000,58.064400><83.388200,-1.538000,58.064400>0.508000}
cylinder{<33.528000,0.038000,41.084500><33.528000,-1.538000,41.084500>0.508000}
cylinder{<25.908000,0.038000,41.084500><25.908000,-1.538000,41.084500>0.508000}
cylinder{<95.565000,0.038000,28.380000><95.565000,-1.538000,28.380000>0.750000}
cylinder{<95.575000,0.038000,36.360000><95.575000,-1.538000,36.360000>0.750000}
cylinder{<95.575000,0.038000,32.370000><95.575000,-1.538000,32.370000>0.750000}
cylinder{<66.040000,0.038000,76.835000><66.040000,-1.538000,76.835000>0.457200}
cylinder{<66.040000,0.038000,74.295000><66.040000,-1.538000,74.295000>0.457200}
cylinder{<63.500000,0.038000,76.835000><63.500000,-1.538000,76.835000>0.457200}
cylinder{<63.500000,0.038000,74.295000><63.500000,-1.538000,74.295000>0.457200}
cylinder{<60.960000,0.038000,76.835000><60.960000,-1.538000,76.835000>0.457200}
cylinder{<60.960000,0.038000,74.295000><60.960000,-1.538000,74.295000>0.457200}
cylinder{<58.420000,0.038000,76.835000><58.420000,-1.538000,76.835000>0.457200}
cylinder{<58.420000,0.038000,74.295000><58.420000,-1.538000,74.295000>0.457200}
cylinder{<55.880000,0.038000,76.835000><55.880000,-1.538000,76.835000>0.457200}
cylinder{<55.880000,0.038000,74.295000><55.880000,-1.538000,74.295000>0.457200}
cylinder{<43.965000,0.038000,23.705000><43.965000,-1.538000,23.705000>0.700000}
cylinder{<48.165000,0.038000,23.705000><48.165000,-1.538000,23.705000>0.700000}
cylinder{<52.365000,0.038000,23.705000><52.365000,-1.538000,23.705000>0.700000}
cylinder{<56.565000,0.038000,23.705000><56.565000,-1.538000,23.705000>0.700000}
cylinder{<60.765000,0.038000,23.705000><60.765000,-1.538000,23.705000>0.700000}
cylinder{<64.965000,0.038000,23.705000><64.965000,-1.538000,23.705000>0.700000}
cylinder{<69.165000,0.038000,23.705000><69.165000,-1.538000,23.705000>0.700000}
cylinder{<73.365000,0.038000,23.705000><73.365000,-1.538000,23.705000>0.700000}
cylinder{<77.565000,0.038000,23.705000><77.565000,-1.538000,23.705000>0.700000}
cylinder{<81.765000,0.038000,23.705000><81.765000,-1.538000,23.705000>0.700000}
cylinder{<43.965000,0.038000,18.205000><43.965000,-1.538000,18.205000>0.700000}
cylinder{<48.165000,0.038000,18.205000><48.165000,-1.538000,18.205000>0.700000}
cylinder{<52.365000,0.038000,18.205000><52.365000,-1.538000,18.205000>0.700000}
cylinder{<56.565000,0.038000,18.205000><56.565000,-1.538000,18.205000>0.700000}
cylinder{<60.765000,0.038000,18.205000><60.765000,-1.538000,18.205000>0.700000}
cylinder{<64.965000,0.038000,18.205000><64.965000,-1.538000,18.205000>0.700000}
cylinder{<69.165000,0.038000,18.205000><69.165000,-1.538000,18.205000>0.700000}
cylinder{<73.365000,0.038000,18.205000><73.365000,-1.538000,18.205000>0.700000}
cylinder{<77.565000,0.038000,18.205000><77.565000,-1.538000,18.205000>0.700000}
cylinder{<81.765000,0.038000,18.205000><81.765000,-1.538000,18.205000>0.700000}
cylinder{<87.122000,0.038000,77.089000><87.122000,-1.538000,77.089000>0.508000}
cylinder{<84.582000,0.038000,77.089000><84.582000,-1.538000,77.089000>0.508000}
cylinder{<82.042000,0.038000,77.089000><82.042000,-1.538000,77.089000>0.508000}
cylinder{<79.502000,0.038000,77.089000><79.502000,-1.538000,77.089000>0.508000}
cylinder{<7.885000,0.038000,62.885000><7.885000,-1.538000,62.885000>0.475000}
cylinder{<7.885000,0.038000,65.385000><7.885000,-1.538000,65.385000>0.475000}
cylinder{<5.885000,0.038000,65.385000><5.885000,-1.538000,65.385000>0.475000}
cylinder{<5.885000,0.038000,62.885000><5.885000,-1.538000,62.885000>0.475000}
cylinder{<96.520000,0.038000,15.240000><96.520000,-1.538000,15.240000>0.698500}
cylinder{<96.520000,0.038000,20.320000><96.520000,-1.538000,20.320000>0.698500}
cylinder{<45.085000,0.038000,76.835000><45.085000,-1.538000,76.835000>0.457200}
cylinder{<45.085000,0.038000,74.295000><45.085000,-1.538000,74.295000>0.457200}
cylinder{<42.545000,0.038000,76.835000><42.545000,-1.538000,76.835000>0.457200}
cylinder{<42.545000,0.038000,74.295000><42.545000,-1.538000,74.295000>0.457200}
cylinder{<40.005000,0.038000,76.835000><40.005000,-1.538000,76.835000>0.457200}
cylinder{<40.005000,0.038000,74.295000><40.005000,-1.538000,74.295000>0.457200}
cylinder{<37.465000,0.038000,76.835000><37.465000,-1.538000,76.835000>0.457200}
cylinder{<37.465000,0.038000,74.295000><37.465000,-1.538000,74.295000>0.457200}
cylinder{<34.925000,0.038000,76.835000><34.925000,-1.538000,76.835000>0.457200}
cylinder{<34.925000,0.038000,74.295000><34.925000,-1.538000,74.295000>0.457200}
cylinder{<24.130000,0.038000,76.835000><24.130000,-1.538000,76.835000>0.457200}
cylinder{<24.130000,0.038000,74.295000><24.130000,-1.538000,74.295000>0.457200}
cylinder{<21.590000,0.038000,76.835000><21.590000,-1.538000,76.835000>0.457200}
cylinder{<21.590000,0.038000,74.295000><21.590000,-1.538000,74.295000>0.457200}
cylinder{<19.050000,0.038000,76.835000><19.050000,-1.538000,76.835000>0.457200}
cylinder{<19.050000,0.038000,74.295000><19.050000,-1.538000,74.295000>0.457200}
cylinder{<16.510000,0.038000,76.835000><16.510000,-1.538000,76.835000>0.457200}
cylinder{<16.510000,0.038000,74.295000><16.510000,-1.538000,74.295000>0.457200}
cylinder{<13.970000,0.038000,76.835000><13.970000,-1.538000,76.835000>0.457200}
cylinder{<13.970000,0.038000,74.295000><13.970000,-1.538000,74.295000>0.457200}
//Holes(fast)/Vias
cylinder{<13.843000,0.038000,47.371000><13.843000,-1.538000,47.371000>0.250000 }
cylinder{<9.461500,0.038000,68.834000><9.461500,-1.538000,68.834000>0.300000 }
cylinder{<22.860000,0.038000,8.191500><22.860000,-1.538000,8.191500>0.300000 }
cylinder{<9.017000,0.038000,8.178800><9.017000,-1.538000,8.178800>0.300000 }
cylinder{<24.003000,0.038000,30.353000><24.003000,-1.538000,30.353000>0.300000 }
cylinder{<79.121000,0.038000,72.263000><79.121000,-1.538000,72.263000>0.300000 }
cylinder{<16.052800,0.038000,51.181000><16.052800,-1.538000,51.181000>0.250000 }
cylinder{<38.201600,0.038000,22.453600><38.201600,-1.538000,22.453600>0.300000 }
cylinder{<55.880000,0.038000,52.146200><55.880000,-1.538000,52.146200>0.250000 }
cylinder{<49.606200,0.038000,52.578000><49.606200,-1.538000,52.578000>0.250000 }
cylinder{<46.443900,0.038000,45.897800><46.443900,-1.538000,45.897800>0.250000 }
cylinder{<7.035800,0.038000,41.910000><7.035800,-1.538000,41.910000>0.250000 }
cylinder{<49.987200,0.038000,34.112200><49.987200,-1.538000,34.112200>0.250000 }
cylinder{<21.399500,0.038000,59.055000><21.399500,-1.538000,59.055000>0.250000 }
cylinder{<20.320000,0.038000,57.848500><20.320000,-1.538000,57.848500>0.250000 }
cylinder{<72.999600,0.038000,41.173400><72.999600,-1.538000,41.173400>0.250000 }
cylinder{<69.443600,0.038000,39.319200><69.443600,-1.538000,39.319200>0.250000 }
cylinder{<91.668600,0.038000,71.932800><91.668600,-1.538000,71.932800>0.300000 }
cylinder{<86.207600,0.038000,48.818800><86.207600,-1.538000,48.818800>0.300000 }
cylinder{<19.507200,0.038000,33.985200><19.507200,-1.538000,33.985200>0.300000 }
cylinder{<58.420000,0.038000,52.705000><58.420000,-1.538000,52.705000>0.250000 }
cylinder{<28.448000,0.038000,14.427200><28.448000,-1.538000,14.427200>0.300000 }
cylinder{<60.401200,0.038000,55.143400><60.401200,-1.538000,55.143400>0.250000 }
cylinder{<46.863000,0.038000,51.739800><46.863000,-1.538000,51.739800>0.250000 }
cylinder{<20.701000,0.038000,8.636000><20.701000,-1.538000,8.636000>0.300000 }
cylinder{<16.738600,0.038000,8.509000><16.738600,-1.538000,8.509000>0.300000 }
cylinder{<48.056800,0.038000,56.769000><48.056800,-1.538000,56.769000>0.250000 }
cylinder{<54.432200,0.038000,41.986200><54.432200,-1.538000,41.986200>0.250000 }
cylinder{<52.781200,0.038000,42.849800><52.781200,-1.538000,42.849800>0.250000 }
cylinder{<54.508400,0.038000,43.916600><54.508400,-1.538000,43.916600>0.250000 }
cylinder{<48.691800,0.038000,35.356800><48.691800,-1.538000,35.356800>0.250000 }
cylinder{<48.082200,0.038000,33.629600><48.082200,-1.538000,33.629600>0.250000 }
cylinder{<44.881800,0.038000,54.686200><44.881800,-1.538000,54.686200>0.250000 }
cylinder{<18.669000,0.038000,9.525000><18.669000,-1.538000,9.525000>0.300000 }
cylinder{<42.011600,0.038000,55.626000><42.011600,-1.538000,55.626000>0.300000 }
cylinder{<14.401800,0.038000,8.585200><14.401800,-1.538000,8.585200>0.300000 }
cylinder{<55.905400,0.038000,46.583600><55.905400,-1.538000,46.583600>0.250000 }
cylinder{<71.272400,0.038000,50.368200><71.272400,-1.538000,50.368200>0.250000 }
cylinder{<70.637400,0.038000,60.528200><70.637400,-1.538000,60.528200>0.250000 }
cylinder{<13.144500,0.038000,57.086500><13.144500,-1.538000,57.086500>0.250000 }
cylinder{<2.984500,0.038000,29.781500><2.984500,-1.538000,29.781500>0.300000 }
cylinder{<78.841600,0.038000,56.286400><78.841600,-1.538000,56.286400>0.250000 }
cylinder{<54.406800,0.038000,31.140400><54.406800,-1.538000,31.140400>0.250000 }
cylinder{<52.019200,0.038000,36.728400><52.019200,-1.538000,36.728400>0.250000 }
cylinder{<26.797000,0.038000,10.261600><26.797000,-1.538000,10.261600>0.300000 }
cylinder{<23.368000,0.038000,1.778000><23.368000,-1.538000,1.778000>0.250000 }
cylinder{<10.858500,0.038000,53.911500><10.858500,-1.538000,53.911500>0.250000 }
cylinder{<21.920200,0.038000,51.536600><21.920200,-1.538000,51.536600>0.300000 }
cylinder{<15.621000,0.038000,56.134000><15.621000,-1.538000,56.134000>0.250000 }
cylinder{<22.694900,0.038000,53.428900><22.694900,-1.538000,53.428900>0.300000 }
cylinder{<17.754600,0.038000,28.219400><17.754600,-1.538000,28.219400>0.300000 }
cylinder{<62.026800,0.038000,55.143400><62.026800,-1.538000,55.143400>0.250000 }
cylinder{<33.553400,0.038000,22.428200><33.553400,-1.538000,22.428200>0.300000 }
cylinder{<63.779400,0.038000,53.517800><63.779400,-1.538000,53.517800>0.300000 }
cylinder{<23.114000,0.038000,23.876000><23.114000,-1.538000,23.876000>0.300000 }
cylinder{<28.067000,0.038000,24.003000><28.067000,-1.538000,24.003000>0.300000 }
cylinder{<22.733000,0.038000,17.653000><22.733000,-1.538000,17.653000>0.300000 }
cylinder{<26.924000,0.038000,20.447000><26.924000,-1.538000,20.447000>0.300000 }
cylinder{<7.747000,0.038000,59.563000><7.747000,-1.538000,59.563000>0.300000 }
cylinder{<56.438800,0.038000,49.072800><56.438800,-1.538000,49.072800>0.250000 }
cylinder{<35.966400,0.038000,38.201600><35.966400,-1.538000,38.201600>0.250000 }
cylinder{<33.782000,0.038000,25.781000><33.782000,-1.538000,25.781000>0.300000 }
cylinder{<66.421000,0.038000,51.968400><66.421000,-1.538000,51.968400>0.300000 }
cylinder{<45.694600,0.038000,31.775400><45.694600,-1.538000,31.775400>0.250000 }
cylinder{<56.362600,0.038000,60.223400><56.362600,-1.538000,60.223400>0.250000 }
cylinder{<51.638200,0.038000,69.138800><51.638200,-1.538000,69.138800>0.300000 }
cylinder{<58.343800,0.038000,60.706000><58.343800,-1.538000,60.706000>0.250000 }
cylinder{<49.885600,0.038000,69.189600><49.885600,-1.538000,69.189600>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,4.902200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,4.902200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<28.811200,0.000000,4.902200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,4.902200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,5.444500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<28.268900,0.000000,5.444500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,5.444500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,5.986800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.268900,0.000000,5.444500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,5.986800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,5.986800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<28.811200,0.000000,5.986800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,4.902200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,5.986800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<29.082400,0.000000,5.986800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,2.489200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,2.489200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<28.268900,0.000000,2.489200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,2.489200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,3.302600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<28.268900,0.000000,3.302600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.268900,0.000000,3.302600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,3.573800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<28.268900,0.000000,3.302600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.540000,0.000000,3.573800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,3.573800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.540000,0.000000,3.573800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.811200,0.000000,3.573800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,3.302600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<28.811200,0.000000,3.573800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,3.302600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.353500,0.000000,3.573800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<29.082400,0.000000,3.302600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.353500,0.000000,3.573800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.624700,0.000000,3.573800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<29.353500,0.000000,3.573800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.624700,0.000000,3.573800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,3.302600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<29.624700,0.000000,3.573800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,3.302600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.895800,0.000000,2.489200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.895800,0.000000,2.489200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,2.489200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.082400,0.000000,3.302600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<29.082400,0.000000,3.302600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.802200,0.000000,10.541600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.886800,0.000000,10.541600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<93.802200,0.000000,10.541600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.344500,0.000000,11.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.344500,0.000000,9.999300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.344500,0.000000,9.999300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.439300,0.000000,10.812800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.981600,0.000000,11.355100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<95.439300,0.000000,10.812800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.981600,0.000000,11.355100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.981600,0.000000,9.728200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.981600,0.000000,9.728200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.439300,0.000000,9.728200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.523900,0.000000,9.728200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<95.439300,0.000000,9.728200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.161000,0.000000,9.728200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.076400,0.000000,9.728200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<97.076400,0.000000,9.728200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.076400,0.000000,9.728200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.161000,0.000000,10.812800>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<97.076400,0.000000,9.728200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.161000,0.000000,10.812800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.161000,0.000000,11.084000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<98.161000,0.000000,11.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.161000,0.000000,11.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.889800,0.000000,11.355100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<97.889800,0.000000,11.355100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.889800,0.000000,11.355100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.347500,0.000000,11.355100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<97.347500,0.000000,11.355100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.347500,0.000000,11.355100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.076400,0.000000,11.084000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<97.076400,0.000000,11.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.713500,0.000000,11.355100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.713500,0.000000,10.270500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.713500,0.000000,10.270500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.713500,0.000000,10.270500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.255800,0.000000,9.728200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<98.713500,0.000000,10.270500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.255800,0.000000,9.728200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.798100,0.000000,10.270500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<99.255800,0.000000,9.728200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.798100,0.000000,10.270500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.798100,0.000000,11.355100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<99.798100,0.000000,11.355100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.648800,0.000000,25.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377600,0.000000,25.452100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<95.377600,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377600,0.000000,25.452100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.835300,0.000000,25.452100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<94.835300,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.835300,0.000000,25.452100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.564200,0.000000,25.181000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.564200,0.000000,25.181000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.564200,0.000000,25.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.564200,0.000000,24.096300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.564200,0.000000,24.096300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.564200,0.000000,24.096300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.835300,0.000000,23.825200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<94.564200,0.000000,24.096300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.835300,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377600,0.000000,23.825200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<94.835300,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.377600,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.648800,0.000000,24.096300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<95.377600,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.648800,0.000000,24.096300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.648800,0.000000,24.638600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<95.648800,0.000000,24.638600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.648800,0.000000,24.638600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.106500,0.000000,24.638600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<95.106500,0.000000,24.638600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.201300,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.201300,0.000000,25.452100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<96.201300,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.201300,0.000000,25.452100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.285900,0.000000,23.825200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<96.201300,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.285900,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.285900,0.000000,25.452100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<97.285900,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.838400,0.000000,25.452100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.838400,0.000000,23.825200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.838400,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.838400,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.651800,0.000000,23.825200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<97.838400,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.651800,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.923000,0.000000,24.096300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<98.651800,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.923000,0.000000,24.096300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.923000,0.000000,25.181000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<98.923000,0.000000,25.181000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.923000,0.000000,25.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.651800,0.000000,25.452100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<98.651800,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.651800,0.000000,25.452100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.838400,0.000000,25.452100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<97.838400,0.000000,25.452100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,35.941600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,35.399300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.134900,0.000000,35.399300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,35.399300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.406000,0.000000,35.128200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<99.134900,0.000000,35.399300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.406000,0.000000,35.128200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.490700,0.000000,35.128200>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<99.406000,0.000000,35.128200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.490700,0.000000,35.128200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,35.399300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<100.490700,0.000000,35.128200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,35.399300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,35.941600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<100.761800,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,35.941600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.490700,0.000000,36.212800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<100.490700,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.490700,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.406000,0.000000,36.212800>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<99.406000,0.000000,36.212800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.406000,0.000000,36.212800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,35.941600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<99.134900,0.000000,35.941600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,36.765300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,36.765300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<99.134900,0.000000,36.765300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,36.765300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,37.849900>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<99.134900,0.000000,36.765300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,37.849900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,37.849900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<99.134900,0.000000,37.849900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,27.686600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,27.144300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.261900,0.000000,27.144300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,27.144300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.533000,0.000000,26.873200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<99.261900,0.000000,27.144300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.533000,0.000000,26.873200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.617700,0.000000,26.873200>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<99.533000,0.000000,26.873200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.617700,0.000000,26.873200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,27.144300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<100.617700,0.000000,26.873200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,27.144300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,27.686600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<100.888800,0.000000,27.686600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,27.686600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.617700,0.000000,27.957800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<100.617700,0.000000,27.957800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.617700,0.000000,27.957800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.533000,0.000000,27.957800>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<99.533000,0.000000,27.957800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.533000,0.000000,27.957800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,27.686600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<99.261900,0.000000,27.686600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,28.510300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,28.510300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<99.261900,0.000000,28.510300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,28.510300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,29.594900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<99.261900,0.000000,29.594900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.075400,0.000000,28.510300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.075400,0.000000,29.052600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<100.075400,0.000000,29.052600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.888800,0.000000,30.147400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,30.147400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<99.261900,0.000000,30.147400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,30.147400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.261900,0.000000,31.232000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<99.261900,0.000000,31.232000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.075400,0.000000,30.147400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.075400,0.000000,30.689700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<100.075400,0.000000,30.689700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.761800,0.000000,32.461200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.134900,0.000000,33.545800>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,33.687844,0> translate<99.134900,0.000000,33.545800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.820900,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.820900,0.000000,71.958200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.820900,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.820900,0.000000,72.500500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.905500,0.000000,73.585100>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.820900,0.000000,72.500500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.092000,0.000000,72.771600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.905500,0.000000,71.958200>}
box{<0,0,-0.076200><1.150392,0.036000,0.076200> rotate<0,44.993509,0> translate<73.092000,0.000000,72.771600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.458000,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.000300,0.000000,71.958200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<74.458000,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.729100,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.729100,0.000000,73.585100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<74.729100,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.458000,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.000300,0.000000,73.585100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<74.458000,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.549400,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.549400,0.000000,71.958200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.549400,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.549400,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.634000,0.000000,71.958200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<75.549400,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.186500,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.186500,0.000000,71.958200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.186500,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.186500,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.271100,0.000000,71.958200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<77.186500,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.545300,0.000000,73.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,73.585100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<81.274100,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,73.585100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.731800,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.460700,0.000000,73.314000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.460700,0.000000,73.314000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.460700,0.000000,73.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.460700,0.000000,73.042800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.460700,0.000000,73.042800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.460700,0.000000,73.042800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,72.771600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.460700,0.000000,73.042800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,72.771600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,72.771600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.731800,0.000000,72.771600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,72.771600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.545300,0.000000,72.500500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<81.274100,0.000000,72.771600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.545300,0.000000,72.500500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.545300,0.000000,72.229300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.545300,0.000000,72.229300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.545300,0.000000,72.229300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,71.958200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<81.274100,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.274100,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,71.958200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.731800,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.731800,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.460700,0.000000,72.229300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<80.460700,0.000000,72.229300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.097800,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.097800,0.000000,71.958200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.097800,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.097800,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.640100,0.000000,72.500500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<82.097800,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.640100,0.000000,72.500500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.182400,0.000000,71.958200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<82.640100,0.000000,72.500500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.182400,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.182400,0.000000,73.585100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<83.182400,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.734900,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,71.958200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<83.734900,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.006000,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.006000,0.000000,73.585100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<84.006000,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.734900,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,73.585100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<83.734900,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.368600,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.368600,0.000000,73.585100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<85.368600,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.826300,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.910900,0.000000,73.585100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<84.826300,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.548000,0.000000,73.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.276800,0.000000,73.585100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<87.276800,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.276800,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.734500,0.000000,73.585100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<86.734500,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.734500,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.463400,0.000000,73.314000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.463400,0.000000,73.314000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.463400,0.000000,73.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.463400,0.000000,72.229300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<86.463400,0.000000,72.229300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.463400,0.000000,72.229300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.734500,0.000000,71.958200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<86.463400,0.000000,72.229300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.734500,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.276800,0.000000,71.958200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<86.734500,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.276800,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.548000,0.000000,72.229300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<87.276800,0.000000,71.958200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.100500,0.000000,71.958200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.100500,0.000000,73.585100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<88.100500,0.000000,73.585100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.100500,0.000000,72.771600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.185100,0.000000,72.771600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<88.100500,0.000000,72.771600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.185100,0.000000,73.585100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.185100,0.000000,71.958200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<89.185100,0.000000,71.958200> }
//5V silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.613000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.613000,0.000000,43.942000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<78.613000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.613000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.645000,0.000000,43.942000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<78.613000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.645000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.645000,0.000000,43.180000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<80.645000,0.000000,43.180000> }
//5VSB silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.026000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.026000,0.000000,43.942000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.026000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.026000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.058000,0.000000,43.942000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.026000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.058000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.058000,0.000000,43.180000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<83.058000,0.000000,43.180000> }
//12V silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.439000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.439000,0.000000,43.942000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<83.439000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.439000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.471000,0.000000,43.942000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<83.439000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.471000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.471000,0.000000,43.180000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<85.471000,0.000000,43.180000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.479800,0.000000,37.007800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<76.479800,0.000000,37.769800>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<76.479800,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.799800,0.000000,37.032800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.799800,0.000000,37.769800>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<77.799800,0.000000,37.769800> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<77.138600,0.000000,36.671700>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<77.138700,0.000000,38.119400>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.691000,0.000000,68.682000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.929000,0.000000,68.682000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<66.929000,0.000000,68.682000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.666000,0.000000,70.002000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.929000,0.000000,70.002000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<66.929000,0.000000,70.002000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<68.027000,0.000000,69.340900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<66.579400,0.000000,69.340900>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.755000,0.000000,70.002000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.517000,0.000000,70.002000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<71.755000,0.000000,70.002000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.780000,0.000000,68.682000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.517000,0.000000,68.682000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<71.780000,0.000000,68.682000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-0.000000,0> translate<71.418800,0.000000,69.343100>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-0.000000,0> translate<72.866600,0.000000,69.343100>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.245000,0.000000,35.154000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.483000,0.000000,35.154000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<54.483000,0.000000,35.154000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.220000,0.000000,36.474000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.483000,0.000000,36.474000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<54.483000,0.000000,36.474000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<55.581000,0.000000,35.812900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<54.133400,0.000000,35.812900>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.589000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<86.589000,0.000000,24.892000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<86.589000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.909000,0.000000,24.155000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<87.909000,0.000000,24.892000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<87.909000,0.000000,24.892000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<87.247800,0.000000,23.793900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<87.247900,0.000000,25.241600>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.844000,0.000000,31.310000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.844000,0.000000,31.310000>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<81.844000,0.000000,31.310000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.844000,0.000000,31.310000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.844000,0.000000,27.110000>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<88.844000,0.000000,27.110000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<88.844000,0.000000,27.110000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.844000,0.000000,27.110000>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<81.844000,0.000000,27.110000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.844000,0.000000,27.110000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<81.844000,0.000000,31.310000>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<81.844000,0.000000,31.310000> }
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-0.000000,0> translate<81.794000,0.000000,29.210000>}
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-180.000000,0> translate<88.894000,0.000000,29.210000>}
box{<-0.550000,0,-2.100000><0.550000,0.036000,2.100000> rotate<0,-0.000000,0> translate<82.394000,0.000000,29.210000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.586000,0.000000,26.665500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.586000,0.000000,26.665500>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<49.586000,0.000000,26.665500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.586000,0.000000,26.665500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.586000,0.000000,30.865500>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<49.586000,0.000000,30.865500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.586000,0.000000,30.865500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.586000,0.000000,30.865500>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<49.586000,0.000000,30.865500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.586000,0.000000,30.865500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.586000,0.000000,26.665500>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.586000,0.000000,26.665500> }
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-180.000000,0> translate<56.636000,0.000000,28.765500>}
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-0.000000,0> translate<49.536000,0.000000,28.765500>}
box{<-0.550000,0,-2.100000><0.550000,0.036000,2.100000> rotate<0,-180.000000,0> translate<56.036000,0.000000,28.765500>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.436000,0.000000,35.154000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.674000,0.000000,35.154000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<58.674000,0.000000,35.154000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.411000,0.000000,36.474000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.674000,0.000000,36.474000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<58.674000,0.000000,36.474000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<59.772000,0.000000,35.812900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<58.324400,0.000000,35.812900>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.695200,0.000000,57.581800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<72.695200,0.000000,58.343800>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<72.695200,0.000000,58.343800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.015200,0.000000,57.606800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<74.015200,0.000000,58.343800>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<74.015200,0.000000,58.343800> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<73.354000,0.000000,57.245700>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<73.354100,0.000000,58.693400>}
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.322800,0.000000,58.343800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.322800,0.000000,57.581800>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<71.322800,0.000000,57.581800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.002800,0.000000,58.318800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.002800,0.000000,57.581800>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<70.002800,0.000000,57.581800> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-270.000000,0> translate<70.663800,0.000000,58.679900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-270.000000,0> translate<70.663900,0.000000,57.232200>}
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.866000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.866000,0.000000,38.735000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<16.866000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.186000,0.000000,37.998000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.186000,0.000000,38.735000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<18.186000,0.000000,38.735000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<17.524800,0.000000,37.636900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<17.524900,0.000000,39.084600>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.134000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.134000,0.000000,52.832000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<2.134000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.454000,0.000000,52.095000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.454000,0.000000,52.832000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<3.454000,0.000000,52.832000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<2.792800,0.000000,51.733900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<2.792900,0.000000,53.181600>}
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.652500,0.000000,68.160500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.414500,0.000000,68.160500>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.652500,0.000000,68.160500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.677500,0.000000,66.840500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.414500,0.000000,66.840500>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.677500,0.000000,66.840500> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-0.000000,0> translate<13.316300,0.000000,67.501600>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-0.000000,0> translate<14.764100,0.000000,67.501600>}
//C16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.414500,0.000000,64.491000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.652500,0.000000,64.491000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.652500,0.000000,64.491000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.389500,0.000000,65.811000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.652500,0.000000,65.811000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.652500,0.000000,65.811000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<14.750500,0.000000,65.149900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<13.302900,0.000000,65.149900>}
//C17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.821600,0.000000,26.975200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.059600,0.000000,26.975200>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<45.059600,0.000000,26.975200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.796600,0.000000,28.295200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.059600,0.000000,28.295200>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<45.059600,0.000000,28.295200> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<46.157600,0.000000,27.634100>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<44.710000,0.000000,27.634100>}
//C18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.795000,0.000000,27.110000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.795000,0.000000,27.110000>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<70.795000,0.000000,27.110000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.795000,0.000000,27.110000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.795000,0.000000,31.310000>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<70.795000,0.000000,31.310000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.795000,0.000000,31.310000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.795000,0.000000,31.310000>}
box{<0,0,-0.050800><7.000000,0.036000,0.050800> rotate<0,0.000000,0> translate<70.795000,0.000000,31.310000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.795000,0.000000,31.310000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.795000,0.000000,27.110000>}
box{<0,0,-0.050800><4.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<77.795000,0.000000,27.110000> }
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-180.000000,0> translate<77.845000,0.000000,29.210000>}
box{<-0.100000,0,-1.200000><0.100000,0.036000,1.200000> rotate<0,-0.000000,0> translate<70.745000,0.000000,29.210000>}
box{<-0.550000,0,-2.100000><0.550000,0.036000,2.100000> rotate<0,-180.000000,0> translate<77.245000,0.000000,29.210000>}
//DEBUG silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.406000,0.000000,55.778400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.168000,0.000000,55.778400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.406000,0.000000,55.778400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.168000,0.000000,55.778400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.168000,0.000000,53.746400>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,-90.000000,0> translate<74.168000,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.168000,0.000000,53.746400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.406000,0.000000,53.746400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.406000,0.000000,53.746400> }
//F1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.384800,0.000000,51.739800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.384800,0.000000,54.686200>}
box{<0,0,-0.050800><2.946400,0.036000,0.050800> rotate<0,90.000000,0> translate<5.384800,0.000000,54.686200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,51.765200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,54.686200>}
box{<0,0,-0.050800><2.921000,0.036000,0.050800> rotate<0,90.000000,0> translate<8.585200,0.000000,54.686200> }
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<6.986000,0.000000,51.300400>}
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<6.986000,0.000000,55.135800>}
//I2C silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,68.580000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.915000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,68.580000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.645000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<80.010000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<80.010000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.010000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.645000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.645000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.915000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,70.485000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<81.915000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.725000,0.000000,68.580000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<85.725000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.725000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<85.090000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.090000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.725000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.090000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,68.580000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<84.455000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,68.580000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.185000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<82.550000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.550000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.550000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<82.550000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.185000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.455000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,70.485000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<84.455000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.630000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.630000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<87.630000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.630000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<86.995000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<87.630000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<86.995000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.725000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.995000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<85.725000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,68.580000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<77.470000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.470000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.470000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<79.375000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<79.375000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.375000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,71.120000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<81.280000,0.000000,69.850000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<83.820000,0.000000,69.850000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<86.360000,0.000000,69.850000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<78.740000,0.000000,69.850000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.807000,0.000000,2.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,2.045000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.507000,0.000000,2.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,2.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.007000,0.000000,2.045000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.007000,0.000000,2.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.007000,0.000000,2.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.007000,0.000000,6.845000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.007000,0.000000,6.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.007000,0.000000,6.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,6.845000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.007000,0.000000,6.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,6.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.807000,0.000000,6.845000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.507000,0.000000,6.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.807000,0.000000,6.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.807000,0.000000,2.045000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.807000,0.000000,2.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,2.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.507000,0.000000,6.845000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.507000,0.000000,6.845000> }
object{ARC(1.270000,0.304800,180.000000,360.000000,0.036000) translate<17.907000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.717000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.097000,0.000000,6.985000>}
box{<0,0,-0.304800><7.620000,0.036000,0.304800> rotate<0,0.000000,0> translate<14.097000,0.000000,6.985000> }
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<15.357000,0.000000,6.349900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<15.357000,0.000000,5.079900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<15.357000,0.000000,3.809900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<15.357000,0.000000,2.539900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<20.457000,0.000000,2.540000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<20.457000,0.000000,3.810000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<20.457000,0.000000,5.080000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-270.000000,0> translate<20.457000,0.000000,6.350000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.175200,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.285200>}
box{<0,0,-0.050000><0.765100,0.036000,0.050000> rotate<0,0.000000,0> translate<55.410100,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,47.285200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.125200,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.185200>}
box{<0,0,-0.050000><0.715100,0.036000,0.050000> rotate<0,0.000000,0> translate<55.410100,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,47.185200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.075200,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.575300,0.000000,47.085200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.575300,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,47.085200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.025200,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.525300,0.000000,46.985200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.525300,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.985200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.975200,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.475300,0.000000,46.885200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.475300,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.885200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.925200,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.425300,0.000000,46.785200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.425300,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.785200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.875200,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.375300,0.000000,46.685200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.375300,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.685200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.825200,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.325300,0.000000,46.585200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.325300,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.585200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.775200,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.275300,0.000000,46.485200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.275300,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.485200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.725200,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.225300,0.000000,46.385200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.225300,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.385200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.675200,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.175300,0.000000,46.285200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.175300,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.285200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.625200,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.125300,0.000000,46.185200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.125300,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.185200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.575200,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.075300,0.000000,46.085200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.075300,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,46.085200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.525200,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.025300,0.000000,45.985200>}
box{<0,0,-0.050000><0.499900,0.036000,0.050000> rotate<0,0.000000,0> translate<55.025300,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.985200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.475200,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.885200>}
box{<0,0,-0.050000><0.864900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.425200,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.785200>}
box{<0,0,-0.050000><0.814900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.375200,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.685200>}
box{<0,0,-0.050000><0.764900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.325200,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.585200>}
box{<0,0,-0.050000><0.714900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.275200,0.000000,45.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.485200>}
box{<0,0,-0.050000><0.664900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.225200,0.000000,45.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.385200>}
box{<0,0,-0.050000><0.614900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.210200,0.000000,45.355300>}
box{<0,0,-0.050000><2.236068,0.036000,0.050000> rotate<0,-63.430762,0> translate<55.210200,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.210200,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.355300>}
box{<0,0,-0.050000><0.599900,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,47.355300>}
box{<0,0,-0.050000><2.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<54.610300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.610300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,47.355300>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<54.610300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,45.955200>}
box{<0,0,-0.050000><1.400100,0.036000,0.050000> rotate<0,-90.000000,0> translate<55.010300,0.000000,45.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.010300,0.000000,45.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.610300,0.000000,47.155100>}
box{<0,0,-0.050000><1.341551,0.036000,0.050000> rotate<0,-63.428853,0> translate<55.010300,0.000000,45.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.610300,0.000000,47.155100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.155100>}
box{<0,0,-0.050000><0.200200,0.036000,0.050000> rotate<0,0.000000,0> translate<55.410100,0.000000,47.155100> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.155100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.355300>}
box{<0,0,-0.050000><0.200200,0.036000,0.050000> rotate<0,90.000000,0> translate<55.410100,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.410100,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.355300>}
box{<0,0,-0.050000><0.800100,0.036000,0.050000> rotate<0,0.000000,0> translate<55.410100,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,47.285200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,47.185200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,47.085200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.985200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.885200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.785200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.685200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.585200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.485200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.385200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.285200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.185200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,46.085200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.985200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.885200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.785200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.685200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.585200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.485200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.385200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.285200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.185200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.085200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,45.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.075100,0.000000,44.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.985200>}
box{<0,0,-0.050000><5.764800,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,44.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.025200,0.000000,44.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.885200>}
box{<0,0,-0.050000><5.714900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,44.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.975200,0.000000,44.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.785200>}
box{<0,0,-0.050000><5.664900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,44.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.925200,0.000000,44.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.685200>}
box{<0,0,-0.050000><5.614900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,44.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.110100,0.000000,45.055300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.910200,0.000000,44.655200>}
box{<0,0,-0.050000><0.447258,0.036000,0.050000> rotate<0,-63.447948,0> translate<54.910200,0.000000,44.655200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.910200,0.000000,44.655200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.655200>}
box{<0,0,-0.050000><5.599900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,44.655200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,44.655200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,45.055300>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,90.000000,0> translate<49.310300,0.000000,45.055300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.310300,0.000000,45.055300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.055300>}
box{<0,0,-0.050000><4.599900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.310300,0.000000,45.055300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,45.055300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,47.355300>}
box{<0,0,-0.050000><2.300000,0.036000,0.050000> rotate<0,90.000000,0> translate<53.910200,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.910200,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,47.355300>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.910200,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.055300>}
box{<0,0,-0.050000><2.300000,0.036000,0.050000> rotate<0,-90.000000,0> translate<54.310300,0.000000,45.055300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<54.310300,0.000000,45.055300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<55.110100,0.000000,45.055300>}
box{<0,0,-0.050000><0.799800,0.036000,0.050000> rotate<0,0.000000,0> translate<54.310300,0.000000,45.055300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,47.285200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,47.285200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,47.285200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,47.185200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,47.185200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,47.185200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,47.085200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,47.085200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,47.085200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.985200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.985200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.985200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.885200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.885200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.885200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.785200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.785200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.785200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.685200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.685200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.685200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.585200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.585200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.585200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.485200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.485200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.485200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.385200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.385200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.385200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.285200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.285200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.285200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.185200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.185200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.185200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,46.085200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,46.085200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,46.085200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.985200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.985200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,45.985200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.885200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.885200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,45.885200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.785200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.785200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,45.785200>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.685200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.685200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.045200,0.000000,45.685200>}
box{<0,0,-0.050000><0.364900,0.036000,0.050000> rotate<0,0.000000,0> translate<52.045200,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.585200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.585200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.095100,0.000000,45.585200>}
box{<0,0,-0.050000><0.315000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.095100,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.180100,0.000000,45.485200>}
box{<0,0,-0.050000><1.430200,0.036000,0.050000> rotate<0,0.000000,0> translate<52.180100,0.000000,45.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.350200,0.000000,45.385200>}
box{<0,0,-0.050000><1.260100,0.036000,0.050000> rotate<0,0.000000,0> translate<52.350200,0.000000,45.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,47.355300>}
box{<0,0,-0.050000><2.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<53.610300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,47.355300>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<53.210200,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.555200>}
box{<0,0,-0.050000><1.800100,0.036000,0.050000> rotate<0,-90.000000,0> translate<53.210200,0.000000,45.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.210200,0.000000,45.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.555200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<53.010300,0.000000,45.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,45.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,47.355300>}
box{<0,0,-0.050000><1.800100,0.036000,0.050000> rotate<0,90.000000,0> translate<53.010300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.010300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,47.355300>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<52.610300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.555200>}
box{<0,0,-0.050000><1.800100,0.036000,0.050000> rotate<0,-90.000000,0> translate<52.610300,0.000000,45.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.610300,0.000000,45.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.555200>}
box{<0,0,-0.050000><0.200200,0.036000,0.050000> rotate<0,0.000000,0> translate<52.410100,0.000000,45.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,47.355300>}
box{<0,0,-0.050000><1.800100,0.036000,0.050000> rotate<0,90.000000,0> translate<52.410100,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,47.355300>}
box{<0,0,-0.050000><0.399800,0.036000,0.050000> rotate<0,0.000000,0> translate<52.010300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,45.755300>}
box{<0,0,-0.050000><1.600000,0.036000,0.050000> rotate<0,-90.000000,0> translate<52.010300,0.000000,45.755300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.010300,0.000000,45.755300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.110100,0.000000,45.555200>}
box{<0,0,-0.050000><0.223607,0.036000,0.050000> rotate<0,63.488054,0> translate<52.010300,0.000000,45.755300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.110100,0.000000,45.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.210200,0.000000,45.455100>}
box{<0,0,-0.050000><0.141563,0.036000,0.050000> rotate<0,44.997030,0> translate<52.110100,0.000000,45.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.210200,0.000000,45.455100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.355300>}
box{<0,0,-0.050000><0.223428,0.036000,0.050000> rotate<0,26.528895,0> translate<52.210200,0.000000,45.455100> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<52.410100,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<53.610300,0.000000,45.355300>}
box{<0,0,-0.050000><1.200200,0.036000,0.050000> rotate<0,0.000000,0> translate<52.410100,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,47.285200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,47.185200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,47.085200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.985200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.885200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.785200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.685200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<51.510200,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.585200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<51.510200,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.485200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.385200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.285200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.185200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.085200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<51.510200,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,45.985200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<51.510200,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.885200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.785200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.685200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.585200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.485200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.385200>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,47.355300>}
box{<0,0,-0.050000><2.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<51.710100,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,47.355300>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.755300>}
box{<0,0,-0.050000><0.600000,0.036000,0.050000> rotate<0,-90.000000,0> translate<50.510200,0.000000,46.755300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.755300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.755300>}
box{<0,0,-0.050000><1.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.755300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.755300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.555200>}
box{<0,0,-0.050000><0.200100,0.036000,0.050000> rotate<0,-90.000000,0> translate<51.510200,0.000000,46.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.555200>}
box{<0,0,-0.050000><1.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.555200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.555200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.155100>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,-90.000000,0> translate<50.510200,0.000000,46.155100> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,46.155100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.155100>}
box{<0,0,-0.050000><1.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,46.155100> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,46.155100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,45.955200>}
box{<0,0,-0.050000><0.199900,0.036000,0.050000> rotate<0,-90.000000,0> translate<51.510200,0.000000,45.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.510200,0.000000,45.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.955200>}
box{<0,0,-0.050000><1.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.355300>}
box{<0,0,-0.050000><0.599900,0.036000,0.050000> rotate<0,-90.000000,0> translate<50.510200,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.510200,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<51.710100,0.000000,45.355300>}
box{<0,0,-0.050000><1.199900,0.036000,0.050000> rotate<0,0.000000,0> translate<50.510200,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,47.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.575300,0.000000,47.285200>}
box{<0,0,-0.050000><0.634900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.575300,0.000000,47.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,47.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.525200,0.000000,47.185200>}
box{<0,0,-0.050000><0.685000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.525200,0.000000,47.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,47.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.475200,0.000000,47.085200>}
box{<0,0,-0.050000><0.735000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.475200,0.000000,47.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.425200,0.000000,46.985200>}
box{<0,0,-0.050000><0.785000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.425200,0.000000,46.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.885200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.785200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.685200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.585200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.485200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.385200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.285200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.285200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.285200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.185200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.185200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.185200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,46.085200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.085200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,46.085200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.985200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.985200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.985200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.885200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.785200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.685200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.585200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.485200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.485200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.485200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.385200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.385200>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.385200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,47.355300>}
box{<0,0,-0.050000><2.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<50.210200,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.610300,0.000000,47.355300>}
box{<0,0,-0.050000><0.599900,0.036000,0.050000> rotate<0,0.000000,0> translate<49.610300,0.000000,47.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.610300,0.000000,47.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.410100,0.000000,46.955200>}
box{<0,0,-0.050000><0.447393,0.036000,0.050000> rotate<0,-63.413582,0> translate<49.410100,0.000000,46.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.410100,0.000000,46.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.955200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,0.000000,0> translate<49.410100,0.000000,46.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,46.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.355300>}
box{<0,0,-0.050000><1.599900,0.036000,0.050000> rotate<0,-90.000000,0> translate<49.810200,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.810200,0.000000,45.355300>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<50.210200,0.000000,45.355300>}
box{<0,0,-0.050000><0.400000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.810200,0.000000,45.355300> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.885200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.875200,0.000000,47.885200>}
box{<0,0,-0.050000><6.335000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.875200,0.000000,47.885200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.785200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.825200,0.000000,47.785200>}
box{<0,0,-0.050000><6.385000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.825200,0.000000,47.785200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.685200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.775200,0.000000,47.685200>}
box{<0,0,-0.050000><6.435000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.775200,0.000000,47.685200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.585200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.725200,0.000000,47.585200>}
box{<0,0,-0.050000><6.485000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.725200,0.000000,47.585200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.555100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.955200>}
box{<0,0,-0.050000><0.400100,0.036000,0.050000> rotate<0,90.000000,0> translate<56.210200,0.000000,47.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.910200,0.000000,47.955200>}
box{<0,0,-0.050000><6.300000,0.036000,0.050000> rotate<0,0.000000,0> translate<49.910200,0.000000,47.955200> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.910200,0.000000,47.955200>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.710100,0.000000,47.555100>}
box{<0,0,-0.050000><0.447348,0.036000,0.050000> rotate<0,-63.425035,0> translate<49.710100,0.000000,47.555100> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<49.710100,0.000000,47.555100>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<56.210200,0.000000,47.555100>}
box{<0,0,-0.050000><6.500100,0.036000,0.050000> rotate<0,0.000000,0> translate<49.710100,0.000000,47.555100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.400200,0.000000,40.435200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.650200,0.000000,39.685200>}
box{<0,0,-0.127000><1.060660,0.036000,0.127000> rotate<0,-44.997030,0> translate<58.650200,0.000000,39.685200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.650200,0.000000,39.685200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.650200,0.000000,39.685200>}
box{<0,0,-0.127000><13.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<45.650200,0.000000,39.685200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.650200,0.000000,39.685200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.400200,0.000000,39.935200>}
box{<0,0,-0.127000><0.353553,0.036000,0.127000> rotate<0,44.997030,0> translate<45.400200,0.000000,39.935200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.400200,0.000000,39.935200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.400200,0.000000,53.435200>}
box{<0,0,-0.127000><13.500000,0.036000,0.127000> rotate<0,90.000000,0> translate<45.400200,0.000000,53.435200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.400200,0.000000,53.435200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.650200,0.000000,53.685200>}
box{<0,0,-0.127000><0.353553,0.036000,0.127000> rotate<0,-44.997030,0> translate<45.400200,0.000000,53.435200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.650200,0.000000,53.685200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.150200,0.000000,53.685200>}
box{<0,0,-0.127000><13.500000,0.036000,0.127000> rotate<0,0.000000,0> translate<45.650200,0.000000,53.685200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.150200,0.000000,53.685200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.400200,0.000000,53.435200>}
box{<0,0,-0.127000><0.353553,0.036000,0.127000> rotate<0,44.997030,0> translate<59.150200,0.000000,53.685200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.400200,0.000000,53.435200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.400200,0.000000,40.435200>}
box{<0,0,-0.127000><13.000000,0.036000,0.127000> rotate<0,-90.000000,0> translate<59.400200,0.000000,40.435200> }
object{ARC(0.399900,0.101600,180.000000,270.000000,0.036000) translate<52.410100,0.000000,45.755300>}
difference{
cylinder{<58.400200,0,40.685200><58.400200,0.036000,40.685200>0.376900 translate<0,0.000000,0>}
cylinder{<58.400200,-0.1,40.685200><58.400200,0.135000,40.685200>0.122900 translate<0,0.000000,0>}}
difference{
cylinder{<48.810200,0,47.455100><48.810200,0.036000,47.455100>0.550700 translate<0,0.000000,0>}
cylinder{<48.810200,-0.1,47.455100><48.810200,0.135000,47.455100>0.449100 translate<0,0.000000,0>}}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,40.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,41.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,41.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,42.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,42.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,43.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,43.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,44.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,44.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,45.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,45.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,46.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,46.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,47.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,47.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,48.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,48.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,49.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,49.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,50.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,50.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,51.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,51.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<60.075000,0.000000,52.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<60.075000,0.000000,52.685000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<58.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<57.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<57.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<56.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<56.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<55.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<55.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<54.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<54.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<53.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<53.400000,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<52.900000,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<52.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<51.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<51.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<50.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<50.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<49.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<49.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<48.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<48.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<47.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<47.400200,0.000000,54.360000>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<46.900200,0.000000,54.360000>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<46.400200,0.000000,54.360000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,52.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,52.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,51.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,51.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,50.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,50.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,49.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,49.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,48.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,48.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,47.685000>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,47.185000>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,46.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,46.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,45.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,45.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,44.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,44.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,43.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,43.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,42.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,42.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,41.685200>}
box{<-0.524900,0,-0.150000><0.524900,0.036000,0.150000> rotate<0,-180.000000,0> translate<44.725200,0.000000,41.185200>}
box{<-0.524900,0,-0.150100><0.524900,0.036000,0.150100> rotate<0,-180.000000,0> translate<44.725200,0.000000,40.685200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<46.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<46.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<47.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<47.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<48.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<48.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<49.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<49.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<50.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<50.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<51.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<51.900200,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<52.400200,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<52.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<53.400000,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<53.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<54.400000,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<54.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<55.400000,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<55.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<56.400000,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<56.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<57.400000,0.000000,39.010200>}
box{<-0.150000,0,-0.524900><0.150000,0.036000,0.524900> rotate<0,-180.000000,0> translate<57.900000,0.000000,39.010200>}
box{<-0.150100,0,-0.524900><0.150100,0.036000,0.524900> rotate<0,-180.000000,0> translate<58.400000,0.000000,39.010200>}
//IC6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.664000,0.000000,54.931000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.864000,0.000000,54.931000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.664000,0.000000,54.931000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.864000,0.000000,54.931000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.864000,0.000000,60.131000>}
box{<0,0,-0.101600><5.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.864000,0.000000,60.131000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.864000,0.000000,60.131000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.664000,0.000000,60.131000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.664000,0.000000,60.131000> }
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<12.539000,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<13.188900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<13.838900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<14.488900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<15.138900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<15.788900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<16.438900,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<17.089100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<17.739100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<18.389100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<19.039100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<19.689100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<20.339100,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<20.989000,0.000000,54.241700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<20.989000,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<20.339100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<19.689100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<19.039100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<18.389100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<17.739100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<17.089100,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<16.438900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<15.788900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<15.138900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<14.488900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<13.838900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<13.188900,0.000000,60.820300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-0.000000,0> translate<12.539000,0.000000,60.820300>}
//IC7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.696000,0.000000,44.336000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,44.336000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.396000,0.000000,44.336000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,44.336000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.896000,0.000000,44.336000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.896000,0.000000,44.336000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.896000,0.000000,44.336000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.896000,0.000000,49.136000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.896000,0.000000,49.136000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.896000,0.000000,49.136000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,49.136000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.896000,0.000000,49.136000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,49.136000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.696000,0.000000,49.136000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.396000,0.000000,49.136000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.696000,0.000000,49.136000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.696000,0.000000,44.336000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.696000,0.000000,44.336000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,44.336000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.396000,0.000000,49.136000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.396000,0.000000,49.136000> }
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<16.246000,0.000000,48.641000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<16.246000,0.000000,47.371000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<16.246000,0.000000,46.101000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<16.246000,0.000000,44.831000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<21.346000,0.000000,44.831000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<21.346000,0.000000,46.101000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<21.346000,0.000000,47.371000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<21.346000,0.000000,48.641000>}
//ICSP silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.805600,0.000000,37.312600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.170600,0.000000,37.947600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.170600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.900600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,37.312600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.265600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,37.312600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.630600,0.000000,37.947600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.630600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.360600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,37.312600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.725600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.805600,0.000000,37.312600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.805600,0.000000,33.502600>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.805600,0.000000,33.502600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.805600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.170600,0.000000,32.867600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.170600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.170600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.900600,0.000000,32.867600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.900600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.900600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,33.502600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.265600,0.000000,33.502600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.630600,0.000000,32.867600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.630600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.630600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.360600,0.000000,32.867600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.360600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.360600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,33.502600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.725600,0.000000,33.502600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.265600,0.000000,37.312600>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.265600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,37.312600>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.725600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.630600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.360600,0.000000,37.947600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.360600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.170600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.900600,0.000000,37.947600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.900600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,37.312600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.090600,0.000000,37.947600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.090600,0.000000,37.947600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.820600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.185600,0.000000,37.312600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.185600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.725600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.090600,0.000000,32.867600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.090600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.090600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.820600,0.000000,32.867600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.820600,0.000000,32.867600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.820600,0.000000,32.867600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.185600,0.000000,33.502600>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.185600,0.000000,33.502600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.185600,0.000000,33.502600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.185600,0.000000,37.312600>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.185600,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.090600,0.000000,37.947600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.820600,0.000000,37.947600>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.820600,0.000000,37.947600> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<43.535600,0.000000,36.677600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<43.535600,0.000000,34.137600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.995600,0.000000,34.137600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.995600,0.000000,36.677600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<38.455600,0.000000,34.137600>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<38.455600,0.000000,36.677600>}
//INTERFACE silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.389200,0.000000,40.538400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.389200,0.000000,71.018400>}
box{<0,0,-0.076200><30.480000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.389200,0.000000,71.018400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,71.018400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.389200,0.000000,71.018400>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.389200,0.000000,71.018400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.389200,0.000000,40.538400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,40.538400>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.389200,0.000000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,39.268400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,40.538400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.119200,0.000000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,72.288400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,67.589400>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.009200,0.000000,67.589400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,72.288400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,72.288400>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.119200,0.000000,72.288400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,39.268400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,39.268400>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<90.119200,0.000000,39.268400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,71.018400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,66.700400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,66.700400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.977200,0.000000,57.810400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.977200,0.000000,53.746400>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<96.977200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,53.746400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.977200,0.000000,53.746400>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.977200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,53.746400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,48.920400>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,48.920400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.977200,0.000000,57.810400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,57.810400>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.977200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,57.810400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,57.810400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,71.018400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,71.018400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,71.018400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,71.018400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,69.748400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<89.865200,0.000000,69.748400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,69.748400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,69.748400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,69.748400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,71.018400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,72.288400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.119200,0.000000,72.288400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,56.413400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,55.143400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<89.865200,0.000000,55.143400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,56.413400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,56.413400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,56.413400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,56.413400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,69.748400>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.119200,0.000000,69.748400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,55.143400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,55.143400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,55.143400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,41.808400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,40.538400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<89.865200,0.000000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,40.538400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,40.538400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.865200,0.000000,41.808400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,41.808400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.865200,0.000000,41.808400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,41.808400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.119200,0.000000,55.143400>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,90.000000,0> translate<90.119200,0.000000,55.143400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,64.287400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,57.810400>}
box{<0,0,-0.076200><6.477000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.009200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,57.810400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,53.746400>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.009200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,65.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,65.176400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,65.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,65.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,57.810400>}
box{<0,0,-0.076200><7.366000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,66.700400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,66.700400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,66.700400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,66.700400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,65.176400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,65.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,64.287400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,64.668400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<98.501200,0.000000,64.668400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,67.208400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,67.589400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<98.501200,0.000000,67.208400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,67.208400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,66.700400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,66.700400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,65.176400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,57.810400>}
box{<0,0,-0.025400><7.366000,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.993200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,57.810400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,57.810400>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,57.810400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,66.700400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,71.272400>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,90.000000,0> translate<97.993200,0.000000,71.272400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,71.272400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<91.135200,0.000000,71.272400>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<91.135200,0.000000,71.272400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<91.135200,0.000000,71.272400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<91.135200,0.000000,40.284400>}
box{<0,0,-0.025400><30.988000,0.036000,0.025400> rotate<0,-90.000000,0> translate<91.135200,0.000000,40.284400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<91.135200,0.000000,40.284400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,40.284400>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<91.135200,0.000000,40.284400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,40.284400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,47.396400>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,90.000000,0> translate<97.993200,0.000000,47.396400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,53.746400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,53.746400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,53.746400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,53.746400>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,65.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,65.176400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,65.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,65.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,64.668400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,64.668400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,66.700400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,66.700400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,66.700400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,66.700400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,65.176400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,65.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,39.268400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,43.586400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<99.009200,0.000000,43.586400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.882200,0.000000,43.586400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,43.586400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.882200,0.000000,43.586400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.882200,0.000000,43.586400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.882200,0.000000,45.110400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<98.882200,0.000000,45.110400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,45.110400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.882200,0.000000,45.110400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.882200,0.000000,45.110400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,45.110400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,46.507400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,90.000000,0> translate<99.009200,0.000000,46.507400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,47.396400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,47.396400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,47.396400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,48.920400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,48.920400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.993200,0.000000,48.920400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,48.920400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.993200,0.000000,53.746400>}
box{<0,0,-0.025400><4.826000,0.036000,0.025400> rotate<0,90.000000,0> translate<97.993200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,47.396400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,47.396400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,47.396400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,47.396400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,40.538400>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,40.538400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,48.920400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.993200,0.000000,48.920400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.739200,0.000000,48.920400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,48.920400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.739200,0.000000,47.396400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.739200,0.000000,47.396400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,48.920400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,47.396400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,47.396400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,47.396400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,46.888400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,46.888400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,46.507400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,46.888400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<98.501200,0.000000,46.888400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,49.428400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,49.809400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<98.501200,0.000000,49.428400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,49.809400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.009200,0.000000,53.746400>}
box{<0,0,-0.076200><3.937000,0.036000,0.076200> rotate<0,90.000000,0> translate<99.009200,0.000000,53.746400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,49.428400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.501200,0.000000,48.920400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.501200,0.000000,48.920400> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,67.208400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,67.208400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,64.668400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,59.588400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,59.588400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,64.668400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,46.888400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,44.348400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,49.428400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,57.048400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,54.508400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,46.888400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,44.348400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,49.428400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,57.048400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,54.508400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,51.968400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,51.968400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<93.294200,0.000000,62.128400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<95.834200,0.000000,62.128400>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.459000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.459000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.546000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.784000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.054000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.054000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.086000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.324000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.594000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.594000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<54.864000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<54.864000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,13.345000>}
box{<0,0,-0.101600><0.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<54.864000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.674000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.491000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.674000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.356000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<54.356000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<54.356000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.594000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.086000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.086000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.054000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.546000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.546000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.244000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.244000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.244000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.244000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.133000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.244000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.133000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.133000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<48.133000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.706000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.706000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<60.706000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.706000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.817000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.817000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.817000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.817000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.817000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.864000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.356000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.356000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.594000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.594000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.594000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.086000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.086000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.086000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.054000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.054000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.054000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.546000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.546000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.546000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<52.324000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<52.324000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.816000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.816000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.816000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.324000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.816000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.816000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.784000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.784000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.276000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.276000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.276000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.784000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.276000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.276000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.864000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.626000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.864000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.134000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.134000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.166000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.404000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.674000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.166000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.166000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.134000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.626000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.626000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.674000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.674000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.674000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.166000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.166000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.166000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.134000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.134000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.134000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.626000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.626000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.626000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<57.404000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<57.404000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.896000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<56.896000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<56.896000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.404000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.404000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.896000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.896000,0.000000,8.636000> }
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.584000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.584000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.671000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.909000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.179000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.211000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.449000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.719000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.719000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.989000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.989000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,13.345000>}
box{<0,0,-0.101600><0.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.989000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.799000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.616000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.799000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.481000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.481000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.481000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.719000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.211000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.211000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.671000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.671000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.369000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.369000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.369000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.369000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.258000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.369000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.258000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.258000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.258000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.831000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.831000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.831000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.831000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.942000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.942000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.942000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.942000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<43.942000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.989000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.481000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.481000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.719000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.719000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.719000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.211000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.211000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.211000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.179000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.179000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.671000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.671000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.671000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.449000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.449000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.941000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.941000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.941000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.449000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.941000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.941000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.909000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.909000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.401000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.401000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.401000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.909000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.401000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.401000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.989000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.751000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.989000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.259000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.259000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.529000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.799000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.291000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.259000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.751000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.751000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.799000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.799000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.799000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.291000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.291000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.259000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.259000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.259000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.751000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.751000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.751000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.529000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.529000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.021000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.021000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.021000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.529000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.529000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.021000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.021000,0.000000,8.636000> }
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.334000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.334000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.421000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<65.659000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.929000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<66.929000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.199000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.469000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.469000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<70.739000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<70.739000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,13.345000>}
box{<0,0,-0.101600><0.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<70.739000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.549000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.366000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.549000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.231000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<70.231000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<70.231000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.469000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.961000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.929000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.421000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<66.421000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.119000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.119000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<63.119000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.119000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.008000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<63.119000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.008000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.008000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<64.008000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.581000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.581000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.581000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.581000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.692000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<75.692000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.692000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.692000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<75.692000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<70.739000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.231000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<70.231000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.469000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.469000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.469000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.961000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.961000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.929000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.929000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.929000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.421000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.421000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.421000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<68.199000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<68.199000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.691000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<67.691000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<67.691000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.199000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.691000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.691000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.659000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.659000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<65.151000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.151000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.151000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.659000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.151000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.151000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.739000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.501000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.739000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.009000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<72.009000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.041000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<73.279000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.549000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.041000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.041000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.009000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.501000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<71.501000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.549000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.549000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.549000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.041000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.041000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.041000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.009000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.009000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.009000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.501000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.501000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<71.501000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<73.279000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<73.279000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<72.771000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<72.771000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<72.771000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.279000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<73.279000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.771000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.771000,0.000000,8.636000> }
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.209000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<78.209000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.296000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<81.534000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.804000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<82.804000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.836000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<84.074000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.344000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.344000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<86.614000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<86.614000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,13.345000>}
box{<0,0,-0.101600><0.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<86.614000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.424000,0.000000,13.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<93.241000,0.000000,13.345000>}
box{<0,0,-0.101600><2.817000,0.036000,0.101600> rotate<0,0.000000,0> translate<90.424000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.106000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<86.106000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<86.106000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.344000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.836000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<84.836000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.804000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.296000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<82.296000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.994000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.994000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<78.994000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.994000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.883000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<78.994000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.883000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.883000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<79.883000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.456000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.456000,0.000000,12.319000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.456000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.456000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<91.567000,0.000000,12.319000>}
box{<0,0,-0.101600><0.889000,0.036000,0.101600> rotate<0,0.000000,0> translate<91.567000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<91.567000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<91.567000,0.000000,13.335000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,90.000000,0> translate<91.567000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.614000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.106000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.106000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.344000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.344000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.344000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.836000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.836000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.836000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.804000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.804000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.804000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.296000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.296000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.296000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<84.074000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<84.074000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<83.566000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<83.566000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<83.566000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.074000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.566000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<83.566000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<81.534000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<81.534000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<81.026000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<81.026000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<81.026000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.534000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.026000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.026000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.614000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.376000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.614000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.884000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.884000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.916000,0.000000,13.335000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<89.154000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.424000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.916000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<89.916000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.884000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.376000,0.000000,11.049000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.376000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.424000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.424000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<90.424000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.916000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.916000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<89.916000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.884000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.884000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.884000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.376000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.376000,0.000000,11.049000>}
box{<0,0,-0.101600><2.286000,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.376000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<89.154000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,13.345000>}
box{<0,0,-0.101600><2.804000,0.036000,0.101600> rotate<0,90.000000,0> translate<89.154000,0.000000,13.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,8.382000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.646000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,8.636000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,90.000000,0> translate<88.646000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,13.335000>}
box{<0,0,-0.101600><2.794000,0.036000,0.101600> rotate<0,90.000000,0> translate<88.646000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.154000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<89.154000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.646000,0.000000,8.636000>}
box{<0,0,-0.101600><1.905000,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.646000,0.000000,8.636000> }
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.686000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,4.191000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.051000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.191000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.146000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.051000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.146000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,6.096000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.146000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.051000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,2.286000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.686000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.051000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,2.286000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.146000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.146000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.191000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.146000,0.000000,3.556000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.416000,0.000000,5.461000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.416000,0.000000,2.921000>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<66.675000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<72.771000,0.000000,63.246000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<66.675000,0.000000,63.246000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<66.675000,0.000000,67.564000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<72.771000,0.000000,67.564000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<66.675000,0.000000,67.564000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,63.754000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.675000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.771000,0.000000,67.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,67.056000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.675000,0.000000,67.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.469000,0.000000,66.167000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.977000,0.000000,66.167000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.469000,0.000000,66.167000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.977000,0.000000,66.167000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.977000,0.000000,64.643000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.977000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.977000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.469000,0.000000,64.643000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.469000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.469000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.469000,0.000000,66.167000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.469000,0.000000,66.167000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,66.167000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,65.405000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.358000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,64.643000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.358000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.088000,0.000000,66.167000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.088000,0.000000,65.405000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.088000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.088000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.088000,0.000000,64.643000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.088000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,0.000000,65.405000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.358000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.088000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.453000,0.000000,65.405000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.453000,0.000000,65.405000> }
object{ARC(2.159000,0.406400,90.000000,270.000000,0.036000) translate<66.675000,0.000000,65.405000>}
object{ARC(2.159000,0.406400,270.000000,450.000000,0.036000) translate<72.771000,0.000000,65.405000>}
object{ARC(1.651000,0.152400,90.000000,270.000000,0.036000) translate<66.675000,0.000000,65.405000>}
object{ARC(1.651000,0.152400,270.000000,450.000000,0.036000) translate<72.771000,0.000000,65.405000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.077800,0.000000,55.397400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.897800,0.000000,55.397400>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.077800,0.000000,55.397400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.077800,0.000000,54.127400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.897800,0.000000,54.127400>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.077800,0.000000,54.127400> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<68.219200,0.000000,54.763900>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<66.746000,0.000000,54.763900>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.568000,0.000000,67.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.388000,0.000000,67.056000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.568000,0.000000,67.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.568000,0.000000,65.786000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.388000,0.000000,65.786000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.568000,0.000000,65.786000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<78.709400,0.000000,66.422500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<77.236200,0.000000,66.422500>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.087000,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.267000,0.000000,65.659000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.267000,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.087000,0.000000,66.929000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.267000,0.000000,66.929000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.267000,0.000000,66.929000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<81.945600,0.000000,66.292500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<83.418800,0.000000,66.292500>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.404400,0.000000,37.312600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.224400,0.000000,37.312600>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.404400,0.000000,37.312600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.404400,0.000000,36.042600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.224400,0.000000,36.042600>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<89.404400,0.000000,36.042600> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<90.545800,0.000000,36.679100>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<89.072600,0.000000,36.679100>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.386200,0.000000,57.552800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.386200,0.000000,58.372800>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.386200,0.000000,58.372800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.656200,0.000000,57.552800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.656200,0.000000,58.372800>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.656200,0.000000,58.372800> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<68.019700,0.000000,58.694200>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<68.019700,0.000000,57.221000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,37.944000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,38.764000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.431000,0.000000,38.764000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,37.944000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,38.764000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.701000,0.000000,38.764000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<20.064500,0.000000,39.085400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<20.064500,0.000000,37.612200>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,58.131500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,57.311500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.813000,0.000000,57.311500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,58.131500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,57.311500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,0.000000,57.311500> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<27.179500,0.000000,56.990100>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<27.179500,0.000000,58.463300>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.994000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.994000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.994000,0.000000,37.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.264000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.264000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<80.264000,0.000000,37.875000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<79.627500,0.000000,38.196400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<79.627500,0.000000,36.723200>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.336500,0.000000,58.131500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.336500,0.000000,57.311500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.336500,0.000000,57.311500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.066500,0.000000,58.131500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.066500,0.000000,57.311500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.066500,0.000000,57.311500> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<24.703000,0.000000,56.990100>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<24.703000,0.000000,58.463300>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.259000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.079000,0.000000,42.799000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.259000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.259000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.079000,0.000000,41.529000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.259000,0.000000,41.529000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<19.400400,0.000000,42.165500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<17.927200,0.000000,42.165500>}
//R11 silk screen
//R12 silk screen
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<81.407000,0.000000,37.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<82.677000,0.000000,37.875000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<82.040500,0.000000,38.196400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<82.040500,0.000000,36.723200>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.820000,0.000000,37.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,37.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.090000,0.000000,37.875000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<85.090000,0.000000,37.875000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<84.453500,0.000000,38.196400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<84.453500,0.000000,36.723200>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.824000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.004000,0.000000,5.715000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.004000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.824000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.004000,0.000000,6.985000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.004000,0.000000,6.985000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<9.682600,0.000000,6.348500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<11.155800,0.000000,6.348500>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.925600,0.000000,2.997200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.105600,0.000000,2.997200>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.105600,0.000000,2.997200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.925600,0.000000,4.267200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.105600,0.000000,4.267200>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.105600,0.000000,4.267200> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<9.784200,0.000000,3.630700>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<11.257400,0.000000,3.630700>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,4.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,4.982000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.733000,0.000000,4.982000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,4.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,4.982000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,4.982000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<23.366500,0.000000,5.303400>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-90.000000,0> translate<23.366500,0.000000,3.830200>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.635500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.815500,0.000000,27.622500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.815500,0.000000,27.622500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.635500,0.000000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.815500,0.000000,28.892500>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.815500,0.000000,28.892500> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<25.494100,0.000000,28.256000>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<26.967300,0.000000,28.256000>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,26.035000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,24.765000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,24.765000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<26.766400,0.000000,25.401500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<25.293200,0.000000,25.401500>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,22.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,21.590000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,21.590000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<26.766400,0.000000,22.226500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<25.293200,0.000000,22.226500>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,19.050000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.625000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.445000,0.000000,17.780000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.625000,0.000000,17.780000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<26.766400,0.000000,18.416500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<25.293200,0.000000,18.416500>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,26.035000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,24.765000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,24.765000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<30.830400,0.000000,25.401500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<29.357200,0.000000,25.401500>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,22.860000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,21.590000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,21.590000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<30.830400,0.000000,22.226500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<29.357200,0.000000,22.226500>}
//R25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,19.050000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.689000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.509000,0.000000,17.780000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.689000,0.000000,17.780000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<30.830400,0.000000,18.416500>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<29.357200,0.000000,18.416500>}
//RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,59.563000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.185000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,61.087000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.439000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.439000,0.000000,61.087000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.185000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,61.341000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,62.865000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.185000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,61.087000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.835000,0.000000,61.087000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,59.563000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.835000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,59.563000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.835000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,63.373000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<82.677000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,57.785000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<82.677000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,57.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,59.309000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.185000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.597000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,62.865000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.089000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,61.341000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.089000,0.000000,61.341000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.597000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,57.785000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<77.089000,0.000000,57.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,57.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,59.309000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.089000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,59.055000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<78.867000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,59.055000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<78.867000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,61.595000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<81.407000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,61.595000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<78.867000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,63.119000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<78.867000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,63.119000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,63.119000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<78.867000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,63.119000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.407000,0.000000,63.373000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,90.000000,0> translate<81.407000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.280000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,57.531000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,0.000000,0> translate<78.867000,0.000000,57.531000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.280000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.280000,0.000000,57.277000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<81.280000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<78.867000,0.000000,57.277000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,-90.000000,0> translate<78.867000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.296000,0.000000,57.277000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.296000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.597000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,57.277000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.597000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,57.277000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.978000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.597000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,63.373000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.597000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.677000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.296000,0.000000,63.373000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.296000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.296000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,63.373000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.407000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,63.373000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,63.373000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,63.373000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.978000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,57.277000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.280000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.296000,0.000000,57.277000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<81.280000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,59.309000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.185000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.185000,0.000000,61.341000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.185000,0.000000,61.341000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,59.309000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.089000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.089000,0.000000,61.341000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.089000,0.000000,61.341000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,58.166000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.407000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.867000,0.000000,62.611000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.867000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,60.833000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.724000,0.000000,60.833000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,59.817000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,59.055000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.724000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.724000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.978000,0.000000,59.944000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,74.049717,0> translate<77.724000,0.000000,60.833000> }
difference{
cylinder{<80.137000,0,60.325000><80.137000,0.036000,60.325000>1.854200 translate<0,0.000000,0>}
cylinder{<80.137000,-0.1,60.325000><80.137000,0.135000,60.325000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<77.978000,0,58.166000><77.978000,0.036000,58.166000>0.584200 translate<0,0.000000,0>}
cylinder{<77.978000,-0.1,58.166000><77.978000,0.135000,58.166000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<82.296000,0,58.293000><82.296000,0.036000,58.293000>0.584200 translate<0,0.000000,0>}
cylinder{<82.296000,-0.1,58.293000><82.296000,0.135000,58.293000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<82.296000,0,62.484000><82.296000,0.036000,62.484000>0.584200 translate<0,0.000000,0>}
cylinder{<82.296000,-0.1,62.484000><82.296000,0.135000,62.484000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<77.978000,0,62.484000><77.978000,0.036000,62.484000>0.584200 translate<0,0.000000,0>}
cylinder{<77.978000,-0.1,62.484000><77.978000,0.135000,62.484000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<80.137000,0,60.325000><80.137000,0.036000,60.325000>0.660400 translate<0,0.000000,0>}
cylinder{<80.137000,-0.1,60.325000><80.137000,0.135000,60.325000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<80.137000,0,60.325000><80.137000,0.036000,60.325000>0.330200 translate<0,0.000000,0>}
cylinder{<80.137000,-0.1,60.325000><80.137000,0.135000,60.325000>0.177800 translate<0,0.000000,0>}}
//RX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,64.198500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<26.162000,0.000000,64.198500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.162000,0.000000,64.198500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,64.198500>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.162000,0.000000,64.198500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,64.198500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,63.436500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.194000,0.000000,63.436500> }
//SG1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.893000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,0.000000,44.132500>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<32.893000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.528000,0.000000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.528000,0.000000,43.497500>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<33.528000,0.000000,43.497500> }
difference{
cylinder{<29.718000,0,41.084500><29.718000,0.036000,41.084500>7.061200 translate<0,0.000000,0>}
cylinder{<29.718000,-0.1,41.084500><29.718000,0.135000,41.084500>6.908800 translate<0,0.000000,0>}}
difference{
cylinder{<29.718000,0,41.084500><29.718000,0.036000,41.084500>1.346200 translate<0,0.000000,0>}
cylinder{<29.718000,-0.1,41.084500><29.718000,0.135000,41.084500>1.193800 translate<0,0.000000,0>}}
difference{
cylinder{<33.528000,0,44.132500><33.528000,0.036000,44.132500>1.346200 translate<0,0.000000,0>}
cylinder{<33.528000,-0.1,44.132500><33.528000,0.135000,44.132500>1.193800 translate<0,0.000000,0>}}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.699000,0.000000,49.123600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,49.123600>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.699000,0.000000,49.123600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,49.123600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,42.570400>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.255000,0.000000,42.570400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,42.570400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.699000,0.000000,42.570400>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.699000,0.000000,42.570400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.699000,0.000000,42.570400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.699000,0.000000,49.123600>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,90.000000,0> translate<4.699000,0.000000,49.123600> }
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<3.746500,0.000000,45.847000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,45.847000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,43.535600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,48.158400>}
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<3.746500,0.000000,45.847000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,45.847000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,43.535600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.207500,0.000000,48.158400>}
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.572000,0.000000,41.376600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.128000,0.000000,41.376600>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.572000,0.000000,41.376600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.128000,0.000000,41.376600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.128000,0.000000,34.823400>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.128000,0.000000,34.823400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.128000,0.000000,34.823400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.572000,0.000000,34.823400>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.572000,0.000000,34.823400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.572000,0.000000,34.823400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.572000,0.000000,41.376600>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,90.000000,0> translate<4.572000,0.000000,41.376600> }
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<3.619500,0.000000,38.100000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,38.100000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,35.788600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,40.411400>}
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<3.619500,0.000000,38.100000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,38.100000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,35.788600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<9.080500,0.000000,40.411400>}
//TX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.685500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.685500,0.000000,64.198500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.685500,0.000000,64.198500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.685500,0.000000,64.198500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.717500,0.000000,64.198500>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.685500,0.000000,64.198500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.717500,0.000000,64.198500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.717500,0.000000,63.436500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.717500,0.000000,63.436500> }
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.425000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.425000,0.000000,38.070000>}
box{<0,0,-0.063500><11.400000,0.036000,0.063500> rotate<0,90.000000,0> translate<98.425000,0.000000,38.070000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.425000,0.000000,38.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<92.725000,0.000000,38.070000>}
box{<0,0,-0.063500><5.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<92.725000,0.000000,38.070000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<92.725000,0.000000,38.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<92.725000,0.000000,26.670000>}
box{<0,0,-0.063500><11.400000,0.036000,0.063500> rotate<0,-90.000000,0> translate<92.725000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<92.725000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.425000,0.000000,26.670000>}
box{<0,0,-0.063500><5.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<92.725000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.225000,0.000000,29.370000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.225000,0.000000,35.470000>}
box{<0,0,-0.063500><6.100000,0.036000,0.063500> rotate<0,90.000000,0> translate<97.225000,0.000000,35.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.225000,0.000000,35.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.925000,0.000000,35.470000>}
box{<0,0,-0.063500><3.300000,0.036000,0.063500> rotate<0,0.000000,0> translate<93.925000,0.000000,35.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.925000,0.000000,35.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.925000,0.000000,29.370000>}
box{<0,0,-0.063500><6.100000,0.036000,0.063500> rotate<0,-90.000000,0> translate<93.925000,0.000000,29.370000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.925000,0.000000,29.370000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.225000,0.000000,29.370000>}
box{<0,0,-0.063500><3.300000,0.036000,0.063500> rotate<0,0.000000,0> translate<93.925000,0.000000,29.370000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,29.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,30.470000>}
box{<0,0,-0.063500><0.800000,0.036000,0.063500> rotate<0,90.000000,0> translate<94.225000,0.000000,30.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,30.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,32.270000>}
box{<0,0,-0.063500><1.800000,0.036000,0.063500> rotate<0,90.000000,0> translate<94.225000,0.000000,32.270000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,32.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,33.070000>}
box{<0,0,-0.063500><0.800000,0.036000,0.063500> rotate<0,90.000000,0> translate<94.225000,0.000000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,33.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,33.070000>}
box{<0,0,-0.063500><2.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.225000,0.000000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,33.070000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,32.270000>}
box{<0,0,-0.063500><0.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<96.925000,0.000000,32.270000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,32.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,30.470000>}
box{<0,0,-0.063500><1.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<96.925000,0.000000,30.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,30.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,29.670000>}
box{<0,0,-0.063500><0.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<96.925000,0.000000,29.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,29.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,29.670000>}
box{<0,0,-0.063500><2.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.225000,0.000000,29.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.325000,0.000000,31.370000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.825000,0.000000,31.370000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.325000,0.000000,31.370000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,32.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,32.270000>}
box{<0,0,-0.063500><2.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.225000,0.000000,32.270000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.225000,0.000000,30.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<96.925000,0.000000,30.470000>}
box{<0,0,-0.063500><2.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.225000,0.000000,30.470000> }
//U$4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<3.810000,0.000000,77.470000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<3.810000,0.000000,77.470000>}
difference{
cylinder{<3.810000,0,77.470000><3.810000,0.036000,77.470000>3.505200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,77.470000><3.810000,0.135000,77.470000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,77.470000><3.810000,0.036000,77.470000>0.990600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,77.470000><3.810000,0.135000,77.470000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,77.470000><3.810000,0.036000,77.470000>1.701600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,77.470000><3.810000,0.135000,77.470000>1.498400 translate<0,0.000000,0>}}
//U$5 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<97.790000,0.000000,77.470000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<97.790000,0.000000,77.470000>}
difference{
cylinder{<97.790000,0,77.470000><97.790000,0.036000,77.470000>3.505200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,77.470000><97.790000,0.135000,77.470000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,77.470000><97.790000,0.036000,77.470000>0.990600 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,77.470000><97.790000,0.135000,77.470000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,77.470000><97.790000,0.036000,77.470000>1.701600 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,77.470000><97.790000,0.135000,77.470000>1.498400 translate<0,0.000000,0>}}
//U$6 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<97.790000,0.000000,3.810000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<97.790000,0.000000,3.810000>}
difference{
cylinder{<97.790000,0,3.810000><97.790000,0.036000,3.810000>3.505200 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,3.810000><97.790000,0.135000,3.810000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,3.810000><97.790000,0.036000,3.810000>0.990600 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,3.810000><97.790000,0.135000,3.810000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<97.790000,0,3.810000><97.790000,0.036000,3.810000>1.701600 translate<0,0.000000,0>}
cylinder{<97.790000,-0.1,3.810000><97.790000,0.135000,3.810000>1.498400 translate<0,0.000000,0>}}
//U$7 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<3.810000,0.000000,3.810000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<3.810000,0.000000,3.810000>}
difference{
cylinder{<3.810000,0,3.810000><3.810000,0.036000,3.810000>3.505200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.810000><3.810000,0.135000,3.810000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,3.810000><3.810000,0.036000,3.810000>0.990600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.810000><3.810000,0.135000,3.810000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,3.810000><3.810000,0.036000,3.810000>1.701600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.810000><3.810000,0.135000,3.810000>1.498400 translate<0,0.000000,0>}}
//U$8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.875000,0.000000,9.320000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.875000,0.000000,33.020000>}
box{<0,0,-0.063500><23.700000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.875000,0.000000,33.020000> }
//X-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,72.390000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,72.390000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,78.740000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.850000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.850000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,80.010000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,71.120000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.800000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,80.010000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.120000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,78.740000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,77.978000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.928000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,77.978000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.992000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,78.740000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,78.740000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.928000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.928000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.340000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.800000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.325000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.340000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.595000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.580000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.850000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.580000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.801000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,80.010000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.928000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.912000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,78.740000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,78.740000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.388000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.801000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,79.502000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-53.126596,0> translate<58.420000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,80.010000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,53.126596,0> translate<55.499000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.880000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.912000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.928000,0.000000,78.994000>}
box{<0,0,-0.025400><1.016000,0.036000,0.025400> rotate<0,0.000000,0> translate<57.912000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.928000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.388000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.816000,0.000000,78.994000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<51.816000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.816000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.816000,0.000000,72.136000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<51.816000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.816000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,72.136000>}
box{<0,0,-0.025400><18.288000,0.036000,0.025400> rotate<0,0.000000,0> translate<51.816000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,78.994000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<70.104000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.992000,0.000000,78.994000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,0.000000,0> translate<62.992000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.912000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,79.502000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.388000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,80.010000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.405000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.405000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,79.883000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.405000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,79.883000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.675000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.675000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,80.010000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.675000,0.000000,80.010000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<63.500000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.040000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.960000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<55.880000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<58.420000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<63.500000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.040000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.960000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<55.880000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<58.420000,0.000000,76.835000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.365000,0.000000,16.455000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,16.455000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.365000,0.000000,16.455000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,16.455000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,23.155000>}
box{<0,0,-0.127000><6.700000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.365000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,24.255000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,25.855000>}
box{<0,0,-0.127000><1.600000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.365000,0.000000,25.855000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.365000,0.000000,25.855000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.365000,0.000000,25.855000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<41.365000,0.000000,25.855000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.365000,0.000000,25.855000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.365000,0.000000,16.455000>}
box{<0,0,-0.127000><9.400000,0.036000,0.127000> rotate<0,-90.000000,0> translate<84.365000,0.000000,16.455000> }
object{ARC(1.664300,0.254000,212.735226,327.264774,0.036000) translate<86.465000,0.000000,18.655000>}
object{ARC(1.664300,0.254000,32.735226,147.264774,0.036000) translate<86.465000,0.000000,18.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<87.865000,0.000000,17.755000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<87.865000,0.000000,19.555000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<87.865000,0.000000,19.555000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<85.165000,0.000000,17.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.465000,0.000000,17.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<84.465000,0.000000,17.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<85.165000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.465000,0.000000,19.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<84.465000,0.000000,19.655000> }
object{ARC(1.664300,0.254000,32.735226,147.264774,0.036000) translate<39.265000,0.000000,18.655000>}
object{ARC(1.664300,0.254000,212.735226,327.264774,0.036000) translate<39.265000,0.000000,18.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.865000,0.000000,19.555000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.865000,0.000000,17.755000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<37.865000,0.000000,17.755000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.565000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.265000,0.000000,19.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<40.565000,0.000000,19.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.565000,0.000000,17.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.265000,0.000000,17.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<40.565000,0.000000,17.655000> }
object{ARC(0.550000,0.254000,90.000000,270.000000,0.036000) translate<41.365000,0.000000,23.705000>}
//X2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,79.883000>}
box{<0,0,-0.127000><0.063500,0.036000,0.127000> rotate<0,-90.000000,0> translate<76.962000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,75.819000>}
box{<0,0,-0.127000><4.064000,0.036000,0.127000> rotate<0,-90.000000,0> translate<76.962000,0.000000,75.819000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,74.231500>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,-90.000000,0> translate<76.962000,0.000000,74.231500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,74.231500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,74.231500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<76.962000,0.000000,74.231500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,74.231500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,75.819000>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,90.000000,0> translate<89.662000,0.000000,75.819000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,79.883000>}
box{<0,0,-0.127000><4.064000,0.036000,0.127000> rotate<0,90.000000,0> translate<89.662000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,79.946500>}
box{<0,0,-0.127000><0.063500,0.036000,0.127000> rotate<0,90.000000,0> translate<89.662000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<86.804500,0.000000,79.946500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<86.804500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<86.804500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<86.804500,0.000000,80.899000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<86.804500,0.000000,80.899000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<86.804500,0.000000,80.899000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.819500,0.000000,80.899000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<79.819500,0.000000,80.899000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.819500,0.000000,80.899000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.819500,0.000000,79.946500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<79.819500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.819500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,79.946500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<76.962000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.027000,0.000000,74.866500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.027000,0.000000,79.311500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,90.000000,0> translate<89.027000,0.000000,79.311500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.597000,0.000000,74.866500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.597000,0.000000,79.311500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,90.000000,0> translate<77.597000,0.000000,79.311500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.027000,0.000000,74.866500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.597000,0.000000,74.866500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<77.597000,0.000000,74.866500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.027000,0.000000,79.311500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.169500,0.000000,79.311500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<86.169500,0.000000,79.311500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.169500,0.000000,79.311500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<80.454500,0.000000,79.311500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<80.454500,0.000000,79.311500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<80.454500,0.000000,79.311500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.597000,0.000000,79.311500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<77.597000,0.000000,79.311500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<80.454500,0.000000,80.264000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.169500,0.000000,80.264000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<80.454500,0.000000,80.264000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.169500,0.000000,79.311500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.169500,0.000000,80.264000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,90.000000,0> translate<86.169500,0.000000,80.264000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<80.454500,0.000000,79.311500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<80.454500,0.000000,80.264000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,90.000000,0> translate<80.454500,0.000000,80.264000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.218000,0.000000,75.819000>}
box{<0,0,-0.127000><3.556000,0.036000,0.127000> rotate<0,0.000000,0> translate<89.662000,0.000000,75.819000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.218000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.218000,0.000000,79.883000>}
box{<0,0,-0.127000><4.064000,0.036000,0.127000> rotate<0,90.000000,0> translate<93.218000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.218000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<89.662000,0.000000,79.883000>}
box{<0,0,-0.127000><3.556000,0.036000,0.127000> rotate<0,0.000000,0> translate<89.662000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<73.406000,0.000000,75.819000>}
box{<0,0,-0.127000><3.556000,0.036000,0.127000> rotate<0,0.000000,0> translate<73.406000,0.000000,75.819000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<73.406000,0.000000,75.819000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<73.406000,0.000000,79.883000>}
box{<0,0,-0.127000><4.064000,0.036000,0.127000> rotate<0,90.000000,0> translate<73.406000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<73.406000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<76.962000,0.000000,79.883000>}
box{<0,0,-0.127000><3.556000,0.036000,0.127000> rotate<0,0.000000,0> translate<73.406000,0.000000,79.883000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-180.000000,0> translate<84.582000,0.000000,77.089000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-180.000000,0> translate<87.122000,0.000000,77.089000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-180.000000,0> translate<79.502000,0.000000,77.089000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-180.000000,0> translate<82.042000,0.000000,77.089000>}
//X4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.775000,0.000000,58.235000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.775000,0.000000,70.035000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.775000,0.000000,70.035000> }
//X5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.885000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<97.155000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.885000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.885000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,15.875000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,-44.997030,0> translate<95.885000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,15.875000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,44.997030,0> translate<95.885000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,23.495000>}
box{<0,0,-0.076200><11.430000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.330000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,23.495000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,23.495000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,12.065000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.330000,0.000000,12.065000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,12.700000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.726000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,12.700000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,22.860000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,22.860000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.726000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.885000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<97.155000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.885000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.885000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,20.955000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,-44.997030,0> translate<95.885000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.155000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.885000,0.000000,20.955000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,44.997030,0> translate<95.885000,0.000000,20.955000> }
object{ARC(2.667000,0.152400,306.869898,360.000000,0.036000) translate<97.409000,0.000000,15.240000>}
object{ARC(2.667000,0.152400,0.000000,53.130102,0.036000) translate<97.409000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,18.161000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<99.060000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,13.131800>}
box{<0,0,-0.076200><0.431800,0.036000,0.076200> rotate<0,90.000000,0> translate<99.060000,0.000000,13.131800> }
object{ARC(2.667000,0.152400,306.869898,360.000000,0.036000) translate<97.409000,0.000000,20.320000>}
object{ARC(2.667000,0.152400,0.000000,53.130102,0.036000) translate<97.409000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,22.428200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.060000,0.000000,22.860000>}
box{<0,0,-0.076200><0.431800,0.036000,0.076200> rotate<0,90.000000,0> translate<99.060000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,14.732000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.726000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,15.748000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.726000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,19.812000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.726000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,20.828000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.726000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,22.860000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.726000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,14.732000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.948000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,15.748000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.948000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,19.812000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.948000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,20.828000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.948000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,23.495000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<91.948000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,19.812000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,20.828000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,14.478000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.456000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,19.558000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.456000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,19.812000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<91.948000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.558000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,19.812000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<93.472000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.002000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<93.472000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,12.700000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<93.472000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,21.082000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<91.948000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,23.495000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.456000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,21.082000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,20.828000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<93.472000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,22.860000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.472000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,15.748000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,14.732000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<91.948000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,14.478000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.002000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,16.002000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<91.948000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.948000,0.000000,14.732000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<91.948000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,14.732000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<93.472000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.726000,0.000000,15.748000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<93.472000,0.000000,16.002000> }
//Y-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,72.390000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.115000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,72.390000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.115000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,78.740000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,80.010000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,71.120000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.845000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,80.010000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.165000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,78.740000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.115000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,77.978000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,77.978000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.037000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,78.740000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.037000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,78.740000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.115000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.115000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.385000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.370000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.640000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.895000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.625000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.640000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.846000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,80.010000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.957000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,78.740000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.433000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,78.740000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,79.502000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-53.126596,0> translate<37.465000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,80.010000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,53.126596,0> translate<34.544000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<36.957000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.973000,0.000000,78.994000>}
box{<0,0,-0.025400><1.016000,0.036000,0.025400> rotate<0,0.000000,0> translate<36.957000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<35.433000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.861000,0.000000,78.994000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<30.861000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.861000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.861000,0.000000,72.136000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<30.861000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<30.861000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.149000,0.000000,72.136000>}
box{<0,0,-0.025400><18.288000,0.036000,0.025400> rotate<0,0.000000,0> translate<30.861000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.149000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.149000,0.000000,78.994000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<49.149000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.149000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.037000,0.000000,78.994000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,0.000000,0> translate<42.037000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.037000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.957000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.433000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,79.502000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,80.010000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.450000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,79.883000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,79.883000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,80.010000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.720000,0.000000,80.010000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<42.545000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.085000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.005000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.925000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<37.465000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<42.545000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.085000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.005000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.925000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<37.465000,0.000000,76.835000>}
//Z-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,72.390000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,72.390000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,78.740000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,80.010000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,71.120000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.890000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,80.010000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.210000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,78.740000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,77.978000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.018000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,77.978000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.082000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,78.740000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.082000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.082000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,78.740000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.018000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.018000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,70.866000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.430000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.890000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.415000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.415000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.430000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.685000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,70.866000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.670000,0.000000,70.866000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,70.866000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,71.120000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.670000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,71.120000>}
box{<0,0,-0.076200><6.985000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,80.010000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.018000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.002000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,78.740000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.002000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,78.994000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.478000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,78.740000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.478000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,79.502000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-53.126596,0> translate<16.510000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,80.010000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,53.126596,0> translate<13.589000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.970000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.002000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.018000,0.000000,78.994000>}
box{<0,0,-0.025400><1.016000,0.036000,0.025400> rotate<0,0.000000,0> translate<16.002000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.018000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<14.478000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.906000,0.000000,78.994000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.906000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.906000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.906000,0.000000,72.136000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.906000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.906000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.194000,0.000000,72.136000>}
box{<0,0,-0.025400><18.288000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.906000,0.000000,72.136000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.194000,0.000000,72.136000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.194000,0.000000,78.994000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<28.194000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.194000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<21.082000,0.000000,78.994000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,0.000000,0> translate<21.082000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,80.010000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.082000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.002000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.002000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,79.502000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.478000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,79.502000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,79.502000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.478000,0.000000,79.502000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,80.010000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.082000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,80.010000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,80.010000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,79.883000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,79.883000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.495000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,79.883000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.765000,0.000000,79.883000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,80.010000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,80.010000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,80.010000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.590000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.130000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.050000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.970000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.510000,0.000000,74.295000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.590000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.130000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.050000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.970000,0.000000,76.835000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.510000,0.000000,76.835000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MOTHERBOARD(-50.800000,0,-40.640000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//5V		0805RND
//5VSB		0805RND
//12V		0805RND
//C1	100n	C0805RND
//C2	22p	C0805RND
//C3	22p	C0805RND
//C4	100n	C0805RND
//C5	100n	C0805RND
//C6	100u	SMC_D
//C7	100u	SMC_D
//C8	100n	C0805RND
//C11	22p	C0805RND
//C12	100n	C0805RND
//C13	100n	C0805RND
//C14	100n	C0805RND
//C15	100n	C0805RND
//C16	100n	C0805RND
//C17	100n	C0805RND
//C18	100u	SMC_D
//DEBUG		0805RND
//F1	500mA	L1812
//J1		555164-1
//J2		555164-1
//J3		555164-1
//J4		555164-1
//R1	1K	R0805RND
//R2	10k	R0805RND
//R3	10k	R0805RND
//R4	10k	R0805RND
//R5	10K	R0805RND
//R6	10k	R0805RND
//R7	1k	R0805RND
//R8	1K	R0805RND
//R9	1k	R0805RND
//R10	10k	R0805RND
//R11	1K	RCL_0805RND
//R12	1K	RCL_0805RND
//R13	1K	R0805RND
//R14	1K	R0805RND
//RX		0805RND
//SG1	F/CM12P	F/CM12P
//TX		0805RND
//U$1	SPDT	10SP001
//U$4		3,0
//U$5		3,0
//U$6		3,0
//U$7		3,0
//U$8	MINISDCARD	DM2A
//X1	5566-20	5566-20
//X2	C-GRID-04-70543	70543-04
//X4		PN61729
