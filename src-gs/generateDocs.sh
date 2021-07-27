#! /bin/bash
## Generate auto-generated Markdown files for distribution

## Figure out what directory this script is in
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
checkout_dir=${script_dir}/..

## Generate Markdown docs
doc_src_dir=${checkout_dir}/src-doc
doc_target=${checkout_dir}/Documentation/SparkleInstall.md

cd ${checkout_dir}
cat ${doc_src_dir}/generatedNoticeComment.txt > ${doc_target}
sed -f ${doc_src_dir}/SparkleInstall.sed ${doc_src_dir}/SparkleInstall.src.md >> ${doc_target} \
    || ( echo Markdown variable replacement failed!; exit 1 )
