# F-Droid

F-Droid server, dockerised.

This is the dockerised version of the F-Droid server bundled with the Apache web server in one Docker image. The image is based on Debian Stable with the fdroidserver and apache2 packages installed from the official Debian package repository. The version numbers of these packages therefore are identical to the version numbers in the official Debian repository.

## Build

1. Clone this repository using `git clone`.
2. Navigate to the root folder of the repository where Dockerfile is, and execute `docker build .`
