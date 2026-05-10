# D Flip-Flop with Synchronous Reset

## What this does
A positive edge-triggered D flip-flop with active-low synchronous reset (`rst_n`). The output `q` captures the input `d` on each rising edge of the clock when reset is deasserted. When `rst_n` is low, the output is cleared to `0` on the next clock edge.

## Files
| File | Description |
|------|-------------|
| d_ff_sync.v | RTL source |
| d_ff_sync_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA report |

## Simulation result
![Waveform](d_ff_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 AND gate + 1 D flip-flop |
| Flip-Flops | 1 |
| Timing Status | Successfully synthesized |
| Reset Implementation | External logic gates the D input |
| Flip-Flop Cell | `sky130_fd_sc_hd__dfxtp_1` |

## What I learned
- Understood how a D flip-flop stores one bit of data on the rising edge of the clock.
- Learned that synchronous reset is implemented by modifying the D input rather than using a dedicated reset pin.
- Observed that synthesis inserted an AND gate before the flip-flop to force the output to `0` when reset is active.
- Verified the design through simulation and technology mapping to Sky130 cells.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave