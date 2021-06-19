part of 'next_days_bloc.dart';

abstract class NextDaysEvent extends Equatable {
  const NextDaysEvent();

  @override
  List<Object> get props => [];
}

class NextDaysRequested extends NextDaysEvent {}