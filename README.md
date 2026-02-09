# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server, with a bundled web server.

## Build

1. Download the [latest release tarball](https://github.com/austozi/docker-fdroidserver/releases/latest) and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .`. You can specify the version of build-tools by passing `--build-arg FDROID_BUILD_TOOLS_VERSION=36.0.0` (change to desired version) to the `docker build` command.

## Install

Download docker-compose.yml and execute `docker compose up -d`.

## Configure

The bundled Apache web server will create an index.html file in the web root directory at /var/www/html within the container, if none already exists. This can be prevented by mounting a custom index.html file in that directory, or by configuring the reverse proxy to always redirect to /repo. 

For example, for Nginx:

```
location / {
  return 302 /repo;
}
```
