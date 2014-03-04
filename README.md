# Dartchat

Chart (aka dartchat) is a chat server and client (for demonstration purposes).

Chart is an example server and client for the Tour de Dart.
It is primarily used to demonstrate websockets in Dart.

Chart can be started/deployed using

- Dart Editor (or via Dart SDK)
- or [Docker] 

## How to use it using Dart Editor

Clone it from github 

```
git clone https://github.com/nkratzke/dartchat.git
```

and open created directory in your Dart Editor. Then:

1. Start the server by running <code>bin\chartserver.dart</code>.
2. Open as many webbrowser windows you like and open the url [http://localhost:3000][dart-url]
3. Or run file <code>web\chartclient.dart</code> with Dartium within your Dart Editor.

## How to use it using Docker

First install Docker for your system following the [install instructions] provided by Docker.

Then execute the following command to install Dartchat as a docker container on your system.

```
docker build -t dartchat github.com/nkratzke/dartchat
```

Last run the container and bind it to a typical web port (e.g. 80 or 8080).

```
docker run -p 3000:8080 -d dartchat
```

This will run the dartchat as a docker container. The chat is now 

## Tour de Dart

Tour de Dart is hosted on slideshare and can be accessed via the following links:

- [Tour de Dart Part I](http://www.nkode.io/2014/02/13/dart-part-I.html)
- [Tour de Dart Part II](http://www.nkode.io/2014/02/28/dart-part-II.html)


[docker-install]: https://www.docker.io/gettingstarted/
[dart-url]: http://localhost:3000
[docker-url]: http://localhost:8080
[docker]: https://docker.io