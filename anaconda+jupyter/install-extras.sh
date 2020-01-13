#!/usr/bin/env bash

# update repos and install extra packages
apt-get update ;
apt-get install -y valgrind openjdk-8-jre-headless gcc make ;
apt-get upgrade -y ;
