module mControlMatrix(input [17:0] iTstate, 
							 input iADD_B, iADD_C, iSUB_B, iSUB_C,							//Arithmetic
									iANA_B, iANA_C, iORA_B, iORA_C, iXRA_B, iXRA_C,		//Logic
									iCALL, iRET,					//Call and Return
									iDCRA, iINRA,					//Increment and Decrement
									iNOP, iHLT, iIN, iOUT,		//No Op, Halt, Input, Output
									iJMP, iJZ, 						//Jump and Jump if Zero
									iLDA, iMOVAB, iMOVAC, iMOVBA, iMOVCA, iMVIA,		//Move 
									iRAL, iRAR, 					//Rotate Left and Right
									iSTA,								//Store
									iZeroFlag,						//ZeroFlag
							 output oLmar, oLmarc, oLmdr, oLi, oLa, oLb, oLc, oLtmp, oLo, oLpcl, oLpcu,			//Load
							 output oEi, oEp, oEmdr, oCE, oEa, oEb, oEc, oEtmp, oEu, oL1, oL2, oEpcu, oEpcl,				//Enable
							 output oCp, oRST, oRDWR, oCLK_RST,										//Count, Reset, Read_Write, Clock Reset
							 output Su);	//Opcodes

assign oLmar = ((iTstate[0]) || (iTstate[3] && (iMVIA || iJZ || iCALL || iJMP || iLDA || iRET || iSTA)) || (iTstate[6] && (iCALL || iRET || iLDA || iJMP || iSTA 
					|| (iJZ && iZeroFlag))) || (iTstate[9] && (iCALL)) || (iTstate[12] && (iCALL))) ? 1:0;
					
assign oLmarc = (iTstate[8] && (iLDA || iSTA)) ? 1:0;

assign oLmdr = ((iTstate[1]) || (iTstate[4] && (iMVIA || iJZ || iCALL || iLDA || iRET || iSTA || iJMP)) || (iTstate[7] && (iSTA || iCALL || iRET || iLDA || iJMP 
					|| (iJZ && iZeroFlag))) || (iTstate[9] && (iSTA || iLDA)) || (iTstate[10] && (iCALL)) || (iTstate[13] && (iCALL))) ? 1:0;
					
assign oLi = (iTstate[2]) ? 1:0;

assign oLa = ((iTstate[3] && (iDCRA || iINRA || iIN || iMOVAB || iMOVAC || iRAL || iRAR)) || (iTstate[4] && (iADD_B || iADD_C || iORA_B || iORA_C || iSUB_B || iSUB_C 
					|| iXRA_B || iXRA_C || iANA_B || iANA_C)) || (iTstate[5] && (iMVIA)) || (iTstate[10] && (iLDA))) ? 1:0;
					
assign oLb = ((iTstate[3] && (iMOVBA))) ? 1:0;

assign oLc = ((iTstate[3] && (iMOVCA))) ? 1:0;

assign oLtmp = ((iTstate[3] && (iADD_B || iADD_C || iORA_B || iORA_C || iSUB_B || iSUB_C || iXRA_B || iXRA_C || iANA_B || iANA_C))
					|| (iTstate[5] && (iJZ || iJMP || iLDA || iSTA || iRET)) || (iTstate[11] && (iCALL))) ? 1:0;
					
assign oLo = (iTstate[3] && iOUT) ? 1:0;

assign oLpcl = ((iTstate[9] && (iRET || iJMP || (iJZ && iZeroFlag))) || (iTstate[14] && (iCALL))) ? 1:0;

assign oLpcu = ((iTstate[8] && (iRET)) || (iTstate[9] && (iJMP || (iJZ && iZeroFlag))) || (iTstate[15] && (iCALL))) ? 1:0;


assign oEi = ((iTstate[3] && (iIN))) ? 1:0;

assign oEp = ((iTstate[0]) || (iTstate[3] && (iMVIA || iJZ || iJMP || iLDA || iSTA)) || (iTstate[9] && (iCALL)) || (iTstate[6] && (iJMP || iSTA || iLDA 
					|| (iJZ && iZeroFlag))) || (iTstate[12] && (iCALL))) ? 1:0;
					
assign oEmdr = ((iTstate[2]) || (iTstate[5] && (iJZ || iCALL || iJMP || iLDA || iRET || iSTA || iMVIA)) || (iTstate[8] && (iCALL)) 
					|| (iTstate[9] && (iJMP || iRET || (iJZ && iZeroFlag))) || (iTstate[10] && (iSTA || iLDA)) || (iTstate[11] && (iCALL))|| (iTstate[15] && (iCALL))) ? 1:0;
					
assign oCE = ((iTstate[1]) || (iTstate[4] && (iMVIA || iJZ || iJMP || iLDA || iRET || iSTA)) || (iTstate[7] && (iSTA || iJMP 
					|| iRET || iLDA || (iJZ && iZeroFlag))) || (iTstate[9] && (iLDA)) || (iTstate[10] && (iCALL)) || (iTstate[13] && (iCALL))) ? 1:0;
					
assign oEa = ((iTstate[3] && (iMOVBA || iMOVCA || iOUT)) || (iTstate[9] && (iSTA))) ? 1:0;

assign oEb = ((iTstate[3] && (iADD_B || iORA_B || iSUB_B || iXRA_B || iANA_B || iMOVAB))) ? 1:0;

assign oEc = ((iTstate[3] && (iADD_C || iORA_C || iSUB_C || iXRA_C || iANA_C || iMOVAC))) ? 1:0;

assign oEtmp = ((iTstate[8] && (iSTA || iRET || iJMP || iLDA || (iJZ && iZeroFlag))) || (iTstate[14] && (iCALL))) ? 1:0;

assign oEu = ((iTstate[3] && (iDCRA || iINRA || iRAL || iRAR)) || (iTstate[4] && (iADD_B || iADD_C || iORA_B 
					|| iORA_C || iSUB_B || iSUB_C || iXRA_B || iXRA_C || iANA_B || iANA_C))) ? 1:0;
assign oL1 = (iTstate[3] && (iCALL || iRET)) ? 1:0;

assign oL2 = (iTstate[6] && (iCALL || iRET)) ? 1:0;

assign oEpcu = (iTstate[4] && (iCALL)) ? 1:0;

assign oEpcl = (iTstate[7] && (iCALL)) ? 1:0;

assign oCp = ((iTstate[1]) || (iTstate[4] && (iMVIA || iJZ || iJMP || iLDA || iSTA)) || (iTstate[5] && (iJZ && !iZeroFlag)) 
					|| (iTstate[7] && (iLDA || iSTA)) || (iTstate[10] && (iRET)) || (iTstate[11] && (iCALL || iRET)) || (iTstate[13] && (iCALL))) ? 1:0;
					
assign oRST = ((iTstate[3] && iNOP) || (iTstate[4] && (iDCRA || iINRA || iIN || iOUT || iMOVBA || iMOVCA || iMOVAB || iMOVAC || iRAR || iRAL)) 
					|| (iTstate[5] && (iADD_B || iADD_C || iORA_B || iORA_C || iSUB_B || iSUB_C || iXRA_B || iXRA_C || iANA_B || iANA_C)) || (iTstate[6] && (iMVIA || (iJZ && !iZeroFlag)))
					|| (iTstate[10] && (iJMP || (iJZ && iZeroFlag))) || (iTstate[11] && (iLDA || iSTA)) || (iTstate[12] && (iRET)) || (iTstate[16] && (iCALL))) ? 0:1;
					
assign oRDWR = ((iTstate[4] && (iCALL)) || (iTstate[7] && (iCALL)) || (iTstate[5] && (iCALL)) 
					|| (iTstate[8] && (iCALL)) || (iTstate[9] && (iSTA)) || (iTstate[10] && (iSTA))) ? 1:0;  //0: Read, 1:Write
					
assign oCLK_RST = (iTstate[3] && iHLT) ? 1:0;

assign Su     = (iTstate[4] && (iSUB_B || iSUB_C)) ? 1:0; 

endmodule

