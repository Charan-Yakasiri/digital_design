# 4:1 Multiplexer

## Project Description
Design and implement a parameterized 4:1 multiplexer in Verilog HDL. The module shall select one of four input data buses based on a 2-bit select signal and route the selected input to the output. The design shall support configurable bus width through a parameter, enabling reuse in arithmetic datapaths, bus selection logic, and control structures.

## Implementation Hints
- Define a `WIDTH` parameter to control the size of all input and output buses.
- Add inputs: `d0`, `d1`, `d2`, `d3`, and `sel[1:0]`.
- Implement selection using a `case` statement or nested conditional operators.
- Assign:
  - `sel = 2'b00` → `d0`
  - `sel = 2'b01` → `d1`
  - `sel = 2'b10` → `d2`
  - `sel = 2'b11` → `d3`
- Verify all four select combinations.
- Test with multiple `WIDTH` values.

## Key Concepts Demonstrated
- Combinational logic design
- Multi-input data selection
- Parameterized RTL
- Case statement usage
- Datapath control

## Deliverables
- `mux_4to1.v` — Parameterized RTL implementation
- `mux_4to1_tb.v` — Testbench covering all select conditions
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Output matches the selected input for all four select values
- Module functions correctly for different `WIDTH` values
- Simulation and synthesis complete without errors