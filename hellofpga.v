`timescale 1ns / 1ps
module hellofpga(
    input [3:0] SW,
    input CLK,
    output [7:0] LED
    );

reg [23:0] count;
reg [7:0]LED_display;
reg [7:0]temp, revise;

always@(posedge CLK)begin
	if(SW == 4'b0001)
		LED_display <= 8'h01;
	else if(SW == 4'b0010)begin
		count <= count + 1;
		if(count == 24'h000000)begin
			LED_display <= temp;
			temp <= {temp[6:0],temp[7]};
		end
	end else if(SW == 4'b0100)begin
		count <= count + 1;
		if(count == 24'h000000)begin
			LED_display <= temp;
			temp <= {temp[0],temp[7:1]};
		end
	end else if(SW == 4'b1000)begin
		count <= count + 1;
		if(count == 24'h000000)begin
			LED_display <= revise;
			revise <= {revise[0],revise[7:1]};
		end
	end else begin
		count <= 24'h000000;
		temp <= 8'h01;
		revise <= 8'b01010101;
		LED_display <= 8'h00;
	end
	
end
assign LED = LED_display;

endmodule
