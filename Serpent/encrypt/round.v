// one cycle one_round
module one_round_S0 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_0 s0 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S1 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_1 s1 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S2 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_2 s2 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S3 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_3 s3 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S4 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_4 s4 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S5 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_5 s5 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S6 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_6 s6 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle one_round
module one_round_S7 (clk, input_state, key, output_state);
	input clk;
	input [127:0] input_state;
	input [127:0] key;
	output reg [127:0] output_state;

	wire [127:0] after_mixing;
	wire [127:0] after_Sbox;
	
	wire [127:0] after_permutation;
	wire [127:0] inverse_permutation;
	
	// key mixing
	assign after_mixing = input_state^key;
	
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
			S_box_7 s7 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	wire [31:0] X0__, X1__, X2__, X3__,
				X0_, X1_, X2_, X3_;
	
	// linear transformation 1
	assign X0__ = {inverse_permutation[18:0], inverse_permutation[31:19]}; // X0
	assign X2__ = {inverse_permutation[92:64], inverse_permutation[95:93]}; // X2
	assign X1__ = inverse_permutation[63:32]  ^ X0__  ^ X2__; // X1
	assign X3__ = inverse_permutation[127:96] ^ X2__ ^ {X0__[28:0], 3'h0}; // X3
	
	// linear transformation 2
	assign X1_  = {X1__[30:0], X1__[31]}; // X1
	assign X3_  = {X3__[24:0], X3__[31:25]}; // X3
	assign X0_  = X0__ ^ X1_ ^ X3_; // X0
	assign X2_  = X2__ ^ X3_ ^ {X1_[24:0], 7'h0}; // X2
	
	// linear transformation 3
	always @ (posedge clk) begin
		output_state[31:0]   <= {X0_[26:0], X0_[31:27]}; // X0
		output_state[95:64]  <= {X2_[9:0], X2_[31:10]}; // X2
		output_state[63:32]  <= X1_; // X1
		output_state[127:96] <= X3_; // X3
	end
endmodule

// one cycle final_round
module final_round (clk, input_state, key1, key2, output_state);
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
	assign after_mixing = input_state^key1;
	
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
			S_box_7 s7 (after_permutation[3+4*i:0+4*i], after_Sbox[3+4*i:0+4*i]);
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
	
	assign after_mixing2 = inverse_permutation^key2;
	
	always @ (posedge clk) begin
		output_state <= after_mixing2;
	end
endmodule