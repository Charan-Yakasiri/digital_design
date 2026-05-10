# SR Flip-Flop with Asynchronous Reset

## What this does
A positive edge-triggered SR (Set-Reset) flip-flop with active-low asynchronous reset (`rst_n`). On each rising edge of the clock, `S = 1` sets the output to `1`, `R = 1` resets the output to `0`, and when both inputs are `0`, the previous state is retained. If `rst_n` is asserted low, the output is cleared to `0` immediately, independent of the clock.

## Files
| File | Description |
|------|-------------|
| sr_ff_async.v | RTL source |
| sr_ff_async_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](sr_ff_async_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 next-state logic gate + 1 D flip-flop with asynchronous reset |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.38 ns |
| Worst Hold Slack | 0.45 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.07 GHz) |

## What I learned
- Understood how Set and Reset inputs define the next state of an SR flip-flop.
- Learned that asynchronous reset is implemented using the dedicated `RESET_B` pin of the flip-flop cell.
- Observed that the SR behavior is synthesized into compact combinational next-state logic.
- Verified using OpenSTA that the design met all setup and hold timing constraints.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave