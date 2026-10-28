import '../entities/calendar_day.dart';

/// Abstract contract for calendar data retrieval.
///
/// Follows Clean Architecture by decoupling business logic from underlying
/// data sources (e.g., local assets, remote API, or SQLite database).
abstract class CalendarRepository {
  /// Retrieves all calendar days for the configured year/dataset.
  Future<List<CalendarDay>> getCalendarDays();
}
