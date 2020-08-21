`timescale 1ns/100ps
`include "Serpent/encrypt/encryption.v"
`include "Serpent/encrypt/S_box.v"
`include "Serpent/encrypt/round.v"
`include "Serpent/decrypt/decryption.v"
`include "Serpent/decrypt/S_box_inv.v"
`include "Serpent/decrypt/round_inv.v"
`include "Serpent/keygen/key_gen.v"

module tb_practice;

    reg clk;
    reg resetn;
    initial clk = 0;
    always #5 clk <= ~clk;

    initial begin
     $dumpfile("top.vcd");
     $dumpvars;
    end



    reg dir;
    reg [255:0] key;
    reg new_block;
    reg [127:0] data;
 
    wire ready;
    wire [127:0] output_data;




    integer i;

    initial begin
         resetn = 0;
         dir = 1;
         key = 128'h0;
         new_block = 1'h0;
         data = 128'h0;
        #200 
         resetn = 1;
        #20
         key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;         
        #10
         i = 0;
         while( i < 100)begin
          data = i;
          #10
          new_block = 1;
          #10
          new_block = 0;
          #10
          @(posedge ready);
          i = i + 1;
          $display("%X",output_data);
         end
        

        $finish;
 
    end


//instantiate a module

    Serpent  dut(   .i_clk( clk ),
                    .i_resetn(  resetn ),
                    .i_dir( dir ),
                    .i_key( key ),
                    .i_new_block( new_block ),
                    .i_data( data ),
                    .o_ready( ready ),
                    .o_output( output_data ) );

    

    


endmodule



/*
   port definition:
    i_clk       : input clk source
    i_resetn    : input low-active reset
    i_dir       : 1:encryption, 0: decryption
    i_key       : input 256-bit key, static during computation
    i_new_block(start) : one-cycle input, indicate one new block(128-bit) of data is presented 
    i_data      : one block (128-bit) 
    o_ready     : set to 1 when this module finishes computation and is accepting input new block;
				  set to 0 when this module is busy.
    o_output    : output encryption/decryption result


*/

module Serpent(     input i_clk,
                    input i_resetn,
                    input i_dir,
                    input [255:0] i_key,
                    input i_new_block,
                    input [127:0] i_data,
                    output o_ready,
                    output [127:0] o_output);

	parameter _Delay  = 32;
	parameter _Delay2 = 64;

	wire start;
	reg o_ready;
	reg [6:0] counter;
	wire [6:0] next_counter;


	assign start = i_new_block;

	always@(posedge i_clk or negedge i_resetn)begin
		if(~i_resetn)begin
			o_ready <= 1;
		end
		else if(start) begin
			o_ready <= 0;
		end
		else if( counter==_Delay && i_dir==1 )begin
			o_ready <= 1;
		end
		else if( counter==_Delay2 && i_dir==0 )begin
			o_ready <= 1;
		end
		else begin
			o_ready <= o_ready;
		end
	end

	always@(posedge i_clk or negedge i_resetn)begin
		if(~i_resetn)begin
			counter <= 6'd0;
		end
		else begin
			counter <= next_counter;
		end
	end


	assign next_counter = (start)? 6'd1:
						  (counter == 6'd0)? 6'd0 :
						  (counter == _Delay && i_dir == 1)? _Delay : 
						  (counter == _Delay2 && i_dir == 0)? _Delay2 : counter + 1;


	wire [127:0] encrypted_data;
	wire [127:0] decrypted_data;
	wire [(128*33-1):0] keys;
	
	key_gen    kg (i_clk, i_key, keys);
	encryption e0 (i_clk, i_data, keys, encrypted_data);
	decryption d0 (i_clk, i_data, keys, decrypted_data); 
	
	assign o_output = (i_dir == 1) ? encrypted_data :
									 decrypted_data;

endmodule




