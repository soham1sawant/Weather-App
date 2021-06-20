part of 'next_days_bloc.dart';

abstract class NextDaysState extends Equatable {
  const NextDaysState();

  @override
  List<Object> get props => [];
}

class NextDaysInProgress extends NextDaysState {}

class NextDaysLoadSuccess extends NextDaysState {
  final WeatherModel weather;

  NextDaysLoadSuccess(this.weather);

   @override
  List<Object> get props => [weather];
}

class NextDaysLoadFailure extends NextDaysState {}
