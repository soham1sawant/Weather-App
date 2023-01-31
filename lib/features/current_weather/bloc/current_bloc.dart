import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:weather_api/weather_api.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  CurrentBloc(this._weatherApiClient) : super(const CurrentLoadInProgress()) {
    on<CurrentEvent>((event, emit) async {
      if (event is CurrentWeatherRequested) {
        emit(const CurrentLoadInProgress());

        try {
          final currentWeather = await _weatherApiClient.getCurrentWeather();
          emit(CurrentLoadSuccess(weather: currentWeather));
        } catch (e) {
          emit(const CurrentLoadFailure());
        }
      }
    });
  }

  final WeatherApiClient _weatherApiClient;
}
