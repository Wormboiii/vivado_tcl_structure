# Vivado TCL build structure

## 1. Why do you choose TCL over GUI?

Vivado GUI-based Project Mode is convenient for initial setup and development.  
However, as a project grows and more developers begin collaborating, source files, generated files, and project-specific settings can become increasingly difficult to manage and maintain under version control.  

To address these challenges, the development environment was built around **Vivado Tcl-based Non-Project Mode**, where the entire workflow—including build, simulation, bitstream generation, and FPGA programming—is managed through scripts.  

By explicitly maintaining the required source and constraint file lists and defining the build flow in Tcl scripts, this approach provides several benefits:
- Clearly identifies and manages only the files required for the build  
- Prevents unused or obsolete source files from accumulating in the project  
- Simplifies version control by focusing on source files and Tcl scripts rather than Vivado project files  
- Provides a consistent and reproducible build environment across developers  
- Enables automation of build, simulation, bitstream generation, and FPGA programming  
- Maintains a consistent development workflow as the project grows

In short, the goal is to **manage the source files and build flow rather than the Vivado project itself**, providing a reproducible, maintainable, and collaboration-friendly FPGA development environment.  


---

## 2. File Hierarchy
<img width="591" height="682" alt="Image" src="https://github.com/user-attachments/assets/fe8ee9ac-65b9-4a6f-9809-8e171d086787" />


### 2-1. build.tcl
<img width="849" height="863" alt="Image" src="https://github.com/user-attachments/assets/868fd8f2-073f-4d66-a2a3-3c2734fbfbb0" />

1. Name your design here. Your bitstream output will be named after this title.
2. Fill in your FPGA core here.
3. Add your XDC here.
4. Fill in your top module name here.


### 2-2. build_config.tcl
<img width="1104" height="189" alt="Image" src="https://github.com/user-attachments/assets/d22ff18e-1252-40d2-aac1-1d189460738a" />

Add your additional tcl commands here.


### 2-3. sim.tcl
<img width="507" height="142" alt="Image" src="https://github.com/user-attachments/assets/db8624a3-9ba2-49ef-873a-28598a41de38" />

1. Fill in your top TB name here. Your simulation wave database will be named after it.
2. Fill in your FPGA core here.


### 2-4. sim_config.tcl
<img width="465" height="191" alt="Image" src="https://github.com/user-attachments/assets/b28556f0-f023-4528-a99d-b1810071f8f3" />

Add your desired dump signals and simulation commands here.


### 2-5. prog_bit.tcl
<img width="568" height="154" alt="Image" src="https://github.com/user-attachments/assets/9213c357-ca9f-47ac-aa9c-82ec040b78bc" />

Fill in your bitstream(.bit) file name here.

---

### 2-6. list directory

#### 2-6-1. rtl_list.tcl
<img width="361" height="115" alt="Image" src="https://github.com/user-attachments/assets/6ae214fd-9e4c-41dc-9d4f-87d7106e3935" />

Add your RTL designs here.


#### 2-6-2. ip_list.tcl
<img width="510" height="87" alt="Image" src="https://github.com/user-attachments/assets/132257cf-eb56-44c2-8bbe-fb79e4d6ae3b" />

Add your IPs here.


---

## 3. How to run things

1. To generate bitstream, execute run_bitstrea.sh
2. To run simulation, execute run_xsim.sh
3. To program your bitstream into FPGA, execute run_target.sh