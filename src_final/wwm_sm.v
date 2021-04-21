module wwm_sm(
    input clk,
    input Reset,
    input Start,
    input Ack,
    input Fire,
    input [3:0] vX,
    input [3:0] vY,
    input projectileCenterX,
    input projectileCenterY,
    output q_I,
    output q_P1Shoot,
    output q_Animate,
    output q_Done
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
            vX <= 4'bx;
            vY <= 4'bx;
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
                    if((projectileCenterX <= 675) && (projectileCenterX >= 650) && (projectileCenterY >= 470) && (projectileCenterY <= 475)) state <= DONE;
                    else if((projectileCenterX >= 775) || (projectileCenterX <= 160) || (projectileCenterY >= 475) || (projectileCenterY <= 50)) state <= P1SHOOT;
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