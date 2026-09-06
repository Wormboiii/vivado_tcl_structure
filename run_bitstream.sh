#!/bin/bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"

mkdir -p "${BUILD_DIR}"

vivado -mode batch \
    -source "${ROOT_DIR}/script/build.tcl" \
    -log "${BUILD_DIR}/vivado.log" \
    -journal "${BUILD_DIR}/vivado.jou"