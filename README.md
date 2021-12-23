# solvespace-builder

Docker container to build and run solvespace


## quickstart

    build-container.sh
    compile-solvespace.sh
    run-solvespace.sh

## clear a build (from the host)

    rm -rf solvespace-bin/*

## dependencies

    docker

## directories

* docker : docker file for the build container
* solvespace-bin : output directory for the compiled binary
* solvespace-other : other input files for the container (like build.sh)
* solvespace-source : git submodule containing source to be compiled

## linked issues

* https://github.com/solvespace/solvespace/issues/1161
