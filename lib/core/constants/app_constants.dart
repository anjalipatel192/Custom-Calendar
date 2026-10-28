/// Application-wide constants for calendar formatting, assets, and styling.
class AppConstants {
  const AppConstants._();

  /// Default asset path for the 2025 calendar dataset.
  static const String calendar2025AssetPath = 'assets/calendar_2025.json';

  /// List of 7 standard weekday names starting with Monday.
  static const List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  /// List of 12 standard calendar month names.
  static const List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Standard page transition animation duration.
  static const Duration pageTransitionDuration = Duration(milliseconds: 350);
}
