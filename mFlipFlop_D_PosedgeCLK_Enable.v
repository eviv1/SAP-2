module mFlipFlop_D_PosedgeCLK_Enable( input inData, 			
												  input inCLK,				
												  input inLoad,			
												  output reg outData);
												  
always @ (posedge inCLK)
	if (inLoad == 1'b1)
		begin
		outData = inData;
		end
		
endmodule
