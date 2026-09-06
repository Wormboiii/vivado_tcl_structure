# ============================================================
# Xilinx Global Simulation Module
# ============================================================

set GLBL_FILE "$::env(XILINX_VIVADO)/data/verilog/src/glbl.v"

exec xvlog \
    -work xil_defaultlib \
    $GLBL_FILE


# ============================================================
# Read IP
# ============================================================

read_ip $IP_LIST

set IPS [get_ips]


# ============================================================
# Generate Simulation Output Products
# ============================================================

generate_target simulation $IPS


# ============================================================
# Get IP Simulation Sources
# ============================================================

set IP_SIM_FILES [get_files \
    -compile_order sources \
    -used_in simulation \
    -of_objects $IPS]



# ============================================================
# XSim Precompiled Libraries
# ============================================================

set XSIM_LIB_OPT [list \
    -L unisims_ver \
    -L unimacro_ver \
    -L secureip \
]



# ============================================================
# Collect IP Information
# ============================================================

set IP_LIBS     {}
set IP_INC_DIRS {}

foreach file $IP_SIM_FILES {

    set type [get_property FILE_TYPE $file]
    set lib  [get_property LIBRARY   $file]

    # Logical libraries
    if {$lib ne ""} {
        lappend IP_LIBS $lib
    }

    # Header files are not compiled directly.
    # Only their directories are used as include paths.
    if {$type eq "Verilog Header" ||
        $type eq "SystemVerilog Header"} {

        lappend IP_INC_DIRS [file dirname $file]
    }
}

set IP_LIBS     [lsort -unique $IP_LIBS]
set IP_INC_DIRS [lsort -unique $IP_INC_DIRS]


# ============================================================
# xvlog Include Options
# ============================================================

set XVLOG_INC_OPT {}

foreach dir $IP_INC_DIRS {
    lappend XVLOG_INC_OPT -i $dir
}


# ============================================================
# Compile IP Simulation Sources
# ============================================================

foreach file $IP_SIM_FILES {

    set type [get_property FILE_TYPE $file]
    set lib  [get_property LIBRARY   $file]

    # Fallback
    if {$lib eq ""} {
        set lib xil_defaultlib
    }

    switch $type {

        "Verilog" {
            exec xvlog \
                {*}$XSIM_LIB_OPT \
                {*}$XVLOG_INC_OPT \
                -work $lib \
                $file
        }

        "SystemVerilog" {
            exec xvlog \
                -sv \
                {*}$XSIM_LIB_OPT \
                {*}$XVLOG_INC_OPT \
                -work $lib \
                $file
        }

        "VHDL" {
            exec xvhdl \
                -work $lib \
                $file
        }

        "VHDL 2008" {
            exec xvhdl \
                -2008 \
                -work $lib \
                $file
        }

        default {
            # Header, XCI, memory initialization files, etc.
            # are not compiled directly.
        }
    }
}