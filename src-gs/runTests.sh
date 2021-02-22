#! /bin/bash
### Run Sparkle tests in a Rowan-enabled stone

spkHome=${ROWAN_PROJECTS_HOME}/Sparkle
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${spkHome}/src-gs/login.topaz  -S ${spkHome}/src-gs/runTests.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo TESTS FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
