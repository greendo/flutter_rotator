import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rotator/main.dart';

class MyBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> with SingleTickerProviderStateMixin {
  Container _container;
  MaterialColor _color = Colors.cyan;
  AnimationController controller;
  Animation<double> animation;
  double _angle = 0;
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    var size = _size(context);

    _container = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: Border.all(), color: _color),
    );

    Timer.periodic(Duration(seconds: _random.nextInt(10)), (timer) {
      if(!MyAppState.animating) {
        MyAppState.animating = true;
        controller.forward();
      }
    });

    return GestureDetector(
      child: Transform.rotate(
          angle: _angle,
          child: _container
      ),
      onTap: () {
        setState(() {
          controller.stop();
          _color = Colors.brown;
          _angle = 0;
          MyAppState.animating = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 45).animate(controller)
      ..addListener(() {
        setState(() {
          _angle = animation.value;
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyBoxes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBoxesState();
}

class _MyBoxesState extends State<MyBoxes> {
  Widget _gridView;
  final List<MyBox> boxes = List.generate(pow(boxesCount, 2), (index) {
    return MyBox();
  });

  @override
  Widget build(BuildContext context) {
    _gridView = GridView.count(crossAxisCount: boxesCount, children: boxes);
    return _gridView;
  }
}

double _size(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  return width < height ? width / boxesCount : height / boxesCount;
}
