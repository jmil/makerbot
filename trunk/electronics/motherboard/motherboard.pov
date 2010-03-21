//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/motherboard/motherboard.brd
//1/3/10 8:09 PM

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
#declare global_seed=seed(989);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.500000,
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
	1.000000,
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
cylinder{<41.021000,1,3.048000><41.021000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<52.451000,1,3.048000><52.451000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<56.896000,1,3.048000><56.896000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<68.326000,1,3.048000><68.326000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<72.771000,1,3.048000><72.771000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<84.201000,1,3.048000><84.201000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<25.146000,1,3.048000><25.146000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<36.576000,1,3.048000><36.576000,-5,3.048000>1.625600 texture{col_hls}}
cylinder{<3.810000,1,77.470000><3.810000,-5,77.470000>1.500000 texture{col_hls}}
cylinder{<97.790000,1,77.470000><97.790000,-5,77.470000>1.500000 texture{col_hls}}
cylinder{<97.790000,1,3.810000><97.790000,-5,3.810000>1.500000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.500000 texture{col_hls}}
cylinder{<36.725000,1,18.665000><36.725000,-5,18.665000>1.500000 texture{col_hls}}
cylinder{<83.925000,1,18.665000><83.925000,-5,18.665000>1.500000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<3.175000,0.095000,49.245000><3.175000,-1.595000,49.245000>1.100000 texture{col_hls}}
cylinder{<3.175000,0.095000,61.245000><3.175000,-1.595000,61.245000>1.100000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_A_AXIS) #declare global_pack_A_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.559500,0.000000,76.517500>}#end		//Shrouded Header 6Pin A-AXIS  ML6
#ifndef(pack_B_AXIS) #declare global_pack_B_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.811500,0.000000,76.517500>}#end		//Shrouded Header 6Pin B-AXIS  ML6
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<60.952800,0.000000,35.629200>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<57.912000,0.000000,67.564000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C2 22p 0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.008000,0.000000,67.564000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 22p 0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.907000,0.000000,38.901000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<78.057000,0.000000,35.585000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_ELKO_3MM5_8MM("100uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<77.960000,0.000000,30.320000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C6 100uF E3,5-8
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_ELKO_3MM5_8MM("100uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<69.580000,0.000000,30.320000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C7 100uF E3,5-8
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<69.415000,0.000000,35.514000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C8 100n 0805
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_ELKO_3MM5_8MM("100uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<61.065000,0.000000,30.320000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C9 100uF E3,5-8
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<7.670800,0.000000,62.788800>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 22p 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.670800,0.000000,69.672200>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.065000,0.000000,45.339000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C14 100n 0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.271500,0.000000,55.054500>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C15 100n 0805
#ifndef(pack_C16) #declare global_pack_C16=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.129000,0.000000,54.927500>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C16 100n 0805
#ifndef(pack_D12) #declare global_pack_D12=yes; object {PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<72.009000,0.000000,58.801000>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) D12  1X01
#ifndef(pack_D24) #declare global_pack_D24=yes; object {PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.005000,0.000000,39.116000>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) D24  1X01
#ifndef(pack_I2C) #declare global_pack_I2C=yes; object {PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<42.037000,0.000000,66.040000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) I2C  1X04
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO8("SN75176ASOIC","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<34.417000,0.000000,59.690000>translate<0,0.035000,0> }#end		//SMD IC SO8 Package IC1 SN75176ASOIC SO08
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {QFP_TQFP_100_050MM("ATMEGA1280-16AU","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.260000,0.000000,48.895000>translate<0,0.035000,0> }#end		//TQFP-100 IC3 ATMEGA1280-16AU TQFP100
#ifndef(pack_IC4) #declare global_pack_IC4=yes; object {IC_SMD_SSOP28("FT232RL","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.240000,0.000000,64.008000>translate<0,0.035000,0> }#end		//SSOP28 IC4 FT232RL SSOP28
#ifndef(pack_ICSP) #declare global_pack_ICSP=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.664400,0.000000,29.972000>}#end		//Shrouded Header 6Pin ICSP  ML6
#ifndef(pack_INTERFACE) #declare global_pack_INTERFACE=yes; object {CON_DIS_WS20G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<79.832200,0.000000,53.873400>}#end		//Shrouded Header 20Pin INTERFACE  ML20
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<20.701000,0.000000,10.668000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP2  1X02
#ifndef(pack_JP9) #declare global_pack_JP9=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<84.582000,0.000000,31.877000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP9  1X02
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {SPC_XTAL_5MM("16MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<60.960000,0.000000,63.881000>}#end		//Quarz 4,9MM Q2 16MHz HC49/S
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<58.597800,0.000000,59.842400>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 1K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<45.085000,0.000000,68.834000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 10k 0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.958000,0.000000,63.246000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 10k 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<8.483600,0.000000,32.359600>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10k 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<7.670800,0.000000,67.360800>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 10K 0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.082000,0.000000,50.609500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R7 1k 0805
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<53.495000,0.000000,27.739000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R8 1K 0805
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<18.605500,0.000000,50.609500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R9 1k 0805
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<24.333200,0.000000,63.754000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R11 1K 0805
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.123400,0.000000,63.754000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R12 1K 0805
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<53.495000,0.000000,30.152000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R13 1K 0805
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<53.495000,0.000000,32.565000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R14 1K 0805
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.401000,0.000000,53.340000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R15 10K 0805
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<35.610800,0.000000,53.314600>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R16 10K 0805
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.417000,0.000000,64.770000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R17  0805
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.368000,0.000000,19.685000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R20 3.3K 0805
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,16.764000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R21 3.3K 0805
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.861000,0.000000,16.764000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R22 3.3K 0805
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.416000,0.000000,19.685000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R23 1.8K 0805
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.289000,0.000000,16.764000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R24 1.8K 0805
#ifndef(pack_R25) #declare global_pack_R25=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<33.020000,0.000000,16.764000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R25 1.8K 0805
#ifndef(pack_X_AXIS) #declare global_pack_X_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<79.502000,0.000000,76.517500>}#end		//Shrouded Header 6Pin X-AXIS  ML6
#ifndef(pack_X5) #declare global_pack_X5=yes; object {CON_PHOENIX_508_MSTBV_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<97.536000,0.000000,13.335000>}#end		//Connector PHOENIX type MSTBV vertical 2 pins X5 MSTBV2 MSTBV2
#ifndef(pack_Y_AXIS) #declare global_pack_Y_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<63.500000,0.000000,76.517500>}#end		//Shrouded Header 6Pin Y-AXIS  ML6
#ifndef(pack_Z_AXIS) #declare global_pack_Z_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<47.498000,0.000000,76.517500>}#end		//Shrouded Header 6Pin Z-AXIS  ML6
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<50.193000,0.000000,27.739000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<47.907000,0.000000,27.739000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<50.193000,0.000000,30.152000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<47.907000,0.000000,30.152000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<50.193000,0.000000,32.565000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<47.907000,0.000000,32.565000>}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.099500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.099500,0,75.247500> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.559500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.559500,0,75.247500> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.019500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.019500,0,75.247500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.351500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.351500,0,75.247500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<15.811500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<15.811500,0,75.247500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.271500,0,77.787500> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.271500,0,75.247500> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<60.052800,0.000000,35.629200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<61.852800,0.000000,35.629200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.812000,0.000000,67.564000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.012000,0.000000,67.564000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<63.108000,0.000000,67.564000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<64.908000,0.000000,67.564000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.807000,0.000000,38.901000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.007000,0.000000,38.901000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<78.957000,0.000000,35.585000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<77.157000,0.000000,35.585000>}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<79.738000,0,30.320000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<76.182000,0,30.320000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<71.358000,0,30.320000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<67.802000,0,30.320000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<70.315000,0.000000,35.514000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<68.515000,0.000000,35.514000>}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<62.843000,0,30.320000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<59.287000,0,30.320000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.770800,0.000000,62.788800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.570800,0.000000,62.788800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.570800,0.000000,69.672200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.770800,0.000000,69.672200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.965000,0.000000,45.339000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.165000,0.000000,45.339000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.271500,0.000000,54.154500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.271500,0.000000,55.954500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.129000,0.000000,54.027500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.129000,0.000000,55.827500>}
#ifndef(global_pack_D12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<72.009000,0,58.801000> texture{col_thl}}
#ifndef(global_pack_D24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.005000,0,39.116000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<62.103000,0.000000,59.842400>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<64.389000,0.000000,59.842400>}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,23.749000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,23.749000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,23.749000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,23.749000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.319000,0.000000,47.516500>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.319000,0.000000,51.416500>}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<42.037000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<42.037000,0,64.770000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<42.037000,0,67.310000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<42.037000,0,69.850000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.512000,0.000000,57.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.782000,0.000000,57.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.052000,0.000000,57.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.322000,0.000000,57.090000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.322000,0.000000,62.290000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.052000,0.000000,62.290000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.782000,0.000000,62.290000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.512000,0.000000,62.290000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.233000,0.000000,21.656000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.233000,0.000000,22.606000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.233000,0.000000,23.556000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.233000,0.000000,23.556000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.233000,0.000000,22.606000>}
object{TOOLS_PCB_SMD(0.609600,0.304800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.233000,0.000000,21.656000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,42.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,43.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,43.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,44.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,44.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,45.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,45.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,46.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,46.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,47.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,47.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,48.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,48.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,49.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,49.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,50.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,50.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,51.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,51.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,52.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,52.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,53.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,53.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,54.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.010000,0.000000,54.895000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<54.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.760000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.260000,0.000000,56.645000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,54.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,54.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,53.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,53.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,52.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,52.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,51.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,51.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,50.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,50.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,49.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,49.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,48.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,48.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,47.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,47.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,46.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,46.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,45.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,45.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,44.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,44.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,43.895000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,43.395000>}
object{TOOLS_PCB_SMD(0.270000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.510000,0.000000,42.895000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<46.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<51.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.760000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(1.500000,0.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<54.260000,0.000000,41.145000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<19.465000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<18.815000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<18.165000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<17.515000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<16.865000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<16.215000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<15.565000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<14.915000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<14.265000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<13.615000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<12.965000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<12.315000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<11.665000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<11.015000,0.000000,67.633000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<11.015000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<11.665000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<12.315000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<12.965000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<13.615000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<14.265000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<14.915000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<15.565000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<16.215000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<16.865000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<17.515000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<18.165000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<18.815000,0.000000,60.383000>}
object{TOOLS_PCB_SMD(0.381000,1.498600,0.037000,20) rotate<0,-180.000000,0> texture{col_pds} translate<19.465000,0.000000,60.383000>}
#ifndef(global_pack_IC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<90.297000,0,10.287000> texture{col_thl}}
#ifndef(global_pack_IC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.000000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<90.297000,0,7.747000> texture{col_thl}}
#ifndef(global_pack_IC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<90.297000,0,12.827000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.394400,0,32.512000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.934400,0,32.512000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.394400,0,29.972000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.934400,0,29.972000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.394400,0,27.432000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.934400,0,27.432000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,42.443400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,42.443400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,44.983400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,44.983400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,47.523400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,47.523400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,50.063400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,50.063400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,52.603400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,52.603400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,55.143400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,55.143400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,57.683400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,57.683400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,60.223400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,60.223400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,62.763400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,62.763400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.102200,0,65.303400> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.562200,0,65.303400> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<42.291000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.561000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<44.831000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<46.101000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.371000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<48.641000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<49.911000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<51.181000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<58.166000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<59.436000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<60.706000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.976000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.246000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<64.516000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<65.786000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<67.056000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<74.041000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<75.311000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<76.581000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.851000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<79.121000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<80.391000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<81.661000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<82.931000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<26.416000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<27.686000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<28.956000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<30.226000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<31.496000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<32.766000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<34.036000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.397000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.306000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<20.701000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<20.701000,0,11.938000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<84.582000,0,30.607000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<84.582000,0,33.147000> texture{col_thl}}
#ifndef(global_pack_PIEZO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<26.745000,0,41.656000> texture{col_thl}}
#ifndef(global_pack_PIEZO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<20.245000,0,41.656000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<58.547000,0,63.881000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.373000,0,63.881000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<57.697800,0.000000,59.842400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<59.497800,0.000000,59.842400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.085000,0.000000,69.734000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<45.085000,0.000000,67.934000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.958000,0.000000,62.346000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.958000,0.000000,64.146000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.483600,0.000000,33.259600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.483600,0.000000,31.459600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.770800,0.000000,67.360800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.570800,0.000000,67.360800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.082000,0.000000,51.509500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.082000,0.000000,49.709500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.395000,0.000000,27.739000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.595000,0.000000,27.739000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.605500,0.000000,51.509500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.605500,0.000000,49.709500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.333200,0.000000,64.654000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.333200,0.000000,62.854000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.123400,0.000000,64.654000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.123400,0.000000,62.854000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.395000,0.000000,30.152000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.595000,0.000000,30.152000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<54.395000,0.000000,32.565000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.595000,0.000000,32.565000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.401000,0.000000,54.240000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.401000,0.000000,52.440000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.610800,0.000000,54.214600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.610800,0.000000,52.414600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.317000,0.000000,64.770000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.517000,0.000000,64.770000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.468000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.268000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.690000,0.000000,16.764000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.490000,0.000000,16.764000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.861000,0.000000,17.664000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.861000,0.000000,15.864000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.516000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.316000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.389000,0.000000,16.764000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.189000,0.000000,16.764000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.020000,0.000000,15.864000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.020000,0.000000,17.664000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<21.082000,0.000000,53.911500>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<21.082000,0.000000,56.197500>}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<2.184400,0,70.840600> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<2.184400,0,66.319400> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<4.673600,0,72.085200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<4.673600,0,65.074800> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<18.605500,0.000000,53.911500>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<18.605500,0.000000,56.197500>}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,43.025000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,41.525000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,40.025000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,43.025000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,41.525000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,40.025000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,31.853000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,30.353000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.013200,0,28.853000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,31.853000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,30.353000> texture{col_thl}}
#ifndef(global_pack_U_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.013200,0,28.853000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.953000,0.000000,14.047000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<7.353000,0.000000,15.147000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.953000,0.000000,16.247000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.753000,0.000000,17.347000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.953000,0.000000,18.447000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.753000,0.000000,19.547000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.953000,0.000000,20.647000>}
object{TOOLS_PCB_SMD(0.800000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.953000,0.000000,21.747000>}
object{TOOLS_PCB_SMD(1.800000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.253000,0.000000,20.937000>}
object{TOOLS_PCB_SMD(1.800000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.253000,0.000000,15.237000>}
object{TOOLS_PCB_SMD(1.400000,1.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<3.103000,0.000000,9.387000>}
object{TOOLS_PCB_SMD(1.400000,1.900000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.103000,0.000000,22.537000>}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<82.042000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<82.042000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<79.502000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<79.502000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<76.962000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<76.962000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,62.738000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,62.738000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,62.738000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,62.738000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,70.485000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,70.485000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,70.485000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,70.485000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<41.425000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<45.625000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<49.825000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<54.025000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<58.225000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<62.425000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<66.625000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<70.825000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<75.025000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<79.225000,0,23.705000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<41.425000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<45.625000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<49.825000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<54.025000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<58.225000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<62.425000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<66.625000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<70.825000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<75.025000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<79.225000,0,18.205000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.885000,0,53.995000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.885000,0,56.495000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<5.885000,0,56.495000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<5.885000,0,53.995000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.216000,2.200000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.175000,0,61.245000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.216000,2.200000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.175000,0,49.245000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.095600,1.397000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<97.536000,0,10.795000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.095600,1.397000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<97.536000,0,15.875000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<66.040000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<66.040000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<60.960000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<60.960000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,47.244000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,47.244000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,47.244000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,47.244000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,54.991000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,54.991000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,54.991000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,54.991000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.038000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.038000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.498000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.498000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.958000,0,77.787500> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.958000,0,75.247500> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<91.059000,0,39.243000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<93.599000,0,39.243000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<96.139000,0,39.243000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<98.679000,0,39.243000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<46.990000,0,70.612000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<43.434000,0,60.198000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<16.510000,0,49.784000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<13.970000,0,62.230000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<17.018000,0,69.850000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<43.180000,0,50.546000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<43.688000,0,43.942000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<55.626000,0,41.656000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<53.086000,0,47.244000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<52.070000,0,54.102000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<60.960000,0,39.624000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<31.877000,0,52.070000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<7.620000,0,36.068000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<27.051000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<31.877000,0,64.770000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<54.356000,0,34.544000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<70.358000,0,37.465000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<47.244000,0,43.942000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<24.257000,0,59.436000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<22.479000,0,60.325000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<49.022000,0,44.958000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<64.135000,0,45.339000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<28.575000,0,52.705000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<29.489400,0,54.305200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<20.828000,0,34.544000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<26.187400,0,55.626000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<27.305000,0,56.515000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<30.353000,0,55.753000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<36.322000,0,50.419000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<37.465000,0,52.070000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<38.481000,0,53.721000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<45.339000,0,52.070000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<46.736000,0,53.213000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<45.212000,0,54.737000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<43.815000,0,54.737000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<28.321000,0,57.912000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<42.291000,0,54.864000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<39.497000,0,55.753000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<39.497000,0,58.928000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<47.117000,0,54.737000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<8.001000,0,45.974000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<10.033000,0,54.102000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<13.589000,0,58.039000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<14.986000,0,58.039000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<17.526000,0,62.230000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<15.494000,0,65.786000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<45.339000,0,43.307000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<42.545000,0,48.895000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<50.546000,0,54.864000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<53.975000,0,48.641000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<60.960000,0,67.564000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<66.421000,0,59.817000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<65.278000,0,35.560000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<8.636000,0,19.558000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<36.957000,0,64.770000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<17.399000,0,11.176000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<19.304000,0,14.986000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<20.574000,0,19.685000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<8.509000,0,29.464000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<52.832000,0,43.180000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<19.939000,0,22.606000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<26.162000,0,23.368000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<47.879000,0,39.370000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<45.339000,0,34.163000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<34.925000,0,50.419000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<5.080000,0,10.160000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<12.700000,0,17.399000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<28.829000,0,16.256000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<49.022000,0,51.181000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<26.416000,0,29.845000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<47.244000,0,49.530000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<42.799000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<36.830000,0,40.259000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<17.780000,0,32.639000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<19.558000,0,33.020000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.889000,0.381000,1,16,1,0) translate<44.958000,0,46.990000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.184400,0.000000,66.192400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.184400,0.000000,66.319400>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.184400,0.000000,66.319400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,23.622000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.540000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,24.003000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.540000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.103000,0.000000,9.387000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.418000,0.000000,9.387000>}
box{<0,0,-0.127000><0.315000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.103000,0.000000,9.387000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,22.498000>}
box{<0,0,-0.127000><1.543000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.064000,0.000000,22.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,22.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.103000,0.000000,22.537000>}
box{<0,0,-0.127000><0.055154,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.064000,0.000000,22.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.184400,0.000000,66.192400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,68.326000>}
box{<0,0,-0.127000><3.017366,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.184400,0.000000,66.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.013200,0.000000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.013200,0.000000,30.353000>}
box{<0,0,-0.203200><2.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.013200,0.000000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.013200,0.000000,31.853000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.013200,0.000000,31.853000>}
box{<0,0,-0.203200><2.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.013200,0.000000,31.853000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.013200,0.000000,43.025000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.013200,0.000000,43.025000>}
box{<0,0,-0.304800><2.000000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.013200,0.000000,43.025000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.013200,0.000000,43.025000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.013200,0.000000,43.875200>}
box{<0,0,-0.304800><0.850200,0.035000,0.304800> rotate<0,90.000000,0> translate<5.013200,0.000000,43.875200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.418000,0.000000,9.387000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,0.000000,10.160000>}
box{<0,0,-0.127000><1.832968,0.035000,0.127000> rotate<0,-24.941600,0> translate<3.418000,0.000000,9.387000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.013200,0.000000,41.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.144200,0.000000,41.656000>}
box{<0,0,-0.304800><0.185262,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.013200,0.000000,41.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.013200,0.000000,31.853000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.310000,0.000000,31.853000>}
box{<0,0,-0.203200><0.296800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.013200,0.000000,31.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.345000,0.000000,19.674000>}
box{<0,0,-0.127000><1.811608,0.035000,0.127000> rotate<0,44.997030,0> translate<4.064000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,0.000000,17.272000>}
box{<0,0,-0.127000><4.490128,0.035000,0.127000> rotate<0,44.997030,0> translate<2.540000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.013200,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,30.353000>}
box{<0,0,-0.203200><0.828800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.013200,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,0.000000,56.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,0.000000,57.320000>}
box{<0,0,-0.127000><0.825000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.885000,0.000000,57.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.013200,0.000000,43.875200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,45.085000>}
box{<0,0,-0.304800><1.710916,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.013200,0.000000,43.875200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,47.244000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,90.000000,0> translate<6.223000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.885000,0.000000,57.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,57.912000>}
box{<0,0,-0.127000><0.837214,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.885000,0.000000,57.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.574000,0.000000,17.272000>}
box{<0,0,-0.127000><0.859000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.715000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,68.326000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.643000,0.000000,68.326000>}
box{<0,0,-0.127000><2.325000,0.035000,0.127000> rotate<0,0.000000,0> translate<4.318000,0.000000,68.326000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.574000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.753000,0.000000,17.347000>}
box{<0,0,-0.127000><0.194077,0.035000,0.127000> rotate<0,-22.731911,0> translate<6.574000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.345000,0.000000,19.674000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.753000,0.000000,19.547000>}
box{<0,0,-0.127000><1.413716,0.035000,0.127000> rotate<0,5.153727,0> translate<5.345000,0.000000,19.674000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.693800,0.000000,61.632200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,62.788800>}
box{<0,0,-0.127000><1.159160,0.035000,0.127000> rotate<0,-86.185498,0> translate<6.693800,0.000000,61.632200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.693800,0.000000,65.188200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,62.788800>}
box{<0,0,-0.127000><2.400635,0.035000,0.127000> rotate<0,88.156113,0> translate<6.693800,0.000000,65.188200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.643000,0.000000,68.326000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,67.360800>}
box{<0,0,-0.127000><0.973624,0.035000,0.127000> rotate<0,82.452024,0> translate<6.643000,0.000000,68.326000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,67.360800>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.770800,0.000000,67.360800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,67.360800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.770800,0.000000,69.672200>}
box{<0,0,-0.127000><2.311400,0.035000,0.127000> rotate<0,90.000000,0> translate<6.770800,0.000000,69.672200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,-1.535000,30.353000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,28.956000>}
box{<0,0,-0.203200><1.727387,0.035000,0.203200> rotate<0,53.969065,0> translate<5.842000,-1.535000,30.353000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,28.956000>}
box{<0,0,-0.203200><18.034000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.858000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.144200,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.858000,0.000000,41.656000>}
box{<0,0,-0.304800><1.713800,0.035000,0.304800> rotate<0,0.000000,0> translate<5.144200,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.858000,0.000000,47.879000>}
box{<0,0,-0.304800><0.898026,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.223000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.310000,0.000000,31.853000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,33.528000>}
box{<0,0,-0.203200><2.460250,0.035000,0.203200> rotate<0,-42.905327,0> translate<5.310000,0.000000,31.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.753000,0.000000,19.547000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.272000,0.000000,19.558000>}
box{<0,0,-0.127000><0.519117,0.035000,0.127000> rotate<0,-1.214099,0> translate<6.753000,0.000000,19.547000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.532000,0.000000,33.528000>}
box{<0,0,-0.203200><0.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.112000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.858000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,40.894000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<6.858000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,40.894000>}
box{<0,0,-0.304800><4.826000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.693800,0.000000,61.632200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,0.000000,60.706000>}
box{<0,0,-0.127000><1.309845,0.035000,0.127000> rotate<0,44.997030,0> translate<6.693800,0.000000,61.632200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.013200,-1.535000,31.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.831200,-1.535000,34.544000>}
box{<0,0,-0.127000><3.896486,0.035000,0.127000> rotate<0,-43.676501,0> translate<5.013200,-1.535000,31.853000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.885000,0.000000,53.995000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001000,0.000000,53.879000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,44.997030,0> translate<7.885000,0.000000,53.995000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001000,0.000000,53.879000>}
box{<0,0,-0.304800><1.555000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.001000,0.000000,53.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.885000,0.000000,56.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.032000,0.000000,56.642000>}
box{<0,0,-0.127000><0.207889,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.885000,0.000000,56.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.532000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,33.259600>}
box{<0,0,-0.203200><0.988727,0.035000,0.203200> rotate<0,15.750134,0> translate<7.532000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.483600,0.000000,31.459600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.534400,0.000000,30.505400>}
box{<0,0,-0.127000><0.955551,0.035000,0.127000> rotate<0,86.946808,0> translate<8.483600,0.000000,31.459600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.534400,0.000000,30.505400>}
box{<0,0,-0.127000><1.041710,0.035000,0.127000> rotate<0,-88.596972,0> translate<8.509000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.544000,0.000000,57.912000>}
box{<0,0,-0.127000><2.067000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.477000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.272000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,19.558000>}
box{<0,0,-0.127000><1.364000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.272000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.001000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,45.339000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<8.001000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.570800,0.000000,62.788800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.647800,0.000000,64.273800>}
box{<0,0,-0.127000><1.486995,0.035000,0.127000> rotate<0,-87.026022,0> translate<8.570800,0.000000,62.788800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.001000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.908500,0.000000,51.416500>}
box{<0,0,-0.304800><1.283399,0.035000,0.304800> rotate<0,44.997030,0> translate<8.001000,0.000000,52.324000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,60.706000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.620000,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,26.416000>}
box{<0,0,-0.127000><15.240000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.652000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.032000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,56.642000>}
box{<0,0,-0.127000><1.620000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.032000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.570800,0.000000,67.360800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.702800,0.000000,68.376800>}
box{<0,0,-0.127000><1.521079,0.035000,0.127000> rotate<0,-41.906051,0> translate<8.570800,0.000000,67.360800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.570800,0.000000,69.672200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.982200,0.000000,70.434200>}
box{<0,0,-0.127000><1.603962,0.035000,0.127000> rotate<0,-28.362271,0> translate<8.570800,0.000000,69.672200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.647800,0.000000,64.273800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,65.786000>}
box{<0,0,-0.127000><2.138574,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.647800,0.000000,64.273800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,-1.535000,14.097000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,-1.535000,26.162000>}
box{<0,0,-0.127000><12.065000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.414000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.544000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.015000,0.000000,60.383000>}
box{<0,0,-0.127000><3.494522,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.544000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.982200,0.000000,70.434200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.049000,0.000000,71.501000>}
box{<0,0,-0.127000><1.508683,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.982200,0.000000,70.434200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.165000,0.000000,45.339000>}
box{<0,0,-0.203200><2.529000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.636000,0.000000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,62.611000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.271000,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,62.611000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.176000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.702800,0.000000,68.376800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,69.850000>}
box{<0,0,-0.127000><2.083419,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.702800,0.000000,68.376800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,74.422000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,76.962000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<11.176000,-1.535000,76.962000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,9.398000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<9.652000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,-1.535000,14.097000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,13.081000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<10.414000,-1.535000,14.097000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.557000,-1.535000,6.223000>}
box{<0,0,-0.203200><6.645390,0.035000,0.203200> rotate<0,44.997030,0> translate<6.858000,-1.535000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.665000,0.000000,58.655000>}
box{<0,0,-0.127000><2.846812,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.652000,0.000000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.665000,0.000000,58.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.665000,0.000000,60.383000>}
box{<0,0,-0.127000><1.728000,0.035000,0.127000> rotate<0,90.000000,0> translate<11.665000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.684000,0.000000,63.754000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.176000,0.000000,63.246000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.858000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.956500,0.000000,47.879000>}
box{<0,0,-0.304800><5.098500,0.035000,0.304800> rotate<0,0.000000,0> translate<6.858000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,76.962000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.176000,-1.535000,76.962000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.255500,0.000000,54.038500>}
box{<0,0,-0.203200><2.223407,0.035000,0.203200> rotate<0,1.636469,0> translate<10.033000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.315000,0.000000,56.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.315000,0.000000,60.383000>}
box{<0,0,-0.127000><3.395000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.315000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.956500,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.319000,0.000000,47.516500>}
box{<0,0,-0.304800><0.512652,0.035000,0.304800> rotate<0,44.997030,0> translate<11.956500,0.000000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.908500,0.000000,51.416500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.319000,0.000000,51.416500>}
box{<0,0,-0.304800><3.410500,0.035000,0.304800> rotate<0,0.000000,0> translate<8.908500,0.000000,51.416500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.353000,0.000000,15.147000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.539000,0.000000,15.147000>}
box{<0,0,-0.127000><5.186000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.353000,0.000000,15.147000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,28.448000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.414000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,29.464000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.652000,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.965000,0.000000,58.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.965000,0.000000,60.383000>}
box{<0,0,-0.203200><1.444000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.965000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.319000,0.000000,47.516500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.042000,0.000000,46.793500>}
box{<0,0,-0.203200><1.022476,0.035000,0.203200> rotate<0,44.997030,0> translate<12.319000,0.000000,47.516500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.965000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.042000,0.000000,46.793500>}
box{<0,0,-0.203200><1.456537,0.035000,0.203200> rotate<0,-86.963899,0> translate<12.965000,0.000000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,-1.535000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.065000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.255500,0.000000,54.038500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.271500,0.000000,54.154500>}
box{<0,0,-0.203200><1.022601,0.035000,0.203200> rotate<0,-6.513010,0> translate<12.255500,0.000000,54.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.315000,0.000000,56.988000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.271500,0.000000,55.954500>}
box{<0,0,-0.127000><1.408195,0.035000,0.127000> rotate<0,47.212751,0> translate<12.315000,0.000000,56.988000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.271500,-1.535000,77.787500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<13.208000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.953000,0.000000,20.647000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.389000,0.000000,20.647000>}
box{<0,0,-0.127000><6.436000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.953000,0.000000,20.647000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,74.422000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,72.136000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<11.176000,-1.535000,74.422000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.965000,0.000000,58.939000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.589000,0.000000,58.039000>}
box{<0,0,-0.203200><1.095160,0.035000,0.203200> rotate<0,55.261493,0> translate<12.965000,0.000000,58.939000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.953000,0.000000,16.247000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.707000,0.000000,16.247000>}
box{<0,0,-0.127000><6.754000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.953000,0.000000,16.247000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.539000,0.000000,15.147000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,0.000000,13.843000>}
box{<0,0,-0.127000><1.844134,0.035000,0.127000> rotate<0,44.997030,0> translate<12.539000,0.000000,15.147000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.020100,0.000000,24.003000>}
box{<0,0,-0.127000><11.099100,0.035000,0.127000> rotate<0,0.000000,0> translate<2.921000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.707000,0.000000,16.247000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.097000,0.000000,16.637000>}
box{<0,0,-0.127000><0.551543,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.707000,0.000000,16.247000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.615000,0.000000,60.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.265000,0.000000,60.383000>}
box{<0,0,-0.127000><0.650000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.615000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.265000,0.000000,61.935000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.265000,0.000000,60.383000>}
box{<0,0,-0.127000><1.552000,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.265000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.265000,0.000000,61.935000>}
box{<0,0,-0.127000><0.417193,0.035000,0.127000> rotate<0,44.997030,0> translate<13.970000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.271500,0.000000,55.954500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.326500,0.000000,56.031500>}
box{<0,0,-0.127000><1.057806,0.035000,0.127000> rotate<0,-4.174100,0> translate<13.271500,0.000000,55.954500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.020100,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,24.587900>}
box{<0,0,-0.127000><0.827174,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.020100,0.000000,24.003000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,24.587900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,25.019000>}
box{<0,0,-0.127000><0.431100,0.035000,0.127000> rotate<0,90.000000,0> translate<14.605000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.326500,0.000000,56.031500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,55.753000>}
box{<0,0,-0.127000><0.393858,0.035000,0.127000> rotate<0,44.997030,0> translate<14.326500,0.000000,56.031500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,55.753000>}
box{<0,0,-0.127000><30.734000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.605000,0.000000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.389000,0.000000,20.647000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,19.304000>}
box{<0,0,-0.127000><1.899289,0.035000,0.127000> rotate<0,44.997030,0> translate<13.389000,0.000000,20.647000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,24.892000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<14.605000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.915000,0.000000,58.491000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.915000,0.000000,60.383000>}
box{<0,0,-0.203200><1.892000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.915000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.915000,0.000000,58.491000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,58.039000>}
box{<0,0,-0.203200><0.457542,0.035000,0.203200> rotate<0,81.067594,0> translate<14.915000,0.000000,58.491000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.494000,0.000000,65.786000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.160000,0.000000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.565000,0.000000,59.111000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.565000,0.000000,60.383000>}
box{<0,0,-0.127000><1.272000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.565000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.494000,0.000000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.565000,0.000000,65.857000>}
box{<0,0,-0.203200><0.100409,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.494000,0.000000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.565000,0.000000,65.857000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.565000,0.000000,67.633000>}
box{<0,0,-0.203200><1.776000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.565000,0.000000,67.633000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,0.000000,44.323000>}
box{<0,0,-0.127000><12.065000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.621000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.811500,-1.535000,75.247500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,75.184000>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<15.811500,-1.535000,75.247500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,73.787000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,75.184000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.875000,-1.535000,75.184000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.811500,-1.535000,77.787500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,77.851000>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.811500,-1.535000,77.787500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.875000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.953000,0.000000,18.447000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.097000,0.000000,18.447000>}
box{<0,0,-0.127000><9.144000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.953000,0.000000,18.447000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,54.027500>}
box{<0,0,-0.304800><3.862500,0.035000,0.304800> rotate<0,90.000000,0> translate<16.129000,0.000000,54.027500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,55.827500>}
box{<0,0,-0.304800><1.068500,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.129000,0.000000,55.827500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.986000,0.000000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,56.896000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,44.997030,0> translate<14.986000,0.000000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.215000,0.000000,60.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.215000,0.000000,59.350000>}
box{<0,0,-0.127000><1.033000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.215000,0.000000,59.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.097000,0.000000,18.447000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,0.000000,18.288000>}
box{<0,0,-0.127000><0.224860,0.035000,0.127000> rotate<0,44.997030,0> translate<16.097000,0.000000,18.447000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,31.496000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<15.621000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,43.942000>}
box{<0,0,-0.127000><9.906000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.383000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,29.464000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.700000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.129000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,0.000000,49.784000>}
box{<0,0,-0.304800><0.538815,0.035000,0.304800> rotate<0,44.997030,0> translate<16.129000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,79.629000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.875000,-1.535000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,-1.535000,73.787000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,73.025000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<15.875000,-1.535000,73.787000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.661500,0.000000,49.632500>}
box{<0,0,-0.304800><0.214253,0.035000,0.304800> rotate<0,44.997030,0> translate<16.510000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.565000,0.000000,59.111000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,0.000000,57.912000>}
box{<0,0,-0.127000><1.695642,0.035000,0.127000> rotate<0,44.997030,0> translate<15.565000,0.000000,59.111000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.865000,0.000000,65.431000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.865000,0.000000,67.633000>}
box{<0,0,-0.127000><2.202000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.865000,0.000000,67.633000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,-1.535000,28.448000>}
box{<0,0,-0.127000><4.191000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.700000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.215000,0.000000,59.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,58.674000>}
box{<0,0,-0.127000><0.956008,0.035000,0.127000> rotate<0,44.997030,0> translate<16.215000,0.000000,59.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,43.561000>}
box{<0,0,-0.127000><8.001000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.018000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,69.850000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.176000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.865000,0.000000,65.431000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.399000,0.000000,64.897000>}
box{<0,0,-0.127000><0.755190,0.035000,0.127000> rotate<0,44.997030,0> translate<16.865000,0.000000,65.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.515000,0.000000,62.219000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.515000,0.000000,60.383000>}
box{<0,0,-0.203200><1.836000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.515000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.515000,0.000000,69.353000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.515000,0.000000,67.633000>}
box{<0,0,-0.127000><1.720000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.515000,0.000000,67.633000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.515000,0.000000,69.353000>}
box{<0,0,-0.127000><0.702864,0.035000,0.127000> rotate<0,44.997030,0> translate<17.018000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.515000,0.000000,62.219000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,62.230000>}
box{<0,0,-0.203200><0.015556,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.515000,0.000000,62.219000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,30.734000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.510000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,0.000000,32.639000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<16.383000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,32.639000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.780000,-1.535000,32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.907000,0.000000,57.912000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.764000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,19.304000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.732000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.049000,0.000000,71.501000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,71.501000>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.049000,0.000000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.515000,0.000000,60.383000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.165000,0.000000,60.383000>}
box{<0,0,-0.203200><0.650000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.515000,0.000000,60.383000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,13.081000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,13.081000>}
box{<0,0,-0.203200><6.985000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,-1.535000,13.081000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.415000,0.000000,19.685000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.034000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.415000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,23.241000>}
box{<0,0,-0.127000><3.558267,0.035000,0.127000> rotate<0,-87.948787,0> translate<18.415000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,47.244000>}
box{<0,0,-0.127000><4.130918,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.621000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,56.261000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.542000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.907000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,57.277000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<17.907000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.661500,0.000000,49.632500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.605500,0.000000,49.709500>}
box{<0,0,-0.304800><1.945524,0.035000,0.304800> rotate<0,-2.268096,0> translate<16.661500,0.000000,49.632500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.605500,0.000000,51.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.605500,0.000000,53.911500>}
box{<0,0,-0.127000><2.402000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.605500,0.000000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.605500,0.000000,56.197500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<18.542000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.684000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.669000,0.000000,63.754000>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.684000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,70.739000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,67.652000>}
box{<0,0,-0.127000><3.087000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.796000,0.000000,67.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.034000,0.000000,71.501000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,70.739000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<18.034000,0.000000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,79.629000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,-1.535000,79.629000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.510000,-1.535000,79.629000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,0.000000,67.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.815000,0.000000,67.633000>}
box{<0,0,-0.127000><0.026870,0.035000,0.127000> rotate<0,44.997030,0> translate<18.796000,0.000000,67.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,0.000000,23.622000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.542000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,0.000000,46.482000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.383000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.253000,0.000000,15.237000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.053000,0.000000,15.237000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.253000,0.000000,15.237000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.097000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,0.000000,16.637000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.097000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,0.000000,45.720000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.018000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.053000,0.000000,15.237000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.304000,0.000000,14.986000>}
box{<0,0,-0.127000><0.354968,0.035000,0.127000> rotate<0,44.997030,0> translate<19.053000,0.000000,15.237000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,13.081000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,-1.535000,11.938000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,44.997030,0> translate<18.415000,-1.535000,13.081000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,-1.535000,31.115000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.891000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.018000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,0.000000,33.020000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<17.018000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,-1.535000,33.020000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.558000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,72.136000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,-1.535000,72.136000>}
box{<0,0,-0.127000><6.096000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.462000,-1.535000,72.136000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.637000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-1.535000,73.025000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.637000,-1.535000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,0.000000,17.399000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.796000,-1.535000,79.629000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,-1.535000,78.359000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<18.796000,-1.535000,79.629000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,-1.535000,73.787000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,-1.535000,78.359000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.066000,-1.535000,78.359000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,0.000000,58.674000>}
box{<0,0,-0.127000><3.429000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.891000,0.000000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.447000,0.000000,15.367000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<19.177000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.669000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.574000,0.000000,61.849000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,44.997030,0> translate<18.669000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.574000,0.000000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.574000,0.000000,61.849000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.574000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.701000,-1.535000,9.398000>}
box{<0,0,-0.203200><9.271000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.701000,-1.535000,11.938000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.558000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,0.000000,16.764000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<20.066000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.690000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.701000,0.000000,16.764000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.690000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.831200,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.828000,-1.535000,34.544000>}
box{<0,0,-0.127000><12.996800,0.035000,0.127000> rotate<0,0.000000,0> translate<7.831200,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.605500,0.000000,49.709500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.082000,0.000000,49.709500>}
box{<0,0,-0.304800><2.476500,0.035000,0.304800> rotate<0,0.000000,0> translate<18.605500,0.000000,49.709500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,51.509500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,53.911500>}
box{<0,0,-0.127000><2.402000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.082000,0.000000,53.911500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,56.197500>}
box{<0,0,-0.127000><1.714500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.082000,0.000000,56.197500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,0.000000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.082000,0.000000,57.912000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<20.320000,0.000000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.167000,0.000000,23.622000>}
box{<0,0,-0.127000><2.244000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.923000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.939000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.233000,0.000000,22.606000>}
box{<0,0,-0.127000><1.294000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.939000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.167000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.233000,0.000000,23.556000>}
box{<0,0,-0.127000><0.093338,0.035000,0.127000> rotate<0,44.997030,0> translate<21.167000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,24.892000>}
box{<0,0,-0.127000><7.112000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.732000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.542000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,47.244000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.542000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.447000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.971000,0.000000,15.367000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.447000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.098000,0.000000,46.482000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.923000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123400,0.000000,60.680600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123400,0.000000,62.854000>}
box{<0,0,-0.127000><2.173400,0.035000,0.127000> rotate<0,90.000000,0> translate<22.123400,0.000000,62.854000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.399000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123400,0.000000,64.654000>}
box{<0,0,-0.127000><4.730645,0.035000,0.127000> rotate<0,2.944225,0> translate<17.399000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.971000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,15.748000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.971000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,16.852000>}
box{<0,0,-0.127000><1.104000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.352000,0.000000,16.852000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.233000,0.000000,21.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.418000,0.000000,21.656000>}
box{<0,0,-0.127000><1.185000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.233000,0.000000,21.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.574000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.468000,0.000000,19.685000>}
box{<0,0,-0.127000><1.894000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.574000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.177000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,0.000000,45.720000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.177000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.123400,0.000000,60.680600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,0.000000,60.325000>}
box{<0,0,-0.127000><0.502894,0.035000,0.127000> rotate<0,44.997030,0> translate<22.123400,0.000000,60.680600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,-1.535000,60.325000>}
box{<0,0,-0.127000><18.161000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.479000,-1.535000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.352000,0.000000,16.852000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.490000,0.000000,16.764000>}
box{<0,0,-0.127000><0.163670,0.035000,0.127000> rotate<0,32.522744,0> translate<22.352000,0.000000,16.852000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.418000,0.000000,21.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,21.971000>}
box{<0,0,-0.127000><0.445477,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.418000,0.000000,21.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,21.971000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.733000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,24.003000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<21.844000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.465000,0.000000,67.633000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.791000,0.000000,67.633000>}
box{<0,0,-0.127000><3.326000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.465000,0.000000,67.633000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,13.843000>}
box{<0,0,-0.127000><9.017000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.843000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.241000,-1.535000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.241000,-1.535000,58.420000>}
box{<0,0,-0.127000><15.367000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.241000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,-1.535000,41.148000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<22.479000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,-1.535000,41.148000>}
box{<0,0,-0.127000><13.208000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.495000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.622000,0.000000,14.605000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.860000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.749000,0.000000,18.288000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.256000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,49.276000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.844000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.574000,0.000000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,57.023000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,44.997030,0> translate<20.574000,0.000000,60.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,0.000000,57.023000>}
box{<0,0,-0.127000><7.747000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.876000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.196000,0.000000,21.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.233000,0.000000,21.656000>}
box{<0,0,-0.127000><0.037000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.196000,0.000000,21.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.233000,0.000000,23.556000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.233000,0.000000,27.662000>}
box{<0,0,-0.127000><4.106000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.233000,0.000000,27.662000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.241000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,-1.535000,59.436000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.241000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,0.000000,62.534800>}
box{<0,0,-0.127000><3.098800,0.035000,0.127000> rotate<0,90.000000,0> translate<24.257000,0.000000,62.534800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.257000,0.000000,62.534800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.333200,0.000000,62.854000>}
box{<0,0,-0.127000><0.328169,0.035000,0.127000> rotate<0,-76.568480,0> translate<24.257000,0.000000,62.534800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.241000,-1.535000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<23.241000,-1.535000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,-1.535000,41.910000>}
box{<0,0,-0.127000><13.716000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.384000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.333200,0.000000,64.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,0.000000,64.947800>}
box{<0,0,-0.127000><0.298159,0.035000,0.127000> rotate<0,-80.184875,0> translate<24.333200,0.000000,64.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,0.000000,64.947800>}
box{<0,0,-0.127000><1.092200,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.384000,0.000000,64.947800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.791000,0.000000,67.633000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,0.000000,66.040000>}
box{<0,0,-0.127000><2.252842,0.035000,0.127000> rotate<0,44.997030,0> translate<22.791000,0.000000,67.633000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.098000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511000,0.000000,48.895000>}
box{<0,0,-0.127000><3.412497,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.098000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511000,0.000000,56.261000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.511000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.749000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.765000,0.000000,19.597000>}
box{<0,0,-0.127000><1.657027,0.035000,0.127000> rotate<0,-52.179193,0> translate<23.749000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.268000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.765000,0.000000,19.597000>}
box{<0,0,-0.127000><0.504731,0.035000,0.127000> rotate<0,10.040197,0> translate<24.268000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.479000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.273000,0.000000,48.641000>}
box{<0,0,-0.127000><4.042113,0.035000,0.127000> rotate<0,-46.269976,0> translate<22.479000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.273000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.273000,0.000000,56.134000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.273000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.490000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.389000,0.000000,16.764000>}
box{<0,0,-0.127000><2.899000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.490000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.233000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,22.606000>}
box{<0,0,-0.127000><1.167000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.233000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.268000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.516000,0.000000,19.685000>}
box{<0,0,-0.127000><1.248000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.268000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.828000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,0.000000,39.370000>}
box{<0,0,-0.127000><6.824995,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.828000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,0.000000,23.368000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,76.454000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.162000,-1.535000,76.454000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.187400,0.000000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.187400,0.000000,55.626000>}
box{<0,0,-0.127000><8.280400,0.035000,0.127000> rotate<0,90.000000,0> translate<26.187400,0.000000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.622000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289000,0.000000,14.605000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.622000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.558000,-1.535000,72.136000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289000,-1.535000,65.278000>}
box{<0,0,-0.127000><9.609294,0.035000,0.127000> rotate<0,45.532454,0> translate<19.558000,-1.535000,72.136000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.187400,-1.535000,55.626000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289000,-1.535000,65.278000>}
box{<0,0,-0.127000><9.652535,0.035000,0.127000> rotate<0,-89.391009,0> translate<26.187400,-1.535000,55.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,8.509000>}
box{<0,0,-0.203200><0.889000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.416000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.701000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,9.398000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.701000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.233000,0.000000,27.662000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,0.000000,29.845000>}
box{<0,0,-0.127000><3.087228,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.233000,0.000000,27.662000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.289000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,15.113000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.289000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.196000,0.000000,21.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.051000,0.000000,21.590000>}
box{<0,0,-0.127000><2.855763,0.035000,0.127000> rotate<0,1.324203,0> translate<24.196000,0.000000,21.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.051000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.051000,0.000000,56.261000>}
box{<0,0,-0.127000><8.382000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.051000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.189000,0.000000,16.764000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.178000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.051000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.305000,0.000000,56.515000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.051000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.305000,-1.535000,65.405000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<19.685000,-1.535000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.305000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.305000,-1.535000,65.405000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.305000,-1.535000,65.405000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.187400,0.000000,47.345600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,45.974000>}
box{<0,0,-0.127000><1.939735,0.035000,0.127000> rotate<0,44.997030,0> translate<26.187400,0.000000,47.345600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,76.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.162000,-1.535000,76.454000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,7.239000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<26.416000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.701000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,11.938000>}
box{<0,0,-0.203200><6.985000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.701000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,12.700000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.686000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,31.140400>}
box{<0,0,-0.127000><0.355600,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.686000,0.000000,31.140400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.383000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,31.496000>}
box{<0,0,-0.127000><11.303000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.383000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,32.258000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.686000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,55.499000>}
box{<0,0,-0.127000><7.239000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.686000,0.000000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.051000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,46.736000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<27.051000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,55.499000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,56.134000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.686000,0.000000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,57.912000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.321000,0.000000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.066000,-1.535000,73.787000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,-1.535000,65.532000>}
box{<0,0,-0.127000><11.674333,0.035000,0.127000> rotate<0,44.997030,0> translate<20.066000,-1.535000,73.787000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,-1.535000,65.532000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.321000,-1.535000,65.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,13.589000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.686000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,0.000000,47.371000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<27.686000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,0.000000,52.705000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.575000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-1.535000,56.642000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.575000,-1.535000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.495000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,-1.535000,22.606000>}
box{<0,0,-0.127000><7.543415,0.035000,0.127000> rotate<0,44.997030,0> translate<23.495000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511000,0.000000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,0.000000,60.579000>}
box{<0,0,-0.127000><6.106574,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.511000,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,-1.535000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.559000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.019500,-1.535000,77.787500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<28.956000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.316000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,19.685000>}
box{<0,0,-0.127000><1.767000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.316000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.416000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,-1.535000,32.512000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.416000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.273000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,59.817000>}
box{<0,0,-0.127000><5.299112,0.035000,0.127000> rotate<0,-44.026072,0> translate<25.273000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.202000,0.000000,48.395000>}
box{<0,0,-0.127000><0.886712,0.035000,0.127000> rotate<0,44.997030,0> translate<28.575000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.384000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,23.368000>}
box{<0,0,-0.127000><6.824995,0.035000,0.127000> rotate<0,44.997030,0> translate<24.384000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,-1.535000,56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,57.277000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.575000,-1.535000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,65.913000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,44.997030,0> translate<26.162000,-1.535000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,57.277000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,65.913000>}
box{<0,0,-0.127000><8.636000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,-1.535000,65.913000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,0.000000,52.070000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.337000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.489400,-1.535000,54.305200>}
box{<0,0,-0.127000><1.961729,0.035000,0.127000> rotate<0,85.538752,0> translate<29.337000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.514800,0.000000,52.247800>}
box{<0,0,-0.127000><0.251447,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.337000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.489400,0.000000,54.305200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.514800,0.000000,54.025800>}
box{<0,0,-0.127000><0.280552,0.035000,0.127000> rotate<0,84.799974,0> translate<29.489400,0.000000,54.305200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.514800,0.000000,52.247800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.514800,0.000000,54.025800>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.514800,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.745000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.734000,0.000000,43.895000>}
box{<0,0,-0.127000><3.734601,0.035000,0.127000> rotate<0,-36.833714,0> translate<26.745000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.806000,0.000000,17.614000>}
box{<0,0,-0.127000><1.672929,0.035000,0.127000> rotate<0,-54.263655,0> translate<28.829000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.845000,-1.535000,56.769000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.337000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.845000,-1.535000,56.769000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.845000,-1.535000,72.136000>}
box{<0,0,-0.127000><15.367000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.845000,-1.535000,72.136000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.337000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.972000,0.000000,48.895000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<29.337000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.797000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.060000,0.000000,15.113000>}
box{<0,0,-0.127000><3.263000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.797000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,55.753000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,56.261000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.353000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,0.000000,55.753000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,55.499000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<30.353000,0.000000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,55.499000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.607000,0.000000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.353000,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,-1.535000,56.515000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.353000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,-1.535000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,-1.535000,71.501000>}
box{<0,0,-0.127000><14.986000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.607000,-1.535000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.060000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,15.864000>}
box{<0,0,-0.127000><1.097999,0.035000,0.127000> rotate<0,-43.151921,0> translate<30.060000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.646000,0.000000,15.914000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,15.864000>}
box{<0,0,-0.127000><0.220737,0.035000,0.127000> rotate<0,13.091029,0> translate<30.646000,0.000000,15.914000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.806000,0.000000,17.614000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,17.664000>}
box{<0,0,-0.127000><1.056184,0.035000,0.127000> rotate<0,-2.713230,0> translate<29.806000,0.000000,17.614000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,49.530000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<30.607000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,32.537400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,41.529000>}
box{<0,0,-0.127000><8.991600,0.035000,0.127000> rotate<0,90.000000,0> translate<31.369000,-1.535000,41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,31.140400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.394400,0.000000,27.432000>}
box{<0,0,-0.127000><5.244470,0.035000,0.127000> rotate<0,44.997030,0> translate<27.686000,0.000000,31.140400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.394400,-1.535000,32.512000>}
box{<0,0,-0.127000><2.311400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.083000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,32.537400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.394400,-1.535000,32.512000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<31.369000,-1.535000,32.537400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.845000,-1.535000,72.136000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,-1.535000,73.787000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.845000,-1.535000,72.136000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,-1.535000,73.787000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,-1.535000,75.184000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.496000,-1.535000,75.184000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,-1.535000,75.184000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.559500,-1.535000,75.247500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.496000,-1.535000,75.184000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.559500,-1.535000,77.787500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,-1.535000,77.851000>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.559500,-1.535000,77.787500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,-1.535000,77.851000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.623000,-1.535000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,63.500000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.877000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.623000,-1.535000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.131000,-1.535000,79.502000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.623000,-1.535000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,41.148000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.385000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.512000,0.000000,57.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.512000,0.000000,58.166000>}
box{<0,0,-0.127000><1.076000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.512000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.512000,0.000000,62.290000>}
box{<0,0,-0.127000><1.366501,0.035000,0.127000> rotate<0,62.305696,0> translate<31.877000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,23.241000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.083000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.394400,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,28.727400>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,44.997030,0> translate<31.394400,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,28.727400>}
box{<0,0,-0.127000><5.486400,0.035000,0.127000> rotate<0,90.000000,0> translate<32.639000,0.000000,28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.083000,0.000000,59.817000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,59.817000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.083000,0.000000,59.817000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.394400,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664400,-1.535000,28.702000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<31.394400,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.877000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.727000,0.000000,52.490000>}
box{<0,0,-0.304800><0.948103,0.035000,0.304800> rotate<0,-26.293055,0> translate<31.877000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,-1.535000,71.501000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,-1.535000,73.660000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.607000,-1.535000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.639000,0.000000,59.817000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.893000,0.000000,60.071000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.639000,0.000000,59.817000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,15.864000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,15.864000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.861000,0.000000,15.864000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,17.664000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,20.066000>}
box{<0,0,-0.127000><2.402000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.727000,0.000000,52.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.401000,0.000000,52.440000>}
box{<0,0,-0.304800><0.675852,0.035000,0.304800> rotate<0,4.242377,0> translate<32.727000,0.000000,52.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,0.000000,60.579000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401000,0.000000,60.579000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.829000,0.000000,60.579000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.517000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,64.809000>}
box{<0,0,-0.203200><0.040522,0.035000,0.203200> rotate<0,-74.243926,0> translate<33.517000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.686000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.655000,0.000000,38.227000>}
box{<0,0,-0.127000><8.441441,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.686000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401000,0.000000,54.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,54.571000>}
box{<0,0,-0.203200><0.504700,0.035000,0.203200> rotate<0,-40.980310,0> translate<33.401000,0.000000,54.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,54.571000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,57.090000>}
box{<0,0,-0.203200><2.519000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.782000,0.000000,57.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,57.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,58.547000>}
box{<0,0,-0.127000><1.457000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.782000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.401000,0.000000,60.579000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,60.960000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.401000,0.000000,60.579000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,62.290000>}
box{<0,0,-0.127000><1.330000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.782000,0.000000,62.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.517000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,64.555000>}
box{<0,0,-0.203200><0.341248,0.035000,0.203200> rotate<0,39.050560,0> translate<33.517000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,62.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,64.555000>}
box{<0,0,-0.203200><2.265000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.782000,0.000000,64.555000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.909000,0.000000,39.370000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.654000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.512000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.909000,0.000000,59.563000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.512000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.893000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.036000,0.000000,60.071000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.893000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.782000,0.000000,58.547000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.163000,0.000000,58.928000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.782000,0.000000,58.547000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.909000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,59.563000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.909000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.671000,-1.535000,23.368000>}
box{<0,0,-0.127000><5.461000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.210000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.664400,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.798000,-1.535000,28.702000>}
box{<0,0,-0.127000><2.133600,0.035000,0.127000> rotate<0,0.000000,0> translate<32.664400,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.655000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.798000,0.000000,38.227000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.655000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,54.723400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,57.090000>}
box{<0,0,-0.203200><2.366600,0.035000,0.203200> rotate<0,90.000000,0> translate<35.052000,0.000000,57.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.036000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,0.000000,61.087000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.036000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,0.000000,61.087000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,0.000000,62.290000>}
box{<0,0,-0.127000><1.203000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.052000,0.000000,62.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,62.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,64.555000>}
box{<0,0,-0.203200><2.265000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.052000,0.000000,64.555000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,-1.535000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-1.535000,73.660000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.766000,-1.535000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.131000,-1.535000,79.502000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-1.535000,79.502000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.131000,-1.535000,79.502000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,60.452000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.417000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,64.555000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.317000,0.000000,64.770000>}
box{<0,0,-0.203200><0.341248,0.035000,0.203200> rotate<0,-39.050560,0> translate<35.052000,0.000000,64.555000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.610800,0.000000,51.104800>}
box{<0,0,-0.127000><0.969868,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.925000,0.000000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.610800,0.000000,51.104800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.610800,0.000000,52.414600>}
box{<0,0,-0.127000><1.309800,0.035000,0.127000> rotate<0,90.000000,0> translate<35.610800,0.000000,52.414600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,0.000000,54.723400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.610800,0.000000,54.214600>}
box{<0,0,-0.203200><0.755735,0.035000,0.203200> rotate<0,42.315775,0> translate<35.052000,0.000000,54.723400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.610800,0.000000,54.214600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.675200,0.000000,54.229000>}
box{<0,0,-0.127000><0.065990,0.035000,0.127000> rotate<0,-12.603315,0> translate<35.610800,0.000000,54.214600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.829000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,-1.535000,22.606000>}
box{<0,0,-0.127000><6.858000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.829000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-1.535000,73.660000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,74.422000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.052000,-1.535000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.052000,-1.535000,79.502000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,78.740000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<35.052000,-1.535000,79.502000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,74.422000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,78.740000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.814000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.557000,-1.535000,6.223000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,6.223000>}
box{<0,0,-0.203200><24.384000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.557000,-1.535000,6.223000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.934400,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,31.978600>}
box{<0,0,-0.127000><2.837761,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.934400,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,33.274000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,44.997030,0> translate<32.385000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,31.978600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,33.274000>}
box{<0,0,-0.127000><1.295400,0.035000,0.127000> rotate<0,90.000000,0> translate<35.941000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.559000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,45.974000>}
box{<0,0,-0.127000><8.763000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.559000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.675200,0.000000,54.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,54.229000>}
box{<0,0,-0.127000><0.646800,0.035000,0.127000> rotate<0,0.000000,0> translate<35.675200,0.000000,54.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,-1.535000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,-1.535000,60.833000>}
box{<0,0,-0.127000><10.414000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.322000,-1.535000,60.833000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.449000,0.000000,46.736000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.194000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.178000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.576000,0.000000,26.035000>}
box{<0,0,-0.127000><13.201282,0.035000,0.127000> rotate<0,-44.607295,0> translate<27.178000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.934400,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.576000,0.000000,27.330400>}
box{<0,0,-0.127000><3.735787,0.035000,0.127000> rotate<0,44.997030,0> translate<33.934400,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.576000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.576000,0.000000,27.330400>}
box{<0,0,-0.127000><1.295400,0.035000,0.127000> rotate<0,90.000000,0> translate<36.576000,0.000000,27.330400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.798000,0.000000,50.895000>}
box{<0,0,-0.127000><0.673166,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.322000,0.000000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.798000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,40.259000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.798000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,-1.535000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,-1.535000,41.402000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.830000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.575000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,47.371000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.575000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,62.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.957000,0.000000,63.373000>}
box{<0,0,-0.127000><1.255434,0.035000,0.127000> rotate<0,-59.611509,0> translate<36.322000,0.000000,62.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.957000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.957000,0.000000,63.373000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.957000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.020500,0.000000,24.066500>}
box{<0,0,-0.127000><5.657561,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.020000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,54.229000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,55.118000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.322000,0.000000,54.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,55.118000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,56.515000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.211000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,57.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.271000,0.000000,58.039000>}
box{<0,0,-0.127000><1.342089,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.322000,0.000000,57.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.798000,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,-1.535000,31.242000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.798000,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,-1.535000,39.497000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.338000,-1.535000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,60.960000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.465000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.020500,0.000000,24.066500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,0.000000,24.892000>}
box{<0,0,-0.127000><1.167433,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.020500,0.000000,24.066500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,-1.535000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,40.005000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.338000,-1.535000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,0.000000,41.021000>}
box{<0,0,-0.127000><16.129000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.846000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,41.021000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.846000,-1.535000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.886000,0.000000,51.395000>}
box{<0,0,-0.127000><0.795529,0.035000,0.127000> rotate<0,58.044226,0> translate<37.465000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.901000,0.000000,44.395000>}
box{<0,0,-0.127000><2.233043,0.035000,0.127000> rotate<0,44.997030,0> translate<36.322000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.909000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.934000,0.000000,43.395000>}
box{<0,0,-0.127000><5.692210,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.909000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.322000,-1.535000,60.833000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.973000,-1.535000,62.484000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.322000,-1.535000,60.833000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.973000,-1.535000,62.484000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.973000,-1.535000,73.279000>}
box{<0,0,-0.127000><10.795000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.973000,-1.535000,73.279000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,54.737000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.227000,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.211000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,57.023000>}
box{<0,0,-0.127000><1.135923,0.035000,0.127000> rotate<0,-26.563298,0> translate<37.211000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,60.198000>}
box{<0,0,-0.127000><6.096000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.227000,-1.535000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.449000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.290000,0.000000,44.895000>}
box{<0,0,-0.127000><2.603567,0.035000,0.127000> rotate<0,44.997030,0> translate<36.449000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,-1.535000,53.721000>}
box{<0,0,-0.127000><0.457905,0.035000,0.127000> rotate<0,56.306216,0> translate<38.227000,-1.535000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,0.000000,53.721000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.481000,0.000000,53.721000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.941000,-1.535000,6.223000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,8.890000>}
box{<0,0,-0.203200><3.771708,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.941000,-1.535000,6.223000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,12.573000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.608000,-1.535000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,49.530000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.242000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,-1.535000,62.103000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.465000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,-1.535000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,-1.535000,72.390000>}
box{<0,0,-0.127000><10.287000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.608000,-1.535000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.806000,0.000000,45.395000>}
box{<0,0,-0.127000><2.794486,0.035000,0.127000> rotate<0,44.997030,0> translate<36.830000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.116000,-1.535000,42.291000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.846000,-1.535000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.116000,-1.535000,47.879000>}
box{<0,0,-0.127000><9.519071,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.385000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,-1.535000,60.198000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,-1.535000,61.087000>}
box{<0,0,-0.127000><1.350029,0.035000,0.127000> rotate<0,-41.183207,0> translate<38.227000,-1.535000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,0.000000,71.374000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.243000,0.000000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,-1.535000,61.087000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,-1.535000,71.501000>}
box{<0,0,-0.127000><10.414000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.243000,-1.535000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,0.000000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.418000,0.000000,51.895000>}
box{<0,0,-0.127000><1.325118,0.035000,0.127000> rotate<0,44.997030,0> translate<38.481000,0.000000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.473000,0.000000,50.395000>}
box{<0,0,-0.127000><1.223295,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.608000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,-1.535000,55.753000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.497000,-1.535000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.163000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,0.000000,58.928000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.163000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.717000,0.000000,42.892000>}
box{<0,0,-0.127000><2.645994,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.846000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.608000,-1.535000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.751000,-1.535000,73.533000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.608000,-1.535000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,70.993000>}
box{<0,0,-0.127000><10.287000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.005000,-1.535000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.231000,0.000000,39.116000>}
box{<0,0,-0.127000><0.226000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.005000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.497000,0.000000,55.753000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355000,0.000000,54.895000>}
box{<0,0,-0.127000><1.213395,0.035000,0.127000> rotate<0,44.997030,0> translate<39.497000,0.000000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,-1.535000,71.501000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,72.644000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.243000,-1.535000,71.501000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.934000,0.000000,43.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,43.395000>}
box{<0,0,-0.127000><2.576000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.934000,0.000000,43.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.734000,0.000000,43.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,43.895000>}
box{<0,0,-0.127000><10.776000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.734000,0.000000,43.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.901000,0.000000,44.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,44.395000>}
box{<0,0,-0.127000><2.609000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.901000,0.000000,44.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.290000,0.000000,44.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,44.895000>}
box{<0,0,-0.127000><2.220000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.290000,0.000000,44.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.806000,0.000000,45.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,45.395000>}
box{<0,0,-0.127000><1.704000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.806000,0.000000,45.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.202000,0.000000,48.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,48.395000>}
box{<0,0,-0.127000><11.308000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.202000,0.000000,48.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.972000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,48.895000>}
box{<0,0,-0.127000><10.538000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.972000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.473000,0.000000,50.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,50.395000>}
box{<0,0,-0.127000><1.037000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.473000,0.000000,50.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.798000,0.000000,50.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,50.895000>}
box{<0,0,-0.127000><3.712000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.798000,0.000000,50.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.886000,0.000000,51.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,51.395000>}
box{<0,0,-0.127000><2.624000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.886000,0.000000,51.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.418000,0.000000,51.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,51.895000>}
box{<0,0,-0.127000><1.092000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.418000,0.000000,51.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.355000,0.000000,54.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,54.895000>}
box{<0,0,-0.127000><0.155000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.355000,0.000000,54.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.717000,0.000000,42.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,42.892000>}
box{<0,0,-0.127000><0.796000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.717000,0.000000,42.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,42.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,42.892000>}
box{<0,0,-0.127000><0.004243,0.035000,0.127000> rotate<0,44.997030,0> translate<40.510000,0.000000,42.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,67.310000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<39.243000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.243000,0.000000,71.374000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,72.644000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.243000,0.000000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,49.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.518000,0.000000,49.403000>}
box{<0,0,-0.127000><0.011314,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.510000,0.000000,49.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.306000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,60.452000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.306000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.767000,0.000000,7.239000>}
box{<0,0,-0.203200><13.081000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.686000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,14.859000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.608000,-1.535000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,70.993000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,71.882000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.005000,-1.535000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.116000,-1.535000,42.291000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.275000,-1.535000,42.291000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.116000,-1.535000,42.291000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.671000,-1.535000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.529000,-1.535000,30.226000>}
box{<0,0,-0.127000><9.698677,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.671000,-1.535000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.529000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.529000,-1.535000,36.703000>}
box{<0,0,-0.127000><6.477000,0.035000,0.127000> rotate<0,90.000000,0> translate<41.529000,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.779400,-1.535000,51.694100>}
box{<0,0,-0.127000><14.550109,0.035000,0.127000> rotate<0,-44.314030,0> translate<31.369000,-1.535000,41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.779400,-1.535000,51.694100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.784500,-1.535000,51.689000>}
box{<0,0,-0.127000><0.007212,0.035000,0.127000> rotate<0,44.997030,0> translate<41.779400,-1.535000,51.694100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,54.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.822000,0.000000,54.395000>}
box{<0,0,-0.127000><1.312000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,54.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,57.023000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.882000,0.000000,57.023000>}
box{<0,0,-0.127000><3.655000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.227000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.518000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,49.403000>}
box{<0,0,-0.127000><1.519000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.518000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,67.310000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.513000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.275000,-1.535000,42.291000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,43.180000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.275000,-1.535000,42.291000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,44.831000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.164000,-1.535000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,46.736000>}
box{<0,0,-0.127000><7.543415,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.830000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.231000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.260000,0.000000,41.145000>}
box{<0,0,-0.127000><2.869439,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.231000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.882000,0.000000,57.023000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.260000,0.000000,56.645000>}
box{<0,0,-0.127000><0.534573,0.035000,0.127000> rotate<0,44.997030,0> translate<41.882000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.767000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,0.000000,8.763000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.767000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,0.000000,8.763000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.291000,0.000000,9.398000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.291000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.822000,0.000000,54.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,54.864000>}
box{<0,0,-0.127000><0.663266,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.822000,0.000000,54.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.005000,-1.535000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,-1.535000,58.801000>}
box{<0,0,-0.127000><2.975705,0.035000,0.127000> rotate<0,39.802944,0> translate<40.005000,-1.535000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,-1.535000,58.801000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.291000,-1.535000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.418000,0.000000,58.674000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<40.640000,0.000000,60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,49.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.529000,0.000000,49.895000>}
box{<0,0,-0.127000><2.019000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,49.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.545000,0.000000,13.589000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.575000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,29.464000>}
box{<0,0,-0.127000><9.698677,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.687000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,36.576000>}
box{<0,0,-0.127000><7.112000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.545000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,0.000000,48.895000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<42.037000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.973000,-1.535000,73.279000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,77.724000>}
box{<0,0,-0.127000><6.376614,0.035000,0.127000> rotate<0,-44.190154,0> translate<37.973000,-1.535000,73.279000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.037000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.633000,0.000000,62.269000>}
box{<0,0,-0.304800><0.597275,0.035000,0.304800> rotate<0,-3.743636,0> translate<42.037000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,0.000000,69.850000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.037000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.760000,0.000000,39.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.760000,0.000000,41.145000>}
box{<0,0,-0.127000><1.228000,0.035000,0.127000> rotate<0,90.000000,0> translate<42.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,-1.535000,45.466000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.164000,-1.535000,44.831000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,-1.535000,46.736000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,0.000000,67.310000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.037000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,53.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.973000,0.000000,53.895000>}
box{<0,0,-0.127000><2.463000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.116000,-1.535000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.053000,-1.535000,47.879000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.116000,-1.535000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.529000,0.000000,49.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,50.546000>}
box{<0,0,-0.127000><0.920653,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.529000,0.000000,49.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.260000,0.000000,40.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.839000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.784500,-1.535000,51.689000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.434000,-1.535000,51.689000>}
box{<0,0,-0.127000><1.649500,0.035000,0.127000> rotate<0,0.000000,0> translate<41.784500,-1.535000,51.689000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.561000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.561000,0.000000,11.938000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.561000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.545000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.561000,0.000000,12.573000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<42.545000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.973000,0.000000,53.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,54.737000>}
box{<0,0,-0.127000><1.190768,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.973000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,-1.535000,56.007000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.815000,-1.535000,56.007000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,53.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.870000,0.000000,53.395000>}
box{<0,0,-0.127000><3.360000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,53.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.942000,-1.535000,45.466000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.799000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.434000,-1.535000,51.689000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.942000,-1.535000,51.181000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<43.434000,-1.535000,51.689000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.271000,0.000000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.196000,0.000000,58.039000>}
box{<0,0,-0.127000><6.925000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.271000,0.000000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,43.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,41.145000>}
box{<0,0,-0.127000><2.225000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.688000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,43.370000>}
box{<0,0,-0.127000><0.808930,0.035000,0.127000> rotate<0,44.997030,0> translate<43.688000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,57.975000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,56.645000>}
box{<0,0,-0.127000><1.330000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.260000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.196000,0.000000,58.039000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.260000,0.000000,57.975000>}
box{<0,0,-0.127000><0.090510,0.035000,0.127000> rotate<0,44.997030,0> translate<44.196000,0.000000,58.039000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.418000,0.000000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.323000,0.000000,58.674000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.418000,0.000000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,52.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.386000,0.000000,52.895000>}
box{<0,0,-0.127000><3.876000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,52.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,0.000000,67.945000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,44.997030,0> translate<42.672000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.053000,-1.535000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,-1.535000,49.530000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.053000,-1.535000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.386000,0.000000,52.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,0.000000,53.213000>}
box{<0,0,-0.127000><0.449720,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.386000,0.000000,52.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,42.728000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,41.145000>}
box{<0,0,-0.127000><1.583000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,58.237000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,56.645000>}
box{<0,0,-0.127000><1.592000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.760000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.323000,0.000000,58.674000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,58.237000>}
box{<0,0,-0.127000><0.618011,0.035000,0.127000> rotate<0,44.997030,0> translate<44.323000,0.000000,58.674000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.942000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831000,-1.535000,46.355000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.942000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831000,-1.535000,46.863000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.831000,-1.535000,46.863000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.510000,0.000000,52.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.887000,0.000000,52.395000>}
box{<0,0,-0.127000><4.377000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.510000,0.000000,52.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.894500,-1.535000,77.724000>}
box{<0,0,-0.127000><2.349500,0.035000,0.127000> rotate<0,0.000000,0> translate<42.545000,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,-1.535000,46.736000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.958000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.831000,-1.535000,46.863000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,-1.535000,46.990000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.831000,-1.535000,46.863000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.434000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,61.722000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.434000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.633000,0.000000,62.269000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,0.000000,62.346000>}
box{<0,0,-0.203200><2.326275,0.035000,0.203200> rotate<0,-1.896719,0> translate<42.633000,0.000000,62.269000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,61.722000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,62.346000>}
box{<0,0,-0.127000><0.624000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.958000,0.000000,62.346000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,65.151000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,44.997030,0> translate<42.799000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,64.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,65.151000>}
box{<0,0,-0.127000><1.005000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.958000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.894500,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,-1.535000,77.787500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.894500,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,64.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.997000,0.000000,64.262000>}
box{<0,0,-0.127000><0.122381,0.035000,0.127000> rotate<0,-71.412287,0> translate<44.958000,0.000000,64.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.997000,0.000000,67.945000>}
box{<0,0,-0.127000><0.420000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.577000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.997000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,67.934000>}
box{<0,0,-0.127000><0.088685,0.035000,0.127000> rotate<0,7.124546,0> translate<44.997000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,67.934000>}
box{<0,0,-0.127000><1.386000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.085000,0.000000,67.934000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.870000,0.000000,53.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,0.000000,54.737000>}
box{<0,0,-0.127000><1.897875,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.870000,0.000000,53.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,-1.535000,56.261000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.212000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260000,0.000000,60.627000>}
box{<0,0,-0.127000><3.982000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.260000,0.000000,60.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.760000,0.000000,42.728000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.339000,0.000000,43.307000>}
box{<0,0,-0.127000><0.818830,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.760000,0.000000,42.728000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.887000,0.000000,52.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.339000,0.000000,52.070000>}
box{<0,0,-0.127000><0.556713,0.035000,0.127000> rotate<0,35.714781,0> translate<44.887000,0.000000,52.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.760000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.760000,0.000000,60.365000>}
box{<0,0,-0.127000><3.720000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.760000,0.000000,60.365000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.958000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,0.000000,48.006000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.958000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.997000,0.000000,64.262000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,0.000000,64.262000>}
box{<0,0,-0.127000><0.977000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.997000,0.000000,64.262000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,69.734000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.189000,0.000000,69.811000>}
box{<0,0,-0.127000><1.106682,0.035000,0.127000> rotate<0,-3.989449,0> translate<45.085000,0.000000,69.734000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.260000,0.000000,60.103000>}
box{<0,0,-0.127000><3.458000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.260000,0.000000,60.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.260000,0.000000,60.627000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.355000,0.000000,61.722000>}
box{<0,0,-0.127000><1.548564,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.260000,0.000000,60.627000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,0.000000,64.262000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.355000,0.000000,63.881000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<45.974000,0.000000,64.262000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.355000,0.000000,61.722000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.355000,0.000000,63.881000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.355000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,53.213000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.704000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.751000,-1.535000,73.533000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,-1.535000,73.533000>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.751000,-1.535000,73.533000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.760000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.760000,0.000000,59.714000>}
box{<0,0,-0.127000><3.069000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.760000,0.000000,59.714000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.339000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.819000,0.000000,32.683000>}
box{<0,0,-0.203200><2.093036,0.035000,0.203200> rotate<0,44.997030,0> translate<45.339000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,-1.535000,53.213000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,-1.535000,53.086000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<46.736000,-1.535000,53.213000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.760000,0.000000,60.365000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,0.000000,61.468000>}
box{<0,0,-0.127000><1.559878,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.760000,0.000000,60.365000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,0.000000,64.770000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<45.085000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,0.000000,64.770000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.863000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.189000,0.000000,69.811000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,0.000000,70.612000>}
box{<0,0,-0.127000><1.132785,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.189000,0.000000,69.811000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.760000,0.000000,39.917000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,0.000000,35.560000>}
box{<0,0,-0.127000><6.161728,0.035000,0.127000> rotate<0,44.997030,0> translate<42.760000,0.000000,39.917000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,-1.535000,56.896000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.117000,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.529000,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,42.418000>}
box{<0,0,-0.127000><8.082231,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.529000,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,43.942000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.244000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,49.530000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.704000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.260000,0.000000,59.325000>}
box{<0,0,-0.127000><2.680000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.260000,0.000000,59.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.260000,0.000000,40.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,36.195000>}
box{<0,0,-0.127000><5.813832,0.035000,0.127000> rotate<0,44.997030,0> translate<43.260000,0.000000,40.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.260000,0.000000,60.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,61.214000>}
box{<0,0,-0.127000><1.571191,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.260000,0.000000,60.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,66.548000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.371000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.085000,0.000000,67.934000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.410000,0.000000,67.857000>}
box{<0,0,-0.127000><2.326275,0.035000,0.127000> rotate<0,1.896719,0> translate<45.085000,0.000000,67.934000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,-1.535000,73.533000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,74.295000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.736000,-1.535000,73.533000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,74.295000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,75.247500>}
box{<0,0,-0.127000><0.952500,0.035000,0.127000> rotate<0,90.000000,0> translate<47.498000,-1.535000,75.247500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,77.787500>}
box{<0,0,-0.127000><0.952500,0.035000,0.127000> rotate<0,-90.000000,0> translate<47.498000,-1.535000,77.787500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.625000,0.000000,48.006000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.974000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,0.000000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,55.380000>}
box{<0,0,-0.127000><0.909339,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.117000,0.000000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,55.380000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,56.645000>}
box{<0,0,-0.127000><1.265000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.760000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,41.145000>}
box{<0,0,-0.127000><0.119000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,41.145000>}
box{<0,0,-0.127000><1.775000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.879000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.760000,0.000000,59.714000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,60.833000>}
box{<0,0,-0.127000><1.582505,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.760000,0.000000,59.714000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,65.786000>}
box{<0,0,-0.127000><4.953000,0.035000,0.127000> rotate<0,90.000000,0> translate<47.879000,0.000000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.907000,0.000000,30.152000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.907000,0.000000,27.739000>}
box{<0,0,-0.406400><2.413000,0.035000,0.406400> rotate<0,-90.000000,0> translate<47.907000,0.000000,27.739000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.907000,0.000000,32.565000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.907000,0.000000,30.152000>}
box{<0,0,-0.406400><2.413000,0.035000,0.406400> rotate<0,-90.000000,0> translate<47.907000,0.000000,30.152000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.006000,0.000000,50.292000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.244000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.819000,0.000000,32.683000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025000,0.000000,32.683000>}
box{<0,0,-0.203200><1.206000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.819000,0.000000,32.683000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.907000,0.000000,32.565000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.025000,0.000000,32.683000>}
box{<0,0,-0.406400><0.166877,0.035000,0.406400> rotate<0,-44.997030,0> translate<47.907000,0.000000,32.565000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,0.000000,43.053000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<47.244000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.339000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,-1.535000,52.070000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.339000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,52.197000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.133000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,59.436000>}
box{<0,0,-0.127000><2.791000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.260000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,78.740000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,79.502000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.498000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.879000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.348000,0.000000,38.901000>}
box{<0,0,-0.203200><0.663266,0.035000,0.203200> rotate<0,44.997030,0> translate<47.879000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.260000,0.000000,59.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.514000,0.000000,60.579000>}
box{<0,0,-0.127000><1.773424,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.260000,0.000000,59.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.514000,0.000000,60.579000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.514000,0.000000,65.278000>}
box{<0,0,-0.127000><4.699000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.514000,0.000000,65.278000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,0.000000,59.047000>}
box{<0,0,-0.127000><2.402000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.760000,0.000000,59.047000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.545000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,43.053000>}
box{<0,0,-0.127000><9.159861,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.545000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,44.958000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.022000,-1.535000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.942000,-1.535000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,51.181000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.942000,-1.535000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.625000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,49.530000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.625000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.799000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,53.086000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.799000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,60.325000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.260000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,60.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,64.897000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.149000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.260000,0.000000,58.785000>}
box{<0,0,-0.127000><2.140000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.260000,0.000000,58.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,-1.535000,56.007000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,61.722000>}
box{<0,0,-0.127000><8.082231,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.815000,-1.535000,56.007000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,61.722000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,69.215000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.530000,-1.535000,69.215000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760000,0.000000,58.396000>}
box{<0,0,-0.127000><1.751000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.760000,0.000000,58.396000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.760000,0.000000,59.047000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,0.000000,60.071000>}
box{<0,0,-0.127000><1.448155,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.760000,0.000000,59.047000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,0.000000,64.389000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,90.000000,0> translate<49.784000,0.000000,64.389000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911000,0.000000,43.053000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.348000,0.000000,38.901000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.007000,0.000000,38.901000>}
box{<0,0,-0.203200><1.659000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.348000,0.000000,38.901000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260000,0.000000,58.007000>}
box{<0,0,-0.127000><1.362000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.260000,0.000000,58.007000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.292000,-1.535000,72.644000>}
box{<0,0,-0.127000><9.906000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.386000,-1.535000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.260000,0.000000,58.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,59.944000>}
box{<0,0,-0.127000><1.639074,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.260000,0.000000,58.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.212000,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,-1.535000,61.468000>}
box{<0,0,-0.127000><7.363810,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.212000,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,64.135000>}
box{<0,0,-0.127000><4.191000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.419000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,-1.535000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,-1.535000,68.834000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.419000,-1.535000,68.834000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.760000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.760000,0.000000,57.618000>}
box{<0,0,-0.127000><0.973000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.760000,0.000000,57.618000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.513000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,72.644000>}
box{<0,0,-0.127000><10.287000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.513000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,0.000000,44.196000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.911000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,71.882000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,-1.535000,71.882000>}
box{<0,0,-0.127000><10.160000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.894000,-1.535000,71.882000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,79.502000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,-1.535000,79.502000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,-1.535000,79.502000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.546000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.260000,0.000000,55.420000>}
box{<0,0,-0.127000><0.904949,0.035000,0.127000> rotate<0,-37.905800,0> translate<50.546000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.260000,0.000000,55.420000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.260000,0.000000,56.645000>}
box{<0,0,-0.127000><1.225000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.260000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.760000,0.000000,58.396000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,0.000000,59.944000>}
box{<0,0,-0.127000><2.189203,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.760000,0.000000,58.396000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,-1.535000,61.087000>}
box{<0,0,-0.127000><5.926969,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.117000,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,0.000000,64.135000>}
box{<0,0,-0.127000><4.191000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.308000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,-1.535000,61.087000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,-1.535000,68.580000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.308000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.760000,0.000000,54.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.760000,0.000000,56.645000>}
box{<0,0,-0.127000><2.233000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.760000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.292000,-1.535000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,-1.535000,74.168000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.292000,-1.535000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,-1.535000,79.502000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,-1.535000,78.740000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<51.054000,-1.535000,79.502000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,-1.535000,74.168000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,-1.535000,78.740000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<51.816000,-1.535000,78.740000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.006000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,0.000000,50.292000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.006000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,0.000000,51.181000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.022000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,0.000000,49.530000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.760000,0.000000,54.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,0.000000,54.102000>}
box{<0,0,-0.127000><0.438406,0.035000,0.127000> rotate<0,44.997030,0> translate<51.760000,0.000000,54.412000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.760000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.260000,0.000000,55.563000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.260000,0.000000,56.645000>}
box{<0,0,-0.127000><1.082000,0.035000,0.127000> rotate<0,90.000000,0> translate<52.260000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.260000,0.000000,58.007000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.451000,0.000000,60.198000>}
box{<0,0,-0.127000><3.098542,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.260000,0.000000,58.007000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.451000,0.000000,60.198000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.451000,0.000000,62.992000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,90.000000,0> translate<52.451000,0.000000,62.992000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.193000,0.000000,27.739000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.595000,0.000000,27.739000>}
box{<0,0,-0.304800><2.402000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.193000,0.000000,27.739000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.193000,0.000000,30.152000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.595000,0.000000,30.152000>}
box{<0,0,-0.304800><2.402000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.193000,0.000000,30.152000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.193000,0.000000,32.565000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.595000,0.000000,32.565000>}
box{<0,0,-0.304800><2.402000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.193000,0.000000,32.565000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,14.859000>}
box{<0,0,-0.203200><11.811000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.894000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.863000,-1.535000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,53.086000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.863000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,0.000000,53.086000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.149000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,-1.535000,71.882000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,73.533000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.054000,-1.535000,71.882000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,73.533000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,77.343000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<52.705000,-1.535000,77.343000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.760000,0.000000,41.145000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.054000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,44.196000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.054000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,53.594000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.705000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.260000,0.000000,55.563000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,54.610000>}
box{<0,0,-0.127000><1.347746,0.035000,0.127000> rotate<0,44.997030,0> translate<52.260000,0.000000,55.563000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,54.610000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.213000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.760000,0.000000,57.618000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,60.071000>}
box{<0,0,-0.127000><3.469066,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.760000,0.000000,57.618000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,61.468000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.213000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.086000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.237000,0.000000,47.395000>}
box{<0,0,-0.127000><0.213546,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.086000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.807000,0.000000,38.901000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.260000,0.000000,40.150000>}
box{<0,0,-0.127000><1.916040,0.035000,0.127000> rotate<0,-40.679696,0> translate<51.807000,0.000000,38.901000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.260000,0.000000,40.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.260000,0.000000,41.145000>}
box{<0,0,-0.127000><0.995000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,44.958000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.022000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.451000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,63.881000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.451000,0.000000,62.992000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,69.215000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,-1.535000,73.279000>}
box{<0,0,-0.127000><5.747364,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.530000,-1.535000,69.215000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,0.000000,75.438000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.800000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,-1.535000,73.279000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,-1.535000,75.819000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.594000,-1.535000,75.819000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.760000,0.000000,42.252000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.760000,0.000000,41.145000>}
box{<0,0,-0.127000><1.107000,0.035000,0.127000> rotate<0,-90.000000,0> translate<53.760000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.760000,0.000000,42.252000>}
box{<0,0,-0.127000><1.312390,0.035000,0.127000> rotate<0,44.997030,0> translate<52.832000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.848000,0.000000,62.103000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.213000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.410000,0.000000,67.857000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.975000,0.000000,74.422000>}
box{<0,0,-0.127000><9.284312,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.410000,0.000000,67.857000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.014000,0.000000,43.395000>}
box{<0,0,-0.127000><1.132785,0.035000,0.127000> rotate<0,44.997030,0> translate<53.213000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.025000,-1.535000,16.179000>}
box{<0,0,-0.203200><1.866762,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.705000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.025000,-1.535000,16.179000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.025000,-1.535000,18.205000>}
box{<0,0,-0.203200><2.026000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.025000,-1.535000,18.205000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.102000,0.000000,23.628000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.102000,0.000000,22.098000>}
box{<0,0,-0.304800><1.530000,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.102000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.025000,0.000000,23.705000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.102000,0.000000,23.628000>}
box{<0,0,-0.304800><0.108894,0.035000,0.304800> rotate<0,44.997030,0> translate<54.025000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.102000,0.000000,73.279000>}
box{<0,0,-0.127000><9.519071,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.371000,0.000000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.157000,0.000000,53.395000>}
box{<0,0,-0.127000><3.131069,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.943000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.229000,0.000000,44.069000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<53.340000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.229000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.356000,0.000000,43.942000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<54.229000,0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.229000,0.000000,44.069000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.403000,0.000000,43.895000>}
box{<0,0,-0.127000><0.246073,0.035000,0.127000> rotate<0,44.997030,0> translate<54.229000,0.000000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.356000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.472000,0.000000,34.428000>}
box{<0,0,-0.152400><0.164049,0.035000,0.152400> rotate<0,44.997030,0> translate<54.356000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.395000,0.000000,32.565000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.472000,0.000000,34.428000>}
box{<0,0,-0.152400><1.864591,0.035000,0.152400> rotate<0,-87.627461,0> translate<54.395000,0.000000,32.565000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.943000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.546000,0.000000,52.895000>}
box{<0,0,-0.127000><3.681198,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.943000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.879000,0.000000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,72.517000>}
box{<0,0,-0.127000><9.519071,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.879000,0.000000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,-1.535000,68.834000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,73.025000>}
box{<0,0,-0.127000><5.926969,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.419000,-1.535000,68.834000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.975000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.737000,0.000000,47.879000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<53.975000,0.000000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.935000,0.000000,52.395000>}
box{<0,0,-0.127000><4.051722,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.070000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.514000,0.000000,65.278000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.991000,0.000000,71.755000>}
box{<0,0,-0.127000><9.159861,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.514000,0.000000,65.278000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.991000,-1.535000,72.263000>}
box{<0,0,-0.127000><5.208549,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.308000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.260000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.115000,0.000000,41.145000>}
box{<0,0,-0.127000><0.855000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.260000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.102000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,21.082000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<54.102000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,77.343000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.118000,-1.535000,79.756000>}
box{<0,0,-0.127000><3.412497,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.705000,-1.535000,77.343000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.245000,0.000000,70.993000>}
box{<0,0,-0.127000><8.621046,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.149000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.273000,0.000000,57.658000>}
box{<0,0,-0.127000><1.432598,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.260000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,-1.535000,75.819000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.499000,-1.535000,77.724000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<53.594000,-1.535000,75.819000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,0.000000,36.195000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.371000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.115000,0.000000,41.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,0.000000,41.656000>}
box{<0,0,-0.127000><0.722663,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.115000,0.000000,41.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,0.000000,64.389000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,0.000000,70.231000>}
box{<0,0,-0.127000><8.261836,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.784000,0.000000,64.389000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.395000,0.000000,30.152000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.806000,0.000000,30.152000>}
box{<0,0,-0.304800><1.411000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.395000,0.000000,30.152000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,69.596000>}
box{<0,0,-0.127000><7.723020,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.419000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.737000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.994000,0.000000,47.879000>}
box{<0,0,-0.127000><1.257000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.737000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.117000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,0.000000,35.560000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.117000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.705000,-1.535000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,-1.535000,56.388000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.705000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.014000,0.000000,43.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,43.395000>}
box{<0,0,-0.127000><1.996000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.014000,0.000000,43.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.403000,0.000000,43.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,43.895000>}
box{<0,0,-0.127000><1.607000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.403000,0.000000,43.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.237000,0.000000,47.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,47.395000>}
box{<0,0,-0.127000><2.773000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.237000,0.000000,47.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.994000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,47.895000>}
box{<0,0,-0.127000><0.022627,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.994000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.935000,0.000000,52.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,52.395000>}
box{<0,0,-0.127000><1.075000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.935000,0.000000,52.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.546000,0.000000,52.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,52.895000>}
box{<0,0,-0.127000><1.464000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.546000,0.000000,52.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.157000,0.000000,53.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,53.395000>}
box{<0,0,-0.127000><1.853000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.157000,0.000000,53.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.134000,0.000000,68.961000>}
box{<0,0,-0.127000><6.824995,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.308000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.767000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,7.239000>}
box{<0,0,-0.203200><15.748000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.767000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.594000,0.000000,75.438000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.896000,0.000000,75.438000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.594000,0.000000,75.438000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.935000,0.000000,65.493000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.012000,0.000000,67.564000>}
box{<0,0,-0.127000><2.072431,0.035000,0.127000> rotate<0,-87.864918,0> translate<56.935000,0.000000,65.493000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.975000,0.000000,74.422000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,74.422000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.975000,0.000000,74.422000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.260000,0.000000,56.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.457400,0.000000,59.842400>}
box{<0,0,-0.127000><4.521806,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.260000,0.000000,56.645000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.457400,0.000000,59.842400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.697800,0.000000,59.842400>}
box{<0,0,-0.127000><0.240400,0.035000,0.127000> rotate<0,0.000000,0> translate<57.457400,0.000000,59.842400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.545000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,13.589000>}
box{<0,0,-0.203200><15.494000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.545000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,8.890000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.515000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.166000,0.000000,9.398000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,90.000000,0> translate<58.166000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,38.989000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<55.626000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,40.513000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.896000,0.000000,75.438000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,76.962000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.896000,0.000000,75.438000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,76.962000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,78.105000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.547000,0.000000,63.881000>}
box{<0,0,-0.127000><5.207000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.340000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.935000,0.000000,65.493000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.547000,0.000000,63.881000>}
box{<0,0,-0.127000><2.279712,0.035000,0.127000> rotate<0,44.997030,0> translate<56.935000,0.000000,65.493000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,38.608000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.007000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,40.132000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.055000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,74.422000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182000,0.000000,76.454000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,0.000000,74.422000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182000,0.000000,76.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182000,0.000000,77.978000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.182000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,0.000000,11.938000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.436000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,0.000000,12.192000>}
box{<0,0,-0.203200><1.975656,0.035000,0.203200> rotate<0,44.997030,0> translate<58.039000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.806000,0.000000,30.152000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,34.290000>}
box{<0,0,-0.304800><5.852016,0.035000,0.304800> rotate<0,-44.997030,0> translate<55.806000,0.000000,30.152000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,35.597400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,34.290000>}
box{<0,0,-0.304800><1.307400,0.035000,0.304800> rotate<0,-90.000000,0> translate<59.944000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.944000,0.000000,42.037000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.944000,0.000000,35.597400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.052800,0.000000,35.629200>}
box{<0,0,-0.304800><0.113352,0.035000,0.304800> rotate<0,-16.291479,0> translate<59.944000,0.000000,35.597400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.975800,0.000000,38.449200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.052800,0.000000,35.629200>}
box{<0,0,-0.304800><2.821051,0.035000,0.304800> rotate<0,88.430093,0> translate<59.975800,0.000000,38.449200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.071000,0.000000,79.756000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,0.000000,41.275000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.055000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.182000,0.000000,77.978000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,0.000000,78.994000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.182000,0.000000,77.978000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.499000,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.896500,-1.535000,77.724000>}
box{<0,0,-0.127000><5.397500,0.035000,0.127000> rotate<0,0.000000,0> translate<55.499000,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.975800,0.000000,38.449200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,0.000000,39.624000>}
box{<0,0,-0.304800><1.532581,0.035000,0.304800> rotate<0,-50.041782,0> translate<59.975800,0.000000,38.449200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.812000,0.000000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,67.564000>}
box{<0,0,-0.127000><2.148000,0.035000,0.127000> rotate<0,0.000000,0> translate<58.812000,0.000000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.896500,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,-1.535000,77.787500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.896500,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,44.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.150000,0.000000,44.895000>}
box{<0,0,-0.127000><5.140000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,44.895000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.118000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.214000,0.000000,21.082000>}
box{<0,0,-0.304800><6.096000,0.035000,0.304800> rotate<0,0.000000,0> translate<55.118000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.848000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,0.000000,62.103000>}
box{<0,0,-0.127000><7.747000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.848000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.497800,0.000000,59.842400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.103000,0.000000,59.842400>}
box{<0,0,-0.127000><2.605200,0.035000,0.127000> rotate<0,0.000000,0> translate<59.497800,0.000000,59.842400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.214000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.425000,0.000000,22.293000>}
box{<0,0,-0.304800><1.712613,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.214000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.425000,0.000000,22.293000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.425000,0.000000,23.705000>}
box{<0,0,-0.304800><1.412000,0.035000,0.304800> rotate<0,90.000000,0> translate<62.425000,0.000000,23.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.150000,0.000000,44.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,0.000000,43.561000>}
box{<0,0,-0.127000><1.886561,0.035000,0.127000> rotate<0,44.997030,0> translate<61.150000,0.000000,44.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,-1.535000,73.025000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.610000,-1.535000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,45.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.532000,0.000000,45.895000>}
box{<0,0,-0.127000><6.522000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,45.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.118000,-1.535000,79.756000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.992000,-1.535000,79.756000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.118000,-1.535000,79.756000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,0.000000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.108000,0.000000,67.564000>}
box{<0,0,-0.127000><2.148000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.960000,0.000000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.532000,0.000000,45.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.119000,0.000000,46.482000>}
box{<0,0,-0.127000><0.830143,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.532000,0.000000,45.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,0.000000,63.881000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.595000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,74.041000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.484000,-1.535000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,74.041000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,75.247500>}
box{<0,0,-0.127000><1.206500,0.035000,0.127000> rotate<0,90.000000,0> translate<63.500000,-1.535000,75.247500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,79.248000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,77.787500>}
box{<0,0,-0.127000><1.460500,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.500000,-1.535000,77.787500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.992000,-1.535000,79.756000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,79.248000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<62.992000,-1.535000,79.756000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.852800,0.000000,35.629200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.823200,0.000000,35.629200>}
box{<0,0,-0.127000><1.970400,0.035000,0.127000> rotate<0,0.000000,0> translate<61.852800,0.000000,35.629200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,45.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.079000,0.000000,45.395000>}
box{<0,0,-0.127000><8.069000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,45.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.079000,0.000000,45.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.135000,0.000000,45.339000>}
box{<0,0,-0.127000><0.079196,0.035000,0.127000> rotate<0,44.997030,0> translate<64.079000,0.000000,45.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.985000,0.000000,65.493000>}
box{<0,0,-0.127000><2.279712,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.373000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.908000,0.000000,67.564000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.985000,0.000000,65.493000>}
box{<0,0,-0.127000><2.072431,0.035000,0.127000> rotate<0,87.864918,0> translate<64.908000,0.000000,67.564000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.823200,0.000000,35.629200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,35.560000>}
box{<0,0,-0.127000><1.456445,0.035000,0.127000> rotate<0,2.723137,0> translate<63.823200,0.000000,35.629200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.119000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,46.482000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<63.119000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,48.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.397000,0.000000,48.395000>}
box{<0,0,-0.127000><9.387000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,48.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.578000,0.000000,35.514000>}
box{<0,0,-0.127000><0.303506,0.035000,0.127000> rotate<0,8.716882,0> translate<65.278000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.786000,0.000000,45.974000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<65.278000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.913000,0.000000,48.895000>}
box{<0,0,-0.127000><9.903000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.389000,0.000000,59.842400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.395600,0.000000,59.842400>}
box{<0,0,-0.127000><2.006600,0.035000,0.127000> rotate<0,0.000000,0> translate<64.389000,0.000000,59.842400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.395600,0.000000,59.842400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.421000,0.000000,59.817000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<66.395600,0.000000,59.842400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,49.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.564000,0.000000,49.895000>}
box{<0,0,-0.127000><10.554000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,49.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.397000,0.000000,48.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.929000,0.000000,46.863000>}
box{<0,0,-0.127000><2.166575,0.035000,0.127000> rotate<0,44.997030,0> translate<65.397000,0.000000,48.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,50.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.953000,0.000000,50.395000>}
box{<0,0,-0.127000><10.943000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,50.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.273000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,0.000000,57.658000>}
box{<0,0,-0.127000><11.910000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.273000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.913000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,47.498000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<65.913000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,50.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.342000,0.000000,50.895000>}
box{<0,0,-0.127000><11.332000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,50.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,51.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.604000,0.000000,51.395000>}
box{<0,0,-0.127000><11.594000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,51.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,54.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.103000,0.000000,54.895000>}
box{<0,0,-0.127000><12.093000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,54.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.564000,0.000000,49.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.199000,0.000000,48.260000>}
box{<0,0,-0.127000><2.312239,0.035000,0.127000> rotate<0,44.997030,0> translate<66.564000,0.000000,49.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.953000,0.000000,50.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.453000,0.000000,48.895000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<66.953000,0.000000,50.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.578000,0.000000,35.514000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.515000,0.000000,35.514000>}
box{<0,0,-0.127000><2.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.578000,0.000000,35.514000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.342000,0.000000,50.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.707000,0.000000,49.530000>}
box{<0,0,-0.127000><1.930402,0.035000,0.127000> rotate<0,44.997030,0> translate<67.342000,0.000000,50.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.604000,0.000000,51.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.961000,0.000000,50.038000>}
box{<0,0,-0.127000><1.919088,0.035000,0.127000> rotate<0,44.997030,0> translate<67.604000,0.000000,51.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.786000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.342000,0.000000,45.974000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.786000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,0.000000,41.275000>}
box{<0,0,-0.127000><9.652000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.198000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.944000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.977000,0.000000,42.037000>}
box{<0,0,-0.127000><10.033000,0.035000,0.127000> rotate<0,0.000000,0> translate<59.944000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,42.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.389000,0.000000,42.895000>}
box{<0,0,-0.127000><14.379000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,42.895000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<70.315000,0.000000,35.514000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<70.392000,0.000000,37.558000>}
box{<0,0,-0.406400><2.045450,0.035000,0.406400> rotate<0,-87.836820,0> translate<70.315000,0.000000,35.514000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<70.358000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<70.392000,0.000000,37.558000>}
box{<0,0,-0.406400><0.099020,0.035000,0.406400> rotate<0,-69.913408,0> translate<70.358000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.739000,0.000000,43.561000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<62.484000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.102000,0.000000,73.279000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,0.000000,73.279000>}
box{<0,0,-0.127000><17.018000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.102000,0.000000,73.279000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.882000,0.000000,7.239000>}
box{<0,0,-0.203200><15.367000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.515000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,37.719000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,-90.000000,0> translate<71.882000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,39.243000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<69.850000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.135000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.009000,-1.535000,45.339000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.135000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.103000,0.000000,54.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.009000,0.000000,58.801000>}
box{<0,0,-0.127000><5.523918,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.103000,0.000000,54.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,72.517000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.009000,0.000000,72.517000>}
box{<0,0,-0.127000><17.399000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.610000,0.000000,72.517000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.882000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,36.957000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<71.882000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,38.100000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<72.644000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.977000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,39.370000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,44.997030,0> translate<69.977000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.152000,0.000000,37.592000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<72.644000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.279000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.279000,0.000000,38.735000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<73.279000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.389000,0.000000,42.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.279000,0.000000,40.005000>}
box{<0,0,-0.127000><4.087077,0.035000,0.127000> rotate<0,44.997030,0> translate<70.389000,0.000000,42.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,0.000000,13.589000>}
box{<0,0,-0.203200><15.621000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.039000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.279000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,0.000000,38.354000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<73.279000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.882000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.041000,0.000000,9.398000>}
box{<0,0,-0.203200><3.053287,0.035000,0.203200> rotate<0,-44.997030,0> translate<71.882000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.041000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.041000,0.000000,39.497000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,-90.000000,0> translate<74.041000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.739000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.041000,0.000000,40.259000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,44.997030,0> translate<70.739000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.929000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,0.000000,46.863000>}
box{<0,0,-0.127000><7.239000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.929000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.422000,-1.535000,52.197000>}
box{<0,0,-0.127000><26.162000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,-1.535000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.041000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.549000,0.000000,38.989000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<74.041000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,0.000000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.828400,0.000000,65.303400>}
box{<0,0,-0.127000><10.812228,0.035000,0.127000> rotate<0,-44.997030,0> translate<67.183000,0.000000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,53.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.010000,0.000000,53.895000>}
box{<0,0,-0.127000><19.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.184000,0.000000,47.498000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<67.310000,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.311000,0.000000,11.938000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,44.997030,0> translate<73.660000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,51.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.486000,0.000000,51.895000>}
box{<0,0,-0.127000><19.476000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,51.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.342000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,0.000000,39.751000>}
box{<0,0,-0.127000><8.800651,0.035000,0.127000> rotate<0,44.997030,0> translate<69.342000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,0.000000,73.279000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.692000,0.000000,77.851000>}
box{<0,0,-0.127000><6.465784,0.035000,0.127000> rotate<0,-44.997030,0> translate<71.120000,0.000000,73.279000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.199000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.819000,0.000000,48.260000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,0.000000,0> translate<68.199000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.009000,0.000000,72.517000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.946000,0.000000,76.454000>}
box{<0,0,-0.127000><5.567759,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.009000,0.000000,72.517000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.486000,0.000000,51.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.073000,0.000000,51.308000>}
box{<0,0,-0.127000><0.830143,0.035000,0.127000> rotate<0,44.997030,0> translate<75.486000,0.000000,51.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.453000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,48.895000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,0.000000,0> translate<68.453000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.010000,0.000000,53.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,52.578000>}
box{<0,0,-0.127000><1.862519,0.035000,0.127000> rotate<0,44.997030,0> translate<75.010000,0.000000,53.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.010000,0.000000,54.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.542000,0.000000,54.395000>}
box{<0,0,-0.127000><20.532000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.010000,0.000000,54.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.692000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.898500,0.000000,77.851000>}
box{<0,0,-0.127000><1.206500,0.035000,0.127000> rotate<0,0.000000,0> translate<75.692000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.707000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.962000,0.000000,49.530000>}
box{<0,0,-0.127000><8.255000,0.035000,0.127000> rotate<0,0.000000,0> translate<68.707000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.898500,0.000000,77.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.962000,0.000000,77.787500>}
box{<0,0,-0.127000><0.089803,0.035000,0.127000> rotate<0,44.997030,0> translate<76.898500,0.000000,77.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.182000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.080000,0.000000,31.218000>}
box{<0,0,-0.127000><1.269964,0.035000,0.127000> rotate<0,-44.997030,0> translate<76.182000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.542000,0.000000,54.395000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.089000,0.000000,53.848000>}
box{<0,0,-0.127000><0.773575,0.035000,0.127000> rotate<0,44.997030,0> translate<76.542000,0.000000,54.395000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.080000,0.000000,31.218000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.157000,0.000000,35.585000>}
box{<0,0,-0.127000><4.367679,0.035000,0.127000> rotate<0,-88.983979,0> translate<77.080000,0.000000,31.218000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,0.000000,46.863000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,0.000000,43.688000>}
box{<0,0,-0.127000><4.490128,0.035000,0.127000> rotate<0,44.997030,0> translate<74.168000,0.000000,46.863000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.422000,-1.535000,52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,-1.535000,55.118000>}
box{<0,0,-0.127000><4.130918,0.035000,0.127000> rotate<0,-44.997030,0> translate<74.422000,-1.535000,52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.991000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,0.000000,71.755000>}
box{<0,0,-0.127000><22.352000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.991000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.184000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,44.958000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<75.184000,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,47.498000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<76.327000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.962000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,48.768000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<76.962000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.819000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.851000,0.000000,46.228000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<75.819000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.946000,0.000000,76.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.168500,0.000000,76.454000>}
box{<0,0,-0.127000><2.222500,0.035000,0.127000> rotate<0,0.000000,0> translate<75.946000,0.000000,76.454000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,44.958000>}
box{<0,0,-0.127000><0.812800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.724000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,47.498000>}
box{<0,0,-0.127000><0.812800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.724000,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.961000,0.000000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,50.038000>}
box{<0,0,-0.127000><9.575800,0.035000,0.127000> rotate<0,0.000000,0> translate<68.961000,0.000000,50.038000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.327000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,52.578000>}
box{<0,0,-0.127000><2.209800,0.035000,0.127000> rotate<0,0.000000,0> translate<76.327000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,-1.535000,55.118000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,-1.535000,55.118000>}
box{<0,0,-0.127000><1.193800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.343000,-1.535000,55.118000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,44.983400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.536800,0.000000,44.958000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,47.523400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.536800,0.000000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,50.063400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.536800,0.000000,50.038000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,0.000000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,52.603400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.536800,0.000000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.536800,-1.535000,55.118000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,-1.535000,55.143400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.536800,-1.535000,55.118000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.828400,0.000000,65.303400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,65.303400>}
box{<0,0,-0.127000><3.733800,0.035000,0.127000> rotate<0,0.000000,0> translate<74.828400,0.000000,65.303400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,60.223400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.638400,0.000000,60.223400>}
box{<0,0,-0.127000><0.076200,0.035000,0.127000> rotate<0,0.000000,0> translate<78.562200,0.000000,60.223400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.638400,0.000000,62.763400>}
box{<0,0,-0.127000><0.076200,0.035000,0.127000> rotate<0,0.000000,0> translate<78.562200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.562200,0.000000,57.683400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.892400,0.000000,57.683400>}
box{<0,0,-0.127000><0.330200,0.035000,0.127000> rotate<0,0.000000,0> translate<78.562200,0.000000,57.683400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,73.914000>}
box{<0,0,-0.127000><3.053287,0.035000,0.127000> rotate<0,-44.997030,0> translate<77.343000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,73.914000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,75.247500>}
box{<0,0,-0.127000><1.333500,0.035000,0.127000> rotate<0,90.000000,0> translate<79.502000,0.000000,75.247500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.168500,0.000000,76.454000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,77.787500>}
box{<0,0,-0.127000><1.885854,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.168500,0.000000,76.454000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<78.957000,0.000000,35.585000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.738000,0.000000,34.881000>}
box{<0,0,-0.508000><1.051464,0.035000,0.508000> rotate<0,42.028992,0> translate<78.957000,0.000000,35.585000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.738000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.738000,0.000000,34.881000>}
box{<0,0,-0.508000><4.561000,0.035000,0.508000> rotate<0,90.000000,0> translate<79.738000,0.000000,34.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.134000,0.000000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.756000,0.000000,68.961000>}
box{<0,0,-0.127000><23.622000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.134000,0.000000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.343000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,43.688000>}
box{<0,0,-0.127000><2.463800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.343000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.851000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,46.228000>}
box{<0,0,-0.127000><1.955800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.851000,0.000000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.724000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,48.768000>}
box{<0,0,-0.127000><2.082800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.724000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.073000,0.000000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,51.308000>}
box{<0,0,-0.127000><3.733800,0.035000,0.127000> rotate<0,0.000000,0> translate<76.073000,0.000000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.089000,0.000000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,53.848000>}
box{<0,0,-0.127000><2.717800,0.035000,0.127000> rotate<0,0.000000,0> translate<77.089000,0.000000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.007000,-1.535000,56.388000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,-1.535000,56.388000>}
box{<0,0,-0.127000><23.876000,0.035000,0.127000> rotate<0,0.000000,0> translate<56.007000,-1.535000,56.388000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.638400,0.000000,60.223400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,0.000000,61.468000>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.638400,0.000000,60.223400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.638400,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,0.000000,64.008000>}
box{<0,0,-0.127000><1.760130,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.638400,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.892400,0.000000,57.683400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.264000,0.000000,59.055000>}
box{<0,0,-0.127000><1.939735,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.892400,0.000000,57.683400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,69.596000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.899000,0.000000,69.596000>}
box{<0,0,-0.127000><25.019000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.880000,0.000000,69.596000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,44.983400>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.806800,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,47.523400>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.806800,0.000000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,50.063400>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.806800,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,52.603400>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.806800,0.000000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.806800,0.000000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,55.143400>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.806800,0.000000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,-1.535000,56.388000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,-1.535000,57.607200>}
box{<0,0,-0.127000><1.724209,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.883000,-1.535000,56.388000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,-1.535000,57.607200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,-1.535000,57.683400>}
box{<0,0,-0.127000><0.076200,0.035000,0.127000> rotate<0,90.000000,0> translate<81.102200,-1.535000,57.683400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,67.614800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,65.303400>}
box{<0,0,-0.127000><2.311400,0.035000,0.127000> rotate<0,-90.000000,0> translate<81.102200,0.000000,65.303400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.756000,0.000000,68.961000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,67.614800>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,44.997030,0> translate<79.756000,0.000000,68.961000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.009000,-1.535000,45.339000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.407000,-1.535000,35.941000>}
box{<0,0,-0.127000><13.290779,0.035000,0.127000> rotate<0,44.997030,0> translate<72.009000,-1.535000,45.339000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.407000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.788000,-1.535000,35.560000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<81.407000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.915000,0.000000,70.231000>}
box{<0,0,-0.127000><26.289000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.626000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,0.000000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.042000,0.000000,64.008000>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,0.000000,0> translate<79.883000,0.000000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.042000,0.000000,64.008000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,64.516000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<82.042000,0.000000,64.008000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,64.516000>}
box{<0,0,-0.127000><3.429000,0.035000,0.127000> rotate<0,-90.000000,0> translate<82.550000,0.000000,64.516000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.899000,0.000000,69.596000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,67.945000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,44.997030,0> translate<80.899000,0.000000,69.596000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.245000,0.000000,70.993000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,70.993000>}
box{<0,0,-0.127000><27.305000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.245000,0.000000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.677000,0.000000,39.751000>}
box{<0,0,-0.127000><7.112000,0.035000,0.127000> rotate<0,0.000000,0> translate<75.565000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,62.763400>}
box{<0,0,-0.127000><1.600200,0.035000,0.127000> rotate<0,0.000000,0> translate<81.102200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.549000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.058000,0.000000,38.989000>}
box{<0,0,-0.127000><8.509000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.549000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.102200,0.000000,60.223400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.210400,0.000000,60.223400>}
box{<0,0,-0.127000><2.108200,0.035000,0.127000> rotate<0,0.000000,0> translate<81.102200,0.000000,60.223400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.883000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,61.468000>}
box{<0,0,-0.127000><3.429000,0.035000,0.127000> rotate<0,0.000000,0> translate<79.883000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.702400,0.000000,62.763400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,63.373000>}
box{<0,0,-0.127000><0.862105,0.035000,0.127000> rotate<0,-44.997030,0> translate<82.702400,0.000000,62.763400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,68.834000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,63.373000>}
box{<0,0,-0.127000><5.461000,0.035000,0.127000> rotate<0,-90.000000,0> translate<83.312000,0.000000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.915000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,68.834000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<81.915000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,78.994000>}
box{<0,0,-0.127000><23.114000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.198000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.566000,0.000000,38.354000>}
box{<0,0,-0.127000><9.906000,0.035000,0.127000> rotate<0,0.000000,0> translate<73.660000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.947000,0.000000,62.103000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.312000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.947000,0.000000,69.596000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.947000,0.000000,62.103000>}
box{<0,0,-0.127000><7.493000,0.035000,0.127000> rotate<0,-90.000000,0> translate<83.947000,0.000000,62.103000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.550000,0.000000,70.993000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.947000,0.000000,69.596000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<82.550000,0.000000,70.993000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.071000,0.000000,79.756000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.074000,0.000000,79.756000>}
box{<0,0,-0.127000><24.003000,0.035000,0.127000> rotate<0,0.000000,0> translate<60.071000,0.000000,79.756000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.644000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.201000,0.000000,36.957000>}
box{<0,0,-0.127000><11.557000,0.035000,0.127000> rotate<0,0.000000,0> translate<72.644000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.264000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.582000,0.000000,59.055000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,0.000000,0> translate<80.264000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.210400,0.000000,60.223400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.709000,0.000000,61.722000>}
box{<0,0,-0.127000><2.119340,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.210400,0.000000,60.223400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.709000,0.000000,77.597000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.709000,0.000000,61.722000>}
box{<0,0,-0.127000><15.875000,0.035000,0.127000> rotate<0,-90.000000,0> translate<84.709000,0.000000,61.722000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.312000,0.000000,78.994000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.709000,0.000000,77.597000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,44.997030,0> translate<83.312000,0.000000,78.994000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.152000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.090000,0.000000,37.592000>}
box{<0,0,-0.127000><11.938000,0.035000,0.127000> rotate<0,0.000000,0> translate<73.152000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.677000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,0.000000,42.545000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<82.677000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.582000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.598000,0.000000,60.071000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<84.582000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.598000,0.000000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.598000,0.000000,60.071000>}
box{<0,0,-0.127000><18.161000,0.035000,0.127000> rotate<0,-90.000000,0> translate<85.598000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.074000,0.000000,79.756000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.598000,0.000000,78.232000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,44.997030,0> translate<84.074000,0.000000,79.756000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.058000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.725000,0.000000,41.656000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.058000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.566000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.852000,0.000000,40.640000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.566000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.487000,0.000000,42.545000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.471000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.788000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.614000,-1.535000,35.560000>}
box{<0,0,-0.127000><4.826000,0.035000,0.127000> rotate<0,0.000000,0> translate<81.788000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.201000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.122000,0.000000,34.036000>}
box{<0,0,-0.127000><4.130918,0.035000,0.127000> rotate<0,44.997030,0> translate<84.201000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.090000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.376000,0.000000,35.306000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<85.090000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.487000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.503000,0.000000,43.561000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<86.487000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.503000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.503000,0.000000,57.404000>}
box{<0,0,-0.127000><13.843000,0.035000,0.127000> rotate<0,90.000000,0> translate<87.503000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.725000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.757000,0.000000,41.656000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.725000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.852000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.884000,0.000000,40.640000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<85.852000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.395000,0.000000,27.739000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.937000,0.000000,27.739000>}
box{<0,0,-0.304800><33.542000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.395000,0.000000,27.739000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.991000,-1.535000,72.263000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.011000,-1.535000,72.263000>}
box{<0,0,-0.127000><33.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.991000,-1.535000,72.263000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.757000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.265000,0.000000,42.164000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<87.757000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.265000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.265000,0.000000,50.800000>}
box{<0,0,-0.127000><8.636000,0.035000,0.127000> rotate<0,90.000000,0> translate<88.265000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.646000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.646000,-1.535000,29.464000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,-90.000000,0> translate<88.646000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<86.614000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.646000,-1.535000,33.528000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<86.614000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.265000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.773000,0.000000,51.308000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<88.265000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.011000,-1.535000,72.263000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.773000,-1.535000,73.025000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<88.011000,-1.535000,72.263000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.884000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.900000,0.000000,41.656000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<87.884000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.900000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.900000,0.000000,42.418000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,90.000000,0> translate<88.900000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.503000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.027000,0.000000,58.928000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<87.503000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.900000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.662000,0.000000,43.180000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<88.900000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.646000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.170000,-1.535000,27.940000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,44.997030,0> translate<88.646000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.937000,0.000000,27.739000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.059000,0.000000,23.749000>}
box{<0,0,-0.304800><5.066259,0.035000,0.304800> rotate<0,51.954950,0> translate<87.937000,0.000000,27.739000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.027000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.536000,0.000000,58.928000>}
box{<0,0,-0.127000><8.509000,0.035000,0.127000> rotate<0,0.000000,0> translate<89.027000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<90.170000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,-1.535000,27.940000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,0.000000,0> translate<90.170000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.122000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,0.000000,34.036000>}
box{<0,0,-0.127000><10.668000,0.035000,0.127000> rotate<0,0.000000,0> translate<87.122000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.773000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,-1.535000,73.025000>}
box{<0,0,-0.127000><9.017000,0.035000,0.127000> rotate<0,0.000000,0> translate<88.773000,-1.535000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<87.376000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,35.306000>}
box{<0,0,-0.127000><10.668000,0.035000,0.127000> rotate<0,0.000000,0> translate<87.376000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<89.662000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,43.180000>}
box{<0,0,-0.127000><8.382000,0.035000,0.127000> rotate<0,0.000000,0> translate<89.662000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<88.773000,0.000000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,51.308000>}
box{<0,0,-0.127000><9.271000,0.035000,0.127000> rotate<0,0.000000,0> translate<88.773000,0.000000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,23.749000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,-90.000000,0> translate<98.679000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,27.051000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<97.790000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,31.496000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,-90.000000,0> translate<98.679000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,33.147000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<97.790000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,35.941000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<98.044000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,39.243000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,90.000000,0> translate<98.679000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,43.815000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<98.044000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,47.244000>}
box{<0,0,-0.127000><3.429000,0.035000,0.127000> rotate<0,90.000000,0> translate<98.679000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.044000,0.000000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,51.943000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<98.044000,0.000000,51.308000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,51.943000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,54.991000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<98.679000,0.000000,54.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.536000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,60.071000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<97.536000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,62.738000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,90.000000,0> translate<98.679000,0.000000,62.738000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,72.136000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,70.485000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,-90.000000,0> translate<98.679000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.790000,-1.535000,73.025000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,-1.535000,72.136000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<97.790000,-1.535000,73.025000> }
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
cylinder{<34.099500,0.038000,77.787500><34.099500,-1.538000,77.787500>0.457200}
cylinder{<34.099500,0.038000,75.247500><34.099500,-1.538000,75.247500>0.457200}
cylinder{<31.559500,0.038000,77.787500><31.559500,-1.538000,77.787500>0.457200}
cylinder{<31.559500,0.038000,75.247500><31.559500,-1.538000,75.247500>0.457200}
cylinder{<29.019500,0.038000,77.787500><29.019500,-1.538000,77.787500>0.457200}
cylinder{<29.019500,0.038000,75.247500><29.019500,-1.538000,75.247500>0.457200}
cylinder{<18.351500,0.038000,77.787500><18.351500,-1.538000,77.787500>0.457200}
cylinder{<18.351500,0.038000,75.247500><18.351500,-1.538000,75.247500>0.457200}
cylinder{<15.811500,0.038000,77.787500><15.811500,-1.538000,77.787500>0.457200}
cylinder{<15.811500,0.038000,75.247500><15.811500,-1.538000,75.247500>0.457200}
cylinder{<13.271500,0.038000,77.787500><13.271500,-1.538000,77.787500>0.457200}
cylinder{<13.271500,0.038000,75.247500><13.271500,-1.538000,75.247500>0.457200}
cylinder{<79.738000,0.038000,30.320000><79.738000,-1.538000,30.320000>0.406400}
cylinder{<76.182000,0.038000,30.320000><76.182000,-1.538000,30.320000>0.406400}
cylinder{<71.358000,0.038000,30.320000><71.358000,-1.538000,30.320000>0.406400}
cylinder{<67.802000,0.038000,30.320000><67.802000,-1.538000,30.320000>0.406400}
cylinder{<62.843000,0.038000,30.320000><62.843000,-1.538000,30.320000>0.406400}
cylinder{<59.287000,0.038000,30.320000><59.287000,-1.538000,30.320000>0.406400}
cylinder{<72.009000,0.038000,58.801000><72.009000,-1.538000,58.801000>0.508000}
cylinder{<40.005000,0.038000,39.116000><40.005000,-1.538000,39.116000>0.508000}
cylinder{<91.059000,0.038000,23.749000><91.059000,-1.538000,23.749000>0.508000}
cylinder{<93.599000,0.038000,23.749000><93.599000,-1.538000,23.749000>0.508000}
cylinder{<96.139000,0.038000,23.749000><96.139000,-1.538000,23.749000>0.508000}
cylinder{<98.679000,0.038000,23.749000><98.679000,-1.538000,23.749000>0.508000}
cylinder{<42.037000,0.038000,62.230000><42.037000,-1.538000,62.230000>0.508000}
cylinder{<42.037000,0.038000,64.770000><42.037000,-1.538000,64.770000>0.508000}
cylinder{<42.037000,0.038000,67.310000><42.037000,-1.538000,67.310000>0.508000}
cylinder{<42.037000,0.038000,69.850000><42.037000,-1.538000,69.850000>0.508000}
cylinder{<90.297000,0.038000,10.287000><90.297000,-1.538000,10.287000>0.500000}
cylinder{<90.297000,0.038000,7.747000><90.297000,-1.538000,7.747000>0.500000}
cylinder{<90.297000,0.038000,12.827000><90.297000,-1.538000,12.827000>0.500000}
cylinder{<31.394400,0.038000,32.512000><31.394400,-1.538000,32.512000>0.457200}
cylinder{<33.934400,0.038000,32.512000><33.934400,-1.538000,32.512000>0.457200}
cylinder{<31.394400,0.038000,29.972000><31.394400,-1.538000,29.972000>0.457200}
cylinder{<33.934400,0.038000,29.972000><33.934400,-1.538000,29.972000>0.457200}
cylinder{<31.394400,0.038000,27.432000><31.394400,-1.538000,27.432000>0.457200}
cylinder{<33.934400,0.038000,27.432000><33.934400,-1.538000,27.432000>0.457200}
cylinder{<81.102200,0.038000,42.443400><81.102200,-1.538000,42.443400>0.457200}
cylinder{<78.562200,0.038000,42.443400><78.562200,-1.538000,42.443400>0.457200}
cylinder{<81.102200,0.038000,44.983400><81.102200,-1.538000,44.983400>0.457200}
cylinder{<78.562200,0.038000,44.983400><78.562200,-1.538000,44.983400>0.457200}
cylinder{<81.102200,0.038000,47.523400><81.102200,-1.538000,47.523400>0.457200}
cylinder{<78.562200,0.038000,47.523400><78.562200,-1.538000,47.523400>0.457200}
cylinder{<81.102200,0.038000,50.063400><81.102200,-1.538000,50.063400>0.457200}
cylinder{<78.562200,0.038000,50.063400><78.562200,-1.538000,50.063400>0.457200}
cylinder{<81.102200,0.038000,52.603400><81.102200,-1.538000,52.603400>0.457200}
cylinder{<78.562200,0.038000,52.603400><78.562200,-1.538000,52.603400>0.457200}
cylinder{<81.102200,0.038000,55.143400><81.102200,-1.538000,55.143400>0.457200}
cylinder{<78.562200,0.038000,55.143400><78.562200,-1.538000,55.143400>0.457200}
cylinder{<81.102200,0.038000,57.683400><81.102200,-1.538000,57.683400>0.457200}
cylinder{<78.562200,0.038000,57.683400><78.562200,-1.538000,57.683400>0.457200}
cylinder{<81.102200,0.038000,60.223400><81.102200,-1.538000,60.223400>0.457200}
cylinder{<78.562200,0.038000,60.223400><78.562200,-1.538000,60.223400>0.457200}
cylinder{<81.102200,0.038000,62.763400><81.102200,-1.538000,62.763400>0.457200}
cylinder{<78.562200,0.038000,62.763400><78.562200,-1.538000,62.763400>0.457200}
cylinder{<81.102200,0.038000,65.303400><81.102200,-1.538000,65.303400>0.457200}
cylinder{<78.562200,0.038000,65.303400><78.562200,-1.538000,65.303400>0.457200}
cylinder{<42.291000,0.038000,9.398000><42.291000,-1.538000,9.398000>0.444500}
cylinder{<43.561000,0.038000,11.938000><43.561000,-1.538000,11.938000>0.444500}
cylinder{<44.831000,0.038000,9.398000><44.831000,-1.538000,9.398000>0.444500}
cylinder{<46.101000,0.038000,11.938000><46.101000,-1.538000,11.938000>0.444500}
cylinder{<47.371000,0.038000,9.398000><47.371000,-1.538000,9.398000>0.444500}
cylinder{<48.641000,0.038000,11.938000><48.641000,-1.538000,11.938000>0.444500}
cylinder{<49.911000,0.038000,9.398000><49.911000,-1.538000,9.398000>0.444500}
cylinder{<51.181000,0.038000,11.938000><51.181000,-1.538000,11.938000>0.444500}
cylinder{<58.166000,0.038000,9.398000><58.166000,-1.538000,9.398000>0.444500}
cylinder{<59.436000,0.038000,11.938000><59.436000,-1.538000,11.938000>0.444500}
cylinder{<60.706000,0.038000,9.398000><60.706000,-1.538000,9.398000>0.444500}
cylinder{<61.976000,0.038000,11.938000><61.976000,-1.538000,11.938000>0.444500}
cylinder{<63.246000,0.038000,9.398000><63.246000,-1.538000,9.398000>0.444500}
cylinder{<64.516000,0.038000,11.938000><64.516000,-1.538000,11.938000>0.444500}
cylinder{<65.786000,0.038000,9.398000><65.786000,-1.538000,9.398000>0.444500}
cylinder{<67.056000,0.038000,11.938000><67.056000,-1.538000,11.938000>0.444500}
cylinder{<74.041000,0.038000,9.398000><74.041000,-1.538000,9.398000>0.444500}
cylinder{<75.311000,0.038000,11.938000><75.311000,-1.538000,11.938000>0.444500}
cylinder{<76.581000,0.038000,9.398000><76.581000,-1.538000,9.398000>0.444500}
cylinder{<77.851000,0.038000,11.938000><77.851000,-1.538000,11.938000>0.444500}
cylinder{<79.121000,0.038000,9.398000><79.121000,-1.538000,9.398000>0.444500}
cylinder{<80.391000,0.038000,11.938000><80.391000,-1.538000,11.938000>0.444500}
cylinder{<81.661000,0.038000,9.398000><81.661000,-1.538000,9.398000>0.444500}
cylinder{<82.931000,0.038000,11.938000><82.931000,-1.538000,11.938000>0.444500}
cylinder{<26.416000,0.038000,9.398000><26.416000,-1.538000,9.398000>0.444500}
cylinder{<27.686000,0.038000,11.938000><27.686000,-1.538000,11.938000>0.444500}
cylinder{<28.956000,0.038000,9.398000><28.956000,-1.538000,9.398000>0.444500}
cylinder{<30.226000,0.038000,11.938000><30.226000,-1.538000,11.938000>0.444500}
cylinder{<31.496000,0.038000,9.398000><31.496000,-1.538000,9.398000>0.444500}
cylinder{<32.766000,0.038000,11.938000><32.766000,-1.538000,11.938000>0.444500}
cylinder{<34.036000,0.038000,9.398000><34.036000,-1.538000,9.398000>0.444500}
cylinder{<35.306000,0.038000,11.938000><35.306000,-1.538000,11.938000>0.444500}
cylinder{<20.701000,0.038000,9.398000><20.701000,-1.538000,9.398000>0.508000}
cylinder{<20.701000,0.038000,11.938000><20.701000,-1.538000,11.938000>0.508000}
cylinder{<84.582000,0.038000,30.607000><84.582000,-1.538000,30.607000>0.508000}
cylinder{<84.582000,0.038000,33.147000><84.582000,-1.538000,33.147000>0.508000}
cylinder{<26.745000,0.038000,41.656000><26.745000,-1.538000,41.656000>0.450000}
cylinder{<20.245000,0.038000,41.656000><20.245000,-1.538000,41.656000>0.450000}
cylinder{<58.547000,0.038000,63.881000><58.547000,-1.538000,63.881000>0.406400}
cylinder{<63.373000,0.038000,63.881000><63.373000,-1.538000,63.881000>0.406400}
cylinder{<2.184400,0.038000,70.840600><2.184400,-1.538000,70.840600>0.508000}
cylinder{<2.184400,0.038000,66.319400><2.184400,-1.538000,66.319400>0.508000}
cylinder{<4.673600,0.038000,72.085200><4.673600,-1.538000,72.085200>0.749300}
cylinder{<4.673600,0.038000,65.074800><4.673600,-1.538000,65.074800>0.749300}
cylinder{<5.013200,0.038000,43.025000><5.013200,-1.538000,43.025000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<5.013200,0.038000,41.525000><5.013200,-1.538000,41.525000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<5.013200,0.038000,40.025000><5.013200,-1.538000,40.025000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<3.013200,0.038000,43.025000><3.013200,-1.538000,43.025000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<3.013200,0.038000,41.525000><3.013200,-1.538000,41.525000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<3.013200,0.038000,40.025000><3.013200,-1.538000,40.025000>0.300000}
cylinder{<4.013200,0.038000,46.025000><4.013200,-1.538000,46.025000>0.550000 }
cylinder{<4.013200,0.038000,37.025000><4.013200,-1.538000,37.025000>0.550000 }
cylinder{<5.013200,0.038000,31.853000><5.013200,-1.538000,31.853000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<5.013200,0.038000,30.353000><5.013200,-1.538000,30.353000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<5.013200,0.038000,28.853000><5.013200,-1.538000,28.853000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<3.013200,0.038000,31.853000><3.013200,-1.538000,31.853000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<3.013200,0.038000,30.353000><3.013200,-1.538000,30.353000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<3.013200,0.038000,28.853000><3.013200,-1.538000,28.853000>0.300000}
cylinder{<4.013200,0.038000,34.853000><4.013200,-1.538000,34.853000>0.550000 }
cylinder{<4.013200,0.038000,25.853000><4.013200,-1.538000,25.853000>0.550000 }
cylinder{<82.042000,0.038000,77.787500><82.042000,-1.538000,77.787500>0.457200}
cylinder{<82.042000,0.038000,75.247500><82.042000,-1.538000,75.247500>0.457200}
cylinder{<79.502000,0.038000,77.787500><79.502000,-1.538000,77.787500>0.457200}
cylinder{<79.502000,0.038000,75.247500><79.502000,-1.538000,75.247500>0.457200}
cylinder{<76.962000,0.038000,77.787500><76.962000,-1.538000,77.787500>0.457200}
cylinder{<76.962000,0.038000,75.247500><76.962000,-1.538000,75.247500>0.457200}
cylinder{<91.059000,0.038000,62.738000><91.059000,-1.538000,62.738000>0.508000}
cylinder{<93.599000,0.038000,62.738000><93.599000,-1.538000,62.738000>0.508000}
cylinder{<96.139000,0.038000,62.738000><96.139000,-1.538000,62.738000>0.508000}
cylinder{<98.679000,0.038000,62.738000><98.679000,-1.538000,62.738000>0.508000}
cylinder{<91.059000,0.038000,70.485000><91.059000,-1.538000,70.485000>0.508000}
cylinder{<93.599000,0.038000,70.485000><93.599000,-1.538000,70.485000>0.508000}
cylinder{<96.139000,0.038000,70.485000><96.139000,-1.538000,70.485000>0.508000}
cylinder{<98.679000,0.038000,70.485000><98.679000,-1.538000,70.485000>0.508000}
cylinder{<41.425000,0.038000,23.705000><41.425000,-1.538000,23.705000>0.700000}
cylinder{<45.625000,0.038000,23.705000><45.625000,-1.538000,23.705000>0.700000}
cylinder{<49.825000,0.038000,23.705000><49.825000,-1.538000,23.705000>0.700000}
cylinder{<54.025000,0.038000,23.705000><54.025000,-1.538000,23.705000>0.700000}
cylinder{<58.225000,0.038000,23.705000><58.225000,-1.538000,23.705000>0.700000}
cylinder{<62.425000,0.038000,23.705000><62.425000,-1.538000,23.705000>0.700000}
cylinder{<66.625000,0.038000,23.705000><66.625000,-1.538000,23.705000>0.700000}
cylinder{<70.825000,0.038000,23.705000><70.825000,-1.538000,23.705000>0.700000}
cylinder{<75.025000,0.038000,23.705000><75.025000,-1.538000,23.705000>0.700000}
cylinder{<79.225000,0.038000,23.705000><79.225000,-1.538000,23.705000>0.700000}
cylinder{<41.425000,0.038000,18.205000><41.425000,-1.538000,18.205000>0.700000}
cylinder{<45.625000,0.038000,18.205000><45.625000,-1.538000,18.205000>0.700000}
cylinder{<49.825000,0.038000,18.205000><49.825000,-1.538000,18.205000>0.700000}
cylinder{<54.025000,0.038000,18.205000><54.025000,-1.538000,18.205000>0.700000}
cylinder{<58.225000,0.038000,18.205000><58.225000,-1.538000,18.205000>0.700000}
cylinder{<62.425000,0.038000,18.205000><62.425000,-1.538000,18.205000>0.700000}
cylinder{<66.625000,0.038000,18.205000><66.625000,-1.538000,18.205000>0.700000}
cylinder{<70.825000,0.038000,18.205000><70.825000,-1.538000,18.205000>0.700000}
cylinder{<75.025000,0.038000,18.205000><75.025000,-1.538000,18.205000>0.700000}
cylinder{<79.225000,0.038000,18.205000><79.225000,-1.538000,18.205000>0.700000}
cylinder{<7.885000,0.038000,53.995000><7.885000,-1.538000,53.995000>0.475000}
cylinder{<7.885000,0.038000,56.495000><7.885000,-1.538000,56.495000>0.475000}
cylinder{<5.885000,0.038000,56.495000><5.885000,-1.538000,56.495000>0.475000}
cylinder{<5.885000,0.038000,53.995000><5.885000,-1.538000,53.995000>0.475000}
cylinder{<97.536000,0.038000,10.795000><97.536000,-1.538000,10.795000>0.698500}
cylinder{<97.536000,0.038000,15.875000><97.536000,-1.538000,15.875000>0.698500}
cylinder{<66.040000,0.038000,77.787500><66.040000,-1.538000,77.787500>0.457200}
cylinder{<66.040000,0.038000,75.247500><66.040000,-1.538000,75.247500>0.457200}
cylinder{<63.500000,0.038000,77.787500><63.500000,-1.538000,77.787500>0.457200}
cylinder{<63.500000,0.038000,75.247500><63.500000,-1.538000,75.247500>0.457200}
cylinder{<60.960000,0.038000,77.787500><60.960000,-1.538000,77.787500>0.457200}
cylinder{<60.960000,0.038000,75.247500><60.960000,-1.538000,75.247500>0.457200}
cylinder{<91.059000,0.038000,47.244000><91.059000,-1.538000,47.244000>0.508000}
cylinder{<93.599000,0.038000,47.244000><93.599000,-1.538000,47.244000>0.508000}
cylinder{<96.139000,0.038000,47.244000><96.139000,-1.538000,47.244000>0.508000}
cylinder{<98.679000,0.038000,47.244000><98.679000,-1.538000,47.244000>0.508000}
cylinder{<91.059000,0.038000,54.991000><91.059000,-1.538000,54.991000>0.508000}
cylinder{<93.599000,0.038000,54.991000><93.599000,-1.538000,54.991000>0.508000}
cylinder{<96.139000,0.038000,54.991000><96.139000,-1.538000,54.991000>0.508000}
cylinder{<98.679000,0.038000,54.991000><98.679000,-1.538000,54.991000>0.508000}
cylinder{<50.038000,0.038000,77.787500><50.038000,-1.538000,77.787500>0.457200}
cylinder{<50.038000,0.038000,75.247500><50.038000,-1.538000,75.247500>0.457200}
cylinder{<47.498000,0.038000,77.787500><47.498000,-1.538000,77.787500>0.457200}
cylinder{<47.498000,0.038000,75.247500><47.498000,-1.538000,75.247500>0.457200}
cylinder{<44.958000,0.038000,77.787500><44.958000,-1.538000,77.787500>0.457200}
cylinder{<44.958000,0.038000,75.247500><44.958000,-1.538000,75.247500>0.457200}
cylinder{<91.059000,0.038000,31.496000><91.059000,-1.538000,31.496000>0.508000}
cylinder{<93.599000,0.038000,31.496000><93.599000,-1.538000,31.496000>0.508000}
cylinder{<96.139000,0.038000,31.496000><96.139000,-1.538000,31.496000>0.508000}
cylinder{<98.679000,0.038000,31.496000><98.679000,-1.538000,31.496000>0.508000}
cylinder{<91.059000,0.038000,39.243000><91.059000,-1.538000,39.243000>0.508000}
cylinder{<93.599000,0.038000,39.243000><93.599000,-1.538000,39.243000>0.508000}
cylinder{<96.139000,0.038000,39.243000><96.139000,-1.538000,39.243000>0.508000}
cylinder{<98.679000,0.038000,39.243000><98.679000,-1.538000,39.243000>0.508000}
//Holes(fast)/Vias
cylinder{<46.990000,0.038000,70.612000><46.990000,-1.538000,70.612000>0.190500 }
cylinder{<43.434000,0.038000,60.198000><43.434000,-1.538000,60.198000>0.190500 }
cylinder{<16.510000,0.038000,49.784000><16.510000,-1.538000,49.784000>0.190500 }
cylinder{<13.970000,0.038000,62.230000><13.970000,-1.538000,62.230000>0.190500 }
cylinder{<17.018000,0.038000,69.850000><17.018000,-1.538000,69.850000>0.190500 }
cylinder{<43.180000,0.038000,50.546000><43.180000,-1.538000,50.546000>0.190500 }
cylinder{<43.688000,0.038000,43.942000><43.688000,-1.538000,43.942000>0.190500 }
cylinder{<55.626000,0.038000,41.656000><55.626000,-1.538000,41.656000>0.190500 }
cylinder{<53.086000,0.038000,47.244000><53.086000,-1.538000,47.244000>0.190500 }
cylinder{<52.070000,0.038000,54.102000><52.070000,-1.538000,54.102000>0.190500 }
cylinder{<60.960000,0.038000,39.624000><60.960000,-1.538000,39.624000>0.190500 }
cylinder{<31.877000,0.038000,52.070000><31.877000,-1.538000,52.070000>0.190500 }
cylinder{<7.620000,0.038000,36.068000><7.620000,-1.538000,36.068000>0.190500 }
cylinder{<27.051000,0.038000,21.590000><27.051000,-1.538000,21.590000>0.190500 }
cylinder{<31.877000,0.038000,64.770000><31.877000,-1.538000,64.770000>0.190500 }
cylinder{<54.356000,0.038000,34.544000><54.356000,-1.538000,34.544000>0.190500 }
cylinder{<70.358000,0.038000,37.465000><70.358000,-1.538000,37.465000>0.190500 }
cylinder{<47.244000,0.038000,43.942000><47.244000,-1.538000,43.942000>0.190500 }
cylinder{<24.257000,0.038000,59.436000><24.257000,-1.538000,59.436000>0.190500 }
cylinder{<22.479000,0.038000,60.325000><22.479000,-1.538000,60.325000>0.190500 }
cylinder{<49.022000,0.038000,44.958000><49.022000,-1.538000,44.958000>0.190500 }
cylinder{<64.135000,0.038000,45.339000><64.135000,-1.538000,45.339000>0.190500 }
cylinder{<28.575000,0.038000,52.705000><28.575000,-1.538000,52.705000>0.190500 }
cylinder{<29.489400,0.038000,54.305200><29.489400,-1.538000,54.305200>0.190500 }
cylinder{<20.828000,0.038000,34.544000><20.828000,-1.538000,34.544000>0.190500 }
cylinder{<26.187400,0.038000,55.626000><26.187400,-1.538000,55.626000>0.190500 }
cylinder{<27.305000,0.038000,56.515000><27.305000,-1.538000,56.515000>0.190500 }
cylinder{<30.353000,0.038000,55.753000><30.353000,-1.538000,55.753000>0.190500 }
cylinder{<36.322000,0.038000,50.419000><36.322000,-1.538000,50.419000>0.190500 }
cylinder{<37.465000,0.038000,52.070000><37.465000,-1.538000,52.070000>0.190500 }
cylinder{<38.481000,0.038000,53.721000><38.481000,-1.538000,53.721000>0.190500 }
cylinder{<45.339000,0.038000,52.070000><45.339000,-1.538000,52.070000>0.190500 }
cylinder{<46.736000,0.038000,53.213000><46.736000,-1.538000,53.213000>0.190500 }
cylinder{<45.212000,0.038000,54.737000><45.212000,-1.538000,54.737000>0.190500 }
cylinder{<43.815000,0.038000,54.737000><43.815000,-1.538000,54.737000>0.190500 }
cylinder{<28.321000,0.038000,57.912000><28.321000,-1.538000,57.912000>0.190500 }
cylinder{<42.291000,0.038000,54.864000><42.291000,-1.538000,54.864000>0.190500 }
cylinder{<39.497000,0.038000,55.753000><39.497000,-1.538000,55.753000>0.190500 }
cylinder{<39.497000,0.038000,58.928000><39.497000,-1.538000,58.928000>0.190500 }
cylinder{<47.117000,0.038000,54.737000><47.117000,-1.538000,54.737000>0.190500 }
cylinder{<8.001000,0.038000,45.974000><8.001000,-1.538000,45.974000>0.190500 }
cylinder{<10.033000,0.038000,54.102000><10.033000,-1.538000,54.102000>0.190500 }
cylinder{<13.589000,0.038000,58.039000><13.589000,-1.538000,58.039000>0.190500 }
cylinder{<14.986000,0.038000,58.039000><14.986000,-1.538000,58.039000>0.190500 }
cylinder{<17.526000,0.038000,62.230000><17.526000,-1.538000,62.230000>0.190500 }
cylinder{<15.494000,0.038000,65.786000><15.494000,-1.538000,65.786000>0.190500 }
cylinder{<45.339000,0.038000,43.307000><45.339000,-1.538000,43.307000>0.190500 }
cylinder{<42.545000,0.038000,48.895000><42.545000,-1.538000,48.895000>0.190500 }
cylinder{<50.546000,0.038000,54.864000><50.546000,-1.538000,54.864000>0.190500 }
cylinder{<53.975000,0.038000,48.641000><53.975000,-1.538000,48.641000>0.190500 }
cylinder{<60.960000,0.038000,67.564000><60.960000,-1.538000,67.564000>0.190500 }
cylinder{<66.421000,0.038000,59.817000><66.421000,-1.538000,59.817000>0.190500 }
cylinder{<65.278000,0.038000,35.560000><65.278000,-1.538000,35.560000>0.190500 }
cylinder{<8.636000,0.038000,19.558000><8.636000,-1.538000,19.558000>0.190500 }
cylinder{<36.957000,0.038000,64.770000><36.957000,-1.538000,64.770000>0.190500 }
cylinder{<17.399000,0.038000,11.176000><17.399000,-1.538000,11.176000>0.190500 }
cylinder{<19.304000,0.038000,14.986000><19.304000,-1.538000,14.986000>0.190500 }
cylinder{<20.574000,0.038000,19.685000><20.574000,-1.538000,19.685000>0.190500 }
cylinder{<8.509000,0.038000,29.464000><8.509000,-1.538000,29.464000>0.190500 }
cylinder{<52.832000,0.038000,43.180000><52.832000,-1.538000,43.180000>0.190500 }
cylinder{<19.939000,0.038000,22.606000><19.939000,-1.538000,22.606000>0.190500 }
cylinder{<26.162000,0.038000,23.368000><26.162000,-1.538000,23.368000>0.190500 }
cylinder{<47.879000,0.038000,39.370000><47.879000,-1.538000,39.370000>0.190500 }
cylinder{<45.339000,0.038000,34.163000><45.339000,-1.538000,34.163000>0.190500 }
cylinder{<34.925000,0.038000,50.419000><34.925000,-1.538000,50.419000>0.190500 }
cylinder{<5.080000,0.038000,10.160000><5.080000,-1.538000,10.160000>0.190500 }
cylinder{<12.700000,0.038000,17.399000><12.700000,-1.538000,17.399000>0.190500 }
cylinder{<28.829000,0.038000,16.256000><28.829000,-1.538000,16.256000>0.190500 }
cylinder{<49.022000,0.038000,51.181000><49.022000,-1.538000,51.181000>0.190500 }
cylinder{<26.416000,0.038000,29.845000><26.416000,-1.538000,29.845000>0.190500 }
cylinder{<47.244000,0.038000,49.530000><47.244000,-1.538000,49.530000>0.190500 }
cylinder{<42.799000,0.038000,46.736000><42.799000,-1.538000,46.736000>0.190500 }
cylinder{<36.830000,0.038000,40.259000><36.830000,-1.538000,40.259000>0.190500 }
cylinder{<17.780000,0.038000,32.639000><17.780000,-1.538000,32.639000>0.190500 }
cylinder{<19.558000,0.038000,33.020000><19.558000,-1.538000,33.020000>0.190500 }
cylinder{<44.958000,0.038000,46.990000><44.958000,-1.538000,46.990000>0.190500 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.513800,0.000000,6.553200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.429200,0.000000,6.553200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<20.429200,0.000000,6.553200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.429200,0.000000,6.553200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.886900,0.000000,7.095500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<19.886900,0.000000,7.095500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.886900,0.000000,7.095500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.429200,0.000000,7.637800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.886900,0.000000,7.095500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.429200,0.000000,7.637800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.513800,0.000000,7.637800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<20.429200,0.000000,7.637800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.700400,0.000000,6.553200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.700400,0.000000,7.637800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<20.700400,0.000000,7.637800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.180800,0.000000,12.522200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.553900,0.000000,12.522200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<22.553900,0.000000,12.522200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.553900,0.000000,12.522200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.553900,0.000000,13.335600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<22.553900,0.000000,13.335600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.553900,0.000000,13.335600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.825000,0.000000,13.606800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<22.553900,0.000000,13.335600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.825000,0.000000,13.606800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.096200,0.000000,13.606800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<22.825000,0.000000,13.606800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.096200,0.000000,13.606800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.367400,0.000000,13.335600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<23.096200,0.000000,13.606800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.367400,0.000000,13.335600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.638500,0.000000,13.606800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<23.367400,0.000000,13.335600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.638500,0.000000,13.606800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.909700,0.000000,13.606800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<23.638500,0.000000,13.606800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.909700,0.000000,13.606800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.180800,0.000000,13.335600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<23.909700,0.000000,13.606800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.180800,0.000000,13.335600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.180800,0.000000,12.522200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.180800,0.000000,12.522200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.367400,0.000000,12.522200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.367400,0.000000,13.335600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<23.367400,0.000000,13.335600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.501100,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.501100,0.000000,45.301700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<21.501100,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.501100,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.971400,0.000000,45.301700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.501100,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.971400,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128100,0.000000,45.144900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<21.971400,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128100,0.000000,45.144900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128100,0.000000,44.831400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.128100,0.000000,44.831400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.128100,0.000000,44.831400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.971400,0.000000,44.674600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<21.971400,0.000000,44.674600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.971400,0.000000,44.674600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.501100,0.000000,44.674600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.501100,0.000000,44.674600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.436600,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750100,0.000000,44.361100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<22.436600,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.593300,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.593300,0.000000,45.301700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.593300,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.436600,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750100,0.000000,45.301700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<22.436600,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.687200,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.060200,0.000000,45.301700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<23.060200,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.060200,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.060200,0.000000,44.361100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.060200,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.060200,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.687200,0.000000,44.361100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<23.060200,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.060200,0.000000,44.831400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.373700,0.000000,44.831400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<23.060200,0.000000,44.831400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.995700,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622700,0.000000,45.301700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<23.995700,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622700,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622700,0.000000,45.144900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.622700,0.000000,45.144900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622700,0.000000,45.144900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.995700,0.000000,44.517800>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<23.995700,0.000000,44.517800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.995700,0.000000,44.517800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.995700,0.000000,44.361100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.995700,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.995700,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.622700,0.000000,44.361100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<23.995700,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.401500,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.087900,0.000000,45.301700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.087900,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.087900,0.000000,45.301700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.931200,0.000000,45.144900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<24.931200,0.000000,45.144900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.931200,0.000000,45.144900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.931200,0.000000,44.517800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.931200,0.000000,44.517800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.931200,0.000000,44.517800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.087900,0.000000,44.361100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<24.931200,0.000000,44.517800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.087900,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.401500,0.000000,44.361100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.087900,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.401500,0.000000,44.361100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.558200,0.000000,44.517800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.401500,0.000000,44.361100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.558200,0.000000,44.517800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.558200,0.000000,45.144900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<25.558200,0.000000,45.144900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.558200,0.000000,45.144900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.401500,0.000000,45.301700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<25.401500,0.000000,45.301700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,36.880800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,36.880800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.263300,0.000000,36.880800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,36.880800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,37.541700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,90.000000,0> translate<7.263300,0.000000,37.541700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,37.541700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,37.762000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.263300,0.000000,37.541700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,37.762000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,37.762000>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,0.000000,0> translate<7.483600,0.000000,37.762000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,37.762000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,37.541700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.924300,0.000000,37.762000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,37.541700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,36.880800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.144600,0.000000,36.880800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,38.851400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,38.410800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.263300,0.000000,38.410800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,38.410800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,38.190500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.263300,0.000000,38.410800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,38.190500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.364900,0.000000,38.190500>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<7.483600,0.000000,38.190500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.364900,0.000000,38.190500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,38.410800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.364900,0.000000,38.190500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,38.410800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,38.851400>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<8.585200,0.000000,38.851400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,38.851400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.364900,0.000000,39.071700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<8.364900,0.000000,39.071700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.364900,0.000000,39.071700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,39.071700>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<7.483600,0.000000,39.071700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,39.071700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,38.851400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.263300,0.000000,38.851400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,39.500200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,39.500200>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.263300,0.000000,39.500200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,39.500200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,39.940800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<8.144600,0.000000,39.940800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,39.940800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,40.381400>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.144600,0.000000,39.940800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,40.381400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,40.381400>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.263300,0.000000,40.381400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,41.691100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,40.809900>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.263300,0.000000,40.809900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,40.809900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,40.809900>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.263300,0.000000,40.809900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,40.809900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,41.691100>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<8.585200,0.000000,41.691100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,40.809900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,41.250500>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<7.924300,0.000000,41.250500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,42.119600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,42.119600>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.263300,0.000000,42.119600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,42.119600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,42.780500>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,90.000000,0> translate<7.263300,0.000000,42.780500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.263300,0.000000,42.780500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,43.000800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.263300,0.000000,42.780500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.483600,0.000000,43.000800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,43.000800>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,0.000000,0> translate<7.483600,0.000000,43.000800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.924300,0.000000,43.000800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,42.780500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.924300,0.000000,43.000800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,42.780500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,42.119600>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.144600,0.000000,42.119600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.144600,0.000000,42.560200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.585200,0.000000,43.000800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.144600,0.000000,42.560200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,37.635000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,37.414700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.041300,0.000000,37.414700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,37.414700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,36.974100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.041300,0.000000,36.974100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,36.974100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,36.753800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.041300,0.000000,36.974100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,36.753800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.482000,0.000000,36.753800>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,0.000000,0> translate<9.261600,0.000000,36.753800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.482000,0.000000,36.753800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,36.974100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.482000,0.000000,36.753800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,36.974100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,37.414700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<9.702300,0.000000,37.414700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,37.414700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.922600,0.000000,37.635000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.702300,0.000000,37.414700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.922600,0.000000,37.635000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,37.635000>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<9.922600,0.000000,37.635000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,37.635000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,37.414700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.142900,0.000000,37.635000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,37.414700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,36.974100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.363200,0.000000,36.974100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,36.974100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,36.753800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.142900,0.000000,36.753800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,38.944700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,38.063500>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.041300,0.000000,38.063500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,38.063500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,38.063500>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.041300,0.000000,38.063500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,38.063500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,38.944700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<10.363200,0.000000,38.944700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,38.063500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,38.504100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<9.702300,0.000000,38.504100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,39.373200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,39.373200>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.041300,0.000000,39.373200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,39.373200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,40.254400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<10.363200,0.000000,40.254400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,41.564100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,40.682900>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.041300,0.000000,40.682900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,40.682900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,40.682900>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.041300,0.000000,40.682900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,40.682900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,41.564100>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<10.363200,0.000000,41.564100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,40.682900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.702300,0.000000,41.123500>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<9.702300,0.000000,41.123500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,42.873800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,42.653500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.041300,0.000000,42.653500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,42.653500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,42.212900>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.041300,0.000000,42.212900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,42.212900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,41.992600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.041300,0.000000,42.212900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.261600,0.000000,41.992600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,41.992600>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<9.261600,0.000000,41.992600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,41.992600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,42.212900>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.142900,0.000000,41.992600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,42.212900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,42.653500>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<10.363200,0.000000,42.653500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,42.653500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.142900,0.000000,42.873800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.142900,0.000000,42.873800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.363200,0.000000,43.742900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,43.742900>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.041300,0.000000,43.742900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,43.302300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.041300,0.000000,44.183500>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<9.041300,0.000000,44.183500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,35.102800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,35.102800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<11.387000,0.000000,35.102800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,35.102800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,35.543400>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,44.990529,0> translate<10.946300,0.000000,35.543400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,35.543400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,35.984000>}
box{<0,0,-0.050800><0.623173,0.036000,0.050800> rotate<0,-44.990529,0> translate<10.946300,0.000000,35.543400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,35.984000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,35.984000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<11.387000,0.000000,35.984000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,35.102800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,35.984000>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<11.607300,0.000000,35.984000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,36.853100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,36.853100>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<10.946300,0.000000,36.853100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,36.412500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,37.293700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<10.946300,0.000000,37.293700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,37.722200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,38.603400>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,-33.685844,0> translate<10.946300,0.000000,37.722200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,38.603400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,37.722200>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,33.685844,0> translate<10.946300,0.000000,38.603400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,39.031900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,39.913100>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,33.685844,0> translate<10.946300,0.000000,39.913100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,40.341600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,40.341600>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.946300,0.000000,40.341600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,40.341600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,40.561900>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.047900,0.000000,40.341600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,40.561900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,41.002500>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<12.268200,0.000000,41.002500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,41.002500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,41.222800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.047900,0.000000,41.222800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,41.222800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,41.222800>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.946300,0.000000,41.222800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.166600,0.000000,42.532500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,42.312200>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.946300,0.000000,42.312200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,42.312200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,41.871600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.946300,0.000000,41.871600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,41.871600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.166600,0.000000,41.651300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.946300,0.000000,41.871600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.166600,0.000000,41.651300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,41.651300>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,0.000000,0> translate<11.166600,0.000000,41.651300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,41.651300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,41.871600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.387000,0.000000,41.651300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,41.871600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,42.312200>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<11.607300,0.000000,42.312200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,42.312200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.827600,0.000000,42.532500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.607300,0.000000,42.312200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.827600,0.000000,42.532500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,42.532500>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<11.827600,0.000000,42.532500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,42.532500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,42.312200>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.047900,0.000000,42.532500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,42.312200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,41.871600>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.268200,0.000000,41.871600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,41.871600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,41.651300>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.047900,0.000000,41.651300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,42.961000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,42.961000>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<10.946300,0.000000,42.961000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,42.961000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,43.621900>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,90.000000,0> translate<10.946300,0.000000,43.621900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.946300,0.000000,43.621900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.166600,0.000000,43.842200>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.946300,0.000000,43.621900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.166600,0.000000,43.842200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,43.842200>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,0.000000,0> translate<11.166600,0.000000,43.842200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.387000,0.000000,43.842200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,43.621900>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.387000,0.000000,43.842200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,43.621900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.827600,0.000000,43.842200>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.607300,0.000000,43.621900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.827600,0.000000,43.842200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,43.842200>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<11.827600,0.000000,43.842200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.047900,0.000000,43.842200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,43.621900>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.047900,0.000000,43.842200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,43.621900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.268200,0.000000,42.961000>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.268200,0.000000,42.961000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,42.961000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.607300,0.000000,43.621900>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,90.000000,0> translate<11.607300,0.000000,43.621900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,27.127700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,26.687100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.803300,0.000000,26.687100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,26.687100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,26.466800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.803300,0.000000,26.687100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,26.466800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,26.466800>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<10.023600,0.000000,26.466800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,26.466800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,26.687100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.904900,0.000000,26.466800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,26.687100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,27.127700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<11.125200,0.000000,27.127700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,27.127700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,27.348000>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.904900,0.000000,27.348000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,27.348000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,27.348000>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<10.023600,0.000000,27.348000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,27.348000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,27.127700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.803300,0.000000,27.127700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,27.776500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,27.776500>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.803300,0.000000,27.776500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,27.776500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,28.657700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<9.803300,0.000000,28.657700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.464300,0.000000,27.776500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.464300,0.000000,28.217100>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<10.464300,0.000000,28.217100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,29.086200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,29.086200>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.803300,0.000000,29.086200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,29.086200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,29.967400>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,90.000000,0> translate<9.803300,0.000000,29.967400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.464300,0.000000,29.086200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.464300,0.000000,29.526800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<10.464300,0.000000,29.526800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,30.395900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,31.277100>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,33.685844,0> translate<9.803300,0.000000,31.277100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,32.366500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,31.925900>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.803300,0.000000,31.925900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,31.925900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,31.705600>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.803300,0.000000,31.925900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,31.705600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,31.705600>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<10.023600,0.000000,31.705600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,31.705600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,31.925900>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.904900,0.000000,31.705600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,31.925900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,32.366500>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<11.125200,0.000000,32.366500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,32.366500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,32.586800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.904900,0.000000,32.586800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.904900,0.000000,32.586800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,32.586800>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,0.000000,0> translate<10.023600,0.000000,32.586800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.023600,0.000000,32.586800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,32.366500>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.803300,0.000000,32.366500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,33.015300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,33.015300>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.803300,0.000000,33.015300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,33.015300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,33.896500>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,-33.685844,0> translate<9.803300,0.000000,33.015300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.125200,0.000000,33.896500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.803300,0.000000,33.896500>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.803300,0.000000,33.896500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,56.059100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<57.861200,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,56.059100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,55.516800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<57.861200,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,56.059100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.403500,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,56.059100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,54.432200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.945800,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,55.516800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,55.245600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<60.311700,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,54.432200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.582900,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,54.432200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,54.703300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<59.498300,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,54.974500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<59.498300,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,54.974500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,54.974500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,56.059100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<61.135400,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.948800,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,54.974500>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,33.689470,0> translate<61.135400,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,54.974500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.948800,0.000000,55.516800>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,-33.689470,0> translate<61.135400,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.313000,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.770700,0.000000,54.432200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<62.770700,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.770700,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.499600,0.000000,54.703300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<62.499600,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.499600,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.499600,0.000000,55.245600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<62.499600,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.499600,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.770700,0.000000,55.516800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<62.499600,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.770700,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.313000,0.000000,55.516800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<62.770700,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.313000,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.584200,0.000000,55.245600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<63.313000,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.584200,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.584200,0.000000,54.974500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.584200,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.584200,0.000000,54.974500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.499600,0.000000,54.974500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<62.499600,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.136700,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.136700,0.000000,55.516800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<64.136700,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.136700,0.000000,54.974500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.679000,0.000000,55.516800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.136700,0.000000,54.974500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.679000,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.950100,0.000000,55.516800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<64.679000,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.500900,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.500900,0.000000,56.059100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<65.500900,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.500900,0.000000,56.059100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,56.059100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<65.500900,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,56.059100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,55.788000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<66.314300,0.000000,56.059100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,55.788000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,55.516800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.585500,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,55.245600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.314300,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,54.974500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<66.314300,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,54.974500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,54.703300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.585500,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.585500,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,54.432200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<66.314300,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.500900,0.000000,54.432200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<65.500900,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.500900,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314300,0.000000,55.245600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<65.500900,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.409100,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.951400,0.000000,54.432200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<67.409100,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.951400,0.000000,54.432200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.222600,0.000000,54.703300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<67.951400,0.000000,54.432200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.222600,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.222600,0.000000,55.245600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<68.222600,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.222600,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.951400,0.000000,55.516800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<67.951400,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.951400,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.409100,0.000000,55.516800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<67.409100,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.409100,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.138000,0.000000,55.245600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<67.138000,0.000000,55.245600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.138000,0.000000,55.245600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.138000,0.000000,54.703300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.138000,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.138000,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.409100,0.000000,54.432200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<67.138000,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.046200,0.000000,55.788000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.046200,0.000000,54.703300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.046200,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.046200,0.000000,54.703300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.317400,0.000000,54.432200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<69.046200,0.000000,54.703300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.775100,0.000000,55.516800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.317400,0.000000,55.516800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<68.775100,0.000000,55.516800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,53.519100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<57.861200,0.000000,53.519100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,52.976800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<57.861200,0.000000,53.519100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,53.519100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.403500,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,51.892200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.945800,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,51.892200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,52.163300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<60.311700,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,52.705600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<60.582900,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,52.976800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<60.311700,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,52.705600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<59.498300,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,52.163300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.498300,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,51.892200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<59.498300,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,53.248000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,52.163300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.406500,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.677700,0.000000,51.892200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<61.406500,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.677700,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<61.135400,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.226800,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.226800,0.000000,51.892200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.226800,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.226800,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.497900,0.000000,52.976800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<62.226800,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.497900,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.040200,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<62.497900,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.040200,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.311400,0.000000,52.705600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<63.040200,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.311400,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.311400,0.000000,51.892200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.311400,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.677300,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,51.892200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<64.135000,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.863900,0.000000,52.163300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<63.863900,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.863900,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.863900,0.000000,52.705600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<63.863900,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.863900,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.976800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<63.863900,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.677300,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<64.135000,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.677300,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.948500,0.000000,52.705600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<64.677300,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.948500,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.948500,0.000000,52.434500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.948500,0.000000,52.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.948500,0.000000,52.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.863900,0.000000,52.434500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<63.863900,0.000000,52.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.501000,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.501000,0.000000,52.976800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<65.501000,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.501000,0.000000,52.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.043300,0.000000,52.976800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.501000,0.000000,52.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.043300,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.314400,0.000000,52.976800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<66.043300,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.865200,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.865200,0.000000,53.519100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<66.865200,0.000000,53.519100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.865200,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,53.519100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<66.865200,0.000000,53.519100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,53.248000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<67.678600,0.000000,53.519100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,53.248000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.976800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.949800,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,52.705600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.678600,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.434500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<67.678600,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.163300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.949800,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.949800,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,51.892200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<67.678600,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.865200,0.000000,51.892200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<66.865200,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.865200,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.678600,0.000000,52.705600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<66.865200,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.773400,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.315700,0.000000,51.892200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<68.773400,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.315700,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.586900,0.000000,52.163300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<69.315700,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.586900,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.586900,0.000000,52.705600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<69.586900,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.586900,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.315700,0.000000,52.976800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<69.315700,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.315700,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.773400,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<68.773400,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.773400,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.502300,0.000000,52.705600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<68.502300,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.502300,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.502300,0.000000,52.163300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.502300,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.502300,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.773400,0.000000,51.892200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<68.502300,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.410500,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.952800,0.000000,52.976800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<70.410500,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.952800,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.224000,0.000000,52.705600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<70.952800,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.224000,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.224000,0.000000,51.892200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.224000,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.224000,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.410500,0.000000,51.892200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<70.410500,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.410500,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.139400,0.000000,52.163300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<70.139400,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.139400,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.410500,0.000000,52.434500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<70.139400,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.410500,0.000000,52.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.224000,0.000000,52.434500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<70.410500,0.000000,52.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.776500,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.776500,0.000000,52.976800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<71.776500,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.776500,0.000000,52.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.318800,0.000000,52.976800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.776500,0.000000,52.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.318800,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.589900,0.000000,52.976800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<72.318800,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.225300,0.000000,53.519100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.225300,0.000000,51.892200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.225300,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.225300,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.411800,0.000000,51.892200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<73.411800,0.000000,51.892200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.411800,0.000000,51.892200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.140700,0.000000,52.163300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<73.140700,0.000000,52.163300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.140700,0.000000,52.163300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.140700,0.000000,52.705600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<73.140700,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.140700,0.000000,52.705600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.411800,0.000000,52.976800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<73.140700,0.000000,52.705600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.411800,0.000000,52.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.225300,0.000000,52.976800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<73.411800,0.000000,52.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.861200,0.000000,50.690800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,49.606200>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,63.430762,0> translate<57.861200,0.000000,50.690800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.403500,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.945800,0.000000,50.690800>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,-63.430762,0> translate<58.403500,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,49.606200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<59.498300,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,50.690800>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.498300,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,50.690800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,50.962000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<60.582900,0.000000,50.962000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.582900,0.000000,50.962000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,51.233100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<60.311700,0.000000,51.233100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.311700,0.000000,51.233100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,51.233100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<59.769400,0.000000,51.233100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.769400,0.000000,51.233100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.498300,0.000000,50.962000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.498300,0.000000,50.962000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,49.877300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<61.135400,0.000000,49.877300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,49.877300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,49.877300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<61.135400,0.000000,49.877300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,49.877300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,49.606200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.406500,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.406500,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.135400,0.000000,49.606200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<61.135400,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.953900,0.000000,50.690800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.496200,0.000000,51.233100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.953900,0.000000,50.690800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.496200,0.000000,51.233100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.496200,0.000000,49.606200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.496200,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.953900,0.000000,49.606200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.038500,0.000000,49.606200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<61.953900,0.000000,49.606200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.163500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.680400,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<38.163500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.421900,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.421900,0.000000,15.457200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<38.421900,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.163500,0.000000,15.457200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.680400,0.000000,15.457200>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<38.163500,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.192500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.192500,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<39.192500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.192500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.967800,0.000000,14.940300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<39.192500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.967800,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.226300,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<39.967800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.226300,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.226300,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.226300,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.736100,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.511400,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<40.736100,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.511400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.769900,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<41.511400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.769900,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.511400,0.000000,14.423400>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<41.511400,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.511400,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.994500,0.000000,14.423400>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<40.994500,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.994500,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.736100,0.000000,14.681800>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<40.736100,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.736100,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.994500,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<40.736100,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.994500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.769900,0.000000,14.940300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<40.994500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.538100,0.000000,15.198700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.538100,0.000000,14.164900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.538100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.538100,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.796600,0.000000,13.906500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<42.538100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.279700,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.796600,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<42.279700,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.308700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.308700,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<43.308700,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.308700,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.825600,0.000000,14.940300>}
box{<0,0,-0.063500><0.731007,0.036000,0.063500> rotate<0,-44.997030,0> translate<43.308700,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.825600,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.084000,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<43.825600,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.595000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.595000,0.000000,14.164900>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,-90.000000,0> translate<44.595000,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.595000,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.853400,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<44.595000,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.853400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.628800,0.000000,13.906500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<44.853400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.628800,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.628800,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<45.628800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.172400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.397000,0.000000,14.940300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<46.397000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.397000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.138600,0.000000,14.681800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<46.138600,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.138600,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.138600,0.000000,14.164900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.138600,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.138600,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.397000,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<46.138600,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.397000,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.172400,0.000000,13.906500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<46.397000,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.940600,0.000000,15.198700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.940600,0.000000,14.164900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.940600,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.940600,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.199100,0.000000,13.906500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<47.940600,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.682200,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.199100,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<47.682200,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.711200,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.969600,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<48.711200,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.969600,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.969600,0.000000,13.906500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.969600,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.711200,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.228100,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<48.711200,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.969600,0.000000,15.715600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.969600,0.000000,15.457200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.969600,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.998600,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.515500,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<49.998600,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.515500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.774000,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<50.515500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.774000,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.774000,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<50.774000,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.774000,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.515500,0.000000,14.940300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<50.515500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.515500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.998600,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<49.998600,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.998600,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.740200,0.000000,14.681800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<49.740200,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.740200,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.740200,0.000000,14.164900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.740200,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.740200,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.998600,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<49.740200,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.283800,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.283800,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<51.283800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.283800,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.059100,0.000000,14.940300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<51.283800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.059100,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.317600,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<52.059100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.317600,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.317600,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.317600,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.827400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.602700,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<52.827400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.602700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.861200,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<53.602700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.861200,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.602700,0.000000,14.423400>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<53.602700,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.602700,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085800,0.000000,14.423400>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<53.085800,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085800,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.827400,0.000000,14.681800>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<52.827400,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.827400,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085800,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<52.827400,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.085800,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.861200,0.000000,14.940300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<53.085800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<54.371000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.681800>}
box{<0,0,-0.063500><0.258500,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.629400,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.681800>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<54.371000,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.940300>}
box{<0,0,-0.063500><0.258500,0.036000,0.063500> rotate<0,90.000000,0> translate<54.371000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<54.371000,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.629400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.629400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<54.371000,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.371000,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<54.371000,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.686400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.686400,0.000000,14.164900>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,-90.000000,0> translate<56.686400,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.686400,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.944800,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<56.686400,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.944800,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.203300,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<56.944800,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.203300,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.461700,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<57.203300,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.461700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.720200,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<57.461700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.720200,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.720200,0.000000,14.940300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,90.000000,0> translate<57.720200,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.230000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.488400,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<58.230000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.488400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.488400,0.000000,13.906500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.488400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.230000,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.746900,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<58.230000,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.488400,0.000000,15.715600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.488400,0.000000,15.457200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.488400,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.259000,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.259000,0.000000,15.457200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<59.259000,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.034300,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.259000,0.000000,14.423400>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,33.689549,0> translate<59.259000,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.259000,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.034300,0.000000,14.940300>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,-33.689549,0> translate<59.259000,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.545300,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.803700,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<60.545300,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.803700,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.803700,0.000000,13.906500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.803700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.545300,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.062200,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<60.545300,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.803700,0.000000,15.715600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.803700,0.000000,15.457200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.803700,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.574300,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.574300,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<61.574300,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.574300,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.832700,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<61.574300,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.832700,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.832700,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.832700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.832700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.574300,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<61.574300,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.346100,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.346100,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<62.346100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.346100,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.604500,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<62.346100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.604500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.863000,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<62.604500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.863000,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.863000,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.863000,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.863000,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.121400,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<62.863000,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.121400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.379900,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<63.121400,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.379900,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.379900,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.379900,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.148100,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.665000,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<64.148100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.665000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.923500,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<64.665000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.923500,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.923500,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.923500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.923500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.148100,0.000000,13.906500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<64.148100,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.148100,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.889700,0.000000,14.164900>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<63.889700,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.889700,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.148100,0.000000,14.423400>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<63.889700,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.148100,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.923500,0.000000,14.423400>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<64.148100,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.433300,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.433300,0.000000,15.457200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<65.433300,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.208600,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.433300,0.000000,14.423400>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,33.689549,0> translate<65.433300,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.433300,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.208600,0.000000,14.940300>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,-33.689549,0> translate<65.433300,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.494900,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.978000,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<66.978000,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.978000,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.719600,0.000000,14.164900>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<66.719600,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.719600,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.719600,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<66.719600,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.719600,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.978000,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<66.719600,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.978000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.494900,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<66.978000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.494900,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.753400,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<67.494900,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.753400,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.753400,0.000000,14.423400>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<67.753400,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.753400,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.719600,0.000000,14.423400>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,0.000000,0> translate<66.719600,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.263200,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.263200,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<68.263200,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.263200,0.000000,14.423400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.780100,0.000000,14.940300>}
box{<0,0,-0.063500><0.731007,0.036000,0.063500> rotate<0,-44.997030,0> translate<68.263200,0.000000,14.423400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.780100,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.038500,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<68.780100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.549500,0.000000,15.457200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.549500,0.000000,13.906500>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,-90.000000,0> translate<69.549500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.549500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.324800,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<69.549500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.324800,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.583300,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<70.324800,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.583300,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.583300,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<70.583300,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.583300,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.324800,0.000000,14.940300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<70.324800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.324800,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.549500,0.000000,14.940300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<69.549500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.351500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.868400,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<71.351500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.868400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.126900,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<71.868400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.126900,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.126900,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<72.126900,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.126900,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.868400,0.000000,14.940300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<71.868400,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.868400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.351500,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<71.351500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.351500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.093100,0.000000,14.681800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<71.093100,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.093100,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.093100,0.000000,14.164900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<71.093100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.093100,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.351500,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<71.093100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.895100,0.000000,15.198700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.895100,0.000000,14.164900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<72.895100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.895100,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.153600,0.000000,13.906500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<72.895100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.636700,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.153600,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<72.636700,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.665700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.665700,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<73.665700,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.665700,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.924100,0.000000,14.164900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<73.665700,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.924100,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.924100,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.924100,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.924100,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.665700,0.000000,13.906500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<73.665700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.471300,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.695900,0.000000,14.940300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<74.695900,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.695900,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.437500,0.000000,14.681800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<74.437500,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.437500,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.437500,0.000000,14.164900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<74.437500,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.437500,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.695900,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<74.437500,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.695900,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.471300,0.000000,13.906500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<74.695900,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.239500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.756400,0.000000,13.906500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<76.239500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.756400,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.014900,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<76.756400,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.014900,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.014900,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<77.014900,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.014900,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.756400,0.000000,14.940300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<76.756400,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.756400,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.239500,0.000000,14.940300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<76.239500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.239500,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.981100,0.000000,14.681800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<75.981100,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.981100,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.981100,0.000000,14.164900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<75.981100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.981100,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.239500,0.000000,13.906500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<75.981100,0.000000,14.164900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.524700,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.524700,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<77.524700,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.524700,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.783100,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<77.524700,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.783100,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.041600,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<77.783100,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.041600,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.041600,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<78.041600,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.041600,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.300000,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<78.041600,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.300000,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.558500,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<78.300000,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.558500,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.558500,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<78.558500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.068300,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.102100,0.000000,15.457200>}
box{<0,0,-0.063500><1.863709,0.036000,0.063500> rotate<0,-56.306216,0> translate<79.068300,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.611900,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.611900,0.000000,14.940300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<80.611900,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.611900,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.870300,0.000000,14.940300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<80.611900,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.870300,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.128800,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<80.870300,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.128800,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.128800,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<81.128800,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.128800,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.387200,0.000000,14.940300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<81.128800,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.387200,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.645700,0.000000,14.681800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<81.387200,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.645700,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.645700,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<81.645700,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.155500,0.000000,15.457200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.155500,0.000000,13.906500>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.155500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.155500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.930800,0.000000,13.906500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<82.155500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.930800,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.189300,0.000000,14.164900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<82.930800,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.189300,0.000000,14.164900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.189300,0.000000,14.681800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<83.189300,0.000000,14.681800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.189300,0.000000,14.681800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.930800,0.000000,14.940300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<82.930800,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.930800,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.155500,0.000000,14.940300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<82.155500,0.000000,14.940300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.732900,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.699100,0.000000,13.906500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,0.000000,0> translate<83.699100,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.699100,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.732900,0.000000,14.940300>}
box{<0,0,-0.063500><1.462014,0.036000,0.063500> rotate<0,-44.997030,0> translate<83.699100,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.732900,0.000000,14.940300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.732900,0.000000,15.198700>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<84.732900,0.000000,15.198700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.732900,0.000000,15.198700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.474400,0.000000,15.457200>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<84.474400,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.474400,0.000000,15.457200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.957500,0.000000,15.457200>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<83.957500,0.000000,15.457200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.957500,0.000000,15.457200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.699100,0.000000,15.198700>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<83.699100,0.000000,15.198700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,43.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.614800,0.000000,43.337100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<58.614800,0.000000,43.337100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.614800,0.000000,43.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,43.180400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.458100,0.000000,43.180400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,43.180400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,42.866800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.458100,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.614800,0.000000,42.710100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<58.458100,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.614800,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,42.710100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<58.614800,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,42.710100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<60.329100,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,43.337100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.329100,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,43.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,43.493900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<60.956100,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,43.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,43.650700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<60.799400,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,43.650700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.485800,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,43.493900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<60.329100,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,43.493900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<61.264600,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,43.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,43.650700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<61.264600,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.734900,0.000000,43.650700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.421300,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.734900,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.891600,0.000000,43.493900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<61.734900,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.891600,0.000000,43.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.891600,0.000000,42.866800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.891600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.891600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.734900,0.000000,42.710100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.734900,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.734900,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,42.710100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.421300,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,42.866800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.264600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.891600,0.000000,43.493900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<61.264600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.200100,0.000000,43.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513600,0.000000,43.650700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<62.200100,0.000000,43.337100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513600,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513600,0.000000,42.710100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.513600,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.200100,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.827100,0.000000,42.710100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<62.200100,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.135600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.135600,0.000000,43.493900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<63.135600,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.135600,0.000000,43.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.292300,0.000000,43.650700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<63.135600,0.000000,43.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.292300,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.605900,0.000000,43.650700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.292300,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.605900,0.000000,43.650700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.762600,0.000000,43.493900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<63.605900,0.000000,43.650700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.762600,0.000000,43.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.762600,0.000000,42.866800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.762600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.762600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.605900,0.000000,42.710100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.605900,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.605900,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.292300,0.000000,42.710100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.292300,0.000000,42.710100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.292300,0.000000,42.710100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.135600,0.000000,42.866800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<63.135600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.135600,0.000000,42.866800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.762600,0.000000,43.493900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<63.135600,0.000000,42.866800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,41.186100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.458100,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,41.186100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<58.458100,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,41.813100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<59.393600,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,41.186100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.550300,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.707100,0.000000,41.186100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<59.393600,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,42.283400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,42.126700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.550300,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.644200,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.173900,0.000000,41.813100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<60.173900,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.173900,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.017200,0.000000,41.656400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.017200,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.017200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.017200,0.000000,41.342800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.017200,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.017200,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.173900,0.000000,41.186100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<60.017200,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.173900,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.644200,0.000000,41.186100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<60.173900,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.423000,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.109400,0.000000,41.186100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.109400,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.109400,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.952700,0.000000,41.342800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<60.952700,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.952700,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.952700,0.000000,41.656400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<60.952700,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.952700,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.109400,0.000000,41.813100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.952700,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.109400,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.423000,0.000000,41.813100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.109400,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.423000,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.579700,0.000000,41.656400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.423000,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.579700,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.579700,0.000000,41.499600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.579700,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.579700,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.952700,0.000000,41.499600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<60.952700,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,41.813100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<61.888200,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.358500,0.000000,41.813100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<61.888200,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.358500,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,41.656400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<62.358500,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,41.186100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.515200,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,41.186100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.823700,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,41.342800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.294000,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,41.499600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<63.294000,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.980400,0.000000,41.499600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<62.980400,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.980400,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,41.656400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<62.823700,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.980400,0.000000,41.813100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.823700,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.980400,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,41.813100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.980400,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229500,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915900,0.000000,41.186100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.915900,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915900,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759200,0.000000,41.342800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<63.759200,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759200,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759200,0.000000,41.656400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<63.759200,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915900,0.000000,41.813100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.759200,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915900,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229500,0.000000,41.813100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.915900,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229500,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386200,0.000000,41.656400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<64.229500,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386200,0.000000,41.499600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.386200,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386200,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759200,0.000000,41.499600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<63.759200,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.813100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.656400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.851400,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.656400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.813100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<64.694700,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.342800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.186100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.851400,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851400,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.186100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,41.342800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<64.694700,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.724900,0.000000,41.969900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.568200,0.000000,42.126700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<66.568200,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.568200,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.254600,0.000000,42.126700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<66.254600,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.254600,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.097900,0.000000,41.969900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<66.097900,0.000000,41.969900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.097900,0.000000,41.969900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.097900,0.000000,41.342800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.097900,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.097900,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.254600,0.000000,41.186100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<66.097900,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.254600,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.568200,0.000000,41.186100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<66.254600,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.568200,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.724900,0.000000,41.342800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<66.568200,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.724900,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.724900,0.000000,41.656400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<66.724900,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.724900,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.411400,0.000000,41.656400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<66.411400,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.033400,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.033400,0.000000,42.126700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<67.033400,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.033400,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.503700,0.000000,42.126700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<67.033400,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.503700,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.660400,0.000000,41.969900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<67.503700,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.660400,0.000000,41.969900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.660400,0.000000,41.656400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<67.660400,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.660400,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.503700,0.000000,41.499600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<67.503700,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.503700,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.033400,0.000000,41.499600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<67.033400,0.000000,41.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.968900,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.968900,0.000000,41.186100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<67.968900,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.968900,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.595900,0.000000,41.186100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<67.968900,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.904400,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.217900,0.000000,41.186100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,63.430762,0> translate<68.904400,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.217900,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.531400,0.000000,41.813100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,-63.430762,0> translate<69.217900,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.839900,0.000000,41.969900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.996600,0.000000,42.126700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<69.839900,0.000000,41.969900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.996600,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,42.126700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<69.996600,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,42.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.969900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<70.310200,0.000000,42.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.969900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.813100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<70.466900,0.000000,41.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,41.656400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<70.310200,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.153400,0.000000,41.656400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<70.153400,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,41.656400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.499600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<70.310200,0.000000,41.656400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.499600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.342800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<70.466900,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.466900,0.000000,41.342800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,41.186100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<70.310200,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.310200,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.996600,0.000000,41.186100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<69.996600,0.000000,41.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.996600,0.000000,41.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.839900,0.000000,41.342800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<69.839900,0.000000,41.342800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,47.460700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,46.520100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.458100,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.928400,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<58.458100,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.928400,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,46.676800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.928400,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,47.303900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<59.085100,0.000000,47.303900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,47.303900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.928400,0.000000,47.460700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<58.928400,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.928400,0.000000,47.460700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,47.460700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<58.458100,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.863900,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,46.520100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<59.550300,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,46.676800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<59.393600,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,46.990400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<59.393600,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,47.147100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.393600,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.863900,0.000000,47.147100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<59.550300,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.863900,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,46.990400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<59.863900,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,46.833600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.020600,0.000000,46.833600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,46.833600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,46.833600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<59.393600,0.000000,46.833600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<60.329100,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,46.676800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.799400,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,46.833600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<60.799400,0.000000,46.833600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,46.833600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,46.833600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.485800,0.000000,46.833600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,46.833600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,46.990400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<60.329100,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,47.147100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.329100,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.485800,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.956100,0.000000,47.147100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<60.485800,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,47.147100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<61.264600,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,46.520100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.421300,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.264600,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.578100,0.000000,46.520100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<61.264600,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,47.617400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.421300,0.000000,47.460700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.421300,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.201700,0.000000,46.206600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.358500,0.000000,46.206600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<62.201700,0.000000,46.206600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.358500,0.000000,46.206600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,46.363400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<62.358500,0.000000,46.206600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,46.363400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,47.147100>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<62.515200,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044900,0.000000,47.147100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.044900,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044900,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,46.990400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.888200,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,46.676800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.888200,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.888200,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044900,0.000000,46.520100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.888200,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044900,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.515200,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.044900,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,47.147100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<62.823700,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823700,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,47.147100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.823700,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.294000,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,46.990400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<63.294000,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450700,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.450700,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,47.460700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<64.694700,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,47.460700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,47.460700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,47.460700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,47.303900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<65.165000,0.000000,47.460700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,47.303900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,47.147100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.321700,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,46.990400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.165000,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,46.833600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<65.165000,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,46.833600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,46.676800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.321700,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.321700,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,46.520100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.165000,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694700,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.165000,0.000000,46.990400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694700,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.630200,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.630200,0.000000,46.676800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.630200,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.630200,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.786900,0.000000,46.520100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.630200,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.786900,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.257200,0.000000,46.520100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<65.786900,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.257200,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.257200,0.000000,46.363400>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.257200,0.000000,46.363400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.257200,0.000000,46.363400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.100500,0.000000,46.206600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<66.100500,0.000000,46.206600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.100500,0.000000,46.206600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.943700,0.000000,46.206600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<65.943700,0.000000,46.206600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,47.147100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<66.565700,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,47.147100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.990400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.722400,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.990400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<66.565700,0.000000,46.990400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.990400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,47.147100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<66.565700,0.000000,47.147100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.676800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<66.565700,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.676800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.520100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.722400,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.722400,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.520100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<66.565700,0.000000,46.520100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.520100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.565700,0.000000,46.676800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<66.565700,0.000000,46.676800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,45.936700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<58.458100,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.458100,0.000000,45.936700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.771600,0.000000,45.623100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<58.458100,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.771600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,45.936700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<58.771600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,45.936700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.085100,0.000000,44.996100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.085100,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.863900,0.000000,45.623100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<59.550300,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.863900,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<59.863900,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.020600,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<59.550300,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,45.152800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<59.393600,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.393600,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,45.309600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<59.393600,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.550300,0.000000,45.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020600,0.000000,45.309600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<59.550300,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,45.936700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<60.329100,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,45.309600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<60.329100,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.329100,0.000000,45.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.799400,0.000000,45.623100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<60.329100,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.578900,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.265300,0.000000,44.996100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.265300,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.265300,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.108600,0.000000,45.152800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.108600,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.108600,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.108600,0.000000,45.466400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<61.108600,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.108600,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.265300,0.000000,45.623100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.108600,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.265300,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.578900,0.000000,45.623100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<61.265300,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.578900,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.735600,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<61.578900,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.735600,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.735600,0.000000,45.309600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.735600,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.735600,0.000000,45.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.108600,0.000000,45.309600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<61.108600,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044100,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044100,0.000000,45.623100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<62.044100,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.044100,0.000000,45.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.357600,0.000000,45.623100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.044100,0.000000,45.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.357600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.514400,0.000000,45.623100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<62.357600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823600,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823600,0.000000,45.936700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<62.823600,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823600,0.000000,45.936700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,45.936700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.823600,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,45.936700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.779900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<63.293900,0.000000,45.936700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.779900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.623100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.450600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.293900,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.309600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<63.293900,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.152800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.450600,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.450600,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,44.996100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.293900,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823600,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.823600,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.823600,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.293900,0.000000,45.466400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.823600,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915800,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229400,0.000000,44.996100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.915800,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229400,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386100,0.000000,45.152800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.229400,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386100,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386100,0.000000,45.466400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<64.386100,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.386100,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229400,0.000000,45.623100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<64.229400,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.229400,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915800,0.000000,45.623100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<63.915800,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915800,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759100,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.759100,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759100,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759100,0.000000,45.152800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.759100,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.759100,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.915800,0.000000,44.996100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<63.759100,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851300,0.000000,45.779900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851300,0.000000,45.152800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.851300,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.851300,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.008100,0.000000,44.996100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<64.851300,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.694600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.008100,0.000000,45.623100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<64.694600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.318200,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.318200,0.000000,45.152800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<65.318200,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.318200,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.474900,0.000000,45.152800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.318200,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.474900,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.474900,0.000000,44.996100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.474900,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.474900,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.318200,0.000000,44.996100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<65.318200,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.412900,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.942600,0.000000,45.623100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<65.942600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.942600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.785900,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.785900,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.785900,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.785900,0.000000,45.152800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.785900,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.785900,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.942600,0.000000,44.996100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.785900,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.942600,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.412900,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<65.942600,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.878100,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.191700,0.000000,44.996100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<66.878100,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.191700,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.348400,0.000000,45.152800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<67.191700,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.348400,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.348400,0.000000,45.466400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<67.348400,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.348400,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.191700,0.000000,45.623100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<67.191700,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.191700,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.878100,0.000000,45.623100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<66.878100,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.878100,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.721400,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<66.721400,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.721400,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.721400,0.000000,45.152800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.721400,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.721400,0.000000,45.152800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.878100,0.000000,44.996100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<66.721400,0.000000,45.152800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.656900,0.000000,44.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.656900,0.000000,45.623100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<67.656900,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.656900,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.813600,0.000000,45.623100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<67.656900,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.813600,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.970400,0.000000,45.466400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<67.813600,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.970400,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.970400,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<67.970400,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<67.970400,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.127200,0.000000,45.623100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<67.970400,0.000000,45.466400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.127200,0.000000,45.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.283900,0.000000,45.466400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<68.127200,0.000000,45.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.283900,0.000000,45.466400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<68.283900,0.000000,44.996100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<68.283900,0.000000,44.996100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.468200,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.010500,0.000000,2.743200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<88.468200,0.000000,2.743200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.739300,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.739300,0.000000,4.370100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<88.739300,0.000000,4.370100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.468200,0.000000,4.370100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.010500,0.000000,4.370100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<88.468200,0.000000,4.370100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.644200,0.000000,4.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.373000,0.000000,4.370100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<90.373000,0.000000,4.370100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.373000,0.000000,4.370100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.830700,0.000000,4.370100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<89.830700,0.000000,4.370100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.830700,0.000000,4.370100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.559600,0.000000,4.099000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<89.559600,0.000000,4.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.559600,0.000000,4.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.559600,0.000000,3.014300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<89.559600,0.000000,3.014300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.559600,0.000000,3.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.830700,0.000000,2.743200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<89.559600,0.000000,3.014300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<89.830700,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.373000,0.000000,2.743200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<89.830700,0.000000,2.743200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.373000,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<90.644200,0.000000,3.014300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<90.373000,0.000000,2.743200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.281300,0.000000,4.370100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.196700,0.000000,4.370100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<91.196700,0.000000,4.370100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.196700,0.000000,4.370100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.196700,0.000000,3.556600>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<91.196700,0.000000,3.556600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.196700,0.000000,3.556600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.739000,0.000000,3.827800>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,-26.567524,0> translate<91.196700,0.000000,3.556600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.739000,0.000000,3.827800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.010100,0.000000,3.827800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<91.739000,0.000000,3.827800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.010100,0.000000,3.827800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.281300,0.000000,3.556600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<92.010100,0.000000,3.827800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.281300,0.000000,3.556600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.281300,0.000000,3.014300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<92.281300,0.000000,3.014300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.281300,0.000000,3.014300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.010100,0.000000,2.743200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<92.010100,0.000000,2.743200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.010100,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.467800,0.000000,2.743200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<91.467800,0.000000,2.743200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.467800,0.000000,2.743200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.196700,0.000000,3.014300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<91.196700,0.000000,3.014300> }
difference{
cylinder{<58.801000,0,43.053000><58.801000,0.036000,43.053000>0.647700 translate<0,0.000000,0>}
cylinder{<58.801000,-0.1,43.053000><58.801000,0.135000,43.053000>0.622300 translate<0,0.000000,0>}}
//5VAUX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,26.723000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,26.723000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,26.723000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,26.723000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,28.755000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.018000,0.000000,28.755000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,28.755000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,28.755000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,28.755000> }
//5VMAIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,29.136000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,29.136000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,29.136000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,29.136000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,31.168000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.018000,0.000000,31.168000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,31.168000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,31.168000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,31.168000> }
//12V silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,31.549000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,31.549000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,31.549000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,31.549000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,33.581000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.018000,0.000000,33.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.018000,0.000000,33.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.780000,0.000000,33.581000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.018000,0.000000,33.581000> }
//A-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,73.342500>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.209500,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,73.342500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.209500,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,79.692500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<37.909500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.179500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<37.909500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.939500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.939500,0.000000,72.072500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.939500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.179500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.179500,0.000000,80.962500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.179500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,79.692500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.527500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,78.930500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.527500,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,78.930500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.591500,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.591500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.591500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.209500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.479500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.209500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.479500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.479500,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.479500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.939500,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.939500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.924500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.194500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<30.924500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.924500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.924500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<30.924500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.924500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.479500,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.479500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.194500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.194500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<32.194500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.639500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.639500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.909500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<37.909500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.639500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.639500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.639500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.639500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.194500,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<32.194500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.939500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,80.962500>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.939500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,80.962500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.527500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.209500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.209500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.527500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.527500,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.527500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.527500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.955500,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.955500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.955500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.955500,0.000000,73.088500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<24.955500,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.955500,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.163500,0.000000,73.088500>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<24.955500,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.163500,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.163500,0.000000,79.946500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<38.163500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<38.163500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.591500,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<33.591500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.591500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.591500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.099500,0.000000,80.962500>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.591500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.099500,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.099500,0.000000,80.962500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.099500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.099500,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369500,0.000000,80.835500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.099500,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369500,0.000000,80.835500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<35.369500,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.179500,0.000000,80.962500>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.369500,0.000000,80.962500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.559500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.099500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.019500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.559500,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.099500,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.019500,0.000000,77.787500>}
//B-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,73.342500>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.461500,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,73.342500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.461500,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,79.692500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.161500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.431500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.161500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.191500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.191500,0.000000,72.072500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.191500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.431500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.431500,0.000000,80.962500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.431500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,79.692500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.779500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,78.930500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.779500,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,78.930500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.843500,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.843500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.843500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.461500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.731500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.461500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.731500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.731500,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.731500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.191500,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.191500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.176500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.446500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.176500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.176500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.176500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.176500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.176500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.731500,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.731500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.446500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.446500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.446500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.891500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.891500,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.161500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.161500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.891500,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.891500,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.891500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.891500,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.446500,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.446500,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.191500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,80.962500>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.191500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,80.962500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.779500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.461500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.461500,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.779500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.779500,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.779500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<13.779500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.207500,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.207500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.207500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.207500,0.000000,73.088500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.207500,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.207500,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.415500,0.000000,73.088500>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.207500,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.415500,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.415500,0.000000,79.946500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<22.415500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<22.415500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<17.843500,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<17.843500,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.843500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.843500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.351500,0.000000,80.962500>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.843500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.351500,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.351500,0.000000,80.962500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.351500,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.351500,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,80.835500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.351500,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,80.835500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.621500,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.431500,0.000000,80.962500>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.621500,0.000000,80.962500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.811500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.351500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.271500,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.811500,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.351500,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.271500,0.000000,77.787500>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.652800,0.000000,36.229200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.252800,0.000000,36.229200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.652800,0.000000,36.229200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.652800,0.000000,35.029200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.252800,0.000000,35.029200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.652800,0.000000,35.029200> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.212000,0.000000,66.964000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.612000,0.000000,66.964000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.612000,0.000000,66.964000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.212000,0.000000,68.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.612000,0.000000,68.164000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.612000,0.000000,68.164000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.708000,0.000000,68.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.308000,0.000000,68.164000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.708000,0.000000,68.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.708000,0.000000,66.964000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.308000,0.000000,66.964000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.708000,0.000000,66.964000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.207000,0.000000,38.301000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.607000,0.000000,38.301000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.607000,0.000000,38.301000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.207000,0.000000,39.501000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.607000,0.000000,39.501000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.607000,0.000000,39.501000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.357000,0.000000,34.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.757000,0.000000,34.985000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.757000,0.000000,34.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.357000,0.000000,36.185000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.757000,0.000000,36.185000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.757000,0.000000,36.185000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.389000,0.000000,29.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.627000,0.000000,29.177000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<80.627000,0.000000,29.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.008000,0.000000,29.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.008000,0.000000,28.796000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.008000,0.000000,28.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.611000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,30.320000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.722000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,31.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.722000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.214000,0.000000,31.590000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.214000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.214000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.214000,0.000000,29.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.214000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.214000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,29.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.214000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.722000,0.000000,30.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.722000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.325000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.309000,0.000000,30.320000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.309000,0.000000,30.320000> }
difference{
cylinder{<77.960000,0,30.320000><77.960000,0.036000,30.320000>4.140200 translate<0,0.000000,0>}
cylinder{<77.960000,-0.1,30.320000><77.960000,0.135000,30.320000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<77.452000,0.000000,30.320000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.009000,0.000000,29.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.247000,0.000000,29.177000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.247000,0.000000,29.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.628000,0.000000,29.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.628000,0.000000,28.796000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.628000,0.000000,28.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.231000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,30.320000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.342000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,31.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.342000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.834000,0.000000,31.590000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.834000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.834000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.834000,0.000000,29.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.834000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.834000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,29.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.834000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.342000,0.000000,30.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.342000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.945000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.929000,0.000000,30.320000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.929000,0.000000,30.320000> }
difference{
cylinder{<69.580000,0,30.320000><69.580000,0.036000,30.320000>4.140200 translate<0,0.000000,0>}
cylinder{<69.580000,-0.1,30.320000><69.580000,0.135000,30.320000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<69.072000,0.000000,30.320000>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.715000,0.000000,34.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.115000,0.000000,34.914000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.115000,0.000000,34.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.715000,0.000000,36.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.115000,0.000000,36.114000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.115000,0.000000,36.114000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.494000,0.000000,29.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.732000,0.000000,29.177000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.732000,0.000000,29.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.113000,0.000000,29.558000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.113000,0.000000,28.796000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.113000,0.000000,28.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.716000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,30.320000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.827000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,31.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.827000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.319000,0.000000,31.590000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.319000,0.000000,31.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.319000,0.000000,31.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.319000,0.000000,29.050000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.319000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.319000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,29.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.319000,0.000000,29.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,29.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.827000,0.000000,30.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.827000,0.000000,30.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.430000,0.000000,30.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.414000,0.000000,30.320000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.414000,0.000000,30.320000> }
difference{
cylinder{<61.065000,0,30.320000><61.065000,0.036000,30.320000>4.140200 translate<0,0.000000,0>}
cylinder{<61.065000,-0.1,30.320000><61.065000,0.135000,30.320000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<60.557000,0.000000,30.320000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,63.388800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,63.388800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,63.388800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,62.188800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,62.188800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,62.188800> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,69.072200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,69.072200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,69.072200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,70.272200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,70.272200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,70.272200> }
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.365000,0.000000,44.739000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.765000,0.000000,44.739000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.765000,0.000000,44.739000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.365000,0.000000,45.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.765000,0.000000,45.939000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.765000,0.000000,45.939000> }
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.671500,0.000000,54.754500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.671500,0.000000,55.354500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.671500,0.000000,55.354500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.871500,0.000000,54.754500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.871500,0.000000,55.354500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.871500,0.000000,55.354500> }
//C16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.529000,0.000000,54.627500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.529000,0.000000,55.227500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.529000,0.000000,55.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.729000,0.000000,54.627500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.729000,0.000000,55.227500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.729000,0.000000,55.227500> }
//D12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,60.071000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.374000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,59.436000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.644000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,58.166000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.279000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,57.531000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.644000,0.000000,57.531000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,58.166000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.739000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,59.436000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.739000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,58.166000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,57.531000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<70.739000,0.000000,58.166000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.644000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,57.531000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.374000,0.000000,57.531000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<72.009000,0.000000,58.801000>}
//D24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.386000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,39.751000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.640000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,38.481000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.275000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,37.846000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.640000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,38.481000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.735000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,39.751000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.735000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,37.846000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.735000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,37.846000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.370000,0.000000,37.846000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.005000,0.000000,39.116000>}
//DEBUG silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.516000,0.000000,60.858400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,60.858400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.516000,0.000000,60.858400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,60.858400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,58.826400>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,-90.000000,0> translate<65.278000,0.000000,58.826400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,58.826400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.516000,0.000000,58.826400>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.516000,0.000000,58.826400> }
//E-STOP silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,20.891500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,26.606500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,26.606500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,26.606500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,26.606500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,26.606500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,26.606500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,20.891500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,20.891500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,20.891500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,20.891500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,20.891500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,20.891500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,19.939000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,19.939000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,20.891500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,20.891500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,20.891500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,20.891500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,20.891500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,25.971500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,21.526500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,21.526500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,25.971500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,21.526500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,21.526500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,25.971500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,25.971500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,25.971500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,21.526500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,21.526500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,21.526500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,21.526500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,21.526500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,21.526500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,21.526500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,21.526500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,21.526500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,20.574000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,21.526500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,20.574000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,21.526500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,20.574000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,20.574000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,23.749000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,23.749000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,23.749000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,23.749000>}
//F1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.718800,0.000000,47.993300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.718800,0.000000,50.939700>}
box{<0,0,-0.050800><2.946400,0.036000,0.050800> rotate<0,90.000000,0> translate<10.718800,0.000000,50.939700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.919200,0.000000,48.018700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.919200,0.000000,50.939700>}
box{<0,0,-0.050800><2.921000,0.036000,0.050800> rotate<0,90.000000,0> translate<13.919200,0.000000,50.939700> }
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<12.320000,0.000000,47.553900>}
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<12.320000,0.000000,51.389300>}
//I2C silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,66.675000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,66.675000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,66.675000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,67.945000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,68.580000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,68.580000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,67.945000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.672000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,66.675000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,66.675000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,66.675000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,66.040000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.672000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,62.865000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,63.500000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,62.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,63.500000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,62.865000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.672000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,64.135000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,65.405000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,66.040000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,66.040000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,65.405000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.672000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,64.135000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,63.500000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.672000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,60.960000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,60.960000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,61.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.672000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,62.865000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,61.595000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,70.485000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,71.120000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,71.120000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.402000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,70.485000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.672000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,68.580000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,69.215000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.672000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,69.215000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,69.215000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<42.037000,0.000000,67.310000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<42.037000,0.000000,64.770000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<42.037000,0.000000,62.230000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<42.037000,0.000000,69.850000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,61.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,58.290000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.817000,0.000000,58.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,58.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,57.790000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.817000,0.000000,57.790000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,57.790000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,57.790000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.017000,0.000000,57.790000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,57.790000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,58.290000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.017000,0.000000,58.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,58.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,61.590000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.017000,0.000000,61.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,61.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,61.590000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.017000,0.000000,61.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.817000,0.000000,58.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.017000,0.000000,58.290000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.017000,0.000000,58.290000> }
object{ARC(1.270000,0.304800,270.000000,450.000000,0.036000) translate<31.877000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.877000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.877000,0.000000,55.880000>}
box{<0,0,-0.304800><7.620000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.877000,0.000000,55.880000> }
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<32.512000,0.000000,57.139900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<33.782000,0.000000,57.139900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<35.052000,0.000000,57.139900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<36.322000,0.000000,57.139900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<36.322000,0.000000,62.240000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<35.052000,0.000000,62.240000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<33.782000,0.000000,62.240000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-0.000000,0> translate<32.512000,0.000000,62.240000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.583000,0.000000,21.106000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.583000,0.000000,24.106000>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.583000,0.000000,24.106000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.583000,0.000000,24.106000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.883000,0.000000,24.106000>}
box{<0,0,-0.063500><1.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.883000,0.000000,24.106000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.883000,0.000000,24.106000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.883000,0.000000,21.106000>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.883000,0.000000,21.106000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.883000,0.000000,21.106000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.583000,0.000000,21.106000>}
box{<0,0,-0.063500><1.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.883000,0.000000,21.106000> }
difference{
cylinder{<23.383000,0,21.306000><23.383000,0.036000,21.306000>0.113500 translate<0,0.000000,0>}
cylinder{<23.383000,-0.1,21.306000><23.383000,0.135000,21.306000>0.000000 translate<0,0.000000,0>}}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.387000,0.000000,42.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.387000,0.000000,55.768000>}
box{<0,0,-0.076200><13.746000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.387000,0.000000,55.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.387000,0.000000,55.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.133000,0.000000,55.768000>}
box{<0,0,-0.076200><13.746000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.387000,0.000000,55.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.133000,0.000000,55.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.133000,0.000000,42.772000>}
box{<0,0,-0.076200><12.996000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.133000,0.000000,42.772000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.133000,0.000000,42.772000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.383000,0.000000,42.022000>}
box{<0,0,-0.076200><1.060660,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.383000,0.000000,42.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.383000,0.000000,42.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.387000,0.000000,42.022000>}
box{<0,0,-0.076200><12.996000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.387000,0.000000,42.022000> }
difference{
cylinder{<52.760000,0,44.395000><52.760000,0.036000,44.395000>1.076200 translate<0,0.000000,0>}
cylinder{<52.760000,-0.1,44.395000><52.760000,0.135000,44.395000>0.923800 translate<0,0.000000,0>}}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,42.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,43.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,43.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,44.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,44.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,45.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,45.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,46.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,46.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,47.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,47.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,48.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,48.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,49.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,49.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,50.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,50.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,51.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,51.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,52.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,52.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,53.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,53.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,54.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<40.889500,0.000000,54.895000>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<42.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<42.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<43.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<43.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<44.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<44.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<45.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<45.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<46.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<46.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<47.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<47.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<48.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<48.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<49.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<49.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<50.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<50.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<51.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<51.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<52.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<52.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<53.260000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<53.760000,0.000000,56.270500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<54.260000,0.000000,56.270500>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,54.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,54.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,53.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,53.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,52.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,52.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,51.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,51.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,50.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,50.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,49.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,49.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,48.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,48.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,47.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,47.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,46.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,46.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,45.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,45.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,44.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,44.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,43.895000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,43.395000>}
box{<-0.135000,0,-0.502500><0.135000,0.036000,0.502500> rotate<0,-90.000000,0> translate<55.630500,0.000000,42.895000>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<54.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<53.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<53.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<52.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<52.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<51.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<51.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<50.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<50.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<49.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<49.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<48.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<48.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<47.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<47.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<46.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<46.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<45.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<45.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<44.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<44.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<43.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<43.260000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<42.760000,0.000000,41.519500>}
box{<-0.502500,0,-0.135000><0.502500,0.036000,0.135000> rotate<0,-90.000000,0> translate<42.260000,0.000000,41.519500>}
//IC4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,66.608000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.140000,0.000000,66.608000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.140000,0.000000,66.608000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.140000,0.000000,66.608000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.140000,0.000000,61.408000>}
box{<0,0,-0.101600><5.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.140000,0.000000,61.408000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.140000,0.000000,61.408000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.340000,0.000000,61.408000>}
box{<0,0,-0.101600><10.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.140000,0.000000,61.408000> }
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<19.465000,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<18.815100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<18.165100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<17.515100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<16.865100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<16.215100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<15.565100,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<14.914900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<14.264900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<13.614900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<12.964900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<12.314900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<11.664900,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<11.015000,0.000000,67.297300>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<11.015000,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<11.664900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<12.314900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<12.964900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<13.614900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<14.264900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<14.914900,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<15.565100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<16.215100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<16.865100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<17.515100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<18.165100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<18.815100,0.000000,60.718700>}
box{<-0.177800,0,-0.647700><0.177800,0.036000,0.647700> rotate<0,-180.000000,0> translate<19.465000,0.000000,60.718700>}
//IC5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.202000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.202000,0.000000,5.207000>}
box{<0,0,-0.101600><10.160000,0.036000,0.101600> rotate<0,-90.000000,0> translate<92.202000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.202000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,5.207000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.392000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,5.207000>}
box{<0,0,-0.101600><0.635000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.757000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,15.367000>}
box{<0,0,-0.101600><10.160000,0.036000,0.101600> rotate<0,90.000000,0> translate<87.757000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,15.367000>}
box{<0,0,-0.101600><0.635000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.757000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.202000,0.000000,15.367000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.392000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.392000,0.000000,5.207000>}
box{<0,0,-0.101600><10.160000,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.392000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,18.542000>}
box{<0,0,-0.101600><3.175000,0.036000,0.101600> rotate<0,90.000000,0> translate<87.757000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,18.542000>}
box{<0,0,-0.101600><8.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.757000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,19.812000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<96.012000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.487000,0.000000,19.812000>}
box{<0,0,-0.101600><9.525000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.487000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.487000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.487000,0.000000,0.762000>}
box{<0,0,-0.101600><19.050000,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.487000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.487000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,0.762000>}
box{<0,0,-0.101600><9.525000,0.036000,0.101600> rotate<0,0.000000,0> translate<86.487000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,2.032000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<96.012000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<96.012000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,2.032000>}
box{<0,0,-0.101600><8.255000,0.036000,0.101600> rotate<0,0.000000,0> translate<87.757000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.757000,0.000000,5.207000>}
box{<0,0,-0.101600><3.175000,0.036000,0.101600> rotate<0,90.000000,0> translate<87.757000,0.000000,5.207000> }
//ICSP silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.839400,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.839400,0.000000,23.622000>}
box{<0,0,-0.076200><12.700000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.839400,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.839400,0.000000,23.622000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.489400,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.839400,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,36.322000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.489400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,36.322000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.109400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,22.352000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,37.592000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.251400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,27.940000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.489400,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.251400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.251400,0.000000,32.004000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.251400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.251400,0.000000,32.004000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.489400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,36.322000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.489400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.235400,0.000000,32.004000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.235400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,23.622000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,24.892000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.363400,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,24.892000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,22.352000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.109400,0.000000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,30.607000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.363400,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,29.337000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,24.892000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.109400,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,36.322000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.363400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,36.322000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.363400,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,35.052000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.109400,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.109400,0.000000,30.607000>}
box{<0,0,-0.076200><4.445000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.109400,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,27.940000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.219400,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,32.004000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.219400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,27.940000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.489400,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.489400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.235400,0.000000,27.940000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.235400,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.235400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,27.940000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,23.368000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,-90.000000,0> translate<29.235400,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<36.093400,0.000000,23.368000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.235400,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<36.093400,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<36.093400,0.000000,36.576000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,90.000000,0> translate<36.093400,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<36.093400,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,36.576000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<29.235400,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<29.235400,0.000000,32.004000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,-90.000000,0> translate<29.235400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.235400,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,32.004000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,32.512000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.219400,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.346400,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,32.512000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.346400,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.346400,0.000000,33.782000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.346400,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.346400,0.000000,33.782000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.219400,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.219400,0.000000,37.592000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.219400,0.000000,37.592000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.934400,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.934400,0.000000,32.512000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<33.934400,0.000000,27.432000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.394400,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.394400,0.000000,32.512000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.394400,0.000000,27.432000>}
//INTERFACE silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.657200,0.000000,38.633400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.657200,0.000000,69.113400>}
box{<0,0,-0.076200><30.480000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.657200,0.000000,69.113400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,69.113400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.657200,0.000000,69.113400>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.657200,0.000000,69.113400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.657200,0.000000,38.633400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,38.633400>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.657200,0.000000,38.633400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,37.363400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,38.633400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.387200,0.000000,38.633400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,70.383400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,65.684400>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,-90.000000,0> translate<84.277200,0.000000,65.684400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,70.383400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,70.383400>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.387200,0.000000,70.383400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,37.363400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,37.363400>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.387200,0.000000,37.363400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,69.113400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,64.795400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,64.795400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.245200,0.000000,55.905400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.245200,0.000000,51.841400>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<82.245200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,51.841400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.245200,0.000000,51.841400>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.245200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,51.841400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,47.015400>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,47.015400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<82.245200,0.000000,55.905400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,55.905400>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<82.245200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,55.905400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,55.905400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,69.113400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,69.113400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,69.113400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,69.113400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,67.843400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.133200,0.000000,67.843400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,67.843400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,67.843400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,67.843400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,69.113400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,70.383400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.387200,0.000000,70.383400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,54.508400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,53.238400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.133200,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,54.508400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,54.508400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,54.508400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,54.508400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,67.843400>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.387200,0.000000,67.843400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,53.238400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,53.238400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,39.903400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,38.633400>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.133200,0.000000,38.633400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,38.633400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,38.633400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,38.633400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.133200,0.000000,39.903400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,39.903400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.133200,0.000000,39.903400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,39.903400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.387200,0.000000,53.238400>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.387200,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,62.382400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,55.905400>}
box{<0,0,-0.076200><6.477000,0.036000,0.076200> rotate<0,-90.000000,0> translate<84.277200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,55.905400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,51.841400>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<84.277200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,63.271400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,63.271400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,63.271400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,63.271400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,55.905400>}
box{<0,0,-0.076200><7.366000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,64.795400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,64.795400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,64.795400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,64.795400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,63.271400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,63.271400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,62.382400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,62.763400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<83.769200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,65.303400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,65.684400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<83.769200,0.000000,65.303400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,65.303400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,64.795400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,64.795400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,63.271400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,55.905400>}
box{<0,0,-0.025400><7.366000,0.036000,0.025400> rotate<0,-90.000000,0> translate<83.261200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,55.905400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,55.905400>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,55.905400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,64.795400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,69.367400>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,90.000000,0> translate<83.261200,0.000000,69.367400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,69.367400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.403200,0.000000,69.367400>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<76.403200,0.000000,69.367400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.403200,0.000000,69.367400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.403200,0.000000,38.379400>}
box{<0,0,-0.025400><30.988000,0.036000,0.025400> rotate<0,-90.000000,0> translate<76.403200,0.000000,38.379400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.403200,0.000000,38.379400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,38.379400>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<76.403200,0.000000,38.379400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,38.379400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,45.491400>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,90.000000,0> translate<83.261200,0.000000,45.491400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,51.841400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,51.841400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,51.841400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,51.841400>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,63.271400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,63.271400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,63.271400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,63.271400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,62.763400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,62.763400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,64.795400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,64.795400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,64.795400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,64.795400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,63.271400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,63.271400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,37.363400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,41.681400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<84.277200,0.000000,41.681400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.150200,0.000000,41.681400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,41.681400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<84.150200,0.000000,41.681400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.150200,0.000000,41.681400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.150200,0.000000,43.205400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<84.150200,0.000000,43.205400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,43.205400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.150200,0.000000,43.205400>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<84.150200,0.000000,43.205400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,43.205400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,44.602400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,90.000000,0> translate<84.277200,0.000000,44.602400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,45.491400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,45.491400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,45.491400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,47.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,47.015400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.261200,0.000000,47.015400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,47.015400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<83.261200,0.000000,51.841400>}
box{<0,0,-0.025400><4.826000,0.036000,0.025400> rotate<0,90.000000,0> translate<83.261200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,45.491400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,45.491400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,45.491400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,45.491400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,38.633400>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,38.633400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,47.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.261200,0.000000,47.015400>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.007200,0.000000,47.015400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,47.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.007200,0.000000,45.491400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.007200,0.000000,45.491400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,47.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,45.491400>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,45.491400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,45.491400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,44.983400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,44.983400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,44.602400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,44.983400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<83.769200,0.000000,44.983400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,47.523400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,47.904400>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<83.769200,0.000000,47.523400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,47.904400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<84.277200,0.000000,51.841400>}
box{<0,0,-0.076200><3.937000,0.036000,0.076200> rotate<0,90.000000,0> translate<84.277200,0.000000,51.841400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,47.523400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.769200,0.000000,47.015400>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<83.769200,0.000000,47.015400> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,65.303400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,65.303400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,62.763400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,57.683400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,57.683400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,62.763400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,44.983400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,42.443400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,47.523400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,55.143400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,52.603400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,44.983400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,42.443400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,47.523400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,55.143400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,52.603400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,50.063400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,50.063400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<78.562200,0.000000,60.223400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<81.102200,0.000000,60.223400>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.441000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.197000,0.000000,11.837000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.197000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.250000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.657000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.657000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.324000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.165000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.165000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.031000,0.000000,11.837000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.031000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.710000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.117000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.117000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.577000,0.000000,11.837000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.577000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.784000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.625000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.625000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.244000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.085000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.577000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.418000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.418000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.944800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.944800,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.944800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.527200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.495200,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.495200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.088800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.479200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<49.479200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.072800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.463200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<48.463200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.056800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.447200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<47.447200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.040800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.431200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<46.431200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.976800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.944800,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.944800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.944800,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<40.944800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.545000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.072800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.072800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.072800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.072800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.479200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<49.072800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.479200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.479200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.479200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.056800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.056800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.056800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.056800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.463200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<48.056800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.463200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.463200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.463200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.040800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.040800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.040800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.040800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.447200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<47.040800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.447200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.447200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.447200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.024800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.024800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.024800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.024800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.431200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<46.024800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.431200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.431200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.431200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.976800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.976800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.976800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.976800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.383200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<42.976800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.383200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.383200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.383200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.088800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.088800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.088800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.088800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.495200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<50.088800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.495200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.495200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.495200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.008800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.008800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.008800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.008800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.415200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<45.008800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.415200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.415200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.415200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.967400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.967400,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.967400,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.967400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.399200,0.000000,8.382000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<43.967400,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.399200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.399200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.399200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.024800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.415200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<45.415200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.008800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.399200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<44.399200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.967400,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.383200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<43.383200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.527200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.527200,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.527200,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.527200,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.927000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<50.927000,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.927000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.927000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.927000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.501800,0.000000,1.117600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.501800,0.000000,0.076200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<52.501800,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.501800,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.970200,0.000000,0.076200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<40.970200,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.970200,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.970200,0.000000,1.143000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<40.970200,0.000000,1.143000> }
difference{
cylinder{<46.736000,0,3.937000><46.736000,0.036000,3.937000>1.397000 translate<0,0.000000,0>}
cylinder{<46.736000,-0.1,3.937000><46.736000,0.135000,3.937000>1.143000 translate<0,0.000000,0>}}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.316000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.072000,0.000000,11.837000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<68.072000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.125000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.532000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<65.532000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.199000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.040000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<66.040000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.420000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.906000,0.000000,11.837000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.906000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.585000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.992000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.992000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.960000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.452000,0.000000,11.837000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.452000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.659000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.500000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<63.500000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.119000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.960000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.960000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.452000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.293000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.293000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.819800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.819800,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.819800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.402200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.370200,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<66.370200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.963800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.354200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<65.354200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.947800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.338200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<64.338200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.931800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.322200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<63.322200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.915800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.306200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<62.306200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.851800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.819800,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.819800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.819800,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.420000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<56.819800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.420000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.420000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.420000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.947800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.947800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<64.947800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.947800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.354200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<64.947800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.354200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.354200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.354200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.931800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.931800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<63.931800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.931800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.338200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<63.931800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.338200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.338200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<64.338200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.915800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.915800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.915800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.915800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.322200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<62.915800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.322200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.322200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<63.322200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.899800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.899800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<61.899800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.899800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.306200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<61.899800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.306200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.306200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.306200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.851800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.851800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.851800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.851800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.258200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<58.851800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.258200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.258200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.258200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.963800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.963800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.963800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.963800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.370200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<65.963800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.370200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.370200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.370200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.883800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.883800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<60.883800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.883800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.290200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<60.883800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.290200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.290200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<61.290200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.842400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.842400,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.842400,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.842400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.274200,0.000000,8.382000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<59.842400,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.274200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.274200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<60.274200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.899800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.290200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<61.290200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.883800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.274200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<60.274200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.842400,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.258200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<59.258200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.402200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.402200,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.402200,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.402200,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.802000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<66.802000,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.802000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.802000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.802000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.376800,0.000000,1.117600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.376800,0.000000,0.076200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<68.376800,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.376800,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.845200,0.000000,0.076200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<56.845200,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.845200,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.845200,0.000000,1.143000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<56.845200,0.000000,1.143000> }
difference{
cylinder{<62.611000,0,3.937000><62.611000,0.036000,3.937000>1.397000 translate<0,0.000000,0>}
cylinder{<62.611000,-0.1,3.937000><62.611000,0.135000,3.937000>1.143000 translate<0,0.000000,0>}}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.191000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.947000,0.000000,11.837000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<83.947000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.000000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.407000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<81.407000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.074000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.915000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<81.915000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.781000,0.000000,11.837000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.781000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.460000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.867000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<78.867000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.835000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.327000,0.000000,11.837000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.327000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.534000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.375000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<79.375000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.994000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.835000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<76.835000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.327000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.168000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.168000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.694800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.694800,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.694800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.277200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.245200,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<82.245200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.838800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.229200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<81.229200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.822800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.213200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<80.213200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.806800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.197200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<79.197200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.790800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.181200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<78.181200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.726800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.694800,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<72.694800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.694800,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<72.694800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.295000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.822800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.822800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<80.822800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.822800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.229200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<80.822800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.229200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.229200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.229200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.806800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.806800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<79.806800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.806800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.213200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<79.806800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.213200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.213200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<80.213200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.790800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.790800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<78.790800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.790800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.197200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<78.790800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.197200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.197200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<79.197200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.774800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.774800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<77.774800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.774800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.181200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<77.774800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.181200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.181200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<78.181200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.726800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.726800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.726800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.726800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.133200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<74.726800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.133200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.133200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<75.133200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.838800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.838800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.838800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.838800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.245200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<81.838800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.245200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.245200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.245200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.758800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.758800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.758800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.758800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.165200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<76.758800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.165200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.165200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<77.165200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.717400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.717400,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<75.717400,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.717400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.149200,0.000000,8.382000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<75.717400,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.149200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.149200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.149200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.774800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.165200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<77.165200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.758800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.149200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<76.149200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.717400,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.133200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<75.133200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.277200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.277200,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.277200,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.277200,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.677000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<82.677000,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.677000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.677000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.677000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.251800,0.000000,1.117600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.251800,0.000000,0.076200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<84.251800,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<84.251800,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.720200,0.000000,0.076200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<72.720200,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.720200,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.720200,0.000000,1.143000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<72.720200,0.000000,1.143000> }
difference{
cylinder{<78.486000,0,3.937000><78.486000,0.036000,3.937000>1.397000 translate<0,0.000000,0>}
cylinder{<78.486000,-0.1,3.937000><78.486000,0.135000,3.937000>1.143000 translate<0,0.000000,0>}}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.566000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.322000,0.000000,11.837000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.322000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.375000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.782000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.782000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.449000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.290000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.290000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.670000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.156000,0.000000,11.837000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.156000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.835000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.242000,0.000000,11.837000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.242000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.702000,0.000000,11.837000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.702000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.909000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.750000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.750000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.369000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.210000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.702000,0.000000,11.837000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.543000,0.000000,11.837000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.543000,0.000000,11.837000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.069800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.069800,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.069800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.652200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.620200,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.620200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.213800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.604200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<33.604200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.197800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.588200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<32.588200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.181800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.572200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<31.572200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.165800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.556200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<30.556200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.101800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.069800,0.000000,7.797800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.069800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.069800,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.670000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<25.069800,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.670000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.670000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<26.670000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.197800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.197800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.197800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.197800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.604200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<33.197800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.604200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.604200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.604200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.181800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.181800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.181800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.181800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.588200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<32.181800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.588200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.588200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.588200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.165800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.165800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.165800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.165800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.572200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<31.165800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.572200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.572200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.572200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.149800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.556200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<30.149800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.556200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.556200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.556200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.101800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.101800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.101800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.101800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.508200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<27.101800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.508200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.508200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.508200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.213800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.213800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.213800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.213800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.620200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<34.213800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.620200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.620200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.620200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.133800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.133800,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.133800,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.133800,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.540200,0.000000,8.382000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<29.133800,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.540200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.540200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.540200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.092400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.092400,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<28.092400,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.092400,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.524200,0.000000,8.382000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.092400,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.524200,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.524200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<28.524200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.540200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<29.540200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.133800,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.524200,0.000000,7.797800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<28.524200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.092400,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.508200,0.000000,7.797800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<27.508200,0.000000,7.797800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.652200,0.000000,7.797800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.652200,0.000000,1.168400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.652200,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.652200,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.052000,0.000000,1.168400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<35.052000,0.000000,1.168400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.052000,0.000000,1.168400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.052000,0.000000,0.076200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.052000,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.626800,0.000000,1.117600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.626800,0.000000,0.076200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<36.626800,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.626800,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.095200,0.000000,0.076200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<25.095200,0.000000,0.076200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.095200,0.000000,0.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.095200,0.000000,1.143000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<25.095200,0.000000,1.143000> }
difference{
cylinder{<30.861000,0,3.937000><30.861000,0.036000,3.937000>1.397000 translate<0,0.000000,0>}
cylinder{<30.861000,-0.1,3.937000><30.861000,0.135000,3.937000>1.143000 translate<0,0.000000,0>}}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,10.033000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.431000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,10.668000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.431000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,10.668000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,10.033000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,8.128000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,8.128000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.431000,0.000000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,8.763000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,8.763000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.971000,0.000000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,11.303000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.431000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,12.573000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.431000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,13.208000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.431000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,13.208000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,12.573000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,11.303000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.971000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,10.668000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,10.668000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.701000,0.000000,9.398000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.701000,0.000000,11.938000>}
//JP9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,31.242000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.312000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,31.877000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.312000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,31.877000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.947000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,31.242000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<85.217000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,29.337000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.947000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,29.337000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<83.312000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,29.972000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.217000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,29.972000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<85.852000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,32.512000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<83.312000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,33.782000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.312000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.312000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,34.417000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<83.312000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.947000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,34.417000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.947000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,34.417000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,33.782000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<85.217000,0.000000,34.417000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,32.512000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<85.852000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.852000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<85.217000,0.000000,31.877000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<85.217000,0.000000,31.877000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<84.582000,0.000000,30.607000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<84.582000,0.000000,33.147000>}
//PIEZO silk screen
difference{
cylinder{<23.495000,0,41.656000><23.495000,0.036000,41.656000>6.001600 translate<0,0.000000,0>}
cylinder{<23.495000,-0.1,41.656000><23.495000,0.135000,41.656000>5.798400 translate<0,0.000000,0>}}
difference{
cylinder{<23.495000,0,41.656000><23.495000,0.036000,41.656000>1.371600 translate<0,0.000000,0>}
cylinder{<23.495000,-0.1,41.656000><23.495000,0.135000,41.656000>1.168400 translate<0,0.000000,0>}}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<57.912000,0.000000,61.722000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<64.008000,0.000000,61.722000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<57.912000,0.000000,61.722000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<57.912000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<64.008000,0.000000,66.040000>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<57.912000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,62.230000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.008000,0.000000,65.532000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,65.532000>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,65.532000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,64.643000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.706000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,63.119000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.214000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.214000,0.000000,63.119000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,63.119000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.706000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,63.119000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.706000,0.000000,64.643000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.706000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,63.881000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.595000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,63.119000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.595000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,63.881000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.325000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,63.119000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.325000,0.000000,63.119000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,63.881000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,63.881000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.690000,0.000000,63.881000> }
object{ARC(2.159000,0.406400,90.000000,270.000000,0.036000) translate<57.912000,0.000000,63.881000>}
object{ARC(2.159000,0.406400,270.000000,450.000000,0.036000) translate<64.008000,0.000000,63.881000>}
object{ARC(1.651000,0.152400,90.000000,270.000000,0.036000) translate<57.912000,0.000000,63.881000>}
object{ARC(1.651000,0.152400,270.000000,450.000000,0.036000) translate<64.008000,0.000000,63.881000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.297800,0.000000,60.442400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.897800,0.000000,60.442400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.297800,0.000000,60.442400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.297800,0.000000,59.242400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.897800,0.000000,59.242400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.297800,0.000000,59.242400> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.685000,0.000000,69.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.685000,0.000000,68.534000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.685000,0.000000,68.534000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.485000,0.000000,69.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.485000,0.000000,68.534000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.485000,0.000000,68.534000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.358000,0.000000,62.946000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.358000,0.000000,63.546000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.358000,0.000000,63.546000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.558000,0.000000,62.946000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.558000,0.000000,63.546000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.558000,0.000000,63.546000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.083600,0.000000,32.659600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.083600,0.000000,32.059600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.083600,0.000000,32.059600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.883600,0.000000,32.659600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.883600,0.000000,32.059600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.883600,0.000000,32.059600> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,67.960800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,67.960800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,67.960800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.370800,0.000000,66.760800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.970800,0.000000,66.760800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.370800,0.000000,66.760800> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.682000,0.000000,50.909500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.682000,0.000000,50.309500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.682000,0.000000,50.309500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.482000,0.000000,50.909500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.482000,0.000000,50.309500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.482000,0.000000,50.309500> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,27.139000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,27.139000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,27.139000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,28.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,28.339000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,28.339000> }
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205500,0.000000,50.909500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205500,0.000000,50.309500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.205500,0.000000,50.309500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.005500,0.000000,50.909500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.005500,0.000000,50.309500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.005500,0.000000,50.309500> }
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933200,0.000000,64.054000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933200,0.000000,63.454000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.933200,0.000000,63.454000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.733200,0.000000,64.054000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.733200,0.000000,63.454000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.733200,0.000000,63.454000> }
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.723400,0.000000,64.054000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.723400,0.000000,63.454000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.723400,0.000000,63.454000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.523400,0.000000,64.054000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.523400,0.000000,63.454000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.523400,0.000000,63.454000> }
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,29.552000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,29.552000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,29.552000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,30.752000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,30.752000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,30.752000> }
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,31.965000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,31.965000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,31.965000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.795000,0.000000,33.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.195000,0.000000,33.165000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.195000,0.000000,33.165000> }
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.001000,0.000000,53.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.001000,0.000000,53.040000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.001000,0.000000,53.040000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.801000,0.000000,53.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.801000,0.000000,53.040000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.801000,0.000000,53.040000> }
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.210800,0.000000,53.614600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.210800,0.000000,53.014600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.210800,0.000000,53.014600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.010800,0.000000,53.614600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.010800,0.000000,53.014600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.010800,0.000000,53.014600> }
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.717000,0.000000,64.170000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.117000,0.000000,64.170000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.117000,0.000000,64.170000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.717000,0.000000,65.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.117000,0.000000,65.370000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.117000,0.000000,65.370000> }
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.068000,0.000000,20.285000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.668000,0.000000,20.285000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.068000,0.000000,20.285000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.068000,0.000000,19.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.668000,0.000000,19.085000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.068000,0.000000,19.085000> }
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.290000,0.000000,17.364000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.890000,0.000000,17.364000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.290000,0.000000,17.364000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.290000,0.000000,16.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.890000,0.000000,16.164000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.290000,0.000000,16.164000> }
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,0.000000,17.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,0.000000,16.464000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.461000,0.000000,16.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.261000,0.000000,17.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.261000,0.000000,16.464000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.261000,0.000000,16.464000> }
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.116000,0.000000,20.285000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.716000,0.000000,20.285000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.116000,0.000000,20.285000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.116000,0.000000,19.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.716000,0.000000,19.085000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.116000,0.000000,19.085000> }
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.989000,0.000000,17.364000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.589000,0.000000,17.364000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.989000,0.000000,17.364000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.989000,0.000000,16.164000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.589000,0.000000,16.164000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.989000,0.000000,16.164000> }
//R25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.420000,0.000000,16.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.420000,0.000000,17.064000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.420000,0.000000,17.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.620000,0.000000,16.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.620000,0.000000,17.064000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.620000,0.000000,17.064000> }
//RX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.066000,0.000000,56.324500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.066000,0.000000,57.086500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.066000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.066000,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098000,0.000000,57.086500>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.066000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098000,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098000,0.000000,56.324500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.098000,0.000000,56.324500> }
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,64.897000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,64.897000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,72.263000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,72.263000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,72.263000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,72.263000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,72.009000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.096000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,72.009000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,69.215000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.127000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,65.151000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,64.897000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.096000,0.000000,64.897000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,69.215000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.127000,0.000000,69.215000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,67.945000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.127000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,69.215000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,67.945000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.143000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,67.945000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.127000,0.000000,67.945000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,67.945000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,65.151000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.127000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,71.247000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.429000,0.000000,71.247000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,71.247000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,71.247000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,71.247000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,71.247000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,70.485000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.683000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,70.485000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,69.342000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.429000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,69.342000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,67.818000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,0.000000,67.818000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,67.818000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,67.818000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,67.818000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,67.818000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,66.802000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.429000,0.000000,66.802000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,66.802000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,66.802000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,66.802000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,66.802000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,65.913000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.683000,0.000000,65.913000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,65.913000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.683000,0.000000,65.913000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.429000,0.000000,65.913000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,65.913000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,65.151000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.429000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,69.342000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.540000,0.000000,69.342000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,69.342000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,68.072000>}
box{<0,0,-0.076200><1.325919,0.036000,0.076200> rotate<0,-73.295918,0> translate<2.159000,0.000000,68.072000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,68.072000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.540000,0.000000,66.929000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.540000,0.000000,66.929000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.778000,0.000000,68.580000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.778000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.778000,0.000000,68.834000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.778000,0.000000,68.580000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.778000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.778000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.778000,0.000000,68.326000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.778000,0.000000,68.326000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,72.009000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.397000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,72.009000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.921000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,72.009000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.127000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.127000,0.000000,65.151000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.127000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,65.151000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.397000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.921000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,65.151000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.921000,0.000000,65.151000> }
//TX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.589500,0.000000,56.324500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.589500,0.000000,57.086500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.589500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.589500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,57.086500>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.589500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621500,0.000000,56.324500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.621500,0.000000,56.324500> }
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,46.325000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,36.725000>}
box{<0,0,-0.063500><9.600000,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.813200,0.000000,36.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,36.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,36.725000>}
box{<0,0,-0.063500><5.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.213200,0.000000,36.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,36.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,39.125000>}
box{<0,0,-0.063500><2.400000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,39.125000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,44.125000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,46.325000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,46.325000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,46.325000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,46.325000>}
box{<0,0,-0.063500><5.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.213200,0.000000,46.325000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,39.125000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,44.125000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,44.125000> }
//U$3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,35.153000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,25.553000>}
box{<0,0,-0.063500><9.600000,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.813200,0.000000,25.553000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,25.553000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,25.553000>}
box{<0,0,-0.063500><5.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.213200,0.000000,25.553000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,25.553000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,27.953000>}
box{<0,0,-0.063500><2.400000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,27.953000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,32.953000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,35.153000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,35.153000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,35.153000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.813200,0.000000,35.153000>}
box{<0,0,-0.063500><5.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.213200,0.000000,35.153000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,27.953000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.213200,0.000000,32.953000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.213200,0.000000,32.953000> }
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
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,8.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.453000,0.000000,8.987000>}
box{<0,0,-0.101600><13.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.453000,0.000000,8.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.553000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,22.987000>}
box{<0,0,-0.101600><12.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.553000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.353000,0.000000,11.287000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.353000,0.000000,10.487000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.353000,0.000000,10.487000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.653000,0.000000,11.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.653000,0.000000,22.987000>}
box{<0,0,-0.101600><11.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.653000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.053000,0.000000,12.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.053000,0.000000,21.387000>}
box{<0,0,-0.101600><8.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.053000,0.000000,21.387000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,8.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,13.887000>}
box{<0,0,-0.101600><4.900000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.653000,0.000000,13.887000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,19.587000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,16.587000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.653000,0.000000,16.587000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.653000,0.000000,22.287000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.653000,0.000000,22.287000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.053000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.053000,0.000000,11.987000>}
box{<0,0,-0.101600><11.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<0.053000,0.000000,11.987000> }
object{ARC(0.651900,0.203200,85.601295,184.398705,0.036000) translate<3.003000,0.000000,11.337000>}
object{ARC(1.025300,0.203200,271.397181,358.602819,0.036000) translate<3.028000,0.000000,13.012000>}
//X-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,73.342500>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.152000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,73.342500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.152000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,79.692500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<85.852000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.122000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<85.852000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.882000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.882000,0.000000,72.072500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<71.882000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.122000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.122000,0.000000,80.962500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<87.122000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,79.692500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<77.470000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,78.930500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<77.470000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,78.930500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<81.534000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.534000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.534000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.152000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.422000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.152000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.422000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.422000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<74.422000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.882000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.882000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.867000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.137000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<78.867000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.867000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.867000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<78.867000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.867000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.422000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<74.422000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.137000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.137000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<80.137000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.582000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<84.582000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<85.852000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.582000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.582000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<84.582000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.582000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.137000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<80.137000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.882000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,80.962500>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.882000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,80.962500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<77.470000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.152000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.152000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<77.470000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<77.470000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.470000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.898000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<72.898000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.898000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.898000,0.000000,73.088500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<72.898000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.898000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.106000,0.000000,73.088500>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<72.898000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.106000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.106000,0.000000,79.946500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<86.106000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<86.106000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.534000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<81.534000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.534000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.534000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,80.962500>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.534000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,80.962500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<82.042000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.042000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.312000,0.000000,80.835500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<82.042000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.312000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.312000,0.000000,80.835500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<83.312000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.312000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.122000,0.000000,80.962500>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<83.312000,0.000000,80.962500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<79.502000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<82.042000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<76.962000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<79.502000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<82.042000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<76.962000,0.000000,77.787500>}
//X-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,59.880500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,65.595500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,65.595500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,65.595500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,65.595500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,65.595500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,65.595500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,59.880500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,59.880500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,59.880500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,59.880500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,59.880500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,59.880500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,58.928000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,58.928000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,59.880500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,59.880500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,59.880500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,59.880500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,59.880500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,64.960500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,60.515500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,60.515500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,64.960500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,60.515500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,60.515500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,64.960500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,64.960500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,64.960500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,60.515500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,60.515500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,60.515500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,60.515500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,60.515500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,60.515500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,60.515500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,60.515500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,60.515500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,59.563000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,60.515500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,59.563000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,60.515500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,59.563000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,59.563000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,62.738000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,62.738000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,62.738000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,62.738000>}
//X-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,67.627500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,73.342500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,73.342500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,67.627500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,67.627500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,67.627500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,67.627500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,67.627500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,67.627500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,66.675000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,66.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,66.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,66.675000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,66.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,66.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,67.627500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,67.627500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,67.627500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,67.627500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,67.627500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,72.707500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,68.262500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,68.262500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,72.707500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,68.262500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,68.262500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,72.707500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,72.707500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,72.707500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,68.262500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,68.262500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,68.262500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,68.262500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,68.262500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,68.262500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,68.262500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,68.262500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,68.262500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,67.310000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,67.310000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,68.262500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,67.310000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,67.310000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,68.262500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,67.310000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,67.310000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,70.485000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,70.485000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,70.485000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,70.485000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.825000,0.000000,16.455000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,16.455000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.825000,0.000000,16.455000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,16.455000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,23.155000>}
box{<0,0,-0.127000><6.700000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.825000,0.000000,23.155000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,24.255000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,25.855000>}
box{<0,0,-0.127000><1.600000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.825000,0.000000,25.855000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.825000,0.000000,25.855000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.825000,0.000000,25.855000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.825000,0.000000,25.855000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.825000,0.000000,25.855000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.825000,0.000000,16.455000>}
box{<0,0,-0.127000><9.400000,0.036000,0.127000> rotate<0,-90.000000,0> translate<81.825000,0.000000,16.455000> }
object{ARC(1.664300,0.254000,212.735226,327.264774,0.036000) translate<83.925000,0.000000,18.655000>}
object{ARC(1.664300,0.254000,32.735226,147.264774,0.036000) translate<83.925000,0.000000,18.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<85.325000,0.000000,17.755000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<85.325000,0.000000,19.555000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<85.325000,0.000000,19.555000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<82.625000,0.000000,17.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.925000,0.000000,17.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<81.925000,0.000000,17.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<82.625000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<81.925000,0.000000,19.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<81.925000,0.000000,19.655000> }
object{ARC(1.664300,0.254000,32.735226,147.264774,0.036000) translate<36.725000,0.000000,18.655000>}
object{ARC(1.664300,0.254000,212.735226,327.264774,0.036000) translate<36.725000,0.000000,18.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.325000,0.000000,19.555000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.325000,0.000000,17.755000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<35.325000,0.000000,17.755000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.025000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.725000,0.000000,19.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.025000,0.000000,19.655000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.025000,0.000000,17.655000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.725000,0.000000,17.655000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.025000,0.000000,17.655000> }
object{ARC(0.550000,0.254000,90.000000,270.000000,0.036000) translate<38.825000,0.000000,23.705000>}
//X4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.775000,0.000000,49.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.775000,0.000000,61.145000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<8.775000,0.000000,61.145000> }
//X5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,10.160000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<98.171000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,10.160000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<96.901000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,11.430000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,-44.997030,0> translate<96.901000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,11.430000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,44.997030,0> translate<96.901000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.346000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.346000,0.000000,19.050000>}
box{<0,0,-0.076200><11.430000,0.036000,0.076200> rotate<0,90.000000,0> translate<101.346000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.346000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.050000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,19.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,7.620000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<101.346000,0.000000,7.620000>}
box{<0,0,-0.076200><7.874000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,8.255000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.742000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,8.255000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,18.415000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.488000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,18.415000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.742000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,15.240000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<98.171000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,15.240000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<96.901000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,16.510000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,-44.997030,0> translate<96.901000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.171000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,16.510000>}
box{<0,0,-0.076200><1.796051,0.036000,0.076200> rotate<0,44.997030,0> translate<96.901000,0.000000,16.510000> }
object{ARC(2.667000,0.152400,306.869898,360.000000,0.036000) translate<98.425000,0.000000,10.795000>}
object{ARC(2.667000,0.152400,0.000000,53.130102,0.036000) translate<98.425000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,13.716000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<100.076000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,8.686800>}
box{<0,0,-0.076200><0.431800,0.036000,0.076200> rotate<0,90.000000,0> translate<100.076000,0.000000,8.686800> }
object{ARC(2.667000,0.152400,306.869898,360.000000,0.036000) translate<98.425000,0.000000,15.875000>}
object{ARC(2.667000,0.152400,0.000000,53.130102,0.036000) translate<98.425000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,17.983200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.076000,0.000000,18.415000>}
box{<0,0,-0.076200><0.431800,0.036000,0.076200> rotate<0,90.000000,0> translate<100.076000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.287000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.303000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,15.367000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,16.383000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,18.415000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.742000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,10.287000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.964000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,11.303000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.964000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,15.367000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.964000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,16.383000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.964000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,19.050000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,90.000000,0> translate<92.964000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,15.367000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,16.383000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,10.033000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.472000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,15.113000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.472000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,15.367000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<92.964000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,15.113000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,15.367000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.488000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,11.557000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.488000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,8.255000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.488000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.637000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<92.964000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,19.050000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<93.472000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,16.637000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,16.383000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<94.488000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,16.637000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,18.415000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<94.488000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,11.303000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,10.287000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.964000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,10.033000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,11.557000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.472000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,11.557000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,-26.563298,0> translate<92.964000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.472000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.964000,0.000000,10.287000>}
box{<0,0,-0.076200><0.567961,0.036000,0.076200> rotate<0,26.563298,0> translate<92.964000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,10.287000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<94.488000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.488000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.742000,0.000000,11.303000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<94.488000,0.000000,11.557000> }
//Y-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,73.342500>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,73.342500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.150000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,79.692500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<69.850000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.850000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,72.072500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.880000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,80.962500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<71.120000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,79.692500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.468000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,78.930500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.468000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,78.930500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<65.532000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.532000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.532000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.150000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.420000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.880000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.865000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.135000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.865000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.865000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.865000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<62.865000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.865000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<58.420000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.135000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.135000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<64.135000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<68.580000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<69.850000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.580000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.135000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<64.135000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,80.962500>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.880000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,80.962500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.468000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.468000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<61.468000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.468000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.896000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.896000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.896000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.896000,0.000000,73.088500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<56.896000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.896000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,73.088500>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.896000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,79.946500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<70.104000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.104000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<65.532000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<65.532000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.532000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.532000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.040000,0.000000,80.962500>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.532000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.040000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.040000,0.000000,80.962500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<66.040000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.040000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,80.835500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<66.040000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,80.835500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<67.310000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,80.962500>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.310000,0.000000,80.962500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<63.500000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.040000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.960000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<63.500000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.040000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.960000,0.000000,77.787500>}
//Y-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,44.386500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,50.101500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,50.101500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,50.101500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,50.101500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,50.101500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,50.101500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,44.386500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,44.386500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,44.386500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,44.386500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,44.386500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,44.386500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,43.434000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,43.434000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,44.386500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,44.386500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,44.386500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,44.386500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,44.386500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,49.466500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,45.021500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,49.466500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,45.021500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,49.466500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,49.466500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,49.466500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,45.021500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,45.021500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,45.021500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,44.069000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,44.069000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,44.069000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,44.069000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,44.069000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,44.069000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,44.069000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,47.244000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,47.244000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,47.244000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,47.244000>}
//Y-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,52.133500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,57.848500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,57.848500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,57.848500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,57.848500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,57.848500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,57.848500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,52.133500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,52.133500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,52.133500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,52.133500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,52.133500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,52.133500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,51.181000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,51.181000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,51.181000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,51.181000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,51.181000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,51.181000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,52.133500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,52.133500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,52.133500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,52.133500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,52.133500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,57.213500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,52.768500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,52.768500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,57.213500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,52.768500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,52.768500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,57.213500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,57.213500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,57.213500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,52.768500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,52.768500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,52.768500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,52.768500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,52.768500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,52.768500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,52.768500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,51.816000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,51.816000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,52.768500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,51.816000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,51.816000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,54.991000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,54.991000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,54.991000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,54.991000>}
//Z-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,73.342500>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.148000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,73.342500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<41.148000,0.000000,73.342500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,73.342500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,79.692500>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<53.848000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.118000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<53.848000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.878000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.878000,0.000000,72.072500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.878000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.118000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.118000,0.000000,80.962500>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.118000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,79.692500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<45.466000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,78.930500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,78.930500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<45.466000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,78.930500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.530000,0.000000,78.930500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.530000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.530000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<41.148000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.418000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.148000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.418000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.418000,0.000000,71.818500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.418000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.878000,0.000000,72.072500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.878000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.863000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.863000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.863000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.418000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<42.418000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.133000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.578000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,71.818500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.578000,0.000000,71.818500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.848000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<53.848000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.578000,0.000000,71.818500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.578000,0.000000,72.072500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.578000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.578000,0.000000,72.072500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.133000,0.000000,72.072500>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.133000,0.000000,72.072500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.878000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,80.962500>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.878000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,80.962500>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<45.466000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.148000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,79.692500>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.148000,0.000000,79.692500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,79.692500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,79.946500>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<45.466000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.466000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<45.466000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<45.466000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.894000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<40.894000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.894000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.894000,0.000000,73.088500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<40.894000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.894000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.102000,0.000000,73.088500>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<40.894000,0.000000,73.088500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.102000,0.000000,73.088500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.102000,0.000000,79.946500>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<54.102000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.102000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.530000,0.000000,79.946500>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<49.530000,0.000000,79.946500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,79.946500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,80.962500>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.530000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,80.962500>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.530000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,80.962500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.038000,0.000000,80.962500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,80.835500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,80.835500>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.038000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,80.835500>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<51.308000,0.000000,80.835500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,80.962500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.118000,0.000000,80.962500>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<51.308000,0.000000,80.962500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<47.498000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.038000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<44.958000,0.000000,75.247500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<47.498000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.038000,0.000000,77.787500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<44.958000,0.000000,77.787500>}
//Z-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,28.638500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,34.353500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,34.353500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,34.353500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,34.353500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,34.353500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,34.353500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,28.638500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,28.638500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,28.638500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,28.638500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,28.638500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,28.638500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,27.686000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,27.686000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,28.638500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,28.638500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,28.638500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,28.638500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,28.638500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,33.718500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,29.273500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,29.273500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,33.718500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,29.273500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,29.273500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,33.718500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,33.718500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,33.718500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,29.273500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,29.273500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,29.273500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,29.273500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,29.273500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,29.273500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,28.321000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,28.321000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,28.321000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,28.321000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,31.496000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,31.496000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,31.496000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,31.496000>}
//Z-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,36.385500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,42.100500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<101.219000,0.000000,42.100500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,42.100500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,42.100500>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,42.100500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,42.100500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,36.385500>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<88.519000,0.000000,36.385500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<88.519000,0.000000,36.385500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,36.385500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<88.519000,0.000000,36.385500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,36.385500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,35.433000>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,-90.000000,0> translate<91.376500,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<91.376500,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,35.433000>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,0.000000,0> translate<91.376500,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,36.385500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,90.000000,0> translate<98.361500,0.000000,36.385500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.361500,0.000000,36.385500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.219000,0.000000,36.385500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,0.000000,0> translate<98.361500,0.000000,36.385500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,41.465500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,37.020500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<89.154000,0.000000,37.020500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,41.465500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,37.020500>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,-90.000000,0> translate<100.584000,0.000000,37.020500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,41.465500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,41.465500>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,41.465500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<89.154000,0.000000,37.020500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,37.020500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<89.154000,0.000000,37.020500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,37.020500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,37.020500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,37.020500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,37.020500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<100.584000,0.000000,37.020500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,0.000000,0> translate<97.726500,0.000000,37.020500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,36.068000>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,0.000000,0> translate<92.011500,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,37.020500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<92.011500,0.000000,36.068000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<92.011500,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,37.020500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<97.726500,0.000000,36.068000>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,-90.000000,0> translate<97.726500,0.000000,36.068000> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<93.599000,0.000000,39.243000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<91.059000,0.000000,39.243000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<98.679000,0.000000,39.243000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-0.000000,0> translate<96.139000,0.000000,39.243000>}
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
//5VAUX		0805RND
//5VMAIN		0805RND
//12V		0805RND
//DEBUG		0805RND
//E-STOP	C-GRID-04-70543	70543-04
//F1	500mA	L1812
//IC2	SN74LVC1T45	DBV
//IC5		TO220-IGO
//J1		556416-1
//J2		556416-1
//J3		556416-1
//J5		556416-1
//PIEZO	BUZZERNS	BUZZER-12MM-NS
//RX		0805RND
//S1		B3F-31XX
//TX		0805RND
//U$2	DPDTALPS	ALPS-SSAC-RA
//U$3	DPDTALPS	ALPS-SSAC-RA
//U$4		3,0
//U$5		3,0
//U$6		3,0
//U$7		3,0
//U1	3M5607CT-ND	MICRO-SD-SOCKET-PP
//X-MAX	C-GRID-04-70543	70543-04
//X-MIN	C-GRID-04-70543	70543-04
//X1	5566-20	5566-20
//X4		PN61729
//Y-MAX	C-GRID-04-70543	70543-04
//Y-MIN	C-GRID-04-70543	70543-04
//Z-MAX	C-GRID-04-70543	70543-04
//Z-MIN	C-GRID-04-70543	70543-04
