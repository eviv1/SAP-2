module mOutput_Register	(input [7:0] inData,
								 input inCLK, 
								 input inLoadOutput,
								 output [7:0] outOutput_Register);
						 
m8bitFlipFlop_D_PosedgeCLK_Enable Reg(.inData(inData[7:0]), .inCLK(inCLK), .inLoad(inLoadOutput), .outData(outOutput_Register[7:0]));
	
endmodule


