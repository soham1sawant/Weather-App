part of 'nextdays_bloc.dart';

abstract class NextdaysState extends Equatable {
  const NextdaysState();

  @override
  List<Object> get props => [];
}

class NextDaysLoadInProgress extends NextdaysState {}

class NextDaysLoaded extends NextdaysState {
  final WeatherModel weather;

  const NextDaysLoaded(this.weather);

   @override
  List<Object> get props => [weather];
}

class NextDaysLoadFailure extends NextdaysState {}
