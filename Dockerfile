FROM python:3-stretch
MAINTAINER yusanish <yusanish@gmail.com>

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive

# JUMAN KNP Version
ENV JUMANPP_VERSION 1.02
ENV JUMAN_VERSION 7.01
ENV KNP_VERSION 4.19

RUN apt-get update --fix-missing &&\
    apt-get install -y --fix-missing apt-utils dialog
RUN apt-get upgrade -y --fix-missing &&\
    apt-get install -y --fix-missing libboost-dev &&\
    apt-get install -y --fix-missing google-perftools &&\
    apt-get install -y --fix-missing libgoogle-perftools-dev &&\
# python container had already
    apt-get install -y --fix-missing gcc &&\
    apt-get install -y --fix-missing g++ &&\
    apt-get install -y --fix-missing make &&\
    apt-get install -y --fix-missing wget &&\
# to decompress *.tar.bz2
    apt-get install -y --fix-missing bzip2 &&\
# install JUMANPP
	wget http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-${JUMANPP_VERSION}.tar.xz -O /tmp/jumanpp.tar.xz &&\
    tar xJvf /tmp/jumanpp.tar.xz -C /tmp &&\
    cd /tmp/jumanpp-${JUMANPP_VERSION} &&\
    ./configure --prefix=/usr/local/ && make && make install &&\
    rm -rf /tmp/* &&\
    rm -rf /var/cache/apk/* &&\
# install JUMAN
    wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-${JUMAN_VERSION}.tar.bz2 -O /tmp/juman.tar.bz2 &&\ 
    tar xf /tmp/juman.tar.bz2 -C /tmp &&\
    cd /tmp/juman-${JUMAN_VERSION} &&\ 
    ./configure --prefix=/usr/local/ && make && make install &&\
    rm -rf /tmp/* &&\
    rm -rf /var/cache/apk/* &&\
    apt-get update && apt-get install -y --fix-missing libjuman4 &&\
# install KNP
    apt-get install -y --fix-missing zlib1g-dev &&\
    wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-${KNP_VERSION}.tar.bz2 -O /tmp/knp.tar.bz2 &&\
    tar xf /tmp/knp.tar.bz2 -C /tmp &&\
    cd /tmp/knp-${KNP_VERSION} / &&\
    ./configure --prefix=/usr/local/ --with-juman-prefix=/usr/local/ && make && make install &&\
    rm -rf /tmp/* &&\
    rm -rf /var/cache/apk/*

# to use Japanese
RUN apt-get install -y -f locales
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

# clean up all temporary files 
RUN apt-get clean &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\    
    rm -f /etc/ssh/ssh_host_*
	
CMD /bin/bash
