module mALU (input [7:0] inDataA, 
				 input [7:0] inDataB, 
				 input [7:0] inOpcode,
				 input inCLK, 
				 input inRST, 
				 input inEnableOut, 
				 input Su, 
				 output reg [7:0] outQ, 
				 output tri [7:0] outData, 
				 output reg outSignFlag, 
				 output reg outZeroFlag);	
 																		
wire nCarry0, nCarry1, nCarry2, nCarry3, nCarry4, nCarry5, nCarry6, nCarry7, outCarryOut;
wire nBinput0, nBinput1, nBinput2, nBinput3, nBinput4, nBinput5, nBinput6, nBinput7;
wire [7:0] wQ;
wire nIncDecSig, nIorD;
wire [7:0] noutDataA, QFlag;

assign nIncDecSig = (inOpcode == (8'h3C||8'h3D)) ? 1:0;
assign nIorD = (inOpcode == (8'h3D)) ? 1:0;

mINC_DEC IncrementDecrement(.inDataA(inDataA), .IncDecSig(nIncDecSig), .sIorD(nIorD), .outDataA(noutDataA));

assign nBinput0 = inDataB[0]^Su;
assign nBinput1 = inDataB[1]^Su;
assign nBinput2 = inDataB[2]^Su;
assign nBinput3 = inDataB[3]^Su;
assign nBinput4 = inDataB[4]^Su;
assign nBinput5 = inDataB[5]^Su;
assign nBinput6 = inDataB[6]^Su;
assign nBinput7 = inDataB[7]^Su;
assign outCarryOut = nCarry7;

mFullAdder Full_Adder_0 (.inA(inDataA[0]), .inB(nBinput0), .inC(Su), .outSum(wQ[0]), .outCarryOut(nCarry0));
mFullAdder Full_Adder_1 (.inA(inDataA[1]), .inB(nBinput1), .inC(nCarry0), .outSum(wQ[1]), .outCarryOut(nCarry1));
mFullAdder Full_Adder_2 (.inA(inDataA[2]), .inB(nBinput2), .inC(nCarry1), .outSum(wQ[2]), .outCarryOut(nCarry2));
mFullAdder Full_Adder_3 (.inA(inDataA[3]), .inB(nBinput3), .inC(nCarry2), .outSum(wQ[3]), .outCarryOut(nCarry3));
mFullAdder Full_Adder_4 (.inA(inDataA[4]), .inB(nBinput4), .inC(nCarry3), .outSum(wQ[4]), .outCarryOut(nCarry4));
mFullAdder Full_Adder_5 (.inA(inDataA[5]), .inB(nBinput5), .inC(nCarry4), .outSum(wQ[5]), .outCarryOut(nCarry5));
mFullAdder Full_Adder_6 (.inA(inDataA[6]), .inB(nBinput6), .inC(nCarry5), .outSum(wQ[6]), .outCarryOut(nCarry6));
mFullAdder Full_Adder_7 (.inA(inDataA[7]), .inB(nBinput7), .inC(nCarry6), .outSum(wQ[7]), .outCarryOut(nCarry7));

always@(inEnableOut or inRST)		
begin
	if(!inRST)
		outQ <= 0;
	else if (inOpcode==8'h80 || inOpcode==8'h81 || inOpcode==8'h90 || inOpcode==8'h91)			//ADD and SUB		
					outQ <= wQ;					
	else if (inOpcode==8'hA0 || inOpcode==8'hA1)		//AND
					outQ <= inDataA & inDataB;				
	else if (inOpcode==8'hB0 || inOpcode==8'hB1)		//OR
					outQ <= inDataA | inDataB;				
	else if (inOpcode==8'hA8 || inOpcode==8'hA9)		//XOR
					outQ <= inDataA ^ inDataB;				
	else if (inOpcode==8'h3C)					//INCREMENT
					outQ <= noutDataA;
	else if (inOpcode==8'h3D)					//DECREMENT
					outQ <= noutDataA;
	else if (inOpcode==8'h17)  					//ROTATE LEFT
			begin
					outQ <= inDataA << 1;
					outQ[0] <= (inDataA[7]);
			end
	else if (inOpcode==8'h1F) 					//ROTATE RIGHT							
			begin
					outQ <= inDataA >> 1;
					outQ[7] <= (inDataA[0]);
			end
	else						
					outQ <= outQ;																		
	end

initial
begin
outSignFlag <= 1'b0;
outZeroFlag <= 1'b0;
end

assign QFlag = outQ;

always @ (posedge inCLK)
	begin
		if (QFlag[7] == 1)
			begin
				outSignFlag <= 1'b1;
			end
		else
			begin
				outSignFlag <= 1'b0;
			end
			
		if (QFlag == 8'h00)
			begin
				outZeroFlag <= 1'b1;
			end
		else
			begin
				outZeroFlag <= 1'b0;
			end

	end

bufif1(outData[0], outQ[0], inEnableOut);
bufif1(outData[1], outQ[1], inEnableOut);
bufif1(outData[2], outQ[2], inEnableOut);
bufif1(outData[3], outQ[3], inEnableOut);	
bufif1(outData[4], outQ[4], inEnableOut);
bufif1(outData[5], outQ[5], inEnableOut);
bufif1(outData[6], outQ[6], inEnableOut);
bufif1(outData[7], outQ[7], inEnableOut);

endmodule

