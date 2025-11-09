# Verilog HDL

A Hardware Description Language (HDL).


## Data types in verilog
## net
It is continuously driven and cannot hold a value.
For assigning value to this type of variable we normally used assign keyword.

These includes:
- wire (continuous assignment) 
- wand 
- wor
- supply0 (GND)
- supply1 (vcc)

### wire:
Most used data type. This represent continuous assignment. if input changes than output must be change immediately (definitely after gate delay) there no dependency on clk signals. 

### wand wor:
wire with and/or. but what does it means ? multiple ckt can assign output to signal wire and the final output will be either and/or of output

```verilog
module top_module( 
    input a, 
    input b, 
    output out );

    wand out;
    assign out = a & b;
    assign out = a | b;
endmodule
```
## register
A register is a variable that can holds a value. it does not necessary means that it map to hardware register. In verilog a combinatorial ckt also contain a variable of register data type.

assignment: 

It includes: 
- reg : most widely used
- integer : used for loop counting
- real used to store floating point number
- time : keeps track of simulation time (not used in synthesis of hardware)

### reg:
a variable declared of type reg can be only of un sign value 


## value support by verilog 
- 0 (logic state 0)
- 1 (logic state 1)
- x (unknown logic state)  (all uninitialized nets contains )
- z (high impedance state) (all uninitialized nets contains )


## vectors:
'net' or 'reg' both can be declared as vectors of multiple bits widths
if bit width is not specified default size is one bit
*syntax*: wire/reg a[range1: range2]
where ranges1 is msb and range2 is lsb

### convention:
is to use sum[7:0] where 7 is the msb. 
you can use sum[1:8] but here 1 is the msb array will be like this 1,2,3,4,5,6,7,8
so you can access its msb like this sum[1] but generally msb has large index so we should get msb by using the largest index value therefore we follow this convention. (hope you understand this) 

### slices 
if you are aware of slices in high level programming language it is excatly  the same 
consider this example of Instruction register (IR):
```verilog
reg[31:0]IR;
reg[5:0]opcode;
reg [4,0] reg1, reg2,reg3;
reg [10:0] offset;

// now getting all the values from IR
opcode= IR[31:26];
reg1= IR[25:21];
reg2= IR[20:16];
reg3= IR[15:11];
offset= IR[10:0];
```

### Multi Dimension Array;
``` verilog
    reg [15:0] mem_word[0:1023]; // 1k 16bit words 
```


## specifying constant values

A constant value may be specified in either sized or unsized form.
*syntax* : <size>'<base><number>

examples:
```verilog
4'b0101;  // 4 bit binary number
1'b0;  // logic 0 or 1
12'hB3C; // 12bit hex number
25;  // signed number, 32bits (architecture dependent) (unsized)
```


## parameters 

if you are aware of constants in c program.
`#define pi 3.14`

in verilog we have similar concept 
```verilog
parameter RED =  3'b100; 
```
now instead of using 3'b100 number we can used the constant name RED. This improves the readability of program.
