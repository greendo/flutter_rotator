import 'package:flutter/cupertino.dart';
import 'package:rotator/main.dart' as prefix0;
import 'package:rotator/utils/rotator.dart';

import '../main.dart';

final String _total = "Total taps:";
final String _delta = "Delta reaction:";
final String _last = "Last reaction:";

class Score extends StatelessWidget {
  final RotorData data;

  const Score({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: border,
          ),
          color: prefix0.textContainer,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          _text("$_total ${data.taps}"),
          _text("$_delta: ${data.delta}"),
          _text("$_last: ${data.last}"),
        ],
      ),
    );
  }
}

Text _text(String t) => Text(
  t,
  style: TextStyle(fontStyle: FontStyle.italic, color: text),
);