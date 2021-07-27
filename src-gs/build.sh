#! /bin/bash
## Generate auto-generated files for distribution
## Must be run in a Rowan extent into which Sparkle has been loaded with installSparkle.sh

## Figure out what directory this script is in
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

${script_dir}/generateDocs.sh && ${script_dir}/generateBootstrap.sh
