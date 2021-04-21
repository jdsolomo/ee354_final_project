`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         University of Southern California
// Engineer:        James Dawson and Josh Solomon
// 
// Create Date:     12:15:38 12/14/2017
// Design Name: 
// Module Name:     vgaBitChange 
// Project Name:    World War Math
// Target Devices:  Nexys4
// Tool versions: 
// Description:     Based on the work of Yue (Julien) Niu
//
// Dependencies: 
//
// Revision: 
// Revision 0.02 - File rewritten
// Additional Comments: 
//
// Date:            4/20/2021
// Author:          James Dawson and Josh Solomon
// Description:     Animate a projectile using a VGA cable and monitor
//////////////////////////////////////////////////////////////////////////////////
module vga_bitchange(
	input clk,
	input bright,
    input [3:0] vX,
    input [3:0] vY,
    input q_Animate,
    input q_P1Shoot,
    input [9:0] X_INITIAL,
    input [9:0] Y_INITIAL,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [9:0] projectileCenterX,
    output reg [9:0] projectileCenterY,
    output reg [49:0] t_air
   );
	
    /* COLOR CONSTANTS */
	parameter BLACK = 12'b0000_0000_0000;
	parameter WHITE = 12'b1111_1111_1111;
	parameter RED   = 12'b1111_0000_0000;
	parameter GREEN = 12'b0000_1111_0000;
	parameter BLUE = 12'b0000_0000_1111;

    /* Screen elements */
    wire groundPlane;
    wire cannonRectangle;
    wire edgeBox;
    wire projectileBox;
    wire target;

    /* Kinematics variables */
    reg[49:0] projectileTime;
    reg[9:0] GRAV;
    reg[9:0] vi;
    reg[9:0] pheta;

    /* Initializations */
	initial 
	begin
		GRAV = 10'd1;
        projectileCenterX = X_INITIAL;
        projectileCenterY = Y_INITIAL;
	end
	
	
	always@ (*)
    	if (~bright)
		    rgb = BLACK; // Force black if not bright
         else if (edgeBox == 1) // Edge of screen
            rgb = WHITE;
         else if (groundPlane == 1) // Ground box
            rgb = WHITE;
         else if (cannonRectangle == 1) // Player's cannon (initial x and y)
            rgb = WHITE;
         else if (projectileBox == 1) // Rectangular projectile
            rgb = GREEN;
         else if (target == 1)  // Target rectangle
            rgb = RED;
         else
            rgb = BLACK; // Background color

    /* Animate projectile moving */
    always@ (posedge clk)
    begin
        if(q_P1Shoot)
        begin
            t_air <= 10'd0;
            projectileCenterX <= X_INITIAL;
            projectileCenterY <= Y_INITIAL;
        end
        if(q_Animate)   // Only animate in the animate state
        begin
            projectileTime <= projectileTime + 10'd1;
            if (projectileTime >= 50'd50000000)     // Move the projectile every 50 million clocks (0.5 seconds)
                begin
                    projectileTime <= 10'd0;
                    t_air <= t_air + 10'd1;
                    projectileCenterX <= X_INITIAL + vX*t_air;
                    projectileCenterY <= Y_INITIAL - vY*t_air + (GRAV*t_air*t_air)/(10'd2);
                end
        end
    end

    // Borders
    assign groundPlane = ((hCount >= 10'd156) && (hCount <= 10'd774)) && ((vCount >= 10'd475) && (vCount <= 10'd525)) ? 1 : 0;
    assign edgeBox = (hCount <= 10'd155) || (hCount >= 10'd775) || (vCount <= 10'd50) ? 1 : 0;
    // Projectile
    assign projectileBox = ((hCount <= (projectileCenterX + 10'd5)) && (hCount >= projectileCenterX)) && (vCount >= projectileCenterY) && ((vCount <= (projectileCenterY + 10'd2))) ? 1 : 0;
    // Targets
    assign target = ((hCount <= 10'd675) && (hCount >= 10'd650) && (vCount >= 10'd470) && (vCount <= 10'd475)) ? 1 : 0;
    assign cannonRectangle = ((hCount >= 10'd200) && (hCount <= 10'd215)) && ((vCount >= 10'd465) && (vCount <= 10'd475)) ? 1 : 0;
	
endmodule
