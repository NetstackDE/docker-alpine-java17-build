FROM alpine:edge
MAINTAINER Andreas Pfeiffer - Netstack <pfeiffer@netstack.de>

#add testing repo for JAVA 17
RUN apk update

#Install JAVA and Gradle 
RUN apk add openjdk17
RUN apk add nodejs

#Install Bash & git 
RUN apk add bash 
RUN apk add git

CMD ["/bin/bash"]
