//////////////////////////////////////////////////////////////////////////////////
// Company:         University of Southern California
// Engineer:        James Dawson and Josh Solomon
// 
// Create Date:     4/20/2021
// Design Name: 
// Module Name:     wwm_sm
// Project Name:    World War Math
// Target Devices:  Nexys4
// Tool versions: 
// Description:     State machine (Initial, Shoot, Animate, Done)
//
// Dependencies:    
//
//////////////////////////////////////////////////////////////////////////////////

module wwm_sm(
    input clk,
    input Reset,
    input Start,
    input Ack,
    input Fire,
    input projectileCenterX,
    input projectileCenterY,
    output q_I,
    output q_P1Shoot,
    output q_Animate, q_Done
    );

    reg [3:0] state;

    assign {q_Done, q_Animate, q_P1Shoot, q_I} = state;

    localparam 
    I = 4'b0001,
    P1SHOOT = 4'b0010,
    ANIMATE = 4'b0100,
    DONE = 4'b1000,
    UNK = 4'bXXXX;

    always @ (posedge clk, posedge Reset)
    begin : WWM_SM
        if(Reset)
        begin
            state <= I;
        end
        else
        begin
            case(state)

                I:
                begin
                    // state transfers
                    if(Start) state <= P1SHOOT;
                    // data transfers

                end

                P1SHOOT:
                begin
                    // state transfers
                    if(Fire) state <= ANIMATE;
                    // data transfers
                end

                ANIMATE:
                begin
                    // state transfers
                    if((projectileCenterX <= 10'd675) && (projectileCenterX >= 10'd650) && (projectileCenterY >= 10'd470) && (projectileCenterY <= 10'd475)) state <= DONE;
                    else if((projectileCenterX >= 10'd775) || (projectileCenterX <= 10'd160) || (projectileCenterY >= 10'd475) || (projectileCenterY <= 10'd50)) state <= P1SHOOT;
                    // data transfers

                end

                DONE:
                begin
                    // state transfers
                    if(Ack) state <= I;
                    // data transfers
                    
                end

            endcase
        end
    end



endmodule