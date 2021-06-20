import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repository/weather_repository.dart';
import 'package:weather/weather.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  final WeatherRepository weatherRepository;

  CurrentBloc(this.weatherRepository) : super(CurrentWeatherInProgress());

  @override
  Stream<CurrentState> mapEventToState(CurrentEvent event) async* {
    if (event is CurrentRequested) {
      final data = await weatherRepository.getCurrentDayWeather();
      yield CurrentWeatherLoadSuccess(data);
    }
  }
}
