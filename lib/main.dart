import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotator/ui/boxes.dart';
import 'package:rotator/ui/score.dart';
import 'package:rotator/utils/notifier.dart';
import 'package:rotator/utils/rotator.dart';

final int boxesCount = 4;

final calm = Colors.black26;
final moving = Colors.yellow.shade200;
final border = Colors.white24;
final text = Colors.black26;
final textContainer = Colors.yellow.shade200.withOpacity(0.6);

final minDuration = 4;
final maxDuration = 11;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ScoreNotifier sn = ScoreNotifier(Rotor());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScoreNotifier>.value(
      value: sn,
      child: MaterialApp(
          title: 'Rotator',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Rotator'),
            ),
            body: Column(
              children: <Widget>[
                Expanded(child: Boxes()),
                Consumer<ScoreNotifier>(
                  builder: (context, sn, child) {
                    return Score(data: sn.rotor.produceData());
                  },
                )
              ],
            ),
            backgroundColor: calm,
          )),
    );
  }
}
