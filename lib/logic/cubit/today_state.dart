part of 'today_cubit.dart';

class TodayState extends Equatable {
  final String location;
  final String temp;
  final String weatherIcon;

  TodayState(
    this.location,
    this.temp,
    this.weatherIcon,
  );

  @override
  List<Object> get props => throw UnimplementedError();
}
