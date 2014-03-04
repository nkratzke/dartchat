import 'package:start/start.dart';
import 'dart:io';

main() {

  start(host: '0.0.0.0', port: 3000).then((Server app) {

    // Alle Verbindungen in einer Liste verwalten ...
    final sockets = <WebSocket>[];

    // Wir nutzen start, um statischen Content (z.B. unseren
    // Client) auszuliefern
    app.static("../build/web/");

    // Hier nehmen wir eingehende Socketanfragen an
    app.get("/messages").listen((Request req) {
      // wandeln sie in einen WebSocket
      WebSocketTransformer.upgrade(req.input).then((ws) {
        sockets.add(ws); // speichern sie uns,
        // und leiten eingehende Messages an alle anderen
        // WebSockets weiter.
        ws.listen((msg) => sockets.forEach((ws) => ws.add(msg)));
      });
    });
  });
}