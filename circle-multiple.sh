#!/bin/bash

set -e -ex
date >> /home/duckietown/last-update.txt

cd /home/duckietown/scm/duckuments2
source tokens.sh

source deploy/bin/activate

limit=15

book1=books-main.yaml
out1=/mnt/builds-fork/books2
python -m mcdp_docs.sync_from_circle_multiple --books ${book1} --base ${out1} --limit ${limit}

#book2=books-brown.yaml
#out2=/mnt/builds-fork/books-brown
#python -m mcdp_docs.sync_from_circle_multiple --books ${book2} --base ${out2} --limit ${limit}
