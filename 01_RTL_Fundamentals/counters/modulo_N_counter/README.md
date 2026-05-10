# Parameterized Modulo-N Counter (MOD-10 Counter)

## What this does
A parameterized modulo-N counter configured as a MOD-10 (decade) counter. It counts from `0` to `9` and automatically resets to `0` on the next clock cycle, making it useful for decimal counting applications such as digital clocks and frequency dividers.

## Files
| File | Description |
|------|-------------|
| modulo_N_counter.v | RTL source |
| modulo_N_counter_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis and OpenSTA timing report |

## Simulation result
![Waveform](modulo_mapped.svg)

## Synthesis (Sky130 + Yosys + OpenSTA)

| Resource | Used |
|----------|------|
| Standard Cells | 10 combinational cells + 4 D flip-flops |
| Flip-Flops | 4 |
| Worst Setup Slack | 9.17 ns |
| Worst Hold Slack | 0.44 ns |
| Target Clock Period | 10.00 ns |
| Maximum Frequency (Estimated) | 100 MHz target met (theoretical limit ≈ 1.09 GHz) |

## What I learned
- Learned how to design counters that wrap after a user-defined terminal count instead of counting through all binary states.
- Understood how terminal count detection logic resets the counter after reaching decimal `9`.
- Synthesized the design using Sky130 standard cells and analyzed timing with OpenSTA.
- Verified that both setup and hold constraints were satisfied with zero timing violations.

## Tools
Yosys · OpenSTA · Sky130 PDK · Icarus Verilog · GTKWave