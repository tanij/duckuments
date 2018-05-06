#!/usr/bin/env bash
# language=sh
# set -euo pipefail
# set -x # echo commands

short=$1
src=$2

if [ "$CI" = "" ]
then
   echo "Not on Circle, using parallel compilation."
   cmd=rparmake
   branch=`git rev-parse --abbrev-ref HEAD`
else
   echo "On Circle, not using parallel compilation to avoid running out of memory."
   cmd=rmake
   branch=${CIRCLE_BRANCH}
fi


dist=duckuments-dist

if [ "$ONLY_FOR_REFS" = "" ]
then
   options="--pdf ${dist}/${short}/out.pdf --output_file ${dist}/${short}/out.html --split ${dist}/${short}/out/ "

else
   echo "Skipping polish, ONLY_FOR_REFS"
   options="--ignore_ref_errors"
fi



mkdir -p ${dist}

org=`git config --get remote.origin.url | cut -f2 -d":"  | cut -f1 -d/ | tr '[:upper:]' '[:lower:]'`

base=http://docs-branches.duckietown.org/${org}/duckuments/branch
cross=${base}/${branch}/all_crossref.html
permalink_prefix=${base}/${branch}/${short}/out

NP=${PWD}/node_modules:${NODE_PATH}

source deploy/bin/activate

DISABLE_CONTRACTS=1 NODE_PATH=${NP}  mcdp-render-manual \
    --src ${src} \
    --resources docs:${dist} \
    --stylesheet v_manual_split \
    --symbols docs/symbols.tex \
    --wordpress_integration \
    --extra_crossrefs http://docs.duckietown.org/all_crossref.html \
    --output_crossref ${dist}/${short}/crossref.html \
    --likebtn 5ae54e0d6fd08bb24f3a7fa1 \
    -o out/${short} \
    --permalink_prefix ${permalink_prefix} \
    ${options} \
    -c "config echo 1; ${cmd}"
