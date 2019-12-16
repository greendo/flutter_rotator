import 'dart:math';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rotator/box.dart';
import 'package:rotator/rotator.dart';

import 'main.dart';

class Boxes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    Widget gridView = GridView.count(
        crossAxisCount: boxesCount,
        children: List.generate(pow(boxesCount, 2), (index) {
          return Box(id: index);
        }));

    Rotor r = Provider.of<Rotor>(context);

    Timer.periodic(Duration(seconds: _random.nextInt(10)), (timer) {
      int id = _random.nextInt(pow(boxesCount, 2));
      r.rotate(id);
    });

    return gridView;
  }
}
