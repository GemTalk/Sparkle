#! /bin/bash
## Generate auto-generated .gs bootstrap file for distribution
## Must be run in a Rowan extent into which Sparkle has been loaded with installSparkle.sh

## Figure out what directory this script is in
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
checkout_dir=${script_dir}/..

## Generate bootstrap.gs file from a Rowan-enabled stone with Sparkle loaded.
topaz -l -I loginSystemUser.topaz  -S generateBootstrap.topaz \
    || ( echo bootstrap generation failed!; exit 1 )
