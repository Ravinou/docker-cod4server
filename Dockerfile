FROM debian:latest
LABEL author="Raven"

# Update et install des dependances
RUN dpkg --add-architecture i386 \ 
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc tmux lib32gcc1 libstdc++6 libstdc++6:i386 vim procps locales

# Parametrage de la locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# Installation du serveur
RUN mkdir /home/cod4server \
    && useradd cod4server -d /home/cod4server -s /bin/bash
WORKDIR /home/cod4server
RUN wget -O linuxgsm.sh https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh \
    && chown -R cod4server:cod4server /home/cod4server/  \
    && chmod +x linuxgsm.sh

# bash linuxgsm.sh cod4server
