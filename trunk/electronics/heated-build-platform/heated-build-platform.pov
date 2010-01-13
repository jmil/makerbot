//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/makerbot/trunk/electronics/heated-build-platform/heated-build-platform.brd
//1/13/10 6:57 PM

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
#local cam_y = 409;
#local cam_z = -219;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -9;
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
#local lgt1_pos_z = 50;
#local lgt1_intense = 0.836071;
#local lgt2_pos_x = -38;
#local lgt2_pos_y = 56;
#local lgt2_pos_z = 50;
#local lgt2_intense = 0.836071;
#local lgt3_pos_x = 38;
#local lgt3_pos_y = 56;
#local lgt3_pos_z = -34;
#local lgt3_intense = 0.836071;
#local lgt4_pos_x = -38;
#local lgt4_pos_y = 56;
#local lgt4_pos_z = -34;
#local lgt4_intense = 0.836071;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 100.000000;
#declare pcb_y_size = 95.250000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(487);
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
	//translate<-50.000000,0,-47.625000>
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


#macro HEATED_BUILD_PLATFORM(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><100.000000,0.000000>
<100.000000,0.000000><100.000000,95.240000>
<100.000000,95.240000><0.000000,95.250000>
<0.000000,95.250000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_LSP1) #declare global_pack_LSP1=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<98.044000,0.000000,2.794000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP1 LSP10 LSP10
#ifndef(pack_LSP2) #declare global_pack_LSP2=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<93.726000,0.000000,2.794000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP2 LSP10 LSP10
#ifndef(pack_LSP5) #declare global_pack_LSP5=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<2.032000,0.000000,2.794000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP5 LSP10 LSP10
#ifndef(pack_LSP6) #declare global_pack_LSP6=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<6.604000,0.000000,2.794000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP6 LSP10 LSP10
#ifndef(pack_LSP7) #declare global_pack_LSP7=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.816000,0.000000,1.524000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP7 LSP10 LSP10
#ifndef(pack_LSP8) #declare global_pack_LSP8=yes; object {LSP_10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<47.752000,0.000000,1.524000>}#end		//Loetoese 1.0mm Drill(solpad.lib) LSP8 LSP10 LSP10
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.784000,0.000000,24.384000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1  0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<49.784000,-1.500000,22.860000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R2  0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<49.784000,-1.500000,18.288000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 R3  1206
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.784000,0.000000,20.828000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 R4  1206
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0204_054MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.784000,0.000000,11.176000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R5  0204/5
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0204_054MM(texture{pigment{Black}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Silver_5E finish{reflection 0.1}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.784000,0.000000,15.240000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R9  0204/5
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_LSP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<98.044000,0,2.794000> texture{col_thl}}
#ifndef(global_pack_LSP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<93.726000,0,2.794000> texture{col_thl}}
#ifndef(global_pack_LSP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<2.032000,0,2.794000> texture{col_thl}}
#ifndef(global_pack_LSP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.604000,0,2.794000> texture{col_thl}}
#ifndef(global_pack_LSP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<51.816000,0,1.524000> texture{col_thl}}
#ifndef(global_pack_LSP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.159000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<47.752000,0,1.524000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.684000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.884000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.684000,-1.537000,22.860000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.884000,-1.537000,22.860000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.184000,-1.537000,18.288000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.384000,-1.537000,18.288000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.184000,0.000000,20.828000>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.384000,0.000000,20.828000>}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<52.324000,0,11.176000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.244000,0,11.176000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<52.324000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.244000,0,15.240000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.508000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.508000,0.000000,94.488000>}
box{<0,0,-0.304800><91.440000,0.035000,0.304800> rotate<0,90.000000,0> translate<0.508000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.508000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.762000,0.000000,2.794000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<0.508000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,4.572000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,-90.000000,0> translate<1.524000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.508000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.508000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.524000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.762000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.032000,0.000000,2.794000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.762000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.540000,0.000000,4.572000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<1.524000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,5.334000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.540000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.540000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.540000,0.000000,94.488000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,90.000000,0> translate<2.540000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.556000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.556000,0.000000,4.572000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.556000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,5.334000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.540000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.540000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.556000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.540000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.556000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.556000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,4.572000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.556000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,5.334000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.572000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.556000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.556000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,94.488000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,90.000000,0> translate<4.572000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,4.572000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.588000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,5.334000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.572000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.572000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.588000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,2.794000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,90.000000,0> translate<6.604000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,4.572000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.588000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,-1.535000,5.334000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.604000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.588000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,94.488000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,90.000000,0> translate<6.604000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,4.572000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,5.334000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.604000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.604000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.620000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,4.572000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.620000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,5.334000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.636000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.620000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,94.488000>}
box{<0,0,-0.304800><89.916000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.636000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,1.016000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.652000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.652000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.524000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,4.572000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,0.000000,0> translate<1.524000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,5.334000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.636000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.636000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.154000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.652000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,0.508000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<9.652000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.668000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.652000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.668000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.668000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.668000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.668000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.668000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.684000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.684000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.684000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.668000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.684000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.668000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.684000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.684000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.684000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.700000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.684000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<12.700000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.716000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.716000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.716000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.716000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.700000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.716000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.716000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.716000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.732000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.716000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<14.732000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.732000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.748000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.732000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.748000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.748000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.764000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<16.764000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.780000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.764000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.780000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.796000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.780000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.796000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.796000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.796000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<18.796000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.812000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.796000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.796000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.812000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.812000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.812000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.828000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.812000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<20.828000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.828000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.844000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.828000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<20.828000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.844000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.844000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.844000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.860000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.844000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.860000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.876000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.876000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.876000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.876000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.860000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.876000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.876000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.892000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<23.876000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.892000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.876000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.892000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.892000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.892000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.892000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.908000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.892000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.892000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<25.908000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.908000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.908000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.924000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.908000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.908000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<26.924000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.924000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.940000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.924000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.940000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.956000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.956000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.956000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.972000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.956000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.956000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.972000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.972000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.988000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<29.972000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.988000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.972000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.988000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.988000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<30.988000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.988000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.004000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.988000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.988000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.004000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.004000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.004000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.036000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.036000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.036000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.036000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.020000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.036000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.036000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.052000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.036000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.052000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.036000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.052000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.052000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.052000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.052000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.068000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.052000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.052000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.068000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.068000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.084000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.068000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<37.084000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.084000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.084000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.084000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.100000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.100000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.116000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.100000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<39.116000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.116000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<40.132000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.116000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<39.116000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.132000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.132000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.148000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.132000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<41.148000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.148000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<42.164000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.148000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.148000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.164000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.164000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.180000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.164000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.180000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.180000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.196000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.196000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.196000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.196000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.180000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<44.196000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,0.508000>}
box{<0,0,-0.304800><38.100000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.604000,0.000000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,0.508000>}
box{<0,0,-0.304800><33.020000,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.704000,0.000000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,0.508000>}
box{<0,0,-0.203200><35.052000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,33.528000>}
box{<0,0,-0.203200><33.020000,0.035000,0.203200> rotate<0,90.000000,0> translate<45.212000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.196000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.196000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,34.544000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.196000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<45.212000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,34.544000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.212000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.228000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.212000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.212000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,94.488000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,90.000000,0> translate<46.228000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,15.240000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<47.244000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,-1.535000,16.256000>}
box{<0,0,-0.304800><14.224000,0.035000,0.304800> rotate<0,90.000000,0> translate<47.244000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.228000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,-1.535000,34.544000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.244000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.228000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.228000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<47.244000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,-1.535000,1.524000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,44.997030,0> translate<47.244000,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,10.668000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,44.997030,0> translate<47.244000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.752000,0.000000,10.668000>}
box{<0,0,-0.304800><9.144000,0.035000,0.304800> rotate<0,90.000000,0> translate<47.752000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.244000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,34.544000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.244000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<48.260000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.244000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,94.488000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.260000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,0.000000,16.380000>}
box{<0,0,-0.304800><1.612203,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.244000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,-1.535000,17.396000>}
box{<0,0,-0.304800><1.612203,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.244000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,-1.535000,17.396000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,-1.535000,18.288000>}
box{<0,0,-0.304800><0.892000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.384000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,0.000000,16.380000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,0.000000,20.828000>}
box{<0,0,-0.304800><4.448000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.384000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,-1.535000,18.788000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.384000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.384000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,0.000000,21.328000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,-44.997030,0> translate<48.384000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,-1.535000,18.788000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,-1.535000,22.860000>}
box{<0,0,-0.304800><4.072000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.884000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,0.000000,21.328000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.884000,0.000000,24.384000>}
box{<0,0,-0.304800><3.056000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.884000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.260000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.276000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<48.260000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,34.544000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.276000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.276000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.276000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<49.276000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.276000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,34.544000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.276000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<50.292000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.276000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<49.276000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,94.488000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.292000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,-1.535000,18.788000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,-1.535000,22.860000>}
box{<0,0,-0.304800><4.072000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.684000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,0.000000,21.328000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,0.000000,24.384000>}
box{<0,0,-0.304800><3.056000,0.035000,0.304800> rotate<0,90.000000,0> translate<50.684000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,-1.535000,18.788000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,-1.535000,18.288000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,44.997030,0> translate<50.684000,-1.535000,18.788000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,-1.535000,17.396000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,-1.535000,18.288000>}
box{<0,0,-0.304800><0.892000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.184000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.684000,0.000000,21.328000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,0.000000,20.828000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,44.997030,0> translate<50.684000,0.000000,21.328000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,0.000000,16.380000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,0.000000,20.828000>}
box{<0,0,-0.304800><4.448000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.184000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.292000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.308000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.292000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,34.544000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.308000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.292000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.308000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.308000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.308000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.816000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.816000,0.000000,10.668000>}
box{<0,0,-0.304800><9.144000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.816000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.816000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,-1.535000,2.032000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.816000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.816000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,11.176000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<51.816000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,0.000000,16.380000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,15.240000>}
box{<0,0,-0.304800><1.612203,0.035000,0.304800> rotate<0,44.997030,0> translate<51.184000,0.000000,16.380000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,15.240000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<52.324000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.184000,-1.535000,17.396000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,-1.535000,16.256000>}
box{<0,0,-0.304800><1.612203,0.035000,0.304800> rotate<0,44.997030,0> translate<51.184000,-1.535000,17.396000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,-1.535000,16.256000>}
box{<0,0,-0.304800><14.224000,0.035000,0.304800> rotate<0,90.000000,0> translate<52.324000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.308000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,34.544000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<51.308000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<52.324000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.308000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<51.308000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,94.488000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.324000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.324000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<52.324000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,34.544000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.340000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.324000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<53.340000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,0.508000>}
box{<0,0,-0.203200><33.020000,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.356000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,33.528000>}
box{<0,0,-0.203200><9.144000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.212000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,34.544000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<53.340000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.356000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.356000,0.000000,34.544000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,-90.000000,0> translate<54.356000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.340000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.356000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<53.340000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,94.488000>}
box{<0,0,-0.203200><59.944000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.356000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.704000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.864000,0.000000,33.528000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.704000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.864000,0.000000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.864000,0.000000,33.528000>}
box{<0,0,-0.304800><33.020000,0.035000,0.304800> rotate<0,90.000000,0> translate<54.864000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.372000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.372000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.372000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.356000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.356000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.372000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.356000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,0.000000,94.488000>}
box{<0,0,-0.304800><59.944000,0.035000,0.304800> rotate<0,90.000000,0> translate<55.372000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.372000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.372000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.388000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.388000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.388000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.388000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<55.372000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<56.388000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.388000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<56.388000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<57.404000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.388000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.388000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<57.404000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.404000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.420000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.404000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<57.404000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<58.420000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.420000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.436000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<58.420000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.436000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.420000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.436000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.436000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<59.436000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.436000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<59.436000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.452000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.452000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<60.452000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.436000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.452000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<59.436000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.452000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.452000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.452000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.468000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.452000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.452000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<61.468000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<61.468000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.484000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.484000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<62.484000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.468000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.484000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<61.468000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<62.484000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.484000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.500000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<62.484000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.500000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.484000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<62.484000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.500000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.500000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<63.500000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<63.500000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.516000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.516000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<64.516000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.500000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.516000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<63.500000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<64.516000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.516000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<64.516000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.532000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.532000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<65.532000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.516000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.532000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<64.516000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<65.532000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.532000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<65.532000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.548000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.548000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.548000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.532000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.548000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<65.532000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<66.548000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.548000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<66.548000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<67.564000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.548000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<66.548000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<67.564000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.564000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<67.564000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.580000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.580000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<68.580000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.580000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<67.564000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<68.580000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.580000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<68.580000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.596000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.596000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<69.596000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.580000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.596000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<68.580000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<69.596000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.596000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.612000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<69.596000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<70.612000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.596000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<69.596000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.612000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.612000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<70.612000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.612000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.628000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<70.612000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.628000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.628000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<71.628000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.612000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.628000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<70.612000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.628000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.628000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<71.628000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.628000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.644000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<71.628000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<72.644000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.628000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<71.628000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.644000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.644000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<72.644000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.644000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.660000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<72.644000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<73.660000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.644000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<72.644000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.660000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.660000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<73.660000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.676000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<73.660000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.676000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.676000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<74.676000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.660000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.676000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<73.660000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.676000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.676000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<74.676000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.676000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.692000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<74.676000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.692000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.692000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<75.692000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.676000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.692000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<74.676000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.692000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.692000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<75.692000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.692000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.708000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<75.692000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.708000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.708000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<76.708000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.692000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.708000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<75.692000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.708000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.708000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<76.708000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.708000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.724000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<76.708000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<77.724000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.708000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<76.708000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.724000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.724000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<77.724000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.724000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<77.724000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<78.740000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.724000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<77.724000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<78.740000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<78.740000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.756000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<78.740000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.756000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.756000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<79.756000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.756000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<78.740000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.756000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.756000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<79.756000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.756000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<79.756000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.772000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.772000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<80.772000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<79.756000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.772000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<79.756000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<80.772000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<80.772000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.788000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<80.772000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.788000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.788000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<81.788000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<80.772000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.788000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<80.772000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.788000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.788000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<81.788000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<81.788000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<81.788000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.804000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.804000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<82.804000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<81.788000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.804000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<81.788000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<82.804000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<82.804000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<82.804000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<83.820000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.804000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<82.804000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<83.820000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<83.820000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.836000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<83.820000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.836000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.836000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<84.836000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<83.820000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.836000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<83.820000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.836000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.836000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<84.836000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<84.836000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.852000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<84.836000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.852000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.852000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<85.852000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<84.836000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.852000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<84.836000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.852000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.852000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<85.852000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<85.852000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<85.852000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.868000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.868000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<86.868000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<85.852000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.868000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<85.852000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<86.868000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<86.868000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<86.868000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.884000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.884000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<87.884000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<86.868000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.884000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<86.868000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<87.884000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<87.884000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.900000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<87.884000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,0.000000,1.524000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,-90.000000,0> translate<88.900000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<87.884000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<87.884000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.900000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.900000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<88.900000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<88.900000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.916000,0.000000,1.524000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<88.900000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.916000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.916000,-1.535000,1.524000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,-90.000000,0> translate<89.916000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<88.900000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.916000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<88.900000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.916000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.916000,0.000000,94.488000>}
box{<0,0,-0.304800><92.964000,0.035000,0.304800> rotate<0,90.000000,0> translate<89.916000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.864000,0.000000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,0.508000>}
box{<0,0,-0.304800><36.068000,0.035000,0.304800> rotate<0,0.000000,0> translate<54.864000,0.000000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,0.508000>}
box{<0,0,-0.304800><4.572000,0.035000,0.304800> rotate<0,-90.000000,0> translate<90.932000,0.000000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<89.916000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,1.524000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<89.916000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,6.096000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,-90.000000,0> translate<90.932000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<89.916000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<89.916000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,94.488000>}
box{<0,0,-0.203200><92.964000,0.035000,0.203200> rotate<0,90.000000,0> translate<90.932000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,4.572000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,-90.000000,0> translate<91.948000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.948000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<90.932000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<90.932000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<90.932000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.948000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.948000,0.000000,94.488000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,90.000000,0> translate<91.948000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<91.948000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.964000,-1.535000,4.572000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<91.948000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,0.000000,6.096000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,-90.000000,0> translate<92.964000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<91.948000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<91.948000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.964000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.964000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,90.000000,0> translate<92.964000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.472000,-1.535000,0.508000>}
box{<0,0,-0.203200><39.116000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.356000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.472000,-1.535000,0.508000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.726000,-1.535000,0.762000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<93.472000,-1.535000,0.508000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.726000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.726000,-1.535000,2.794000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<93.726000,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.980000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.980000,-1.535000,4.572000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,-90.000000,0> translate<93.980000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<92.964000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.980000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<92.964000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<92.964000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.980000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<92.964000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.980000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.980000,0.000000,94.488000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,90.000000,0> translate<93.980000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<93.980000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.996000,-1.535000,4.572000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<93.980000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.996000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.996000,0.000000,6.096000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,-90.000000,0> translate<94.996000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<93.980000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.996000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<93.980000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.996000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.996000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,90.000000,0> translate<94.996000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,4.572000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,-90.000000,0> translate<96.012000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<94.996000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<96.012000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<94.996000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<94.996000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<94.996000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<96.012000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<96.012000,0.000000,94.488000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,90.000000,0> translate<96.012000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<96.012000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.028000,-1.535000,4.572000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<96.012000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<97.028000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<97.028000,0.000000,6.096000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,-90.000000,0> translate<97.028000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<96.012000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<97.028000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<96.012000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.028000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.028000,-1.535000,94.488000>}
box{<0,0,-0.203200><89.916000,0.035000,0.203200> rotate<0,90.000000,0> translate<97.028000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,-1.535000,2.794000>}
box{<0,0,-0.203200><91.694000,0.035000,0.203200> rotate<0,-90.000000,0> translate<98.044000,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<97.028000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<98.044000,0.000000,6.096000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<97.028000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<97.028000,-1.535000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<98.044000,-1.535000,94.488000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<97.028000,-1.535000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<98.044000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<98.044000,0.000000,94.488000>}
box{<0,0,-0.304800><88.392000,0.035000,0.304800> rotate<0,90.000000,0> translate<98.044000,0.000000,94.488000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<90.932000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<99.060000,0.000000,5.080000>}
box{<0,0,-0.304800><8.128000,0.035000,0.304800> rotate<0,0.000000,0> translate<90.932000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<99.060000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<99.060000,0.000000,5.080000>}
box{<0,0,-0.304800><89.408000,0.035000,0.304800> rotate<0,-90.000000,0> translate<99.060000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<98.044000,0.000000,94.488000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<99.060000,0.000000,94.488000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<98.044000,0.000000,94.488000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.692300,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.692300,-1.535000,30.869600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,90.000000,0> translate<52.692300,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.692300,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.442400,-1.535000,30.869600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<52.442400,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.442400,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.442400,-1.535000,30.619700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,-90.000000,0> translate<52.442400,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.442400,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.692300,-1.535000,30.619700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<52.442400,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.873800,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.873800,-1.535000,31.869600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,90.000000,0> translate<51.873800,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.873800,-1.535000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.623900,-1.535000,32.119500>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<51.623900,-1.535000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.623900,-1.535000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.123900,-1.535000,32.119500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<51.123900,-1.535000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.123900,-1.535000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.873900,-1.535000,31.869600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<50.873900,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.873900,-1.535000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.873900,-1.535000,30.869600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,-90.000000,0> translate<50.873900,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.873900,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.123900,-1.535000,30.619700>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<50.873900,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.123900,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.623900,-1.535000,30.619700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<51.123900,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.623900,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.873800,-1.535000,30.869600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<51.623900,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.873800,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.873900,-1.535000,31.869600>}
box{<0,0,-0.139700><1.414143,0.035000,0.139700> rotate<0,44.999895,0> translate<50.873900,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.236700,-1.535000,31.619600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.736800,-1.535000,32.119500>}
box{<0,0,-0.139700><0.706965,0.035000,0.139700> rotate<0,44.997030,0> translate<49.736800,-1.535000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.736800,-1.535000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.736800,-1.535000,30.619700>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,-90.000000,0> translate<49.736800,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.236700,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.236800,-1.535000,30.619700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.236800,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.599700,-1.535000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.099700,-1.535000,31.869600>}
box{<0,0,-0.139700><0.558972,0.035000,0.139700> rotate<0,26.554131,0> translate<47.599700,-1.535000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.099700,-1.535000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.599600,-1.535000,31.369600>}
box{<0,0,-0.139700><0.707036,0.035000,0.139700> rotate<0,45.002760,0> translate<48.099700,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.599600,-1.535000,31.369600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.599600,-1.535000,30.869600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,-90.000000,0> translate<48.599600,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.599600,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.349700,-1.535000,30.619700>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<48.349700,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.349700,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.849700,-1.535000,30.619700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.849700,-1.535000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.849700,-1.535000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.599700,-1.535000,30.869600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<47.599700,-1.535000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.599700,-1.535000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.599700,-1.535000,31.119600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.599700,-1.535000,31.119600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.599700,-1.535000,31.119600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.849700,-1.535000,31.369600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.599700,-1.535000,31.119600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.849700,-1.535000,31.369600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.599600,-1.535000,31.369600>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,0.000000,0> translate<47.849700,-1.535000,31.369600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.712600,-1.535000,32.369500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.712600,-1.535000,31.869600>}
box{<0,0,-0.139700><0.499900,0.035000,0.139700> rotate<0,-90.000000,0> translate<46.712600,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.712600,-1.535000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.962500,-1.535000,31.619600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,45.008491,0> translate<46.712600,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.212600,-1.535000,32.369500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.212600,-1.535000,31.869600>}
box{<0,0,-0.139700><0.499900,0.035000,0.139700> rotate<0,-90.000000,0> translate<46.212600,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.212600,-1.535000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.462600,-1.535000,31.619600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<46.212600,-1.535000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.184300,-1.535000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.684400,-1.535000,29.579500>}
box{<0,0,-0.139700><0.706965,0.035000,0.139700> rotate<0,44.997030,0> translate<51.684400,-1.535000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.684400,-1.535000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.684400,-1.535000,28.079700>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,-90.000000,0> translate<51.684400,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.184300,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.184400,-1.535000,28.079700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<51.184400,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.547300,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.547200,-1.535000,28.079700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.547300,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.547200,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.547300,-1.535000,29.079600>}
box{<0,0,-0.139700><1.414072,0.035000,0.139700> rotate<0,44.997030,0> translate<49.547300,-1.535000,29.079600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.547300,-1.535000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.547300,-1.535000,29.329600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<49.547300,-1.535000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.547300,-1.535000,29.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.797300,-1.535000,29.579500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<49.547300,-1.535000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.797300,-1.535000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.297300,-1.535000,29.579500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<49.797300,-1.535000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.297300,-1.535000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.547200,-1.535000,29.329600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<50.297300,-1.535000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.910100,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.910100,-1.535000,28.329600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,90.000000,0> translate<48.910100,-1.535000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.910100,-1.535000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.660200,-1.535000,28.329600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<48.660200,-1.535000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.660200,-1.535000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.660200,-1.535000,28.079700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,-90.000000,0> translate<48.660200,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.660200,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.910100,-1.535000,28.079700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<48.660200,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.091700,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.091600,-1.535000,28.079700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<47.091700,-1.535000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.091600,-1.535000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.091700,-1.535000,29.079600>}
box{<0,0,-0.139700><1.414072,0.035000,0.139700> rotate<0,44.997030,0> translate<47.091700,-1.535000,29.079600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.091700,-1.535000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.091700,-1.535000,29.329600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.091700,-1.535000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.091700,-1.535000,29.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.341700,-1.535000,29.579500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<47.091700,-1.535000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.341700,-1.535000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.841700,-1.535000,29.579500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.341700,-1.535000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.841700,-1.535000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.091600,-1.535000,29.329600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<47.841700,-1.535000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.426400,-1.535000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.926400,-1.535000,26.047700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<50.926400,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.926400,-1.535000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.676400,-1.535000,26.297600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<50.676400,-1.535000,26.297600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.676400,-1.535000,26.297600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.676400,-1.535000,26.797600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,90.000000,0> translate<50.676400,-1.535000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.676400,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.926400,-1.535000,27.047600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<50.676400,-1.535000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.926400,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.426400,-1.535000,27.047600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<50.926400,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.426400,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.676300,-1.535000,26.797600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,45.008491,0> translate<51.426400,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.676300,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.676300,-1.535000,26.297600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,-90.000000,0> translate<51.676300,-1.535000,26.297600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.676300,-1.535000,26.297600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.426400,-1.535000,26.047700>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<51.426400,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.039200,-1.535000,27.547500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.039200,-1.535000,26.047700>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,-90.000000,0> translate<50.039200,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.039200,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.789300,-1.535000,27.047600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,45.008491,0> translate<49.789300,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.789300,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.289300,-1.535000,27.047600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<49.289300,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.289300,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.039300,-1.535000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<49.039300,-1.535000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.039300,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.039300,-1.535000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<49.039300,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.402100,-1.535000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.402100,-1.535000,27.047600>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,90.000000,0> translate<48.402100,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.402100,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.152200,-1.535000,27.047600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<48.152200,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.152200,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.902200,-1.535000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.902200,-1.535000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.902200,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.902200,-1.535000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<47.902200,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.902200,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.652200,-1.535000,27.047600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<47.652200,-1.535000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.652200,-1.535000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.402200,-1.535000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.402200,-1.535000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.402200,-1.535000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.402200,-1.535000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<47.402200,-1.535000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,29.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,29.579500>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.383700,0.000000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,29.579500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.633600,0.000000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,29.329600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<48.133600,0.000000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,29.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,29.079600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,-90.000000,0> translate<48.383600,0.000000,29.079600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,28.829600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<48.133600,0.000000,28.829600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,28.829600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,28.579600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<48.133600,0.000000,28.829600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,28.579600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,28.329600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,-90.000000,0> translate<48.383600,0.000000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,28.079700>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<48.133600,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,28.079700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.633600,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,28.329600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<47.383700,0.000000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,28.579600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.383700,0.000000,28.579600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,28.579600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,28.829600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-45.008491,0> translate<47.383700,0.000000,28.579600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,28.829600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,29.079600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,45.008491,0> translate<47.383700,0.000000,29.079600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,29.329600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.383700,0.000000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,28.829600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,28.829600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.633600,0.000000,28.829600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,28.329600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,90.000000,0> translate<49.020800,0.000000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,28.329600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.020800,0.000000,28.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,28.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,28.079700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,-90.000000,0> translate<49.270700,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,28.079700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.020800,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.839200,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.839300,0.000000,28.079700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.839300,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.839300,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.839200,0.000000,29.079600>}
box{<0,0,-0.139700><1.414072,0.035000,0.139700> rotate<0,-44.997030,0> translate<49.839300,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.839200,0.000000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.839200,0.000000,29.329600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<50.839200,0.000000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.839200,0.000000,29.329600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.589200,0.000000,29.579500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<50.589200,0.000000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.589200,0.000000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.089200,0.000000,29.579500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<50.089200,0.000000,29.579500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.089200,0.000000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.839300,0.000000,29.329600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<49.839300,0.000000,29.329600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.476400,0.000000,29.079600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.976300,0.000000,29.579500>}
box{<0,0,-0.139700><0.706965,0.035000,0.139700> rotate<0,-44.997030,0> translate<51.476400,0.000000,29.079600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.976300,0.000000,29.579500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.976300,0.000000,28.079700>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,-90.000000,0> translate<51.976300,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.476400,0.000000,28.079700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.476300,0.000000,28.079700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<51.476400,0.000000,28.079700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,26.047700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.633600,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,26.297600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<48.133600,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,26.297600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,26.797600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,90.000000,0> translate<48.383600,0.000000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.383600,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,27.047600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<48.133600,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.133600,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,27.047600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.633600,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,26.797600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-45.008491,0> translate<47.383700,0.000000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,26.297600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,-90.000000,0> translate<47.383700,0.000000,26.297600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.383700,0.000000,26.297600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.633600,0.000000,26.047700>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<47.383700,0.000000,26.297600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,27.547500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,26.047700>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,-90.000000,0> translate<49.020800,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.020800,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,27.047600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-45.008491,0> translate<49.020800,0.000000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.270700,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.770700,0.000000,27.047600>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<49.270700,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.770700,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.020700,0.000000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<49.770700,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.020700,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.020700,0.000000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<50.020700,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.657900,0.000000,26.047700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.657900,0.000000,27.047600>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,90.000000,0> translate<50.657900,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.657900,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.907800,0.000000,27.047600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<50.657900,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.907800,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.157800,0.000000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<50.907800,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.157800,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.157800,0.000000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<51.157800,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.157800,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.407800,0.000000,27.047600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<51.157800,0.000000,26.797600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.407800,0.000000,27.047600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.657800,0.000000,26.797600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,44.997030,0> translate<51.407800,0.000000,27.047600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.657800,0.000000,26.797600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.657800,0.000000,26.047700>}
box{<0,0,-0.139700><0.749900,0.035000,0.139700> rotate<0,-90.000000,0> translate<51.657800,0.000000,26.047700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.875700,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.875700,0.000000,30.869600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,90.000000,0> translate<46.875700,0.000000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.875700,0.000000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.125600,0.000000,30.869600>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<46.875700,0.000000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.125600,0.000000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.125600,0.000000,30.619700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,-90.000000,0> translate<47.125600,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.125600,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<46.875700,0.000000,30.619700>}
box{<0,0,-0.139700><0.249900,0.035000,0.139700> rotate<0,0.000000,0> translate<46.875700,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.694200,0.000000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.694200,0.000000,31.869600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.694200,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.694200,0.000000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.944100,0.000000,32.119500>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.694200,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.944100,0.000000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.444100,0.000000,32.119500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.944100,0.000000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.444100,0.000000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.694100,0.000000,31.869600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<48.444100,0.000000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.694100,0.000000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.694100,0.000000,30.869600>}
box{<0,0,-0.139700><1.000000,0.035000,0.139700> rotate<0,-90.000000,0> translate<48.694100,0.000000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.694100,0.000000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.444100,0.000000,30.619700>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-44.985569,0> translate<48.444100,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.444100,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.944100,0.000000,30.619700>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<47.944100,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.944100,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.694200,0.000000,30.869600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,44.997030,0> translate<47.694200,0.000000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.694200,0.000000,30.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.694100,0.000000,31.869600>}
box{<0,0,-0.139700><1.414143,0.035000,0.139700> rotate<0,-44.999895,0> translate<47.694200,0.000000,30.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.331200,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.331300,0.000000,30.619700>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<49.331300,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.331300,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.331200,0.000000,31.619600>}
box{<0,0,-0.139700><1.414072,0.035000,0.139700> rotate<0,-44.997030,0> translate<49.331300,0.000000,30.619700> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.331200,0.000000,31.619600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.331200,0.000000,31.869600>}
box{<0,0,-0.139700><0.250000,0.035000,0.139700> rotate<0,90.000000,0> translate<50.331200,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.331200,0.000000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.081200,0.000000,32.119500>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,44.985569,0> translate<50.081200,0.000000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.081200,0.000000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.581200,0.000000,32.119500>}
box{<0,0,-0.139700><0.500000,0.035000,0.139700> rotate<0,0.000000,0> translate<49.581200,0.000000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.581200,0.000000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<49.331300,0.000000,31.869600>}
box{<0,0,-0.139700><0.353412,0.035000,0.139700> rotate<0,-44.997030,0> translate<49.331300,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.718300,0.000000,30.619700>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.718300,0.000000,32.119500>}
box{<0,0,-0.139700><1.499800,0.035000,0.139700> rotate<0,90.000000,0> translate<51.718300,0.000000,32.119500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.718300,0.000000,32.119500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.968400,0.000000,31.369600>}
box{<0,0,-0.139700><1.060519,0.035000,0.139700> rotate<0,-44.997030,0> translate<50.968400,0.000000,31.369600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<50.968400,0.000000,31.369600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<51.968300,0.000000,31.369600>}
box{<0,0,-0.139700><0.999900,0.035000,0.139700> rotate<0,0.000000,0> translate<50.968400,0.000000,31.369600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.855400,0.000000,32.369500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.855400,0.000000,31.869600>}
box{<0,0,-0.139700><0.499900,0.035000,0.139700> rotate<0,-90.000000,0> translate<52.855400,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.855400,0.000000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<52.605500,0.000000,31.619600>}
box{<0,0,-0.139700><0.353483,0.035000,0.139700> rotate<0,-45.008491,0> translate<52.605500,0.000000,31.619600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<53.355400,0.000000,32.369500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<53.355400,0.000000,31.869600>}
box{<0,0,-0.139700><0.499900,0.035000,0.139700> rotate<0,-90.000000,0> translate<53.355400,0.000000,31.869600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<53.355400,0.000000,31.869600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<53.105400,0.000000,31.619600>}
box{<0,0,-0.139700><0.353553,0.035000,0.139700> rotate<0,-44.997030,0> translate<53.105400,0.000000,31.619600> }
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
cylinder{<98.044000,0.038000,2.794000><98.044000,-1.538000,2.794000>0.508000}
cylinder{<93.726000,0.038000,2.794000><93.726000,-1.538000,2.794000>0.508000}
cylinder{<2.032000,0.038000,2.794000><2.032000,-1.538000,2.794000>0.508000}
cylinder{<6.604000,0.038000,2.794000><6.604000,-1.538000,2.794000>0.508000}
cylinder{<51.816000,0.038000,1.524000><51.816000,-1.538000,1.524000>0.508000}
cylinder{<47.752000,0.038000,1.524000><47.752000,-1.538000,1.524000>0.508000}
cylinder{<52.324000,0.038000,11.176000><52.324000,-1.538000,11.176000>0.406400}
cylinder{<47.244000,0.038000,11.176000><47.244000,-1.538000,11.176000>0.406400}
cylinder{<52.324000,0.038000,15.240000><52.324000,-1.538000,15.240000>0.406400}
cylinder{<47.244000,0.038000,15.240000><47.244000,-1.538000,15.240000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//LSP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.774000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.774000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<96.774000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.314000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.314000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.314000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.314000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.187000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.187000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.314000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.187000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.187000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.774000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.774000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.774000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.774000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.187000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.679000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.679000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,3.048000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.409000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.187000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.679000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.409000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.901000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<96.901000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.409000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.679000,0.000000,2.540000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.409000,0.000000,2.540000> }
//LSP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<92.456000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.996000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.996000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.996000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.996000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.869000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.869000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.996000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.869000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.869000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.583000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.456000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.583000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.456000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.869000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.361000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.583000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.583000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.361000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,3.048000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.091000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.869000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<94.361000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<93.091000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<92.583000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<92.583000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<93.091000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.361000,0.000000,2.540000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<93.091000,0.000000,2.540000> }
//LSP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.762000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.302000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.175000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.762000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.762000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.762000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.889000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.667000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,3.048000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.397000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.667000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.397000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.889000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.889000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.397000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.667000,0.000000,2.540000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.397000,0.000000,2.540000> }
//LSP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.334000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.874000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,2.540000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.334000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,3.048000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.334000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.239000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,3.048000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,2.540000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.969000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,3.048000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,2.540000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,2.540000> }
//LSP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.546000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.086000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,1.778000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.959000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,1.270000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.959000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,1.270000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.546000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,1.778000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.546000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.778000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.673000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.451000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.673000,0.000000,1.778000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.673000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,1.270000> }
//LSP8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.022000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.022000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.022000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.022000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,1.778000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.022000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,1.270000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.270000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.482000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.778000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.482000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.778000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.387000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.387000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.117000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.387000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.270000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.117000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,1.778000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.387000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.117000,0.000000,1.270000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.084000,0.000000,23.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.484000,0.000000,23.784000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.484000,0.000000,23.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.084000,0.000000,24.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.484000,0.000000,24.984000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.484000,0.000000,24.984000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.084000,-1.536000,23.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.484000,-1.536000,23.460000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.484000,-1.536000,23.460000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.084000,-1.536000,22.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.484000,-1.536000,22.260000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.484000,-1.536000,22.260000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.749000,-1.536000,19.075000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.819000,-1.536000,19.075000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<48.819000,-1.536000,19.075000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.749000,-1.536000,17.501000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.819000,-1.536000,17.501000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<48.819000,-1.536000,17.501000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<51.110600,-1.536000,18.287100>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<48.457300,-1.536000,18.288900>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.749000,0.000000,20.041000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.819000,0.000000,20.041000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<48.819000,0.000000,20.041000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.749000,0.000000,21.615000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.819000,0.000000,21.615000>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,0.000000,0> translate<48.819000,0.000000,21.615000> }
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<51.110600,0.000000,20.828900>}
box{<-0.375000,0,-0.850000><0.375000,0.036000,0.850000> rotate<0,-180.000000,0> translate<48.457300,0.000000,20.827100>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.244000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.752000,0.000000,11.176000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<47.244000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.324000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.816000,0.000000,11.176000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<51.816000,0.000000,11.176000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.308000,0.000000,10.541000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.308000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.260000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.260000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,10.541000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.562000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,10.287000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,10.287000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.927000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,12.065000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,12.065000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.927000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,10.287000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.514000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,10.414000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,12.065000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.514000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,11.938000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,10.287000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,12.065000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,10.541000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.006000,0.000000,10.541000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<51.689000,0.000000,11.176000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<47.879000,0.000000,11.176000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.244000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.752000,0.000000,15.240000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<47.244000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.324000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<51.816000,0.000000,15.240000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<51.816000,0.000000,15.240000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.308000,0.000000,14.605000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.308000,0.000000,15.875000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.260000,0.000000,15.875000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.260000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.562000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,14.351000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,14.351000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.927000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,16.129000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.054000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,16.129000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.927000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,14.351000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.514000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,14.478000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,16.129000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.514000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,16.002000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.641000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,14.351000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,16.129000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.260000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.006000,0.000000,14.605000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<51.689000,0.000000,15.240000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<47.879000,0.000000,15.240000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  HEATED_BUILD_PLATFORM(-50.000000,0,-47.625000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
