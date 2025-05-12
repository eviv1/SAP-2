module mRingCounter(input inCLK, 
						  input inRST, 
						  output [17:0] outRC, 
						  output [17:0] outRCB);

	mFlipFlop_JK_PosedgeCLK_NRST RingCount_0(.inJ(outRCB[17]), .inK(outRC[17]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[0]), .outQB(outRCB[0]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_1(.inJ(outRCB[0]), .inK(outRC[0]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[1]), .outQB(outRCB[1]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_2(.inJ(outRC[1]), .inK(outRCB[1]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[2]), .outQB(outRCB[2]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_3(.inJ(outRC[2]), .inK(outRCB[2]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[3]), .outQB(outRCB[3]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_4(.inJ(outRC[3]), .inK(outRCB[3]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[4]), .outQB(outRCB[4]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_5(.inJ(outRC[4]), .inK(outRCB[4]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[5]), .outQB(outRCB[5]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_6(.inJ(outRC[5]), .inK(outRCB[5]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[6]), .outQB(outRCB[6]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_7(.inJ(outRC[6]), .inK(outRCB[6]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[7]), .outQB(outRCB[7]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_8(.inJ(outRC[7]), .inK(outRCB[7]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[8]), .outQB(outRCB[8]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_9(.inJ(outRC[8]), .inK(outRCB[8]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[9]), .outQB(outRCB[9]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_10(.inJ(outRC[9]), .inK(outRCB[9]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[10]), .outQB(outRCB[10]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_11(.inJ(outRC[10]), .inK(outRCB[10]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[11]), .outQB(outRCB[11]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_12(.inJ(outRC[11]), .inK(outRCB[11]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[12]), .outQB(outRCB[12]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_13(.inJ(outRC[12]), .inK(outRCB[12]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[13]), .outQB(outRCB[13]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_14(.inJ(outRC[13]), .inK(outRCB[13]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[14]), .outQB(outRCB[14]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_15(.inJ(outRC[14]), .inK(outRCB[14]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[15]), .outQB(outRCB[15]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_16(.inJ(outRC[15]), .inK(outRCB[15]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[16]), .outQB(outRCB[16]));
	mFlipFlop_JK_PosedgeCLK_NRST RingCount_17(.inJ(outRC[16]), .inK(outRCB[16]),.inCLK(inCLK), .inRST(inRST), .outQ(outRC[17]), .outQB(outRCB[17]));

endmodule
