import 'package:flutter/foundation.dart';
import 'package:rotator/utils/rotator.dart';

class ScoreNotifier extends ChangeNotifier {
  Rotor rotor;

  ScoreNotifier(this.rotor);

  void notify() {
    notifyListeners();
  }
}