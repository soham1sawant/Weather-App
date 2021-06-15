import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/logic/bloc/current_bloc.dart';
import 'package:weather_app/presentation/screens/home.dart';

void main() {
  final WeatherRepository weatherRepository = WeatherRepository();

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({Key key, @required this.weatherRepository}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentBloc(weatherRepository),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
