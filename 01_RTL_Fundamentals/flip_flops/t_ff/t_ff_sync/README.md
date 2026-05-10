# T Flip-Flop with Synchronous Reset

## What this does
A positive edge-triggered T (toggle) flip-flop with active-low synchronous reset (`rst_n`). When `t = 1`, the output `q` toggles on each rising edge of the clock. When `t = 0`, the output retains its previous state. If `rst_n` is low, the output is cleared to `0` on the next clock edge.

## Files
| File | Description |
|------|-------------|
| t_ff_sync.v | RTL source |
| t_ff_sync_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](t_ff_sync_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 XOR gate + 1 AND gate + 1 D flip-flop |
| Flip-Flops | 1 |
| Worst Setup Slack | 9.33 ns |
| Worst Hold Slack | 0.54 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.02 GHz) |

## What I learned
- Understood how a T flip-flop toggles its output when the toggle input is asserted.
- Learned that a T flip-flop can be implemented using a D flip-flop with XOR feedback (`D = Q ⊕ T`).
- Observed how synchronous reset is implemented by gating the computed next-state logic.
- Verified timing closure using OpenSTA with no setup or hold violations.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave