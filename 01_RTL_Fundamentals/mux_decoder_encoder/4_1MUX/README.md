# Parameterized 4:1 Multiplexer

## What this does
A 4-bit 4-to-1 multiplexer that selects one of four 4-bit input buses (`a`, `b`, `c`, or `d`) based on a 2-bit select signal (`sel`). The selected input is routed directly to the output `y`.

## Files
| File | Description |
|------|-------------|
| 4_1mux.v | RTL source |
| 4_1mux_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis report |

## Simulation result
![Waveform](mux4_1_mapped.svg)

## Synthesis (Sky130 + Yosys)

| Resource | Used |
|----------|------|
| Standard Cells | 4 × 4:1 multiplexers (`sky130_fd_sc_hd__mux4_2`) |
| Sequential Elements | 0 |
| Clock Required | No |
| Timing Analysis | Not applicable (pure combinational logic) |

## What I learned
- Understood how a 2-bit select signal can choose one among four input buses.
- Learned that multi-bit multiplexers are synthesized as one cell per output bit.
- Observed that the Sky130 library provides dedicated 4:1 multiplexer cells.
- Verified that purely combinational logic does not require clock constraints or flip-flops.

## Tools
Yosys · Sky130 PDK · Icarus Verilog · GTKWave