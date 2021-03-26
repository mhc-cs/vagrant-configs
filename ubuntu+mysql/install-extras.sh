#!/usr/bin/env bash

# update repos and install extra packages
apt-get update -y ;
apt-get install -y mysql-server valgrind openjdk-8-jre-headless spim emacs gcc make ;
apt-get upgrade -y ;
apt-get autoremove -y ;
