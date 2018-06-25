#!/bin/bash
git submodule foreach --recursive "git commit -am done&";
sleep 30
git submodule foreach --recursive "git pull&";
sleep 30
git submodule foreach --recursive "git push&";
sleep 30
git submodule foreach --recursive "git pull&";
sleep 30
git submodule foreach --recursive "git commit -am done&";
sleep 30
git submodule foreach --recursive "git push&";
