FROM debian:stable-slim

LABEL author=austozi
LABEL maintainer=austozi

# Define environment variables.
ENV FDROID_REPO_NAME='F-Droid Repository'
ENV FDROID_REPO_ICON='fdroid.svg'
ENV FDROID_REPO_DESCRIPTION='Application repository for Android devices, powered by F-Droid.'
ENV FDROID_REPO_URL='http://localhost'
ENV FDROID_UPDATE_INTERVAL=12h

# Update this during build time as necessary.
ARG FDROID_BUILD_TOOLS_VERSION='36.0.0'

# Install system packages from Debian's official repo.
RUN apt-get -y update && \
    apt-get -yy install \
       apache2 \
       curl \
       fdroidserver \
       sdkmanager

# Install build-tools using sdkmanager.
RUN sdkmanager "build-tools;$FDROID_BUILD_TOOLS_VERSION"

# Create directories
RUN mkdir -p /fdroid /updates

# Set default working directory.
WORKDIR /fdroid

ENTRYPOINT ["bash", "-c"]
CMD ["apache2ctl -D FOREGROUND & for f in /updates/*.sh; do bash \"$f\"; done && fdroid update -c && sleep $FDROID_UPDATE_INTERVAL"]
