import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  late Stream colorStream;
  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.blueGrey,
      Colors.amber,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.teal
    ];
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % 5;
      return colors[index];
    });
  }

}
