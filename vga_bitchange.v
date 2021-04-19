`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:38 12/14/2017 
// Design Name: 
// Module Name:    vgaBitChange 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Date: 04/04/2020
// Author: Yue (Julien) Niu
// Description: Port from NEXYS3 to NEXYS4
//////////////////////////////////////////////////////////////////////////////////
module vga_bitchange(
	input clk,
	input bright,
	input button,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [15:0] score
   );
	
	parameter BLACK = 12'b0000_0000_0000;
	parameter WHITE = 12'b1111_1111_1111;
	parameter RED   = 12'b1111_0000_0000;
	parameter GREEN = 12'b0000_1111_0000;
	parameter BLUE = 12'b0000_0000_1111;

//	wire whiteZone;
//	wire greenMiddleSquare;
//	reg reset;
//	reg[9:0] greenMiddleSquareY;
//	reg[49:0] greenMiddleSquareSpeed; 

    wire groundPlane;
    wire cannonRectangle;
    wire edgeBox;
    wire projectileBox;
    wire target;
    reg reset;
    reg[9:0] X_INITIAL;
    reg[9:0] Y_INITIAL;
    reg[9:0] projectileCenterX;
    reg[9:0] projectileCenterY;
    reg[49:0] projectileTime;
    reg[9:0] grav;
    reg[9:0] vx;
    reg[9:0] vy;
    reg[9:0] vi;
    reg[9:0] pheta;
    reg[49:0] t_air;
    reg hit;


	initial 
	begin
		X_INITIAL = 10'd213;
		Y_INITIAL = 10'd472;
		grav = 10'd1;
		vx = 10'd16;
		vy = 10'd16;
		t_air = 10'd0;
		hit = 1'b0;
        //score = 15'd0;
        //reset = 1'b0;
	end
	
	
	always@ (*) // paint a white box on a red background
    	if (~bright)
		    rgb = BLACK; // force black if not bright
         else if (edgeBox == 1)
            rgb = WHITE;
         else if (groundPlane == 1)
            rgb = WHITE; // white box
         else if (cannonRectangle == 1)
            rgb = WHITE; // white box
         else if (projectileBox == 1)
            rgb = GREEN;
         else if (target == 1)
            rgb = RED;
         else
            rgb = BLACK; // background color



//Move Projectile

    always@ (posedge clk)
        begin
        projectileTime = projectileTime + 10'd1;
        if (projectileTime >= 50'd50000000)
            begin
                projectileTime <= 10'd0;
                t_air <= t_air + 10'd1;
                projectileCenterX <= X_INITIAL + vx*t_air;
                projectileCenterY <= Y_INITIAL - vy*t_air + (grav*t_air*t_air)/(10'd2);
                if((projectileCenterX >=775) || (projectileCenterY > 10'd476))
                begin
                    projectileCenterX <= X_INITIAL;
                    projectileCenterY <= Y_INITIAL;
                    t_air <= 10'd0;
                end
            end
        
        end
//	always@ (posedge clk)
//		if ((reset == 1'b0) && (button == 1'b1) && (hCount >= 10'd144) && (hCount <= 10'd784) && (greenMiddleSquareY >= 10'd400) && (greenMiddleSquareY <= 10'd475))
//			begin
//			score = score + 16'd1;
//			reset = 1'b1;
//			end
//		else if (greenMiddleSquareY <= 10'd20)
//			begin
//			reset = 1'b0;
//			end

//	assign whiteZone = ((hCount >= 10'd144) && (hCount <= 10'd784)) && ((vCount >= 10'd400) && (vCount <= 10'd475)) ? 1 : 0;

//	assign greenMiddleSquare = ((hCount >= 10'd340) && (hCount < 10'd380)) &&
//				   ((vCount >= greenMiddleSquareY) && (vCount <= greenMiddleSquareY + 10'd40)) ? 1 : 0;



    //borders
    assign groundPlane = ((hCount >= 10'd156) && (hCount <= 10'd774)) && ((vCount >= 10'd475) && (vCount <= 10'd525)) ? 1 : 0;
    assign edgeBox = (hCount <= 10'd155) || (hCount >= 10'd775) || (vCount <= 10'd50) ? 1 : 0;
    //projectile
    //assign projectileBox = ((hCount <= X_INITIAL + 10'd5) && (hCount >= X_INITIAL)) && (vCount >= Y_INITIAL) && ((vCount <= Y_INITIAL + 10'd2)) ? 1 : 0;
    assign projectileBox = ((hCount <= (projectileCenterX + 10'd5)) && (hCount >= projectileCenterX)) && (vCount >= projectileCenterY) && ((vCount <= (projectileCenterY + 10'd2))) ? 1 : 0;
    //targets
    assign target = ((hCount <= 10'd675) && (hCount >= 10'd650) && (vCount >= 10'd470) && (vCount <= 10'd475)) ? 1 : 0;
    assign cannonRectangle = ((hCount >= 10'd200) && (hCount <= 10'd215)) && ((vCount >= 10'd465) && (vCount <= 10'd475)) ? 1 : 0;
	
endmodule
