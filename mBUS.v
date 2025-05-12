module mBUS (input [15:0] inData,
				 input [7:0] UpByte,
				 input Epcu, Epcl, Lpcl, Lpcu, Lmarc, L1, L2, Lmar, Lmdr, iRDWR,
				 input La, Lb, Lc, Ltmp, Lo, Ei, Ep, Emdr, Ea, Eb, Ec, Etmp, Eu,
				 output reg [15:0] outData);

always@(inData or Epcu or Epcl or Lpcl or Lpcu or Lmarc or L1 or L2
		  or Lmar or Lmdr or La or Lb or Lc or Ltmp or Lo or Ei or Ep or Emdr
		  or Ea or Eb or Ec or Etmp or Eu)
begin
	if (L1)
		outData <= 16'h00FF;
	else if (L2)
		outData <= 16'h00FE;
	else if (Lmarc)
		outData <= {UpByte,inData[7:0]};
	else if (Lpcu)
		outData[15:8] <= inData[7:0];
	else if (Epcu)
		outData[7:0] <= inData[15:8];
	else if (Epcl | Lpcl | (Emdr&~iRDWR) | (Lmdr&iRDWR) | La | Lb | Lc | Ltmp | Lo | Ei
				| Ea | Eb | Ec | Etmp | Eu)
		outData[7:0] <= inData[7:0];	
	else if (Lmar | Ep)
		outData <= inData;
	else
		outData <= 16'hzzzz;
end

endmodule
