part of 'current_bloc.dart';

class CurrentState extends Equatable {
  final Weather data;
  final bool error;

  const CurrentState({
    this.data,
    this.error = false,
  });

  @override
  List<Object> get props => [data, error];
}
