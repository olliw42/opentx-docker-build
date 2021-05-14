# EdgeTx and OpenTx docker, 2.4 versions

That's my modifications to the great vitas docker file for compiling OpenTx. For the original credantials please scroll to the below.

This branch has the docker for compiling the 2.4 versions of EdgeTx or OpenTx.

Usage:

- Clone or fork this repo and checkout this branch here. 

- Then one needs to build a local docker image. 

I'm on Win7 and am using the DockerToolbox. In the box, I did it with

```
cd "/c/Users/Olli/Documents/GitHub/opentx-docker-build/"
docker build -f Dockerfile -t my_otx24 .
cd "/c/Program Files/Docker Toolbox"
```

Note: SECURITY WARNINGS, if they occur, can be just ignored.

Note: The docker can be used for both OpenTx and EdgeTx, see below.

- For compiling OpenTx2.4 for a Jumper T16 radio, I enter in the box

```
docker run --rm -it -e "BOARD_NAME=t16" -v "/c/Users/Olli/Documents/GitHub/opentx:/opentx" -e "CMAKE_FLAGS=LUA=YES INTERNAL_MODULE_MULTI=YES PPM_UNIT=US MODULE_PROTOCOL_FLEX=YES" my_otx24
```

- For compiling EdgeTx2.4 for a Jumper T16 radio, I enter in the box

```
docker run --rm -it -e "BOARD_NAME=t16" -v "/c/Users/Olli/Documents/GitHub/edgetx:/opentx" -e "CMAKE_FLAGS=LUA=YES INTERNAL_MODULE_MULTI=YES PPM_UNIT=US MODULE_PROTOCOL_FLEX=YES" my_otx24
```

Note: The difference is in the folder!





# opentx-docker-build

A Docker container for building firmware [OpenTX](https://github.com/opentx/opentx), 

The container contains a Debian Linux image pre-configured with the tools required to build OpenTX.  
Running the container will compile the firmware from a local source tree and produce a compiled firmware image.

# Instructions
## Setup
1. [Install Docker](https://docs.docker.com/install/)
   * If installing on Windows choose **Linux Containers** when prompted
   
1. Pull the container:

   `docker pull vitass/opentx-fw-build`

1. Clone the OpenTX repository:

   `git clone --recursive -b 2.3 https://github.com/opentx/opentx.git`


## Modify the Firmware
Use your tool of choice to make changes to the OpenTX source.

## Board target name
You have to specify a board name as first env variable (BOARD_NAME), it is lowercase name like x10, t12, etc
   
## Build the Firmware
1. Run the container, specifying the path to the OpenTX source as a mount volume:

   `docker run --rm -it -e "BOARD_NAME=board_name" -v [OpenTX Source Path]:/opentx vitass/opentx-fw-build`
   
   example build jumper t16 formware:
 
   `docker run --rm -it -e "BOARD_NAME=t16" -v "/home/vitas/github/opentx.git:/opentxtx" vitass/opentx-fw-build`

The compiled firmware image will be placed in the root of the source directory when the build has finished.  

The default output name is `opentx-boardname-2.3.3ver.bin` but this will vary depending on any optional flags that may have been passed.

## Changing the Build Flags
Build flags can be changed by passing a switch to the Docker container when it is run.

Default flags will be replaced by the new value, additional flags will be appended.

### Examples

1. Build from the source in `/home/vitas/opentx.git` for x10 and disable `HELI`:

   `docker run --rm -it -v "/home/vitas/opentx.git/:/opentx" -e "BOARD_NAME=x10" -e "CMAKE_FLAGS=HELI=NO" vitass/opentx-fw-build`
