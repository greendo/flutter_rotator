import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rotator/main.dart';
import 'package:rotator/notifications.dart';

class Box extends StatefulWidget {
  final int id;

  Box({Key key, @required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxState();
}

class _BoxState extends State<Box> with SingleTickerProviderStateMixin {
  int _id;
  Container _container;
  MaterialColor _color = Colors.brown;
  AnimationController controller;
  Animation<double> animation;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    _id = widget.id;
    print("my id is: $_id");
    var size = _size(context);

    _container = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: Border.all(), color: _color),
    );

    return GestureDetector(
      child: Transform.rotate(
          angle: _angle,
          child: NotificationListener<RotationNotification>(
            onNotification: _initRotation,
            child: _container,
          )
      ),
      onTap: () {
        print("ontap id: $_id");
        setState(() {
          print("setstate id: $_id");
          controller.stop();
          _color = Colors.brown;
          _angle = 0;
          TappedNotification(id: _id)
            ..dispatch(context);
        });
      },
    );
  }

  bool _initRotation(RotationNotification n) {
    print("Box $_id received ${n.id}");
    if (n.id == _id) {
      print("Box $_id rotating");
      _color = Colors.cyan;
      controller.forward();
    }
    return true;
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

double _size(BuildContext context) {
  var width = MediaQuery
      .of(context)
      .size
      .width;
  var height = MediaQuery
      .of(context)
      .size
      .height;

  return width < height ? width / boxesCount : height / boxesCount;
}
