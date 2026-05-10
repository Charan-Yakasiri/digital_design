# Parameterized Asynchronous Counter

## What this does
A Parameterized asynchronous up-counter with active-low asynchronous reset (`rst_n`). The counter increments by one on every rising edge of the clock, and reset clears all bits immediately without waiting for a clock edge.

## Files
| File | Description |
|------|-------------|
| async_counter.v | RTL source |
| async_counter_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](counter_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 6 combinational cells + 4 D flip-flops with asynchronous reset |
| Flip-Flops | 4 |
| Worst Setup Slack | 9.27 ns |
| Worst Hold Slack | 0.43 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.08 GHz) |

## What I learned
- Understood how asynchronous reset affects flip-flops immediately, independent of the clock.
- Learned how synthesis maps reset logic to flip-flops with built-in reset ports (`dfrtp` cells).
- Verified setup and hold timing using OpenSTA and confirmed all timing constraints were satisfied.
- Compared timing and implementation differences between synchronous and asynchronous reset counters.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave