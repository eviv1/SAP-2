module mDEMUX_1x2 (input [7:0] inData,
						input inSelect,
						output reg [7:0] outQA,
						output reg [7:0] outQB);

always @ (inSelect)
	if (inSelect == 1'b0)
		begin
			outQA <= inData;
			outQB <= 8'bzzzzzzzz;
		end
	else
		begin
			outQA <= 8'bzzzzzzzz;
			outQB <= inData;
		end
		
endmodule
