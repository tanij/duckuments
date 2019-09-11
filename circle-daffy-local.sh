#!/bin/bash

set -e -ex


source tokens.sh


limit=35

D="docker run --rm --env CIRCLE_TOKEN --env GITHUB_TOKEN -v $PWD:$PWD -w $PWD andreacensi/mcdp:docs-pull"


book1=books-daffy.yaml
out1=$PWD/docs-stable.duckietown.org/daffy
branches=daffy
python3 -m mcdp_docs.sync_from_circle_multiple \
    --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}


#$D python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}
