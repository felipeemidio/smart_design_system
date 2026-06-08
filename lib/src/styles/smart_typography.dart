import 'package:flutter/material.dart';

class SmartTypography {
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;

  final TextStyle subtitle1;
  final TextStyle subtitle2;

  final TextStyle body1;
  final TextStyle body2;

  final TextStyle button;
  final TextStyle label;

  const SmartTypography({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.button,
    required this.label,
  });

  factory SmartTypography.createDefault(ThemeData theme) {
    return SmartTypography(
      title1: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.4),
      title2: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, height: 1.4),
      title3: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.4),
      title4: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.4),
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2),
      subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2),
      body1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2),
      body2: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.2),
      button: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1),
      label: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1),
    );
  }
}
