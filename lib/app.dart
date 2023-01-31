import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weekdays/weekdays.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeekdaysClient>(
          create: (context) => WeekdaysClient(),
        ),
        RepositoryProvider<WeatherApiClient>(
          create: (context) => WeatherApiClient(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [],
        child: MaterialApp(),
      ),
    );
  }
}
