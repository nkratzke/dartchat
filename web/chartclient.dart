import 'dart:html';
import 'package:dartchart/chart.dart';

// Helperfunktion um Fehlermeldungen auszugeben
String error(String msg) => "<p class='error'>$msg</p>";

main() {

  // Die Eingabe-Elemente des DOM-Tree
  final HtmlElement  chatname = querySelector("#chatname");
  final InputElement input    = querySelector("#message");
  final InputElement name     = querySelector("#name");
  final DivElement   chat     = querySelector("#chat");
  final DivElement   notify  = querySelector("#notify");

  // Wir bauen uns einen Socket auf.
  final WebSocket chatSocket = new WebSocket('ws://127.0.0.1:3000/messages');

  // Hier speichern wir uns den Namen des/der Chatters/in
  var chatter = "";

  // Wann immer etwas in das Namensfeld eingegeben wird
  name.onInput.listen((_) {
    chatter = name.value;
    chatname.innerHtml = chatter;
  });

  // Wann immer etwas in das Texteingabefeld (#message) eingegeben wird
  input.onKeyPress.listen((KeyboardEvent ev) {
     final keyEvent = new KeyEvent.wrap(ev);
     if (keyEvent.keyCode != KeyCode.ENTER) return;
     if (chatter == "") {
       notify.innerHtml = error("You have to enter a chat name to contribute to the chat.");
       name.focus();
       return;
     }

     if (input.value == "") {
       notify.innerHtml = error("You should enter a message before sending it ;-)");
       return;
     }

     if (chatSocket.readyState != WebSocket.OPEN) {
       notify.innerHtml = error("Sorry, we have no connection with the chat.");
       return;
     }

     final msg = new ChartMessage(chatter, input.value);
     input.value = "";
     chatSocket.send(msg.json);

     notify.innerHtml = "";
  });

  // Wann immer auf unserem Socket eine Nachricht eingeht
  chatSocket.onMessage.listen((msg) {
    final message = new ChartMessage.fromJSON(msg.data);
    chat.appendHtml("<p>${message.html}</p>");
    chat.scrollByLines(1000);
  });
}