import 'package:flutter/material.dart';
import 'package:rotator/my_widget.dart';

void main() => runApp(MyApp());

final int boxesCount = 4;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static bool animating = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rotator',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Rotator'),
          ),
          body: MyBoxes(),
        )
    );
  }
}
