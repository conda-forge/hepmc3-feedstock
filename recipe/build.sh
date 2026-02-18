#!/usr/bin/env bash
set -euo pipefail

cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DHEPMC3_ENABLE_ROOTIO=OFF \
    -DHEPMC3_ENABLE_PYTHON=ON \
    -DHEPMC3_BUILD_DOCS=OFF \
    -DHEPMC3_BUILD_EXAMPLES=ON \
    -DHEPMC3_ENABLE_TEST=ON \
    -S source \
    -B build

cmake --build build --parallel "${CPU_COUNT}"
ctest --test-dir build
cmake --install build
