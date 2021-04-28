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
// Description:     Alter the display based on state
// Dependencies:    bitmaps.v
//////////////////////////////////////////////////////////////////////////////////
module vga_bitchange(
	input clk,
	input bright,
    input [3:0] vX,
    input [3:0] vY,
    input q_I, q_Animate, q_P1Shoot, q_Done,
    input [9:0] X_INITIAL,
    input [9:0] Y_INITIAL,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb,
	output reg [9:0] projectileCenterX,
    output reg [9:0] projectileCenterY,
    output reg [9:0] targetCenterX,
    output reg [49:0] t_air
   );
	
    /* COLOR CONSTANTS */
	parameter BLACK = 12'b0000_0000_0000;
	parameter WHITE = 12'b1111_1111_1111;
	parameter RED   = 12'b1111_0000_0000;
	parameter GREEN = 12'b0000_1111_0000;
	parameter BLUE = 12'b0000_0000_1111;

    /* Screen locations */
    parameter TOP = 10'd050;
    parameter BTM = 10'd475;
    parameter LFT = 10'd160;
    parameter RGT = 10'd775;
    parameter MDY = (TOP+BTM)/2;
    parameter MDX = (LFT+RGT)/2;
    parameter TITLEY = TOP+((BTM-TOP)/2);
    parameter CANONY = 10'd470;
    parameter CANONX = 10'd210;

    /* Screen elements */
    wire groundPlane;
    // wire cannonRectangle;
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
        targetCenterX = 10'd668;
	end
	
    reg [8:0] rnd;
    always @(posedge clk)
    begin
        rnd <= rnd + 1'b1;
    end
	
	always@ (*)
    begin
        if(q_P1Shoot || q_Animate)
        begin
            if (~bright)
                rgb = BLACK; // Force black if not bright
            else if (edgeBox == 1) // Edge of screen
                rgb = WHITE;
            else if (groundPlane == 1) // Ground box
                rgb = WHITE;
            else if (cannon == 1) // Player's cannon (initial x and y)
                rgb = WHITE;
            else if (projectileBox == 1) // Rectangular projectile
                rgb = GREEN;
            else if (target == 1)  // Target rectangle
                rgb = RED;
            else
                rgb = BLACK; // Background color
        end
        else if(q_I)
        begin
            if(~bright)
                rgb = BLACK;
            else if(render_title)
                rgb = GREEN;
            else
                rgb = BLACK;
        end
        else if(q_Done)
        begin
            if(~bright)
                rgb = BLACK;
            else if(render_done)
                rgb = GREEN;
            else
                rgb = BLACK;
        end
    end

    /* Animate projectile moving */
    always@ (posedge clk)
    begin
        if(q_I)
        begin
            targetCenterX <= 10'd223 + 10'd256 * rnd[8] + 10'd128 * rnd[7] + 10'd64 * rnd[6] + 10'd32 * rnd[5] + 10'd16 * rnd[4] + /*10'd8 * rnd[3] +*/ 10'd4 * rnd[2] + 10'd2 * rnd[1] + 10'd1 * rnd[0];
        end
        else if(q_P1Shoot)
        begin
            t_air <= 10'd0;
            projectileCenterX <= X_INITIAL;
            projectileCenterY <= Y_INITIAL;
        end
        else if(q_Animate)   // Only animate in the animate state
        begin
            projectileTime <= projectileTime + 10'd1;
            if (projectileTime >= 50'd10000000)     // Move the projectile every 50 million clocks (0.5 seconds)
                begin
                    projectileTime <= 10'd0;
                    t_air <= t_air + 10'd1;
                    projectileCenterX <= X_INITIAL + vX*t_air;
                    projectileCenterY <= Y_INITIAL - vY*t_air + (GRAV*t_air*t_air)/(10'd2);
                end
        end
    end

    /* pixel slices of images */
    wire [29:0] xbitsW1, xbitsO, xbitsR1, xbitsL, xbitsD;
    wire [29:0] xbitsW2, xbitsA1, xbitsR2;
    wire [29:0] xbitsM, xbitsA2, xbitsT, xbitsH;
    wire [29:0] xbits_, xbits__;
    wire [13:0] xbitsCannon;
    wire [29:0] xbitsW3, xbitsI, xbitsN;

    /* Display control variables */
    wire [4:0] title_y;
    wire [419:0] title_xbits;
    wire [3:0] cannon_y;
    wire [4:0] done_y;
    wire [89:0] done_xbits;

    /* Initialize image pixel modules */
    W W1(.y(title_y), .xbits(xbitsW1));
    O O(.y(title_y), .xbits(xbitsO));
    R R1(.y(title_y), .xbits(xbitsR1));
    L L(.y(title_y), .xbits(xbitsL));
    D D(.y(title_y), .xbits(xbitsD));
    W W2(.y(title_y), .xbits(xbitsW2));
    A A1(.y(title_y), .xbits(xbitsA1));
    R R2(.y(title_y), .xbits(xbitsR2));
    M M(.y(title_y), .xbits(xbitsM));
    A A2(.y(title_y), .xbits(xbitsA2));
    T T(.y(title_y), .xbits(xbitsT));
    H H(.y(title_y), .xbits(xbitsH));
    _ _(.y(title_y), .xbits(xbits_));
    _ __(.y(title_y), .xbits(xbits__));
    CANNON CANNON(.y(cannon_y), .xbits(xbitsCannon));
    W W3(.y(done_y), .xbits(xbitsW3));
    I I(.y(done_y), .xbits(xbitsI));
    N N(.y(done_y), .xbits(xbitsN));

    /* Choose Y location */
    assign title_y = (vCount - (TITLEY-10'd15));
    assign cannon_y = (vCount - (CANONY-10'd7));
    assign done_y = (vCount - (TITLEY-10'd15));

    /* Concatenate letters */
    assign title_xbits = {xbitsH, xbitsT, xbitsA2, xbitsM, xbits__, xbitsR2, xbitsA1, xbitsW2, xbits_, xbitsD, xbitsL, xbitsR1, xbitsO, xbitsW1};
    assign done_xbits = {xbitsN, xbitsI, xbitsW3};

    /* Make rectangular mask for shape */
    assign title = ((vCount >= TITLEY - 10'd15) && (vCount < TITLEY + 10'd15) && (hCount >= MDX - 10'd210) && (hCount < MDX + 10'd210)) ? 1 : 0;
    assign cannon = ((vCount >= CANONY - 10'd7) && (vCount < CANONY + 10'd7) && (hCount >= CANONX - 10'd20) && (hCount < CANONX + 10'd20)) ? 1 : 0;
    assign done = ((vCount >= TITLEY - 10'd15) && (vCount < TITLEY + 10'd15) && (hCount >= MDX - 10'd45) && (hCount < MDX + 10'd45)) ? 1 : 0;

    /* AND rectangular mask with each shape */
    assign render_title = (title && title_xbits[hCount-(MDX - 10'd210)]) ? 1 : 0;
    assign render_cannon = (cannon && xbitsCannon) ? 1 : 0;
    assign render_done = (done && done_xbits[hCount-(MDX - 10'd45)]) ? 1 : 0;

    // Borders
    assign groundPlane = ((hCount >= 10'd156) && (hCount <= 10'd774)) && ((vCount >= 10'd475) && (vCount <= 10'd525)) ? 1 : 0;
    assign edgeBox = (hCount <= 10'd155) || (hCount >= 10'd775) || (vCount <= 10'd50) ? 1 : 0;
    // Projectile
    assign projectileBox = ((hCount <= (projectileCenterX + 10'd5)) && (hCount >= projectileCenterX)) && (vCount >= projectileCenterY) && ((vCount <= (projectileCenterY + 10'd2))) ? 1 : 0;
    // Targets
    assign target = ((hCount <= targetCenterX + 10'd10) && (hCount >= targetCenterX - 10'd10) && (vCount >= 10'd470) && (vCount <= 10'd475)) ? 1 : 0;
    // assign cannonRectangle = ((hCount >= 10'd200) && (hCount <= 10'd215)) && ((vCount >= 10'd465) && (vCount <= 10'd475)) ? 1 : 0;
	
endmodule
