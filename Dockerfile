FROM alpine:latest
MAINTAINER Andreas Pfeiffer - Netstack <pfeiffer@netstack.de>

#add testing repo for JAVA 17
echo "@test http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

#Install JAVA and Gradle 
RUN apk add openjdk17
RUN apk add maven

#Install Bash & git 
RUN apk add bash 
RUN apk add git

#install workaround stuff to run local node binary
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-bin-2.28-r0.apk
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-i18n-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk
RUN apk add glibc-bin-2.28-r0.apk
RUN apk add glibc-i18n-2.28-r0.apk

CMD ["/bin/bash"]
