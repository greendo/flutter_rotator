import 'dart:math';

import 'main.dart';

class Rotor {
  final List<Rotatable> _rotors = new List(pow(boxesCount, 2));
  int _current, taps = 0;

  DateTime _then;
  Duration delta = Duration(seconds: 0), last = Duration(seconds: 0);

  void subscribe(int id, Rotatable rotor) {
    _rotors[id] = rotor;
  }

  void rotate(int id) {
    if (!_initialized()) return;
    if (_current == null) {
      _current = id;
      _rotors[id].rotate();
      _then = DateTime.now();
    }
  }

  bool _initialized() {
    bool res = true;
    _rotors.forEach((r) {
      if (r == null) {
        res = false;
      }
    });
    return res;
  }

  void stop(int id) {
    if (_current == id) {
      DateTime now = DateTime.now();
      last = _then.difference(now);
      if (taps == 0) {
        delta = last;
      } else {
        delta = (delta + last) ~/ 2;
      }
      ++taps;

      _rotors[id].stop();
      _current = null;
    }
  }
}

class Rotatable {
  void rotate() {}

  void stop() {}
}
