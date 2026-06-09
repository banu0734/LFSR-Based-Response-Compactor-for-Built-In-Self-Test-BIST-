# LFSR-Based Response Compactor for Built-In Self-Test (BIST)

## Overview

This project presents the design and simulation of an LFSR-based Response Compactor using Verilog HDL for Built-In Self-Test (BIST) applications. The architecture compresses long output response sequences into compact signatures, reducing test data storage while preserving fault detection capability.

The implemented design consists of:

* Circuit Under Test (CUT)
* Fault Injection Logic
* Transition Counter
* Linear Feedback Shift Register (LFSR)
* Response Analyzer

The design was developed and functionally verified using Xilinx Vivado Design Suite.

---

# Introduction

As VLSI circuits become increasingly complex, testing large volumes of output data becomes challenging. Built-In Self-Test (BIST) techniques simplify testing by integrating test generation and response analysis within the hardware itself.

A Response Compactor compresses output responses into short signatures. Instead of storing every output bit, only the generated signature is compared with a fault-free reference.

This project demonstrates a practical implementation of response compaction using an LFSR and stuck-at fault analysis.

---

# Project Objectives

* Design a response compactor using Verilog HDL.
* Implement a combinational Circuit Under Test (CUT).
* Inject stuck-at faults.
* Count output transitions.
* Generate compact LFSR signatures.
* Detect faults using signature comparison.
* Verify functionality through simulation.

---

# Circuit Under Test (CUT)

The implemented Boolean function is

q = ab + (a + b)c'

The CUT receives three input variables:

* a
* b
* c

Fault injection logic modifies the inputs to simulate faulty hardware conditions.

---

# Fault Injection

The following stuck-at faults are implemented:

* a_sa0
* a_sa1
* b_sa0
* b_sa1

These faults force the corresponding input permanently to logic 0 or logic 1 regardless of the actual input value.

Fault injection helps evaluate the fault detection capability of the response compactor.

---

# Transition Counter

The transition counter monitors the CUT output.

Whenever

Current Output ≠ Previous Output

the counter increments.

The transition count provides additional information regarding output activity and fault behavior.

---

# LFSR Response Compactor

A 3-bit Linear Feedback Shift Register compresses the output response sequence.

Polynomial:

x³ + x² + 1

Feedback Equation:

feedback = signature[2] XOR signature[1] XOR q

The LFSR continuously updates its state and produces a compact signature for the applied test vectors.

---

# Response Analysis

The generated signature for the fault-free circuit is stored as the reference signature.

Fault Detection Rule:

Faulty Signature ≠ Fault-Free Signature

If the generated signature differs from the reference, the fault is considered detected.

---

# RTL Architecture


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/d038a93e-2d9d-462b-b026-2e16b8943082" />


# Testbench

The Verilog testbench generates:

* Clock
* Reset
* Input vectors
* Fault injection conditions

Input vectors applied:

000

001

010

011

100

101

110

111

The responses are analyzed under both fault-free and faulty conditions.

---

# Simulation Results

## Transition Count

| Condition  | Count |
| ---------- | ----- |
| Fault Free | 5     |
| a_sa0      | 4     |
| a_sa1      | 4     |
| b_sa0      | 4     |
| b_sa1      | 4     |

---

## Generated Signatures

| Condition  | Signature |
| ---------- | --------- |
| Fault Free | 010       |
| a_sa0      | 001       |
| a_sa1      | 011       |
| b_sa0      | 111       |
| b_sa1      | 001       |

Different signatures confirm successful fault detection.

---

# Waveform Output

## Functional Simulation
<img width="775" height="413" alt="image" src="https://github.com/user-attachments/assets/0223b0b9-102f-4257-9bb3-56899394d30b" />


The waveform verifies:

* Correct CUT operation
* Transition counting
* LFSR signature generation
* Fault injection
* Response compaction

---

# TCL Console Output

<img width="755" height="626" alt="image" src="https://github.com/user-attachments/assets/141d1553-5ce4-4db6-ae82-d4d544cf0b9a" />


The console displays:

* Input vectors
* Fault-free output
* Faulty outputs
* Transition count
* Generated signature
* Fault detection status

---

# Applications

* Built-In Self-Test (BIST)
* Design for Testability (DFT)
* VLSI Testing
* Fault Diagnosis
* FPGA Test Architectures
* Signature-Based Testing

---

# Future Improvements

* Higher-order LFSRs
* Multiple fault injection models
* MISR implementation
* FPGA hardware implementation
* ATPG integration

---

# Conclusion

An LFSR-based Response Compactor was successfully designed and simulated using Verilog HDL. The implemented architecture combines a Circuit Under Test, Transition Counter, Fault Injection Logic, and LFSR-based signature generator to perform efficient response compaction.

Simulation results confirmed correct signature generation and successful detection of stuck-at faults. The project demonstrates the practical application of BIST and DFT techniques used in modern digital VLSI systems.

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Design Suite

---

## Author

**Banushree M**

