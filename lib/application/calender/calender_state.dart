part of 'calender_bloc.dart';

/// Status indicating calendar lifecycle and async data fetch state.
enum CalendarStatus { initial, loading, success, failure }

/// Immutable state container for [CalenderBloc].
@freezed
abstract class CalenderState with _$CalenderState {
  const CalenderState._();

  const factory CalenderState({
    required CalendarStatus status,
    required List<CalendarDay> calendarDays,
    required Map<int, List<CalendarDay>> groupedByMonth,
    required int currentMonthIndex,
    required List<String> dayList,
    CalendarDay? selectedDay,
    String? errorMessage,
  }) = _CalenderState;

  /// Default initial state.
  factory CalenderState.init() => const CalenderState(
    status: CalendarStatus.initial,
    calendarDays: <CalendarDay>[],
    groupedByMonth: <int, List<CalendarDay>>{},
    currentMonthIndex: 0,
    dayList: AppConstants.weekdays,
    selectedDay: null,
    errorMessage: null,
  );

  /// Convenient display name for the currently active month (1-indexed).
  String get currentMonthName {
    final monthNumber = currentMonthIndex + 1;
    if (monthNumber >= 1 && monthNumber <= AppConstants.monthNames.length) {
      return AppConstants.monthNames[monthNumber - 1];
    }
    return '';
  }

  /// List of calendar days belonging to the currently active month.
  List<CalendarDay> get currentMonthDays {
    final monthNumber = currentMonthIndex + 1;
    return groupedByMonth[monthNumber] ?? const <CalendarDay>[];
  }

  /// Whether the user can navigate to the previous month.
  bool get canNavigatePrevious => currentMonthIndex > 0;

  /// Whether the user can navigate to the next month.
  bool get canNavigateNext => currentMonthIndex < 11;
}
