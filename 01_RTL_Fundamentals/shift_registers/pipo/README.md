# Parameterized PIPO Register (Parallel-In Parallel-Out)

## What this does
A 4-bit Parallel-In Parallel-Out (PIPO) register with active-low asynchronous reset (`rst_n`). All four input bits are loaded simultaneously on the rising edge of the clock and appear at the output in parallel. When `rst_n` is asserted low, all outputs are cleared to `0` immediately.

## Files
| File | Description |
|------|-------------|
| pipo.v | RTL source |
| pipo_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA report |

## Simulation result
![Waveform](pipo_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 4 D flip-flops with asynchronous reset |
| Flip-Flops | 4 |
| Timing Status | Successfully synthesized |
| Reset Implementation | Dedicated `RESET_B` pins |
| Flip-Flop Cell | `sky130_fd_sc_hd__dfrtp_1` |

## What I learned
- Understood how a PIPO register captures multiple bits simultaneously on a single clock edge.
- Learned that each bit is implemented using an independent D flip-flop.
- Observed that asynchronous reset is directly mapped to the built-in reset port of each flip-flop.
- Verified that no additional combinational logic is required since inputs connect directly to the register stages.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave