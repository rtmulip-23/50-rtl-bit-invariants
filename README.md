# RTL Bit Invariants

This repository contains a curated set of 50 RTL problems focused on
bit-level reasoning and invariant-based hardware thinking.

The goal is not to practice syntax, FSMs, or HDL features, but to
develop the ability to recognize and reuse fundamental logic invariants
that repeatedly appear in real digital design.

These exercises emphasize:

- combinational reasoning
- bit masks and boundaries
- one-hot properties
- propagation and dominance
- encoding and decoding
- structural arithmetic

Most problems have a small canonical solution once the invariant is
identified.

---

## Why this exists

In real hardware design, most logic is not invented from scratch.
It is built by recognizing patterns such as:

- exactly one bit set
- lowest or highest set bit
- masking above or below a boundary
- carry and propagation behavior
- priority and dominance relations

This repository is an attempt to train that recognition.

---

## Problem Structure

Each problem is written as a small standalone RTL module.

Constraints:
- purely combinational unless stated otherwise
- no FSMs
- no testbench-driven tricks
- focus on correctness through invariants

---

## Problem Levels

### Level 1 — Core invariants
Basic properties that appear everywhere.

### Level 2 — Encoding and absence
Detecting positions, counts, and uniqueness.

### Level 3 — Masking and relative position
Understanding boundaries and dominance.

### Level 4 — Structural arithmetic
Using arithmetic to express logic behavior.

### Level 5 — Representation and reuse
Transformations and reusable structures.

---

## Philosophy

Hardware is not written as a sequence of steps.

RTL describes relationships.

Good RTL expresses the invariant directly.

---

## Notes

- Multiple implementations may synthesize to identical hardware.
- The preferred solution is the one that most clearly expresses intent.
- Widths are kept small for clarity but can be parameterized.

---

## Status

Work in progress.
Problems solved incrementally with focus on understanding,
not speed.
