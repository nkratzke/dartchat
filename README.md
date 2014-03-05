# Dartchat

Chart (aka dartchat) is a chat server and client (for demonstration purposes). 
Chart is an example server and client for the [Tour de Dart Part II][tour-de-dart-II].
It is primarily used to demonstrate websockets in Dart but also
to demonstrate how to dockerize a Dart server application.

Chart can be

- started using [Dart Editor][dart] (or via Dart SDK)
- or deployed using [Docker][docker]

## How to start it using Dart Editor

Clone it from github 

```
git clone https://github.com/nkratzke/dartchat.git
```

and open created directory in your Dart Editor. Then:

1. Run <code>pub build</code> in Dart Editor.
2. Start the server by running <code>bin\chartserver.dart</code>.
3. Open as many webbrowser windows you like and open the url [http://localhost:3000][dart-url]

## How to deploy it using Docker

First install Docker for your system following the [install instructions][docker-install] provided by Docker.

Then execute the following command to install Dartchat as a docker container on your system.

```
docker build -t dartchat github.com/nkratzke/dartchat
```

Finally run the container and bind it to a typical web port (e.g. 80 or 8080).

```
docker run -p 8080:3000 -d dartchat
```

This will run the dartchat as a docker container. The chat is now accessible via
[http://localhost:8080][docker-url];

### Remarks regarding docker (on non linux systems)

If docker is used on a non linux system like Mac OS X it is likely that docker uses [VirtualBox][virtualbox] under the hood (creating a virtual machine called _boot2docker-vm_). In theses cases you must configure port forwarding in virtual box. So if you are exposing port 3000 in your docker container mapping it to port 8080 for the outside world you must forward host port 8080 to boot2docker-vm port 8080 in virtualbox. How to do this is explained [here][virtualbox-portforward]. Same should work on Windows system (but I do not have figured that out).

## Tour de Dart

Tour de Dart is hosted on slideshare and can be accessed via the following links:

- [Tour de Dart Part I][tour-de-dart-I]
- [Tour de Dart Part II][tour-de-dart-II]

[tour-de-dart-I]: http://www.nkode.io/2014/02/13/dart-part-I.html
[tour-de-dart-II]: http://www.nkode.io/2014/02/28/dart-part-II.html
[dart]: https://www.dartlang.org/
[docker-install]: https://www.docker.io/gettingstarted/
[dart-url]: http://localhost:3000
[docker-url]: http://localhost:8080
[docker]: https://www.docker.io
[virtualbox]: https://www.virtualbox.org/
[virtualbox-portforward]: http://www.virtualbox.org/manual/ch06.html#natforward
