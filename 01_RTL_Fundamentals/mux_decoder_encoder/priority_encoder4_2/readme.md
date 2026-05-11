# 4:2 Priority Encoder

## Project Description
Design and implement a 4:2 priority encoder in Verilog HDL. The module shall examine four request inputs and output the binary index of the highest-priority asserted input. Priority is assigned from the most significant input (`d3`) to the least significant input (`d0`), such that if multiple inputs are active simultaneously, only the highest-priority input is encoded. A `valid` output shall indicate whether at least one input is asserted.

## Implementation Hints
- Add input bus: `d[3:0]`.
- Add outputs: `y[1:0]` and `valid`.
- Priority order:
  - `d3` → `y = 2'b11`
  - `d2` → `y = 2'b10`
  - `d1` → `y = 2'b01`
  - `d0` → `y = 2'b00`
- When no inputs are asserted, set `valid = 0`.
- Implement using `if-else` statements or a `casez` statement.
- Verify scenarios with multiple simultaneous active inputs.

## Key Concepts Demonstrated
- Priority-based combinational logic
- Request arbitration
- Valid signal generation
- `casez` and don't-care pattern matching
- Interrupt and control encoding

## Deliverables
- `priority_encoder_4to2.v` — RTL implementation
- `priority_encoder_4to2_tb.v` — Testbench covering all input combinations
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Highest-priority asserted input is correctly encoded
- Lower-priority inputs are ignored when higher-priority inputs are active
- `valid` is asserted when any input is high
- `valid` is deasserted when all inputs are low
- Simulation and synthesis complete without errors