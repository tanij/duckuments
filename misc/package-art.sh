#!/bin/bash
set -e -x
dest="dest"
out=$1
rm -rf ${dest}

mkdir -p ${dest}/

load_or_parse_from_tag

tar cvfz  ${out} -C dest .

