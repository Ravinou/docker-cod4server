#!/usr/bin/env sh
set -e

if [ "$1" = 'start' ]; then
	/home/cod4server/serverfiles/cod4x18_dedrun +set sv_punkbuster 0 +set fs_basepath /home/cod4server/serverfiles +set dedicated 2 +set sv_maxclients 32 +exec cod4server.cfg +map mp_crash +set fs_game Mods/pml220
fi
