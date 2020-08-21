module encryption (clk, input_data, keys, output_data);
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
	one_round_S0 r0 (clk, input_data, k0, s1);
	one_round_S1 r1 (clk, s1, k1, s2);
	one_round_S2 r2 (clk, s2, k2, s3);
	one_round_S3 r3 (clk, s3, k3, s4);
	one_round_S4 r4 (clk, s4, k4, s5);
	one_round_S5 r5 (clk, s5, k5, s6);
	one_round_S6 r6 (clk, s6, k6, s7);
	one_round_S7 r7 (clk, s7, k7, s8);
	one_round_S0 r8 (clk, s8, k8, s9);
	one_round_S1 r9 (clk, s9, k9, s10);
	one_round_S2 r10 (clk, s10, k10, s11);
	one_round_S3 r11 (clk, s11, k11, s12);
	one_round_S4 r12 (clk, s12, k12, s13);
	one_round_S5 r13 (clk, s13, k13, s14);
	one_round_S6 r14 (clk, s14, k14, s15);
	one_round_S7 r15 (clk, s15, k15, s16);
	one_round_S0 r16 (clk, s16, k16, s17);
	one_round_S1 r17 (clk, s17, k17, s18);
	one_round_S2 r18 (clk, s18, k18, s19);
	one_round_S3 r19 (clk, s19, k19, s20);
	one_round_S4 r20 (clk, s20, k20, s21);
	one_round_S5 r21 (clk, s21, k21, s22);
	one_round_S6 r22 (clk, s22, k22, s23);
	one_round_S7 r23 (clk, s23, k23, s24);
	one_round_S0 r24 (clk, s24, k24, s25);
	one_round_S1 r25 (clk, s25, k25, s26);
	one_round_S2 r26 (clk, s26, k26, s27);
	one_round_S3 r27 (clk, s27, k27, s28);
	one_round_S4 r28 (clk, s28, k28, s29);
	one_round_S5 r29 (clk, s29, k29, s30);
	one_round_S6 r30 (clk, s30, k30, s31);
	final_round
		r31 (clk, s31, k31, k32, output_data);
		
endmodule