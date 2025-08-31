part of 'calender_bloc.dart';

@freezed
abstract class CalenderState with _$CalenderState {
  const factory CalenderState({
    List? dayList,
    PageController? pageController,
    String? monthName,
    required List<CalenderDays> calenderDays,
  }) = _CalenderState;

  factory CalenderState.init() => CalenderState(
    calenderDays: <CalenderDays>[],
    pageController: PageController(),
    monthName: '',
    dayList: [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ],
  );
}

//for (int month = 1; month <= 12; month++) {
//   int daysInMonth = DateTime(2025, month + 1, 0).day;
//   for (int day = 1; day <= daysInMonth; day++) {
//     DateTime dt = DateTime(2025, month, day);
//     String weekday = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"][dt.weekday - 1];
//     print("$day-$month-2025, $weekday");
//   }
// }
