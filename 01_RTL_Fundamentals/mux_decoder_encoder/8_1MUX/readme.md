# 8:1 Multiplexer

## Project Description
Design and implement a parameterized 8:1 multiplexer in Verilog HDL. The module shall select one of eight input data buses based on a 3-bit select signal and route the selected input to the output. The design shall support configurable bus width through a parameter, enabling reuse in datapath selection, bus routing, and control-intensive digital systems.

## Implementation Hints
- Define a `WIDTH` parameter to control the size of all input and output buses.
- Add inputs: `d0` through `d7`, and `sel[2:0]`.
- Implement selection using a `case` statement or nested conditional operators.
- Assign:
  - `3'b000` → `d0`
  - `3'b001` → `d1`
  - `3'b010` → `d2`
  - `3'b011` → `d3`
  - `3'b100` → `d4`
  - `3'b101` → `d5`
  - `3'b110` → `d6`
  - `3'b111` → `d7`
- Verify all eight select combinations.
- Test with multiple `WIDTH` values.

## Key Concepts Demonstrated
- Combinational logic design
- Multi-input data selection
- Parameterized RTL
- Case statement usage
- Datapath control and bus routing

## Deliverables
- `mux_8to1.v` — Parameterized RTL implementation
- `mux_8to1_tb.v` — Testbench covering all select conditions
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Output matches the selected input for all eight select values
- Module functions correctly for different `WIDTH` values
- Simulation and synthesis complete without errors