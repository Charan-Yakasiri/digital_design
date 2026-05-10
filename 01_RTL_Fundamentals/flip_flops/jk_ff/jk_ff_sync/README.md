# JK Flip-Flop with Synchronous Reset

## What this does
A positive edge-triggered JK flip-flop with active-low synchronous reset (`rst_n`). On each rising edge of the clock, `J = 1` sets the output, `K = 1` resets the output, and when both `J` and `K` are `1`, the output toggles. If `rst_n` is low, the output is cleared to `0` on the next clock edge.

## Files
| File | Description |
|------|-------------|
| jk_ff_sync.v | RTL source |
| jk_ff_sync_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](jk_ff_sync_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 2 NAND gates + 1 AOI gate + 1 D flip-flop |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.39 ns |
| Worst Hold Slack | 0.45 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.06 GHz) |

## What I learned
- Understood the full truth table of a JK flip-flop, including the toggle behavior when both inputs are high.
- Learned how synchronous reset is integrated into the JK next-state combinational logic.
- Observed that the synthesized implementation uses compact NAND and AOI logic feeding a standard D flip-flop.
- Verified through OpenSTA that all setup and hold timing constraints were satisfied.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave