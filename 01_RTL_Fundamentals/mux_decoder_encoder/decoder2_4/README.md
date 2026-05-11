# 2:4 Decoder

## What this does
A 2-to-4 combinational decoder that activates exactly one output line corresponding to the 2-bit input value.

## Files
| File | Description |
|------|-------------|
| decoder2_4.v | RTL source |
| decoder2_4_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Gate-level synthesis and timing report |

## Simulation result
![Waveform](decoder2_4_mapped.svg)

## Synthesis (Sky130 + Yosys/OpenSTA)
| Resource | Used |
|----------|------|
| NOR2 cells | 1 |
| AND2 cells | 1 |
| Isolation buffer cells | 2 |
| Sequential cells | 0 |
| Clock ports | Not applicable (combinational design) |

## What I learned
- Learned how a decoder converts a binary input into a one-hot output pattern.
- Understood that synthesis can implement simple logic using optimized standard cells beyond just AND and NOT gates.
- Observed that combinational circuits do not require a clock, which is why OpenSTA reports a warning if the timing script references `clk`.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave