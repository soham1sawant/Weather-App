import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/home.dart';

import 'logic/cubit/today_cubit.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => TodayCubit(),
      child: Home(),
    ),
  ));
}
