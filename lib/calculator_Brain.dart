import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({@required this.height, @required this.weight});
  double _bmiValue;

  String bmi() {
    _bmiValue = weight / (pow((height / 100), 2));
    print("bmi = $_bmiValue");
    return _bmiValue.toStringAsFixed(1);
  }

  String bmiCondition() {
    if (_bmiValue >= 25)
      return 'OVERWEIGHT';
    else if (_bmiValue <= 18.4)
      return 'UNDERWEIGHT';
    else
      return 'NORMAL';
  }

  String bmiAdvice() {
    if (_bmiValue >= 25)
      return 'You better stop eating';
    else if (_bmiValue <= 18.4)
      return 'You Have to eat something';
    else
      return 'You are perfect for now';
  }
}
