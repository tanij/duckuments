#!/bin/bash

set -e -ex
date >> /home/duckietown/last-update.txt

cd /home/duckietown/scm/duckuments2
source tokens.sh

source deploy/bin/activate

limit=25


book2=books-brown.yaml
root=/mnt/builds-fork
#root=/docs-root
out2=$root/docs-brown.duckietown.org/books-brown

D="docker run --rm --env CIRCLE_TOKEN --env GITHUB_TOKEN -v $root:$root -v $PWD:$PWD -w $PWD andreacensi/mcdp:docs-pull"


$D python -m mcdp_docs.sync_from_circle_multiple --books ${book2} --base ${out2} --limit ${limit}
