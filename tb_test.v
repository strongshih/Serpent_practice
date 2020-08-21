`timescale 1ns/100ps
`include "Serpent/encrypt/encryption.v"
`include "Serpent/encrypt/S_box.v"
`include "Serpent/encrypt/round.v"
`include "Serpent/decrypt/decryption.v"
`include "Serpent/decrypt/S_box_inv.v"
`include "Serpent/decrypt/round_inv.v"
`include "Serpent/keygen/key_gen.v"

module test_tb;
    initial begin
     $dumpfile("top.vcd");
     $dumpvars;
    end

	reg clk;
	reg [127:0] data;
	reg [255:0] key;
    wire [127:0] encrypted_data;
	wire [127:0] decrypted_data;
	wire [(128*33-1):0] keys;
	
	key_gen kg (
		.clk(clk), 
		.key(key), 
		.keys(keys)
	);
	
	encryption ee (
		.clk(clk),
		.input_data(data),
		.keys(keys),
		.output_data(encrypted_data)
	);
	
	decryption de (
		.clk(clk),
		.input_data(encrypted_data),
		.keys(keys),
		.output_data(decrypted_data)
	);

	initial begin
		$monitor("%0dns : encrypted data=%X, decrypted data=%X "  , $stime, encrypted_data, decrypted_data); 
		
		clk = 0;
		data = 128'h000000000000000000000000deadbeef;
		key  = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
		#30
		data = 128'h00000000000000000000000b05902109;
		#10
		data = 128'h00000000000000000000000b05902110;
		#10
		data = 128'h00000000000000000000000b05902111;
		#10
		data = 128'h00000000000000000000000b05902112;
		#10
		data = 128'h00000000000000000000000b05902113;
		#10
		data = 128'h00000000000000000000000b05902114;
		#1000
        $display("Finish.");
        $finish;
	end
	
	always #5 clk <= ~clk;

endmodule