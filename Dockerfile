FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

# set version label
ARG OPENTTD_VERSION="12.2"
ARG OPENGFX_VERSION="7.1"

ARG UBUNTU_CODENAME="focal"

RUN apt-get update -y && \
    echo "**** install Open TTD ****" && \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends dumb-init wget unzip ca-certificates libfontconfig1 libfreetype6  \
    libfluidsynth2 libicu-dev libpng16-16 liblzma-dev liblzo2-2  \
    libsdl1.2debian libsdl2-2.0-0 alsa-base alsa-utils libsndfile1-dev && \
    wget -q -O /tmp/openttd.deb https://cdn.openttd.org/openttd-releases/${OPENTTD_VERSION}/openttd-${OPENTTD_VERSION}-linux-ubuntu-${UBUNTU_CODENAME}-amd64.deb && \
   apt install -y /tmp/openttd.deb && \
   rm /tmp/openttd.deb && \
   rm -rf /var/lib/apt/lists

RUN mkdir -p /usr/share/games/openttd/baseset/

RUN wget -q -O /tmp/opengfx-${OPENGFX_VERSION}.zip  https://cdn.openttd.org/opengfx-releases/${OPENGFX_VERSION}/opengfx-${OPENGFX_VERSION}-all.zip && \
    unzip /tmp/opengfx-${OPENGFX_VERSION}.zip -d /tmp && \
    cd /usr/share/games/openttd/baseset/ && \
    tar -xf /tmp/opengfx-${OPENGFX_VERSION}.tar && \
    rm -rf /tmp/opengfx-*.tar /tmp/opengfx-*.zip

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
