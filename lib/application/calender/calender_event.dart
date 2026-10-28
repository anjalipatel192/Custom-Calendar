part of 'calender_bloc.dart';

/// Events handled by [CalenderBloc].
@freezed
abstract class CalenderEvent with _$CalenderEvent {
  /// Initializes the calendar by loading days from the repository.
  const factory CalenderEvent.init() = _InitEvent;

  /// Triggered when the user swipes or navigates to a new month index.
  const factory CalenderEvent.monthChanged(int monthIndex) = _MonthChanged;

  /// Triggered when a specific calendar day tile is selected/tapped.
  const factory CalenderEvent.daySelected(CalendarDay day) = _DaySelected;

  /// Triggered to advance to the next month.
  const factory CalenderEvent.nextMonth() = _NextMonth;

  /// Triggered to retreat to the previous month.
  const factory CalenderEvent.previousMonth() = _PreviousMonth;
}
