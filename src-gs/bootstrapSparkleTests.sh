#! /bin/bash
### Install Sparkle tests from .gs files into a non-Rowan stone that already has Sparkle loaded

spkHome=${ROWAN_PROJECTS_HOME}/Sparkle
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -I ${spkHome}/src-gs/loginSystemUser.topaz  -S ${spkHome}/src-gs/bootstrapSparkleTests.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
