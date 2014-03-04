# Install a dartchat as a docker container.
# Dartchat will be exposed via HTTP on port 3000.
#
# This file is hosted on github. Therefore you can start it in docker like this:
# > docker build -t dartchat github.com/nkratzke/dartchat
# > docker run -p 3000:8080 -d dartchat

FROM stackbrew/ubuntu:13.10
MAINTAINER Nane Kratzke <nane@nkode.io>

# Get the command apt-add-repository working. Needed to install Dart SDK.
# Do not touch this until you know what you are doing.
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

# Install Dart SDK. Do not touch this until you know what you are doing.
# We do not install darteditor nor dartium because this is a server container.
# See: http://askubuntu.com/questions/377233/how-to-install-google-dart-in-ubuntu
RUN apt-add-repository ppa:hachre/dart
RUN apt-get -y update
RUN apt-get install -y dartsdk

# Install the dartchat app.
# Copy the bin and web directory to the container. Then run "pub get" and "pub build"
# to build the app.
ADD pubspec.yaml /opt/containerdart/dartchat/pubspec.yaml
ADD bin /opt/dockers/dartchat/bin
ADD web /opt/dockers/dartchat/web
WORKDIR /opt/dockers/dartchat
RUN pub build

# Expose port 3000 where the chat is working on.
EXPOSE 3000

# Entrypoint starts the chatserver.
WORKDIR /opt/dockers/dartchat/bin
ENTRYPOINT ["dart", "chartserver.dart"]