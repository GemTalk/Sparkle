#! /bin/bash
### Install RSR and Sparkle from .gs files into a non-Rowan stone

spkHome=${ROWAN_PROJECTS_HOME}/Sparkle
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${spkHome}/src-gs/loginSystemUser.topaz  -S ${spkHome}/src-gs/bootstrapSparkle.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
