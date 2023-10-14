# Carry Lookahead Adder

This is a generic, parameterized (sort of), implementation of a Ripple Carry Adder (RCA) in Verilog. It's been verified to work up to 64 bits, but nothing beyond that.

### Generic Synth
Command used: ```yosys -p 'synth -top rca' rca.v```

Equation: 0x<sup>2</sup> + 3x + 0 <br/>
R<sup>2</sup>: 1

|XLEN|BUF|NOT|AND|NAND|ANDNOT|OR|NOR|ORNOT|XOR|XNOR|AOI3|OAI3|AOI4|OAI4|MUX|NMUX|MUX4|MUX8|MUX16|TBUF|Total Cells|
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|1|0|0|0|0|0|0|0|0|0|2|0|0|0|0|1|0|0|0|0|0|3|
|2|0|0|0|0|0|0|0|0|0|4|0|0|0|0|2|0|0|0|0|0|6|
|4|0|0|0|0|0|0|0|0|0|8|0|0|0|0|4|0|0|0|0|0|12|
|8|0|0|0|0|0|0|0|0|0|16|0|0|0|0|8|0|0|0|0|0|24|
|16|0|0|0|0|0|0|0|0|0|32|0|0|0|0|16|0|0|0|0|0|48|
|32|0|0|0|0|0|0|0|0|0|64|0|0|0|0|32|0|0|0|0|0|96|
|64|0|0|0|0|0|0|0|0|0|128|0|0|0|0|64|0|0|0|0|0|192|
|128|0|0|0|0|0|0|0|0|0|256|0|0|0|0|128|0|0|0|0|0|384|

### ECP5
Command used: ```yosys -p 'synth_ecp5 -top rca' rca.v```

Equation[^1]: (-5.98E-04)x<sup>2</sup> + 7.51x - 5.54 <br/>
R<sup>2</sup>: 0.999

[^1]: Not entirely accurate, huge margin for error

|XLEN|PFUMX|LUT4|L6MUX21|Total Cells|
|-|-|-|-|-|
|1|0|2|0|2|
|2|2|5|0|7|
|4|4|10|0|14|
|8|13|32|6|51|
|16|26|70|15|111|
|32|45|146|30|221|
|64|90|300|63|453|
|128|180|601|126|907|
