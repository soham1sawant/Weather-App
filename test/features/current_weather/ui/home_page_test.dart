import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/weather.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';
import 'package:weather_app/features/current_weather/ui/home_page.dart';
import 'package:weather_app/features/nextday_weather/bloc/nextdays_bloc.dart';
import 'package:weather_app/features/weekday/cubit/weekday_cubit.dart';

import '../../../helpers/helper.dart';

void main() {
  late CurrentBloc currentBloc;
  late NextdaysBloc nextdaysBloc;
  late WeekdayCubit weekdayCubit;
  late Weather weather;
  late WeatherModel weatherModel;

  setUp(() {
    currentBloc = MockCurrentBloc();
    nextdaysBloc = MockNextdaysBloc();
    weekdayCubit = MockWeekdayCubit();
    weather = MockWeather();
    weatherModel = MockWeatherModel();
  });

  group('HomePage widget tests', () {
    testWidgets('loads HomePage', (tester) async {
      when(() => currentBloc.state).thenReturn(const CurrentLoadInProgress());
      when(() => nextdaysBloc.state).thenReturn(NextDaysLoadInProgress());
      when(() => weekdayCubit.state).thenReturn(WeekdayLoading());

      await tester.pumpApp(
        currentBloc: currentBloc,
        nextdaysBloc: nextdaysBloc,
        weekdayCubit: weekdayCubit,
        child: const HomePage(),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('loads page with all states loading', (tester) async {
      when(() => currentBloc.state).thenReturn(const CurrentLoadInProgress());
      when(() => nextdaysBloc.state).thenReturn(NextDaysLoadInProgress());
      when(() => weekdayCubit.state).thenReturn(WeekdayLoading());

      await tester.pumpApp(
        currentBloc: currentBloc,
        nextdaysBloc: nextdaysBloc,
        weekdayCubit: weekdayCubit,
        child: const HomePage(),
      );

      expect(find.byKey(const Key('area_name_loadinprogress')), findsOneWidget);
      expect(find.byKey(const Key('current_temp_loading_indicator')),
          findsOneWidget);
      expect(find.byKey(const Key('weekday_loadinprogress')), findsNWidgets(2));
      expect(find.byKey(const Key('next_day_loadinprogress')), findsOneWidget);
    });

    testWidgets('loads page with only WeekdayCubit loaded', (tester) async {
      when(() => currentBloc.state).thenReturn(const CurrentLoadInProgress());
      when(() => nextdaysBloc.state).thenReturn(NextDaysLoadInProgress());
      when(() => weekdayCubit.state).thenReturn(
        const WeekdayLoaded(plus2Day: 'Friday', plus3Day: 'Saturday'),
      );

      await tester.pumpApp(
        currentBloc: currentBloc,
        nextdaysBloc: nextdaysBloc,
        weekdayCubit: weekdayCubit,
        child: const HomePage(),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('area_name_loadinprogress')), findsOneWidget);
      expect(find.byKey(const Key('current_temp_loading_indicator')),
          findsOneWidget);
      expect(
          find.byKey(const Key('next_day_loadinprogress')), findsNWidgets(3));
    });

    testWidgets('loads page with all states loaded', (tester) async {
      when(() => currentBloc.state)
          .thenReturn(CurrentLoadSuccess(weather: weather));
      when(() => nextdaysBloc.state).thenReturn(NextDaysLoaded(weatherModel));
      when(() => weekdayCubit.state).thenReturn(
        const WeekdayLoaded(plus2Day: 'Friday', plus3Day: 'Saturday'),
      );

      when(() => weather.areaName).thenReturn('Panaji');
      when(() => weather.weatherIcon).thenReturn('01d');

      when(() => weatherModel.daily[1].temp.day).thenReturn(29.7);
      when(() => weatherModel.daily[1].weatherV[0].icon).thenReturn('04d');

      when(() => weatherModel.daily[2].temp.day).thenReturn(29.6);
      when(() => weatherModel.daily[2].weatherV[0].icon).thenReturn('04d');

      when(() => weatherModel.daily[3].temp.day).thenReturn(30.6);
      when(() => weatherModel.daily[3].weatherV[0].icon).thenReturn('04d');

      await tester.pumpApp(
        currentBloc: currentBloc,
        nextdaysBloc: nextdaysBloc,
        weekdayCubit: weekdayCubit,
        child: const HomePage(),
      );

      expect(find.text('Panaji'), findsOneWidget);
    });

    testWidgets('loads page with all states failure', (tester) async {
      when(() => currentBloc.state).thenReturn(const CurrentLoadFailure());
      when(() => nextdaysBloc.state).thenReturn(NextDaysLoadFailure());
      when(() => weekdayCubit.state)
          .thenReturn(const WeekdayLoadingError('load error'));

      await tester.pumpApp(
        currentBloc: currentBloc,
        nextdaysBloc: nextdaysBloc,
        weekdayCubit: weekdayCubit,
        child: const HomePage(),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error), findsNWidgets(5));
    });
  });
}
