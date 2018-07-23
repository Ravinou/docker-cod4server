#!/usr/bin/env bash
set -e

if [ "$1" = 'start' ]; then
	su - cod4server -s /bin/bash -c "/home/cod4server/cod4server start"
fi
