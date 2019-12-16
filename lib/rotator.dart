import 'dart:math';

import 'main.dart';

class Rotor {
  final List<Rotatable> _rotors = new List(pow(boxesCount, 2));
  int _current;

  void subscribe(int id, Rotatable rotor) {
    _rotors[id] = rotor;
  }

  void rotate(int id) {
    if (_current == null) {
      _current = id;
      _rotors[id].rotate();
    }
  }

  void stop(int id) {
    if (_current == id) {
      _rotors[id].stop();
      _current = null;
    }
  }
}

class Rotatable {
  void rotate() {}
  void stop() {}
}