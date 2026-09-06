#==============================================================================        
#           
# Vivado TCL build sources          
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


# Naming of this design
set design_name "blank_prj"
set fpga_part "xc7a35tfgg484-2"

# Preferences setting
source "./script/build_config.tcl"

# Set FPGA core for this design
set_part ${fpga_part}

# Set file hierarchy path const.
set LIB_DIR [file normalize "./lib"]
set XDC_DIR [file normalize "./const"]
set RTL_DIR [file normalize "./rtl"]
set LST_DIR [file normalize "./list"]

# Read IP first
# Create your desired IP in GUI,
# and than copy the output .xci files into each ./lib/ip directory.
source "${LST_DIR}/ip_list.tcl"
read_ip $IP_LIST
reset_target all [get_ips]
synth_ip [get_ips]

# Read rtl modules
source "${LST_DIR}/rtl_list.tcl"
read_verilog $RTL_LIST

# Read constraints
read_xdc "${XDC_DIR}/pin.xdc"


# Synthesis
synth_design -top "led_top" -part ${fpga_part}

# PnR
opt_design
place_design
route_design

# Write bitstream
write_bitstream -force "./build/${design_name}.bit"

