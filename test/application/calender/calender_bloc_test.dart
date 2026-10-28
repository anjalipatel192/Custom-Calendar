import 'package:custom_calender/application/calender/calender_bloc.dart';
import 'package:custom_calender/domain/entities/calendar_day.dart';
import 'package:custom_calender/domain/repositories/calendar_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCalendarRepository implements CalendarRepository {
  final List<CalendarDay>? days;
  final bool shouldThrow;

  MockCalendarRepository({this.days, this.shouldThrow = false});

  @override
  Future<List<CalendarDay>> getCalendarDays() async {
    if (shouldThrow) {
      throw Exception('Database/asset error');
    }
    return days ??
        const [
          CalendarDay(date: 1, day: 'Wednesday', month: 1),
          CalendarDay(date: 2, day: 'Thursday', month: 1),
          CalendarDay(date: 1, day: 'Saturday', month: 2),
        ];
  }
}

void main() {
  group('CalenderBloc', () {
    test('initial state has CalendarStatus.initial', () {
      final repository = MockCalendarRepository();
      final bloc = CalenderBloc(repository);

      expect(bloc.state.status, CalendarStatus.initial);
      expect(bloc.state.currentMonthIndex, 0);
      expect(bloc.state.calendarDays, isEmpty);
      bloc.close();
    });

    test('init event successfully loads and groups days by month', () async {
      final repository = MockCalendarRepository();
      final bloc = CalenderBloc(repository);

      bloc.add(const CalenderEvent.init());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          predicate<CalenderState>((s) => s.status == CalendarStatus.loading),
          predicate<CalenderState>(
            (s) =>
                s.status == CalendarStatus.success &&
                s.calendarDays.length == 3 &&
                s.groupedByMonth[1]?.length == 2 &&
                s.groupedByMonth[2]?.length == 1 &&
                s.selectedDay?.date == 1,
          ),
        ]),
      );

      expect(bloc.state.currentMonthName, 'January');
      await bloc.close();
    });

    test('monthChanged event updates currentMonthIndex', () async {
      final repository = MockCalendarRepository();
      final bloc = CalenderBloc(repository);

      bloc.add(const CalenderEvent.monthChanged(4)); // May (0-indexed 4)

      await expectLater(
        bloc.stream,
        emits(
          predicate<CalenderState>(
            (s) => s.currentMonthIndex == 4 && s.currentMonthName == 'May',
          ),
        ),
      );

      await bloc.close();
    });

    test('daySelected event updates selectedDay', () async {
      final repository = MockCalendarRepository();
      final bloc = CalenderBloc(repository);
      const newDay = CalendarDay(date: 15, day: 'Wednesday', month: 1);

      bloc.add(const CalenderEvent.daySelected(newDay));

      await expectLater(
        bloc.stream,
        emits(predicate<CalenderState>((s) => s.selectedDay == newDay)),
      );

      await bloc.close();
    });

    test('nextMonth and previousMonth step through months safely', () async {
      final repository = MockCalendarRepository();
      final bloc = CalenderBloc(repository);

      bloc.add(const CalenderEvent.nextMonth());
      await expectLater(
        bloc.stream,
        emits(predicate<CalenderState>((s) => s.currentMonthIndex == 1)),
      );

      bloc.add(const CalenderEvent.previousMonth());
      await expectLater(
        bloc.stream,
        emits(predicate<CalenderState>((s) => s.currentMonthIndex == 0)),
      );

      // Boundary check: cannot go previous from 0
      bloc.add(const CalenderEvent.previousMonth());
      // No new state should be emitted because canNavigatePrevious is false
      expect(bloc.state.currentMonthIndex, 0);

      await bloc.close();
    });

    test('emits CalendarStatus.failure on repository error', () async {
      final repository = MockCalendarRepository(shouldThrow: true);
      final bloc = CalenderBloc(repository);

      bloc.add(const CalenderEvent.init());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          predicate<CalenderState>((s) => s.status == CalendarStatus.loading),
          predicate<CalenderState>(
            (s) =>
                s.status == CalendarStatus.failure &&
                s.errorMessage != null &&
                s.errorMessage!.contains('Database/asset error'),
          ),
        ]),
      );

      await bloc.close();
    });
  });
}
