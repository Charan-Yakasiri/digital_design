# Mealy Sequence Detector FSM

## What this does
A Mealy finite state machine implemented in Verilog HDL that detects a specific input sequence and asserts the output immediately based on the current state and input.

## Files
| File | Description |
|------|-------------|
| mealy_fsm.v | RTL source |
| mealy_fsm_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](mealy_mapped.svg)

## Synthesis (Sky130 + Yosys/OpenSTA)
| Resource | Used |
|----------|------|
| D Flip-Flops | 3 |
| Combinational Cells | 8 |
| WNS | 0.00 ns |
| TNS | 0.00 ns |
| Hold Slack | 0.50 ns |
| Setup Slack | 9.13 ns |
| Target Clock Period | 10.00 ns |
| Estimated Fmax | 100 MHz |

## What I learned
- Learned how Mealy state machines generate outputs based on both the present state and the current input.
- Understood how synthesis maps state registers into flip-flops and next-state logic into optimized standard cells.
- Used OpenSTA to verify both setup and hold timing, confirming zero timing violations.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave