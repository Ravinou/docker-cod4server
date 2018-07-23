FROM debian:latest
LABEL author="Raven"

# Update et install des dependances
RUN dpkg --add-architecture i386 \ 
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install \
       mailutils \
       postfix \
       curl \
       wget \
       file \
       bzip2 \
       gzip \
       unzip \
       bsdmainutils \
       python \
       util-linux \
       ca-certificates \
       binutils \
       bc \
       jq \
       tmux \
       lib32gcc1 \
       libstdc++6 \
       libstdc++6:i386 \
       vim \
       procps \
       locales \
       net-tools

# Parametrage de la locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Preparation environnement et téléchargement des ressources
RUN mkdir /home/cod4server \
    && useradd cod4server -d /home/cod4server -s /bin/bash
WORKDIR /home/cod4server
RUN wget -O linuxgsm.sh https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh \
    && chown -R cod4server:cod4server /home/cod4server/  \
    && chmod +x linuxgsm.sh

USER cod4server

#Installation du serveur
RUN bash linuxgsm.sh cod4server
RUN printf 'Y\nyes' | ./cod4server install

#Installation du Promod
RUN wget -O promod.zip https://promod.github.io/releases/promodlive220_eu.zip \
    && unzip promod.zip -d promod \
    && mv /home/cod4server/promod/pml220 /home/cod4server/serverfiles/Mods/ \
    && rm -rf /home/cod4server/promod/ \
    && rm -rf /home/cod4server/promod.zip

#Installation des conf serveur pour accès par VOLUMES
RUN mkdir /home/cod4server/config
VOLUME /home/cod4server/config
RUN rm /home/cod4server/serverfiles/main/cod4server.cfg \
    && rm /home/cod4server/lgsm/config-lgsm/cod4server/cod4server.cfg \
    && ln -s /home/cod4server/config/config.cfg /home/cod4server/serverfiles/main/cod4server.cfg \
    && ln -s /home/cod4server/config/config-daemon.cfg /home/cod4server/lgsm/config-lgsm/cod4server/cod4server.cfg

COPY ./entrypoint.sh /home/cod4server/
ENTRYPOINT ["/home/cod4server/entrypoint.sh"]
CMD ["start"]
