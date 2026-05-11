FPGA Implementation of Modified Error Normalized LMS Adaptive Filter for ECG Noise Removal

##Overview

This project presents the FPGA implementation of a Modified Error Normalized Least Mean Square (DENLMS) adaptive filter for real-time ECG noise removal. The design is implemented using Verilog HDL and synthesized on a Virtex-5 FPGA using Xilinx ISE. Functional simulation and verification are carried out using ModelSim.

The proposed DENLMS architecture combines adaptive filtering, error normalization, and pipelined FPGA design to improve speed, convergence performance, and power efficiency for biomedical signal processing applications. 

---

# Objectives

* Design an FPGA-based adaptive filter for ECG noise removal
* Implement DENLMS architecture using Verilog HDL
* Improve throughput and reduce delay using pipelining
* Achieve real-time ECG signal processing
* Compare performance with conventional LMS-based architectures

---

# Tools and Technologies Used

* Verilog HDL
* ModelSim
* Xilinx ISE
* Virtex-5 FPGA XC5VLX330
* Microsoft Visio

---

# Proposed Algorithm

Filter coefficient update equation:

w(n+1)=w(n)+\mu_{en},e(n-kD),x(n-kD)

Normalized step size equation:

\mu_{en}=\frac{\mu}{p+e^T(n)e(n)}

The delayed error feedback path enables pipelining and reduces the critical path delay, resulting in improved operating frequency and faster real-time processing. 

---

# System Architecture

The system consists of:

* Noisy ECG input
* FIR adaptive filter
* Error computation block
* Delay register
* Weight update unit
* Memory unit
* Control FSM

Signal Flow:

1. Noisy ECG signal is applied to the FIR filter
2. Filter output is compared with desired ECG signal
3. Error signal is generated
4. Error is delayed through pipeline stages
5. Filter coefficients are updated adaptively
6. Updated coefficients are fed back to the FIR filter

---

# Leaf Cell Modules

| Module         | Function                     |
| -------------- | ---------------------------- |
| FIR Filter     | ECG signal filtering         |
| Subtractor     | Error signal generation      |
| Delay Register | Pipeline delay insertion     |
| Multiplier     | Weight update multiplication |
| Adder          | Coefficient accumulation     |
| Divider        | Error normalization          |
| Memory         | Coefficient storage          |
| Control FSM    | Pipeline stage control       |



---

# FIR Filter Specifications

* 4-tap pipelined FIR filter
* 16-bit datapath
* MAC (Multiply Accumulate) architecture
* One sample processed per clock cycle

---

# FPGA Implementation Details

| Parameter       | Value              |
| --------------- | ------------------ |
| FPGA Device     | Virtex-5 XC5VLX330 |
| Data Width      | 16-bit             |
| Filter Taps     | 4                  |
| Pipeline Stages | 11                 |
| HDL Language    | Verilog HDL        |
| Simulation Tool | ModelSim           |
| Synthesis Tool  | Xilinx ISE         |

Optimal pipeline stage equation:

D_{opt}=2\log_2(b)+\log_2(l)+1

For a 16-bit, 4-tap filter:

* Optimal pipeline stages = 11 

---

# Simulation Results

Functional simulation confirms correct operation of the DENLMS adaptive filter.

Results:

* Error reduced from 38,403 to 34,647
* Improved convergence compared to ENLMS
* Stable adaptive coefficient updates
* Proper normalized step size behavior



---

# FPGA Synthesis Results

| Metric        | Result  |
| ------------- | ------- |
| Dynamic Power | 42 mW   |
| Leakage Power | 107 µW  |
| Timing Slack  | 0.19 ns |
| LUT Usage     | 8,790   |
| Flip-Flops    | 6,328   |

Performance Improvements:

* 43.2% reduction in dynamic power
* 30.5% reduction in leakage power
* 35.24% improvement in timing performance



---

# Advantages

* Real-time ECG signal processing
* Reduced power consumption
* Improved timing performance
* Better convergence stability
* Efficient FPGA resource utilization
* High-speed pipelined architecture

---

# Applications

* Biomedical signal processing
* ECG monitoring systems
* Portable healthcare devices
* Wearable medical electronics
* FPGA-based DSP applications

---

# Folder Structure

```text
/project
│
├── verilog/
│   ├── fir_filter.v
│   ├── multiplier.v
│   ├── divider.v
│   ├── control_fsm.v
│   └── denlms_top.v
│
├── testbench/
│   └── denlms_tb.v
│
├── simulation/
│   └── waveform_results
│
├── synthesis/
│   └── xilinx_reports
│
└── README.md
```

---

# Conclusion

The proposed DENLMS adaptive filter successfully achieves efficient FPGA-based ECG noise removal with improved speed, lower power consumption, and better convergence performance. The pipelined architecture significantly reduces timing delay and supports real-time biomedical signal processing applications. 

---

# Reference

Venkatesan et al., “FPGA Implementation of Modified Error Normalized LMS Adaptive Filter for ECG Noise Removal,” Cluster Computing, 2019. 
project documentation files
