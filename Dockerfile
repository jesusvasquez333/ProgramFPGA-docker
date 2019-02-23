FROM ubuntu:18.04

# Install system tools
RUN apt-get update && apt-get install -y \
    git \
    wget \
    g++ \
    cmake \
 && rm -rf /var/lib/apt/lists/*

# Install boost 1.63.0 from source
WORKDIR /usr/local/src
RUN mkdir -p boost/1.63.0
WORKDIR boost/1.63.0
RUN wget -c http://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.tar.gz/download -O - | tar zx --strip 1
RUN ./bootstrap.sh --with-libraries=atomic && ./b2 variant=release threading=multi -d0 && ./b2 install

# Install yaml-cpp v0.5.3 from source
WORKDIR /usr/local/src
RUN mkdir -p yaml-cpp/yaml-cpp-0.5.3
WORKDIR yaml-cpp/yaml-cpp-0.5.3
RUN wget -c https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.5.3.tar.gz -O - | tar zx --strip 1
RUN mkdir
WORKDIR build
RUN cmake .. -DBUILD_SHARED_LIBS=ON && make install

# Install CPSW
WORKDIR /usr/local/src
RUN git clone https://github.com/slaclab/cpsw.git -b R3.6.6
WORKDIR cpsw
RUN rm config.mak && touch config.mak
#RUN sed -i -e 's|const double DFLT_POLL_SECS|constexpr double DFLT_POLL_SECS|g' src/cpsw_entry.h

# Get the ProgramFPGA utility
WORKDIR /usr/local/src

# Add the IPMI package
WORKDIR /usr/local/src