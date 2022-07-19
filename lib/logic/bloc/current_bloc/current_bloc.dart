
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import '../../../data/repository/weather_repository.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  final WeatherRepository weatherRepository;

  CurrentBloc(this.weatherRepository) : super(CurrentWeatherInProgress()) {
    on<CurrentEvent>((event, emit) async {
      if (event is CurrentRequested) {
      final data = await weatherRepository.getCurrentDayWeather();
      emit(CurrentWeatherLoadSuccess(data));
    }
    });
  }
}
