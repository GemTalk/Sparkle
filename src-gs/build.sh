#! /bin/bash
## Generate auto-generated files for distribution
## Must be run in a Rowan extent into which Sparkle has been loaded with installSparkle.sh

## Figure out what directory this script is in
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
checkout_dir=${script_dir}/..

## Generate bootstrap.gs file from a Rowan-enabled stone with Sparkle loaded.
topaz -l -I loginSystemUser.topaz  -S generateGs.topaz \
    || ( echo bootstrap generation failed!; exit 1 )

## Generate Markdown docs
doc_src_dir=${checkout_dir}/src-doc
doc_target=${checkout_dir}/Documentation/SparkleInstall.md

cd ${checkout_dir}
cat ${doc_src_dir}/generatedNoticeComment.txt > ${doc_target}
sed -f ${doc_src_dir}/SparkleInstall.sed ${doc_src_dir}/SparkleInstall.src.md >> ${doc_target} \
    || ( echo Markdown variable replacement failed!; exit 1 )
