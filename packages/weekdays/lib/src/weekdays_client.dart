import 'dart:core';

class WeekdaysClient {
  List<String> getDays() {
    DateTime date = DateTime.now();

    List<String> days = ['', ''];

    if ((date.weekday) == 1) {
      days[0] = "WEDNESDAY";
      days[1] = "THURSDAY";
    } else if ((date.weekday) == 2) {
      days[0] = "THURSDAY";
      days[1] = "FRIDAY";
    } else if ((date.weekday) == 3) {
      days[0] = "FRIDAY";
      days[1] = "SATURDAY";
    } else if ((date.weekday) == 4) {
      days[0] = "SATURDAY";
      days[1] = "SUNDAY";
    } else if ((date.weekday) == 5) {
      days[0] = "SUNDAY";
      days[1] = "MONDAY";
    } else if ((date.weekday) == 6) {
      days[0] = "MONDAY";
      days[1] = "TUESDAY";
    } else if ((date.weekday) == 7) {
      days[0] = "TUESDAY";
      days[1] = "WEDNESDAY";
    }

    return days;
  }
}
