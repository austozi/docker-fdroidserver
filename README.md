![F-Droid icon](https://raw.githubusercontent.com/austozi/selfhosted/main/fdroidserver/fdroid.svg)

# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server bundled with the [Nginx web server from LinuxServer.io](https://hub.docker.com/r/linuxserver/nginx). It is based on Alpine Linux.

This image does not implement the full features of the F-Droid server. Release v23.1.1 and prior releases did not include apksigner because I couldn't figure out how to install it. I have since figured that out and included apksigner in the new image build, so fdroid no longer complains about missing apksigner and now supports modern APKs that require it.

## Build

1. Download the [latest release tarball](https://github.com/austozi/docker-fdroidserver/releases/latest) and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .

## Install

See installation instructions [here](https://github.com/austozi/selfhosted/tree/main/fdroidserver).
