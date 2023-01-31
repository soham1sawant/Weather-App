part of 'current_bloc.dart';

class CurrentState extends Equatable {
  const CurrentState();

  @override
  List<Object> get props => [];
}

class CurrentLoadInProgress extends CurrentState {
  const CurrentLoadInProgress();

  @override
  List<Object> get props => [];
}

class CurrentLoadSuccess extends CurrentState {
  const CurrentLoadSuccess({required this.weather});

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class CurrentLoadFailure extends CurrentState {
  const CurrentLoadFailure();

  @override
  List<Object> get props => [];
}
