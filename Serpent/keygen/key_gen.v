module key_gen(clk, key, keys);
	input clk;
	input [255:0] key;
	output [(128*33-1):0] keys;
	// omega for prekey generation
	wire [31:0]
	omega_0, omega_1, omega_2, omega_3,
	omega_4, omega_5, omega_6, omega_7,
	omega_8, omega_9, omega_10, omega_11,
	omega_12, omega_13, omega_14, omega_15,
	omega_16, omega_17, omega_18, omega_19,
	omega_20, omega_21, omega_22, omega_23,
	omega_24, omega_25, omega_26, omega_27,
	omega_28, omega_29, omega_30, omega_31,
	omega_32, omega_33, omega_34, omega_35,
	omega_36, omega_37, omega_38, omega_39,
	omega_40, omega_41, omega_42, omega_43,
	omega_44, omega_45, omega_46, omega_47,
	omega_48, omega_49, omega_50, omega_51,
	omega_52, omega_53, omega_54, omega_55,
	omega_56, omega_57, omega_58, omega_59,
	omega_60, omega_61, omega_62, omega_63,
	omega_64, omega_65, omega_66, omega_67,
	omega_68, omega_69, omega_70, omega_71,
	omega_72, omega_73, omega_74, omega_75,
	omega_76, omega_77, omega_78, omega_79,
	omega_80, omega_81, omega_82, omega_83,
	omega_84, omega_85, omega_86, omega_87,
	omega_88, omega_89, omega_90, omega_91,
	omega_92, omega_93, omega_94, omega_95,
	omega_96, omega_97, omega_98, omega_99,
	omega_100, omega_101, omega_102, omega_103,
	omega_104, omega_105, omega_106, omega_107,
	omega_108, omega_109, omega_110, omega_111,
	omega_112, omega_113, omega_114, omega_115,
	omega_116, omega_117, omega_118, omega_119,
	omega_120, omega_121, omega_122, omega_123,
	omega_124, omega_125, omega_126, omega_127,
	omega_128, omega_129, omega_130, omega_131;
	get_prekey
		g0 (clk, key, 32'd0, {omega_3, omega_2, omega_1, omega_0}),
		g1 (clk, {omega_3, omega_2, omega_1, omega_0, key[255:128]}, 32'd4, {omega_7, omega_6, omega_5, omega_4}),
		g2 (clk, {omega_7, omega_6, omega_5, omega_4, omega_3, omega_2, omega_1, omega_0}, 32'd8, {omega_11, omega_10, omega_9, omega_8}),
		g3 (clk, {omega_11, omega_10, omega_9, omega_8, omega_7, omega_6, omega_5, omega_4}, 32'd12, {omega_15, omega_14, omega_13, omega_12}),
		g4 (clk, {omega_15, omega_14, omega_13, omega_12, omega_11, omega_10, omega_9, omega_8}, 32'd16, {omega_19, omega_18, omega_17, omega_16}),
		g5 (clk, {omega_19, omega_18, omega_17, omega_16, omega_15, omega_14, omega_13, omega_12}, 32'd20, {omega_23, omega_22, omega_21, omega_20}),
		g6 (clk, {omega_23, omega_22, omega_21, omega_20, omega_19, omega_18, omega_17, omega_16}, 32'd24, {omega_27, omega_26, omega_25, omega_24}),
		g7 (clk, {omega_27, omega_26, omega_25, omega_24, omega_23, omega_22, omega_21, omega_20}, 32'd28, {omega_31, omega_30, omega_29, omega_28}),
		g8 (clk, {omega_31, omega_30, omega_29, omega_28, omega_27, omega_26, omega_25, omega_24}, 32'd32, {omega_35, omega_34, omega_33, omega_32}),
		g9 (clk, {omega_35, omega_34, omega_33, omega_32, omega_31, omega_30, omega_29, omega_28}, 32'd36, {omega_39, omega_38, omega_37, omega_36}),
		g10 (clk, {omega_39, omega_38, omega_37, omega_36, omega_35, omega_34, omega_33, omega_32}, 32'd40, {omega_43, omega_42, omega_41, omega_40}),
		g11 (clk, {omega_43, omega_42, omega_41, omega_40, omega_39, omega_38, omega_37, omega_36}, 32'd44, {omega_47, omega_46, omega_45, omega_44}),
		g12 (clk, {omega_47, omega_46, omega_45, omega_44, omega_43, omega_42, omega_41, omega_40}, 32'd48, {omega_51, omega_50, omega_49, omega_48}),
		g13 (clk, {omega_51, omega_50, omega_49, omega_48, omega_47, omega_46, omega_45, omega_44}, 32'd52, {omega_55, omega_54, omega_53, omega_52}),
		g14 (clk, {omega_55, omega_54, omega_53, omega_52, omega_51, omega_50, omega_49, omega_48}, 32'd56, {omega_59, omega_58, omega_57, omega_56}),
		g15 (clk, {omega_59, omega_58, omega_57, omega_56, omega_55, omega_54, omega_53, omega_52}, 32'd60, {omega_63, omega_62, omega_61, omega_60}),
		g16 (clk, {omega_63, omega_62, omega_61, omega_60, omega_59, omega_58, omega_57, omega_56}, 32'd64, {omega_67, omega_66, omega_65, omega_64}),
		g17 (clk, {omega_67, omega_66, omega_65, omega_64, omega_63, omega_62, omega_61, omega_60}, 32'd68, {omega_71, omega_70, omega_69, omega_68}),
		g18 (clk, {omega_71, omega_70, omega_69, omega_68, omega_67, omega_66, omega_65, omega_64}, 32'd72, {omega_75, omega_74, omega_73, omega_72}),
		g19 (clk, {omega_75, omega_74, omega_73, omega_72, omega_71, omega_70, omega_69, omega_68}, 32'd76, {omega_79, omega_78, omega_77, omega_76}),
		g20 (clk, {omega_79, omega_78, omega_77, omega_76, omega_75, omega_74, omega_73, omega_72}, 32'd80, {omega_83, omega_82, omega_81, omega_80}),
		g21 (clk, {omega_83, omega_82, omega_81, omega_80, omega_79, omega_78, omega_77, omega_76}, 32'd84, {omega_87, omega_86, omega_85, omega_84}),
		g22 (clk, {omega_87, omega_86, omega_85, omega_84, omega_83, omega_82, omega_81, omega_80}, 32'd88, {omega_91, omega_90, omega_89, omega_88}),
		g23 (clk, {omega_91, omega_90, omega_89, omega_88, omega_87, omega_86, omega_85, omega_84}, 32'd92, {omega_95, omega_94, omega_93, omega_92}),
		g24 (clk, {omega_95, omega_94, omega_93, omega_92, omega_91, omega_90, omega_89, omega_88}, 32'd96, {omega_99, omega_98, omega_97, omega_96}),
		g25 (clk, {omega_99, omega_98, omega_97, omega_96, omega_95, omega_94, omega_93, omega_92}, 32'd100, {omega_103, omega_102, omega_101, omega_100}),
		g26 (clk, {omega_103, omega_102, omega_101, omega_100, omega_99, omega_98, omega_97, omega_96}, 32'd104, {omega_107, omega_106, omega_105, omega_104}),
		g27 (clk, {omega_107, omega_106, omega_105, omega_104, omega_103, omega_102, omega_101, omega_100}, 32'd108, {omega_111, omega_110, omega_109, omega_108}),
		g28 (clk, {omega_111, omega_110, omega_109, omega_108, omega_107, omega_106, omega_105, omega_104}, 32'd112, {omega_115, omega_114, omega_113, omega_112}),
		g29 (clk, {omega_115, omega_114, omega_113, omega_112, omega_111, omega_110, omega_109, omega_108}, 32'd116, {omega_119, omega_118, omega_117, omega_116}),
		g30 (clk, {omega_119, omega_118, omega_117, omega_116, omega_115, omega_114, omega_113, omega_112}, 32'd120, {omega_123, omega_122, omega_121, omega_120}),
		g31 (clk, {omega_123, omega_122, omega_121, omega_120, omega_119, omega_118, omega_117, omega_116}, 32'd124, {omega_127, omega_126, omega_125, omega_124}),
		g32 (clk, {omega_127, omega_126, omega_125, omega_124, omega_123, omega_122, omega_121, omega_120}, 32'd128, {omega_131, omega_130, omega_129, omega_128});
	
	
	// key schedule for 32 round
	wire [127:0] k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32;
	S4_box_3 sb4_0({omega_3, omega_2, omega_1, omega_0}, k0);
	S4_box_2 sb4_1({omega_7, omega_6, omega_5, omega_4}, k1);
	S4_box_1 sb4_2({omega_11, omega_10, omega_9, omega_8}, k2);
	S4_box_0 sb4_3({omega_15, omega_14, omega_13, omega_12}, k3);
	S4_box_7 sb4_4({omega_19, omega_18, omega_17, omega_16}, k4);
	S4_box_6 sb4_5({omega_23, omega_22, omega_21, omega_20}, k5);
	S4_box_5 sb4_6({omega_27, omega_26, omega_25, omega_24}, k6);
	S4_box_4 sb4_7({omega_31, omega_30, omega_29, omega_28}, k7);
	S4_box_3 sb4_8({omega_35, omega_34, omega_33, omega_32}, k8);
	S4_box_2 sb4_9({omega_39, omega_38, omega_37, omega_36}, k9);
	S4_box_1 sb4_10({omega_43, omega_42, omega_41, omega_40}, k10);
	S4_box_0 sb4_11({omega_47, omega_46, omega_45, omega_44}, k11);
	S4_box_7 sb4_12({omega_51, omega_50, omega_49, omega_48}, k12);
	S4_box_6 sb4_13({omega_55, omega_54, omega_53, omega_52}, k13);
	S4_box_5 sb4_14({omega_59, omega_58, omega_57, omega_56}, k14);
	S4_box_4 sb4_15({omega_63, omega_62, omega_61, omega_60}, k15);
	S4_box_3 sb4_16({omega_67, omega_66, omega_65, omega_64}, k16);
	S4_box_2 sb4_17({omega_71, omega_70, omega_69, omega_68}, k17);
	S4_box_1 sb4_18({omega_75, omega_74, omega_73, omega_72}, k18);
	S4_box_0 sb4_19({omega_79, omega_78, omega_77, omega_76}, k19);
	S4_box_7 sb4_20({omega_83, omega_82, omega_81, omega_80}, k20);
	S4_box_6 sb4_21({omega_87, omega_86, omega_85, omega_84}, k21);
	S4_box_5 sb4_22({omega_91, omega_90, omega_89, omega_88}, k22);
	S4_box_4 sb4_23({omega_95, omega_94, omega_93, omega_92}, k23);
	S4_box_3 sb4_24({omega_99, omega_98, omega_97, omega_96}, k24);
	S4_box_2 sb4_25({omega_103, omega_102, omega_101, omega_100}, k25);
	S4_box_1 sb4_26({omega_107, omega_106, omega_105, omega_104}, k26);
	S4_box_0 sb4_27({omega_111, omega_110, omega_109, omega_108}, k27);
	S4_box_7 sb4_28({omega_115, omega_114, omega_113, omega_112}, k28);
	S4_box_6 sb4_29({omega_119, omega_118, omega_117, omega_116}, k29);
	S4_box_5 sb4_30({omega_123, omega_122, omega_121, omega_120}, k30);
	S4_box_4 sb4_31({omega_127, omega_126, omega_125, omega_124}, k31);
	S4_box_3 sb4_32({omega_131, omega_130, omega_129, omega_128}, k32);
	
	assign keys = {k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32};
endmodule

module get_prekey (clk, last8, const_num, next4); 
	input clk;
	input [255:0] last8;
	input [31:0] const_num;
	wire [127:0] rot4;
	output reg [127:0] next4;
	
	wire [31:0] omega_i_minus_1, omega_i_minus_2, omega_i_minus_3, omega_i_minus_4,
				omega_i_minus_5, omega_i_minus_6, omega_i_minus_7, omega_i_minus_8;
	wire [31:0] temp_omega_i, temp_omega_i_plus_1, temp_omega_i_plus_2, temp_omega_i_plus_3; 
	wire [31:0] omega_i, omega_i_plus_1, omega_i_plus_2, omega_i_plus_3; 
	
	assign {omega_i_minus_1, omega_i_minus_2, omega_i_minus_3, omega_i_minus_4,
			omega_i_minus_5, omega_i_minus_6, omega_i_minus_7, omega_i_minus_8} = last8;
	
	// xor
	assign temp_omega_i        = omega_i_minus_8 ^ omega_i_minus_5 ^ omega_i_minus_3 ^ omega_i_minus_1 ^ 32'h9e3779b9 ^ (32'd0 + const_num); 
	assign omega_i             = {temp_omega_i[20:0],          temp_omega_i[31:21]  };
	assign temp_omega_i_plus_1 = omega_i_minus_7 ^ omega_i_minus_4 ^ omega_i_minus_2 ^ omega_i         ^ 32'h9e3779b9 ^ (32'd1 + const_num);  
	assign omega_i_plus_1      = {temp_omega_i_plus_1[20:0],   temp_omega_i_plus_1[31:21]  };
	assign temp_omega_i_plus_2 = omega_i_minus_6 ^ omega_i_minus_3 ^ omega_i_minus_1 ^ omega_i_plus_1  ^ 32'h9e3779b9 ^ (32'd2 + const_num); 
	assign omega_i_plus_2      = {temp_omega_i_plus_2[20:0],   temp_omega_i_plus_2[31:21]  };
	assign temp_omega_i_plus_3 = omega_i_minus_5 ^ omega_i_minus_2 ^ omega_i         ^ omega_i_plus_2  ^ 32'h9e3779b9 ^ (32'd3 + const_num);
	assign omega_i_plus_3      = {temp_omega_i_plus_3[20:0],   temp_omega_i_plus_3[31:21]  };
	
	// sample next4
	always @ (posedge clk) 
	begin
		next4 <= {omega_i_plus_3, omega_i_plus_2, omega_i_plus_1, omega_i};
	end
	
endmodule