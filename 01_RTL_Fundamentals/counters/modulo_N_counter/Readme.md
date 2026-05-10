# Parameterized Modulo-N Counter

## Project Description
Design and implement a parameterized modulo-N counter in Verilog HDL. The counter increments on every rising edge of the clock and resets to zero after reaching a user-defined terminal count `N-1`. Unlike a standard binary counter, this design cycles through only `N` valid states, making it suitable for frequency division, timing control, and finite-state sequencing applications.

## Implementation Hints
- Define a `MODULO` parameter to specify the number of counting states.
- Compute the counter width using `$clog2(MODULO)`.
- Increment the counter until it reaches `MODULO - 1`.
- Reset the counter to zero when the terminal count is reached.
- Include reset logic to initialize the counter.
- Test with different values such as 10 (decade counter), 12, and 60.

## Key Concepts Demonstrated
- Modulo-based counting
- Parameterized RTL design
- Terminal count detection
- Automatic width calculation using `$clog2`
- Frequency division and timing applications

## Deliverables
- `mod_n_counter.v` — Parameterized RTL implementation
- `mod_n_counter_tb.v` — Testbench with multiple `MODULO` values
- `waveform.png` — Simulation waveform showing wrap at `N-1`
- `synthesis_report.txt` — Resource utilization and timing summary
- `README.md` — Project documentation

## Validation Criteria
- Counter increments once per clock cycle
- Counter resets to zero after reaching `MODULO - 1`
- Reset initializes the counter to zero
- Module functions correctly for different `MODULO` values
- Simulation and synthesis complete without errors