module mMPU(input inCLK,
				input inRST,
				input [7:0] inData,
				
				//outputs
				output [7:0] OutReg,
				output [15:0] oWbus, oPC,
				output [7:0] oMemory, oInst,
				output [7:0] oTMPREG, 
				output [7:0] oBReg,
				output [7:0] oCReg,
				output [7:0] oAcc,
				output [1:0] oFlag,
				output [17:0] oTstate,
				output [7:0] oMDRout,
				output [15:0] oMARout,
				
				//control signals
				output oEp, oCp, oLi, oHLT, oCLK, oLmar, oLmarc, oLmdr, oLa, oLb, oLc, oLtmp, oLo, 
				oLpcl, oLpcu, oEi, oEmdr, oCE, oEa, oEb, oEc, oEtmp, oEu, oL1, oL2, oEpcu, 
				oEpcl, oRST, oRDWR, oCLK_RST, Su);
				
assign oWbus = tWbus; 
assign oTstate = noTstate;
assign oAcc = noQACC;
assign oMemory = nMemOut;
assign oTMPREG = noQTMP;
assign oBReg = noQB;
assign oCReg = noQC;
assign oInst = nIRout;
assign oPC = noQP;
assign oMDRout = noQMDR;
assign oMARout = niAddress;
assign oFlag = {nSF, nZF};   	//Flag - Sign Flag, Zero Flag
assign nCLK = inCLK & ~oHLT;
assign oCLK = nCLK;

// control signals output
assign oCp = noCp;			// increment content of PC
assign oEp = noEp; 			// send content of PC
assign oHLT = noHLT; 		// halt control signal
assign oLi = noLi; 			// load contents to IR
assign oLmar = noLmar; 		// load MAR
assign oLmarc = noLmarc; 	// loading concatenated contents of MDR and TMP reg to MAR
assign oLmdr = noLmdr; 		// load contents to MDR
assign oLa = noLa; 			// load Accumulator
assign oLb = noLb; 			// load B register
assign oLc = noLc; 			// load C register
assign oLtmp = noLtmp; 		// load TMP reg
assign oLo = noLo; 			// load output reg
assign oLpcl = noLpcl; 		// load to lower byte of the PC
assign oLpcu = noLpcu; 		// load to upper byte of the PC
assign oEi = noEi; 			// enable input register contents to bus
assign oEmdr = noEmdr; 		// enable MDR contents to bus
assign oCE = noCE; 			// enable read and write memory
assign oEa = noEa; 			// enable accumulator contents to bus
assign oEb = noEb; 			// enable B register contents to bus
assign oEc = noEc; 			// enable C register contents to bus
assign oEtmp = noEtmp; 		// enable TMP register contents to bus
assign oEu = noEu; 			// enable ALU
assign oL1 = noL1; 			// loading last address to MAR
assign oL2 = noL2; 			// loading second to the last address to MAR
assign oEpcu = noEpcu; 		// enable tx of contents from upper byte of PC
assign oEpcl = noEpcl; 		// enable tx of contents from lower byte of PC
assign oRST = noRST; 		// reset PC
assign oRDWR = noRDWR; 		// if 0: read operation and place at W-bus; else write operation to overwrite memory
assign oCLK_RST = noCLK_RST; // resets the clock
assign Su = nSu; 				// enable subtraction instruction
				
wire [15:0] tWbus;
wire [15:0] ntWbus;
wire nCLK, nSF, nZF, noLp, noLm, noEpc;
	
wire noLmar, noLmarc, noLmdr, noLi, noLa, noLb, noLc, noLtmp, noLpcl, noLpcu;
wire noEi, noEp, noEmdr, noCE, noEa, noEb, noEc, noEtmp, noEu, noL1, noL2, noEpcu, noEpcl;
wire noCp, noRST, noRDWR, noCLR_RST;
wire nSu;

wire [7:0] nIRout, nMemOut, nMDRout, nMDRin, noQMDR, noQALU, noQACC, noQTMP, noQB, noQC, noQIN;
wire [15:0] niAddress, noQP;
wire [17:0] noTstate;

assign noLp = noLpcl | noLpcu;
assign noLm = noLmar | noLmarc;
assign noEpc = noEp | noEpcu | noEpcl;

//Bus
mBUS Bus(.inData(ntWbus), .UpByte(noQMDR), .Epcu(noEpcu), .Epcl(noEpcl), .Lpcu(noLpcu), .Lpcl(noLpcl), .Lmarc(noLmarc), 
			.L1(noL1), .L2(noL2), .Lmar(noLmar), .Lmdr(noLmdr), .iRDWR(noRDWR), .La(noLa), .Lb(noLb), .Lc(noLc), 
			.Ltmp(noLtmp), .Lo(noLo), .Ei(noEi), .Ep(noEp), .Emdr(noEmdr), 
			.Ea(noEa), .Eb(noEb), .Ec(noEc), .Etmp(noEtmp), .Eu(noEu), .outData(tWbus));

//ProgramCounter
mProgramCounter ProgramCounter(.inINC(noCp), .inEnableOut(noEpc), .inCLK(nCLK), .inData(tWbus), .inRST(noRST), 
			.inPRST(noLp), .outQP(noQP), .tWbus(ntWbus));

//Input Register
mInput_Register Input_Register(.inData(inData), .inCLK(nCLK), .inLoadInput(noLi), .inEnableINtoBus(noEi), .outQ(noQIN), 
			.outInput_Register(ntWbus[7:0]));

//Memory Address Register
mMAR MAR(.inData(tWbus), .inCLK(nCLK), .inLoad(noLm), .outData(niAddress));

//Memory
mMemory Memory(.inAddress(niAddress), .inData(nMDRout), .inCE(noCE), .inRDWR(noRDWR), .inCLK(nCLK), .outData(nMemOut), .tMDR(nMDRin));

//Memory Data Register
mMDR MDR(.inDataMem(nMDRin), .inDataBus(tWbus), .inCLK(nCLK), .inLoad_MDR(noLmdr), .inS_RW(noRDWR), .inEnableOut(noEmdr), .outQ(noQMDR), 
			.outDataBus(ntWbus[7:0]), .outDataMem(nMDRout));

//Instruction Register
mInstructionRegister InstructionRegister(.inData(tWbus[7:0]), .inCLK(nCLK), .inRST(~inRST), .inLoad(noLi), .outInst(nIRout));

//Controller-Sequencer
mControllerSequencer ControllerSequencer(.inData(nIRout), .inCLK(nCLK), .inRST(noRST), .iZflag(nZF), .oHLT(noHLT), .oTstate(noTstate), 
			.oLmar(noLmar), .oLmarc(noLmarc), .oLmdr(noLmdr), .oLi(noLi), .oLa(noLa), .oLb(noLb), .oLc(noLc), .oLtmp(noLtmp), .oLo(noLo), 
			.oLpcl(noLpcl), .oLpcu(noLpcu), .oEi(noEi), .oEp(noEp), .oEmdr(noEmdr), .oCE(noCE), .oEa(noEa), .oEb(noEb), .oEc(noEc), 
			.oEtmp(noEtmp), .oEu(noEu), .oL1(noL1), .oL2(noL2), .oEpcu(noEpcu), .oEpcl(noEpcl),
			.oCp(noCp), .oRST(noRST), .oRDWR(noRDWR), .oCLK_RST(noCLK_RST), .Su(nSu));

//Accumulator
mAccumulator Acc(.inData(tWbus[7:0]), .inCLK(nCLK), .inLoad(noLa), .inEnable(noEa), .outData(noQACC), .outBus(ntWbus[7:0]));

//ALU
mALU ALU(.inDataA(noQACC), .inDataB(noQTMP), .inCLK(nCLK), .inRST(~inRST), .inOpcode(nIRout), .inEnableOut(noEu), .Su(nSu), 
			.outQ(noQALU), .outData(ntWbus[7:0]), .outSignFlag(nSF), .outZeroFlag(nZF));

//TMP Register
mTMP_Register TMP(.inData(tWbus[7:0]), .inCLK(nCLK), .inLoad(noLtmp), .inEnableOut(noEtmp), .outMemory(noQTMP), .outData(ntWbus[7:0]));

//B Register
mB_Register B(.inData(tWbus[7:0]), .inCLK(nCLK), .inLoad(noLb), .inEnableOut(noEb), .outMemory(noQB), .outData(ntWbus[7:0]));

//C Register
mC_Register C(.inData(tWbus[7:0]), .inCLK(nCLK), .inLoad(noLc), .inEnableOut(noEc), .outMemory(noQC), .outData(ntWbus[7:0]));

//Output Register
mOutput_Register Output_Register(.inData(tWbus[7:0]), .inCLK(nCLK), .inLoadOutput(noLo), .outOutput_Register(OutReg));

endmodule
