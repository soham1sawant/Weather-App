part of 'weekday_cubit.dart';

abstract class WeekdayState extends Equatable {
  const WeekdayState();

  @override
  List<Object> get props => [];
}

class WeekdayLoading extends WeekdayState {}

class WeekdayLoaded extends WeekdayState {
  final String plus2Day;
  final String plus3Day;

  const WeekdayLoaded({required this.plus2Day, required this.plus3Day});

  @override
  List<Object> get props => [plus2Day, plus3Day];
}

class WeekdayLoadingError extends WeekdayState {
  final String error;

  const WeekdayLoadingError(this.error);

   @override
  List<Object> get props => [error];
}
