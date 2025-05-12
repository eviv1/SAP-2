module mAccumulator(input [7:0] inData, 
						  input inCLK, 
						  input inLoad, 
						  input inEnable, 
						  output [7:0] outData, 
						  output [7:0] outBus);

mFlipFlop_D_PosedgeCLK_Enable Acc_0(.inData(inData[0]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[0]));
mFlipFlop_D_PosedgeCLK_Enable Acc_1(.inData(inData[1]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[1]));
mFlipFlop_D_PosedgeCLK_Enable Acc_2(.inData(inData[2]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[2]));
mFlipFlop_D_PosedgeCLK_Enable Acc_3(.inData(inData[3]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[3]));
mFlipFlop_D_PosedgeCLK_Enable Acc_4(.inData(inData[4]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[4]));
mFlipFlop_D_PosedgeCLK_Enable Acc_5(.inData(inData[5]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[5]));
mFlipFlop_D_PosedgeCLK_Enable Acc_6(.inData(inData[6]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[6]));
mFlipFlop_D_PosedgeCLK_Enable Acc_7(.inData(inData[7]), .inCLK(inCLK), .inLoad(inLoad), .outData(outData[7]));

bufif1(outBus[0], outData[0], inEnable);
bufif1(outBus[1], outData[1], inEnable);
bufif1(outBus[2], outData[2], inEnable);
bufif1(outBus[3], outData[3], inEnable);
bufif1(outBus[4], outData[4], inEnable);
bufif1(outBus[5], outData[5], inEnable);
bufif1(outBus[6], outData[6], inEnable);
bufif1(outBus[7], outData[7], inEnable);

endmodule

