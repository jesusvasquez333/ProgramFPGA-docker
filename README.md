# Docker image with the SLAC's ProgramFPGA utility

## Description

This docker image, named **program-fpga** contains the SLAC's ProgramFPGA utility, which is based on CPSW, and it is used load firmware into the ATCA-based HPS FGPAs.

It is based on CentOS 6.10 to match as close as possible our SLAC environment.

## Source code

The FirmwareLoader binary was taken directly from our SLAC installation version. The binary was manually copied into this repository in the form of a tarball.

The ProgramFPGA was cloned from its github repository.

## Building the image

The provided script *build_docker.sh* will automatically build the docker image. It will tag the resulting image using the same git tag string (as returned by `git describe --tags --always`).

## How to get the container

To get the most recent version of the docker image, first you will need to install docker in you host OS and be logged in. Then you can pull a copy by running:

```
docker pull jesusvasquez333/program-fpga:<TAG>
```

Where **<TAG>** represents the specific tagged version you want to use.

## How to run the container

You need to have a copy of your Firmware MCS (or MCS.gz) file in you host OS. Also, your host must be able to reach the target FPGA.

You host need to have the ipmi driver **ipmi_devintf** installed and loaded in your host. If so, the device **/dev/ipmi0** must be present in your host. This device needs to be accessible from the container.

Then you can run the container, for example, like this:

```
docker run -ti --rm --name program-fpga \
	--device /dev/ipmi0 \
    -v <MCS_DIR>:/fw \
    jesusvasquez333/program-fpga:<TAG> <ARGS>
```

where:
- **<TAG>**: is the tag of the docker image you want to use,
- **<MCS_DIR>**: is the full path to the MCS (or MCS.gz) file in your host,
- **<ARG>**: are the ProgramFPGA program arguments. Note that the MCS (or MCS.gz) image will be located in **/fw/<MCS_FILE_NAME>.mcs[.gz]** so, you need to pass the argument `-m /fw/<MCS_FILE_NAME>.mcs[.gz]`.
