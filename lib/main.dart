import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotator/boxes.dart';
import 'package:rotator/rotator.dart';
import 'package:rotator/score.dart';

final int boxesCount = 4;

final CALM = Colors.cyan.shade900;
final MOVING = Colors.cyan.shade700;
final BORDER = Colors.indigo.shade400;
final TEXT = Colors.blueGrey.shade300.withOpacity(0.6);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<Rotor>.value(
      value: new Rotor(),
      child: MaterialApp(
          title: 'Rotator',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Rotator'),
            ),
            body: Column(
              children: <Widget>[
                Expanded(child: Boxes()),
                Score()
              ],
            ),
            backgroundColor: CALM,
          )),
    );
  }
}
