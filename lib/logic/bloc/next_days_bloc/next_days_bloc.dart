import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/model/weather_model.dart';
import '../../../data/repository/weather_repository.dart';

part 'next_days_event.dart';
part 'next_days_state.dart';

class NextDaysBloc extends Bloc<NextDaysEvent, NextDaysState> {
  final WeatherRepository weatherRepository;

  NextDaysBloc(this.weatherRepository) : super(NextDaysInProgress()) {
    on<NextDaysEvent>((event, emit) async {
      if (event is NextDaysRequested) {
        final data = await weatherRepository.getWeatherForLocation();
        emit(NextDaysLoadSuccess(data));
      }
    });
  }
}
