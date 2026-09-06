#==============================================================================        
#           
# Vivado TCL bitstream program scripts          
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


# Bitstream file name
set BIT_NAME "blank_prj"

# Set file hierarchy path const.
set BIT_DIR [file normalize "./build"]
set BIT_FILE "${BIT_DIR}/${BIT_NAME}.bit"


# ============================================================
# Hardware Connection
# ============================================================

open_hw_manager

connect_hw_server -url localhost:3121

open_hw_target


# ============================================================
# Select Device
# ============================================================

set HW_DEVICE [lindex [get_hw_devices] 0]

current_hw_device $HW_DEVICE

refresh_hw_device \
    -update_hw_probes false \
    $HW_DEVICE


# ============================================================
# Program FPGA
# ============================================================

set_property PROGRAM.FILE $BIT_FILE $HW_DEVICE

program_hw_devices $HW_DEVICE


# ============================================================
# Close
# ============================================================

close_hw_target
disconnect_hw_server
close_hw_manager