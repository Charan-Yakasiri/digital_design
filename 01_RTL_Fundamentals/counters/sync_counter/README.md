# Parameterized Synchronous Counter

## What this does
A 4-bit synchronous up-counter with active-low synchronous reset (`rst_n`). The counter increments by one on every rising edge of the clock when reset is deasserted.

## Files
| File | Description |
|------|-------------|
| sync_counter.v | RTL source |
| sync_counter_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](counter_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|--------|------:|
| Standard Cells | 12 combinational cells + 4 D flip-flops |
| Flip-Flops | 4 |
| Worst Setup Slack | 9.18 ns |
| Worst Hold Slack | 0.44 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.01 GHz) |

## What I learned
- Understood how synchronous counters update all flip-flops simultaneously on the same clock edge.
- Learned to synthesize RTL into Sky130 standard cells using Yosys.
- Analyzed setup and hold timing using OpenSTA and verified that both constraints were met.
- Interpreted worst-case propagation delay and estimated the theoretical maximum operating frequency.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave
