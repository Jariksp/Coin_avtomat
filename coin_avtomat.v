module coin_avtomat (clk, money, button_change, buttom, LED, change, OUT, Cola_count, Pepsi_count, Sitro_count, Milk_count, Water_count, Tomatos_count);

input clk;
input [7:0] money;
input [5:0] buttom;
input [2:0] Cola_count, Pepsi_count, Sitro_count, Milk_count, Water_count, Tomatos_count;

output [5:0] LED, OUT;
output button_change;
output [7:0]change;

reg [5:0] LED_i = 0;
reg [5:0] OUT_i = 0; 
reg button_change_i;
reg [2:0] state;
reg [7:0] money_i = 0;
reg [7:0] change_i = 0;

reg [2:0] Cola_count_i = 5;
reg [2:0] Pepsi_count_i = 5;
reg [2:0] Sitro_count_i = 5;
reg [2:0] Milk_count_i = 5;
reg [2:0] Water_count_i = 5;
reg [2:0] Tomatos_count_i = 5;

parameter Cola = 10;
parameter Pepsi = 20;
parameter Sitro = 25;
parameter Milk = 35;
parameter Water = 40;
parameter Tomatos = 45;

always @ (posedge buttom[0])
begin
if(money >= Cola && Cola_count_i )
begin
OUT_i[0] = 1;
money_i <= money_i - Cola;
Cola_count_i <= Cola_count_i - 1;
end
OUT_i[0] <= 0;
end

always @(posedge buttom[1])
begin
if (money_i >= Pepsi && Pepsi_count_i)
begin
OUT_i[1] = 1;
money_i <= money_i - Pepsi;
Pepsi_count_i <= Pepsi_count_i - 1;
end
OUT_i[1] <= 0;
end

always @(posedge buttom[2])
begin
if (money_i >= Sitro && Sitro_count_i != 0)
begin
OUT_i[2] = 1;
money_i <= money_i - Sitro;
Sitro_count_i = Sitro_count_i - 1;
end
OUT_i[2] <= 0;
end

always @(posedge buttom[3])
begin
if (money_i >= Milk && Milk_count_i != 0)
begin
OUT_i[3] = 1;
money_i <= money_i - Milk;
Milk_count_i <= Milk_count_i - 1;
end
OUT_i[3] <= 0;
end

always @(posedge buttom[4])
begin
if (money_i >= Water && Water_count_i != 0)
begin
OUT_i[4] = 1;
Water_count_i <= Water_count_i - 1;
money_i <= money_i - Water;
end
OUT_i[4] <= 0;
end

always @(posedge buttom[5])
begin
if (money_i >= Tomatos && Tomatos_count_i != 0)
begin
OUT_i[5] = 1;
money_i <= money_i - Tomatos;
Tomatos_count_i <= Tomatos_count_i - 1;
end
OUT_i[5] <= 0;
end

always @(posedge button_change_i)  change_i = money_i;

always @(money_i, posedge clk)
begin
LED_i <= 0;
if(money_i >= Cola && Cola_count_i != 0) LED_i[0] <= 1;
if(money_i >= Pepsi && Pepsi_count_i != 0) LED_i[1] <= 1;
if(money_i >= Sitro && Sitro_count_i != 0) LED_i[2] <= 1;
if(money_i >= Milk && Milk_count_i != 0) LED_i[3] <= 1;
if(money_i >= Water && Water_count_i != 0) LED_i[4] <= 1;
if(money_i>= Tomatos && Tomatos_count_i != 0) LED_i[5] <= 1;
end

assign Cola_count = Cola_count_i;
assign Pepsi_count = Pepsi_count_i;
assign Sitro_count = Sitro_count_i;
assign Milk_count = Milk_count_i;
assign Water_count = Water_count_i;
assign Tomatos_count = Tomatos_count_i;
assign LED = LED_i;
assign OUT = OUT_i;
assign change = change_i;
assign button_change_i = button_change;
assign money_i = money;

endmodule


