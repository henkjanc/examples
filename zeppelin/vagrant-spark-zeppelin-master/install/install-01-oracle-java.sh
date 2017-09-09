#!/usr/bin/env bash

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/jre/
export PATH=$PATH:$JAVA_HOME/bin

echo
echo
echo "Installing Java"

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

export DEBIAN_FRONTEND=noninteractive 
apt-get install -y --force-yes oracle-java7-installer oracle-java7-set-default

java -version
