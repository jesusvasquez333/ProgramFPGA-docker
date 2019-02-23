# Docker image with the SLAC's ProgramFPGA utility

## Description

This docker image, named **program-fpga** contains the SLAC's ProgramFPGA utility, which is based on CPSW, and it is used load firmware into the ATCA-based HPS FGPAs.

It is based on ubuntu 18.04

## Source code


## Building the image

The provided script *build_docker.sh* will automatically build the docker image. It will tag the resulting image using the same git tag string (as returned by `git describe --tags --always`).

## How to get the container

To get the most recent version of the docker image, first you will need to install docker in you host OS and be logged in. Then you can pull a copy by running:

```
docker pull jesusvasquez333/program-fpga:<TAG>
```

Where **<TAG>** represents the specific tagged version you want to use.

## How to run the container