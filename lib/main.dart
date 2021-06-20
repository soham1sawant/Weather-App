import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/logic/bloc/current_bloc/current_bloc.dart';
import 'package:weather_app/logic/bloc/next_days_bloc/next_days_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentBloc>(
            create: (context) =>
                CurrentBloc(weatherRepository)..add(CurrentRequested())),
        BlocProvider<NextDaysBloc>(
            create: (context) =>
                NextDaysBloc(weatherRepository)..add(NextDaysRequested())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
