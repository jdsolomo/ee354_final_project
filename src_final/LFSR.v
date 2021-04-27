/* this code is adapted from Faraz Khan's LFSR code
   which can be found here: https://simplefpga.blogspot.com/2013/02/random-number-generator-in-verilog-fpga.html?_ga=2.250047813.274673388.1619470169-1668077455.1619470169
*/

module LFSR (
    input clk,
    input Reset,
    output [8:0] rnd
);

    reg [8:0] random, random_next, random_done;
    reg [3:0] count, count_next;
    
    wire feedback = random[8] ^ random[4];

    always @(posedge clk, posedge Reset)
    begin
        if(Reset) random <= 9'hf;
        else random <= random_next;
    end

    always @(posedge clk, posedge Reset)
    begin
        if(Reset || count == 9) count <= 0;
        else count <= count_next;
    end

    always @(*)
    begin
        random_next = random;
        count_next = count;

        random_next = {random[7:0], feedback};
        count_next = count + 1;

        if(count == 9)
        begin
            random_done = random;
        end
    end

    assign rnd = random_done;

endmodule