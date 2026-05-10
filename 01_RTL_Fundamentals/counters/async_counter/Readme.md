# Parameterized Asynchronous Counter

## Project Description
Design and implement a parameterized asynchronous (ripple) counter in Verilog HDL. The counter shall consist of a configurable number of flip-flops connected in cascade, where the output of each stage drives the clock input of the next stage. The design increments on every input clock pulse and naturally propagates count transitions through the chain. The counter width is defined through a parameter, allowing the same module to be used for 4-bit, 8-bit, or larger counters.

## Implementation Hints
- Define a `WIDTH` parameter to control the number of counter bits.
- Implement the least significant bit using the primary clock.
- Drive each subsequent flip-flop using the previous bit as its clock.
- Toggle each stage on every active clock edge.
- Include reset logic to initialize all bits to zero.
- Observe propagation delay between stages in simulation.

## Key Concepts Demonstrated
- Asynchronous (ripple) counting
- Parameterized RTL design
- Cascaded flip-flops
- Propagation delay effects
- Generate blocks

## Deliverables
- `async_counter.v` — Parameterized RTL implementation
- `async_counter_tb.v` — Testbench with multiple parameter values
- `waveform.png` — Simulation waveform showing ripple effect
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Counter increments correctly for the selected width
- Reset clears all counter bits
- Ripple transitions are visible in the waveform
- Module works for different `WIDTH` values
- Simulation and synthesis complete without errors