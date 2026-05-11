# 8:1 Multiplexer

## What this does
An 8-to-1 combinational multiplexer that selects one of eight 4-bit input words and routes the selected word to the 4-bit output based on a 3-bit select signal.

## Files
| File | Description |
|------|-------------|
| mux8_1.v | RTL source |
| mux8_1_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Gate-level synthesis and timing report |

## Simulation result
![Waveform](mux8_1_mapped.svg)

## Synthesis (Sky130 + Yosys/OpenSTA)
| Resource | Used |
|----------|------|
| MUX4 cells | 8 |
| MUX2 cells | 4 |
| Sequential cells | 0 |
| Clock ports | Not applicable (combinational design) |

## What I learned
- Learned how a wide bus can represent multiple packed inputs, where a 32-bit vector stores eight 4-bit words.
- Understood how synthesis maps a behavioral multiplexer into optimized standard cells such as `mux4_2` and `mux2_1`.
- Observed that combinational designs do not require a clock, so timing scripts referencing `clk` generate warnings in OpenSTA.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave