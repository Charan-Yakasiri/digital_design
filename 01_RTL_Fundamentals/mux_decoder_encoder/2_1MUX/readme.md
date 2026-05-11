# 2:1 Multiplexer

## Project Description
Design and implement a parameterized 2:1 multiplexer in Verilog HDL. The module shall select one of two input data buses based on a single-bit select signal and route the selected input to the output. The design shall support configurable bus width through a parameter, allowing reuse for both single-bit and multi-bit data paths.

## Implementation Hints
- Define a `WIDTH` parameter to control the input and output bus size.
- Add inputs: `a`, `b`, and `sel`.
- Implement selection using either:
  - Continuous assignment: `assign y = sel ? b : a;`
  - Combinational `always @(*)` block.
- Verify functionality for both `sel = 0` and `sel = 1`.
- Test with multiple `WIDTH` values.

## Key Concepts Demonstrated
- Combinational logic design
- Data selection
- Parameterized RTL
- Conditional operator usage
- Multiplexer-based datapath control

## Deliverables
- `mux_2to1.v` — Parameterized RTL implementation
- `mux_2to1_tb.v` — Testbench covering all select conditions
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Output equals `a` when `sel = 0`
- Output equals `b` when `sel = 1`
- Module functions correctly for different `WIDTH` values
- Simulation and synthesis complete without errors