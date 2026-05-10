# T Flip-Flop with Asynchronous Reset

## What this does
A positive edge-triggered T (toggle) flip-flop with active-low asynchronous reset (`rst_n`). When `t = 1`, the output `q` toggles on each rising edge of the clock. When `t = 0`, the output retains its current state. If `rst_n` is asserted low, the output is cleared to `0` immediately, independent of the clock.

## Files
| File | Description |
|------|-------------|
| t_ff_async.v | RTL source |
| t_ff_async_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](t_ff_async_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 XOR gate + 1 D flip-flop with asynchronous reset |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.38 ns |
| Worst Hold Slack | 0.42 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.10 GHz) |

## What I learned
- Understood how a T flip-flop can be implemented using XOR feedback (`D = Q ⊕ T`).
- Learned that asynchronous reset is handled by the dedicated `RESET_B` pin of the flip-flop cell.
- Observed that no extra reset gating logic is required in the synthesized hardware.
- Verified timing using OpenSTA and confirmed that all setup and hold constraints were satisfied.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave