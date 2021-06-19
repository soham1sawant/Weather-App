class WeekDay {
  String dayplus2;
  String dayplus3;

  WeekDay({
    this.dayplus2,
    this.dayplus3,
  });

  factory WeekDay.getDays() {
    String plus2;
    String plus3;

    DateTime date = DateTime.now();
    if ((date.weekday) == 1) {
      plus2 = "WEDNESDAY";
      plus3 = "THURSDAY";
    } else if ((date.weekday) == 2) {
      plus2 = "THURSDAY";
      plus3 = "FRIDAY";
    } else if ((date.weekday) == 3) {
      plus2 = "FRIDAY";
      plus3 = "SATURDAY";
    } else if ((date.weekday) == 4) {
      plus2 = "SATURDAY";
      plus3 = "SUNDAY";
    } else if ((date.weekday) == 5) {
      plus2 = "SUNDAY";
      plus3 = "MONDAY";
    } else if ((date.weekday) == 6) {
      plus2 = "MONDAY";
      plus3 = "TUESDAY";
    } else if ((date.weekday) == 7) {
      plus2 = "TUESDAY";
      plus3 = "WEDNESDAY";
    }

    return WeekDay(
      dayplus2: plus2,
      dayplus3: plus3,
    );
  }
}
