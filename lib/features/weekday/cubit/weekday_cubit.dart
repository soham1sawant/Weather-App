import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weekdays/weekdays.dart';

part 'weekday_state.dart';

class WeekdayCubit extends Cubit<WeekdayState> {
  WeekdayCubit({required this.client}) : super(WeekdayLoading());

  final WeekdaysClient client;

  void getPlusDay() {
    emit(WeekdayLoading());

    try {
      final days = client.getDays();
      emit(WeekdayLoaded(plus2Day: days[0], plus3Day: days[1]));
    } catch (e) {
      emit(WeekdayLoadingError(e.toString()));
    }
  }
}
