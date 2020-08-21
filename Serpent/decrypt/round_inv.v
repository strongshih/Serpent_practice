// one cycle one_round
module one_round_S0_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_0 s0 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S1_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_1 s1 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S2_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_2 s2 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S3_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_3 s3 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S4_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_4 s4 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S5_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_5 s5 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S6_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_6 s6 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle one_round
module one_round_S7_inv (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_transformation;
	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	wire [31:0] X0__, X2__,
				X0_, X1_, X2_, X3_,
				X0, X1, X2, X3;
	
	// linear transformation
	assign X2__ = {input_state[85:64], input_state[95:86]};
	assign X0__ = {input_state[4:0], input_state[31:5]};
	assign X2_  = X2__ ^ input_state[127:96] ^ {input_state[56:32], 7'h0};
	assign X0_  = X0__ ^ input_state[63:32] ^ input_state[127:96];
	assign X3_  = {input_state[102:96], input_state[127:103]};
	assign X1_  = {input_state[32], input_state[63:33]};
	assign X3   = X3_ ^ X2_ ^ {X0_[28:0], 3'h0};
	assign X1   = X1_ ^ X0_ ^ X2_;
	assign X2   = {X2_[2:0], X2_[31:3]};
	assign X0   = {X0_[12:0], X0_[31:13]};
	
	assign after_transformation = {X3, X2, X1, X0};
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_transformation[0+i];
			assign after_permutation[4*i+1] = after_transformation[32+i];
			assign after_permutation[4*i+2] = after_transformation[64+i];
			assign after_permutation[4*i+3] = after_transformation[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_7 s7 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	// key mixing
	assign after_mixing = inverse_permutation^key;
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state <= after_mixing;
	end
endmodule

// one cycle final_round
module final_round_inv (clk, input_state, key1, key2, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key1;
	input [127:0] key2;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_mixing2;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key2;
	
	// permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign after_permutation[4*i+0] = after_mixing[0+i];
			assign after_permutation[4*i+1] = after_mixing[32+i];
			assign after_permutation[4*i+2] = after_mixing[64+i];
			assign after_permutation[4*i+3] = after_mixing[96+i];
		end
	endgenerate
	
	// S-box
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_sandbox
			Sinv_box_7 s7 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
		end
	endgenerate
	
	// inverse permutation
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign inverse_permutation[0+i]  = after_Sbox[4*i+0];
			assign inverse_permutation[32+i] = after_Sbox[4*i+1];
			assign inverse_permutation[64+i] = after_Sbox[4*i+2];
			assign inverse_permutation[96+i] = after_Sbox[4*i+3];
		end
	endgenerate
	
	assign after_mixing2 = inverse_permutation^key1;
	
	always @ (posedge clk) begin
		output_state <= after_mixing2;
	end
endmodule