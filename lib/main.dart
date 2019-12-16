import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotator/boxes.dart';
import 'package:rotator/rotator.dart';

void main() => runApp(MyApp());

final int boxesCount = 4;

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
            body: Boxes(),
          )
      ),
    );
  }
}
