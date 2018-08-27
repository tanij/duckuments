#!/bin/zsh
set -x
#set -e
#
#for a in docs-*; do
#    rm -rf "$a/.git"
#    git -C "$a" init
#    git -C "$a" remote add origin git@github.com:duckietown/$a.git
#    git -C "$a" pull
##    git -C "$a" submodule add --name resources git@github.com:duckietown/docs-resources.git resources
##    git -C "$a" commit -am "init"
#    git -C "$a" push --set-upstream origin master
#done
#
# for a in **/resources doc-resources; do
#     echo
#     echo $a
#     echo
#     git -C "$a" pull
#     git -C "$a" commit -am "no message"
#     git -C "$a" push
#
# done



template=doc-template

for a in docs-*; do
#    git -C "$a" remote set-url origin  git@github.com:duckietown/$NAME.git
    echo
    echo $a
    echo
    cp ${template}/.gitattributes $a/
    cp ${template}/.gitignore $a/
    cp ${template}/README.md $a/
    cp ${template}/Makefile $a/
    cp ${template}/.circleci/config.yml $a/.circleci/

    git -C "$a" add .circleci README.md .gitignore .gitattributes book

#    git -C "$a" pull
    git -C "$a" commit -am "updating boilerplate"
    # git -C "$a" push
done


#NAME=docs-opmanual_duckiebot
#git submodule add --name $NAME git@github.com:duckietown/$NAME.git $NAME
