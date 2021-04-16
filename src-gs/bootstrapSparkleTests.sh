#! /bin/bash
### Install Sparkle tests from .gs files into a non-Rowan stone that already has Sparkle loaded

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${SCRIPT_DIR}/loginSystemUser.topaz  \
    -S ${SCRIPT_DIR}/bootstrapSparkleTests.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
