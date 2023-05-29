FROM ghcr.io/linuxserver/nginx:latest

LABEL author=austozi
LABEL maintainer=austozi

ENV FDROID_REPO_NAME='F-Droid Repository'
ENV FDROID_REPO_ICON='fdroid.svg'
ENV FDROID_REPO_DESCRIPTION='Application repository for Android devices, powered by F-Droid.'
ENV FDROID_REPO_URL='http://localhost'
ENV FDROID_UPDATE_INTERVAL=12h

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
	python3-dev \
	zlib-dev

RUN pip install -U \
	fdroidserver \
	sdkmanager

COPY ./root/ /

RUN chmod +x /usr/local/bin/refresh
