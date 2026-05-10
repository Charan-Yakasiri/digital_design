# D Flip-Flop with Asynchronous Reset

## What this does
A positive edge-triggered D flip-flop with active-low asynchronous reset (`rst_n`). The output `q` captures the input `d` on each rising edge of the clock. When `rst_n` is asserted low, the output is cleared to `0` immediately, regardless of the clock.

## Files
| File | Description |
|------|-------------|
| d_ff_async.v | RTL source |
| d_ff_async_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA report |

## Simulation result
![Waveform](d_ff_async_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 1 D flip-flop with asynchronous reset |
| Flip-Flops | 1 |
| Timing Status | Successfully synthesized |
| Reset Implementation | Dedicated reset pin (`RESET_B`) |
| Flip-Flop Cell | `sky130_fd_sc_hd__dfrtp_1` |

## What I learned
- Understood that asynchronous reset clears the output immediately without waiting for a clock edge.
- Learned that synthesis maps the design directly to a flip-flop cell with a built-in reset port.
- Observed that no extra combinational logic is required for reset implementation.
- Compared this implementation with synchronous reset and noted the hardware efficiency advantage.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave