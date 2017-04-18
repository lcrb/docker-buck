FROM ubuntu

RUN apt-get update && apt-get install -y git gcc gdb g++ automake default-jdk ant python make python-dev gcc-arm-none-eabi gdb-arm-none-eabi openocd sudo curl wget

RUN apt-get install -y autotools-dev automake libtool pkg-config 
RUN apt-get install -y libssl-dev libglib2.0-dev 

# Install watchman for buck
RUN git clone https://github.com/facebook/watchman.git
RUN cd watchman && ./autogen.sh && ./configure && make && make install

# Insatll buck
RUN git clone https://github.com/facebook/buck.git
RUN cd buck && ant 
RUN cd buck && ln -s ${PWD}/bin/buck /usr/bin/buck
