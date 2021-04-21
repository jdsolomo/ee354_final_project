`timescale 1ns / 1ps

module wwm_top (
    input ClkPort,
    input BtnC,
    input BtnU,
    input BtnR,

    input Sw0, Sw1, Sw2, Sw3,

    output hSync, vSync,
    output [3:0] vgaR, vgaG, vgaB,

    output Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0,

    output An0, An1, An2, An3, An4, An5, An6, An7,
    output Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp,

    output MemOE, MemWR, RamCS, QuadSpiFlashCS
);

    /* Local variables */
    wire Reset;
    wire board_clk;
    wire Start;
    wire Fire;
    wire q_I, q_P1Shoot, q_Animate, q_Done;
    

    /* VGA Stuff */
    wire bright;
    wire [9:0] hc, vc;
    wire [11:0] rgb;

    /* To hold power and angle values */
    wire [3:0] vX;
    wire [3:0] vY;

    /* SSD display stuff */
    wire [1:0] ssdscan_clk;
    reg [26:0] DIV_CLK;
    reg [3:0] SSD;
    wire [3:0] SSD1, SSD0;
    reg [7:0] SSD_CATHODES;

    /* Set local variables */
    assign {MemOE, MemWR, RamCS, QuadSpiFlashCS} = 4'b1111;
    assign Reset = BtnC;
    assign board_clk = ClkPort;
    assign Start = BtnU;
    assign Fire = BtnR;

    /* Instantiate State Machine */
    wwm_sm sm(.clk(board_clk), .Reset(Reset), .Start(Start), .Ack(Ack), .Fire(Fire), .vX(vX), .vY(vY), .projectileCenterX(projectileCenterX), .projectileCenterY(projectileCenterY), .q_I(q_I), .q_P1Shoot(q_P1Shoot), .q_Animate(q_Animate), .q_Done(q_Done));

    /* SUGGESTION: ADD DEBOUNCER FOR BUTTONS */


    /* Get Divded Clock */
    always @(posedge board_clk, posedge Reset)
    begin
        if(Reset) DIV_CLK <= 0;
        else DIV_CLK <= DIV_CLK + 1'b1;
    end

    /* Get x velocity and y velocity */
    assign vX = {Sw7, Sw6, Sw5, Sw4};
    assign vY = {Sw3, Sw2, Sw1, Sw0};

    /* FOR TESTING PURPOSES */
    assign {Ld3, Ld2, Ld1, Ld0} = {q_I, q_P1Shoot, q_Animate, q_Done};

    /* Set SSD values to display x and y velocity */
    assign SSD1 = vX;
    assign SSD0 = vY;

    /* switch between SSD 1 and 2 */
    assign ssdscan_clk = DIV_CLK[19];
    assign An0 = !(~(ssdscan_clk[0]));
    assign An1 = !( (ssdscan_clk[0]));
    assign {An2, An3, An4, An5, An6, An7} = 6'b111111;

    always @ (ssdscan_clk, SSD0, SSD1)
    begin
        case (ssdscan_clk)
            1'b0: SSD = SSD0;
            1'b1: SSD = SSD1;
        endcase
    end

    /* Convert hexadecimal to SSD equivalent */
    always @ (SSD)
    begin : HEX_TO_SSD
        case (SSD)
            4'b0000: SSD_CATHODES = 8'b00000011; // 0
			4'b0001: SSD_CATHODES = 8'b10011111; // 1
			4'b0010: SSD_CATHODES = 8'b00100101; // 2
			4'b0011: SSD_CATHODES = 8'b00001101; // 3
			4'b0100: SSD_CATHODES = 8'b10011001; // 4
			4'b0101: SSD_CATHODES = 8'b01001001; // 5
			4'b0110: SSD_CATHODES = 8'b01000001; // 6
			4'b0111: SSD_CATHODES = 8'b00011111; // 7
			4'b1000: SSD_CATHODES = 8'b00000001; // 8
			4'b1001: SSD_CATHODES = 8'b00001001; // 9
			4'b1010: SSD_CATHODES = 8'b00010001; // A
			4'b1011: SSD_CATHODES = 8'b11000001; // B
			4'b1100: SSD_CATHODES = 8'b01100011; // C
			4'b1101: SSD_CATHODES = 8'b10000101; // D
			4'b1110: SSD_CATHODES = 8'b01100001; // E
			4'b1111: SSD_CATHODES = 8'b01110001; // F    
			default: SSD_CATHODES = 8'bXXXXXXXX; // default is not needed as we covered all cases
        endcase
    end

    /* Light up SSD's */
    assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {SSD_CATHODES};

    /* Instantiate VGA controller */
    display_controller dc(.clk(clkPort), .hSync(hSync), .vSync(vSync), .bright(bright), .hCount(hc), .vCount(vc));

    /* Light up monitor display */
    assign vgaR = rgb[11:8];
    assign vgaG = rgb[7:4];
    assign vgaB = rgb[3:0];

    
endmodule