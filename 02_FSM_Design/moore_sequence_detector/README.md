# Moore Sequence Detector FSM

## What this does
A Moore finite state machine implemented in Verilog HDL that detects a specific input sequence and asserts the output only after entering a dedicated detection state.

## Files
| File | Description |
|------|-------------|
| moore_fsm.v | RTL source |
| moore_fsm_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](moore_mapped.svg)

## Synthesis (Sky130 + Yosys/OpenSTA)
| Resource | Used |
|----------|------|
| D Flip-Flops | 4 |
| Combinational Cells | 7 |
| WNS | 0.00 ns |
| TNS | 0.00 ns |
| Hold Slack | 0.46 ns |
| Setup Slack | 9.09 ns |
| Target Clock Period | 10.00 ns |
| Estimated Fmax | 100 MHz |

## What I learned
- Learned how Moore state machines generate outputs solely based on the current state, independent of the immediate input.
- Understood that the output is registered as an additional flip-flop, resulting in one extra sequential element compared to the Mealy implementation.
- Verified timing using OpenSTA and confirmed zero setup and hold violations.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave