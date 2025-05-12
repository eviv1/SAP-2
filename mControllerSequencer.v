module mControllerSequencer(input [7:0] inData, // Input from IR
									 input inCLK, inRST, iZflag, // Clock, Reset, Zero Flag from ALU
									 output oHLT, // Halt output signal
									 output[17:0] oTstate, // Tstate from Ring Counter
									 //Output Control Signals
									 output oLmar, oLmarc, oLmdr, oLi, oLa, oLb, oLc, oLtmp, oLo, oLpcl, oLpcu,
									 output oEi, oEp, oEmdr, oCE, oEa, oEb, oEc, oEtmp, oEu, oL1, oL2, oEpcu, oEpcl,
									 output oCp, oRST, oRDWR, oCLK_RST,
									 output Su);

// Wires to connect Instruction Decoder output to Control Matrix input. Opcode(ID) to Control Signals(CM)
wire nADD_B, nADD_C, nANA_B, nANA_C, nCALL_add, nDCR_A, nHLT, nIN_byte, nINR_A, nJMP_add, nJZ_add, 
		nLDA_add, nMOV_AB, nMOV_AC, nMOV_BA, nMOV_CA, nMVI_Abyte, nNOP, nORA_B, nORA_C, nOUT_byte,nRAL, 
		nRAR, nRET, nSTA_add, nSUB_B, nSUB_C, nXRA_B, nXRA_C;
		
 //Tstates wires
wire [17:0] nT, nTbar, nTstate;

//Ringcounter reset wire
wire nRingCounterReset; 

//Concatenate ring counter output bits 17 to 1 with bar output bit 0
assign oTstate = {nT[17:1], nTbar[0]};

//Connect halt wire to output halt
assign oHLT = nHLT;

// Ring Counter reset wire if inRST and NOP = 1
assign nRingCounterReset = (~inRST) & (~nNOP);

//Ring counter for Tstates
mRingCounter RingCounter(.inCLK(inCLK), .inRST(inRST), .outRC(nT), .outRCB(nTbar)); 

//Instruction Decoder for hex opcode to operation
mInstructionDecoder InstructionDecoder(.inData(inData), .oADD_B(nADD_B), .oADD_C(nADD_C), .oANA_B(nANA_B), .oANA_C(nANA_C), .oCALL_add(nCALL_add), 
					.oDCR_A(nDCR_A), .oHLT(nHLT), .oIN_byte(nIN_byte), .oINR_A(nINR_A), .oJMP_add(nJMP_add), .oJZ_add(nJZ_add), .oLDA_add(nLDA_add),
					.oMOV_AB(nMOV_AB), .oMOV_AC(nMOV_AC), .oMOV_BA(nMOV_BA), .oMOV_CA(nMOV_CA), .oMVI_Abyte(nMVI_Abyte), .oNOP(nNOP), .oORA_B(nORA_B), 
					.oORA_C(nORA_C), .oOUT_byte(nOUT_byte), .oRAL(nRAL), .oRAR(nRAR), .oRET(nRET), .oSTA_add(nSTA_add), .oSUB_B(nSUB_B), .oSUB_C(nSUB_C),
					.oXRA_B(nXRA_B), .oXRA_C(nXRA_C));

//Control Matrix for operation to control signals for every Tstate		
mControlMatrix ControlMatrix(.iTstate({nT[17:1], nTbar[0]}), .iADD_B(nADD_B), .iADD_C(nADD_C), .iSUB_B(nSUB_B), .iSUB_C(nSUB_C), .iANA_B(nANA_B), 
					.iANA_C(nANA_C), .iORA_B(nORA_B), .iORA_C(nORA_C), .iXRA_B(nXRA_B), .iXRA_C(nXRA_C), .iCALL(nCALL_add), .iRET(nRET), .iDCRA(nDCR_A),
					.iINRA(nINR_A), .iNOP(nNOP), .iHLT(nHLT), .iIN(nIN_byte), .iOUT(nOUT_byte), .iJMP(nJMP_add), .iJZ(nJZ_add), .iLDA(nLDA_add), 
					.iMOVAB(nMOV_AB), .iMOVAC(nMOV_AC), .iMOVBA(nMOV_BA), .iMOVCA(nMOV_CA), .iMVIA(nMVI_Abyte), .iRAL(nRAL), .iRAR(nRAR), .iSTA(nSTA_add), 
					.iZeroFlag(iZflag), .oLmar(oLmar),  .oLmarc(oLmarc), .oLmdr(oLmdr), .oLi(oLi), .oLa(oLa),  .oLb(oLb),  .oLc(oLc),  .oLtmp(oLtmp),  
					.oLo(oLo), .oLpcl(oLpcl), .oLpcu(oLpcu), .oEi(oEi), .oEp(oEp),  .oEmdr(oEmdr), .oCE(oCE), .oEa(oEa), .oEb(oEb), .oEc(oEc), .oEtmp(oEtmp), 
					.oEu(oEu), .oL1(oL1), .oL2(oL2), .oEpcu(oEpcu), .oEpcl(oEpcl), .oCp(oCp), .oRST(oRST), .oRDWR(oRDWR), .oCLK_RST(oCLK_RST), .Su(Su));
					
endmodule
