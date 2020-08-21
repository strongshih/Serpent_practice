module S4_box_0 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_0 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_1 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_1 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_2 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_2 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_3 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_3 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_4 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_4 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_5 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_5 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_6 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_6 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S4_box_7 (input_data, output_data);
	input [127:0] input_data;
	output [127:0] output_data;
	
	wire [127:0] per_input;
	wire [127:0] per_output;
	
	genvar i;
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation
			assign per_input[4*i+0] = input_data[0+i];
			assign per_input[4*i+1] = input_data[32+i];
			assign per_input[4*i+2] = input_data[64+i];
			assign per_input[4*i+3] = input_data[96+i];
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1)
		begin: gen_Sbox_mapping
			S_box_7 sb (per_input[4*(i+1)-1:4*i], per_output[4*(i+1)-1:4*i]);
		end
	endgenerate
	
	generate
		for (i=0; i<32; i=i+1) 
		begin: gen_permutation2
			assign output_data[0+i]  = per_output[4*i+0];
			assign output_data[32+i] = per_output[4*i+1];
			assign output_data[64+i] = per_output[4*i+2];
			assign output_data[96+i] = per_output[4*i+3];
		end
	endgenerate
endmodule

module S_box_0 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd3;
			4'd1:  output_data = 4'd8;
			4'd2:  output_data = 4'd15;
			4'd3:  output_data = 4'd1;
			4'd4:  output_data = 4'd10;
			4'd5:  output_data = 4'd6;
			4'd6:  output_data = 4'd5;
			4'd7:  output_data = 4'd11;
			4'd8:  output_data = 4'd14;
			4'd9:  output_data = 4'd13;
			4'd10: output_data = 4'd4;
			4'd11: output_data = 4'd2;
			4'd12: output_data = 4'd7;
			4'd13: output_data = 4'd0;
			4'd14: output_data = 4'd9;
			4'd15: output_data = 4'd12;
		endcase
	end
endmodule

module S_box_1 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd15;
			4'd1:  output_data = 4'd12;
			4'd2:  output_data = 4'd2;
			4'd3:  output_data = 4'd7;
			4'd4:  output_data = 4'd9;
			4'd5:  output_data = 4'd0;
			4'd6:  output_data = 4'd5;
			4'd7:  output_data = 4'd10;
			4'd8:  output_data = 4'd1;
			4'd9:  output_data = 4'd11;
			4'd10: output_data = 4'd14;
			4'd11: output_data = 4'd8;
			4'd12: output_data = 4'd6;
			4'd13: output_data = 4'd13;
			4'd14: output_data = 4'd3;
			4'd15: output_data = 4'd4;
		endcase
	end
endmodule

module S_box_2 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd8;
			4'd1:  output_data = 4'd6;
			4'd2:  output_data = 4'd7;
			4'd3:  output_data = 4'd9;
			4'd4:  output_data = 4'd3;
			4'd5:  output_data = 4'd12;
			4'd6:  output_data = 4'd10;
			4'd7:  output_data = 4'd15;
			4'd8:  output_data = 4'd13;
			4'd9:  output_data = 4'd1;
			4'd10: output_data = 4'd14;
			4'd11: output_data = 4'd4;
			4'd12: output_data = 4'd0;
			4'd13: output_data = 4'd11;
			4'd14: output_data = 4'd5;
			4'd15: output_data = 4'd2;
		endcase
	end
endmodule

module S_box_3 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd0;
			4'd1:  output_data = 4'd15;
			4'd2:  output_data = 4'd11;
			4'd3:  output_data = 4'd8;
			4'd4:  output_data = 4'd12;
			4'd5:  output_data = 4'd9;
			4'd6:  output_data = 4'd6;
			4'd7:  output_data = 4'd3;
			4'd8:  output_data = 4'd13;
			4'd9:  output_data = 4'd1;
			4'd10: output_data = 4'd2;
			4'd11: output_data = 4'd4;
			4'd12: output_data = 4'd10;
			4'd13: output_data = 4'd7;
			4'd14: output_data = 4'd5;
			4'd15: output_data = 4'd14;
		endcase
	end
endmodule

module S_box_4 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd1;
			4'd1:  output_data = 4'd15;
			4'd2:  output_data = 4'd8;
			4'd3:  output_data = 4'd3;
			4'd4:  output_data = 4'd12;
			4'd5:  output_data = 4'd0;
			4'd6:  output_data = 4'd11;
			4'd7:  output_data = 4'd6;
			4'd8:  output_data = 4'd2;
			4'd9:  output_data = 4'd5;
			4'd10: output_data = 4'd4;
			4'd11: output_data = 4'd10;
			4'd12: output_data = 4'd9;
			4'd13: output_data = 4'd14;
			4'd14: output_data = 4'd7;
			4'd15: output_data = 4'd13;
		endcase
	end
endmodule

module S_box_5 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd15;
			4'd1:  output_data = 4'd5;
			4'd2:  output_data = 4'd2;
			4'd3:  output_data = 4'd11;
			4'd4:  output_data = 4'd4;
			4'd5:  output_data = 4'd10;
			4'd6:  output_data = 4'd9;
			4'd7:  output_data = 4'd12;
			4'd8:  output_data = 4'd0;
			4'd9:  output_data = 4'd3;
			4'd10: output_data = 4'd14;
			4'd11: output_data = 4'd8;
			4'd12: output_data = 4'd13;
			4'd13: output_data = 4'd6;
			4'd14: output_data = 4'd7;
			4'd15: output_data = 4'd1;
		endcase
	end
endmodule

module S_box_6 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd7;
			4'd1:  output_data = 4'd2;
			4'd2:  output_data = 4'd12;
			4'd3:  output_data = 4'd5;
			4'd4:  output_data = 4'd8;
			4'd5:  output_data = 4'd4;
			4'd6:  output_data = 4'd6;
			4'd7:  output_data = 4'd11;
			4'd8:  output_data = 4'd14;
			4'd9:  output_data = 4'd9;
			4'd10: output_data = 4'd1;
			4'd11: output_data = 4'd15;
			4'd12: output_data = 4'd13;
			4'd13: output_data = 4'd3;
			4'd14: output_data = 4'd10;
			4'd15: output_data = 4'd0;
		endcase
	end
endmodule

module S_box_7 (input_data, output_data);
	input [3:0] input_data;
	output reg [3:0] output_data;
	
	always @ (*) begin
		case (input_data)
			4'd0:  output_data = 4'd1;
			4'd1:  output_data = 4'd13;
			4'd2:  output_data = 4'd15;
			4'd3:  output_data = 4'd0;
			4'd4:  output_data = 4'd14;
			4'd5:  output_data = 4'd8;
			4'd6:  output_data = 4'd2;
			4'd7:  output_data = 4'd11;
			4'd8:  output_data = 4'd7;
			4'd9:  output_data = 4'd4;
			4'd10: output_data = 4'd12;
			4'd11: output_data = 4'd10;
			4'd12: output_data = 4'd9;
			4'd13: output_data = 4'd3;
			4'd14: output_data = 4'd5;
			4'd15: output_data = 4'd6;
		endcase
	end
endmodule