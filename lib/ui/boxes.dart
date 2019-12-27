import 'dart:math';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rotator/ui/box.dart';
import 'package:rotator/utils/notifier.dart';
import 'package:rotator/utils/rotator.dart';

import '../main.dart';

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

    ScoreNotifier sn = Provider.of<ScoreNotifier>(context);
    Rotor r = sn.rotor;

    Timer.periodic(Duration(seconds: minDuration + _random.nextInt(maxDuration)), (timer) {
      int id = _random.nextInt(pow(boxesCount, 2));
      r.rotate(id);
    });

    return gridView;
  }
}
