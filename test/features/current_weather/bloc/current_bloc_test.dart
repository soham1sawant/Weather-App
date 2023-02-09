
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/weather.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';

import '../../../helpers/helper.dart';


void main() {
  group('CurrentBloc', () {
    late WeatherApiClient weatherApiClient;
    late Weather weather;

    setUp(() async {
      weatherApiClient = MockWeatherApiClient();
      weather = MockWeather();
    });

    test('Initial state is CurrentLoadInProgress', () {
      expect(
          CurrentBloc(weatherApiClient).state, const CurrentLoadInProgress());
    });

    blocTest<CurrentBloc, CurrentState>(
      'emits [CurrentLoadInProgress, CurrentLoadSuccess]'
      ' when current weather loads successfully',
      setUp: () {
        when(weatherApiClient.getCurrentWeather)
            .thenAnswer((_) async => weather);
      },
      build: () => CurrentBloc(weatherApiClient),
      act: (bloc) => bloc.add(const CurrentWeatherRequested()),
      expect: () => <CurrentState>[
        const CurrentLoadInProgress(),
        CurrentLoadSuccess(weather: weather),
      ],
    );

    blocTest<CurrentBloc, CurrentState>(
      'emits [CurrentLoadInProgress, CurrentLoadFailure]'
      ' when current weather does not load',
      setUp: () {
        when(weatherApiClient.getCurrentWeather)
            .thenThrow(Exception('Error'));
      },
      build: () => CurrentBloc(weatherApiClient),
      act: (bloc) => bloc.add(const CurrentWeatherRequested()),
      expect: () => <CurrentState>[const CurrentLoadInProgress(), const CurrentLoadFailure()],
    );
  });
}
