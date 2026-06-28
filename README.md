# F-Droid

The [F-Droid server](https://gitlab.com/fdroid/fdroidserver), dockerised.

This is the dockerised version of the F-Droid server, with a bundled web server.

## Build

1. Download the [latest release tarball](https://github.com/austozi/docker-fdroidserver/releases/latest) and extract it.
2. Navigate to the folder where Dockerfile is and execute `docker build .`. You can specify the version of build-tools by passing `--build-arg FDROID_BUILD_TOOLS_VERSION=36.0.0` (change to desired version) to the `docker build` command.

## Install

1. Download docker-compose.yml.
2. Customise docker-compose.yml for the F-Droid instance.
3. Execute `docker compose up -d`.

## Configure

The bundled web server serves the /fdroid/repo directory as the webroot on port 8080. This behaviour is hardcoded. 

F-Droid expects third-party repos to be served at https://fdroid.example.com/fdroid/repo, and considers the URL malformed if this convention is not followed. You should configure the reverse proxy to redirect to this path. For example, in Caddy:

```
fdroid.example.com {
  redir / /fdroid/repo/ 302
  redir /fdroid/repo /fdroid/repo/ 302
  handle_path /fdroid/repo/* {
    reverse_proxy fdroidserver:8080
	}
}
```
