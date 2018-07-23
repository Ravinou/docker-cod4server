#!/usr/bin/env bash
#Si execution en tant que user root, le script doit l'être en tant que user cod4server, donc remplacez par : su - cod4server -s /bin/bash -c "/home/cod4server/cod4server start

set -e

if [ "$1" = 'start' ]; then
	/home/cod4server/cod4server start
fi
