FROM alpine:3.6

MAINTAINER Raphael Mendonça <raphamendonca> 

#FROM alpine:3.5

#ENV JAVA_DISTRIBUTION 
#ENV JAVA_VERSION 9

#RUN apk add "$JAVA_DISTRIBUTION$JAVA_VERSION" --update && rm -rf /var/cache/apk/*  && ln -s "/usr/lib/jvm/java-1.$JAVA_VERSION-openjdk/bin/javac" /usr/bin/javac

ENV JAVA_HOME=/opt/jre \
    PATH=${PATH}:/opt/jre/bin \
    LANG=C.UTF-8 \
    TZ=Asia/Shanghai

RUN set -ex && \
    apk add --no-cache bash tzdata && \
    wget http://download.java.net/java/jdk9-alpine/archive/181/binaries/serverjre-9-ea+181_linux-x64-musl_bin.tar.gz -O jre.tar.gz && \
    mkdir -p /opt/jre && \
    tar zxvf jre.tar.gz -C /opt/jre --strip-components=1 && rm jre.tar.gz && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ | tee /etc/timezone && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf
#Source Repository
#  xzlcorp/alpine-java9
