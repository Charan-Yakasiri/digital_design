# SR Flip-Flop with Synchronous Reset

## What this does
A positive edge-triggered SR (Set-Reset) flip-flop with active-low synchronous reset (`rst_n`). On each rising edge of the clock, `S = 1` sets the output to `1`, `R = 1` resets the output to `0`, and when both inputs are `0`, the previous state is retained. If `rst_n` is low, the output is cleared to `0` on the next clock edge.

## Files
| File | Description |
|------|-------------|
| sr_ff_sync.v | RTL source |
| sr_ff_sync_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](sr_ff_sync_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 NOR gate + 1 NOR gate with reset control + 1 D flip-flop |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.47 ns |
| Worst Hold Slack | 0.46 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.05 GHz) |

## What I learned
- Understood how Set and Reset inputs determine the next state of an SR flip-flop.
- Learned how an SR flip-flop can be implemented using combinational next-state logic feeding a D flip-flop.
- Observed that synchronous reset is incorporated directly into the next-state logic.
- Verified through OpenSTA that the design met all setup and hold timing requirements.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave