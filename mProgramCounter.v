module mProgramCounter(input inINC, 
							  input inEnableOut, 
				           input inCLK, 
							  input [15:0] inData,
							  input inRST,
							  input inPRST,
							  output [15:0] outQP,
							  output tri[15:0] tWbus);
	
wire [15:0] nProgramCounter;

mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_0 (.inT(inINC), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[0]), .inRST(inRST), .outQ(nProgramCounter[0]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_1 (.inT(inINC&nProgramCounter[0]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[1]), .inRST(inRST), .outQ(nProgramCounter[1]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_2 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[2]), .inRST(inRST), .outQ(nProgramCounter[2]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_3 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[3]), .inRST(inRST), .outQ(nProgramCounter[3]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_4 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[4]), .inRST(inRST), .outQ(nProgramCounter[4]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_5 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[5]), .inRST(inRST), .outQ(nProgramCounter[5]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_6 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[6]), .inRST(inRST), .outQ(nProgramCounter[6]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_7 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[7]), .inRST(inRST), .outQ(nProgramCounter[7]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_8 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[8]), .inRST(inRST), .outQ(nProgramCounter[8]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_9 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[9]), .inRST(inRST), .outQ(nProgramCounter[9]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_10 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[10]), .inRST(inRST), .outQ(nProgramCounter[10]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_11 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]&nProgramCounter[10]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[11]), .inRST(inRST), .outQ(nProgramCounter[11]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_12 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]&nProgramCounter[10]&nProgramCounter[11]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[12]), .inRST(inRST), .outQ(nProgramCounter[12]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_13 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]&nProgramCounter[10]&nProgramCounter[11]&nProgramCounter[12]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[13]), .inRST(inRST), .outQ(nProgramCounter[13]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_14 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]&nProgramCounter[10]&nProgramCounter[11]&nProgramCounter[12]&nProgramCounter[13]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[14]), .inRST(inRST), .outQ(nProgramCounter[14]));
mFlipFlop_T_PosedgeCLK_NRST ProgramCounter_15 (.inT(inINC&nProgramCounter[0]&nProgramCounter[1]&nProgramCounter[2]&nProgramCounter[3]&nProgramCounter[4]&nProgramCounter[5]&nProgramCounter[6]&nProgramCounter[7]&nProgramCounter[8]&nProgramCounter[9]&nProgramCounter[10]&nProgramCounter[11]&nProgramCounter[12]&nProgramCounter[13]&nProgramCounter[14]), .inCLK(inCLK), .inPRST(inPRST), .inDPRST(inData[15]), .inRST(inRST), .outQ(nProgramCounter[15]));

assign outQP[15:0] = nProgramCounter[15:0];

bufif1(tWbus[0], nProgramCounter[0],inEnableOut);
bufif1(tWbus[1], nProgramCounter[1],inEnableOut);
bufif1(tWbus[2], nProgramCounter[2],inEnableOut);
bufif1(tWbus[3], nProgramCounter[3],inEnableOut);
bufif1(tWbus[4], nProgramCounter[4],inEnableOut);
bufif1(tWbus[5], nProgramCounter[5],inEnableOut);
bufif1(tWbus[6], nProgramCounter[6],inEnableOut);
bufif1(tWbus[7], nProgramCounter[7],inEnableOut);
bufif1(tWbus[8], nProgramCounter[8],inEnableOut);
bufif1(tWbus[9], nProgramCounter[9],inEnableOut);
bufif1(tWbus[10], nProgramCounter[10],inEnableOut);
bufif1(tWbus[11], nProgramCounter[11],inEnableOut);
bufif1(tWbus[12], nProgramCounter[12],inEnableOut);
bufif1(tWbus[13], nProgramCounter[13],inEnableOut);
bufif1(tWbus[14], nProgramCounter[14],inEnableOut);
bufif1(tWbus[15], nProgramCounter[15],inEnableOut);

endmodule
