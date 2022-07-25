# F-Droid

F-Droid server, dockerised.

This is the dockerised version of the F-Droid server bundled with the Apache web server in one Docker image. The image is based on Debian Stable with the fdroidserver and apache2 packages installed from the official Debian package repository. The version numbers of these packages therefore are identical to the version numbers in the official Debian repository.

## Build

1. Clone this repository using `git clone`.
2. Navigate to the root folder of the repository where Dockerfile is, and execute `docker build .`

## Usage

Once the container has been deployed via the usual route (e.g. with `docker run` or `docker-compose up`), the web frontend can be accessed at http://<container_ip> (default port: 80). If the container port 80 is bound to the host port 8080, then the web frontend can accessed at http://<docker_host_ip>:8080.

The F-Droid server commands have to be executed manually. Do this on the Docker host (assuming fdroid is the container name):

```
docker exec -it fdroid fdroid init
docker exec -it fdroid update -c
```
