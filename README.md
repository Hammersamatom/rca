# Ripple Carry Adder

This is a generic, parameterized (sort of), implementation of a Ripple Carry Adder (RCA) in Verilog. It's been verified to work up to 64 bits, but nothing beyond that.

### Generic Synth
Command used: ```yosys -p 'synth -top rca' rca.v```

Equation: 0x<sup>2</sup> + 5x + 0 <br/>
R<sup>2</sup>: 1

|XLEN|AND|ANDNOT|NAND|NOR|NOT|ORNOT|XNOR|XOR|Total Cells|
|-|-|-|-|-|-|-|-|-|-|
|1|0|1|1|0|0|1|2|0|5|
|2|0|2|2|0|0|2|4|0|10|
|4|0|4|4|0|0|4|8|0|20|
|8|0|8|8|0|0|8|16|0|40|
|16|0|16|16|0|0|16|32|0|80|
|32|0|32|32|0|0|32|64|0|160|
|64|0|64|64|0|0|64|128|0|320|
|128|0|128|128|0|0|128|256|0|640|

### ECP5
Command used: ```yosys -p 'synth_ecp5 -top rca' rca.v```

Equation[^1]: (2.68E-03)x<sup>2</sup> + 6.72x - 0.04 <br/>
R<sup>2</sup>: 0.999

[^1]: Not entirely accurate, huge margin for error

|XLEN|PFUMX|LUT4|L6MUX21|Total Cells|
|-|-|-|-|-|
|1|0|2|0|2|
|2|2|5|0|7|
|4|4|10|0|14|
|8|13|32|6|51|
|16|23|68|15|106|
|32|45|135|30|210|
|64|91|286|63|440|
|128|180|591|126|897|
