#! /bin/bash
### Install RSR and Sparkle from Tonel files into a Rowan-enabled stone
### Check for error count of 0 at end

## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -I loginSystemUser.topaz  -S installSparkle.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED
        echo !!!!!!!!!!!!!!
        exit 1
    fi
