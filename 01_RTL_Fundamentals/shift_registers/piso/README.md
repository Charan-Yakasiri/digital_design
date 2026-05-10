# Parameterized PISO Shift Register (Parallel-In Serial-Out)

## What this does
A 4-bit Parallel-In Serial-Out (PISO) shift register with a `load` control and asynchronous reset. When `load` is asserted, parallel input data is loaded into the register. When `load` is deasserted, the stored data is shifted out one bit at a time through the serial output `q` on each rising edge of the clock.

## Files
| File | Description |
|------|-------------|
| piso.v | RTL source |
| piso_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](piso_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 2 multiplexers + 2 D flip-flops with asynchronous reset |
| Flip-Flops | 2 |
| Worst Setup Slack | 9.27 ns |
| Worst Hold Slack | 0.44 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.03 GHz) |

## What I learned
- Understood how multiplexers are used to switch between parallel loading and serial shifting.
- Learned that PISO registers combine storage and data selection logic.
- Observed how serial output can be recirculated during shift operations.
- Verified with OpenSTA that both setup and hold constraints were satisfied.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave