import 'dart:math';
import 'package:flutter/material.dart';

class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;
  Color _textColor = Color(0xFF24D876);
  String result() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getText() {
    if (_bmi >= 25) {
      return 'فوق الوزن الطبيعي';
    } else if (_bmi > 18.5) {
      return 'طبيعي';
    } else {
      return 'تحت الوزن الطبيعي';
    }
  }

  String getAdvise() {
    if (_bmi >= 25) {
      return 'وزنك أكثر من الوزن الطبيعي.\nحاول ممارسة المزيد من التمارين';
    } else if (_bmi > 18.5) {
      return 'وزنك طبيعي.\nعمل جيد!';
    } else {
      return 'وزنك أقل من الوزن الطبيعي.\nحاول أن تأكل أكثر';
    }
  }

  Color getTextColor() {
    if (_bmi >= 25 || _bmi <= 18.5) {
      return Colors.deepOrangeAccent;
    } else {
      return Color(0xFF24D876);
    }
  }
}
