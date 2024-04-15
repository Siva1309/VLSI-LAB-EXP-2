module demux(d, sel, z);
input d;
input [2:0] sel;
output [7:0] z;
reg [7:0] z;
always @(d or sel)
begin
if( sel==3'b000)
z[0]=d;
else if( sel==3'b001)
z[1]=d;
else if( sel==3'b010)
221-d;
else if( sel==3'b011)
z[3]=d;
else if( sel==3'b100)
z[4]=d;
else if( sel=3'b101)
z[5]=d;
else if( sel==3'bl10)
z[6]=d;
else
z[7]=d;
end
endmodule
