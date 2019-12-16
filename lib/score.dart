import 'package:flutter/cupertino.dart';

import 'main.dart';

final String _TOTAL = "Total taps: ";
final String _DELTA = "Delta reaction: ";
final String _LAST = "Last reaction: ";

class Score extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  String total = _TOTAL + '0';
  String delta = _DELTA + '0';
  String last = _LAST + '0';

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScoreNotification>(
      onNotification: _updateScore,
      child: Column(
        children: <Widget>[
          _text("Total taps: $total"),
          _text("Delta reaction: $delta"),
          _text("Last reaction: $last"),
        ],
      ),
    );
  }

  bool _updateScore(ScoreNotification n) {
    print("received notification");
    setState(() {
      total = _TOTAL + n.total;
      delta = _DELTA + n.delta;
      last = _LAST + n.last;
    });
    return true;
  }
}

class ScoreNotification extends Notification {
  final String total, delta, last;

  const ScoreNotification({this.total, this.delta, this.last});
}

Text _text(String t) => Text(
  t,
  style: TextStyle(fontStyle: FontStyle.italic, color: TEXT),
);