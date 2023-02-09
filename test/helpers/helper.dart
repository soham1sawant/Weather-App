import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/weather.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';
import 'package:weather_app/features/nextday_weather/bloc/nextdays_bloc.dart';
import 'package:weather_app/features/weekday/cubit/weekday_cubit.dart';
import 'package:weekdays/weekdays.dart';

class MockCurrentBloc extends MockBloc<CurrentEvent, CurrentState>
    implements CurrentBloc {}

class MockNextdaysBloc extends MockBloc<NextdaysEvent, NextdaysState>
    implements NextdaysBloc {}

class MockWeekdayCubit extends MockCubit<WeekdayState>
    implements WeekdayCubit {}

class MockWeatherApiClient extends Mock implements WeatherApiClient {}

class MockWeekdaysClient extends Mock implements WeekdaysClient {}

class MockWeather extends Mock implements Weather {}

class MockWeatherModel extends Mock implements WeatherModel {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp({
    CurrentBloc? currentBloc,
    NextdaysBloc? nextdaysBloc,
    WeekdayCubit? weekdayCubit,
    required Widget child,
  }) {
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            currentBloc != null
                ? BlocProvider.value(value: currentBloc)
                : BlocProvider(create: (_) => MockCurrentBloc()),
            nextdaysBloc != null
                ? BlocProvider.value(value: nextdaysBloc)
                : BlocProvider(create: (_) => MockNextdaysBloc()),
            weekdayCubit != null
                ? BlocProvider.value(value: weekdayCubit)
                : BlocProvider(create: (_) => MockWeekdayCubit()),
          ],
          child: child,
        ),
      ),
    );
  }
}
