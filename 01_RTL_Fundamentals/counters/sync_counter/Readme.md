# Parameterized Synchronous Counter

## Project Description
Design and implement a parameterized synchronous binary counter in Verilog HDL. The counter increments by one on every rising edge of a common clock signal, with all flip-flops triggered simultaneously. The counter width is configurable through a parameter, enabling reuse of the module for 4-bit, 8-bit, 16-bit, and larger counters. The counter wraps automatically to zero after reaching its maximum value.

## Implementation Hints
- Define a `WIDTH` parameter to control the size of the counter.
- Declare the count register as `reg [WIDTH-1:0] count`.
- Use a single `always @(posedge clk)` block.
- Increment using `count <= count + 1'b1;`.
- Include synchronous or asynchronous reset.
- Verify rollover from all ones to zero.

## Key Concepts Demonstrated
- Parameterized RTL design
- Sequential logic
- Synchronous clocking
- Binary counting
- Register inference

## Deliverables
- `sync_counter.v` — Parameterized RTL implementation
- `sync_counter_tb.v` — Testbench with multiple parameter values
- `waveform.png` — Simulation waveform
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Counter increments once per clock cycle
- Reset clears the counter to zero
- Counter wraps correctly after reaching its maximum value
- Module functions correctly for different `WIDTH` values
- Simulation and synthesis complete without errors