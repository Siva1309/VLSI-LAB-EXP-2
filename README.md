SIMULATION AND IMPLEMENTATION OF COMBINATIONAL LOGIC CIRCUITS

AIM: 
 To simulate and synthesis ENCODER, DECODER, MULTIPLEXER, DEMULTIPLEXER, MAGNITUDE COMPARATOR using vivado.

APPARATUS REQUIRED:
VIVADO 2023.1 software

PROCEDURE:

1. Open Vivado: Launch Xilinx Vivado software on your computer.

2. Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

3. Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

4. Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

5. Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

6. Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

7. Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

8. Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

9. View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.

**LOGIC DIAGRAM**

ENCODER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/3cd1f95e-7531-4cad-9154-fdd397ac439e)

VERILOG CODE:
```
module encoder(d,y);
input[7:0]d;
output[2:0]y;
or g1(y[0],d[7],d[6],d[5],d[4]);
or g2(y[1],d[7],d[6],d[3],d[2]);
or g3(y[2],d[7],d[5],d[3],d[1]);
endmodule

```
OUTPUT:

![image](https://github.com/Siva1309/VLSI-LAB-EXP-2/assets/166374356/10d0dd41-f0dd-4ae5-b415-b5e352a7ea81)


DECODER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/45a5e6cf-bbe0-4fd5-ac84-e5ad4477483b)

VERILOG CODE:
```
module decoder(a,b,c,y);
input a,b,c;
output [7:0]y;
wire w1,w2,w3;
not g1(w1,a);
not g2(w2,b);
not g3(w3,c);
and g4(y[0],w1,w2,w3);
and g5(y[1],w2,w1,c);
and g6(y[2],w3,w1,b);
and g7(y[3],w1,b,c);
and g8(y[4],a,w2,w3);
and g9(y[5],a,w2,c);
and g10(y[6],a,b,w3);
and g11(y[7],a,b,c);
endmodule
```

OUTPUT:

![image](https://github.com/Siva1309/VLSI-LAB-EXP-2/assets/166374356/c00bd747-240d-42d7-b6d8-b5d393674aa7)


MULTIPLEXER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/427f75b2-8e67-44b9-ac45-a66651787436)

VERILOG CODE:
```
module multiplexer(s0,s1,s2,d,y);
input[7:0]d;
input s0,s1,s2;
output y;
wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;
not g1(w0,s0);
not g2(w1,s1);
not g3(w2,s2);
and g4(w3,d[0],w0,w1,w2);
and g5(w4,w0,d[1],w1,s2);
and g6(w5,d[2],w0,s1,w2);
and g7(w6,d[3],w0,s1,s2);
and g8(w7,d[4],w2,s0,s1);
and g9(w8,d[5],s0,w1,s2);
and g10(w9,d[6],s0,s1,w2);
and g11(w10,d[7],s0,s1,s2);
or g12(y,w3,w4,w5,w6,w7,w8,w9,w10);
endmodule
```

OUTPUT:

![image](https://github.com/Siva1309/VLSI-LAB-EXP-2/assets/166374356/273cb1a4-6633-4461-a62f-c0fd17ed2ed9)


DEMULTIPLEXER

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/1c45a7fc-08ac-4f76-87f2-c084e7150557)

VERILOG CODE:
```
module demux(s,d,y);
input d;
input [2:0]s;
output[7:0]y;
wire w1,w2,w3;
not g1(w1,s[0]);
not g2(w2,s[1]);
not g3(w3,s[2]);
and g4(y[0],d,w1,w2,w3);
and g5(y[1],d,w1,s[0],w3);
and g6(y[2],d,w3,s[1],w1);
and g7(y[3],d,s[0],s[1],w3);
and g8(y[4],d,s[2],w1,w2);
and g9(y[5],d,s[2],s[0],w2);
and g10(y[6],d,w1,s[1],s[2]);
and g11(y[7],d,s[2],s[1],s[0]);
endmodule
```

OUTPUT:

![image](https://github.com/Siva1309/VLSI-LAB-EXP-2/assets/166374356/ad147b06-e8e5-49f6-a25f-fd0e81515ca6)


MAGNITUDE COMPARATOR

![image](https://github.com/navaneethans/VLSI-LAB-EXP-2/assets/6987778/b2fe7a05-6bf7-4dcb-8f5d-28abbf7ea8c2)

VERILOG CODE:
```
module magnitude(a,b,great,less,equal);
input[1:0]a,b;
output reg great,less,equal;
always@(*)
begin
if(a>b)
begin 
great=1'b1;
less=1'b0;
equal=1'b0;
end 
else if(a<b)
begin
great=1'b0;
less=1'b1;
equal=1'b0;
end 
else 
begin
great=1'b0;
less=1'b0;
equal=1'b1;
end 
end 
endmodule
```

OUTPUT:

![image](https://github.com/Siva1309/VLSI-LAB-EXP-2/assets/166374356/2467c209-6261-4339-9753-2224aa1277fd)


RESULT:
   Thus the simulation and synthesis of ENCODER, DECODER, MULTIPLEXER, DEMULTIPLEXER, MAGNITUDE COMPARATOR using vivado is simulated successfully.


