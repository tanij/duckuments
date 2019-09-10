#!/bin/bash

set -e -ex
date >> /home/duckietown/last-update.txt

cd /home/duckietown/scm/duckuments2
source tokens.sh

source deploy/bin/activate

limit=35

root=/mnt/builds-fork
#root=/docs-root
D="docker run --rm --env CIRCLE_TOKEN --env GITHUB_TOKEN -v $root:$root  -v $PWD:$PWD -w $PWD andreacensi/mcdp:docs-pull"


book1=books-daffy.yaml
out1=$root/docs-stable.duckietown.org/daffy
branches=daffy 
$D python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}

