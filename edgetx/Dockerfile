# A Debian image for compiling firmware of EdgeTX 2.4+ 
FROM python:3.8-slim-buster

# Update and install the required components
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get -y install wget zip bzip2 cmake build-essential git libgtest-dev libfox-1.6-dev libsdl1.2-dev qt5-default qttools5-dev-tools qtmultimedia5-dev qttools5-dev libqt5svg5-dev

# Retrieve and install the required version of the ARM compiler

# this is what one should use for etx2.4
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 -P /tmp --progress=bar:force
RUN tar -C /tmp -xjf /tmp/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
RUN mv /tmp/gcc-arm-none-eabi-10-2020-q4-major /opt/gcc-arm-none-eabi
RUN rm /tmp/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip3 install pillow libclang-py3 pyqt5
RUN apt-get install -y libclang-3.9-dev

# Declare the mount point
VOLUME ["/edgetx"]

# Set the working directory to /build
WORKDIR /build

# Add the build scripts
COPY build-fw.py /build
COPY fwoptions.py /build

# Update the path
ENV PATH $PATH:/opt/gcc-arm-none-eabi/bin:/edgetx/radio/util

# Run the shell script to build the firmware
ENTRYPOINT ["bash", "-c", "python /build/build-fw.py $BOARD_NAME $CMAKE_FLAGS"]
