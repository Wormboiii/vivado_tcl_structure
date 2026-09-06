#!/bin/bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SIM_DIR="${ROOT_DIR}/sim"

mkdir -p "${SIM_DIR}"

vivado -mode batch \
    -source script/sim.tcl \
    -log sim/vivado.log \
    -journal sim/vivado.jou