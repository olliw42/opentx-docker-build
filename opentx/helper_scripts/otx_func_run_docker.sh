#!/bin/bash


# Comment: Don't worry about the TELEMETRY_MAVLINK flag. If you are running vanilla firmware it is
# irrelevant and won't have any effect.
FLAGS="LUA=YES INTERNAL_MODULE_MULTI=YES PPM_UNIT=US MODULE_PROTOCOL_FLEX=YES TELEMETRY_MAVLINK=YES"


DOCKER=my_otx

MOUNT=opentx


run_docker() {
  XDIR="$1"
  XBOARD="$2"
  XEXTRA_FLAGS_ARGS="$3"
  for arg in "${@:4}"; do
    XEXTRA_FLAGS_ARGS="${XEXTRA_FLAGS_ARGS} $arg"
  done

  echo '********************'
  if [[ -z $XEXTRA_FLAGS_ARGS ]]; then
    echo compile OpenTx23 for ${XBOARD^^} with ${DOCKER} with no extra flags
  else
    XEXTRA_FLAGS=""
    for val in $XEXTRA_FLAGS_ARGS; do
      if [[ $val == *"="* ]]; then
        XEXTRA_FLAGS="${XEXTRA_FLAGS} $val"
      else
        XEXTRA_FLAGS="${XEXTRA_FLAGS} $val=YES"
      fi
    done
    echo compile OpenTx23 for ${XBOARD^^} with ${DOCKER} with ${XEXTRA_FLAGS}
  fi
  echo '********************'

  docker run --rm -it -e "BOARD_NAME=${XBOARD,,}" -v "${DIR}:/${MOUNT}" -e "CMAKE_FLAGS=${FLAGS} ${XEXTRA_FLAGS}" ${DOCKER}
}
