import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OVERWEIGHT';
    else if (_bmi >= 18)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String getDescription() {
    if (_bmi >= 25)
      return 'You should eat less.';
    else if (_bmi >= 18)
      return 'You are fine.';
    else
      return 'You stay fit.';
  }
}
