library chart;

import 'dart:convert';

String escape(String unsafe) => const HtmlEscape().convert(unsafe);

class ChartMessage {
  String _from;
  String _msg;

  ChartMessage.fromJSON(msgAsJSON) {
    final map = JSON.decode(msgAsJSON);
    _from = map['from'];
    _msg = map['msg'];
  }

  ChartMessage(this._from, this._msg);

  String get json => JSON.encode({ "from" : _from, "msg"  : _msg });

  String get html => "<strong>[${escape(_from)}]</strong> ${escape(_msg)}";
}