#==============================================================================        
#           
# Vivado TCL simulation scripts          
#           
# Created by    : Wonhyeok Seol (Wormboiii @ Github)            
# Vivado ver.   : 2025.1            
# FPGA EVB      : Alinx AX7035B         
#           
#============================= !!!CAUTION!!! ==================================         
#            
# In this project, the main clk wiz IP is created in another GUI project.           
#           
# If your Vivado version or FPGA core is different with this one,           
#   you need to manually create and copy the IPs you need.          
#           
#==============================================================================  


# Set top TB name
set TB_TOP "tb_led"

# Set current FPGA core for compiling IP
set fpga_part "xc7a35tfgg484-2"
set_part ${fpga_part}


# Set file hierarchy path const.
set LIB_DIR [file normalize "./lib"]
set RTL_DIR [file normalize "./rtl"]
set LST_DIR [file normalize "./list"]
set SIM_DIR [file normalize "./sim"]
set SCR_DIR [file normalize "./script"]
set TB_DIR  [file normalize "./tbench"]

cd $SIM_DIR

# Source listed IP
source "${LST_DIR}/ip_list.tcl"
source "${SCR_DIR}/sim_ip.tcl"

# Source listed HDL list
source "${LST_DIR}/rtl_list.tcl"


set XELAB_LIB_OPT $XSIM_LIB_OPT

foreach lib $IP_LIBS {
    lappend XELAB_LIB_OPT -L $lib
}


# Get HDL for elab.
exec xvlog \
    -sv \
    -work xil_defaultlib \
    {*}$RTL_LIST


# Get Top TB for elab.
exec xvlog \
    -sv \
    -work xil_defaultlib \
    ${TB_DIR}/${TB_TOP}.sv


# Elaboration
exec xelab \
    xil_defaultlib.$TB_TOP \
    xil_defaultlib.glbl \
    {*}$XELAB_LIB_OPT \
    -timescale 1ns/1ps \
    -snapshot $TB_TOP \
    -debug typical \
    -L unisims_ver \
    -L unimacro_ver \
    -L secureip

# Run sim.
exec xsim \
    $TB_TOP \
    -tclbatch "$SCR_DIR/sim_config.tcl" \
    -wdb "$SIM_DIR/$TB_TOP.wdb" \
    >@ stdout \
    2>@ stderr