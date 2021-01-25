FROM ubuntu:20.04

# Install latest packages
RUN apt update && apt upgrade -y && apt install -y 

# Install essentials
RUN apt install -y git lsb-release curl

# Install AdoptOpenJDK 11
RUN apt install -y wget apt-transport-https gnupg

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -

RUN echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/adoptopenjdk.list

RUN apt update && apt install -y adoptopenjdk-11-hotspot

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt install -y nodejs

# Install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add

RUN apt update && apt install -y sbt
