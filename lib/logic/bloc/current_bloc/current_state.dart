part of 'current_bloc.dart';

class CurrentState extends Equatable {
  const CurrentState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherInProgress extends CurrentState {}

class CurrentWeatherLoadSuccess extends CurrentState {
  final Weather weather;

  const CurrentWeatherLoadSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

class CurrentWeatherLoadFailure extends CurrentState {}
