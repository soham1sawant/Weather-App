import 'dart:io';

import 'package:weekdays/weekdays.dart';

void main() async {
  final weekDays = WeekdaysClient();

  try {
    final days = weekDays.getDays();

    print(days[0]);
    print(days[1]);

  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
