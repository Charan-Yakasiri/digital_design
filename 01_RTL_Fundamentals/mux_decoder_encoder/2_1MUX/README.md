# Parameterized 2:1 Multiplexer

## What this does
A 4-bit 2-to-1 multiplexer that selects between two 4-bit input buses (`a` and `b`) using a single select signal (`sel`). When `sel = 0`, the output follows `a`; when `sel = 1`, the output follows `b`.

## Files
| File | Description |
|------|-------------|
| 2_1mux.v | RTL source |
| 2_1mux_tb.v | Self-checking testbench |
| waveform.png | Simulation waveform |
| synthesis_report.png | Yosys synthesis report |

## Synthesis result
![Waveform](mux2_1_mapped.svg)

## Synthesis (Sky130 + Yosys)

| Resource | Used |
|----------|------|
| Standard Cells | 4 × 2:1 multiplexers (`sky130_fd_sc_hd__mux2_1`) |
| Sequential Elements | 0 |
| Clock Required | No |
| Timing Analysis | Not applicable (pure combinational logic) |

## What I learned
- Understood how a single select line controls switching between two multi-bit input buses.
- Learned that bus-wide multiplexers are synthesized as one multiplexer per bit.
- Observed that purely combinational circuits do not require clocks or flip-flops.
- Noted that OpenSTA reported no clock because timing constraints are not needed for this design.

## Tools
Yosys · Sky130 PDK · Icarus Verilog · GTKWave