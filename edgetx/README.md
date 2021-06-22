# EdgeTx Docker

This docker is for compiling EdgeTx 2.4.

Usage:

- Clone or fork this repo and checkout the master branch.

- Then one needs to build a local docker image. This needs to be done only once. 

I'm on Win7 and am using the DockerToolbox. In the box, I did it with

```
cd "/c/Users/Olli/Documents/GitHub/opentx-docker-build/edgetx"
docker build -f Dockerfile -t my_etx .
cd "/c/Program Files/Docker Toolbox"
```

Note: SECURITY WARNINGS, if they occur, can simply be ignored.

- For compiling EdgeTx 2.4 for a Jumper T16 radio, I enter in the docker box

```
docker run --rm -it -e "BOARD_NAME=t16" -v "/c/Users/Olli/Documents/GitHub/edgetx:/edgetx" -e "CMAKE_FLAGS=LUA=YES INTERNAL_MODULE_MULTI=YES PPM_UNIT=US MODULE_PROTOCOL_FLEX=YES" my_etx
```

- For compiling EdgeTx 2.4 for a RadioMaster TX16S radio, I enter in the docker box

```
docker run --rm -it -e "BOARD_NAME=tx16s" -v "/c/Users/Olli/Documents/GitHub/edgetx:/edgetx" -e "CMAKE_FLAGS=LUA=YES INTERNAL_MODULE_MULTI=YES PPM_UNIT=US MODULE_PROTOCOL_FLEX=YES" my_etx
```

- You also can use the bash scripts in the helper_scripts folder. Copy the content to the proper docker location, in my case it is the folder "C:\Program Files\Docker Toolbox". Adapt the DIR entry in the etx_compile.sh script such that it points to your location of the firmware. Then in the docker box call e.g. 

```
etx_compile.sh tx16s
```
