import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weekday/cubit/weekday_cubit.dart';
import 'package:weekdays/weekdays.dart';

class MockWeekdaysClient extends Mock implements WeekdaysClient {}

void main() {
  group('WeekdayCubit', () {
    late WeekdaysClient client;

    setUp(() {
      client = MockWeekdaysClient();
    });

    test('initial state is WeekdayLoading', () {
      expect(WeekdayCubit(client: client).state, WeekdayLoading());
    });

    blocTest<WeekdayCubit, WeekdayState>(
      'emits [WeekdayLoading, WeekdayLoaded]'
      ' when weekday loads successfully',
      setUp: () {
        when(() => client.getDays()).thenReturn(['MONDAY', 'TUESDAY']);
      },
      build: () => WeekdayCubit(client: client),
      act: (cubit) => cubit.getPlusDay(),
      expect: () => <WeekdayState>[
        WeekdayLoading(),
        const WeekdayLoaded(plus2Day: 'MONDAY', plus3Day: 'TUESDAY'),
      ],
    );

    blocTest<WeekdayCubit, WeekdayState>(
      'emits [WeekdayLoading, WeekdayLoadingError]'
      ' when weekday does not load',
      setUp: () {
        when(() => client.getDays()).thenThrow('Error');
      },
      build: () => WeekdayCubit(client: client),
      act: (cubit) => cubit.getPlusDay(),
      expect: () => <WeekdayState>[
        WeekdayLoading(),
        const WeekdayLoadingError('Error'),
      ],
    );
  });
}
