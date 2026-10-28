import '../entities/calendar_day.dart';

/// Data transfer model for calendar day items serialized from JSON.
///
/// Implements [CalendarDay] domain entity with robust JSON parsing.
class CalendarDayModel extends CalendarDay {
  const CalendarDayModel({
    required super.date,
    required super.day,
    required super.month,
    super.year = 2025,
  });

  /// Factory constructor to deserialize a [CalendarDayModel] from a JSON map.
  factory CalendarDayModel.fromJson(Map<String, dynamic> json) {
    return CalendarDayModel(
      date: json['date'] as int? ?? 1,
      day: json['day'] as String? ?? 'Monday',
      month: json['month'] as int? ?? 1,
      year: json['year'] as int? ?? 2025,
    );
  }

  /// Serializes the model into a standard JSON map.
  Map<String, dynamic> toJson() {
    return {'date': date, 'day': day, 'month': month, 'year': year};
  }
}

/// Backwards compatibility alias for legacy references.
typedef CalenderDays = CalendarDayModel;
