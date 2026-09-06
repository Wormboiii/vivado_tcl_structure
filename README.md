# Vivado TCL build structure

## 1. Why did you chose TCL over GUI?

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
<img width="591" height="682" alt="Image" src="https://github.com/user-attachments/assets/fbc49aa4-7638-48af-8243-606a540d78e2" />
