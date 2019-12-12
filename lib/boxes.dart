import 'dart:math';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rotator/box.dart';
import 'package:rotator/notifications.dart';

import 'main.dart';

class Boxes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  Random _random = Random();
  bool animating = false;

  Widget _gridView;
  final List<Box> boxes = List.generate(pow(boxesCount, 2), (index) {
    return Box(id: index);
  });

  @override
  Widget build(BuildContext context) {
    _gridView = GridView.count(crossAxisCount: boxesCount, children: boxes);

    Timer.periodic(Duration(seconds: _random.nextInt(10)), (timer) {
      print("enter timer cycle");
      if(!animating) {
        animating = true;
        int id = _random.nextInt(boxesCount * boxesCount);
        print("sending to: $id");
        RotationNotification(id: id)..dispatch(context);
      }
    });

    return NotificationListener<TappedNotification>(
      onNotification: _tapped,
      child: _gridView,
    );
  }

  bool _tapped(TappedNotification n) {
    print("received stop from: ${n.id}");
    animating = false;
    return true;
  }
}