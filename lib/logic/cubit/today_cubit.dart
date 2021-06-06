import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather/weather.dart';

part 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit() : super(TodayState("", "", ""));

  void getCurrentData() async {
    WeatherRepository _weatherRepository;
    Weather w = await _weatherRepository.getCurrentDayWeather();
    emit(TodayState(w.areaName, w.temperature.celsius.toString() + ' °C', w.weatherIcon));
  }
}
