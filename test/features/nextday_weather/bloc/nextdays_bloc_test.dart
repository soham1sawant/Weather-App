import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_app/features/nextday_weather/bloc/nextdays_bloc.dart';

import '../../../helpers/helper.dart';

void main() {
  group('NextdaysBloc', () {
    late WeatherApiClient client;
    late WeatherModel weather;

    setUp(() {
      client = MockWeatherApiClient();
      weather = MockWeatherModel();
    });

    test('initial state is NextDaysLoadInProgress', () {
      expect(NextdaysBloc(client: client).state, NextDaysLoadInProgress());
    });

    blocTest<NextdaysBloc, NextdaysState>(
      'emits [NextDaysLoadInProgress, NextDaysLoaded]'
      ' when current weather loads successfully',
      setUp: () {
        when(client.getAllWeather).thenAnswer((_) async => weather);
      },
      build: () => NextdaysBloc(client: client),
      act: (bloc) => bloc.add(NextDayWeatherRequested()),
      expect: () => <NextdaysState>[
        NextDaysLoadInProgress(),
        NextDaysLoaded(weather),
      ],
    );

    blocTest<NextdaysBloc, NextdaysState>(
      'emits [NextDaysLoadInProgress, NextDaysLoadFailure]'
      ' when current weather does not load',
      setUp: () {
        when(client.getAllWeather).thenThrow('Error');
      },
      build: () => NextdaysBloc(client: client),
      act: (bloc) => bloc.add(NextDayWeatherRequested()),
      expect: () => <NextdaysState>[
        NextDaysLoadInProgress(),
        NextDaysLoadFailure(),
      ],
    );
  });
}
