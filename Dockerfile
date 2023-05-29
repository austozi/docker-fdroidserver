FROM ghcr.io/linuxserver/nginx:latest

LABEL author=austozi
LABEL maintainer=austozi

# apksigner is required by modern APK packages.
# This is shipped inside the build-tools package as part of the Android SDK.
# To enable apksigner, we need to install build-tools.
# This specifies the build-tools version to install at image build time.
ARG BUILD_TOOLS_VERSION='33.0.2'

# Define environment variables.
# These can be redefined at run time.
ENV FDROID_REPO_NAME='F-Droid Repository'
ENV FDROID_REPO_ICON='fdroid.svg'
ENV FDROID_REPO_DESCRIPTION='Application repository for Android devices, powered by F-Droid.'
ENV FDROID_REPO_URL='http://localhost'
ENV FDROID_UPDATE_INTERVAL=12h

# Install system packages from Alpine Linux's repo.
RUN apk add --update --no-cache \
	curl \
	gcc \
	gpgv \
	g++ \
	libc-dev \
	libffi-dev \
	libjpeg-turbo-dev \
	make \
	openjdk11 \
	py3-pip \
	python3-dev \
	zlib-dev

# Install latest packages from the pypi.org.
RUN pip install -U \
	fdroidserver \
	sdkmanager
	
# Install build-tools using sdkmanager.
RUN sdkmanager "build-tools;$BUILD_TOOLS_VERSION"

# Symlink /usr/local/bin/apksigner so it's in the default search path.
RUN ln -s /opt/android-sdk/build-tools/$BUILD_TOOLS_VERSION/apksigner /usr/local/bin/apksigner

# Set default working directory.
RUN mkdir -p /fdroid
WORKDIR /fdroid

# Copy files over to the image.
COPY ./root/ /

# Make scripts executable.
RUN chmod +x /usr/local/bin/*
RUN chmod +x /etc/cont-init.d/*
