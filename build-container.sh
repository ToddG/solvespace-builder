#!/bin/bash

# sigh. b/c cmake fails to get the git commit hash from a submodule
# this does not work... I did this and then had to 'deinit' the submodule
# git submodule add https://github.com/solvespace/solvespace solvespace-source

# manually clone if it doesn't already exist
if [[ ! -d solvespace-source ]]
then
    git clone https://github.com/solvespace/solvespace solvespace-source
fi

pushd solvespace-source
git submodule update --init --recursive
popd

if [[ ! -d solvespace-bin ]]
then
    mkdir solvespace-bin
fi

# use --no-cache if things get wonky
#docker build docker/. -t solvespace-container:latest --no-cache

docker build docker/. -t solvespace-container:latest
