FROM ubuntu:18.04

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo nano cron
RUN apt-get update && apt-get upgrade --assume-yes
RUN useradd -u 1001 -m linuxgsm
RUN adduser linuxgsm sudo
RUN echo "linuxgsm:linuxgsm" | chpasswd
RUN apt-get install -y curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 python3 cpio libsdl2-2.0-0:i386 iproute2
RUN apt-get clean
RUN wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh
RUN chown 1001:1001 /linuxgsm.sh
RUN cp linuxgsm.sh /home/linuxgsm/linuxgsm.sh
RUN chown 1001:1001 /home/linuxgsm

USER linuxgsm

WORKDIR /home/linuxgsm

ENV HOME /home/linuxgsm

ENV TERM=xterm

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/linuxgsm

RUN linuxgsm.sh vhserver
RUN vhserver auto-install

VOLUME /home/linuxgsm/.config/unity3d/IronGate/Valheim
VOLUME /home/linuxgsm/lgsm/backup
VOLUME /home/linuxgsm/lgsm/config-lgsm/vhserver
