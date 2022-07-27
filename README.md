![F-Droid icon](https://raw.githubusercontent.com/austozi/selfhosted/main/fdroidserver/fdroid.svg)

# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server bundled with the [Nginx web server from LinuxServer.io](https://hub.docker.com/r/linuxserver/nginx). It is based on Alpine Linux.

## Build

1. Download the latest release tarball and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .`

## Install

See [here](https://github.com/austozi/selfhosted/tree/main/fdroidserver) for deployment and usage instructions.

This image is available at [Docker Hub](https://hub.docker.com/r/austozi/fdroidserver).
