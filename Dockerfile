FROM centos:6.10

# Intall system utilities
RUN yum -y update && yum -y install \
	git \
	ipmitool \
 && yum -y clean all

# Add the FirmwareLoader binary
RUN mkdir -p  /usr/local/src/FirmwareLoader/R1.0.1/linux-x86_64/bin
WORKDIR /usr/local/src/FirmwareLoader/R1.0.1/linux-x86_64/bin
ADD FirmwareLoader .

# Get the ProgramFPGA utility
WORKDIR /usr/local/src
RUN git clone https://github.com/slaclab/ProgramFPGA.git -b R1.0.18
RUN echo "FIRMWARELOADER_TOP=/usr/local/src/FirmwareLoader/R1.0.1" > ProgramFPGA/config.site
ENV PATH /usr/local/src/ProgramFPGA:${PATH}
