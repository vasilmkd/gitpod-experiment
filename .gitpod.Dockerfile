FROM ubuntu:20.04

# Install latest packages
RUN apt-get update && apt-get upgrade -y

# Install essentials
RUN apt-get install -y git lsb-release curl

# Install AdoptOpenJDK 11
RUN apt-get install -y wget apt-transport-https gnupg

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -

RUN echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/adoptopenjdk.list

RUN apt-get update && apt-get install -y adoptopenjdk-11-hotspot

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get install -y nodejs

# Install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add

RUN apt-get update && apt-get install -y sbt

# Install jekyll
RUN apt-get install -y ruby-full build-essential zlib1g-dev

RUN gem install jekyll bundler
