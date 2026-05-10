# JK Flip-Flop with Asynchronous Reset

## What this does
A positive edge-triggered JK flip-flop with active-low asynchronous reset (`rst_n`). On each rising edge of the clock, `J = 1` sets the output, `K = 1` resets the output, and when both `J` and `K` are `1`, the output toggles. If `rst_n` is asserted low, the output is cleared to `0` immediately, independent of the clock.

## Files
| File | Description |
|------|-------------|
| jk_ff_async.v | RTL source |
| jk_ff_async_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](jk_ff_async_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 NOR gate + 1 AOI gate + 1 D flip-flop with asynchronous reset |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.40 ns |
| Worst Hold Slack | 0.42 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.06 GHz) |

## What I learned
- Understood the characteristic behavior of a JK flip-flop, including the toggle condition when both inputs are high.
- Learned how JK functionality is synthesized into compact next-state combinational logic feeding a D flip-flop.
- Observed that asynchronous reset is implemented using the dedicated `RESET_B` pin of the flip-flop cell.
- Verified through OpenSTA that the design met all setup and hold timing constraints.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave