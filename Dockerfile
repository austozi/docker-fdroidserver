FROM debian:13-slim

LABEL org.opencontainers.image.authors="austozi"

ENV DEBIAN_FRONTEND=noninteractive

# Repository configuration
ENV FDROID_REPO_NAME="F-Droid Repository" \
    FDROID_REPO_ICON="fdroid.svg" \
    FDROID_REPO_DESCRIPTION="Application repository for Android devices, powered by F-Droid." \
    FDROID_REPO_URL="http://localhost" \
    FDROID_UPDATE_INTERVAL=43200 \
    ANDROID_HOME=/opt/android-sdk \
    ANDROID_SDK_ROOT=/opt/android-sdk \
    PATH="/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:${PATH}"

# Android SDK versions
ARG CMDLINE_TOOLS_VERSION=13114758
ARG BUILD_TOOLS_VERSION=36.0.0
ARG PLATFORM_VERSION=36

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        busybox \
        ca-certificates \
        curl \
        fdroidserver \
        openjdk-21-jre-headless \
        unzip; \
    \
    mkdir -p "${ANDROID_SDK_ROOT}/cmdline-tools"; \
    curl -fsSL \
        "https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_TOOLS_VERSION}_latest.zip" \
        -o /tmp/cmdline-tools.zip; \
    unzip -q /tmp/cmdline-tools.zip -d "${ANDROID_SDK_ROOT}/cmdline-tools"; \
    mv "${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools" \
       "${ANDROID_SDK_ROOT}/cmdline-tools/latest"; \
    rm /tmp/cmdline-tools.zip; \
    \
    yes | sdkmanager --licenses >/dev/null; \
    sdkmanager \
        "platform-tools" \
        "platforms;android-${PLATFORM_VERSION}" \
        "build-tools;${BUILD_TOOLS_VERSION}"; \
    \
    mkdir -p \
        /fdroid \
        /fdroid/repo \
        /updates; \
    \
    chmod -R a+rX "${ANDROID_SDK_ROOT}"; \
    \
    apt-get clean; \
    rm -rf \
        /var/lib/apt/lists/* \
        /root/.android \
        /root/.cache \
        /tmp/*

WORKDIR /fdroid

EXPOSE 8080

HEALTHCHECK --interval=1m --timeout=5s --start-period=30s \
CMD busybox wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1

CMD ["sh", "-ceu", "\
busybox httpd -f -p 8080 -h /fdroid/repo & \
HTTPD_PID=$!; \
while :; do \
    kill -0 \"$HTTPD_PID\" || exit 1; \
    for f in /updates/*.sh; do \
        [ -f \"$f\" ] && sh \"$f\"; \
    done; \
    fdroid update -c; \
    sleep \"$FDROID_UPDATE_INTERVAL\"; \
done"]
