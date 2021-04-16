#! /bin/bash
### Run Sparkle tests in a Rowan-enabled stone

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

topaz -l -I ${SCRIPT_DIR}/login.topaz  -S ${SCRIPT_DIR}/runTests.topaz 
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo TESTS FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
