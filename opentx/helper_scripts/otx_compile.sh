#!/bin/bash

. otx_func_run_docker.sh


DIR=/c/Users/Olli/Documents/GitHub/opentx


BOARD=$1

run_docker ${DIR} ${BOARD} "${@:2}"

