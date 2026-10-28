import 'package:custom_calender/domain/entities/calendar_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalendarDay Entity', () {
    test('calculates correct weekdayIndex for all days', () {
      const mon = CalendarDay(date: 6, day: 'Monday', month: 1);
      const tue = CalendarDay(date: 7, day: 'Tuesday', month: 1);
      const wed = CalendarDay(date: 1, day: 'Wednesday', month: 1);
      const thu = CalendarDay(date: 2, day: 'Thursday', month: 1);
      const fri = CalendarDay(date: 3, day: 'Friday', month: 1);
      const sat = CalendarDay(date: 4, day: 'Saturday', month: 1);
      const sun = CalendarDay(date: 5, day: 'Sunday', month: 1);

      expect(mon.weekdayIndex, 0);
      expect(tue.weekdayIndex, 1);
      expect(wed.weekdayIndex, 2);
      expect(thu.weekdayIndex, 3);
      expect(fri.weekdayIndex, 4);
      expect(sat.weekdayIndex, 5);
      expect(sun.weekdayIndex, 6);
    });

    test('correctly identifies weekend vs weekday', () {
      const fri = CalendarDay(date: 3, day: 'Friday', month: 1);
      const sat = CalendarDay(date: 4, day: 'Saturday', month: 1);
      const sun = CalendarDay(date: 5, day: 'Sunday', month: 1);

      expect(fri.isWeekend, isFalse);
      expect(sat.isWeekend, isTrue);
      expect(sun.isWeekend, isTrue);
    });

    test('returns correct 3-letter abbreviated uppercase day name', () {
      const wed = CalendarDay(date: 1, day: 'Wednesday', month: 1);
      expect(wed.shortDayName, 'WED');
    });

    test('implements value equality and hash code properly', () {
      const day1 = CalendarDay(
        date: 15,
        day: 'Wednesday',
        month: 1,
        year: 2025,
      );
      const day2 = CalendarDay(
        date: 15,
        day: 'Wednesday',
        month: 1,
        year: 2025,
      );
      const day3 = CalendarDay(date: 16, day: 'Thursday', month: 1, year: 2025);

      expect(day1, equals(day2));
      expect(day1.hashCode, equals(day2.hashCode));
      expect(day1, isNot(equals(day3)));
    });
  });
}
