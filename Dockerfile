FROM debian:latest
LABEL author="Raven"

RUN dpkg --add-architecture i386 \ 
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc tmux lib32gcc1 libstdc++6 libstdc++6:i386
RUN mkdir /home/cod4server \
    && useradd cod4server -d /home/cod4server    
RUN su - cod4server \
    && cd /home/cod4server \
    && wget -O linuxgsm.sh https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh \
    && chmod +x linuxgsm.sh
