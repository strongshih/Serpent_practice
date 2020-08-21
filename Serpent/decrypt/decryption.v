module decryption (clk, input_data, keys, output_data);
	input clk;
	input [127:0] input_data;
	input [(128*33-1):0] keys;
	output [127:0] output_data;
	wire [127:0] after_permutation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32;
	assign {k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32} = keys;
	
	// initial permutation of input 
	genvar i;
	
	// 32 rounds
	wire [127:0]
	s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32;

	final_round_inv
		r31 (clk, input_data, k31, k32, s31);
	one_round_S6_inv r30 (clk, s31, k30, s30);
	one_round_S5_inv r29 (clk, s30, k29, s29);
	one_round_S4_inv r28 (clk, s29, k28, s28);
	one_round_S3_inv r27 (clk, s28, k27, s27);
	one_round_S2_inv r26 (clk, s27, k26, s26);
	one_round_S1_inv r25 (clk, s26, k25, s25);
	one_round_S0_inv r24 (clk, s25, k24, s24);
	one_round_S7_inv r23 (clk, s24, k23, s23);
	one_round_S6_inv r22 (clk, s23, k22, s22);
	one_round_S5_inv r21 (clk, s22, k21, s21);
	one_round_S4_inv r20 (clk, s21, k20, s20);
	one_round_S3_inv r19 (clk, s20, k19, s19);
	one_round_S2_inv r18 (clk, s19, k18, s18);
	one_round_S1_inv r17 (clk, s18, k17, s17);
	one_round_S0_inv r16 (clk, s17, k16, s16);
	one_round_S7_inv r15 (clk, s16, k15, s15);
	one_round_S6_inv r14 (clk, s15, k14, s14);
	one_round_S5_inv r13 (clk, s14, k13, s13);
	one_round_S4_inv r12 (clk, s13, k12, s12);
	one_round_S3_inv r11 (clk, s12, k11, s11);
	one_round_S2_inv r10 (clk, s11, k10, s10);
	one_round_S1_inv r9 (clk, s10, k9, s9);
	one_round_S0_inv r8 (clk, s9, k8, s8);
	one_round_S7_inv r7 (clk, s8, k7, s7);
	one_round_S6_inv r6 (clk, s7, k6, s6);
	one_round_S5_inv r5 (clk, s6, k5, s5);
	one_round_S4_inv r4 (clk, s5, k4, s4);
	one_round_S3_inv r3 (clk, s4, k3, s3);
	one_round_S2_inv r2 (clk, s3, k2, s2);
	one_round_S1_inv r1 (clk, s2, k1, s1);
	one_round_S0_inv r0 (clk, s1, k0, output_data);	
endmodule