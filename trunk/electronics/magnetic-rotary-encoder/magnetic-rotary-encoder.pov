//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/magnetic-rotary-encoder/magnetic-rotary-encoder.brd
//5/28/10 4:02 PM

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
#local cam_y = 159;
#local cam_z = -85;
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

#local lgt1_pos_x = 10;
#local lgt1_pos_y = 21;
#local lgt1_pos_z = 19;
#local lgt1_intense = 0.714796;
#local lgt2_pos_x = -10;
#local lgt2_pos_y = 21;
#local lgt2_pos_z = 19;
#local lgt2_intense = 0.714796;
#local lgt3_pos_x = 10;
#local lgt3_pos_y = 21;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.714796;
#local lgt4_pos_x = -10;
#local lgt4_pos_y = 21;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.714796;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 28.004000;
#declare pcb_y_size = 36.984200;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(370);
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
	//translate<-14.002000,0,-18.492100>
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
<-14.052800,-25.984200><13.951200,-25.984200>
<13.951200,-25.984200><13.951200,11.000000>
<13.951200,11.000000><-14.052800,11.000000>
<-14.052800,11.000000><-14.052800,-25.984200>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<10.000000,1,7.000000><10.000000,-5,7.000000>1.500000 texture{col_hls}}
cylinder{<10.000000,1,-22.000000><10.000000,-5,-22.000000>1.500000 texture{col_hls}}
cylinder{<-10.000000,1,-22.000000><-10.000000,-5,-22.000000>1.500000 texture{col_hls}}
cylinder{<-10.000000,1,7.000000><-10.000000,-5,7.000000>1.500000 texture{col_hls}}
cylinder{<0.000000,1,0.000000><0.000000,-5,0.000000>3.049200 texture{col_hls}}
cylinder{<-5.335800,1,-21.917200><-5.335800,-5,-21.917200>1.700000 texture{col_hls}}
cylinder{<5.078200,1,-21.917200><5.078200,-5,-21.917200>1.700000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<2.463800,0.000000,-7.594600>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100nF 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<2.463800,0.000000,-9.702800>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C2 1uF 0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.797800,0.000000,-0.711200>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 1uF 0805
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SSOP16("AS5040","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<0.000000,0.000000,0.000000>translate<0,0.035000,0> }#end		//SSOP16 IC1 AS5040 SSOP16
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<1.905000,0.000000,6.350000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 560 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<4.445000,0.000000,6.350000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 560 0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-7.620000,0.000000,-8.255000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R6 560 0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0805("561",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<-10.160000,0.000000,-8.255000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R7 560 0805
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-1.778000,0.000000,7.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-1.778000,0.000000,5.450000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-4.445000,0.000000,7.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-4.445000,0.000000,5.450000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.363800,0.000000,-7.594600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<1.563800,0.000000,-7.594600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.363800,0.000000,-9.702800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<1.563800,0.000000,-9.702800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.797800,0.000000,0.188800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.797800,0.000000,-1.611200>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,2.275000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,1.625000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,0.975000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,0.325000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,-0.325000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,-0.975000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,-1.625000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-3.795000,0.000000,-2.275000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,-2.275000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,-1.625000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,-0.975000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,-0.325000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,0.325000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,0.975000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,1.625000>}
object{TOOLS_PCB_SMD(0.460000,1.430000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.795000,0.000000,2.275000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<-7.620000,0.000000,-12.965000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<-7.620000,0.000000,-11.165000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<-10.160000,0.000000,-12.965000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<-10.160000,0.000000,-11.165000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<1.905000,0.000000,7.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<1.905000,0.000000,5.450000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.445000,0.000000,7.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.445000,0.000000,5.450000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-7.620000,0.000000,-7.355000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-7.620000,0.000000,-9.155000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-10.160000,0.000000,-7.355000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<-10.160000,0.000000,-9.155000>}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<3.681200,0,-13.281200> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<1.141200,0,-13.281200> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<-1.398800,0,-13.281200> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.638400,1.092200,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<-3.938800,0,-13.281200> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.065000,0.000000,-13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.065000,0.000000,-8.255000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,90.000000,0> translate<-12.065000,0.000000,-8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.065000,0.000000,-8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.165000,0.000000,-7.355000>}
box{<0,0,-0.203200><1.272792,0.035000,0.203200> rotate<0,-44.997030,0> translate<-12.065000,0.000000,-8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-12.965000>}
box{<0,0,-0.304800><0.370000,0.035000,0.304800> rotate<0,90.000000,0> translate<-10.160000,0.000000,-12.965000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-9.155000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-11.165000>}
box{<0,0,-0.304800><2.010000,0.035000,0.304800> rotate<0,-90.000000,0> translate<-10.160000,0.000000,-11.165000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.165000,0.000000,-7.355000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160000,0.000000,-7.355000>}
box{<0,0,-0.203200><1.005000,0.035000,0.203200> rotate<0,0.000000,0> translate<-11.165000,0.000000,-7.355000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.065000,0.000000,-13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.255000,0.000000,-17.780000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,44.997030,0> translate<-12.065000,0.000000,-13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.620000,0.000000,-9.155000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.620000,0.000000,-11.165000>}
box{<0,0,-0.304800><2.010000,0.035000,0.304800> rotate<0,-90.000000,0> translate<-7.620000,0.000000,-11.165000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-7.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.620000,0.000000,-7.355000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<-10.160000,0.000000,-7.355000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.620000,0.000000,-12.965000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.303800,0.000000,-13.281200>}
box{<0,0,-0.304800><0.447174,0.035000,0.304800> rotate<0,44.997030,0> translate<-7.620000,0.000000,-12.965000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-10.160000,0.000000,-13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-6.985000,0.000000,-16.510000>}
box{<0,0,-0.304800><4.490128,0.035000,0.304800> rotate<0,44.997030,0> translate<-10.160000,0.000000,-13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.985000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.985000,0.000000,-3.175000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-6.985000,0.000000,-3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.985000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.010000,0.000000,0.975000>}
box{<0,0,-0.152400><1.378858,0.035000,0.152400> rotate<0,-44.997030,0> translate<-6.985000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,-3.175000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-5.715000,0.000000,-3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,1.905000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-5.715000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.435000,0.000000,1.625000>}
box{<0,0,-0.152400><0.395980,0.035000,0.152400> rotate<0,44.997030,0> translate<-5.715000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.390000,0.000000,0.325000>}
box{<0,0,-0.152400><0.459619,0.035000,0.152400> rotate<0,-44.997030,0> translate<-5.715000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,4.445000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<-5.715000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,5.450000>}
box{<0,0,-0.152400><1.005000,0.035000,0.152400> rotate<0,90.000000,0> translate<-4.445000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,7.250000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,8.890000>}
box{<0,0,-0.152400><1.640000,0.035000,0.152400> rotate<0,90.000000,0> translate<-4.445000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-7.303800,0.000000,-13.281200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-3.938800,0.000000,-13.281200>}
box{<0,0,-0.304800><3.365000,0.035000,0.304800> rotate<0,0.000000,0> translate<-7.303800,0.000000,-13.281200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.938800,0.000000,-6.221200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.938800,0.000000,-13.281200>}
box{<0,0,-0.152400><7.060000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-3.938800,0.000000,-13.281200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.985000,0.000000,-3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.938800,0.000000,-6.221200>}
box{<0,0,-0.152400><4.307977,0.035000,0.152400> rotate<0,44.997030,0> translate<-6.985000,0.000000,-3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.810000,0.000000,-3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.810000,0.000000,-2.290000>}
box{<0,0,-0.203200><0.885000,0.035000,0.203200> rotate<0,90.000000,0> translate<-3.810000,0.000000,-2.290000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-4.445000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.810000,0.000000,9.525000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<-4.445000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.810000,0.000000,-2.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795000,0.000000,-2.275000>}
box{<0,0,-0.203200><0.021213,0.035000,0.203200> rotate<0,-44.997030,0> translate<-3.810000,0.000000,-2.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795000,0.000000,-2.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795000,0.000000,-1.625000>}
box{<0,0,-0.203200><0.650000,0.035000,0.203200> rotate<0,90.000000,0> translate<-3.795000,0.000000,-1.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.390000,0.000000,0.325000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,0.325000>}
box{<0,0,-0.152400><1.595000,0.035000,0.152400> rotate<0,0.000000,0> translate<-5.390000,0.000000,0.325000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-6.010000,0.000000,0.975000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,0.975000>}
box{<0,0,-0.152400><2.215000,0.035000,0.152400> rotate<0,0.000000,0> translate<-6.010000,0.000000,0.975000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.435000,0.000000,1.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,1.625000>}
box{<0,0,-0.152400><1.640000,0.035000,0.152400> rotate<0,0.000000,0> translate<-5.435000,0.000000,1.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,3.190000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,2.275000>}
box{<0,0,-0.152400><0.915000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-3.795000,0.000000,2.275000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-6.985000,0.000000,-16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-2.540000,0.000000,-16.510000>}
box{<0,0,-0.304800><4.445000,0.035000,0.304800> rotate<0,0.000000,0> translate<-6.985000,0.000000,-16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.255000,0.000000,-17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.905000,0.000000,-17.780000>}
box{<0,0,-0.203200><6.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.255000,0.000000,-17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.795000,0.000000,3.190000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-1.778000,0.000000,5.207000>}
box{<0,0,-0.152400><2.852469,0.035000,0.152400> rotate<0,-44.997030,0> translate<-3.795000,0.000000,3.190000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.778000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.778000,0.000000,5.450000>}
box{<0,0,-0.127000><0.243000,0.035000,0.127000> rotate<0,90.000000,0> translate<-1.778000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-2.540000,0.000000,-16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-1.398800,0.000000,-15.368800>}
box{<0,0,-0.304800><1.613901,0.035000,0.304800> rotate<0,-44.997030,0> translate<-2.540000,0.000000,-16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-1.398800,0.000000,-13.281200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<-1.398800,0.000000,-15.368800>}
box{<0,0,-0.304800><2.087600,0.035000,0.304800> rotate<0,-90.000000,0> translate<-1.398800,0.000000,-15.368800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-1.398800,0.000000,-7.491200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-1.398800,0.000000,-13.281200>}
box{<0,0,-0.152400><5.790000,0.035000,0.152400> rotate<0,-90.000000,0> translate<-1.398800,0.000000,-13.281200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-5.715000,0.000000,-3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-1.398800,0.000000,-7.491200>}
box{<0,0,-0.152400><6.104029,0.035000,0.152400> rotate<0,44.997030,0> translate<-5.715000,0.000000,-3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.810000,0.000000,-3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,-7.594600>}
box{<0,0,-0.203200><6.250258,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.810000,0.000000,-3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.905000,0.000000,-17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.141200,0.000000,-14.733800>}
box{<0,0,-0.203200><4.307977,0.035000,0.203200> rotate<0,-44.997030,0> translate<-1.905000,0.000000,-17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.141200,0.000000,-13.281200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.141200,0.000000,-14.733800>}
box{<0,0,-0.203200><1.452600,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.141200,0.000000,-14.733800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.141200,0.000000,-13.281200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,-13.152400>}
box{<0,0,-0.203200><0.182151,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.141200,0.000000,-13.281200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,-11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,-13.152400>}
box{<0,0,-0.203200><1.722400,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.270000,0.000000,-13.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,-11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-11.136200>}
box{<0,0,-0.203200><0.415496,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.270000,0.000000,-11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-9.702800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-11.136200>}
box{<0,0,-0.203200><1.433400,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.563800,0.000000,-11.136200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-7.594600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-9.702800>}
box{<0,0,-0.203200><2.108200,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.563800,0.000000,-9.702800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,-7.594600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-7.594600>}
box{<0,0,-0.203200><0.954200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609600,0.000000,-7.594600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-6.056200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-7.594600>}
box{<0,0,-0.203200><1.538400,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.563800,0.000000,-7.594600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-1.778000,0.000000,7.250000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,7.250000>}
box{<0,0,-0.152400><3.683000,0.035000,0.152400> rotate<0,0.000000,0> translate<-1.778000,0.000000,7.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563800,0.000000,-6.056200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,0.000000,-4.445000>}
box{<0,0,-0.203200><2.278581,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.563800,0.000000,-6.056200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,5.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,5.450000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<1.905000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.363800,0.000000,-7.594600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.363800,0.000000,-9.702800>}
box{<0,0,-0.203200><2.108200,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.363800,0.000000,-9.702800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.363800,0.000000,-7.594600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.389200,0.000000,-7.620000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<3.363800,0.000000,-7.594600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.681200,0.000000,-10.020200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.681200,0.000000,-13.281200>}
box{<0,0,-0.203200><3.261000,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.681200,0.000000,-13.281200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.363800,0.000000,-9.702800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.681200,0.000000,-10.020200>}
box{<0,0,-0.203200><0.448871,0.035000,0.203200> rotate<0,44.997030,0> translate<3.363800,0.000000,-9.702800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,5.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,4.830000>}
box{<0,0,-0.152400><0.876812,0.035000,0.152400> rotate<0,44.997030,0> translate<3.175000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,2.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,4.830000>}
box{<0,0,-0.152400><2.555000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.795000,0.000000,4.830000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-3.810000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,0.000000,9.525000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<-3.810000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,5.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,0.000000,5.450000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.175000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,0.000000,7.250000>}
box{<0,0,-0.152400><1.640000,0.035000,0.152400> rotate<0,-90.000000,0> translate<4.445000,0.000000,7.250000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,0.000000,8.890000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<3.810000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,0.000000,-4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,0.000000,-4.445000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.175000,0.000000,-4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.389200,0.000000,-7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,-7.620000>}
box{<0,0,-0.152400><2.325800,0.035000,0.152400> rotate<0,0.000000,0> translate<3.389200,0.000000,-7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,-0.975000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.055000,0.000000,-0.975000>}
box{<0,0,-0.152400><2.260000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.795000,0.000000,-0.975000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,0.000000,-4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,-3.175000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.080000,0.000000,-4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,-3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,-2.540000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.350000,0.000000,-2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.055000,0.000000,-0.975000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,-1.270000>}
box{<0,0,-0.152400><0.417193,0.035000,0.152400> rotate<0,44.997030,0> translate<6.055000,0.000000,-0.975000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,-2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,-1.270000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<6.350000,0.000000,-1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,1.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.361600,0.000000,1.625000>}
box{<0,0,-0.152400><2.566600,0.035000,0.152400> rotate<0,0.000000,0> translate<3.795000,0.000000,1.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,-2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.278800,0.000000,-1.611200>}
box{<0,0,-0.152400><1.313522,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.350000,0.000000,-2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.278800,0.000000,-1.611200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.797800,0.000000,-1.611200>}
box{<0,0,-0.152400><0.519000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.278800,0.000000,-1.611200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.361600,0.000000,1.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.797800,0.000000,0.188800>}
box{<0,0,-0.152400><2.031094,0.035000,0.152400> rotate<0,44.997030,0> translate<6.361600,0.000000,1.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.795000,0.000000,2.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.790000,0.000000,2.275000>}
box{<0,0,-0.152400><5.995000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.795000,0.000000,2.275000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,-7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,0.000000,-2.540000>}
box{<0,0,-0.152400><7.184205,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.715000,0.000000,-7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,0.000000,-2.540000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.795000,0.000000,-2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.790000,0.000000,2.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,0.000000,1.270000>}
box{<0,0,-0.152400><1.421285,0.035000,0.152400> rotate<0,44.997030,0> translate<9.790000,0.000000,2.275000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-18.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,3.862800>}
box{<0,0,-0.203200><22.725600,0.035000,0.203200> rotate<0,90.000000,0> translate<-12.833600,0.000000,3.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-18.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,3.862800>}
box{<0,0,-0.203200><22.725600,0.035000,0.203200> rotate<0,90.000000,0> translate<-12.833600,-1.535000,3.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-18.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,0.000000,-18.304500>}
box{<0,0,-0.203200><0.895376,0.035000,0.203200> rotate<0,-38.572316,0> translate<-12.833600,0.000000,-18.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-18.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,-1.535000,-18.304500>}
box{<0,0,-0.203200><0.895376,0.035000,0.203200> rotate<0,-38.572316,0> translate<-12.833600,-1.535000,-18.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.622400,0.000000,-18.694400>}
box{<0,0,-0.203200><0.211200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.622400,-1.535000,-18.694400>}
box{<0,0,-0.203200><0.211200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.091400,0.000000,-18.288000>}
box{<0,0,-0.203200><0.742200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.091400,-1.535000,-18.288000>}
box{<0,0,-0.203200><0.742200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.056000,0.000000,-17.881600>}
box{<0,0,-0.203200><1.777600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.056000,-1.535000,-17.881600>}
box{<0,0,-0.203200><1.777600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-17.475200>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-17.475200>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.719200,0.000000,-17.068800>}
box{<0,0,-0.203200><5.114400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-17.068800>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.125600,0.000000,-16.662400>}
box{<0,0,-0.203200><4.708000,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-16.662400>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.532000,0.000000,-16.256000>}
box{<0,0,-0.203200><4.301600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-16.256000>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.938400,0.000000,-15.849600>}
box{<0,0,-0.203200><3.895200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-15.849600>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.344800,0.000000,-15.443200>}
box{<0,0,-0.203200><3.488800,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.430400,-1.535000,-15.443200>}
box{<0,0,-0.203200><8.403200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.751200,0.000000,-15.036800>}
box{<0,0,-0.203200><3.082400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.022900,-1.535000,-15.036800>}
box{<0,0,-0.203200><7.810700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.157600,0.000000,-14.630400>}
box{<0,0,-0.203200><2.676000,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.265700,-1.535000,-14.630400>}
box{<0,0,-0.203200><7.567900,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.564000,0.000000,-14.224000>}
box{<0,0,-0.203200><2.269600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-14.224000>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.169400,0.000000,-13.817600>}
box{<0,0,-0.203200><1.664200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-13.817600>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-13.411200>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-13.411200>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-13.004800>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-13.004800>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-12.598400>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-12.598400>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.249000,0.000000,-12.192000>}
box{<0,0,-0.203200><1.584600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-12.192000>}
box{<0,0,-0.203200><7.466100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.328400,0.000000,-11.785600>}
box{<0,0,-0.203200><1.505200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.205000,-1.535000,-11.785600>}
box{<0,0,-0.203200><7.628600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-11.379200>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.876600,-1.535000,-11.379200>}
box{<0,0,-0.203200><7.957000,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-10.972800>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-10.972800>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.337400,0.000000,-10.566400>}
box{<0,0,-0.203200><1.496200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-10.566400>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.074300,0.000000,-10.160000>}
box{<0,0,-0.203200><1.759300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-10.160000>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.337500,0.000000,-9.753600>}
box{<0,0,-0.203200><1.496100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-9.753600>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-9.347200>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-9.347200>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-8.940800>}
box{<0,0,-0.203200><1.464100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-8.940800>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.328300,0.000000,-8.534400>}
box{<0,0,-0.203200><1.505300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-8.534400>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.028200,0.000000,-8.128000>}
box{<0,0,-0.203200><1.805400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-8.128000>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.721600>}
box{<0,0,-0.203200><1.616500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-7.721600>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.315200>}
box{<0,0,-0.203200><1.616500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-7.315200>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-6.908800>}
box{<0,0,-0.203200><1.616500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-6.908800>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.837300,0.000000,-6.502400>}
box{<0,0,-0.203200><1.996300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-6.502400>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.141500,0.000000,-6.096000>}
box{<0,0,-0.203200><7.692100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-6.096000>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.547900,0.000000,-5.689600>}
box{<0,0,-0.203200><7.285700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-5.689600>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.954300,0.000000,-5.283200>}
box{<0,0,-0.203200><6.879300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-5.283200>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.360700,0.000000,-4.876800>}
box{<0,0,-0.203200><6.472900,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-4.876800>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.767100,0.000000,-4.470400>}
box{<0,0,-0.203200><6.066500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-4.470400>}
box{<0,0,-0.203200><25.565600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.173500,0.000000,-4.064000>}
box{<0,0,-0.203200><5.660100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.324400,-1.535000,-4.064000>}
box{<0,0,-0.203200><11.509200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.579900,0.000000,-3.657600>}
box{<0,0,-0.203200><5.253700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.201500,-1.535000,-3.657600>}
box{<0,0,-0.203200><10.632100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-3.251200>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.785100,-1.535000,-3.251200>}
box{<0,0,-0.203200><10.048500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-2.844800>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.191500,-1.535000,-2.844800>}
box{<0,0,-0.203200><9.642100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-2.438400>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.520900,-1.535000,-2.438400>}
box{<0,0,-0.203200><9.312700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-2.032000>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.755500,-1.535000,-2.032000>}
box{<0,0,-0.203200><9.078100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-1.625600>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.983300,-1.535000,-1.625600>}
box{<0,0,-0.203200><8.850300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-1.219200>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.092200,-1.535000,-1.219200>}
box{<0,0,-0.203200><8.741400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-0.812800>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.201100,-1.535000,-0.812800>}
box{<0,0,-0.203200><8.632500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-0.406400>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,-0.406400>}
box{<0,0,-0.203200><8.565300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,0.000000>}
box{<0,0,-0.203200><5.086700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,0.000000>}
box{<0,0,-0.203200><8.565300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.641300,0.000000,0.406400>}
box{<0,0,-0.203200><5.192300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,0.406400>}
box{<0,0,-0.203200><8.565300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.249700,0.000000,0.812800>}
box{<0,0,-0.203200><5.583900,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.201000,-1.535000,0.812800>}
box{<0,0,-0.203200><8.632600,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.843300,0.000000,1.219200>}
box{<0,0,-0.203200><5.990300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.092100,-1.535000,1.219200>}
box{<0,0,-0.203200><8.741500,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.430200,0.000000,1.625600>}
box{<0,0,-0.203200><6.403400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.983200,-1.535000,1.625600>}
box{<0,0,-0.203200><8.850400,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,2.032000>}
box{<0,0,-0.203200><6.356700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.755400,-1.535000,2.032000>}
box{<0,0,-0.203200><9.078200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,2.438400>}
box{<0,0,-0.203200><6.356700,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.520800,-1.535000,2.438400>}
box{<0,0,-0.203200><9.312800,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.962300,0.000000,2.844800>}
box{<0,0,-0.203200><1.871300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.962300,-1.535000,2.844800>}
box{<0,0,-0.203200><1.871300,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.997700,0.000000,3.251200>}
box{<0,0,-0.203200><0.835900,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.997700,-1.535000,3.251200>}
box{<0,0,-0.203200><0.835900,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.576400,0.000000,3.657600>}
box{<0,0,-0.203200><0.257200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.576400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.257200,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.833600,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,0.000000,3.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,0.000000,3.304500>}
box{<0,0,-0.203200><0.895376,0.035000,0.203200> rotate<0,38.572316,0> translate<-12.833600,0.000000,3.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.833600,-1.535000,3.862800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,-1.535000,3.304500>}
box{<0,0,-0.203200><0.895376,0.035000,0.203200> rotate<0,38.572316,0> translate<-12.833600,-1.535000,3.862800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,0.000000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,0.000000,-18.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.133600,0.000000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,-1.535000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,-1.535000,-18.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.133600,-1.535000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,0.000000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,0.000000,3.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.133600,0.000000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133600,-1.535000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,-1.535000,3.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-12.133600,-1.535000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,0.000000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,0.000000,-17.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,-21.427754,0> translate<-12.133500,0.000000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,-1.535000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,-1.535000,-17.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,-21.427754,0> translate<-12.133500,-1.535000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,0.000000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,0.000000,2.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,21.427754,0> translate<-12.133500,0.000000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-12.133500,-1.535000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,-1.535000,2.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,21.427754,0> translate<-12.133500,-1.535000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-13.486200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-13.710300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-11.369500,0.000000,-13.486200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-12.443700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-13.486200>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.369500,0.000000,-13.486200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-12.443700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-12.219600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-11.369500,0.000000,-12.443700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-11.686200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-11.910300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-11.369500,0.000000,-11.686200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-10.643700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-11.686200>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.369500,0.000000,-11.686200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-10.643700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-10.419600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-11.369500,0.000000,-10.643700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-9.676200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-9.900300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-11.369500,0.000000,-9.676200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-8.633700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-9.676200>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.369500,0.000000,-9.676200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.369500,0.000000,-8.633700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-8.409600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-11.369500,0.000000,-8.633700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-13.710300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-13.881700>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.276700,0.000000,-13.710300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-12.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.122000,0.000000,-12.065000>}
box{<0,0,-0.203200><0.218708,0.035000,0.203200> rotate<0,-44.978507,0> translate<-11.276700,0.000000,-12.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-11.910300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.122000,0.000000,-12.065000>}
box{<0,0,-0.203200><0.218779,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.276700,0.000000,-11.910300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-10.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-10.248200>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-11.276700,0.000000,-10.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-9.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-10.071700>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.276700,0.000000,-9.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.276700,0.000000,-8.409600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-8.238200>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-11.276700,0.000000,-8.409600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.185900,0.000000,-7.931400>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<-11.217100,0.000000,-7.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.815200>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.217100,0.000000,-7.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.161000,0.000000,-7.355400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-11.217100,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.161000,0.000000,-7.354400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-11.217100,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-6.894700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-7.354400>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.217100,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.217100,0.000000,-6.894700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.185900,0.000000,-6.778500>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<-11.217100,0.000000,-6.894700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.185900,0.000000,-7.931400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.125800,0.000000,-8.035700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<-11.185900,0.000000,-7.931400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.185900,0.000000,-6.778500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.125800,0.000000,-6.674200>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<-11.185900,0.000000,-6.778500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.125800,0.000000,-8.035700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.040700,0.000000,-8.120800>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<-11.125800,0.000000,-8.035700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.125800,0.000000,-6.674200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.040700,0.000000,-6.589100>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<-11.125800,0.000000,-6.674200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-13.881700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.881200,0.000000,-13.974500>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,22.493003,0> translate<-11.105300,0.000000,-13.881700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-10.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.074300,0.000000,-10.235400>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,-22.434408,0> translate<-11.105300,0.000000,-10.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-10.071700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.074300,0.000000,-10.084500>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,22.434408,0> translate<-11.105300,0.000000,-10.071700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.105300,0.000000,-8.238200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949100,0.000000,-8.173500>}
box{<0,0,-0.203200><0.169070,0.035000,0.203200> rotate<0,-22.498465,0> translate<-11.105300,0.000000,-8.238200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.074300,0.000000,-10.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.074300,0.000000,-10.235400>}
box{<0,0,-0.203200><0.150900,0.035000,0.203200> rotate<0,-90.000000,0> translate<-11.074300,0.000000,-10.235400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.040700,0.000000,-8.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949100,0.000000,-8.173500>}
box{<0,0,-0.203200><0.105678,0.035000,0.203200> rotate<0,29.911028,0> translate<-11.040700,0.000000,-8.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-11.040700,0.000000,-6.589100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.936400,0.000000,-6.529000>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<-11.040700,0.000000,-6.589100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,0.000000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,0.000000,-17.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.949500,0.000000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,-1.535000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,-1.535000,-17.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.949500,-1.535000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,0.000000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,0.000000,2.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.949500,0.000000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949500,-1.535000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,-1.535000,2.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.949500,-1.535000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,0.000000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,0.000000,-17.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,-4.287860,0> translate<-10.949400,0.000000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,-1.535000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,-1.535000,-17.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,-4.287860,0> translate<-10.949400,-1.535000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,0.000000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,0.000000,2.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,4.287860,0> translate<-10.949400,0.000000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.949400,-1.535000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,-1.535000,2.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,4.287860,0> translate<-10.949400,-1.535000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.936400,0.000000,-6.529000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.820200,0.000000,-6.497800>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-15.028587,0> translate<-10.936400,0.000000,-6.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.881200,0.000000,-13.974500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.813500,0.000000,-13.974500>}
box{<0,0,-0.203200><0.067700,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.881200,0.000000,-13.974500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.820200,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-6.497800>}
box{<0,0,-0.203200><0.659800,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.820200,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.813500,0.000000,-13.974500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.760100,0.000000,-17.027900>}
box{<0,0,-0.203200><4.318160,0.035000,0.203200> rotate<0,44.997030,0> translate<-10.813500,0.000000,-13.974500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.161000,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.161000,0.000000,-7.355400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-10.161000,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-7.353900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-6.497800>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,90.000000,0> translate<-10.160400,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-7.353900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-7.353900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.160400,0.000000,-7.353900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-7.315200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.160400,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-6.908800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.160400,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.160400,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-6.502400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.160400,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-7.353900>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,-90.000000,0> translate<-10.159400,0.000000,-7.353900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.159400,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.499700,0.000000,-6.497800>}
box{<0,0,-0.203200><0.659700,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.159400,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.158900,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.158900,0.000000,-7.354400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<-10.158900,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.158900,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.355400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.158900,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-10.158900,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.354400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-10.158900,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,0.000000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,0.000000,-17.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.681100,0.000000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,-1.535000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,-1.535000,-17.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.681100,-1.535000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,0.000000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,0.000000,2.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.681100,0.000000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681100,-1.535000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,-1.535000,2.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.681100,-1.535000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,0.000000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,0.000000,-18.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,12.860726,0> translate<-9.681000,0.000000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,-1.535000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,-1.535000,-18.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,12.860726,0> translate<-9.681000,-1.535000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,0.000000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,0.000000,3.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,-12.860726,0> translate<-9.681000,0.000000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.681000,-1.535000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,-1.535000,3.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,-12.860726,0> translate<-9.681000,-1.535000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.499700,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.383500,0.000000,-6.529000>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<-9.499700,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.482500,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.297300,0.000000,-6.502400>}
box{<0,0,-0.203200><1.185200,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.482500,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.383500,0.000000,-6.529000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.279200,0.000000,-6.589100>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<-9.383500,0.000000,-6.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.370800,0.000000,-8.173500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.279200,0.000000,-8.120800>}
box{<0,0,-0.203200><0.105678,0.035000,0.203200> rotate<0,-29.911028,0> translate<-9.370800,0.000000,-8.173500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.370800,0.000000,-8.173500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-8.238200>}
box{<0,0,-0.203200><0.169070,0.035000,0.203200> rotate<0,22.498465,0> translate<-9.370800,0.000000,-8.173500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.291800,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.488200,0.000000,-8.128000>}
box{<0,0,-0.203200><0.803600,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.291800,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.279200,0.000000,-8.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.194100,0.000000,-8.035700>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<-9.279200,0.000000,-8.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.279200,0.000000,-6.589100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.194100,0.000000,-6.674200>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<-9.279200,0.000000,-6.589100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.245600,0.000000,-10.235400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.245600,0.000000,-10.084500>}
box{<0,0,-0.203200><0.150900,0.035000,0.203200> rotate<0,90.000000,0> translate<-9.245600,0.000000,-10.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.245600,0.000000,-10.235400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-10.248200>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,22.434408,0> translate<-9.245600,0.000000,-10.235400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.245600,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.534300,0.000000,-10.160000>}
box{<0,0,-0.203200><0.711300,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.245600,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.245600,0.000000,-10.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-10.071700>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,-22.434408,0> translate<-9.245600,0.000000,-10.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.242600,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,2.844800>}
box{<0,0,-0.203200><2.765700,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.242600,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.242600,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.191500,-1.535000,2.844800>}
box{<0,0,-0.203200><6.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.242600,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-10.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-10.419600>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-9.214600,0.000000,-10.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-10.071700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-9.900300>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-9.214600,0.000000,-10.071700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.214600,0.000000,-8.238200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-8.409600>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-9.214600,0.000000,-8.238200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.197900,0.000000,-12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-12.219600>}
box{<0,0,-0.203200><0.218708,0.035000,0.203200> rotate<0,44.978507,0> translate<-9.197900,0.000000,-12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.197900,0.000000,-12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-11.910300>}
box{<0,0,-0.203200><0.218779,0.035000,0.203200> rotate<0,-44.997030,0> translate<-9.197900,0.000000,-12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.194100,0.000000,-8.035700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.134000,0.000000,-7.931400>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<-9.194100,0.000000,-8.035700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.194100,0.000000,-6.674200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.134000,0.000000,-6.778500>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<-9.194100,0.000000,-6.674200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.134000,0.000000,-7.931400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.815200>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<-9.134000,0.000000,-7.931400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.134000,0.000000,-6.778500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-6.894700>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<-9.134000,0.000000,-6.778500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.355400>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,90.000000,0> translate<-9.102800,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.721600>}
box{<0,0,-0.203200><0.425700,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.102800,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-6.894700>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,90.000000,0> translate<-9.102800,0.000000,-6.894700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.315200>}
box{<0,0,-0.203200><0.425700,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.102800,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.102800,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-6.908800>}
box{<0,0,-0.203200><0.425700,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.102800,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.081400,0.000000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.943900,0.000000,-17.881600>}
box{<0,0,-0.203200><18.025300,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.081400,0.000000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.081400,-1.535000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.943900,-1.535000,-17.881600>}
box{<0,0,-0.203200><18.025300,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.081400,-1.535000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.070800,0.000000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.709000,0.000000,-12.192000>}
box{<0,0,-0.203200><0.361800,0.035000,0.203200> rotate<0,0.000000,0> translate<-9.070800,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-12.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-12.443700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-9.043200,0.000000,-12.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-11.910300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-11.686200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-9.043200,0.000000,-11.910300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-10.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-10.643700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-9.043200,0.000000,-10.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-9.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-9.676200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-9.043200,0.000000,-9.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-9.043200,0.000000,-8.409600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-8.633700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-9.043200,0.000000,-8.409600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.991600,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.788400,0.000000,-11.785600>}
box{<0,0,-0.203200><0.203200,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.991600,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.991500,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.788300,0.000000,-8.534400>}
box{<0,0,-0.203200><0.203200,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.991500,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.982500,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.797500,0.000000,-9.753600>}
box{<0,0,-0.203200><0.185000,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.982500,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.982400,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.797400,0.000000,-10.566400>}
box{<0,0,-0.203200><0.185000,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.982400,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-13.251400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-12.443700>}
box{<0,0,-0.203200><0.807700,0.035000,0.203200> rotate<0,90.000000,0> translate<-8.950400,0.000000,-12.443700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-13.251400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-13.372400>}
box{<0,0,-0.203200><0.171049,0.035000,0.203200> rotate<0,45.020714,0> translate<-8.950400,0.000000,-13.251400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-13.004800>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-12.598400>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-11.686200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-10.643700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,90.000000,0> translate<-8.950400,0.000000,-10.643700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-11.379200>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-10.972800>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-9.676200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-8.633700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,90.000000,0> translate<-8.950400,0.000000,-8.633700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-9.347200>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.950400,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-8.940800>}
box{<0,0,-0.203200><0.120900,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.950400,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-12.443700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-13.372400>}
box{<0,0,-0.203200><0.928700,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.829500,0.000000,-13.372400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-12.443700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-12.219600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-8.829500,0.000000,-12.443700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-11.686200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-11.910300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-8.829500,0.000000,-11.686200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-10.643700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-11.686200>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.829500,0.000000,-11.686200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-10.643700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-10.419600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-8.829500,0.000000,-10.643700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-9.676200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-9.900300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-8.829500,0.000000,-9.676200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-8.633700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-9.676200>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.829500,0.000000,-9.676200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.829500,0.000000,-8.633700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-8.409600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-8.829500,0.000000,-8.633700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-12.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.582000,0.000000,-12.065000>}
box{<0,0,-0.203200><0.218708,0.035000,0.203200> rotate<0,-44.978507,0> translate<-8.736700,0.000000,-12.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-11.910300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.582000,0.000000,-12.065000>}
box{<0,0,-0.203200><0.218779,0.035000,0.203200> rotate<0,44.997030,0> translate<-8.736700,0.000000,-11.910300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-10.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-10.248200>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-8.736700,0.000000,-10.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-9.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-10.071700>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-8.736700,0.000000,-9.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.736700,0.000000,-8.409600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-8.238200>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-8.736700,0.000000,-8.409600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.645900,0.000000,-7.931400>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<-8.677100,0.000000,-7.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.815200>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.677100,0.000000,-7.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.621000,0.000000,-7.355400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.677100,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.621000,0.000000,-7.354400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.677100,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-6.894700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-7.354400>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.677100,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.677100,0.000000,-6.894700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.645900,0.000000,-6.778500>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<-8.677100,0.000000,-6.894700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.645900,0.000000,-7.931400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.585800,0.000000,-8.035700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<-8.645900,0.000000,-7.931400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.645900,0.000000,-6.778500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.585800,0.000000,-6.674200>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<-8.645900,0.000000,-6.778500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.585800,0.000000,-8.035700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.500700,0.000000,-8.120800>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<-8.585800,0.000000,-8.035700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.585800,0.000000,-6.674200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.500700,0.000000,-6.589100>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<-8.585800,0.000000,-6.674200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-10.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.534300,0.000000,-10.235400>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,-22.434408,0> translate<-8.565300,0.000000,-10.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-10.071700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.534300,0.000000,-10.084500>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,22.434408,0> translate<-8.565300,0.000000,-10.071700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.565300,0.000000,-8.238200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.409100,0.000000,-8.173500>}
box{<0,0,-0.203200><0.169070,0.035000,0.203200> rotate<0,-22.498465,0> translate<-8.565300,0.000000,-8.238200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.534300,0.000000,-10.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.534300,0.000000,-10.235400>}
box{<0,0,-0.203200><0.150900,0.035000,0.203200> rotate<0,-90.000000,0> translate<-8.534300,0.000000,-10.235400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.500700,0.000000,-8.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.409100,0.000000,-8.173500>}
box{<0,0,-0.203200><0.105678,0.035000,0.203200> rotate<0,29.911028,0> translate<-8.500700,0.000000,-8.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.500700,0.000000,-6.589100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.396400,0.000000,-6.529000>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<-8.500700,0.000000,-6.589100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,0.000000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,0.000000,-18.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.441100,0.000000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,-1.535000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,-1.535000,-18.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.441100,-1.535000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,0.000000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,0.000000,3.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.441100,0.000000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441100,-1.535000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,-1.535000,3.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.441100,-1.535000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,0.000000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,0.000000,-18.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,29.996018,0> translate<-8.441000,0.000000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,-1.535000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,-1.535000,-18.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,29.996018,0> translate<-8.441000,-1.535000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,0.000000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,0.000000,3.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,-29.996018,0> translate<-8.441000,0.000000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.441000,-1.535000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,-1.535000,3.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,-29.996018,0> translate<-8.441000,-1.535000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.396400,0.000000,-6.529000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.280200,0.000000,-6.497800>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-15.028587,0> translate<-8.396400,0.000000,-6.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.280200,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-6.497800>}
box{<0,0,-0.203200><0.659800,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.280200,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.054100,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,3.251200>}
box{<0,0,-0.203200><1.577200,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.054100,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-8.054100,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.785100,-1.535000,3.251200>}
box{<0,0,-0.203200><5.269000,0.035000,0.203200> rotate<0,0.000000,0> translate<-8.054100,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.990200,-1.535000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.908400,-1.535000,-18.288000>}
box{<0,0,-0.203200><15.898600,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.990200,-1.535000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.990200,0.000000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.908500,0.000000,-18.288000>}
box{<0,0,-0.203200><15.898700,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.990200,0.000000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.760100,0.000000,-17.027900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.502900,0.000000,-17.285100>}
box{<0,0,-0.203200><0.363736,0.035000,0.203200> rotate<0,44.997030,0> translate<-7.760100,0.000000,-17.027900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-3.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.630900,0.000000,-3.606600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,67.492017,0> translate<-7.746900,0.000000,-3.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-0.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-3.326600>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-7.746900,0.000000,-3.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,0.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,-0.151600>}
box{<0,0,-0.203200><0.303200,0.035000,0.203200> rotate<0,-90.000000,0> translate<-7.746900,0.000000,-0.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.746900,0.000000,0.151600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.630900,0.000000,0.431600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,-67.492017,0> translate<-7.746900,0.000000,0.151600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.630900,0.000000,-3.606600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.416600,0.000000,-3.820900>}
box{<0,0,-0.203200><0.303066,0.035000,0.203200> rotate<0,44.997030,0> translate<-7.630900,0.000000,-3.606600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.630900,0.000000,0.431600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.441600,0.000000,1.620900>}
box{<0,0,-0.203200><1.681924,0.035000,0.203200> rotate<0,-44.997030,0> translate<-7.630900,0.000000,0.431600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.621000,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.621000,0.000000,-7.355400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-7.621000,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-7.353900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-6.497800>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,90.000000,0> translate<-7.620400,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-7.353900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-7.353900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.620400,0.000000,-7.353900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-7.315200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.620400,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-6.908800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.620400,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.620400,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-6.502400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.620400,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-7.353900>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,-90.000000,0> translate<-7.619400,0.000000,-7.353900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.619400,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.959700,0.000000,-6.497800>}
box{<0,0,-0.203200><0.659700,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.619400,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.618900,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.618900,0.000000,-7.354400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<-7.618900,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.618900,0.000000,-7.355400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.355400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.618900,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.618900,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.354400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.618900,0.000000,-7.354400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.502900,0.000000,-17.285100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.166900,0.000000,-17.424300>}
box{<0,0,-0.203200><0.363693,0.035000,0.203200> rotate<0,22.502043,0> translate<-7.502900,0.000000,-17.285100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.416600,0.000000,-3.820900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-6.536800>}
box{<0,0,-0.203200><3.840863,0.035000,0.203200> rotate<0,44.997030,0> translate<-7.416600,0.000000,-3.820900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.350100,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.309800,0.000000,3.657600>}
box{<0,0,-0.203200><1.040300,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.350100,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.350100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.201400,-1.535000,3.657600>}
box{<0,0,-0.203200><5.148700,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.350100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,0.000000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,0.000000,-18.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.339500,0.000000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,-1.535000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,-1.535000,-18.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.339500,-1.535000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,0.000000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,0.000000,3.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.339500,0.000000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339500,-1.535000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,-1.535000,3.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.339500,-1.535000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,0.000000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.711400,0.000000,-19.340700>}
box{<0,0,-0.203200><0.923425,0.035000,0.203200> rotate<0,47.147214,0> translate<-7.339400,0.000000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,-1.535000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.711400,-1.535000,-19.340700>}
box{<0,0,-0.203200><0.923425,0.035000,0.203200> rotate<0,47.147214,0> translate<-7.339400,-1.535000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,0.000000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,4.596200>}
box{<0,0,-0.203200><1.271988,0.035000,0.203200> rotate<0,-47.144156,0> translate<-7.339400,0.000000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.339400,-1.535000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,4.596200>}
box{<0,0,-0.203200><1.271988,0.035000,0.203200> rotate<0,-47.144156,0> translate<-7.339400,-1.535000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.310900,0.000000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.377500,0.000000,-18.694400>}
box{<0,0,-0.203200><14.688400,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.310900,0.000000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.310900,-1.535000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.377500,-1.535000,-18.694400>}
box{<0,0,-0.203200><14.688400,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.310900,-1.535000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-7.166900,0.000000,-17.424300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.358000,0.000000,-17.424300>}
box{<0,0,-0.203200><4.808900,0.035000,0.203200> rotate<0,0.000000,0> translate<-7.166900,0.000000,-17.424300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.968100,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.903400,0.000000,4.064000>}
box{<0,0,-0.203200><1.064700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.968100,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.968100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.324300,-1.535000,4.064000>}
box{<0,0,-0.203200><5.643800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.968100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.959700,0.000000,-6.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.843500,0.000000,-6.529000>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<-6.959700,0.000000,-6.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.942500,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.735100,0.000000,-6.502400>}
box{<0,0,-0.203200><2.207400,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.942500,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.933900,0.000000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.103800,0.000000,-19.100800>}
box{<0,0,-0.203200><0.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.933900,0.000000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.933900,-1.535000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.103800,-1.535000,-19.100800>}
box{<0,0,-0.203200><0.830100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.933900,-1.535000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.843500,0.000000,-6.529000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.739200,0.000000,-6.589100>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<-6.843500,0.000000,-6.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.830800,0.000000,-8.173500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.739200,0.000000,-8.120800>}
box{<0,0,-0.203200><0.105678,0.035000,0.203200> rotate<0,-29.911028,0> translate<-6.830800,0.000000,-8.173500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.830800,0.000000,-8.173500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-8.238200>}
box{<0,0,-0.203200><0.169070,0.035000,0.203200> rotate<0,22.498465,0> translate<-6.830800,0.000000,-8.173500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.824300,0.000000,9.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,9.403700>}
box{<0,0,-0.203200><0.514494,0.035000,0.203200> rotate<0,47.131392,0> translate<-6.824300,0.000000,9.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.824300,-1.535000,9.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,9.403700>}
box{<0,0,-0.203200><0.514494,0.035000,0.203200> rotate<0,47.131392,0> translate<-6.824300,-1.535000,9.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.824300,0.000000,9.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.631600,0.000000,9.780800>}
box{<0,0,-0.203200><2.192700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.824300,0.000000,9.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.824300,-1.535000,9.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.789100,-1.535000,9.780800>}
box{<0,0,-0.203200><13.613400,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.824300,-1.535000,9.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.799000,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.658800,0.000000,9.753600>}
box{<0,0,-0.203200><2.140200,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.799000,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.799000,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770600,-1.535000,9.753600>}
box{<0,0,-0.203200><13.569600,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.799000,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.751800,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-8.128000>}
box{<0,0,-0.203200><2.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.751800,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.739200,0.000000,-8.120800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.654100,0.000000,-8.035700>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<-6.739200,0.000000,-8.120800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.739200,0.000000,-6.589100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.654100,0.000000,-6.674200>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<-6.739200,0.000000,-6.589100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.711400,0.000000,-19.340700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.462500,0.000000,-19.196900>}
box{<0,0,-0.203200><0.287454,0.035000,0.203200> rotate<0,-30.014852,0> translate<-6.711400,0.000000,-19.340700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.711400,-1.535000,-19.340700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.462500,-1.535000,-19.196900>}
box{<0,0,-0.203200><0.287454,0.035000,0.203200> rotate<0,-30.014852,0> translate<-6.711400,-1.535000,-19.340700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.705600,0.000000,-10.235400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.705600,0.000000,-10.084500>}
box{<0,0,-0.203200><0.150900,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.705600,0.000000,-10.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.705600,0.000000,-10.235400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-10.248200>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,22.434408,0> translate<-6.705600,0.000000,-10.235400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.705600,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-10.160000>}
box{<0,0,-0.203200><2.004900,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.705600,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.705600,0.000000,-10.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-10.071700>}
box{<0,0,-0.203200><0.033539,0.035000,0.203200> rotate<0,-22.434408,0> translate<-6.705600,0.000000,-10.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-10.248200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-10.419600>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-6.674600,0.000000,-10.248200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-10.071700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-9.900300>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-6.674600,0.000000,-10.071700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.674600,0.000000,-8.238200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-8.409600>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<-6.674600,0.000000,-8.238200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.657900,0.000000,-12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-12.219600>}
box{<0,0,-0.203200><0.218708,0.035000,0.203200> rotate<0,44.978507,0> translate<-6.657900,0.000000,-12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.657900,0.000000,-12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-11.910300>}
box{<0,0,-0.203200><0.218779,0.035000,0.203200> rotate<0,-44.997030,0> translate<-6.657900,0.000000,-12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.654100,0.000000,-8.035700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.594000,0.000000,-7.931400>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<-6.654100,0.000000,-8.035700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.654100,0.000000,-6.674200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.594000,0.000000,-6.778500>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<-6.654100,0.000000,-6.674200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.594000,0.000000,-7.931400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.815200>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<-6.594000,0.000000,-7.931400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.594000,0.000000,-6.778500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-6.894700>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<-6.594000,0.000000,-6.778500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.591100,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.497000,0.000000,4.470400>}
box{<0,0,-0.203200><1.094100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.591100,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.591100,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.617700,-1.535000,4.470400>}
box{<0,0,-0.203200><13.208800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.591100,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.355400>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.562800,0.000000,-7.355400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-7.721600>}
box{<0,0,-0.203200><1.862100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.562800,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.354400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-6.894700>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.562800,0.000000,-6.894700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-7.315200>}
box{<0,0,-0.203200><1.862100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.562800,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.562800,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-6.908800>}
box{<0,0,-0.203200><1.862100,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.562800,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.530800,0.000000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,0.000000,-12.192000>}
box{<0,0,-0.203200><1.163300,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.530800,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-12.219600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.442300,0.000000,-12.366800>}
box{<0,0,-0.203200><0.159301,0.035000,0.203200> rotate<0,67.519547,0> translate<-6.503200,0.000000,-12.219600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-11.910300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-11.686200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-6.503200,0.000000,-11.910300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-10.419600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-10.643700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-6.503200,0.000000,-10.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-9.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-9.676200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-6.503200,0.000000,-9.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.503200,0.000000,-8.409600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-8.633700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-6.503200,0.000000,-8.409600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,1.753300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.424900,0.000000,1.627800>}
box{<0,0,-0.203200><0.135846,0.035000,0.203200> rotate<0,67.489234,0> translate<-6.476900,0.000000,1.753300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,3.023300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,1.753300>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<-6.476900,0.000000,1.753300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,3.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,3.023300>}
box{<0,0,-0.203200><0.303300,0.035000,0.203200> rotate<0,-90.000000,0> translate<-6.476900,0.000000,3.023300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.476900,0.000000,3.326600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.360900,0.000000,3.606600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,-67.492017,0> translate<-6.476900,0.000000,3.326600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,4.596200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,4.596300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.474300,0.000000,4.596300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,4.596200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,4.596300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.474300,-1.535000,4.596300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,4.596300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,5.742200>}
box{<0,0,-0.203200><1.271881,0.035000,0.203200> rotate<0,-64.278889,0> translate<-6.474300,0.000000,4.596300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,4.596300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,5.742200>}
box{<0,0,-0.203200><1.271881,0.035000,0.203200> rotate<0,-64.278889,0> translate<-6.474300,-1.535000,4.596300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,9.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,9.403700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.474300,0.000000,9.403700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,9.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,9.403700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.474300,-1.535000,9.403700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,0.000000,9.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,8.257700>}
box{<0,0,-0.203200><1.271881,0.035000,0.203200> rotate<0,64.278889,0> translate<-6.474300,0.000000,9.403600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.474300,-1.535000,9.403600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,8.257700>}
box{<0,0,-0.203200><1.271881,0.035000,0.203200> rotate<0,64.278889,0> translate<-6.474300,-1.535000,9.403600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.462500,0.000000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.720100,0.000000,-18.998000>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-14.997175,0> translate<-6.462500,0.000000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.462500,-1.535000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.720100,-1.535000,-18.998000>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-14.997175,0> translate<-6.462500,-1.535000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.451600,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.205000,0.000000,-11.785600>}
box{<0,0,-0.203200><1.246600,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.451600,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.451500,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-8.534400>}
box{<0,0,-0.203200><1.750800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.451500,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.447100,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.065200,0.000000,9.347200>}
box{<0,0,-0.203200><1.381900,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.447100,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.447100,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.493500,-1.535000,9.347200>}
box{<0,0,-0.203200><12.940600,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.447100,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.442500,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-9.753600>}
box{<0,0,-0.203200><1.741800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.442500,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.442400,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-10.566400>}
box{<0,0,-0.203200><1.741700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.442400,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.442300,0.000000,-12.366800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,0.000000,-12.366800>}
box{<0,0,-0.203200><1.074800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.442300,0.000000,-12.366800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.441600,0.000000,1.620900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.424900,0.000000,1.627800>}
box{<0,0,-0.203200><0.018069,0.035000,0.203200> rotate<0,-22.447643,0> translate<-6.441600,0.000000,1.620900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-11.686200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-10.643700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.410400,0.000000,-10.643700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.876600,0.000000,-11.379200>}
box{<0,0,-0.203200><1.533800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.410400,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-10.972800>}
box{<0,0,-0.203200><1.709700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.410400,0.000000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-9.676200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-8.633700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,90.000000,0> translate<-6.410400,0.000000,-8.633700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-9.347200>}
box{<0,0,-0.203200><1.709700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.410400,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.410400,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-8.940800>}
box{<0,0,-0.203200><1.709700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.410400,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.360900,0.000000,3.606600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.412200,0.000000,4.555200>}
box{<0,0,-0.203200><1.341594,0.035000,0.203200> rotate<0,-44.994011,0> translate<-6.360900,0.000000,3.606600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.339300,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.633100,0.000000,4.876800>}
box{<0,0,-0.203200><0.706200,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.339300,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.339300,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.340600,-1.535000,4.876800>}
box{<0,0,-0.203200><12.679900,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.339300,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.251400,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.940800>}
box{<0,0,-0.203200><1.044500,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.251400,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.251400,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.216400,-1.535000,8.940800>}
box{<0,0,-0.203200><12.467800,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.251400,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.143500,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,5.283200>}
box{<0,0,-0.203200><0.489000,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.143500,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.143500,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.113800,-1.535000,5.283200>}
box{<0,0,-0.203200><12.257300,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.143500,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.055600,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.534400>}
box{<0,0,-0.203200><0.848700,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.055600,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-6.055600,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.057700,-1.535000,8.534400>}
box{<0,0,-0.203200><12.113300,0.035000,0.203200> rotate<0,0.000000,0> translate<-6.055600,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.947800,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,5.689600>}
box{<0,0,-0.203200><0.293300,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.947800,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.947800,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988500,-1.535000,5.689600>}
box{<0,0,-0.203200><11.936300,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.947800,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,5.742200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,5.742300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-5.922400,0.000000,5.742300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,5.742200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,5.742300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-5.922400,-1.535000,5.742300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,5.742300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.732800,0.000000,6.999900>}
box{<0,0,-0.203200><1.271812,0.035000,0.203200> rotate<0,-81.421091,0> translate<-5.922400,0.000000,5.742300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,5.742300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.732800,-1.535000,7.000000>}
box{<0,0,-0.203200><1.271911,0.035000,0.203200> rotate<0,-81.421762,0> translate<-5.922400,-1.535000,5.742300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,8.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,8.257700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-5.922400,0.000000,8.257700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,8.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,8.257700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-5.922400,-1.535000,8.257700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,0.000000,8.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.732800,0.000000,6.999900>}
box{<0,0,-0.203200><1.271911,0.035000,0.203200> rotate<0,81.421762,0> translate<-5.922400,0.000000,8.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.922400,-1.535000,8.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.732800,-1.535000,7.000000>}
box{<0,0,-0.203200><1.271812,0.035000,0.203200> rotate<0,81.421091,0> translate<-5.922400,-1.535000,8.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.902800,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.429000,0.000000,8.128000>}
box{<0,0,-0.203200><0.473800,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.902800,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.902800,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.932300,-1.535000,8.128000>}
box{<0,0,-0.203200><11.835100,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.902800,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.869100,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.602800,0.000000,6.096000>}
box{<0,0,-0.203200><0.266300,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.869100,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.869100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.863100,-1.535000,6.096000>}
box{<0,0,-0.203200><11.732200,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.869100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.841500,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,7.721600>}
box{<0,0,-0.203200><0.187000,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.841500,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.841500,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.807000,-1.535000,7.721600>}
box{<0,0,-0.203200><11.648500,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.841500,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.807900,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.559500,0.000000,6.502400>}
box{<0,0,-0.203200><0.248400,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.807900,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.807900,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.502400>}
box{<0,0,-0.203200><11.588400,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.807900,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.780300,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,7.315200>}
box{<0,0,-0.203200><0.125800,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.780300,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.780300,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,7.315200>}
box{<0,0,-0.203200><11.560800,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.780300,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.746600,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,6.908800>}
box{<0,0,-0.203200><0.092100,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.746600,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.746600,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.908800>}
box{<0,0,-0.203200><11.527100,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.746600,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.720100,0.000000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.951400,0.000000,-18.998000>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.720100,0.000000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.720100,-1.535000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.951400,-1.535000,-18.998000>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,0.000000,0> translate<-5.720100,-1.535000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,4.928700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,4.704600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-5.654500,0.000000,4.928700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,5.971200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,4.928700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.654500,0.000000,4.928700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,5.971200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,6.195300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-5.654500,0.000000,5.971200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,6.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,6.504600>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<-5.654500,0.000000,6.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,7.771200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,6.728700>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.654500,0.000000,6.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.654500,0.000000,7.771200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,7.995300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<-5.654500,0.000000,7.771200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,4.704600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.412200,0.000000,4.555200>}
box{<0,0,-0.203200><0.211354,0.035000,0.203200> rotate<0,44.977863,0> translate<-5.561700,0.000000,4.704600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,6.195300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.407000,0.000000,6.350000>}
box{<0,0,-0.203200><0.218779,0.035000,0.203200> rotate<0,-44.997030,0> translate<-5.561700,0.000000,6.195300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,6.504600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.407000,0.000000,6.350000>}
box{<0,0,-0.203200><0.218708,0.035000,0.203200> rotate<0,44.978507,0> translate<-5.561700,0.000000,6.504600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.561700,0.000000,7.995300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.390300,0.000000,8.166700>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<-5.561700,0.000000,7.995300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.390300,0.000000,8.166700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.242600>}
box{<0,0,-0.203200><0.198485,0.035000,0.203200> rotate<0,-22.480710,0> translate<-5.390300,0.000000,8.166700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-14.384600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,67.495875,0> translate<-5.367500,-1.535000,-14.384600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-12.177700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-14.384600>}
box{<0,0,-0.203200><2.206900,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.367500,-1.535000,-14.384600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,0.000000,-12.177700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,0.000000,-12.366800>}
box{<0,0,-0.203200><0.189100,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.367500,0.000000,-12.366800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,0.000000,-12.177700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,0.000000,-11.652600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-67.495875,0> translate<-5.367500,0.000000,-12.177700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.367500,-1.535000,-12.177700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-67.495875,0> translate<-5.367500,-1.535000,-12.177700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.738300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.242600>}
box{<0,0,-0.203200><0.495700,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.206900,0.000000,8.242600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,9.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,8.738300>}
box{<0,0,-0.203200><0.303300,0.035000,0.203200> rotate<0,-90.000000,0> translate<-5.206900,0.000000,8.738300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.206900,0.000000,9.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.090900,0.000000,9.321600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,-67.492017,0> translate<-5.206900,0.000000,9.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<-5.150000,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,0.000000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,0.000000,-11.250700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<-5.150000,0.000000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.150000,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<-5.150000,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-5.090900,0.000000,9.321600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.631600,0.000000,9.780800>}
box{<0,0,-0.203200><0.649478,0.035000,0.203200> rotate<0,-44.990793,0> translate<-5.090900,0.000000,9.321600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.953000,0.000000,-2.859300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.953000,0.000000,-2.617500>}
box{<0,0,-0.203200><0.241800,0.035000,0.203200> rotate<0,90.000000,0> translate<-4.953000,0.000000,-2.617500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.953000,0.000000,-2.859300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.752800,0.000000,-7.059500>}
box{<0,0,-0.203200><5.939980,0.035000,0.203200> rotate<0,44.997030,0> translate<-4.953000,0.000000,-2.859300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.953000,0.000000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.816700,0.000000,-2.844800>}
box{<0,0,-0.203200><0.136300,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.953000,0.000000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.953000,0.000000,-2.617500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.935900,0.000000,-2.681400>}
box{<0,0,-0.203200><0.066148,0.035000,0.203200> rotate<0,75.013417,0> translate<-4.953000,0.000000,-2.617500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.951400,0.000000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,0.000000,-19.196900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,14.997175,0> translate<-4.951400,0.000000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.951400,-1.535000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,-1.535000,-19.196900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,14.997175,0> translate<-4.951400,-1.535000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.935900,0.000000,-2.681400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.875800,0.000000,-2.785700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<-4.935900,0.000000,-2.681400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.875800,0.000000,-2.785700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.790700,0.000000,-2.870800>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<-4.875800,0.000000,-2.785700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.790700,0.000000,-2.870800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.686400,0.000000,-2.930900>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<-4.790700,0.000000,-2.870800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.223000,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<-4.748100,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,0.000000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-11.231100>}
box{<0,0,-0.203200><0.051292,0.035000,0.203200> rotate<0,-22.463715,0> translate<-4.748100,0.000000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.748100,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.223000,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<-4.748100,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-6.536800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.700700,0.000000,-11.231100>}
box{<0,0,-0.203200><4.694300,0.035000,0.203200> rotate<0,-90.000000,0> translate<-4.700700,0.000000,-11.231100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.686400,0.000000,-2.930900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.570200,0.000000,-2.962100>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<-4.686400,0.000000,-2.930900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.685700,0.000000,-24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,0.000000,-24.637400>}
box{<0,0,-0.203200><0.493482,0.035000,0.203200> rotate<0,-14.984277,0> translate<-4.685700,0.000000,-24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.685700,0.000000,-24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.428100,0.000000,-24.765000>}
box{<0,0,-0.203200><9.113800,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.685700,0.000000,-24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.685600,-1.535000,-24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,-1.535000,-24.637400>}
box{<0,0,-0.203200><0.493386,0.035000,0.203200> rotate<0,-14.987279,0> translate<-4.685600,-1.535000,-24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.685600,-1.535000,-24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.428000,-1.535000,-24.765000>}
box{<0,0,-0.203200><9.113600,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.685600,-1.535000,-24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.570200,0.000000,-2.962100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.962100>}
box{<0,0,-0.203200><0.774800,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.570200,0.000000,-2.962100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.567600,0.000000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.310100,0.000000,-19.100800>}
box{<0,0,-0.203200><8.877700,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.567600,0.000000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.567600,-1.535000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.310100,-1.535000,-19.100800>}
box{<0,0,-0.203200><8.877700,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.567600,-1.535000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.561100,0.000000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.785100,0.000000,-3.251200>}
box{<0,0,-0.203200><1.776000,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.561100,0.000000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,-0.561900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.977400,-1.535000,-1.647500>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,74.994343,0> translate<-4.268300,-1.535000,-0.561900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,0.561900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,-0.561900>}
box{<0,0,-0.203200><1.123800,0.035000,0.203200> rotate<0,-90.000000,0> translate<-4.268300,-1.535000,-0.561900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.268300,-1.535000,0.561900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.977400,-1.535000,1.647500>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,-74.994343,0> translate<-4.268300,-1.535000,0.561900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.223000,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.654500,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.223000,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.223000,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.654500,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.223000,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,0.000000,-24.637400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,0.000000,-24.253100>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-29.995304,0> translate<-4.209000,0.000000,-24.637400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,-1.535000,-24.637400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,-1.535000,-24.253100>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-29.995304,0> translate<-4.209000,-1.535000,-24.637400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,0.000000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,0.000000,-19.581200>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,29.995304,0> translate<-4.209000,0.000000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.209000,-1.535000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,-1.535000,-19.581200>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,29.995304,0> translate<-4.209000,-1.535000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-4.154700,0.000000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.201500,0.000000,-3.657600>}
box{<0,0,-0.203200><1.953200,0.035000,0.203200> rotate<0,0.000000,0> translate<-4.154700,0.000000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.977400,-1.535000,-1.647500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.415500,-1.535000,-2.620800>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,59.997586,0> translate<-3.977400,-1.535000,-1.647500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.977400,-1.535000,1.647500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.415500,-1.535000,2.620800>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,-59.997586,0> translate<-3.977400,-1.535000,1.647500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.962100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.276000>}
box{<0,0,-0.203200><0.686100,0.035000,0.203200> rotate<0,90.000000,0> translate<-3.795400,0.000000,-2.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.844800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.795400,0.000000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.438400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.795400,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.795400,0.000000,-2.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.276000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.795400,0.000000,-2.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.962100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.074200,0.000000,-2.962100>}
box{<0,0,-0.203200><0.720200,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.794400,0.000000,-2.962100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.794400,0.000000,-2.962100>}
box{<0,0,-0.203200><0.686100,0.035000,0.203200> rotate<0,-90.000000,0> translate<-3.794400,0.000000,-2.962100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.770100,0.000000,-24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.512400,0.000000,-24.384000>}
box{<0,0,-0.203200><7.282500,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.770100,0.000000,-24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.770100,-1.535000,-24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.512400,-1.535000,-24.384000>}
box{<0,0,-0.203200><7.282500,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.770100,-1.535000,-24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.748300,0.000000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.324400,0.000000,-4.064000>}
box{<0,0,-0.203200><2.423900,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.748300,0.000000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.671400,0.000000,-19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.413900,0.000000,-19.507200>}
box{<0,0,-0.203200><7.085300,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.671400,0.000000,-19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.671400,-1.535000,-19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.413900,-1.535000,-19.507200>}
box{<0,0,-0.203200><7.085300,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.671400,-1.535000,-19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.654500,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.129400,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<-3.654500,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.654500,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.129400,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<-3.654500,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,0.000000,-24.253100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,0.000000,-23.709600>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,-44.997030,0> translate<-3.543300,0.000000,-24.253100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,-1.535000,-24.253100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,-1.535000,-23.709600>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,-44.997030,0> translate<-3.543300,-1.535000,-24.253100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,0.000000,-19.581200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,0.000000,-20.124700>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.543300,0.000000,-19.581200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.543300,-1.535000,-19.581200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,-1.535000,-20.124700>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.543300,-1.535000,-19.581200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.447200,-1.535000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.890400,-1.535000,-15.443200>}
box{<0,0,-0.203200><1.556800,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.447200,-1.535000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.415500,-1.535000,-2.620800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,-1.535000,-3.415500>}
box{<0,0,-0.203200><1.123876,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.415500,-1.535000,-2.620800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.415500,-1.535000,2.620800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,-1.535000,3.415500>}
box{<0,0,-0.203200><1.123876,0.035000,0.203200> rotate<0,-44.997030,0> translate<-3.415500,-1.535000,2.620800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.341900,0.000000,-4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.786900,0.000000,-4.470400>}
box{<0,0,-0.203200><11.128800,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.341900,0.000000,-4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.267800,0.000000,-23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.010200,0.000000,-23.977600>}
box{<0,0,-0.203200><6.278000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.267800,0.000000,-23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.267800,-1.535000,-23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.010200,-1.535000,-23.977600>}
box{<0,0,-0.203200><6.278000,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.267800,-1.535000,-23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.210900,0.000000,-19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.953300,0.000000,-19.913600>}
box{<0,0,-0.203200><6.164200,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.210900,0.000000,-19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.210900,-1.535000,-19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.953300,-1.535000,-19.913600>}
box{<0,0,-0.203200><6.164200,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.210900,-1.535000,-19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.129400,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.727500,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<-3.129400,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.129400,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.727500,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.129400,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.074200,0.000000,-2.962100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,0.000000,-3.415500>}
box{<0,0,-0.203200><0.641204,0.035000,0.203200> rotate<0,44.997030,0> translate<-3.074200,0.000000,-2.962100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-3.000900,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.336600,-1.535000,-11.379200>}
box{<0,0,-0.203200><0.664300,0.035000,0.203200> rotate<0,0.000000,0> translate<-3.000900,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,0.000000,-23.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,0.000000,-23.043900>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-59.998756,0> translate<-2.999800,0.000000,-23.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,-1.535000,-23.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,-1.535000,-23.043900>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-59.998756,0> translate<-2.999800,-1.535000,-23.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,0.000000,-20.124700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,0.000000,-20.790400>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,59.998756,0> translate<-2.999800,0.000000,-20.124700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.999800,-1.535000,-20.124700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,-1.535000,-20.790400>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,59.998756,0> translate<-2.999800,-1.535000,-20.124700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.935500,0.000000,-4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.380500,0.000000,-4.876800>}
box{<0,0,-0.203200><10.316000,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.935500,0.000000,-4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.920000,0.000000,-23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.662300,0.000000,-23.571200>}
box{<0,0,-0.203200><5.582300,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.920000,0.000000,-23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.920000,-1.535000,-23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.662300,-1.535000,-23.571200>}
box{<0,0,-0.203200><5.582300,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.920000,-1.535000,-23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.887000,0.000000,-20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.629500,0.000000,-20.320000>}
box{<0,0,-0.203200><5.516500,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.887000,0.000000,-20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.887000,-1.535000,-20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.629500,-1.535000,-20.320000>}
box{<0,0,-0.203200><5.516500,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.887000,-1.535000,-20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.854600,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.482900,-1.535000,-15.036800>}
box{<0,0,-0.203200><0.371700,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.854600,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.727500,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.668700,-1.535000,-14.767700>}
box{<0,0,-0.203200><0.153693,0.035000,0.203200> rotate<0,-67.501857,0> translate<-2.727500,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.727500,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.668700,-1.535000,-11.794600>}
box{<0,0,-0.203200><0.153693,0.035000,0.203200> rotate<0,67.501857,0> translate<-2.727500,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.685300,0.000000,-23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.427600,0.000000,-23.164800>}
box{<0,0,-0.203200><5.112900,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.685300,0.000000,-23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.685300,-1.535000,-23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.427600,-1.535000,-23.164800>}
box{<0,0,-0.203200><5.112900,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.685300,-1.535000,-23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.672400,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.664900,-1.535000,-11.785600>}
box{<0,0,-0.203200><0.007500,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.672400,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.668700,-1.535000,-14.767700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.610000,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.153654,0.035000,0.203200> rotate<0,67.536306,0> translate<-2.668700,-1.535000,-14.767700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.668700,-1.535000,-11.794600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.610000,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.153654,0.035000,0.203200> rotate<0,-67.536306,0> translate<-2.668700,-1.535000,-11.794600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.652400,0.000000,-20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.394900,0.000000,-20.726400>}
box{<0,0,-0.203200><5.047300,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.652400,0.000000,-20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.652400,-1.535000,-20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.394900,-1.535000,-20.726400>}
box{<0,0,-0.203200><5.047300,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.652400,-1.535000,-20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,0.000000,-3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,0.000000,-3.977400>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,29.996474,0> translate<-2.620800,0.000000,-3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,-1.535000,-3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,-1.535000,-3.977400>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,29.996474,0> translate<-2.620800,-1.535000,-3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.620800,-1.535000,3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,-1.535000,3.977400>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,-29.996474,0> translate<-2.620800,-1.535000,3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,0.000000,-23.043900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-22.301500>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-74.996885,0> translate<-2.615500,0.000000,-23.043900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,-1.535000,-23.043900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-22.301500>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-74.996885,0> translate<-2.615500,-1.535000,-23.043900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,0.000000,-20.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-21.532800>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,74.996885,0> translate<-2.615500,0.000000,-20.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.615500,-1.535000,-20.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-21.532800>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,74.996885,0> translate<-2.615500,-1.535000,-20.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.610000,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.208100,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<-2.610000,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.610000,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.208100,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<-2.610000,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.539100,0.000000,-22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.281400,0.000000,-22.758400>}
box{<0,0,-0.203200><4.820500,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.539100,0.000000,-22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.539100,-1.535000,-22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.281400,-1.535000,-22.758400>}
box{<0,0,-0.203200><4.820500,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.539100,-1.535000,-22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.529100,0.000000,-5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.974100,0.000000,-5.283200>}
box{<0,0,-0.203200><9.503200,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.529100,0.000000,-5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.523700,0.000000,-21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.266200,0.000000,-21.132800>}
box{<0,0,-0.203200><4.789900,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.523700,0.000000,-21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.523700,-1.535000,-21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.266200,-1.535000,-21.132800>}
box{<0,0,-0.203200><4.789900,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.523700,-1.535000,-21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.430200,0.000000,-22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.172500,0.000000,-22.352000>}
box{<0,0,-0.203200><4.602700,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.430200,0.000000,-22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.430200,-1.535000,-22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.172500,-1.535000,-22.352000>}
box{<0,0,-0.203200><4.602700,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.430200,-1.535000,-22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-22.301500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-21.532800>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,90.000000,0> translate<-2.416600,0.000000,-21.532800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-22.301500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-21.532800>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,90.000000,0> translate<-2.416600,-1.535000,-21.532800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-21.945600>}
box{<0,0,-0.203200><4.575600,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.416600,0.000000,-21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-21.945600>}
box{<0,0,-0.203200><4.575600,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.416600,-1.535000,-21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,0.000000,-21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-21.539200>}
box{<0,0,-0.203200><4.575600,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.416600,0.000000,-21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.416600,-1.535000,-21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-21.539200>}
box{<0,0,-0.203200><4.575600,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.416600,-1.535000,-21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.358000,0.000000,-17.424300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.022000,0.000000,-17.285100>}
box{<0,0,-0.203200><0.363693,0.035000,0.203200> rotate<0,-22.502043,0> translate<-2.358000,0.000000,-17.424300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.208100,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.683000,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<-2.208100,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.208100,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.683000,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<-2.208100,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.122700,0.000000,-5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.567700,0.000000,-5.689600>}
box{<0,0,-0.203200><8.690400,0.035000,0.203200> rotate<0,0.000000,0> translate<-2.122700,0.000000,-5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-2.022000,0.000000,-17.285100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.764800,0.000000,-17.027900>}
box{<0,0,-0.203200><0.363736,0.035000,0.203200> rotate<0,-44.997030,0> translate<-2.022000,0.000000,-17.285100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.805700,0.000000,-17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-17.068800>}
box{<0,0,-0.203200><14.537700,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.805700,0.000000,-17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.764800,0.000000,-17.027900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.764800,0.000000,-17.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<-1.764800,0.000000,-17.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.764800,0.000000,-17.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.623600,0.000000,-15.886700>}
box{<0,0,-0.203200><1.613830,0.035000,0.203200> rotate<0,-44.994520,0> translate<-1.764800,0.000000,-17.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.716300,0.000000,-6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.161300,0.000000,-6.096000>}
box{<0,0,-0.203200><7.877600,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.716300,0.000000,-6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.683000,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.114500,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.683000,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.683000,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.114500,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.683000,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,0.000000,-3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,0.000000,-4.268300>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,14.999717,0> translate<-1.647500,0.000000,-3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,-1.535000,-3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,-1.535000,-4.268300>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,14.999717,0> translate<-1.647500,-1.535000,-3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.647500,-1.535000,3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,-1.535000,4.268300>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,-14.999717,0> translate<-1.647500,-1.535000,3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.399400,0.000000,-16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-16.662400>}
box{<0,0,-0.203200><14.131400,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.399400,0.000000,-16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.309900,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.593800,0.000000,-6.502400>}
box{<0,0,-0.203200><3.903700,0.035000,0.203200> rotate<0,0.000000,0> translate<-1.309900,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.114500,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<-1.114500,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-1.114500,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<-1.114500,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.993000,0.000000,-16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-16.256000>}
box{<0,0,-0.203200><13.725000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.993000,0.000000,-16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.907200,-1.535000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.189500,-1.535000,-15.443200>}
box{<0,0,-0.203200><4.096700,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.907200,-1.535000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.903500,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.713500,0.000000,-6.908800>}
box{<0,0,-0.203200><1.617000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.903500,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.752800,0.000000,-7.059500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-7.339500>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,67.492017,0> translate<-0.752800,0.000000,-7.059500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.646800,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-7.315200>}
box{<0,0,-0.203200><1.353400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.646800,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-11.231100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-7.642800>}
box{<0,0,-0.203200><3.588300,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.636800,0.000000,-7.642800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-11.231100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,0.000000,-11.250700>}
box{<0,0,-0.203200><0.051292,0.035000,0.203200> rotate<0,22.463715,0> translate<-0.636800,0.000000,-11.231100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.868400,0.000000,-10.972800>}
box{<0,0,-0.203200><3.505200,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.788000,0.000000,-10.566400>}
box{<0,0,-0.203200><1.424800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-10.160000>}
box{<0,0,-0.203200><1.343400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.753600>}
box{<0,0,-0.203200><1.343400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.347200>}
box{<0,0,-0.203200><1.343400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.734000,0.000000,-8.940800>}
box{<0,0,-0.203200><1.370800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.857000,0.000000,-8.534400>}
box{<0,0,-0.203200><1.493800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-8.128000>}
box{<0,0,-0.203200><1.343400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-7.721600>}
box{<0,0,-0.203200><1.343400,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.636800,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-7.642800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.636800,0.000000,-7.339500>}
box{<0,0,-0.203200><0.303300,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.636800,0.000000,-7.339500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.623600,0.000000,-15.886700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.484400,0.000000,-15.550700>}
box{<0,0,-0.203200><0.363693,0.035000,0.203200> rotate<0,-67.492017,0> translate<-0.623600,0.000000,-15.886700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.608300,0.000000,-15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-15.849600>}
box{<0,0,-0.203200><13.340300,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.608300,0.000000,-15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<-0.589400,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,0.000000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,0.000000,-11.652600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<-0.589400,0.000000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.589400,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<-0.589400,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,0.000000,-4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,0.000000,-4.268300>}
box{<0,0,-0.203200><1.123800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.561900,0.000000,-4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,-1.535000,-4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,-1.535000,-4.268300>}
box{<0,0,-0.203200><1.123800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.561900,-1.535000,-4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.561900,-1.535000,4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,-1.535000,4.268300>}
box{<0,0,-0.203200><1.123800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.561900,-1.535000,4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.484400,0.000000,-15.550700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.484400,0.000000,-15.206600>}
box{<0,0,-0.203200><0.344100,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.484400,0.000000,-15.206600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.484400,0.000000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.189500,0.000000,-15.443200>}
box{<0,0,-0.203200><3.673900,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.484400,0.000000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.484400,0.000000,-15.206600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,0.000000,-14.909700>}
box{<0,0,-0.203200><0.419880,0.035000,0.203200> rotate<0,-44.997030,0> translate<-0.484400,0.000000,-15.206600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.460900,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.460000,0.000000,-11.379200>}
box{<0,0,-0.203200><0.920900,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.460900,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.460900,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.460000,-1.535000,-11.379200>}
box{<0,0,-0.203200><0.920900,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.460900,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.314600,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.272500,0.000000,-15.036800>}
box{<0,0,-0.203200><0.587100,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.314600,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.314600,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.272500,-1.535000,-15.036800>}
box{<0,0,-0.203200><0.587100,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.314600,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,-1.535000,-14.571800>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,-67.504629,0> translate<-0.187500,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,0.000000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,0.000000,-14.571700>}
box{<0,0,-0.203200><0.365809,0.035000,0.203200> rotate<0,-67.510620,0> translate<-0.187500,0.000000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,0.000000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,0.000000,-11.990500>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,67.504629,0> translate<-0.187500,0.000000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.187500,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,-1.535000,-11.990500>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,67.504629,0> translate<-0.187500,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.132400,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.054900,0.000000,-11.785600>}
box{<0,0,-0.203200><0.187300,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.132400,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.132400,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.054900,-1.535000,-11.785600>}
box{<0,0,-0.203200><0.187300,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.132400,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.071900,0.000000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.021200,0.000000,-14.630400>}
box{<0,0,-0.203200><0.050700,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.071900,0.000000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.071900,-1.535000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.021200,-1.535000,-14.630400>}
box{<0,0,-0.203200><0.050700,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.071900,-1.535000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,-1.535000,-14.571800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,-1.535000,-14.590300>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,72.026107,0> translate<-0.047600,-1.535000,-14.571800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,0.000000,-14.571700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,0.000000,-14.590300>}
box{<0,0,-0.203200><0.019544,0.035000,0.203200> rotate<0,72.116544,0> translate<-0.047600,0.000000,-14.571700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,0.000000,-11.990500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,0.000000,-11.972000>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,-72.026107,0> translate<-0.047600,0.000000,-11.990500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.047600,-1.535000,-11.990500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,-1.535000,-11.972000>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,-72.026107,0> translate<-0.047600,-1.535000,-11.990500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,0.000000,-14.590300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,0.000000,-14.769300>}
box{<0,0,-0.203200><0.200849,0.035000,0.203200> rotate<0,63.022543,0> translate<-0.041600,0.000000,-14.590300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,-1.535000,-14.590300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,-1.535000,-14.769300>}
box{<0,0,-0.203200><0.200849,0.035000,0.203200> rotate<0,63.022543,0> translate<-0.041600,-1.535000,-14.590300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,0.000000,-11.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,0.000000,-11.793000>}
box{<0,0,-0.203200><0.200849,0.035000,0.203200> rotate<0,-63.022543,0> translate<-0.041600,0.000000,-11.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.041600,-1.535000,-11.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,-1.535000,-11.793000>}
box{<0,0,-0.203200><0.200849,0.035000,0.203200> rotate<0,-63.022543,0> translate<-0.041600,-1.535000,-11.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,0.000000,-14.769300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,0.000000,-14.931900>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,54.004697,0> translate<0.049500,0.000000,-14.769300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,-1.535000,-14.769300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,-1.535000,-14.931900>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,54.004697,0> translate<0.049500,-1.535000,-14.769300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,0.000000,-11.793000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,0.000000,-11.630400>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-54.004697,0> translate<0.049500,0.000000,-11.793000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.049500,-1.535000,-11.793000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,-1.535000,-11.630400>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-54.004697,0> translate<0.049500,-1.535000,-11.793000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,0.000000,-14.931900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,0.000000,-15.073900>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,44.997030,0> translate<0.167600,0.000000,-14.931900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,-1.535000,-14.931900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,-1.535000,-15.073900>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,44.997030,0> translate<0.167600,-1.535000,-14.931900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,0.000000,-11.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,0.000000,-11.488400>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.167600,0.000000,-11.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.167600,-1.535000,-11.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,-1.535000,-11.488400>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.167600,-1.535000,-11.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,0.000000,-15.073900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,0.000000,-15.192000>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,35.989364,0> translate<0.309600,0.000000,-15.073900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,-1.535000,-15.073900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,-1.535000,-15.192000>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,35.989364,0> translate<0.309600,-1.535000,-15.073900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,0.000000,-11.488400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,0.000000,-11.370300>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-35.989364,0> translate<0.309600,0.000000,-11.488400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.309600,-1.535000,-11.488400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,-1.535000,-11.370300>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-35.989364,0> translate<0.309600,-1.535000,-11.488400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,0.000000,-15.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,0.000000,-15.283200>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,26.996934,0> translate<0.472200,0.000000,-15.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,-1.535000,-15.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,-1.535000,-15.283200>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,26.996934,0> translate<0.472200,-1.535000,-15.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,0.000000,-11.370300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,0.000000,-11.279100>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-26.996934,0> translate<0.472200,0.000000,-11.370300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.472200,-1.535000,-11.370300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,-1.535000,-11.279100>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-26.996934,0> translate<0.472200,-1.535000,-11.370300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,0.000000,-4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,0.000000,-3.977400>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,-14.999717,0> translate<0.561900,0.000000,-4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,-1.535000,-4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,-1.535000,-3.977400>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,-14.999717,0> translate<0.561900,-1.535000,-4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.561900,-1.535000,4.268300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,-1.535000,3.977400>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,14.999717,0> translate<0.561900,-1.535000,4.268300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,0.000000,-15.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,0.000000,-15.345300>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,18.009756,0> translate<0.651200,0.000000,-15.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,-1.535000,-15.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,-1.535000,-15.345300>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,18.009756,0> translate<0.651200,-1.535000,-15.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,0.000000,-11.279100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,0.000000,-11.217000>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,-18.009756,0> translate<0.651200,0.000000,-11.279100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.651200,-1.535000,-11.279100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,-1.535000,-11.217000>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,-18.009756,0> translate<0.651200,-1.535000,-11.279100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706500,0.000000,-9.702200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.042500>}
box{<0,0,-0.203200><0.659700,0.035000,0.203200> rotate<0,-89.985376,0> translate<0.706500,0.000000,-9.702200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706500,0.000000,-9.702200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-9.702200>}
box{<0,0,-0.203200><0.856200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.706500,0.000000,-9.702200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706500,0.000000,-7.594000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-6.934300>}
box{<0,0,-0.203200><0.659700,0.035000,0.203200> rotate<0,-89.985376,0> translate<0.706500,0.000000,-7.594000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706500,0.000000,-7.594000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-7.594000>}
box{<0,0,-0.203200><0.856200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.706500,0.000000,-7.594000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-10.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-10.479200>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<0.706600,0.000000,-10.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.703200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-10.363000>}
box{<0,0,-0.203200><0.659800,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.706600,0.000000,-10.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.703200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-9.703200>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.706600,0.000000,-9.703200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-9.042500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-8.926300>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<0.706600,0.000000,-9.042500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-8.254800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-8.371000>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<0.706600,0.000000,-8.254800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-7.595000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-8.254800>}
box{<0,0,-0.203200><0.659800,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.706600,0.000000,-8.254800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-7.595000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-7.595000>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.706600,0.000000,-7.595000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.706600,0.000000,-6.934300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-6.818100>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<0.706600,0.000000,-6.934300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-10.479200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-10.583500>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<0.737800,0.000000,-10.479200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-8.926300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-8.822000>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<0.737800,0.000000,-8.926300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-8.371000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-8.475300>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<0.737800,0.000000,-8.371000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.737800,0.000000,-6.818100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-6.713800>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<0.737800,0.000000,-6.818100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-10.583500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-10.668600>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<0.797900,0.000000,-10.583500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-8.822000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-8.736900>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.797900,0.000000,-8.822000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-8.475300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-8.560400>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<0.797900,0.000000,-8.475300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.797900,0.000000,-6.713800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-6.628700>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.797900,0.000000,-6.713800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,0.000000,-15.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,0.000000,-15.376700>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,8.988337,0> translate<0.842200,0.000000,-15.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,-1.535000,-15.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,-1.535000,-15.376700>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,8.988337,0> translate<0.842200,-1.535000,-15.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,0.000000,-11.217000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,0.000000,-11.185600>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,-8.988337,0> translate<0.842200,0.000000,-11.217000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.842200,-1.535000,-11.217000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,-1.535000,-11.185600>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,-8.988337,0> translate<0.842200,-1.535000,-11.217000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-10.668600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-10.728700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<0.883000,0.000000,-10.668600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-8.736900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-8.676800>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<0.883000,0.000000,-8.736900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-8.560400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-8.620500>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<0.883000,0.000000,-8.560400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.883000,0.000000,-6.628700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-6.568600>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<0.883000,0.000000,-6.628700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-10.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.103500,0.000000,-10.759900>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<0.987300,0.000000,-10.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-8.676800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.092300,0.000000,-8.648600>}
box{<0,0,-0.203200><0.108721,0.035000,0.203200> rotate<0,-15.032266,0> translate<0.987300,0.000000,-8.676800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-8.620500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.092300,0.000000,-8.648600>}
box{<0,0,-0.203200><0.108695,0.035000,0.203200> rotate<0,14.981361,0> translate<0.987300,0.000000,-8.620500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.987300,0.000000,-6.568600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.103500,0.000000,-6.537400>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-15.028587,0> translate<0.987300,0.000000,-6.568600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,0.000000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-15.376700>}
box{<0,0,-0.203200><0.030500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.040700,0.000000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,-1.535000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-15.376700>}
box{<0,0,-0.203200><0.030500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.040700,-1.535000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,0.000000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-11.185600>}
box{<0,0,-0.203200><0.030500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.040700,0.000000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.040700,-1.535000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-11.185600>}
box{<0,0,-0.203200><0.030500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.040700,-1.535000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.351600>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.071200,0.000000,-13.351600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.351600>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.071200,-1.535000,-13.351600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-15.036800>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-15.036800>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-14.630400>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-14.630400>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-14.224000>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-14.224000>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.817600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.817600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.411200>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.411200>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.351600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.351600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-13.351600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.351600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.351600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-13.351600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.210700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-11.185600>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.071200,0.000000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.210700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-11.185600>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.071200,-1.535000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.210700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.210700>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-13.210700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.210700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.210700>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-13.210700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.004800>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.004800>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-12.598400>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-12.598400>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-12.192000>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-12.192000>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-11.785600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-11.785600>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-11.379200>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.071200,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-11.379200>}
box{<0,0,-0.203200><0.139800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.071200,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.103500,0.000000,-10.759900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-10.759900>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.103500,0.000000,-10.759900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.103500,0.000000,-6.537400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-6.537400>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.103500,0.000000,-6.537400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,0.000000,-15.376700>}
box{<0,0,-0.203200><0.030600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.211000,0.000000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,-1.535000,-15.376700>}
box{<0,0,-0.203200><0.030600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.211000,-1.535000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.351600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-15.376700>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.211000,0.000000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.351600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-15.376700>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.211000,-1.535000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-13.210700>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.211000,0.000000,-13.210700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-13.210700>}
box{<0,0,-0.203200><2.025100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.211000,-1.535000,-13.210700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,0.000000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,0.000000,-11.185600>}
box{<0,0,-0.203200><0.030600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.211000,0.000000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.211000,-1.535000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,-1.535000,-11.185600>}
box{<0,0,-0.203200><0.030600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.211000,-1.535000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,0.000000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,0.000000,-15.345300>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,-8.988337,0> translate<1.241600,0.000000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,-1.535000,-15.376700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,-1.535000,-15.345300>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,-8.988337,0> translate<1.241600,-1.535000,-15.376700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,0.000000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,0.000000,-11.217000>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,8.988337,0> translate<1.241600,0.000000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.241600,-1.535000,-11.185600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,-1.535000,-11.217000>}
box{<0,0,-0.203200><0.200968,0.035000,0.203200> rotate<0,8.988337,0> translate<1.241600,-1.535000,-11.185600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.324300,0.000000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.193300,0.000000,-4.064000>}
box{<0,0,-0.203200><6.869000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.324300,0.000000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.324300,-1.535000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-4.064000>}
box{<0,0,-0.203200><11.407700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.324300,-1.535000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.324400,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.914000,-1.535000,4.064000>}
box{<0,0,-0.203200><5.589600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.324400,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,0.000000,-15.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,0.000000,-15.283200>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,-18.009756,0> translate<1.440100,0.000000,-15.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,-1.535000,-15.345300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,-1.535000,-15.283200>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,-18.009756,0> translate<1.440100,-1.535000,-15.345300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,0.000000,-11.217000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,0.000000,-11.279100>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,18.009756,0> translate<1.440100,0.000000,-11.217000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.440100,-1.535000,-11.217000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,-1.535000,-11.279100>}
box{<0,0,-0.203200><0.200842,0.035000,0.203200> rotate<0,18.009756,0> translate<1.440100,-1.535000,-11.217000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-9.702200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-9.703200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.562700,0.000000,-9.703200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-7.594000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.562700,0.000000,-7.595000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.562700,0.000000,-7.595000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-10.759900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.703800>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.563200,0.000000,-9.703800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-10.566400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-10.160000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.753600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.703800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.703800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-9.703800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.701700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-8.645600>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.563200,0.000000,-8.645600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.701700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.701700>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-9.701700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.347200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-8.940800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-8.645600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.595600>}
box{<0,0,-0.203200><1.050000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.563200,0.000000,-7.595600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-8.534400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-8.128000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.721600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.595600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-7.595600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.593500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-6.537400>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,90.000000,0> translate<1.563200,0.000000,-6.537400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.593500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.593500>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-7.593500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.315200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.563200,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-6.908800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.563200,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-10.759900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.024000,0.000000,-10.759900>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.564200,0.000000,-10.759900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.703800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-10.759900>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.564200,0.000000,-10.759900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-8.645600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-9.701700>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.564200,0.000000,-9.701700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.595600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-8.645600>}
box{<0,0,-0.203200><1.050000,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.564200,0.000000,-8.645600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-6.537400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-7.593500>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.564200,0.000000,-7.593500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.564200,0.000000,-6.537400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.024000,0.000000,-6.537400>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,0.000000,0> translate<1.564200,0.000000,-6.537400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,0.000000,-15.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,0.000000,-15.192000>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-26.996934,0> translate<1.631100,0.000000,-15.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,-1.535000,-15.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,-1.535000,-15.192000>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-26.996934,0> translate<1.631100,-1.535000,-15.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,0.000000,-11.279100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,0.000000,-11.370300>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,26.996934,0> translate<1.631100,0.000000,-11.279100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.631100,-1.535000,-11.279100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,-1.535000,-11.370300>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,26.996934,0> translate<1.631100,-1.535000,-11.279100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,0.000000,-3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,0.000000,-3.415500>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,-29.996474,0> translate<1.647500,0.000000,-3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,-1.535000,-3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,-1.535000,-3.415500>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,-29.996474,0> translate<1.647500,-1.535000,-3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.647500,-1.535000,3.977400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,-1.535000,3.415500>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,29.996474,0> translate<1.647500,-1.535000,3.977400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,0.000000,-15.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,0.000000,-15.073900>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-35.989364,0> translate<1.810100,0.000000,-15.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,-1.535000,-15.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,-1.535000,-15.073900>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-35.989364,0> translate<1.810100,-1.535000,-15.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,0.000000,-11.370300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,0.000000,-11.488400>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,35.989364,0> translate<1.810100,0.000000,-11.370300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.810100,-1.535000,-11.370300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,-1.535000,-11.488400>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,35.989364,0> translate<1.810100,-1.535000,-11.370300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.822400,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743300,-1.535000,-11.379200>}
box{<0,0,-0.203200><0.920900,0.035000,0.203200> rotate<0,0.000000,0> translate<1.822400,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.822400,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743400,0.000000,-11.379200>}
box{<0,0,-0.203200><0.921000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.822400,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,0.000000,-15.073900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,0.000000,-14.931900>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.972700,0.000000,-15.073900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,-1.535000,-15.073900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,-1.535000,-14.931900>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.972700,-1.535000,-15.073900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,0.000000,-11.488400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,0.000000,-11.630400>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,44.997030,0> translate<1.972700,0.000000,-11.488400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.972700,-1.535000,-11.488400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,-1.535000,-11.630400>}
box{<0,0,-0.203200><0.200818,0.035000,0.203200> rotate<0,44.997030,0> translate<1.972700,-1.535000,-11.488400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.009800,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.597000,0.000000,-15.036800>}
box{<0,0,-0.203200><0.587200,0.035000,0.203200> rotate<0,0.000000,0> translate<2.009800,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.009800,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.597000,-1.535000,-15.036800>}
box{<0,0,-0.203200><0.587200,0.035000,0.203200> rotate<0,0.000000,0> translate<2.009800,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.024000,0.000000,-10.759900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.140200,0.000000,-10.728700>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-15.028587,0> translate<2.024000,0.000000,-10.759900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.024000,0.000000,-6.537400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.140200,0.000000,-6.568600>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<2.024000,0.000000,-6.537400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,0.000000,-14.931900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,0.000000,-14.769300>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-54.004697,0> translate<2.114700,0.000000,-14.931900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,-1.535000,-14.931900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,-1.535000,-14.769300>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,-54.004697,0> translate<2.114700,-1.535000,-14.931900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,0.000000,-11.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,0.000000,-11.793000>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,54.004697,0> translate<2.114700,0.000000,-11.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114700,-1.535000,-11.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,-1.535000,-11.793000>}
box{<0,0,-0.203200><0.200964,0.035000,0.203200> rotate<0,54.004697,0> translate<2.114700,-1.535000,-11.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.140200,0.000000,-10.728700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.244500,0.000000,-10.668600>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<2.140200,0.000000,-10.728700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.140200,0.000000,-6.568600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.244500,0.000000,-6.628700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<2.140200,0.000000,-6.568600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-22.301500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,0.000000,-23.043900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,74.996885,0> translate<2.159000,0.000000,-22.301500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-22.301500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,-1.535000,-23.043900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,74.996885,0> translate<2.159000,-1.535000,-22.301500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-21.532800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-22.301500>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.159000,0.000000,-22.301500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-21.532800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-22.301500>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.159000,-1.535000,-22.301500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,0.000000,-21.532800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,0.000000,-20.790400>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-74.996885,0> translate<2.159000,0.000000,-21.532800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.159000,-1.535000,-21.532800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,-1.535000,-20.790400>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-74.996885,0> translate<2.159000,-1.535000,-21.532800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.201400,0.000000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.599700,0.000000,-3.657600>}
box{<0,0,-0.203200><6.398300,0.035000,0.203200> rotate<0,0.000000,0> translate<2.201400,0.000000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.201400,-1.535000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-3.657600>}
box{<0,0,-0.203200><10.530600,0.035000,0.203200> rotate<0,0.000000,0> translate<2.201400,-1.535000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.201500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.423500,-1.535000,3.657600>}
box{<0,0,-0.203200><5.222000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.201500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.227500,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.414900,0.000000,-11.785600>}
box{<0,0,-0.203200><0.187400,0.035000,0.203200> rotate<0,0.000000,0> translate<2.227500,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.227500,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.414900,-1.535000,-11.785600>}
box{<0,0,-0.203200><0.187400,0.035000,0.203200> rotate<0,0.000000,0> translate<2.227500,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,0.000000,-14.769300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,0.000000,-14.590300>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-62.997127,0> translate<2.232800,0.000000,-14.769300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,-1.535000,-14.769300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,-1.535000,-14.590300>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,-62.997127,0> translate<2.232800,-1.535000,-14.769300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,0.000000,-11.793000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,0.000000,-11.972000>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,62.997127,0> translate<2.232800,0.000000,-11.793000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.232800,-1.535000,-11.793000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,-1.535000,-11.972000>}
box{<0,0,-0.203200><0.200894,0.035000,0.203200> rotate<0,62.997127,0> translate<2.232800,-1.535000,-11.793000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.244500,0.000000,-10.668600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.329600,0.000000,-10.583500>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.244500,0.000000,-10.668600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.244500,0.000000,-6.628700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.329600,0.000000,-6.713800>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<2.244500,0.000000,-6.628700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.303500,0.000000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.354200,0.000000,-14.630400>}
box{<0,0,-0.203200><0.050700,0.035000,0.203200> rotate<0,0.000000,0> translate<2.303500,0.000000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.303500,-1.535000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.354200,-1.535000,-14.630400>}
box{<0,0,-0.203200><0.050700,0.035000,0.203200> rotate<0,0.000000,0> translate<2.303500,-1.535000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,-1.535000,-14.590300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,-1.535000,-14.571800>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,-72.026107,0> translate<2.324000,-1.535000,-14.590300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,0.000000,-14.590300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,0.000000,-14.571700>}
box{<0,0,-0.203200><0.019544,0.035000,0.203200> rotate<0,-72.116544,0> translate<2.324000,0.000000,-14.590300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,0.000000,-11.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,0.000000,-11.990500>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,72.026107,0> translate<2.324000,0.000000,-11.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324000,-1.535000,-11.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,-1.535000,-11.990500>}
box{<0,0,-0.203200><0.019449,0.035000,0.203200> rotate<0,72.026107,0> translate<2.324000,-1.535000,-11.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.329600,0.000000,-10.583500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382400,0.000000,-10.491900>}
box{<0,0,-0.203200><0.105728,0.035000,0.203200> rotate<0,-60.036063,0> translate<2.329600,0.000000,-10.583500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.329600,0.000000,-6.713800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382400,0.000000,-6.805500>}
box{<0,0,-0.203200><0.105815,0.035000,0.203200> rotate<0,60.063102,0> translate<2.329600,0.000000,-6.713800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,-1.535000,-14.571800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,67.504629,0> translate<2.330000,-1.535000,-14.571800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,0.000000,-14.571700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,0.000000,-14.909700>}
box{<0,0,-0.203200><0.365809,0.035000,0.203200> rotate<0,67.510620,0> translate<2.330000,0.000000,-14.571700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,0.000000,-11.990500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,0.000000,-11.652600>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,-67.504629,0> translate<2.330000,0.000000,-11.990500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.330000,-1.535000,-11.990500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.365716,0.035000,0.203200> rotate<0,-67.504629,0> translate<2.330000,-1.535000,-11.990500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.339400,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.413200,0.000000,-10.566400>}
box{<0,0,-0.203200><0.073800,0.035000,0.203200> rotate<0,0.000000,0> translate<2.339400,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,0.000000,-23.043900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,0.000000,-23.709600>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,59.998756,0> translate<2.357900,0.000000,-23.043900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,-1.535000,-23.043900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,-1.535000,-23.709600>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,59.998756,0> translate<2.357900,-1.535000,-23.043900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,0.000000,-20.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,0.000000,-20.124700>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-59.998756,0> translate<2.357900,0.000000,-20.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.357900,-1.535000,-20.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,-1.535000,-20.124700>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-59.998756,0> translate<2.357900,-1.535000,-20.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382400,0.000000,-10.491900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.447000,0.000000,-10.648100>}
box{<0,0,-0.203200><0.169031,0.035000,0.203200> rotate<0,67.526909,0> translate<2.382400,0.000000,-10.491900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382400,0.000000,-6.805500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.447000,0.000000,-6.649200>}
box{<0,0,-0.203200><0.169124,0.035000,0.203200> rotate<0,-67.539856,0> translate<2.382400,0.000000,-6.805500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.447000,0.000000,-10.648100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.618400,0.000000,-10.819500>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<2.447000,0.000000,-10.648100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.447000,0.000000,-6.649200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.618400,0.000000,-6.477800>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.447000,0.000000,-6.649200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,0.000000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,0.000000,-15.311600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<2.469900,0.000000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<2.469900,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,0.000000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.868400,0.000000,-11.254200>}
box{<0,0,-0.203200><0.563493,0.035000,0.203200> rotate<0,-44.989841,0> translate<2.469900,0.000000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.469900,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.469900,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.618400,0.000000,-10.819500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.842500,0.000000,-10.912300>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,22.493003,0> translate<2.618400,0.000000,-10.819500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.618400,0.000000,-6.477800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.842500,0.000000,-6.385000>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-22.493003,0> translate<2.618400,0.000000,-6.477800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,0.000000,-3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.932600,0.000000,-3.103600>}
box{<0,0,-0.203200><0.441023,0.035000,0.203200> rotate<0,-45.006216,0> translate<2.620800,0.000000,-3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,-1.535000,-3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.415500,-1.535000,-2.620800>}
box{<0,0,-0.203200><1.123876,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.620800,-1.535000,-3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.620800,-1.535000,3.415500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.415500,-1.535000,2.620800>}
box{<0,0,-0.203200><1.123876,0.035000,0.203200> rotate<0,44.997030,0> translate<2.620800,-1.535000,3.415500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,0.000000,-23.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,0.000000,-24.253100>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,44.997030,0> translate<2.742200,0.000000,-23.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,-1.535000,-23.709600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,-1.535000,-24.253100>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,44.997030,0> translate<2.742200,-1.535000,-23.709600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,0.000000,-20.124700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,0.000000,-19.581200>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.742200,0.000000,-20.124700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.742200,-1.535000,-20.124700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,-1.535000,-19.581200>}
box{<0,0,-0.203200><0.768625,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.742200,-1.535000,-20.124700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.785000,0.000000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.006100,0.000000,-3.251200>}
box{<0,0,-0.203200><6.221100,0.035000,0.203200> rotate<0,0.000000,0> translate<2.785000,0.000000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.785100,-1.535000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-3.251200>}
box{<0,0,-0.203200><9.946900,0.035000,0.203200> rotate<0,0.000000,0> translate<2.785100,-1.535000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.785100,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.002200,-1.535000,3.251200>}
box{<0,0,-0.203200><5.217100,0.035000,0.203200> rotate<0,0.000000,0> translate<2.785100,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.842500,0.000000,-10.912300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.868400,0.000000,-10.912300>}
box{<0,0,-0.203200><0.025900,0.035000,0.203200> rotate<0,0.000000,0> translate<2.842500,0.000000,-10.912300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.842500,0.000000,-6.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.885000,0.000000,-6.385000>}
box{<0,0,-0.203200><1.042500,0.035000,0.203200> rotate<0,0.000000,0> translate<2.842500,0.000000,-6.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.868400,0.000000,-10.912300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.868400,0.000000,-11.254200>}
box{<0,0,-0.203200><0.341900,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.868400,0.000000,-11.254200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,0.000000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,0.000000,-15.529100>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<2.871800,0.000000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<2.871800,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.871800,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<2.871800,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.932600,0.000000,-3.103600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.958700,0.000000,-3.114500>}
box{<0,0,-0.203200><0.028285,0.035000,0.203200> rotate<0,22.665116,0> translate<2.932600,0.000000,-3.103600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.958700,0.000000,-3.114500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.631200,0.000000,-3.114500>}
box{<0,0,-0.203200><1.672500,0.035000,0.203200> rotate<0,0.000000,0> translate<2.958700,0.000000,-3.114500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.191500,-1.535000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-2.844800>}
box{<0,0,-0.203200><9.540500,0.035000,0.203200> rotate<0,0.000000,0> translate<3.191500,-1.535000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.191500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.037600,-1.535000,2.844800>}
box{<0,0,-0.203200><5.846100,0.035000,0.203200> rotate<0,0.000000,0> translate<3.191500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,0.000000,-24.253100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,0.000000,-24.637400>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,29.995304,0> translate<3.285700,0.000000,-24.253100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,-1.535000,-24.253100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,-1.535000,-24.637400>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,29.995304,0> translate<3.285700,-1.535000,-24.253100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,0.000000,-19.581200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,0.000000,-19.196900>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-29.995304,0> translate<3.285700,0.000000,-19.581200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.285700,-1.535000,-19.581200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,-1.535000,-19.196900>}
box{<0,0,-0.203200><0.768663,0.035000,0.203200> rotate<0,-29.995304,0> translate<3.285700,-1.535000,-19.581200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,0.000000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,0.000000,-15.529100>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<3.396900,0.000000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,-1.535000,-15.529100>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<3.396900,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.396900,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,-1.535000,-11.033200>}
box{<0,0,-0.203200><0.568500,0.035000,0.203200> rotate<0,0.000000,0> translate<3.396900,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.415500,-1.535000,-2.620800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.977400,-1.535000,-1.647500>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,-59.997586,0> translate<3.415500,-1.535000,-2.620800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.415500,-1.535000,2.620800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.977400,-1.535000,1.647500>}
box{<0,0,-0.203200><1.123853,0.035000,0.203200> rotate<0,59.997586,0> translate<3.415500,-1.535000,2.620800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.520800,-1.535000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-2.438400>}
box{<0,0,-0.203200><9.211200,0.035000,0.203200> rotate<0,0.000000,0> translate<3.520800,-1.535000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.520900,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,2.438400>}
box{<0,0,-0.203200><9.211100,0.035000,0.203200> rotate<0,0.000000,0> translate<3.520900,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.755400,-1.535000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-2.032000>}
box{<0,0,-0.203200><8.976600,0.035000,0.203200> rotate<0,0.000000,0> translate<3.755400,-1.535000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.755500,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,2.032000>}
box{<0,0,-0.203200><8.976500,0.035000,0.203200> rotate<0,0.000000,0> translate<3.755500,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.885000,0.000000,-6.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.109100,0.000000,-6.477800>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,22.493003,0> translate<3.885000,0.000000,-6.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,-1.535000,-24.637400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.428000,-1.535000,-24.765000>}
box{<0,0,-0.203200><0.493386,0.035000,0.203200> rotate<0,14.987279,0> translate<3.951400,-1.535000,-24.637400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,0.000000,-24.637400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.428100,0.000000,-24.765000>}
box{<0,0,-0.203200><0.493482,0.035000,0.203200> rotate<0,14.984277,0> translate<3.951400,0.000000,-24.637400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,0.000000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.693800,0.000000,-18.998000>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-14.997175,0> translate<3.951400,0.000000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.951400,-1.535000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.693800,-1.535000,-18.998000>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,-14.997175,0> translate<3.951400,-1.535000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,0.000000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,0.000000,-15.311600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<3.965400,0.000000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,-1.535000,-15.529100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,-1.535000,-15.311600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-22.498185,0> translate<3.965400,-1.535000,-15.529100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.965400,-1.535000,-11.033200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,-1.535000,-11.250700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,22.498185,0> translate<3.965400,-1.535000,-11.033200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.977400,-1.535000,-1.647500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,-0.561900>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,-74.994343,0> translate<3.977400,-1.535000,-1.647500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.977400,-1.535000,1.647500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,0.561900>}
box{<0,0,-0.203200><1.123900,0.035000,0.203200> rotate<0,74.994343,0> translate<3.977400,-1.535000,1.647500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.983200,-1.535000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-1.625600>}
box{<0,0,-0.203200><8.748800,0.035000,0.203200> rotate<0,0.000000,0> translate<3.983200,-1.535000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.983300,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,1.625600>}
box{<0,0,-0.203200><8.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.983300,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.092100,-1.535000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-1.219200>}
box{<0,0,-0.203200><8.639900,0.035000,0.203200> rotate<0,0.000000,0> translate<4.092100,-1.535000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.092200,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,1.219200>}
box{<0,0,-0.203200><8.639800,0.035000,0.203200> rotate<0,0.000000,0> translate<4.092200,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.109100,0.000000,-6.477800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-6.649200>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<4.109100,0.000000,-6.477800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.133700,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.754900,0.000000,-6.502400>}
box{<0,0,-0.203200><1.621200,0.035000,0.203200> rotate<0,0.000000,0> translate<4.133700,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172700,0.000000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-15.443200>}
box{<0,0,-0.203200><8.559300,0.035000,0.203200> rotate<0,0.000000,0> translate<4.172700,0.000000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172700,-1.535000,-15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-15.443200>}
box{<0,0,-0.203200><8.559300,0.035000,0.203200> rotate<0,0.000000,0> translate<4.172700,-1.535000,-15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.176500,0.000000,-8.653500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.176500,0.000000,-8.643800>}
box{<0,0,-0.203200><0.009700,0.035000,0.203200> rotate<0,90.000000,0> translate<4.176500,0.000000,-8.643800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.176500,0.000000,-8.653500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-8.757400>}
box{<0,0,-0.203200><0.147008,0.035000,0.203200> rotate<0,44.969473,0> translate<4.176500,0.000000,-8.653500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.176500,0.000000,-8.643800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-8.539900>}
box{<0,0,-0.203200><0.147008,0.035000,0.203200> rotate<0,-44.969473,0> translate<4.176500,0.000000,-8.643800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.201000,-1.535000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-0.812800>}
box{<0,0,-0.203200><8.531000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.201000,-1.535000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.201100,-1.535000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,0.812800>}
box{<0,0,-0.203200><8.530900,0.035000,0.203200> rotate<0,0.000000,0> translate<4.201100,-1.535000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,-0.561900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,0.561900>}
box{<0,0,-0.203200><1.123800,0.035000,0.203200> rotate<0,90.000000,0> translate<4.268300,-1.535000,0.561900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-0.406400>}
box{<0,0,-0.203200><8.463700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.268300,-1.535000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,0.000000>}
box{<0,0,-0.203200><8.463700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.268300,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.268300,-1.535000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,0.406400>}
box{<0,0,-0.203200><8.463700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.268300,-1.535000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-8.757400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.373300,0.000000,-8.981500>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<4.280500,0.000000,-8.757400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-8.539900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345900,0.000000,-8.381900>}
box{<0,0,-0.203200><0.171000,0.035000,0.203200> rotate<0,-67.509704,0> translate<4.280500,0.000000,-8.539900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.280500,0.000000,-6.649200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.366900,0.000000,-6.858000>}
box{<0,0,-0.203200><0.225970,0.035000,0.203200> rotate<0,67.516110,0> translate<4.280500,0.000000,-6.649200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.282700,0.000000,-8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-8.534400>}
box{<0,0,-0.203200><8.449300,0.035000,0.203200> rotate<0,0.000000,0> translate<4.282700,0.000000,-8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345900,0.000000,-8.381900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.866600,0.000000,-8.381900>}
box{<0,0,-0.203200><1.520700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.345900,0.000000,-8.381900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.356500,0.000000,-8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-8.940800>}
box{<0,0,-0.203200><8.375500,0.035000,0.203200> rotate<0,0.000000,0> translate<4.356500,0.000000,-8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.366900,0.000000,-6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.399300,0.000000,-6.858000>}
box{<0,0,-0.203200><1.032400,0.035000,0.203200> rotate<0,0.000000,0> translate<4.366900,0.000000,-6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.373300,0.000000,-9.567200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.373300,0.000000,-8.981500>}
box{<0,0,-0.203200><0.585700,0.035000,0.203200> rotate<0,90.000000,0> translate<4.373300,0.000000,-8.981500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.373300,0.000000,-9.567200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-9.858400>}
box{<0,0,-0.203200><0.315185,0.035000,0.203200> rotate<0,67.498734,0> translate<4.373300,0.000000,-9.567200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.373300,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-9.347200>}
box{<0,0,-0.203200><8.358700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.373300,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.450500,0.000000,-9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-9.753600>}
box{<0,0,-0.203200><8.281500,0.035000,0.203200> rotate<0,0.000000,0> translate<4.450500,0.000000,-9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,0.000000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,0.000000,-14.909700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.490500,0.000000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,-1.535000,-15.311600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,-1.535000,-14.909700>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.490500,-1.535000,-15.311600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490500,-1.535000,-11.250700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,-1.535000,-11.652600>}
box{<0,0,-0.203200><0.568372,0.035000,0.203200> rotate<0,44.997030,0> translate<4.490500,-1.535000,-11.250700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-11.254200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-10.181900>}
box{<0,0,-0.203200><1.072300,0.035000,0.203200> rotate<0,90.000000,0> translate<4.493900,0.000000,-10.181900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-11.254200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,0.000000,-11.652600>}
box{<0,0,-0.203200><0.563493,0.035000,0.203200> rotate<0,44.989841,0> translate<4.493900,0.000000,-11.254200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-10.972800>}
box{<0,0,-0.203200><8.238100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.493900,0.000000,-10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-10.566400>}
box{<0,0,-0.203200><8.238100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.493900,0.000000,-10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-10.181900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-9.858400>}
box{<0,0,-0.203200><0.323500,0.035000,0.203200> rotate<0,90.000000,0> translate<4.493900,0.000000,-9.858400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493900,0.000000,-10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-10.160000>}
box{<0,0,-0.203200><8.238100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.493900,0.000000,-10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.619000,0.000000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-11.379200>}
box{<0,0,-0.203200><8.113000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.619000,0.000000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.619000,-1.535000,-11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-11.379200>}
box{<0,0,-0.203200><8.113000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.619000,-1.535000,-11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.631200,0.000000,-3.114500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.855300,0.000000,-3.021700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-22.493003,0> translate<4.631200,0.000000,-3.114500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.693800,0.000000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.462500,0.000000,-18.998000>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.693800,0.000000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.693800,-1.535000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.462500,-1.535000,-18.998000>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.693800,-1.535000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765300,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-15.036800>}
box{<0,0,-0.203200><7.966700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.765300,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765300,-1.535000,-15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-15.036800>}
box{<0,0,-0.203200><7.966700,0.035000,0.203200> rotate<0,0.000000,0> translate<4.765300,-1.535000,-15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.855300,0.000000,-3.021700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-2.850300>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.855300,0.000000,-3.021700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,0.000000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-14.384600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-67.495875,0> translate<4.892400,0.000000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,-1.535000,-14.909700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-14.384600>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,-67.495875,0> translate<4.892400,-1.535000,-14.909700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,0.000000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-12.177700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,67.495875,0> translate<4.892400,0.000000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.892400,-1.535000,-11.652600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-12.177700>}
box{<0,0,-0.203200><0.568363,0.035000,0.203200> rotate<0,67.495875,0> translate<4.892400,-1.535000,-11.652600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.947500,0.000000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-11.785600>}
box{<0,0,-0.203200><7.784500,0.035000,0.203200> rotate<0,0.000000,0> translate<4.947500,0.000000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.947500,-1.535000,-11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-11.785600>}
box{<0,0,-0.203200><7.784500,0.035000,0.203200> rotate<0,0.000000,0> translate<4.947500,-1.535000,-11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952000,0.000000,-0.975000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952500,0.000000,-0.975400>}
box{<0,0,-0.203200><0.000640,0.035000,0.203200> rotate<0,38.657257,0> translate<4.952000,0.000000,-0.975000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952000,0.000000,-0.975000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952600,0.000000,-0.974400>}
box{<0,0,-0.203200><0.000849,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.952000,0.000000,-0.975000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952500,0.000000,-0.975400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.975400>}
box{<0,0,-0.203200><0.014600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.952500,0.000000,-0.975400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.952600,0.000000,-0.974400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.974400>}
box{<0,0,-0.203200><0.014500,0.035000,0.203200> rotate<0,0.000000,0> translate<4.952600,0.000000,-0.974400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.975400>}
box{<0,0,-0.203200><0.014600,0.035000,0.203200> rotate<0,90.000000,0> translate<4.967100,0.000000,-0.975400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-1.049600>}
box{<0,0,-0.203200><0.084287,0.035000,0.203200> rotate<0,44.997030,0> translate<4.967100,0.000000,-0.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.974400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.959900>}
box{<0,0,-0.203200><0.014500,0.035000,0.203200> rotate<0,90.000000,0> translate<4.967100,0.000000,-0.959900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.967100,0.000000,-0.959900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-0.900300>}
box{<0,0,-0.203200><0.084287,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.967100,0.000000,-0.959900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.008000,0.000000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-14.630400>}
box{<0,0,-0.203200><7.724000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.008000,0.000000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.008000,-1.535000,-14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-14.630400>}
box{<0,0,-0.203200><7.724000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.008000,-1.535000,-14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-2.850300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-2.626200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<5.026700,0.000000,-2.850300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-1.049600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-1.273700>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<5.026700,0.000000,-1.049600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026700,0.000000,-0.900300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-0.676200>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<5.026700,0.000000,-0.900300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.028900,0.000000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.412500,0.000000,-2.844800>}
box{<0,0,-0.203200><4.383600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.028900,0.000000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.062900,0.000000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.973500,0.000000,-0.812800>}
box{<0,0,-0.203200><1.910600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.062900,0.000000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.097000,0.000000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.219200>}
box{<0,0,-0.203200><1.643600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.097000,0.000000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-14.384600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-12.177700>}
box{<0,0,-0.203200><2.206900,0.035000,0.203200> rotate<0,90.000000,0> translate<5.109900,0.000000,-12.177700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-14.384600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-12.177700>}
box{<0,0,-0.203200><2.206900,0.035000,0.203200> rotate<0,90.000000,0> translate<5.109900,-1.535000,-12.177700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-14.224000>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-14.224000>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-13.817600>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-13.817600>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-13.411200>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-13.411200>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-13.004800>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-13.004800>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-12.598400>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-12.598400>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,0.000000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-12.192000>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.109900,-1.535000,-12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-12.192000>}
box{<0,0,-0.203200><7.622100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.109900,-1.535000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-2.626200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-1.976200>}
box{<0,0,-0.203200><0.650000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.119500,0.000000,-1.976200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.026100,0.000000,-2.438400>}
box{<0,0,-0.203200><1.906600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-2.032000>}
box{<0,0,-0.203200><1.621100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-1.976200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-1.273700>}
box{<0,0,-0.203200><0.702500,0.035000,0.203200> rotate<0,90.000000,0> translate<5.119500,0.000000,-1.273700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.625600>}
box{<0,0,-0.203200><1.621100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-0.676200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-0.026200>}
box{<0,0,-0.203200><0.650000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.119500,0.000000,-0.026200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.618800,0.000000,-0.406400>}
box{<0,0,-0.203200><1.499300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,-0.026200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.623700>}
box{<0,0,-0.203200><0.649900,0.035000,0.203200> rotate<0,90.000000,0> translate<5.119500,0.000000,0.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.588200,0.000000,0.000000>}
box{<0,0,-0.203200><1.468700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502500,0.000000,0.406400>}
box{<0,0,-0.203200><1.383000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.863000>}
box{<0,0,-0.203200><0.239300,0.035000,0.203200> rotate<0,90.000000,0> translate<5.119500,0.000000,0.863000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.096100,0.000000,0.812800>}
box{<0,0,-0.203200><0.976600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119500,0.000000,0.863000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.045900,0.000000,0.863000>}
box{<0,0,-0.203200><0.926400,0.035000,0.203200> rotate<0,0.000000,0> translate<5.119500,0.000000,0.863000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.399300,0.000000,-6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-2.224300>}
box{<0,0,-0.203200><6.553041,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.399300,0.000000,-6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.462500,0.000000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.204900,0.000000,-19.196900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,14.997175,0> translate<5.462500,0.000000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.462500,-1.535000,-18.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.204900,-1.535000,-19.196900>}
box{<0,0,-0.203200><0.768582,0.035000,0.203200> rotate<0,14.997175,0> translate<5.462500,-1.535000,-18.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.363900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,5.148600>}
box{<0,0,-0.203200><1.271811,0.035000,0.203200> rotate<0,72.851061,0> translate<5.780500,-1.535000,6.363900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.364000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.363900>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.780500,-1.535000,6.363900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,7.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,6.364000>}
box{<0,0,-0.203200><1.271900,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.780500,-1.535000,6.364000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,7.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,7.635900>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.780500,-1.535000,7.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.780500,-1.535000,7.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,8.851300>}
box{<0,0,-0.203200><1.271811,0.035000,0.203200> rotate<0,-72.851061,0> translate<5.780500,-1.535000,7.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.846300,-1.535000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.869700,-1.535000,-19.100800>}
box{<0,0,-0.203200><1.023400,0.035000,0.203200> rotate<0,0.000000,0> translate<5.846300,-1.535000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.846300,0.000000,-19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.869800,0.000000,-19.100800>}
box{<0,0,-0.203200><1.023500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.846300,0.000000,-19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.866600,0.000000,-8.381900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.146600,0.000000,-8.265900>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,-22.502043,0> translate<5.866600,0.000000,-8.381900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.045900,0.000000,0.863000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.588200,0.000000,0.320800>}
box{<0,0,-0.203200><0.766857,0.035000,0.203200> rotate<0,44.991747,0> translate<6.045900,0.000000,0.863000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.146600,0.000000,-8.265900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.360900,0.000000,-8.051600>}
box{<0,0,-0.203200><0.303066,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.146600,0.000000,-8.265900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,5.148500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,4.097600>}
box{<0,0,-0.203200><1.271913,0.035000,0.203200> rotate<0,55.710292,0> translate<6.155400,-1.535000,5.148500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,5.148600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,5.148500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.155400,-1.535000,5.148500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,8.851400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,8.851300>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.155400,-1.535000,8.851300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.155400,-1.535000,8.851400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.789100,-1.535000,9.780800>}
box{<0,0,-0.203200><1.124882,0.035000,0.203200> rotate<0,-55.708681,0> translate<6.155400,-1.535000,8.851400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.204900,0.000000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.634900,0.000000,-19.445200>}
box{<0,0,-0.203200><0.496541,0.035000,0.203200> rotate<0,30.001956,0> translate<6.204900,0.000000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.204900,-1.535000,-19.196900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.634900,-1.535000,-19.445200>}
box{<0,0,-0.203200><0.496541,0.035000,0.203200> rotate<0,30.001956,0> translate<6.204900,-1.535000,-19.196900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.284500,0.000000,-8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-8.128000>}
box{<0,0,-0.203200><6.447500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.284500,0.000000,-8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.360900,0.000000,-8.051600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.360900,0.000000,-8.051500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<6.360900,0.000000,-8.051500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.360900,0.000000,-8.051500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.440900,0.000000,-2.971600>}
box{<0,0,-0.203200><7.184134,0.035000,0.203200> rotate<0,-44.996466,0> translate<6.360900,0.000000,-8.051500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.588200,0.000000,-0.332400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.681000,0.000000,-0.556500>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<6.588200,0.000000,-0.332400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.588200,0.000000,0.320800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.588200,0.000000,-0.332400>}
box{<0,0,-0.203200><0.653200,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.588200,0.000000,-0.332400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.634900,0.000000,-19.445200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,0.000000,-19.097600>}
box{<0,0,-0.203200><0.420707,0.035000,0.203200> rotate<0,-55.709446,0> translate<6.634900,0.000000,-19.445200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.634900,-1.535000,-19.445200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,-19.097500>}
box{<0,0,-0.203200><0.420790,0.035000,0.203200> rotate<0,-55.717116,0> translate<6.634900,-1.535000,-19.445200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.681000,0.000000,-0.556500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.852400,0.000000,-0.727900>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<6.681000,0.000000,-0.556500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.690800,0.000000,-7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-7.721600>}
box{<0,0,-0.203200><6.041200,0.035000,0.203200> rotate<0,0.000000,0> translate<6.690800,0.000000,-7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-2.071400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771800,0.000000,-2.187600>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<6.740600,0.000000,-2.071400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-2.071400>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.740600,0.000000,-2.071400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.796700,0.000000,-1.611600>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.740600,0.000000,-1.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.796700,0.000000,-1.610600>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.740600,0.000000,-1.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.150900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.610600>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.740600,0.000000,-1.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.740600,0.000000,-1.150900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771800,0.000000,-1.034700>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<6.740600,0.000000,-1.150900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771800,0.000000,-2.187600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.831900,0.000000,-2.291900>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<6.771800,0.000000,-2.187600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.771800,0.000000,-1.034700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.831900,0.000000,-0.930400>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<6.771800,0.000000,-1.034700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.831900,0.000000,-2.291900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.917000,0.000000,-2.377000>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<6.831900,0.000000,-2.291900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.831900,0.000000,-0.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.917000,0.000000,-0.845300>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.831900,0.000000,-0.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.852400,0.000000,-0.727900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.008600,0.000000,-0.792600>}
box{<0,0,-0.203200><0.169070,0.035000,0.203200> rotate<0,22.498465,0> translate<6.852400,0.000000,-0.727900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,0.000000,-19.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,0.000000,-19.097600>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.871900,0.000000,-19.097600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,0.000000,-19.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,0.000000,-19.097500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.871900,0.000000,-19.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,-19.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,-1.535000,-19.097500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.871900,-1.535000,-19.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,4.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,-1.535000,4.097500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<6.871900,-1.535000,4.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,4.097600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.871900,-1.535000,4.097500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.871900,-1.535000,4.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,-1.535000,-19.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,-18.304600>}
box{<0,0,-0.203200><1.271740,0.035000,0.203200> rotate<0,-38.567904,0> translate<6.872000,-1.535000,-19.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,0.000000,-19.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,0.000000,-18.304500>}
box{<0,0,-0.203200><1.271802,0.035000,0.203200> rotate<0,-38.571426,0> translate<6.872000,0.000000,-19.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872000,-1.535000,4.097500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,3.304500>}
box{<0,0,-0.203200><1.271802,0.035000,0.203200> rotate<0,38.571426,0> translate<6.872000,-1.535000,4.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.917000,0.000000,-2.377000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.021300,0.000000,-2.437100>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,29.949535,0> translate<6.917000,0.000000,-2.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.917000,0.000000,-0.845300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.008600,0.000000,-0.792600>}
box{<0,0,-0.203200><0.105678,0.035000,0.203200> rotate<0,-29.911028,0> translate<6.917000,0.000000,-0.845300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.021300,0.000000,-2.437100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.137500,0.000000,-2.468300>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,15.028587,0> translate<7.021300,0.000000,-2.437100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.097200,0.000000,-7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-7.315200>}
box{<0,0,-0.203200><5.634800,0.035000,0.203200> rotate<0,0.000000,0> translate<7.097200,0.000000,-7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.137500,0.000000,-2.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-2.468300>}
box{<0,0,-0.203200><0.659700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.137500,0.000000,-2.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.503600,0.000000,-6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-6.908800>}
box{<0,0,-0.203200><5.228400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.503600,0.000000,-6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.551000,0.000000,1.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.865700,0.000000,1.198300>}
box{<0,0,-0.203200><0.445053,0.035000,0.203200> rotate<0,44.997030,0> translate<7.551000,0.000000,1.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.551000,0.000000,1.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.474400,0.000000,1.513000>}
box{<0,0,-0.203200><1.923400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.551000,0.000000,1.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.796700,0.000000,-1.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.796700,0.000000,-1.611600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.796700,0.000000,-1.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-2.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-1.612200>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,90.000000,0> translate<7.797200,0.000000,-1.612200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-2.438400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.797200,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-2.032000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.797200,0.000000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-1.625600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.797200,0.000000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.797200,0.000000,-1.612200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-1.612200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.797200,0.000000,-1.612200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-2.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458000,0.000000,-2.468300>}
box{<0,0,-0.203200><0.659800,0.035000,0.203200> rotate<0,0.000000,0> translate<7.798200,0.000000,-2.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-1.612200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798200,0.000000,-2.468300>}
box{<0,0,-0.203200><0.856100,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.798200,0.000000,-2.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798800,0.000000,-1.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798800,0.000000,-1.610600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.798800,0.000000,-1.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798800,0.000000,-1.611600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.611600>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.798800,0.000000,-1.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.798800,0.000000,-1.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.610600>}
box{<0,0,-0.203200><1.056100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.798800,0.000000,-1.610600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.844800,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.768200,0.000000,1.219200>}
box{<0,0,-0.203200><1.923400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.844800,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.865700,0.000000,1.198300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.519000,0.000000,1.198300>}
box{<0,0,-0.203200><0.653300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.865700,0.000000,1.198300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,-18.304600>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.866300,-1.535000,-18.304600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,0.000000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866400,0.000000,-18.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.866300,0.000000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,-1.535000,-17.839800>}
box{<0,0,-0.203200><1.272022,0.035000,0.203200> rotate<0,-21.426109,0> translate<7.866300,-1.535000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866300,-1.535000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866400,-1.535000,3.304500>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.866300,-1.535000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866400,0.000000,-18.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,0.000000,-17.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,-21.427754,0> translate<7.866400,0.000000,-18.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.866400,-1.535000,3.304500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,-1.535000,2.839800>}
box{<0,0,-0.203200><1.271928,0.035000,0.203200> rotate<0,21.427754,0> translate<7.866400,-1.535000,3.304500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.910000,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-6.502400>}
box{<0,0,-0.203200><4.822000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.910000,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.316400,0.000000,-6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-6.096000>}
box{<0,0,-0.203200><4.415600,0.035000,0.203200> rotate<0,0.000000,0> translate<8.316400,0.000000,-6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.458000,0.000000,-2.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.574200,0.000000,-2.437100>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-15.028587,0> translate<8.458000,0.000000,-2.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.519000,0.000000,1.198300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.743100,0.000000,1.105500>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,22.493003,0> translate<8.519000,0.000000,1.198300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.569300,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.818900,0.000000,-2.438400>}
box{<0,0,-0.203200><1.249600,0.035000,0.203200> rotate<0,0.000000,0> translate<8.569300,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.574200,0.000000,-2.437100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.678500,0.000000,-2.377000>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-29.949535,0> translate<8.574200,0.000000,-2.437100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.586900,0.000000,-0.792500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.678500,0.000000,-0.845300>}
box{<0,0,-0.203200><0.105728,0.035000,0.203200> rotate<0,29.957997,0> translate<8.586900,0.000000,-0.792500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.586900,0.000000,-0.792500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.743100,0.000000,-0.727900>}
box{<0,0,-0.203200><0.169031,0.035000,0.203200> rotate<0,-22.467151,0> translate<8.586900,0.000000,-0.792500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.622200,0.000000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-0.812800>}
box{<0,0,-0.203200><1.410800,0.035000,0.203200> rotate<0,0.000000,0> translate<8.622200,0.000000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.678500,0.000000,-2.377000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.763600,0.000000,-2.291900>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.678500,0.000000,-2.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.678500,0.000000,-0.845300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.763600,0.000000,-0.930400>}
box{<0,0,-0.203200><0.120350,0.035000,0.203200> rotate<0,44.997030,0> translate<8.678500,0.000000,-0.845300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.722800,0.000000,-5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-5.689600>}
box{<0,0,-0.203200><4.009200,0.035000,0.203200> rotate<0,0.000000,0> translate<8.722800,0.000000,-5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.743100,0.000000,-0.727900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.914500,0.000000,-0.556500>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.743100,0.000000,-0.727900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.743100,0.000000,1.105500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.914500,0.000000,0.934100>}
box{<0,0,-0.203200><0.242396,0.035000,0.203200> rotate<0,44.997030,0> translate<8.743100,0.000000,1.105500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.763600,0.000000,-2.291900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823700,0.000000,-2.187600>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,-60.044526,0> translate<8.763600,0.000000,-2.291900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.763600,0.000000,-0.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823700,0.000000,-1.034700>}
box{<0,0,-0.203200><0.120376,0.035000,0.203200> rotate<0,60.044526,0> translate<8.763600,0.000000,-0.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823700,0.000000,-2.187600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-2.071400>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,-74.965473,0> translate<8.823700,0.000000,-2.187600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823700,0.000000,-1.034700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.150900>}
box{<0,0,-0.203200><0.120316,0.035000,0.203200> rotate<0,74.965473,0> translate<8.823700,0.000000,-1.034700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-2.071400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.611600>}
box{<0,0,-0.203200><0.459800,0.035000,0.203200> rotate<0,90.000000,0> translate<8.854900,0.000000,-1.611600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-2.032000>}
box{<0,0,-0.203200><1.178100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.854900,0.000000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-1.625600>}
box{<0,0,-0.203200><1.178100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.854900,0.000000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.150900>}
box{<0,0,-0.203200><0.459700,0.035000,0.203200> rotate<0,90.000000,0> translate<8.854900,0.000000,-1.150900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.854900,0.000000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-1.219200>}
box{<0,0,-0.203200><1.178100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.854900,0.000000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.914500,0.000000,-0.556500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,-0.332400>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,-67.501057,0> translate<8.914500,0.000000,-0.556500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.914500,0.000000,0.934100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,0.710000>}
box{<0,0,-0.203200><0.242554,0.035000,0.203200> rotate<0,67.501057,0> translate<8.914500,0.000000,0.934100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.964800,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,0.812800>}
box{<0,0,-0.203200><1.068200,0.035000,0.203200> rotate<0,0.000000,0> translate<8.964800,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.976600,0.000000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-0.406400>}
box{<0,0,-0.203200><1.056400,0.035000,0.203200> rotate<0,0.000000,0> translate<8.976600,0.000000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,-0.332400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,0.710000>}
box{<0,0,-0.203200><1.042400,0.035000,0.203200> rotate<0,90.000000,0> translate<9.007300,0.000000,0.710000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,0.000000>}
box{<0,0,-0.203200><1.025700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.007300,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.007300,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,0.406400>}
box{<0,0,-0.203200><1.025700,0.035000,0.203200> rotate<0,0.000000,0> translate<9.007300,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,0.000000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050500,0.000000,-17.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.050400,0.000000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,-1.535000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,-1.535000,-17.744700>}
box{<0,0,-0.203200><1.271960,0.035000,0.203200> rotate<0,-4.287523,0> translate<9.050400,-1.535000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050400,-1.535000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050500,-1.535000,2.839800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.050400,-1.535000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050500,0.000000,-17.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,0.000000,-17.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,-4.287860,0> translate<9.050500,0.000000,-17.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050500,-1.535000,2.839800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,-1.535000,2.744700>}
box{<0,0,-0.203200><1.271860,0.035000,0.203200> rotate<0,4.287860,0> translate<9.050500,-1.535000,2.839800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129200,0.000000,-5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-5.283200>}
box{<0,0,-0.203200><3.602800,0.035000,0.203200> rotate<0,0.000000,0> translate<9.129200,0.000000,-5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.474400,0.000000,1.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,0.954400>}
box{<0,0,-0.203200><0.789980,0.035000,0.203200> rotate<0,44.997030,0> translate<9.474400,0.000000,1.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.535600,0.000000,-4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-4.876800>}
box{<0,0,-0.203200><3.196400,0.035000,0.203200> rotate<0,0.000000,0> translate<9.535600,0.000000,-4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.942000,0.000000,-4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-4.470400>}
box{<0,0,-0.203200><2.790000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.942000,0.000000,-4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,0.954400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,0.000000,-2.224300>}
box{<0,0,-0.203200><3.178700,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.033000,0.000000,-2.224300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,0.000000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318900,0.000000,-17.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<10.318800,0.000000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,-1.535000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,-1.535000,-18.027800>}
box{<0,0,-0.203200><1.271906,0.035000,0.203200> rotate<0,12.859724,0> translate<10.318800,-1.535000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318800,-1.535000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318900,-1.535000,2.744700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<10.318800,-1.535000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318900,0.000000,-17.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,0.000000,-18.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,12.860726,0> translate<10.318900,0.000000,-17.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.318900,-1.535000,2.744700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,-1.535000,3.027800>}
box{<0,0,-0.203200><1.271809,0.035000,0.203200> rotate<0,-12.860726,0> translate<10.318900,-1.535000,2.744700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.348400,0.000000,-4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-4.064000>}
box{<0,0,-0.203200><2.383600,0.035000,0.203200> rotate<0,0.000000,0> translate<10.348400,0.000000,-4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.383100,0.000000,2.759400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.435900,0.000000,2.706600>}
box{<0,0,-0.203200><0.074670,0.035000,0.203200> rotate<0,44.997030,0> translate<10.383100,0.000000,2.759400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.383100,0.000000,2.759400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,0.000000,3.027800>}
box{<0,0,-0.203200><1.205947,0.035000,0.203200> rotate<0,-12.858802,0> translate<10.383100,0.000000,2.759400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.435900,0.000000,2.706500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.435900,0.000000,2.706600>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<10.435900,0.000000,2.706600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.435900,0.000000,2.706500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.226500,0.000000,1.915900>}
box{<0,0,-0.203200><1.118077,0.035000,0.203200> rotate<0,44.997030,0> translate<10.435900,0.000000,2.706500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.704000,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,2.438400>}
box{<0,0,-0.203200><2.028000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.704000,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.754800,0.000000,-3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-3.657600>}
box{<0,0,-0.203200><1.977200,0.035000,0.203200> rotate<0,0.000000,0> translate<10.754800,0.000000,-3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.757100,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,2.844800>}
box{<0,0,-0.203200><1.974900,0.035000,0.203200> rotate<0,0.000000,0> translate<10.757100,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.757300,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,2.844800>}
box{<0,0,-0.203200><1.974700,0.035000,0.203200> rotate<0,0.000000,0> translate<10.757300,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.918500,0.000000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-17.881600>}
box{<0,0,-0.203200><1.813500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.918500,0.000000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.918500,-1.535000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-17.881600>}
box{<0,0,-0.203200><1.813500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.918500,-1.535000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.110400,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,2.032000>}
box{<0,0,-0.203200><1.621600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.110400,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.161200,0.000000,-3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-3.251200>}
box{<0,0,-0.203200><1.570800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.161200,0.000000,-3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.226500,0.000000,1.915900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.226600,0.000000,1.915900>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.226500,0.000000,1.915900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.226600,0.000000,1.915900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.440900,0.000000,1.701600>}
box{<0,0,-0.203200><0.303066,0.035000,0.203200> rotate<0,44.997030,0> translate<11.226600,0.000000,1.915900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.440900,0.000000,-2.971600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.691600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,-67.492017,0> translate<11.440900,0.000000,-2.971600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.440900,0.000000,1.701600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,1.421600>}
box{<0,0,-0.203200><0.303078,0.035000,0.203200> rotate<0,67.492017,0> translate<11.440900,0.000000,1.701600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.472400,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,1.625600>}
box{<0,0,-0.203200><1.259600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.472400,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493400,0.000000,-2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-2.844800>}
box{<0,0,-0.203200><1.238600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.493400,0.000000,-2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.691600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.388300>}
box{<0,0,-0.203200><0.303300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.556900,0.000000,-2.388300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-2.438400>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.388300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,1.421600>}
box{<0,0,-0.203200><3.809900,0.035000,0.203200> rotate<0,90.000000,0> translate<11.556900,0.000000,1.421600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-2.032000>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-1.625600>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-1.219200>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-0.812800>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,-0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-0.406400>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,-0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,0.000000>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,0.406400>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,0.812800>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.556900,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,1.219200>}
box{<0,0,-0.203200><1.175100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.556900,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,0.000000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,0.000000,-18.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.558800,0.000000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,-1.535000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,-1.535000,-18.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.558800,-1.535000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,0.000000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,0.000000,3.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.558800,0.000000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558800,-1.535000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,-1.535000,3.027800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.558800,-1.535000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,0.000000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,0.000000,-18.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,29.996018,0> translate<11.558900,0.000000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,-1.535000,-18.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,-1.535000,-18.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,29.996018,0> translate<11.558900,-1.535000,-18.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,0.000000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,0.000000,3.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,-29.996018,0> translate<11.558900,0.000000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.558900,-1.535000,3.027800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,-1.535000,3.663700>}
box{<0,0,-0.203200><1.271877,0.035000,0.203200> rotate<0,-29.996018,0> translate<11.558900,-1.535000,3.027800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.945800,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,3.251200>}
box{<0,0,-0.203200><0.786200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.945800,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.945800,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,3.251200>}
box{<0,0,-0.203200><0.786200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.945800,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.009700,0.000000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-18.288000>}
box{<0,0,-0.203200><0.722300,0.035000,0.203200> rotate<0,0.000000,0> translate<12.009700,0.000000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.009700,-1.535000,-18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-18.288000>}
box{<0,0,-0.203200><0.722300,0.035000,0.203200> rotate<0,0.000000,0> translate<12.009700,-1.535000,-18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.649800,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,3.657600>}
box{<0,0,-0.203200><0.082200,0.035000,0.203200> rotate<0,0.000000,0> translate<12.649800,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.649800,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,3.657600>}
box{<0,0,-0.203200><0.082200,0.035000,0.203200> rotate<0,0.000000,0> translate<12.649800,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,0.000000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,0.000000,-18.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.660400,0.000000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,-1.535000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,-18.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.660400,-1.535000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,0.000000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,0.000000,3.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.660400,0.000000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660400,-1.535000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,3.663700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.660400,-1.535000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,0.000000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-18.740900>}
box{<0,0,-0.203200><0.105224,0.035000,0.203200> rotate<0,47.192085,0> translate<12.660500,0.000000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,-18.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-18.740900>}
box{<0,0,-0.203200><0.105224,0.035000,0.203200> rotate<0,47.192085,0> translate<12.660500,-1.535000,-18.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,3.663800>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<12.660500,-1.535000,3.663800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,0.000000,3.663700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,3.740900>}
box{<0,0,-0.203200><0.105224,0.035000,0.203200> rotate<0,-47.192085,0> translate<12.660500,0.000000,3.663700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.660500,-1.535000,3.663800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,3.740900>}
box{<0,0,-0.203200><0.105151,0.035000,0.203200> rotate<0,-47.155061,0> translate<12.660500,-1.535000,3.663800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.689000,0.000000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-18.694400>}
box{<0,0,-0.203200><0.043000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.689000,0.000000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.689000,-1.535000,-18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-18.694400>}
box{<0,0,-0.203200><0.043000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.689000,-1.535000,-18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,3.740900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,0.000000,-18.740900>}
box{<0,0,-0.203200><22.481800,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.732000,0.000000,-18.740900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,3.740900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.732000,-1.535000,-18.740900>}
box{<0,0,-0.203200><22.481800,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.732000,-1.535000,-18.740900> }
texture{col_pol}
}
#end
union{
cylinder{<3.681200,0.038000,-13.281200><3.681200,-1.538000,-13.281200>0.546100}
cylinder{<1.141200,0.038000,-13.281200><1.141200,-1.538000,-13.281200>0.546100}
cylinder{<-1.398800,0.038000,-13.281200><-1.398800,-1.538000,-13.281200>0.546100}
cylinder{<-3.938800,0.038000,-13.281200><-3.938800,-1.538000,-13.281200>0.546100}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-17.875700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-17.875700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.475100,0.000000,-17.875700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-17.875700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-17.384300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-17.384300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-17.127300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-17.004500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-17.004500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-17.004500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-17.004500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-17.004500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-17.127300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-16.881600>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-16.881600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.598000,0.000000,-17.004500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-17.004500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.598000,0.000000,-17.004500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-16.137000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-16.505600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.229300,0.000000,-16.505600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-16.505600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-16.628400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-16.505600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-16.628400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-16.628400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-16.628400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-16.628400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-16.505600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-16.628400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-16.505600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-16.137000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-16.137000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-15.511400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-15.757200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,-15.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-15.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-15.880000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-15.880000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-15.880000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-15.880000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-15.880000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-15.880000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.757200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-15.757200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.757200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.511400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-15.511400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.511400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-15.388600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-15.511400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-15.388600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-15.388600>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-15.388600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-15.388600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-15.880000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.983600,0.000000,-15.880000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-15.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.131600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-15.131600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-15.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-14.763000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-14.763000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-14.763000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-14.640200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-14.763000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-14.640200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-14.640200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-14.640200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-14.383200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-14.014600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-14.014600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-14.014600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-13.891800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-13.891800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-13.891800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-14.014600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-12.983600,0.000000,-14.014600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-14.014600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-14.260400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.983600,0.000000,-14.260400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-14.260400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-14.383200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.106500,0.000000,-14.383200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-14.383200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-14.260400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-14.260400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-14.260400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-13.891800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-13.891800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-13.266200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-13.512000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,-13.512000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-13.512000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-13.634800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-13.634800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-13.634800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-13.634800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-13.634800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-13.634800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-13.512000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-13.512000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-13.512000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-13.266200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-13.266200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-13.266200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-13.143400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-13.266200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-13.143400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-13.143400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-13.143400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-13.143400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-13.634800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.983600,0.000000,-13.634800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-12.886400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-12.763600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-12.763600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-12.763600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-12.763600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-12.763600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-12.763600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-12.886400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.106500,0.000000,-12.886400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-12.886400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-12.886400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-12.886400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-12.886400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-12.763600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.860700,0.000000,-12.763600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-12.763600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-12.763600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<-12.860700,0.000000,-12.763600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-12.763600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-12.886400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,-12.886400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-12.886400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-12.886400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<-12.860700,0.000000,-12.886400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-11.272400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.395200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,-11.395200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.395200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.641000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.475100,0.000000,-11.641000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.641000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-11.763800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,-11.641000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-11.763800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-11.763800>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,-11.763800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-11.763800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-11.641000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-11.763800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-11.641000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-11.395200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-11.395200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-11.395200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-11.272400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-11.272400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-11.272400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-11.272400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-11.272400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-11.272400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-11.518100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.106500,0.000000,-11.518100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-11.015400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.015400>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.475100,0.000000,-11.015400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-11.015400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-10.646800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.475100,0.000000,-10.646800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-10.646800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-10.524000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,-10.646800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-10.524000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-10.524000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,-10.524000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-10.524000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-10.646800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.106500,0.000000,-10.524000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-10.646800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-11.015400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.983600,0.000000,-11.015400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-10.267000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-10.267000>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.475100,0.000000,-10.267000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-10.267000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-9.775600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-9.775600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-9.518600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-9.272900>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,-26.563298,0> translate<-13.229300,0.000000,-9.518600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-9.272900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-9.027200>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,26.563298,0> translate<-13.229300,0.000000,-9.027200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-8.770200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-8.647400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,-8.647400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-8.647400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-8.401600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.475100,0.000000,-8.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-8.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-8.278800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,-8.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-8.278800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-8.278800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,-8.278800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-8.278800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-8.401600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-8.278800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-8.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-8.524500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.106500,0.000000,-8.524500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-8.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-8.278800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.106500,0.000000,-8.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-8.278800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-8.278800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-12.983600,0.000000,-8.278800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-8.278800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-8.401600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-8.278800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-8.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-8.647400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,-8.647400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-8.647400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-8.770200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-8.770200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-7.273400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-6.782000>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,33.684257,0> translate<-13.475100,0.000000,-6.782000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-5.285200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-5.408000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,-5.408000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-5.408000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-5.653800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.475100,0.000000,-5.653800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-5.653800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-5.776600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,-5.653800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-5.776600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-5.776600>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,-5.776600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-5.776600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-5.653800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-5.776600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-5.653800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-5.408000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-5.408000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-5.408000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-5.285200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-5.285200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-4.905400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-4.659600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-4.659600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-4.659600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-4.536800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-4.536800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-4.536800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-4.536800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-4.536800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-4.536800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.659600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-4.659600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.659600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.905400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.229300,0.000000,-4.905400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.905400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-5.028200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-4.905400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-5.028200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-5.028200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-5.028200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-5.028200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-4.905400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-5.028200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-4.279800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.279800>}
box{<0,0,-0.038100><0.737100,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-4.279800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-4.279800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-3.911200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-3.911200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-3.911200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-3.788400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-3.911200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-3.788400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-3.788400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-3.788400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-3.788400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-3.911200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,-3.788400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-3.911200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-4.279800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,-4.279800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-3.531400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-3.531400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-3.531400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-3.531400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-3.408600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-3.531400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-3.408600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-3.040000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-3.040000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-3.040000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.615100,0.000000,-3.040000>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-3.040000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.615100,0.000000,-3.040000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-3.162800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-12.615100,0.000000,-3.040000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-3.162800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-3.285700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.492200,0.000000,-3.285700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-2.783000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.783000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-2.783000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.983600,0.000000,-2.783000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.537300>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-2.537300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.537300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.414400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-2.414400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.159400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.036600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-2.036600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-2.036600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-2.036600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-2.036600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-2.159400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-1.913700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-1.913700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.598000,0.000000,-2.036600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-2.036600>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.598000,0.000000,-2.036600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-1.414800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-1.291900>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.492200,0.000000,-1.291900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.492200,0.000000,-1.291900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.615100,0.000000,-1.169100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-12.615100,0.000000,-1.169100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.615100,0.000000,-1.169100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-1.169100>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.229300,0.000000,-1.169100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-1.169100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-1.537700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.229300,0.000000,-1.537700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-1.537700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-1.660500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-1.537700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-1.660500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-1.660500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-1.660500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-1.660500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-1.537700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,-1.660500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-1.537700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-1.169100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,-1.169100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,-0.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-0.912100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.475100,0.000000,-0.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-0.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-0.789300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,-0.789300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-0.789300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-0.543500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,-0.543500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-0.543500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-0.420700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-13.229300,0.000000,-0.543500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.106500,0.000000,-0.420700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,-0.420700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.106500,0.000000,-0.420700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,-0.040900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-0.040900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,-0.040900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,-0.040900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,0.082000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<-12.860700,0.000000,-0.040900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,-0.163700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,0.082000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.229300,0.000000,0.082000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,1.575000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,1.083600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,1.083600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,1.083600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,1.575000>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,44.997030,0> translate<-13.229300,0.000000,1.575000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,1.575000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,1.575000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,1.575000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,1.575000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.452200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,1.452200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.452200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.206400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-13.475100,0.000000,1.206400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.206400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,1.083600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,1.206400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,1.832000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,1.832000>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,1.832000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,1.832000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.954800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,1.954800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,1.954800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,2.200600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.475100,0.000000,2.200600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,2.200600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,2.323400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,2.200600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,2.323400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,2.323400>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,2.323400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,2.323400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,2.200600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,2.323400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,2.200600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,1.954800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,1.954800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,1.954800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,1.832000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,1.832000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,1.832000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,2.323400>}
box{<0,0,-0.038100><0.695015,0.036000,0.038100> rotate<0,44.991201,0> translate<-13.352200,0.000000,2.323400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.229300,0.000000,2.580400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,2.826100>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,44.985374,0> translate<-13.475100,0.000000,2.826100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,2.826100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,2.826100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.475100,0.000000,2.826100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,2.580400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,3.071800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<-12.737900,0.000000,3.071800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,3.328800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,3.328800>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,3.328800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,3.328800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,3.451600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<-13.475100,0.000000,3.451600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,3.451600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,3.697400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<-13.475100,0.000000,3.697400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.475100,0.000000,3.697400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,3.820200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<-13.475100,0.000000,3.697400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,3.820200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,3.820200>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<-13.352200,0.000000,3.820200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,3.820200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,3.697400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<-12.860700,0.000000,3.820200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,3.697400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,3.451600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-12.737900,0.000000,3.451600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.737900,0.000000,3.451600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,3.328800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-12.860700,0.000000,3.328800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-12.860700,0.000000,3.328800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-13.352200,0.000000,3.820200>}
box{<0,0,-0.038100><0.695015,0.036000,0.038100> rotate<0,44.991201,0> translate<-13.352200,0.000000,3.820200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-12.855300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-12.855300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<9.452300,0.000000,-12.855300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-12.855300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-12.609600>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-44.985374,0> translate<9.452300,0.000000,-12.855300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-12.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-12.363900>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,44.985374,0> translate<9.452300,0.000000,-12.363900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-12.363900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-12.363900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<9.452300,0.000000,-12.363900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-11.984100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-11.738300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<9.698100,0.000000,-11.738300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-11.738300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-11.615500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.698100,0.000000,-11.738300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-11.615500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-11.615500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-11.615500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-11.615500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-11.984100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.189500,0.000000,-11.984100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-11.984100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-12.106900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.066700,0.000000,-12.106900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-12.106900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-11.984100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<9.943800,0.000000,-11.984100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-11.984100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-11.615500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.943800,0.000000,-11.615500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-11.358500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-11.358500>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<9.452300,0.000000,-11.358500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-10.989900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-11.358500>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-56.309803,0> translate<9.943800,0.000000,-11.358500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-11.358500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-10.989900>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,56.309803,0> translate<9.698100,0.000000,-10.989900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-10.366300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-10.612100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.189500,0.000000,-10.612100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-10.612100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-10.734900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.066700,0.000000,-10.734900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-10.734900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-10.734900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-10.734900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-10.734900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-10.612100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-10.612100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-10.612100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-10.366300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<9.698100,0.000000,-10.366300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-10.366300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-10.243500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.698100,0.000000,-10.366300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-10.243500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-10.243500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-10.243500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-10.243500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-10.734900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.943800,0.000000,-10.734900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-9.986500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-9.986500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<9.698100,0.000000,-9.986500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-9.986500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-9.740800>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-9.740800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-9.740800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-9.617900>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<9.698100,0.000000,-9.617900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-9.362900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-9.362900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<9.452300,0.000000,-9.362900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-9.362900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-8.994300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.452300,0.000000,-8.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.452300,0.000000,-8.994300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575200,0.000000,-8.871500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<9.452300,0.000000,-8.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575200,0.000000,-8.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.871500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<9.575200,0.000000,-8.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.994300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-8.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.994300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-8.871500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<9.820900,0.000000,-8.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.943800,0.000000,-8.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.871500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<9.943800,0.000000,-8.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.994300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<10.066700,0.000000,-8.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.994300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-9.362900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.189500,0.000000,-9.362900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-9.362900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.994300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.820900,0.000000,-8.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.491700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.245900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<10.189500,0.000000,-8.245900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.123100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<10.066700,0.000000,-8.123100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.123100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.123100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-8.123100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.123100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.245900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.698100,0.000000,-8.245900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.491700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.698100,0.000000,-8.491700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-8.491700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.614500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-8.491700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-8.614500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.614500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-8.614500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-8.614500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-8.491700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.066700,0.000000,-8.614500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575200,0.000000,-7.743300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.743300>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.575200,0.000000,-7.743300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.743300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-7.620400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<10.066700,0.000000,-7.743300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-7.866100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-7.620400>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<9.698100,0.000000,-7.620400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-7.367200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.367200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<10.066700,0.000000,-7.367200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.367200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.244400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<10.066700,0.000000,-7.244400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-7.244400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-7.244400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<10.066700,0.000000,-7.244400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-7.244400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-7.367200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.189500,0.000000,-7.367200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-6.501600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-6.870200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.698100,0.000000,-6.870200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-6.870200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-6.993000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-6.870200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-6.993000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-6.993000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-6.993000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-6.993000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-6.870200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.066700,0.000000,-6.993000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-6.870200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-6.501600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<10.189500,0.000000,-6.501600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-6.121800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-5.876000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<10.189500,0.000000,-5.876000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-5.876000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-5.753200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<10.066700,0.000000,-5.753200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-5.753200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.753200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-5.753200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.753200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.876000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.698100,0.000000,-5.876000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.876000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-6.121800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.698100,0.000000,-6.121800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-6.121800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-6.244600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.698100,0.000000,-6.121800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-6.244600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-6.244600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-6.244600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.066700,0.000000,-6.244600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-6.121800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.066700,0.000000,-6.244600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-5.496200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.496200>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<9.698100,0.000000,-5.496200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.496200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.373400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<9.698100,0.000000,-5.373400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.373400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.250500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<9.698100,0.000000,-5.373400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.250500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-5.250500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-5.250500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.250500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.127600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<9.698100,0.000000,-5.127600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.698100,0.000000,-5.127600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.004800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.698100,0.000000,-5.127600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.820900,0.000000,-5.004800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.189500,0.000000,-5.004800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<9.820900,0.000000,-5.004800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-12.829900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-12.829900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<8.410900,0.000000,-12.829900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-12.829900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-12.461300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.148100,0.000000,-12.461300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-12.461300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-12.338500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.025300,0.000000,-12.338500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-12.338500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.533800,0.000000,-12.338500>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<8.533800,0.000000,-12.338500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.533800,0.000000,-12.338500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-12.461300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<8.410900,0.000000,-12.461300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-12.461300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-12.829900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.410900,0.000000,-12.829900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-11.712900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-11.958700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.148100,0.000000,-11.958700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-11.958700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-12.081500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.025300,0.000000,-12.081500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-12.081500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-12.081500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.779500,0.000000,-12.081500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-12.081500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.958700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<8.656700,0.000000,-11.958700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.958700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.712900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<8.656700,0.000000,-11.712900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.712900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-11.590100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.656700,0.000000,-11.712900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-11.590100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-11.590100>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<8.779500,0.000000,-11.590100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-11.590100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-12.081500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.902400,0.000000,-12.081500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-11.333100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-10.964500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.148100,0.000000,-10.964500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-10.964500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-10.841700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.025300,0.000000,-10.841700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-10.841700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-10.964500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<8.902400,0.000000,-10.964500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-10.964500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-11.210300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.902400,0.000000,-11.210300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-11.210300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-11.333100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<8.779500,0.000000,-11.333100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-11.333100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.210300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<8.656700,0.000000,-11.210300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-11.210300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-10.841700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.656700,0.000000,-10.841700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-10.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-10.461900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<8.656700,0.000000,-10.461900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-10.461900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-10.461900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-10.461900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-10.584700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-10.339000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<9.148100,0.000000,-10.339000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.288000,0.000000,-10.461900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-10.461900>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<8.288000,0.000000,-10.461900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-9.840100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-9.717200>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<9.393800,0.000000,-9.717200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-9.717200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.270900,0.000000,-9.594400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<9.270900,0.000000,-9.594400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.270900,0.000000,-9.594400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.594400>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-9.594400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.594400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.963000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.656700,0.000000,-9.963000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.963000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-10.085800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<8.656700,0.000000,-9.963000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-10.085800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-10.085800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.779500,0.000000,-10.085800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-10.085800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-9.963000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.025300,0.000000,-10.085800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-9.963000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-9.594400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.148100,0.000000,-9.594400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-9.337400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.337400>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-9.337400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-9.337400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-8.968800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.656700,0.000000,-8.968800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-8.968800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-8.846000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.656700,0.000000,-8.968800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-8.846000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-8.846000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.779500,0.000000,-8.846000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-7.840600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-7.840600>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<8.410900,0.000000,-7.840600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-7.840600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-7.472000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.410900,0.000000,-7.472000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.410900,0.000000,-7.472000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.533800,0.000000,-7.349200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<8.410900,0.000000,-7.472000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.533800,0.000000,-7.349200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-7.349200>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<8.533800,0.000000,-7.349200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-7.349200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-7.472000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<8.656700,0.000000,-7.349200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-7.472000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-7.349200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<8.779500,0.000000,-7.472000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.902400,0.000000,-7.349200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-7.349200>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<8.902400,0.000000,-7.349200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-7.349200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-7.472000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<9.025300,0.000000,-7.349200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-7.472000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-7.840600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.148100,0.000000,-7.840600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-7.840600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-7.472000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.779500,0.000000,-7.472000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-7.092200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-7.092200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-7.092200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-7.092200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.969400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.025300,0.000000,-7.092200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.969400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.600800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.148100,0.000000,-6.600800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-6.600800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.270900,0.000000,-6.600800>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-6.600800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.270900,0.000000,-6.600800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-6.723600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<9.270900,0.000000,-6.600800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-6.723600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393800,0.000000,-6.846500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.393800,0.000000,-6.846500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-6.343800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-6.221000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<8.656700,0.000000,-6.221000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-6.221000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-6.221000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-6.221000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-6.221000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-6.343800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.779500,0.000000,-6.343800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.779500,0.000000,-6.343800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.656700,0.000000,-6.343800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.656700,0.000000,-6.343800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-6.343800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-6.221000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<9.025300,0.000000,-6.221000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-6.221000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.221000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.025300,0.000000,-6.221000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.221000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.343800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.148100,0.000000,-6.343800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.148100,0.000000,-6.343800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.025300,0.000000,-6.343800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.025300,0.000000,-6.343800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-12.858700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<5.395900,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-12.613000>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-44.985374,0> translate<5.395900,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-12.613000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-12.367300>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,44.985374,0> translate<5.395900,0.000000,-12.367300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-12.367300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-12.367300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<5.395900,0.000000,-12.367300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-11.987500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-11.741700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-11.741700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-11.741700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-11.618900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.641700,0.000000,-11.741700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-11.618900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.618900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-11.618900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.618900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.987500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.133100,0.000000,-11.987500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.987500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-12.110300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-12.110300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-12.110300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-11.987500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<5.887400,0.000000,-11.987500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-11.987500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-11.618900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.887400,0.000000,-11.618900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-11.116200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-10.993300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<6.378800,0.000000,-10.993300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-10.993300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.255900,0.000000,-10.870500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<6.255900,0.000000,-10.870500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.255900,0.000000,-10.870500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.870500>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-10.870500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.870500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-11.239100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.641700,0.000000,-11.239100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-11.239100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-11.361900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<5.641700,0.000000,-11.239100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-11.361900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-11.361900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-11.361900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-11.361900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.239100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-11.361900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-11.239100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-10.870500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.133100,0.000000,-10.870500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-10.613500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.613500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-10.613500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.613500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.244900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-10.244900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-10.244900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-10.122100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.641700,0.000000,-10.244900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-10.122100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-10.122100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-10.122100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-9.496500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-9.742300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.133100,0.000000,-9.742300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-9.742300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-9.865100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-9.865100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-9.865100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-9.865100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-9.865100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-9.865100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-9.742300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<5.641700,0.000000,-9.742300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-9.742300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-9.496500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-9.496500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-9.496500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-9.373700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.641700,0.000000,-9.496500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-9.373700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-9.373700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-9.373700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-9.373700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-9.865100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.887400,0.000000,-9.865100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.518800,0.000000,-8.993900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-8.993900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<5.518800,0.000000,-8.993900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-8.993900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-8.871000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<6.010300,0.000000,-8.993900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-9.116700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-8.871000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-8.871000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-8.617800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-8.495000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-8.495000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-8.495000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-8.495000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-8.495000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-8.617800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-8.372100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<6.133100,0.000000,-8.372100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.273000,0.000000,-8.495000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-8.495000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<5.273000,0.000000,-8.495000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-7.627500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-7.996100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.641700,0.000000,-7.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-7.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-8.118900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<5.641700,0.000000,-7.996100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-8.118900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-8.118900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-8.118900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-8.118900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-7.996100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-8.118900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-7.996100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-7.627500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.133100,0.000000,-7.627500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-6.622100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-6.622100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<5.395900,0.000000,-6.622100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-6.622100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-6.253500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.395900,0.000000,-6.253500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.395900,0.000000,-6.253500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.518800,0.000000,-6.130700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<5.395900,0.000000,-6.253500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.518800,0.000000,-6.130700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-6.130700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<5.518800,0.000000,-6.130700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-6.130700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-6.253500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<5.764500,0.000000,-6.130700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-6.253500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-6.622100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.887400,0.000000,-6.622100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-6.376400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-6.130700>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.887400,0.000000,-6.376400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-5.750900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-5.505100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<6.133100,0.000000,-5.505100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-5.505100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.382300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<6.010300,0.000000,-5.382300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.382300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-5.382300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-5.382300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-5.382300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-5.505100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.641700,0.000000,-5.505100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-5.505100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-5.750900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.641700,0.000000,-5.750900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-5.750900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-5.873700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<5.641700,0.000000,-5.750900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-5.873700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.873700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-5.873700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.873700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-5.750900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-5.873700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.518800,0.000000,-5.002500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.002500>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<5.518800,0.000000,-5.002500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-5.002500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-4.879600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<6.010300,0.000000,-5.002500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-5.125300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-4.879600>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-4.879600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-4.503600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-4.257800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-4.257800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-4.257800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-4.135000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.641700,0.000000,-4.257800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.764500,0.000000,-4.135000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-4.135000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.764500,0.000000,-4.135000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-4.135000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-4.503600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.133100,0.000000,-4.503600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-4.503600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-4.626400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-4.626400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-4.626400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-4.503600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<5.887400,0.000000,-4.503600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-4.503600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-4.135000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.887400,0.000000,-4.135000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-3.878000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-3.878000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-3.878000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.887400,0.000000,-3.878000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-3.632300>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<5.641700,0.000000,-3.632300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-3.632300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-3.509400>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<5.641700,0.000000,-3.509400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-3.254400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-3.254400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-3.254400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.010300,0.000000,-3.254400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-3.131600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.010300,0.000000,-3.254400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-3.131600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.133100,0.000000,-2.763000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.133100,0.000000,-2.763000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.641700,0.000000,-2.763000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.255900,0.000000,-2.763000>}
box{<0,0,-0.038100><0.614200,0.036000,0.038100> rotate<0,0.000000,0> translate<5.641700,0.000000,-2.763000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.255900,0.000000,-2.763000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-2.885800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<6.255900,0.000000,-2.763000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-2.885800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.378800,0.000000,-3.008700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.378800,0.000000,-3.008700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-12.367300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-12.858700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.538900,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-12.858700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<6.538900,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-12.367300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<7.276100,0.000000,-12.367300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-12.613000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<6.907500,0.000000,-12.613000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-12.110300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-12.110300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<6.784700,0.000000,-12.110300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-12.110300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-11.741700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.784700,0.000000,-11.741700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-11.741700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-11.618900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.784700,0.000000,-11.741700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-11.618900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-11.618900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-11.618900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-10.870500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-11.239100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.784700,0.000000,-11.239100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-11.239100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-11.361900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-11.239100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-11.361900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-11.361900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-11.361900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-11.361900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-11.239100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.153300,0.000000,-11.361900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-11.239100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-10.870500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.276100,0.000000,-10.870500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-10.490700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-10.244900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<7.276100,0.000000,-10.244900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-10.244900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-10.122100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<7.153300,0.000000,-10.122100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-10.122100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-10.122100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-10.122100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-10.122100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-10.244900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.784700,0.000000,-10.244900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-10.244900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-10.490700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.784700,0.000000,-10.490700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-10.490700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-10.613500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-10.490700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-10.613500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-10.613500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-10.613500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-10.613500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-10.490700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.153300,0.000000,-10.613500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-9.373700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-9.373700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<6.538900,0.000000,-9.373700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-9.373700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-9.742300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.276100,0.000000,-9.742300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-9.742300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-9.865100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.153300,0.000000,-9.865100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-9.865100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-9.865100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-9.865100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-9.865100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-9.742300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-9.742300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-9.742300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-9.373700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.784700,0.000000,-9.373700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-8.748100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-8.993900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.276100,0.000000,-8.993900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-8.993900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-9.116700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.153300,0.000000,-9.116700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-9.116700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-9.116700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-9.116700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-9.116700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.993900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-8.993900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.993900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.748100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<6.784700,0.000000,-8.748100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.748100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-8.625300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.784700,0.000000,-8.748100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.907500,0.000000,-8.625300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.030400,0.000000,-8.625300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<6.907500,0.000000,-8.625300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.030400,0.000000,-8.625300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.030400,0.000000,-9.116700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.030400,0.000000,-9.116700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-8.368300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.368300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<6.784700,0.000000,-8.368300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.030400,0.000000,-8.368300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.122600>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-8.122600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-8.122600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-7.999700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<6.784700,0.000000,-7.999700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-6.996300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-6.750600>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,-26.563298,0> translate<6.784700,0.000000,-6.996300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-6.750600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-6.504900>}
box{<0,0,-0.038100><0.549402,0.036000,0.038100> rotate<0,26.563298,0> translate<6.784700,0.000000,-6.504900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.756500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-6.247900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.276100,0.000000,-6.247900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-6.247900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-5.756500>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,44.997030,0> translate<6.784700,0.000000,-5.756500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-5.756500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.661800,0.000000,-5.756500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<6.661800,0.000000,-5.756500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.661800,0.000000,-5.756500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-5.879300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<6.538900,0.000000,-5.879300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-5.879300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-6.125100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.538900,0.000000,-6.125100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-6.125100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.661800,0.000000,-6.247900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<6.538900,0.000000,-6.125100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.499500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-5.499500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<7.153300,0.000000,-5.499500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-5.499500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-5.376700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<7.153300,0.000000,-5.376700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.153300,0.000000,-5.376700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.376700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<7.153300,0.000000,-5.376700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.376700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.499500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.276100,0.000000,-5.499500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.784700,0.000000,-5.125300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-4.879600>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,44.985374,0> translate<6.538900,0.000000,-4.879600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.538900,0.000000,-4.879600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-4.879600>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<6.538900,0.000000,-4.879600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-5.125300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.276100,0.000000,-4.633900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<7.276100,0.000000,-4.633900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.858700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-12.735900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-12.858700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-12.735900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.613000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.868300,0.000000,-12.613000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.613000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-12.490100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<12.868300,0.000000,-12.613000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-12.490100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.367300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.868300,0.000000,-12.367300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-12.367300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-12.367300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-12.367300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-12.110300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-11.987500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-11.987500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-11.987500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-11.987500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-11.987500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-12.110300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-11.864600>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-11.864600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.131000,0.000000,-11.987500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-11.987500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<12.131000,0.000000,-11.987500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-11.611400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-11.611400>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<12.253900,0.000000,-11.611400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-11.242800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-11.611400>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-56.309803,0> translate<12.745400,0.000000,-11.611400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-11.611400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-11.242800>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,56.309803,0> translate<12.499700,0.000000,-11.242800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-10.987800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-10.865000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-10.865000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-10.865000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.865000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-10.865000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.987800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.742100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-10.742100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.131000,0.000000,-10.865000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-10.865000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<12.131000,0.000000,-10.865000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.488900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-10.488900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.868300,0.000000,-10.488900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-10.488900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-10.366100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.868300,0.000000,-10.366100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-10.366100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.366100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.868300,0.000000,-10.366100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.366100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.488900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,-10.488900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-10.114700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-10.114700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-10.114700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-10.114700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-9.991900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-9.991900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-9.991900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-9.869000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<12.499700,0.000000,-9.991900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-9.869000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-9.869000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-9.869000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-9.869000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-9.746100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.499700,0.000000,-9.746100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-9.746100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-9.623300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-9.746100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-9.623300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-9.623300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-9.623300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-9.243500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-8.997700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-8.997700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-8.997700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-8.874900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-8.997700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-8.874900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-8.874900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-8.874900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-8.874900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-9.243500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,-9.243500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-9.243500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-9.366300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-9.366300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-9.366300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-9.243500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<12.745400,0.000000,-9.243500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-9.243500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-8.874900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<12.745400,0.000000,-8.874900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-8.617900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-8.617900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<12.253900,0.000000,-8.617900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-8.249300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-8.617900>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,-56.309803,0> translate<12.745400,0.000000,-8.617900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-8.617900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-8.249300>}
box{<0,0,-0.038100><0.442984,0.036000,0.038100> rotate<0,56.309803,0> translate<12.499700,0.000000,-8.249300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-7.625700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-7.871500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,-7.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-7.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-7.994300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-7.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-7.994300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-7.994300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-7.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-7.994300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.871500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-7.871500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.871500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.625700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-7.625700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.625700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-7.502900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-7.625700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-7.502900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-7.502900>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-7.502900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-7.502900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-7.994300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.745400,0.000000,-7.994300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-7.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.245900>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-7.245900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-7.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.000200>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-7.000200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-7.000200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-6.877300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-6.877300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-6.622300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-6.622300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<12.253900,0.000000,-6.622300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-6.622300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-6.253700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-6.253700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-6.253700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-6.130900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.868300,0.000000,-6.130900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-6.130900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-6.130900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-6.130900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-6.130900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-6.253700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-6.253700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-6.253700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-6.622300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.499700,0.000000,-6.622300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-5.751100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-5.505300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-5.505300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-5.505300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.382500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.868300,0.000000,-5.382500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.382500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-5.382500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-5.382500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-5.382500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-5.505300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-5.505300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-5.505300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-5.751100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.499700,0.000000,-5.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-5.751100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-5.873900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-5.751100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-5.873900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.873900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-5.873900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.873900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-5.751100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-5.873900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.376800,0.000000,-5.002700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.002700>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<12.376800,0.000000,-5.002700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-5.002700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.879800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<12.868300,0.000000,-5.002700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-5.125500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-4.879800>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-4.879800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.626600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.626600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.868300,0.000000,-4.626600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.626600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.503800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.868300,0.000000,-4.503800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.503800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.503800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.868300,0.000000,-4.503800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.503800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.626600>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,-4.626600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-3.761000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-4.129600>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.499700,0.000000,-4.129600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-4.129600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-4.252400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-4.129600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-4.252400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.252400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-4.252400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-4.252400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.129600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-4.252400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-4.129600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-3.761000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-3.761000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-3.381200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-3.135400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.991100,0.000000,-3.135400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-3.135400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-3.012600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.868300,0.000000,-3.012600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-3.012600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-3.012600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-3.012600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-3.012600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-3.135400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-3.135400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-3.135400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-3.381200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.499700,0.000000,-3.381200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-3.381200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-3.504000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-3.381200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-3.504000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-3.504000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-3.504000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,-3.504000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-3.381200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,-3.504000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-2.755600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.755600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-2.755600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.755600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.632800>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-2.632800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.632800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-2.509900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<12.499700,0.000000,-2.632800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-2.509900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-2.509900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-2.509900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-2.509900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.387000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.499700,0.000000,-2.387000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-2.387000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-2.264200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-2.387000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-2.264200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-2.264200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-2.264200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-2.007200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,-1.515800>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,33.684257,0> translate<12.253900,0.000000,-1.515800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-1.258800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-1.258800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-1.258800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-1.258800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-1.136000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-1.136000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-1.136000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-1.013100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<12.499700,0.000000,-1.136000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-1.013100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-1.013100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-1.013100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-1.013100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.890200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<12.499700,0.000000,-0.890200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.890200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-0.767400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,-0.890200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,-0.767400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-0.767400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,-0.767400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,-0.510400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.510400>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<12.499700,0.000000,-0.510400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,-0.510400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.264700>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,-0.264700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.264700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,-0.141800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,-0.141800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,0.481800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,0.236000>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,0.236000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,0.236000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,0.113200>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.868300,0.000000,0.113200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.868300,0.000000,0.113200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,0.113200>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,0.113200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,0.113200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,0.236000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,0.236000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,0.236000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,0.481800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<12.499700,0.000000,0.481800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,0.481800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,0.604600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.499700,0.000000,0.481800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.622500,0.000000,0.604600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,0.604600>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<12.622500,0.000000,0.604600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,0.604600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.745400,0.000000,0.113200>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.745400,0.000000,0.113200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,1.353000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,0.861600>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.991100,0.000000,0.861600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.991100,0.000000,0.861600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,1.353000>}
box{<0,0,-0.038100><0.694945,0.036000,0.038100> rotate<0,44.997030,0> translate<12.499700,0.000000,1.353000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.499700,0.000000,1.353000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.376800,0.000000,1.353000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<12.376800,0.000000,1.353000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.376800,0.000000,1.353000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,1.230200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<12.253900,0.000000,1.230200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,1.230200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,0.984400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.253900,0.000000,0.984400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.253900,0.000000,0.984400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.376800,0.000000,0.861600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<12.253900,0.000000,0.984400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-12.613000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-12.613000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-12.735900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.237900,0.000000,-12.735900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<11.237900,0.000000,-12.735900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.237900,0.000000,-12.858700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.237900,0.000000,-12.613000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<11.237900,0.000000,-12.613000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-12.359800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-12.359800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-12.359800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-12.359800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-11.991200>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-11.991200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-11.991200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-11.868400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.483700,0.000000,-11.991200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-11.868400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-11.868400>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<11.606500,0.000000,-11.868400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-11.611400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-11.242800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-11.242800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-11.242800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-11.120000>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.852300,0.000000,-11.120000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-11.120000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-11.242800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<11.729400,0.000000,-11.242800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-11.242800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-11.488600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.729400,0.000000,-11.488600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-11.488600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-11.611400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<11.606500,0.000000,-11.611400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-11.611400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-11.488600>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.483700,0.000000,-11.488600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-11.488600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-11.120000>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-11.120000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.360800,0.000000,-10.740200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-10.740200>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<11.360800,0.000000,-10.740200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-10.740200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-10.617300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<11.852300,0.000000,-10.740200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-10.863000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-10.617300>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-10.617300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-10.364100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-10.364100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-10.364100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-10.364100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-10.118400>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<11.483700,0.000000,-10.118400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-10.118400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-9.995500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-9.995500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-9.740500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-9.740500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-9.740500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-9.740500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-9.617700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.852300,0.000000,-9.740500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-9.617700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-9.249100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-9.249100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-9.249100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-9.249100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-9.249100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-8.500700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-8.869300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.483700,0.000000,-8.869300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-8.869300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-8.992100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.483700,0.000000,-8.869300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-8.992100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-8.992100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.606500,0.000000,-8.992100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-8.992100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-8.869300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.852300,0.000000,-8.992100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-8.869300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-8.500700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-8.500700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.360800,0.000000,-8.120900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-8.120900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<11.360800,0.000000,-8.120900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-8.120900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.998000>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<11.852300,0.000000,-8.120900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-8.243700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.998000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-7.998000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.744800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.622000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-7.622000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.622000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.622000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-7.622000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.744800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.499100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-7.499100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.115000,0.000000,-7.622000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.237900,0.000000,-7.622000>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<11.115000,0.000000,-7.622000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.123100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-6.877300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-6.877300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-6.877300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-6.754500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.852300,0.000000,-6.754500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-6.754500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-6.754500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.606500,0.000000,-6.754500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-6.754500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.877300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.483700,0.000000,-6.877300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.877300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.123100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.483700,0.000000,-7.123100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-7.123100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-7.245900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.483700,0.000000,-7.123100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-7.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-7.245900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.606500,0.000000,-7.245900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-7.245900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-7.123100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.852300,0.000000,-7.245900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-6.497500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.497500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-6.497500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.497500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.128900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-6.128900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-6.128900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-6.006100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.483700,0.000000,-6.128900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-6.006100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-6.006100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<11.606500,0.000000,-6.006100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-5.749100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-5.380500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.975100,0.000000,-5.380500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-5.380500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-5.257700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.852300,0.000000,-5.257700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-5.257700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-5.380500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<11.729400,0.000000,-5.380500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-5.380500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-5.626300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.729400,0.000000,-5.626300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.729400,0.000000,-5.626300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-5.749100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<11.606500,0.000000,-5.749100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-5.749100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-5.626300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<11.483700,0.000000,-5.626300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-5.626300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-5.257700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-5.257700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-5.000700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-4.877900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<11.483700,0.000000,-4.877900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-4.877900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-4.877900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-4.877900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-4.877900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-5.000700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.606500,0.000000,-5.000700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.606500,0.000000,-5.000700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.483700,0.000000,-5.000700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.483700,0.000000,-5.000700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-5.000700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-4.877900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<11.852300,0.000000,-4.877900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-4.877900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-4.877900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.852300,0.000000,-4.877900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-4.877900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-5.000700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.975100,0.000000,-5.000700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.975100,0.000000,-5.000700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.852300,0.000000,-5.000700>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<11.852300,0.000000,-5.000700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.886700,0.000000,-14.897100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.886700,0.000000,-14.405700>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<-7.886700,0.000000,-14.405700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.886700,0.000000,-14.405700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.641000,0.000000,-14.159900>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-45.008687,0> translate<-7.886700,0.000000,-14.405700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.641000,0.000000,-14.159900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.395300,0.000000,-14.405700>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,45.008687,0> translate<-7.641000,0.000000,-14.159900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.395300,0.000000,-14.405700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.395300,0.000000,-14.897100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<-7.395300,0.000000,-14.897100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.886700,0.000000,-14.528500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-7.395300,0.000000,-14.528500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<-7.886700,0.000000,-14.528500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.426700,0.000000,-14.897100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.426700,0.000000,-14.159900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<-10.426700,0.000000,-14.159900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.426700,0.000000,-14.159900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.159900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-10.426700,0.000000,-14.159900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.159900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.282800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<-10.058100,0.000000,-14.159900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.282800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.405700>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<-9.935300,0.000000,-14.405700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.405700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.528500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-10.058100,0.000000,-14.528500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.528500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.651400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<-10.058100,0.000000,-14.528500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.651400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.774300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<-9.935300,0.000000,-14.774300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-9.935300,0.000000,-14.774300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.897100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<-10.058100,0.000000,-14.897100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.897100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.426700,0.000000,-14.897100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-10.426700,0.000000,-14.897100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.426700,0.000000,-14.528500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-10.058100,0.000000,-14.528500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<-10.426700,0.000000,-14.528500> }
//+ silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-1.178000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-1.178000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-1.178000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.378000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-2.378000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-2.378000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.159000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.778000,0.000000,6.032500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-2.159000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.778000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.397000,0.000000,6.032500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-1.778000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.778000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.397000,0.000000,6.667500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<-1.778000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.397000,0.000000,6.667500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.159000,0.000000,6.667500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<-2.159000,0.000000,6.667500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.159000,0.000000,6.667500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.778000,0.000000,6.032500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<-2.159000,0.000000,6.667500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.016000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.016000,0.000000,4.889500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<-1.016000,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-1.016000,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.540000,0.000000,4.889500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<-2.540000,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.540000,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.540000,0.000000,5.207000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<-2.540000,0.000000,5.207000> }
//- silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.845000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-3.845000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-3.845000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-5.045000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-5.045000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-5.045000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.826000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.445000,0.000000,6.032500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-4.826000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.445000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.064000,0.000000,6.032500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-4.445000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.445000,0.000000,6.032500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.064000,0.000000,6.667500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<-4.445000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.064000,0.000000,6.667500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.826000,0.000000,6.667500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<-4.826000,0.000000,6.667500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.826000,0.000000,6.667500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.445000,0.000000,6.032500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<-4.826000,0.000000,6.667500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.683000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.683000,0.000000,4.889500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<-3.683000,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.683000,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-5.207000,0.000000,4.889500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<-5.207000,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-5.207000,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-5.207000,0.000000,5.207000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<-5.207000,0.000000,5.207000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.763800,0.000000,-8.194600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.163800,0.000000,-8.194600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.163800,0.000000,-8.194600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.763800,0.000000,-6.994600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.163800,0.000000,-6.994600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.163800,0.000000,-6.994600> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.763800,0.000000,-10.302800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.163800,0.000000,-10.302800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.163800,0.000000,-10.302800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.763800,0.000000,-9.102800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.163800,0.000000,-9.102800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.163800,0.000000,-9.102800> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.397800,0.000000,-0.411200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.397800,0.000000,-1.011200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.397800,0.000000,-1.011200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.197800,0.000000,-0.411200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.197800,0.000000,-1.011200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.197800,0.000000,-1.011200> }
//H1 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<10.000000,0.000000,7.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<10.000000,0.000000,7.000000>}
difference{
cylinder{<10.000000,0,7.000000><10.000000,0.036000,7.000000>3.505200 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,7.000000><10.000000,0.135000,7.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<10.000000,0,7.000000><10.000000,0.036000,7.000000>0.990600 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,7.000000><10.000000,0.135000,7.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<10.000000,0,7.000000><10.000000,0.036000,7.000000>1.701600 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,7.000000><10.000000,0.135000,7.000000>1.498400 translate<0,0.000000,0>}}
//H2 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<10.000000,0.000000,-22.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<10.000000,0.000000,-22.000000>}
difference{
cylinder{<10.000000,0,-22.000000><10.000000,0.036000,-22.000000>3.505200 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,-22.000000><10.000000,0.135000,-22.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<10.000000,0,-22.000000><10.000000,0.036000,-22.000000>0.990600 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,-22.000000><10.000000,0.135000,-22.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<10.000000,0,-22.000000><10.000000,0.036000,-22.000000>1.701600 translate<0,0.000000,0>}
cylinder{<10.000000,-0.1,-22.000000><10.000000,0.135000,-22.000000>1.498400 translate<0,0.000000,0>}}
//H3 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<-10.000000,0.000000,-22.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<-10.000000,0.000000,-22.000000>}
difference{
cylinder{<-10.000000,0,-22.000000><-10.000000,0.036000,-22.000000>3.505200 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,-22.000000><-10.000000,0.135000,-22.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<-10.000000,0,-22.000000><-10.000000,0.036000,-22.000000>0.990600 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,-22.000000><-10.000000,0.135000,-22.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<-10.000000,0,-22.000000><-10.000000,0.036000,-22.000000>1.701600 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,-22.000000><-10.000000,0.135000,-22.000000>1.498400 translate<0,0.000000,0>}}
//H4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<-10.000000,0.000000,7.000000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<-10.000000,0.000000,7.000000>}
difference{
cylinder{<-10.000000,0,7.000000><-10.000000,0.036000,7.000000>3.505200 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,7.000000><-10.000000,0.135000,7.000000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<-10.000000,0,7.000000><-10.000000,0.036000,7.000000>0.990600 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,7.000000><-10.000000,0.135000,7.000000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<-10.000000,0,7.000000><-10.000000,0.036000,7.000000>1.701600 translate<0,0.000000,0>}
cylinder{<-10.000000,-0.1,7.000000><-10.000000,0.135000,7.000000>1.498400 translate<0,0.000000,0>}}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.015000,0.000000,3.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.015000,0.000000,-3.068000>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.015000,0.000000,-3.068000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.015000,0.000000,-3.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-3.015000,0.000000,-3.068000>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<-3.015000,0.000000,-3.068000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-3.015000,0.000000,-3.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-3.015000,0.000000,3.068000>}
box{<0,0,-0.101600><6.136000,0.036000,0.101600> rotate<0,90.000000,0> translate<-3.015000,0.000000,3.068000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<-3.015000,0.000000,3.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.015000,0.000000,3.068000>}
box{<0,0,-0.101600><6.030000,0.036000,0.101600> rotate<0,0.000000,0> translate<-3.015000,0.000000,3.068000> }
difference{
cylinder{<-2.365000,0,2.520000><-2.365000,0.036000,2.520000>0.491600 translate<0,0.000000,0>}
cylinder{<-2.365000,-0.1,2.520000><-2.365000,0.135000,2.520000>0.288400 translate<0,0.000000,0>}}
//QUADA silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.220000,0.000000,-12.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.220000,0.000000,-11.765000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<-8.220000,0.000000,-11.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.020000,0.000000,-12.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.020000,0.000000,-11.765000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<-7.020000,0.000000,-11.765000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.239000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.620000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-7.620000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.620000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.001000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-8.001000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.620000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.001000,0.000000,-12.382500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<-8.001000,0.000000,-12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.001000,0.000000,-12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.239000,0.000000,-12.382500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<-8.001000,0.000000,-12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.239000,0.000000,-12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-7.620000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<-7.620000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.382000,0.000000,-10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.382000,0.000000,-10.604500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<-8.382000,0.000000,-10.604500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-8.382000,0.000000,-10.604500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-6.858000,0.000000,-10.604500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<-8.382000,0.000000,-10.604500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-6.858000,0.000000,-10.604500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-6.858000,0.000000,-10.922000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<-6.858000,0.000000,-10.922000> }
//QUADB silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.760000,0.000000,-12.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.760000,0.000000,-11.765000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.760000,0.000000,-11.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.560000,0.000000,-12.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.560000,0.000000,-11.765000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<-9.560000,0.000000,-11.765000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.779000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.160000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-10.160000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.160000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.541000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<-10.541000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.160000,0.000000,-11.747500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.541000,0.000000,-12.382500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<-10.541000,0.000000,-12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.541000,0.000000,-12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.779000,0.000000,-12.382500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<-10.541000,0.000000,-12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.779000,0.000000,-12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.160000,0.000000,-11.747500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<-10.160000,0.000000,-11.747500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.922000,0.000000,-10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.922000,0.000000,-10.604500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<-10.922000,0.000000,-10.604500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-10.922000,0.000000,-10.604500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.398000,0.000000,-10.604500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<-10.922000,0.000000,-10.604500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.398000,0.000000,-10.604500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-9.398000,0.000000,-10.922000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<-9.398000,0.000000,-10.922000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.505000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.505000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.505000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.305000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.305000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.305000,0.000000,6.050000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.045000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.045000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.045000,0.000000,6.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.845000,0.000000,6.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.845000,0.000000,6.050000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.845000,0.000000,6.050000> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.020000,0.000000,-7.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-7.020000,0.000000,-8.555000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-7.020000,0.000000,-8.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.220000,0.000000,-7.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-8.220000,0.000000,-8.555000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-8.220000,0.000000,-8.555000> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.560000,0.000000,-7.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-9.560000,0.000000,-8.555000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-9.560000,0.000000,-8.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.760000,0.000000,-7.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.760000,0.000000,-8.555000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-10.760000,0.000000,-8.555000> }
//U$1 silk screen
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.121100,0.000000,-24.914400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.098900,0.000000,-24.914400>}
box{<0,0,-0.025400><0.022200,0.036000,0.025400> rotate<0,0.000000,0> translate<5.098900,0.000000,-24.914400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.133800,0.000000,-24.965200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.086200,0.000000,-24.965200>}
box{<0,0,-0.025400><0.047600,0.036000,0.025400> rotate<0,0.000000,0> translate<5.086200,0.000000,-24.965200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.146500,0.000000,-25.016000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.073500,0.000000,-25.016000>}
box{<0,0,-0.025400><0.073000,0.036000,0.025400> rotate<0,0.000000,0> translate<5.073500,0.000000,-25.016000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.159200,0.000000,-25.066800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.060800,0.000000,-25.066800>}
box{<0,0,-0.025400><0.098400,0.036000,0.025400> rotate<0,0.000000,0> translate<5.060800,0.000000,-25.066800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.171900,0.000000,-25.117600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.048100,0.000000,-25.117600>}
box{<0,0,-0.025400><0.123800,0.036000,0.025400> rotate<0,0.000000,0> translate<5.048100,0.000000,-25.117600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.184600,0.000000,-25.168400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.035400,0.000000,-25.168400>}
box{<0,0,-0.025400><0.149200,0.036000,0.025400> rotate<0,0.000000,0> translate<5.035400,0.000000,-25.168400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.197300,0.000000,-25.219200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.022700,0.000000,-25.219200>}
box{<0,0,-0.025400><0.174600,0.036000,0.025400> rotate<0,0.000000,0> translate<5.022700,0.000000,-25.219200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.210000,0.000000,-25.270000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.010000,0.000000,-25.270000>}
box{<0,0,-0.025400><0.200000,0.036000,0.025400> rotate<0,0.000000,0> translate<5.010000,0.000000,-25.270000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.222700,0.000000,-25.320800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.997300,0.000000,-25.320800>}
box{<0,0,-0.025400><0.225400,0.036000,0.025400> rotate<0,0.000000,0> translate<4.997300,0.000000,-25.320800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.235400,0.000000,-25.371600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.984600,0.000000,-25.371600>}
box{<0,0,-0.025400><0.250800,0.036000,0.025400> rotate<0,0.000000,0> translate<4.984600,0.000000,-25.371600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.248100,0.000000,-25.422400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.971900,0.000000,-25.422400>}
box{<0,0,-0.025400><0.276200,0.036000,0.025400> rotate<0,0.000000,0> translate<4.971900,0.000000,-25.422400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.260800,0.000000,-25.473200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.959200,0.000000,-25.473200>}
box{<0,0,-0.025400><0.301600,0.036000,0.025400> rotate<0,0.000000,0> translate<4.959200,0.000000,-25.473200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.273500,0.000000,-25.524000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.946500,0.000000,-25.524000>}
box{<0,0,-0.025400><0.327000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.946500,0.000000,-25.524000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.286200,0.000000,-25.574800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.933800,0.000000,-25.574800>}
box{<0,0,-0.025400><0.352400,0.036000,0.025400> rotate<0,0.000000,0> translate<4.933800,0.000000,-25.574800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.298900,0.000000,-25.625600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.921100,0.000000,-25.625600>}
box{<0,0,-0.025400><0.377800,0.036000,0.025400> rotate<0,0.000000,0> translate<4.921100,0.000000,-25.625600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.311600,0.000000,-25.676400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.908400,0.000000,-25.676400>}
box{<0,0,-0.025400><0.403200,0.036000,0.025400> rotate<0,0.000000,0> translate<4.908400,0.000000,-25.676400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.324300,0.000000,-25.727200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.895700,0.000000,-25.727200>}
box{<0,0,-0.025400><0.428600,0.036000,0.025400> rotate<0,0.000000,0> translate<4.895700,0.000000,-25.727200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.337000,0.000000,-25.778000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.883000,0.000000,-25.778000>}
box{<0,0,-0.025400><0.454000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.883000,0.000000,-25.778000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.349700,0.000000,-25.828800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.870300,0.000000,-25.828800>}
box{<0,0,-0.025400><0.479400,0.036000,0.025400> rotate<0,0.000000,0> translate<4.870300,0.000000,-25.828800> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.362400,0.000000,-25.879600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.857600,0.000000,-25.879600>}
box{<0,0,-0.025400><0.504800,0.036000,0.025400> rotate<0,0.000000,0> translate<4.857600,0.000000,-25.879600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.375100,0.000000,-25.930400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.844900,0.000000,-25.930400>}
box{<0,0,-0.025400><0.530200,0.036000,0.025400> rotate<0,0.000000,0> translate<4.844900,0.000000,-25.930400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.387800,0.000000,-25.981200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.832200,0.000000,-25.981200>}
box{<0,0,-0.025400><0.555600,0.036000,0.025400> rotate<0,0.000000,0> translate<4.832200,0.000000,-25.981200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.062500,0.000000,-15.186200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-6.320100,0.000000,-15.186200>}
box{<0,0,-0.127000><12.382600,0.036000,0.127000> rotate<0,0.000000,0> translate<-6.320100,0.000000,-15.186200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.141200,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.141200,0.000000,-17.726200>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,90.000000,0> translate<1.141200,0.000000,-17.726200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.141200,0.000000,-17.726200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-1.398800,0.000000,-17.726200>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<-1.398800,0.000000,-17.726200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-1.398800,0.000000,-17.726200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-1.398800,0.000000,-23.441200>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,-90.000000,0> translate<-1.398800,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.998700,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-23.441200>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<3.046200,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.141200,0.000000,-23.441200>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.141200,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-1.398800,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-23.441200>}
box{<0,0,-0.127000><1.905000,0.036000,0.127000> rotate<0,0.000000,0> translate<-3.303800,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-4.256300,0.000000,-23.441200>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<-4.256300,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-23.441200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-24.076200>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<3.046200,0.000000,-24.076200> }
object{ARC(1.270000,0.254000,270.000000,360.000000,0.036000) translate<1.776200,0.000000,-24.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.776200,0.000000,-25.346200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-2.033800,0.000000,-25.346200>}
box{<0,0,-0.127000><3.810000,0.036000,0.127000> rotate<0,0.000000,0> translate<-2.033800,0.000000,-25.346200> }
object{ARC(1.270000,0.254000,180.000000,270.000000,0.036000) translate<-2.033800,0.000000,-24.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-24.076200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-23.441200>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<-3.303800,0.000000,-23.441200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-14.551200>}
box{<0,0,-0.127000><2.222500,0.036000,0.127000> rotate<0,0.000000,0> translate<3.046200,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.776200,0.000000,-14.551200>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.776200,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.046200,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<3.046200,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<2.792200,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.776200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.776200,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<1.776200,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<2.030200,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.030200,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.792200,0.000000,-12.963700>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.030200,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.776200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.506200,0.000000,-14.551200>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.506200,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.506200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-0.763800,0.000000,-14.551200>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<-0.763800,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.506200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.506200,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<0.506200,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<0.252200,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-0.763800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-0.763800,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<-0.763800,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<-0.509800,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-0.509800,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.252200,0.000000,-12.963700>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<-0.509800,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-0.763800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-2.033800,0.000000,-14.551200>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<-2.033800,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-2.033800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-14.551200>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<-3.303800,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-2.033800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-2.033800,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<-2.033800,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<-2.287800,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.303800,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<-3.303800,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<-3.049800,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-3.049800,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-2.287800,0.000000,-12.963700>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<-3.049800,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.303800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-4.573800,0.000000,-14.551200>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<-4.573800,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-15.186200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-14.551200>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.268700,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-12.963700>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,90.000000,0> translate<5.268700,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.316200,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.316200,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<4.316200,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,90.000000,180.000000,0.036000) translate<4.570200,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.570200,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.268700,0.000000,-12.963700>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,0.000000,0> translate<4.570200,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-4.573800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-4.573800,0.000000,-13.217700>}
box{<0,0,-0.127000><1.333500,0.036000,0.127000> rotate<0,90.000000,0> translate<-4.573800,0.000000,-13.217700> }
object{ARC(0.254000,0.254000,0.000000,90.000000,0.036000) translate<-4.827800,0.000000,-13.217700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-4.827800,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-12.963700>}
box{<0,0,-0.127000><0.698500,0.036000,0.127000> rotate<0,0.000000,0> translate<-5.526300,0.000000,-12.963700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-12.963700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-14.551200>}
box{<0,0,-0.127000><1.587500,0.036000,0.127000> rotate<0,-90.000000,0> translate<-5.526300,0.000000,-14.551200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-15.186200>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<-5.526300,0.000000,-15.186200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-4.573800,0.000000,-14.551200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<-5.526300,0.000000,-14.551200>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<-5.526300,0.000000,-14.551200> }
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<3.681200,0.000000,-13.916200>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<1.141200,0.000000,-13.916200>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<-1.398800,0.000000,-13.916200>}
box{<-0.317500,0,-0.635000><0.317500,0.036000,0.635000> rotate<0,-180.000000,0> translate<-3.938800,0.000000,-13.916200>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAGNETIC_ROTARY_ENCODER(0.050800,0,7.492100,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//+		LED-0805
//-		LED-0805
//H1	MOUNT-HOLE3.0	3,0
//H2	MOUNT-HOLE3.0	3,0
//H3	MOUNT-HOLE3.0	3,0
//H4	MOUNT-HOLE3.0	3,0
//QUADA		LED-0805
//QUADB		LED-0805
//U$1	6.1MMHOLE	6.1MMHOLE
//U$2	CDROM	70553-04
