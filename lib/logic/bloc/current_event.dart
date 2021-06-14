part of 'current_bloc.dart';

abstract class CurrentEvent extends Equatable {
  const CurrentEvent();

  @override
  List<Object> get props => [];
}

class CurrentFetched extends CurrentEvent {}