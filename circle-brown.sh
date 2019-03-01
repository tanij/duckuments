#!/bin/bash

set -e -ex
date >> /home/duckietown/last-update.txt

cd /home/duckietown/scm/duckuments2
source tokens.sh

source deploy/bin/activate

limit=25


book2=books-brown.yaml
out2=/mnt/builds-fork/books-brown

D="docker run --rm --env CIRCLE_TOKEN --env GITHUB_TOKEN -v /mnt/builds-fork:/mnt/builds-fork -v $PWD:$PWD -w $PWD andreacensi/mcdp:docs-pull"


$D python -m mcdp_docs.sync_from_circle_multiple --books ${book2} --base ${out2} --limit ${limit}
