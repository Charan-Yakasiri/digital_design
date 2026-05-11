# 2:4 Decoder

## Project Description
Design and implement a parameterized 2:4 decoder in Verilog HDL. The module shall translate a 2-bit binary input into a one-hot 4-bit output, where exactly one output bit is asserted corresponding to the input value. An optional enable input shall control whether decoding is active. This design is commonly used in address decoding, chip select generation, and control logic.

## Implementation Hints
- Add inputs: `a[1:0]` and optional `en`.
- Add output: `y[3:0]`.
- When `en = 1`, assert one output bit based on the input value.
- When `en = 0`, drive all outputs low.
- Implement using:
  - Shift operation: `assign y = en ? (4'b0001 << a) : 4'b0000;`
  - Or a combinational `case` statement.
- Verify all input combinations (`00` to `11`).

## Key Concepts Demonstrated
- Combinational decoding
- One-hot output generation
- Enable-controlled logic
- Address decoding
- Shift-based hardware implementation

## Deliverables
- `decoder_2to4.v` — RTL implementation
- `decoder_2to4_tb.v` — Testbench covering all input combinations
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Exactly one output bit is asserted for each valid input
- All outputs are low when `en = 0`
- Output matches the expected one-hot pattern
- Simulation and synthesis complete without errors