import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rotator/main.dart';
import 'package:rotator/rotator.dart';
import 'package:provider/provider.dart';

class Box extends StatefulWidget {
  final int id;

  Box({Key key, @required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxState();
}

class _BoxState extends State<Box>
    with SingleTickerProviderStateMixin
    implements Rotatable {
  int _id;
  Container _container;
  MaterialColor _color = Colors.brown;
  AnimationController _controller;
  Animation<double> _animation;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    _id = widget.id;
    var size = _size(context);
    Rotor r = Provider.of<Rotor>(context);
    r.subscribe(_id, this);

    _container = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: Border.all(), color: _color),
    );

    return GestureDetector(
      child: Transform.rotate(angle: _angle, child: _container),
      onTap: () {
        r.stop(_id);
      },
    );
  }

  @override
  void rotate() {
    _color = Colors.cyan;
    _controller.forward();
  }

  @override
  void stop() {
    setState(() {
      _controller.stop();
      _color = Colors.brown;
      _angle = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animation = Tween<double>(begin: 0, end: 45).animate(_controller)
      ..addListener(() {
        setState(() {
          _angle = _animation.value;
          // The state that has changed here is the animation object’s value.
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
//    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

double _size(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  return width < height ? width / boxesCount : height / boxesCount;
}
