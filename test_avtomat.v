`timescale 1 ns / 10 ps
module test_avtomat;

reg clk_i;
reg [7:0] money_i;
reg button_change_r;
reg [5:0] buttom_i;

wire [7:0] change;
wire clk_r;
wire button_change;
wire [7:0] money_r;
wire [5:0] OUT, LED_r, buttom_r;
wire [2:0] Cola_count, Pepsi_count, Sitro_count, Milk_count, Water_count, Tomatos_count;

assign money_r = money_i;
assign clk_r = clk_i;
assign buttom_r = buttom_i;
assign button_change = button_change_r;

coin_avtomat TEST (clk_r, money_r, button_change, buttom_r, LED_r, change,  OUT, Cola_count, Pepsi_count, Sitro_count, Milk_count, Water_count, Tomatos_count);

initial
begin
clk_i = 1'b0;
forever #3 clk_i = ~ clk_i;
end

initial 
begin
button_change_r <= 0;
#280 button_change_r <= 1;
#10 button_change_r <= 0; 
#100 button_change_r <= 1;
#6 button_change_r <= 0;
#50 button_change_r <= 1;
#6 button_change_r <= 0;
end


initial
begin

money_i <= 5;
#50 money_i = 10;
#47 money_i = 15;
#47 money_i = 20;
#47 money_i = 15;
#50 money_i = 40;
#80 money_i = 100;
#90 money_i = 40;
#50 money_i = 35;
#50 money_i = 55;
#90 money_i = 40;
#50 money_i = 35;
end

initial
begin
buttom_i <= 0;
#250 buttom_i = 1; 
#10 buttom_i = 0;
#20 buttom_i = 1;
#10 buttom_i = 0;
#50 buttom_i[4] = 1;
#10 buttom_i[4] = 0;
#30 buttom_i[3] = 1;
#15 buttom_i[3] = 0;
#50 buttom_i[3] = 1;
#10 buttom_i[3] = 0;
end

endmodule

