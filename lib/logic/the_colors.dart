import 'package:flutter/material.dart';

class TheColors {
  Color backgroundColor;
  Color textColor;

  TheColors({
    this.backgroundColor,
    this.textColor,
  });

  factory TheColors.getColors() {
    Color background;
    Color text;

    DateTime date = DateTime.now();
    if ((date.hour >= 6) && (date.hour <= 18)) {
      background = Color(0xfff1f23f);
      text = Colors.black;
    } else if ((date.hour >= 18) || (date.hour <= 6)) {
      background = Color(0xff1f1e30);
      text = Colors.white;
    }

    return TheColors(
      backgroundColor: background,
      textColor: text,
    );
  }
}
