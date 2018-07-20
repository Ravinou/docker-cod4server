# docker-cod4server
Serveur de jeu Call of Duty 4

Ce conteneur est basé sur le projet LinuxGSM (https://linuxgsm.com/) lui-même basé pour Call of Duty 4 sur le projet COD4X (https://cod4x.me/). Le projet COD4X est un projet encore bien vivant et actif dont l'objectif est le suivant : "A client and server modification for Call of Duty: Modern Warfare with the aim to fix bugs and enhance gameplay!".

Ce conteneur à pour objectif de monter un serveur CoD4 en quelques secondes avec le promod activé (https://promod.github.io/). Ce promod était le mod officiel pour les matchs et compétitions sur Call of Duty 4.


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
