#!/bin/bash

set -e -ex


source tokens.sh

source deploy/bin/activate

limit=35

D="docker run --rm --env CIRCLE_TOKEN --env GITHUB_TOKEN -v $PWD:$PWD -w $PWD andreacensi/mcdp:docs-pull"


book1=books-DT18.yaml
out1=$PWD/docs-stable.duckietown.org/DT18
branches=master18:master17:master
python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}
#$D python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}

# book1=books-DT17.yaml
# out1=/mnt/builds-fork/docs-stable.duckietown.org/DT17
# branches=master17:master
# $D python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}

# book1=books-DT19.yaml
# out1=/mnt/builds-fork/docs-stable.duckietown.org/DT19
# branches=master19:master18:master17:master
# $D python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit} --preferred-branches ${branches}
# #book2=books-brown.yaml
# #out2=/mnt/builds-fork/books-brown
# #python -m mcdp_docs.sync_from_circle_multiple --books ${book2} --base ${out2} --limit ${limit}
