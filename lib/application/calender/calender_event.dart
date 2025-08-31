part of 'calender_bloc.dart';

@freezed
abstract class CalenderEvent with _$CalenderEvent {
  const factory CalenderEvent.init() = InitEvent;
  const factory CalenderEvent.nextPage() = NextPage;
  const factory CalenderEvent.previousPage() = PreviousPage;
  const factory CalenderEvent.monthlyData({String? monthName}) = MonthlyData;
}
