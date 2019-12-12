import 'package:flutter/material.dart';
import 'package:rotator/boxes.dart';

void main() => runApp(MyApp());

final int boxesCount = 4;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rotator',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Rotator'),
          ),
          body: Boxes(),
        )
    );
  }
}
