#!/bin/bash

set -e -ex

source tokens.sh

limit=6

book1=books-main.yaml

out1=sites/docs.duckietown.org/DT18
branches=master18:master

D="docker run -it --env CIRCLE_TOKEN --env GITHUB_TOKEN -v $PWD:$PWD -w $PWD andreacensi/mcdp:1902-estetic"
$D python -m mcdp_docs.sync_from_circle_multiple --preferred-branches ${branches} --books ${book1} --base ${out1} --limit ${limit}

out1=sites/docs.duckietown.org/DT17
branches=master17:master

$D python -m mcdp_docs.sync_from_circle_multiple --preferred-branches ${branches} --books ${book1} --base ${out1} --limit ${limit}


#book2=books-brown.yaml
#out2=/mnt/builds-fork/books-brown
#python -m mcdp_docs.sync_from_circle_multiple --books ${book2} --base ${out2} --limit ${limit}
