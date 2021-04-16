#!/bin/bash

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

topaz -l -I ${SCRIPT_DIR}/login.topaz  \
    -S ${SCRIPT_DIR}/runServerLoop.topaz
