# 4:2 Priority Encoder

## What this does
A 4-to-2 priority encoder that outputs the binary index of the highest-priority asserted input and generates a valid signal when at least one input is active.

## Files
| File | Description |
|------|-------------|
| priority_encoder.v | RTL source |
| priority_encoder_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Gate-level synthesis and timing report |

## Simulation result
![Waveform](p_encoder_mapped.svg)

## Synthesis (Sky130 + Yosys/OpenSTA)
| Resource | Used |
|----------|------|
| Inverter cells | 1 |
| OR3 cells | 1 |
| Complex logic cells | 2 |
| Sequential cells | 0 |
| Clock ports | Not applicable (combinational design) |

## What I learned
- Learned how priority logic ensures the highest-order asserted input dominates when multiple inputs are active simultaneously.
- Understood the role of the `valid` output in indicating whether any input is asserted.
- Observed how synthesis maps conditional logic into compact complex standard cells for area-efficient implementation.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave