module m8bitFlipFlop_D_PosedgeCLK_Enable(input [7:0] inData, 
													  input inCLK,	
													  input inLoad,
													  output reg [7:0] outData);
													  
always @ (posedge inCLK)
	if (inLoad == 1'b1)
		begin
		outData = inData;
		end
		

endmodule
