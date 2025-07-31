# 🧠 My Verilog RISC Processor

This project implements a simple RISC (Reduced Instruction Set Computer) processor using Verilog HDL. It includes fundamental components such as the ALU, control unit, registers, multiplexers, and memory, and is tested using multiple testbenches in ModelSim.

---

🧩 Features
✅ Modular RISC architecture with Verilog HDL

✅ ALU supporting arithmetic and logic operations

✅ Controller for instruction decoding and control signal generation

✅ Register file with read/write operations

✅ Program counter and memory interaction

✅ Separate testbenches for each major component

✅ Sample programs to simulate and verify behavior

▶️ How to Simulate in ModelSim
This project is designed to be simulated using ModelSim.

---

💻 Steps:
Open ModelSim

Create a new project

Add all Verilog source files from the src/ folder

Add the relevant testbench from tb/ (e.g., risc_test.v)

Compile all files

Run the simulation

(Optional) Use Add Wave and view signals

---

🧪 Test Programs
CPUtest1.txt, CPUtest2.txt, and CPUtest3.txt contain sample programs in memory format.

You can modify or extend these programs to verify specific instructions or logic paths.

---

🔁 Possible Improvements
Add pipelining (e.g., 5-stage pipeline)

Add hazard detection and data forwarding

Expand ALU with more operations (e.g., shifts, comparisons)

Extend instruction set and control logic

Add instruction/data separation or caching

---

👤 Author
George Jan

## 📁 Project Structure

```text
my-verilog-RISC/
│
├── src/                         # Verilog source files
│   ├── alu.v                    # Arithmetic Logic Unit
│   ├── controller.v             # Instruction decoder and control signals
│   ├── counter.v                # Program counter
│   ├── driver.v                 # Output driver logic
│   ├── memory.v                 # Memory module (instruction/data)
│   ├── multiplexor.v            # 2-to-1 multiplexer
│   ├── register.v               # Register file
│   └── RISC.v                   # Top-level processor module
│
├── tb/                          # Testbenches and simulation inputs
│   ├── alu_tb.v                 # ALU testbench
│   ├── alu_test.v               # ALU stimulus
│   ├── controller_tb.v          # Controller testbench
│   ├── controller_test.v        # Controller stimulus
│   ├── driver_tb.v              # Driver module testbench
│   ├── driver_test.v            # Driver test vector
│   ├── multiplexor_test.v       # Multiplexer testbench
│   ├── register_tb.v            # Register file testbench
│   ├── risc_test.v              # Top-level processor testbench
│   ├── CPUtest1.txt             # Program 1 input file
│   ├── CPUtest2.txt             # Program 2 input file
│   ├── CPUtest3.txt             # Program 3 input file
│
├── README.md                    # Project documentation (this file)
