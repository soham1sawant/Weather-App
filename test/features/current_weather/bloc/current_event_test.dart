import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';

void main() {
  group('CurrentEvent', () {
    test('supports value comparison', () {
      expect(const CurrentEvent(), const CurrentEvent());
    });
  });
}
