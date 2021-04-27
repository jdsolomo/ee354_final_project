//////////////////////////////////////////////////////////////////////////////////
// Company:         University of Southern California
// Engineer:        James Dawson and Josh Solomon
// 
// Create Date:     4/26/2021
// Design Name: 
// Module Name:     bitmaps (many modules)
// Project Name:    World War Math
// Target Devices:  Nexys4
// Tool versions: 
// Description:     bitmaps of several characters (letters, spaces, icons, etc.) used within the game
//
// Dependencies: 	None
//
//////////////////////////////////////////////////////////////////////////////////

module W(y, xbits);
    input [4:0] y;
    output [29:0] xbits;
    reg [29:0] bitarray [0:29];
    assign xbits = bitarray[y];
    initial begin
        bitarray[0]  = 30'b000_111000000000_000000000111_000;
		bitarray[1]  = 30'b000_111000000000_000000000111_000;
		bitarray[2]  = 30'b000_111000000000_000000000111_000;
		bitarray[3]  = 30'b000_111000000000_000000000111_000;
		bitarray[4]  = 30'b000_111000000000_000000000111_000;
		bitarray[5]  = 30'b000_011100000000_000000001110_000;
		bitarray[6]  = 30'b000_011100000000_000000001110_000;
		bitarray[7]  = 30'b000_011100000000_000000001110_000;
		bitarray[8]  = 30'b000_011100000000_000000001110_000;
		bitarray[9]  = 30'b000_011100000000_000000001110_000;
		bitarray[10] = 30'b000_001110000000_000000011100_000;
		bitarray[11] = 30'b000_001110000000_000000011100_000;
		bitarray[12] = 30'b000_001110000011_110000011100_000;
		bitarray[13] = 30'b000_001110000011_110000011100_000;
		bitarray[14] = 30'b000_001110000011_110000011100_000;
		bitarray[15] = 30'b000_000111000111_111000111000_000;
		bitarray[16] = 30'b000_000111000111_111000111000_000;
		bitarray[17] = 30'b000_000111000111_111000111000_000;
		bitarray[18] = 30'b000_000111000111_111000111000_000;
		bitarray[19] = 30'b000_000111000111_111000111000_000;
		bitarray[20] = 30'b000_000011101110_011101110000_000;
		bitarray[21] = 30'b000_000011101110_011101110000_000;
		bitarray[22] = 30'b000_000011101110_011101110000_000;
		bitarray[23] = 30'b000_000011101110_011101110000_000;
		bitarray[24] = 30'b000_000011101110_011101110000_000;
		bitarray[25] = 30'b000_000001111000_000111100000_000;
		bitarray[26] = 30'b000_000001111000_000111100000_000;
		bitarray[27] = 30'b000_000001111000_000111100000_000;
		bitarray[28] = 30'b000_000001111000_000111100000_000;
		bitarray[29] = 30'b000_000001111000_000111100000_000;
    end
endmodule

module O(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000000000111_111000000000_000;
		bitarray[1]  = 30'b000_000000011111_111110000000_000;
		bitarray[2]  = 30'b000_000001111111_111111100000_000;
		bitarray[3]  = 30'b000_000011111111_111111110000_000;
		bitarray[4]  = 30'b000_000111111000_000111111000_000;
		bitarray[5]  = 30'b000_000111100000_000001111000_000;
		bitarray[6]  = 30'b000_001111100000_000001111100_000;
		bitarray[7]  = 30'b000_011111000000_000000111110_000;
		bitarray[8]  = 30'b000_011110000000_000000011110_000;
		bitarray[9]  = 30'b000_011110000000_000000011110_000;
		bitarray[10] = 30'b000_111110000000_000000011111_000;
		bitarray[11] = 30'b000_111100000000_000000001111_000;
		bitarray[12] = 30'b000_111100000000_000000001111_000;
		bitarray[13] = 30'b000_111100000000_000000001111_000;
		bitarray[14] = 30'b000_111100000000_000000001111_000;
		bitarray[15] = 30'b000_111100000000_000000001111_000;
		bitarray[16] = 30'b000_111100000000_000000001111_000;
		bitarray[17] = 30'b000_111100000000_000000001111_000;
		bitarray[18] = 30'b000_111100000000_000000001111_000;
		bitarray[19] = 30'b000_111110000000_000000011111_000;
		bitarray[20] = 30'b000_011110000000_000000011110_000;
		bitarray[21] = 30'b000_011110000000_000000011110_000;
		bitarray[22] = 30'b000_011111000000_000000111110_000;
		bitarray[23] = 30'b000_001111100000_000001111100_000;
		bitarray[24] = 30'b000_000111100000_000001111000_000;
		bitarray[25] = 30'b000_000111111000_000111111000_000;
		bitarray[26] = 30'b000_000011111111_111111110000_000;
		bitarray[27] = 30'b000_000001111111_111111100000_000;
		bitarray[28] = 30'b000_000000011111_111110000000_000;
		bitarray[29] = 30'b000_000000000111_111000000000_000;
	end
endmodule

module R(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000001111111_111111111111_000;
		bitarray[1]  = 30'b000_000011111111_111111111111_000;
		bitarray[2]  = 30'b000_000111111111_111111111111_000;
		bitarray[3]  = 30'b000_001111000000_000000001111_000;
		bitarray[4]  = 30'b000_011110000000_000000001111_000;
		bitarray[5]  = 30'b000_011110000000_000000001111_000;
		bitarray[6]  = 30'b000_111100000000_000000001111_000;
		bitarray[7]  = 30'b000_111100000000_000000001111_000;
		bitarray[8]  = 30'b000_111100000000_000000001111_000;
		bitarray[9]  = 30'b000_011110000000_000000001111_000;
		bitarray[10] = 30'b000_011110000000_000000001111_000;
		bitarray[11] = 30'b000_001111000000_000000001111_000;
		bitarray[12] = 30'b000_000111111111_111111111111_000;
		bitarray[13] = 30'b000_000011111111_111111111111_000;
		bitarray[14] = 30'b000_000001111111_111111111111_000;
		bitarray[15] = 30'b000_000000000000_001111001111_000;
		bitarray[16] = 30'b000_000000000000_011110001111_000;
		bitarray[17] = 30'b000_000000000000_111100001111_000;
		bitarray[18] = 30'b000_000000000001_111000001111_000;
		bitarray[19] = 30'b000_000000000011_110000001111_000;
		bitarray[20] = 30'b000_000000000111_100000001111_000;
		bitarray[21] = 30'b000_000000001111_000000001111_000;
		bitarray[22] = 30'b000_000000011110_000000001111_000;
		bitarray[23] = 30'b000_000000111100_000000001111_000;
		bitarray[24] = 30'b000_000001111000_000000001111_000;
		bitarray[25] = 30'b000_000011110000_000000001111_000;
		bitarray[26] = 30'b000_000111100000_000000001111_000;
		bitarray[27] = 30'b000_001111000000_000000001111_000;
		bitarray[28] = 30'b000_011110000000_000000001111_000;
		bitarray[29] = 30'b000_111100000000_000000001111_000;
	end
endmodule

module L(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000000000000_000000011111_000;
		bitarray[1]  = 30'b000_000000000000_000000011111_000;
		bitarray[2]  = 30'b000_000000000000_000000011111_000;
		bitarray[3]  = 30'b000_000000000000_000000011111_000;
		bitarray[4]  = 30'b000_000000000000_000000011111_000;
		bitarray[5]  = 30'b000_000000000000_000000011111_000;
		bitarray[6]  = 30'b000_000000000000_000000011111_000;
		bitarray[7]  = 30'b000_000000000000_000000011111_000;
		bitarray[8]  = 30'b000_000000000000_000000011111_000;
		bitarray[9]  = 30'b000_000000000000_000000011111_000;
		bitarray[10] = 30'b000_000000000000_000000011111_000;
		bitarray[11] = 30'b000_000000000000_000000011111_000;
		bitarray[12] = 30'b000_000000000000_000000011111_000;
		bitarray[13] = 30'b000_000000000000_000000011111_000;
		bitarray[14] = 30'b000_000000000000_000000011111_000;
		bitarray[15] = 30'b000_000000000000_000000011111_000;
		bitarray[16] = 30'b000_000000000000_000000011111_000;
		bitarray[17] = 30'b000_000000000000_000000011111_000;
		bitarray[18] = 30'b000_000000000000_000000011111_000;
		bitarray[19] = 30'b000_000000000000_000000011111_000;
		bitarray[20] = 30'b000_000000000000_000000011111_000;
		bitarray[21] = 30'b000_000000000000_000000011111_000;
		bitarray[22] = 30'b000_000000000000_000000011111_000;
		bitarray[23] = 30'b000_000000000000_000000011111_000;
		bitarray[24] = 30'b000_000000000000_000000011111_000;
		bitarray[25] = 30'b000_000000000000_000000011111_000;
		bitarray[26] = 30'b000_111111111111_111111111111_000;
		bitarray[27] = 30'b000_111111111111_111111111111_000;
		bitarray[28] = 30'b000_111111111111_111111111111_000;
		bitarray[29] = 30'b000_111111111111_111111111111_000;
	end
endmodule

module D(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000000011111_111111111111_000;
		bitarray[1]  = 30'b000_000000111111_111111111111_000;
		bitarray[2]  = 30'b000_000001111111_111111111111_000;
		bitarray[3]  = 30'b000_000111100000_000000001111_000;
		bitarray[4]  = 30'b000_001111000000_000000001111_000;
		bitarray[5]  = 30'b000_011110000000_000000001111_000;
		bitarray[6]  = 30'b000_111100000000_000000001111_000;
		bitarray[7]  = 30'b000_111100000000_000000001111_000;
		bitarray[8]  = 30'b000_111100000000_000000001111_000;
		bitarray[9]  = 30'b000_111100000000_000000001111_000;
		bitarray[10] = 30'b000_111100000000_000000001111_000;
		bitarray[11] = 30'b000_111100000000_000000001111_000;
		bitarray[12] = 30'b000_111100000000_000000001111_000;
		bitarray[13] = 30'b000_111100000000_000000001111_000;
		bitarray[14] = 30'b000_111100000000_000000001111_000;
		bitarray[15] = 30'b000_111100000000_000000001111_000;
		bitarray[16] = 30'b000_111100000000_000000001111_000;
		bitarray[17] = 30'b000_111100000000_000000001111_000;
		bitarray[18] = 30'b000_111100000000_000000001111_000;
		bitarray[19] = 30'b000_111100000000_000000001111_000;
        bitarray[20] = 30'b000_111100000000_000000001111_000;
		bitarray[21] = 30'b000_111100000000_000000001111_000;
		bitarray[22] = 30'b000_111100000000_000000001111_000;
		bitarray[23] = 30'b000_111100000000_000000001111_000;
		bitarray[24] = 30'b000_011110000000_000000001111_000;
		bitarray[25] = 30'b000_001111000000_000000001111_000;
		bitarray[26] = 30'b000_000111100000_000000001111_000;
		bitarray[27] = 30'b000_000011111111_111111111111_000;
		bitarray[28] = 30'b000_000001111111_111111111111_000;
		bitarray[29] = 30'b000_000000111111_111111111111_000;
	end
endmodule

module A(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000000000111_111000000000_000;
		bitarray[1]  = 30'b000_000000001111_111100000000_000;
		bitarray[2]  = 30'b000_000000001111_111100000000_000;
		bitarray[3]  = 30'b000_000000011110_011110000000_000;
		bitarray[4]  = 30'b000_000000011110_011110000000_000;
		bitarray[5]  = 30'b000_000000111100_001111000000_000;
		bitarray[6]  = 30'b000_000000111100_001111000000_000;
		bitarray[7]  = 30'b000_000001111000_000111100000_000;
		bitarray[8]  = 30'b000_000001111000_000111100000_000;
		bitarray[9]  = 30'b000_000011110000_000011110000_000;
		bitarray[10] = 30'b000_000011110000_000011110000_000;
		bitarray[11] = 30'b000_000111100000_000001111000_000;
		bitarray[12] = 30'b000_000111100000_000001111000_000;
		bitarray[13] = 30'b000_001111000000_000000111100_000;
		bitarray[14] = 30'b000_001111000000_000000111100_000;
		bitarray[15] = 30'b000_111100000000_000000001111_000;
		bitarray[16] = 30'b000_111100000000_000000001111_000;
		bitarray[17] = 30'b000_111100000000_000000001111_000;
		bitarray[18] = 30'b000_111100000000_000000001111_000;
		bitarray[19] = 30'b000_111111111111_111111111111_000;
		bitarray[20] = 30'b000_111111111111_111111111111_000;
		bitarray[21] = 30'b000_111111111111_111111111111_000;
		bitarray[22] = 30'b000_111111111111_111111111111_000;
		bitarray[23] = 30'b000_111100000000_000000001111_000;
		bitarray[24] = 30'b000_111100000000_000000001111_000;
		bitarray[25] = 30'b000_111100000000_000000001111_000;
		bitarray[26] = 30'b000_111100000000_000000001111_000;
		bitarray[27] = 30'b000_111100000000_000000001111_000;
		bitarray[28] = 30'b000_111100000000_000000001111_000;
		bitarray[29] = 30'b000_111100000000_000000001111_000;
	end
endmodule

module M(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_111100000000_000000001111_000;
		bitarray[1]  = 30'b000_111100000000_000000001111_000;
		bitarray[2]  = 30'b000_111111000000_000000111111_000;
		bitarray[3]  = 30'b000_111111000000_000000111111_000;
		bitarray[4]  = 30'b000_111011110000_000011110111_000;
		bitarray[5]  = 30'b000_111011110000_000011110111_000;
		bitarray[6]  = 30'b000_111000111100_001111000111_000;
		bitarray[7]  = 30'b000_111000111100_001111000111_000;
		bitarray[8]  = 30'b000_111000001111_111100000111_000;
		bitarray[9]  = 30'b000_111000001111_111100000111_000;
		bitarray[10] = 30'b000_111000000111_111000000111_000;
		bitarray[11] = 30'b000_111000000011_110000000111_000;
		bitarray[12] = 30'b000_111000000001_100000000111_000;
		bitarray[13] = 30'b000_111000000000_000000000111_000;
		bitarray[14] = 30'b000_111000000000_000000000111_000;
		bitarray[15] = 30'b000_111000000000_000000000111_000;
		bitarray[16] = 30'b000_111000000000_000000000111_000;
		bitarray[17] = 30'b000_111000000000_000000000111_000;
		bitarray[18] = 30'b000_111000000000_000000000111_000;
		bitarray[19] = 30'b000_111000000000_000000000111_000;
		bitarray[20] = 30'b000_111000000000_000000000111_000;
		bitarray[21] = 30'b000_111000000000_000000000111_000;
		bitarray[22] = 30'b000_111000000000_000000000111_000;
		bitarray[23] = 30'b000_111000000000_000000000111_000;
		bitarray[24] = 30'b000_111000000000_000000000111_000;
		bitarray[25] = 30'b000_111000000000_000000000111_000;
		bitarray[26] = 30'b000_111000000000_000000000111_000;
		bitarray[27] = 30'b000_111000000000_000000000111_000;
        bitarray[28] = 30'b000_111000000000_000000000111_000;
		bitarray[29] = 30'b000_111000000000_000000000111_000;
	end
endmodule

module T(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_111111111111_111111111111_000;
		bitarray[1]  = 30'b000_111111111111_111111111111_000;
		bitarray[2]  = 30'b000_111111111111_111111111111_000;
		bitarray[3]  = 30'b000_000000000011_110000000000_000;
		bitarray[4]  = 30'b000_000000000011_110000000000_000;
		bitarray[5]  = 30'b000_000000000011_110000000000_000;
		bitarray[6]  = 30'b000_000000000011_110000000000_000;
		bitarray[7]  = 30'b000_000000000011_110000000000_000;
		bitarray[8]  = 30'b000_000000000011_110000000000_000;
		bitarray[9]  = 30'b000_000000000011_110000000000_000;
		bitarray[10] = 30'b000_000000000011_110000000000_000;
		bitarray[11] = 30'b000_000000000011_110000000000_000;
		bitarray[12] = 30'b000_000000000011_110000000000_000;
		bitarray[13] = 30'b000_000000000011_110000000000_000;
		bitarray[14] = 30'b000_000000000011_110000000000_000;
		bitarray[15] = 30'b000_000000000011_110000000000_000;
		bitarray[16] = 30'b000_000000000011_110000000000_000;
		bitarray[17] = 30'b000_000000000011_110000000000_000;
		bitarray[18] = 30'b000_000000000011_110000000000_000;
		bitarray[19] = 30'b000_000000000011_110000000000_000;
		bitarray[20] = 30'b000_000000000011_110000000000_000;
		bitarray[21] = 30'b000_000000000011_110000000000_000;
		bitarray[22] = 30'b000_000000000011_110000000000_000;
		bitarray[23] = 30'b000_000000000011_110000000000_000;
		bitarray[24] = 30'b000_000000000011_110000000000_000;
		bitarray[25] = 30'b000_000000000011_110000000000_000;
		bitarray[26] = 30'b000_000000000011_110000000000_000;
		bitarray[27] = 30'b000_000000000011_110000000000_000;
		bitarray[28] = 30'b000_000000000011_110000000000_000;
		bitarray[29] = 30'b000_000000000011_110000000000_000;
	end
endmodule

module H(y,xbits);
    input [4:0] y;
    output [29:0] xbits;
    reg [29:0] bitarray[0:29];
    assign xbits = bitarray[y];
    initial begin
        bitarray[0]  = 30'b000_111000000000_000000000111_000;
		bitarray[1]  = 30'b000_111000000000_000000000111_000;
		bitarray[2]  = 30'b000_111000000000_000000000111_000;
		bitarray[3]  = 30'b000_111000000000_000000000111_000;
		bitarray[4]  = 30'b000_111000000000_000000000111_000;
		bitarray[5]  = 30'b000_111000000000_000000000111_000;
		bitarray[6]  = 30'b000_111000000000_000000000111_000;
		bitarray[7]  = 30'b000_111000000000_000000000111_000;
		bitarray[8]  = 30'b000_111000000000_000000000111_000;
		bitarray[9]  = 30'b000_111000000000_000000000111_000;
		bitarray[10] = 30'b000_111000000000_000000000111_000;
		bitarray[11] = 30'b000_111000000000_000000000111_000;
		bitarray[12] = 30'b000_111000000000_000000000111_000;
		bitarray[13] = 30'b000_111000000000_000000000111_000;
		bitarray[14] = 30'b000_111000000000_000000000111_000;
		bitarray[15] = 30'b000_111111111111_111111111111_000;
		bitarray[16] = 30'b000_111111111111_111111111111_000;
		bitarray[17] = 30'b000_111111111111_111111111111_000;
		bitarray[18] = 30'b000_111000000000_000000000111_000;
		bitarray[19] = 30'b000_111000000000_000000000111_000;
		bitarray[20] = 30'b000_111000000000_000000000111_000;
		bitarray[21] = 30'b000_111000000000_000000000111_000;
		bitarray[22] = 30'b000_111000000000_000000000111_000;
		bitarray[23] = 30'b000_111000000000_000000000111_000;
		bitarray[24] = 30'b000_111000000000_000000000111_000;
		bitarray[25] = 30'b000_111000000000_000000000111_000;
		bitarray[26] = 30'b000_111000000000_000000000111_000;
		bitarray[27] = 30'b000_111000000000_000000000111_000;
		bitarray[28] = 30'b000_111000000000_000000000111_000;
		bitarray[29] = 30'b000_111000000000_000000000111_000;
    end
endmodule

module _(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000000000000_000000000000_000;
		bitarray[1]  = 30'b000_000000000000_000000000000_000;
		bitarray[2]  = 30'b000_000000000000_000000000000_000;
		bitarray[3]  = 30'b000_000000000000_000000000000_000;
		bitarray[4]  = 30'b000_000000000000_000000000000_000;
		bitarray[5]  = 30'b000_000000000000_000000000000_000;
		bitarray[6]  = 30'b000_000000000000_000000000000_000;
		bitarray[7]  = 30'b000_000000000000_000000000000_000;
		bitarray[8]  = 30'b000_000000000000_000000000000_000;
		bitarray[9]  = 30'b000_000000000000_000000000000_000;
		bitarray[10] = 30'b000_000000000000_000000000000_000;
		bitarray[11] = 30'b000_000000000000_000000000000_000;
		bitarray[12] = 30'b000_000000000000_000000000000_000;
		bitarray[13] = 30'b000_000000000000_000000000000_000;
		bitarray[14] = 30'b000_000000000000_000000000000_000;
		bitarray[15] = 30'b000_000000000000_000000000000_000;
		bitarray[16] = 30'b000_000000000000_000000000000_000;
		bitarray[17] = 30'b000_000000000000_000000000000_000;
		bitarray[18] = 30'b000_000000000000_000000000000_000;
		bitarray[19] = 30'b000_000000000000_000000000000_000;
		bitarray[20] = 30'b000_000000000000_000000000000_000;
		bitarray[21] = 30'b000_000000000000_000000000000_000;
		bitarray[22] = 30'b000_000000000000_000000000000_000;
		bitarray[23] = 30'b000_000000000000_000000000000_000;
		bitarray[24] = 30'b000_000000000000_000000000000_000;
		bitarray[25] = 30'b000_000000000000_000000000000_000;
		bitarray[26] = 30'b000_000000000000_000000000000_000;
		bitarray[27] = 30'b000_000000000000_000000000000_000;
		bitarray[28] = 30'b000_000000000000_000000000000_000;
		bitarray[29] = 30'b000_000000000000_000000000000_000;
	end
endmodule

module I(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_000011111111_111111110000_000;
		bitarray[1]  = 30'b000_000011111111_111111110000_000;
		bitarray[2]  = 30'b000_000000001111_111100000000_000;
		bitarray[3]  = 30'b000_000000000111_110000000000_000;
		bitarray[4]  = 30'b000_000000000011_110000000000_000;
		bitarray[5]  = 30'b000_000000000011_110000000000_000;
		bitarray[6]  = 30'b000_000000000011_110000000000_000;
		bitarray[7]  = 30'b000_000000000011_110000000000_000;
		bitarray[8]  = 30'b000_000000000011_110000000000_000;
		bitarray[9]  = 30'b000_000000000011_110000000000_000;
		bitarray[10] = 30'b000_000000000011_110000000000_000;
		bitarray[11] = 30'b000_000000000011_110000000000_000;
		bitarray[12] = 30'b000_000000000011_110000000000_000;
		bitarray[13] = 30'b000_000000000011_110000000000_000;
		bitarray[14] = 30'b000_000000000011_110000000000_000;
		bitarray[15] = 30'b000_000000000011_110000000000_000;
		bitarray[16] = 30'b000_000000000011_110000000000_000;
		bitarray[17] = 30'b000_000000000011_110000000000_000;
		bitarray[18] = 30'b000_000000000011_110000000000_000;
		bitarray[19] = 30'b000_000000000011_110000000000_000;
		bitarray[20] = 30'b000_000000000011_110000000000_000;
		bitarray[21] = 30'b000_000000000011_110000000000_000;
		bitarray[22] = 30'b000_000000000011_110000000000_000;
		bitarray[23] = 30'b000_000000000011_110000000000_000;
		bitarray[24] = 30'b000_000000000011_110000000000_000;
		bitarray[25] = 30'b000_000000000011_110000000000_000;
		bitarray[26] = 30'b000_000000000111_111000000000_000;
		bitarray[27] = 30'b000_000000001111_111100000000_000;
		bitarray[28] = 30'b000_000011111111_111111110000_000;
		bitarray[29] = 30'b000_000011111111_111111110000_000;
	end
endmodule

module N(y, xbits);
	input [4:0] y;
	output [29:0] xbits;
	reg [29:0] bitarray[0:29];
	assign xbits = bitarray[y];
	initial begin // 20*20
		bitarray[0]  = 30'b000_111100000000_000000111111_000;
		bitarray[1]  = 30'b000_111100000000_000001111111_000;
		bitarray[2]  = 30'b000_111100000000_000001111111_000;
		bitarray[3]  = 30'b000_111100000000_000011101111_000;
		bitarray[4]  = 30'b000_111100000000_000011101111_000;
		bitarray[5]  = 30'b000_111100000000_000111001111_000;
		bitarray[6]  = 30'b000_111100000000_000111001111_000;
		bitarray[7]  = 30'b000_111100000000_001110001111_000;
		bitarray[8]  = 30'b000_111100000000_001110001111_000;
		bitarray[9]  = 30'b000_111100000000_011100001111_000;
		bitarray[10] = 30'b000_111100000000_011100001111_000;
		bitarray[11] = 30'b000_111100000000_111000001111_000;
		bitarray[12] = 30'b000_111100000000_111000001111_000;
		bitarray[13] = 30'b000_111100000001_110000001111_000;
		bitarray[14] = 30'b000_111100000001_110000001111_000;
		bitarray[15] = 30'b000_111100000011_100000001111_000;
		bitarray[16] = 30'b000_111100000011_100000001111_000;
		bitarray[17] = 30'b000_111100000111_000000001111_000;
		bitarray[18] = 30'b000_111100000111_000000001111_000;
		bitarray[19] = 30'b000_111100001110_000000001111_000;
		bitarray[20] = 30'b000_111100001110_000000001111_000;
		bitarray[21] = 30'b000_111100011100_000000001111_000;
		bitarray[22] = 30'b000_111100011100_000000001111_000;
		bitarray[23] = 30'b000_111100111000_000000001111_000;
		bitarray[24] = 30'b000_111100111000_000000001111_000;
		bitarray[25] = 30'b000_111101110000_000000001111_000;
		bitarray[26] = 30'b000_111101110000_000000001111_000;
		bitarray[27] = 30'b000_111111100000_000000001111_000;
		bitarray[28] = 30'b000_111111100000_000000001111_000;
		bitarray[29] = 30'b000_111111000000_000000001111_000;
	end
endmodule

module CANNON(y, xbits);
	input [3:0] y;
	output [13:0] xbits;
	reg [39:0] bitarray[0:13];
	assign xbits = bitarray[y];
	assign xbits
	initial begin
		bitarray[0]  = 40'b00000_001111000000001_100000000000000_00000;
		bitarray[1]  = 40'b00000_000111100011111_111110000000000_00000;
		bitarray[2]  = 40'b00000_000011111111111_111111100000000_00000;
		bitarray[3]  = 40'b00000_000001111111111_111111111000000_00000;
		bitarray[4]  = 40'b00000_000001111111111_111111111100000_00000;
		bitarray[5]  = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[6]  = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[8]  = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[9]  = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[10] = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[11] = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[12] = 40'b00000_000011111111111_111111111110000_00000;
		bitarray[13] = 40'b00000_000011111111111_111111111110000_00000;
	end
endmodule