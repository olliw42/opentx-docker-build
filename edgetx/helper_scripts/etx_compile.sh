#!/bin/bash

. etx_func_run_docker.sh


DIR=/c/Users/Olli/Documents/GitHub/edgetx


BOARD=$1

run_docker ${DIR} ${BOARD} "${@:2}"

