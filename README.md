# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server bundled with the [Nginx web server from LinuxServer.io](https://hub.docker.com/r/linuxserver/nginx) in one Docker image.

## Build

1. Download the latest release tarball and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .`

## Usage

Once the container has been deployed via the usual route (e.g. with `docker run` or `docker-compose up`), the web frontend can be accessed at http://localhost (default port: 80).

Environmental variables can be specified via Docker run parameters or in the docker-compose.yml file.

The repo will auto-update on a customisable time interval. This auto-update can include downloading third-party APKs to the repo. APK downloads can be scripted. Save the scripts in a folder and mount it to /config/fdroid/update-scripts in the container. These download scripts will be executed one by one during the audo-update.

To manually trigger an update, execute on the Docker host:

```
docker exec -it fdroid fdroid refresh
```
