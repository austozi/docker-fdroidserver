FROM ghcr.io/linuxserver/nginx:latest

LABEL maintainer=austozi

ENV FDROID_REPO_NAME='F-Droid Repository'
ENV FDROID_REPO_ICON='fdroid.svg'
ENV FDROID_REPO_DESCRIPTION='Application repository for Android devices, powered by F-Droid.'
ENV FDROID_REPO_URL='http://localhost'
ENV FDROID_UPDATE_INTERVAL=12h

RUN apk add --no-cache \
	android-tools \
	curl \
	gcc \
	g++ \
	libc-dev \
	libffi-dev \
	libjpeg-turbo-dev \
	make \
	openjdk11 \
	python3-dev \
	zlib-dev
	
RUN python3 -m ensurepip
RUN python3 -m pip install -U \
	pip \
	wheel
RUN python3 -m pip install -U \
	lastversion \
	pillow \
	fdroidserver

COPY ./root/ /

RUN chmod +x /usr/local/bin/refresh

EXPOSE 80
