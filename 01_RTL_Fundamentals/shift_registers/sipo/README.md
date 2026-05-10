# Parameterized SIPO Shift Register (Serial-In Parallel-Out)

## What this does
A 4-bit Serial-In Parallel-Out (SIPO) shift register with active-low asynchronous reset (`rst_n`). One bit is shifted into the register on each rising edge of the clock, and the accumulated 4-bit value is available simultaneously on the parallel output `q[3:0]`.

## Files
| File | Description |
|------|-------------|
| sipo.v | RTL source |
| sipo_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](sipo_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 4 D flip-flops with asynchronous reset |
| Flip-Flops | 4 |
| Worst Setup Slack | 9.55 ns |
| Worst Hold Slack | 0.33 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.05 GHz) |

## What I learned
- Understood how serial data propagates through cascaded flip-flops on successive clock cycles.
- Learned that parallel outputs expose the complete contents of the shift register at any time.
- Observed that each stage directly feeds the next, with no additional combinational logic required.
- Verified through OpenSTA that all setup and hold timing constraints were satisfied.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave