import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_api/weather_api.dart';

part 'nextdays_event.dart';
part 'nextdays_state.dart';

class NextdaysBloc extends Bloc<NextdaysEvent, NextdaysState> {
  NextdaysBloc({required this.client}) : super(NextDaysLoadInProgress()) {
    on<NextdaysEvent>((event, emit) async {
      if (event is NextDayWeatherRequested) {
        emit(NextDaysLoadInProgress());

        try {
          final weather = await client.getAllWeather();
          emit(NextDaysLoaded(weather));
        } catch (e) {
          emit(NextDaysLoadFailure());
        }
      }
    });
  }

  final WeatherApiClient client;
}
