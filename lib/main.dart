import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/logic/bloc/current_bloc.dart';
import 'package:weather_app/logic/simple_bloc_observer.dart';
import 'package:weather_app/presentation/screens/home.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  
  final WeatherRepository weatherRepository = WeatherRepository();

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({Key key, @required this.weatherRepository}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentBloc(weatherRepository)..add(CurrentRequested()),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
