module mB_Register (input [7:0] inData,
						  input inCLK,
						  input inLoad,
						  input inEnableOut,
						  output wire [7:0] outMemory,
						  output [7:0] outData);
						  
	mFlipFlop_D_PosedgeCLK_Enable Reg_0(.inData(inData[0]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[0]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_1(.inData(inData[1]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[1]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_2(.inData(inData[2]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[2]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_3(.inData(inData[3]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[3]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_4(.inData(inData[4]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[4]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_5(.inData(inData[5]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[5]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_6(.inData(inData[6]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[6]));
	mFlipFlop_D_PosedgeCLK_Enable Reg_7(.inData(inData[7]), .inCLK(inCLK), .inLoad(inLoad), .outData(outMemory[7]));

	bufif1 o0(outData[0], outMemory[0], inEnableOut);
	bufif1 o1(outData[1], outMemory[1], inEnableOut);
	bufif1 o2(outData[2], outMemory[2], inEnableOut);
	bufif1 o3(outData[3], outMemory[3], inEnableOut);
	bufif1 o4(outData[4], outMemory[4], inEnableOut);
	bufif1 o5(outData[5], outMemory[5], inEnableOut);
	bufif1 o6(outData[6], outMemory[6], inEnableOut);
	bufif1 o7(outData[7], outMemory[7], inEnableOut);
 
 endmodule
