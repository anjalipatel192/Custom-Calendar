/// Pure domain entity representing a calendar day.
///
/// Contains day, date number, month, and computed properties such as
/// [weekdayIndex] and [isWeekend].
class CalendarDay {
  /// The day of the month (1-31).
  final int date;

  /// Full weekday name (e.g. 'Monday', 'Tuesday').
  final String day;

  /// The month index (1-12).
  final int month;

  /// The calendar year (defaults to 2025).
  final int year;

  const CalendarDay({
    required this.date,
    required this.day,
    required this.month,
    this.year = 2025,
  });

  /// Zero-based weekday index (Monday = 0 ... Sunday = 6).
  int get weekdayIndex {
    switch (day.toLowerCase()) {
      case 'monday':
        return 0;
      case 'tuesday':
        return 1;
      case 'wednesday':
        return 2;
      case 'thursday':
        return 3;
      case 'friday':
        return 4;
      case 'saturday':
        return 5;
      case 'sunday':
        return 6;
      default:
        return 0;
    }
  }

  /// Whether this day falls on Saturday or Sunday.
  bool get isWeekend => weekdayIndex == 5 || weekdayIndex == 6;

  /// Three-letter abbreviated weekday string (e.g. 'MON').
  String get shortDayName =>
      day.length >= 3 ? day.substring(0, 3).toUpperCase() : day.toUpperCase();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDay &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          day == other.day &&
          month == other.month &&
          year == other.year;

  @override
  int get hashCode => Object.hash(date, day, month, year);

  @override
  String toString() =>
      'CalendarDay(date: $date, day: $day, month: $month, year: $year)';
}
