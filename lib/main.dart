import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
  ));
}
  