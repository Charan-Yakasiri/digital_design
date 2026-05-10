# Parameterized SISO Shift Register (Serial-In Serial-Out)

## What this does
A 4-bit Serial-In Serial-Out (SISO) shift register with active-low asynchronous reset (`rst_n`). One bit is shifted into the register on each rising edge of the clock, and after four clock cycles the earliest input bit appears at the serial output `q`.

## Files
| File | Description |
|------|-------------|
| siso.v | RTL source |
| siso_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](siso_mapped.svg)

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
- Understood how serial data propagates through a chain of flip-flops.
- Learned that the output bit is delayed by the number of stages in the shift register.
- Observed that SISO registers are fundamental building blocks for serial communication and timing alignment.
- Verified through OpenSTA that the direct flip-flop-to-flip-flop paths satisfy setup and hold timing constraints.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave