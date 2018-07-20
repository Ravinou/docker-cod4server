# docker-cod4server
Serveur de jeu Call of Duty 4

Ce conteneur est basé sur le projet LinuxGSM (https://linuxgsm.com/) lui-même basé pour Call of Duty 4 sur le projet COD4X (https://cod4x.me/). Le projet COD4X, encore bien vivant et actif, a pour objectif : "A client and server modification for Call of Duty: Modern Warfare with the aim to fix bugs and enhance gameplay!".

Ce conteneur permet de monter un serveur CoD4 en quelques secondes **avec le promod activé** (https://promod.github.io/). Ce promod était le mod officiel pour les matchs et compétitions sur Call of Duty 4.


## DEBUG
En cas de problème avec le conteneur, il est possible de s'y connecter avec la commande :

`docker exec -it conteneur /bin/bash`

En tant qu'utilisateur "cod4server" vous pourrez lancer les commandes suivantes depuis `/home/cod4server` :

**start**

`./cod4server start`

**stop**

`./cod4server stop`

**restart**

`./cod4server restart`

**détails**

*Détails sur les ports, les fichiers de config, les rconpass etc...*

`./cod4server details`

**Logs**

`/home/cod4server/logs`

Autres commandes : https://linuxgsm.com/lgsm/cod4server/

## Lancement du conteneur

`./cod4x18_dedrun +set sv_punkbuster 0 +set fs_basepath /home/cod4server/serverfiles +set dedicated 1 +set net_ip 172.16.26.44 +set net_port 28960 +set sv_maxclients 32 +exec cod4server.cfg +map mp_crossfire +set fs_game Mods/pml220`

En cours de rédaction
