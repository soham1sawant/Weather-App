import 'package:flutter/material.dart';

class TheColors {
  Color backgroundColor;
  Color textColor;

  TheColors({
    required this.backgroundColor,
    required this.textColor,
  });

  factory TheColors.getColors() {
    late Color background;
    late Color text;

    DateTime date = DateTime.now();
    if ((date.hour >= 6) && (date.hour <= 18)) {
      background = const Color(0xfff1f23f);
      text = Colors.black;
    } else if ((date.hour >= 18) || (date.hour <= 6)) {
      background = const Color(0xff1f1e30);
      text = Colors.white;
    }

    return TheColors(
      backgroundColor: background,
      textColor: text,
    );
  }
}
