module mMUX_2x1(input [7:0] inA,
					 input [7:0] inB,
					 input inSelect,
					 output reg [7:0] outQ);
					 
always@(inSelect)
if(inSelect)
	outQ <= inA;
else if (~inSelect)
	outQ <= inB;
	
endmodule
