#!/usr/bin/env bash
# language=sh
# set -euo pipefail
# set -x # echo commands

short=$1
src=$2

if [ "$CI" = "" ]
then
   branch=`git -C ${src} rev-parse --abbrev-ref HEAD`
else
   branch=${CIRCLE_BRANCH}
fi

#branch=`git -C ${src} rev-parse --abbrev-ref HEAD`
#toplevel=`git -C ${src} rev-parse --show-toplevel`
#repo=`basename ${toplevel}`
org=`git config --get remote.origin.url | cut -f2 -d":"  | cut -f1 -d/ | tr '[:upper:]' '[:lower:]'`

repo=duckuments
base=https://docs-branches.duckietown.org/${org}/${repo}/branch/${branch}
echo base: ${base}


cross=${base}/all_crossref.html
permalink_prefix=${base}/${short}/out

if [ "$CI" = "" ]
then
   echo "Not on Circle, using parallel compilation."
   cmd="rparmake n=4"
   #extra_crossrefs=${base}/all_crossref.html
   #options1="--extra_crossrefs ${extra_crossrefs}"
   options1=""
else
   echo "On Circle, not using parallel compilation to avoid running out of memory."
   cmd=rmake
   options1=""
fi


dist=duckuments-dist

if [ "$ONLY_FOR_REFS" = "" ]
then
   options2="--output_file ${dist}/${short}/out.html --split ${dist}/${short}/out/ --resolve_external"

else
   echo "Skipping polish, ONLY_FOR_REFS"

   # XXX: need to do split because of cross refs
   options2="--split ${dist}/${short}/out/ --ignore_ref_errors --only_refs"
fi

# only andrea and CI build the PDF version

if [ "${USER}" = "andrea" ]
then
    options2="${options2} --pdf ${dist}/${short}/out.pdf"
fi

if [ "$CI" = "" ]
then
   echo
else
   options2="${options2} --pdf ${dist}/${short}/out.pdf"
fi


mkdir -p ${dist}

NP=${PWD}/node_modules:${NODE_PATH}

#source deploy/bin/activate
#--likebtn 5ae54e0d6fd08bb24f3a7fa1 \

DISABLE_CONTRACTS=1 NODE_PATH=${NP}  mcdp-render-manual \
    --src ${src} \
    --bookshort "${short}" \
    --resources docs/resources/common:docs/resources/templates/duckiebook1:${dist} \
    --stylesheet v_manual_split \
    --stylesheet_pdf v_manual_blurb_ready \
    --symbols docs/symbols.tex \
    --wordpress_integration \
    --output_crossref ${dist}/${short}/crossref.html \
    -o out/${short} \
    --permalink_prefix ${permalink_prefix} \
    ${options1} \
    ${options2} \
    -c "config echo 1; ${cmd}"
