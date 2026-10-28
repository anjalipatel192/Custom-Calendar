import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/calendar_day.dart';
import '../../domain/repositories/calendar_repository.dart';

part 'calender_bloc.freezed.dart';
part 'calender_event.dart';
part 'calender_state.dart';

/// Business Logic Component managing calendar state and user interactions.
///
/// Handles asynchronous data fetching via [CalendarRepository], month pagination,
/// and day tile selection without holding any widget or controller references.
@injectable
class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  final CalendarRepository _calendarRepository;

  CalenderBloc(this._calendarRepository) : super(CalenderState.init()) {
    on<_InitEvent>(_onInit);
    on<_MonthChanged>(_onMonthChanged);
    on<_DaySelected>(_onDaySelected);
    on<_NextMonth>(_onNextMonth);
    on<_PreviousMonth>(_onPreviousMonth);
  }

  Future<void> _onInit(_InitEvent event, Emitter<CalenderState> emit) async {
    emit(state.copyWith(status: CalendarStatus.loading, errorMessage: null));
    try {
      final days = await _calendarRepository.getCalendarDays();

      // Pre-group days by month and sort them by date ascending
      final Map<int, List<CalendarDay>> grouped = {};
      for (final day in days) {
        grouped.putIfAbsent(day.month, () => <CalendarDay>[]).add(day);
      }

      for (final entry in grouped.entries) {
        entry.value.sort((a, b) => a.date.compareTo(b.date));
      }

      final CalendarDay? initialSelected = days.isNotEmpty ? days.first : null;

      emit(
        state.copyWith(
          status: CalendarStatus.success,
          calendarDays: days,
          groupedByMonth: grouped,
          currentMonthIndex: 0,
          selectedDay: initialSelected,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CalendarStatus.failure,
          errorMessage: 'Failed to load calendar: ${e.toString()}',
        ),
      );
    }
  }

  void _onMonthChanged(_MonthChanged event, Emitter<CalenderState> emit) {
    if (event.monthIndex >= 0 && event.monthIndex < 12) {
      emit(state.copyWith(currentMonthIndex: event.monthIndex));
    }
  }

  void _onDaySelected(_DaySelected event, Emitter<CalenderState> emit) {
    emit(state.copyWith(selectedDay: event.day));
  }

  void _onNextMonth(_NextMonth event, Emitter<CalenderState> emit) {
    if (state.canNavigateNext) {
      emit(state.copyWith(currentMonthIndex: state.currentMonthIndex + 1));
    }
  }

  void _onPreviousMonth(_PreviousMonth event, Emitter<CalenderState> emit) {
    if (state.canNavigatePrevious) {
      emit(state.copyWith(currentMonthIndex: state.currentMonthIndex - 1));
    }
  }
}
