![F-Droid icon](https://raw.githubusercontent.com/austozi/selfhosted/main/fdroidserver/fdroid.svg)

# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server bundled with the [Nginx web server from LinuxServer.io](https://hub.docker.com/r/linuxserver/nginx). It is based on Alpine Linux.

This image does not implement the full features of the F-Droid server. For example, it lacks the ability to sign APKs, because it does not bundle apksigner or the Android SDK. I tried but couldn't get the full implementation to work due to the unavailability of packages in the Alpine Linux repo. The primary use of the image, for me personally, is to host third-party APKs that are already signed, so I do not deem it worthwhile to pursue the full implementation. The container will warn/complain about the partial implementation. Those messages are simply suppressed.

## Build

1. Download the [latest release tarball](https://github.com/austozi/docker-fdroidserver/releases/latest) and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .
