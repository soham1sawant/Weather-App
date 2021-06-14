import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather/weather.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  CurrentBloc() : super(CurrentState());

  WeatherRepository weatherRepository;

  @override
  Stream<CurrentState> mapEventToState(CurrentEvent event) async* {
    if (event is CurrentFetched) {
      try {
        final data = await weatherRepository.getCurrentDayWeather();
        yield CurrentState(data: data);
      } catch (error) {
        yield CurrentState(error: true);
      }
    }
  }
}
