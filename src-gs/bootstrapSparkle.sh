#! /bin/bash
### Install RSR and Sparkle from .gs files into a non-Rowan stone

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

topaz -l -I ${SCRIPT_DIR}/loginSystemUser.topaz \
    -S ${SCRIPT_DIR}/bootstrapSparkle.topaz
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
