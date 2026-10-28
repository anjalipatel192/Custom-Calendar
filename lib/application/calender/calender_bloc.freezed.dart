// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalenderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalenderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalenderEvent()';
}


}

/// @nodoc
class $CalenderEventCopyWith<$Res>  {
$CalenderEventCopyWith(CalenderEvent _, $Res Function(CalenderEvent) __);
}


/// Adds pattern-matching-related methods to [CalenderEvent].
extension CalenderEventPatterns on CalenderEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitEvent value)?  init,TResult Function( _MonthChanged value)?  monthChanged,TResult Function( _DaySelected value)?  daySelected,TResult Function( _NextMonth value)?  nextMonth,TResult Function( _PreviousMonth value)?  previousMonth,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init(_that);case _MonthChanged() when monthChanged != null:
return monthChanged(_that);case _DaySelected() when daySelected != null:
return daySelected(_that);case _NextMonth() when nextMonth != null:
return nextMonth(_that);case _PreviousMonth() when previousMonth != null:
return previousMonth(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitEvent value)  init,required TResult Function( _MonthChanged value)  monthChanged,required TResult Function( _DaySelected value)  daySelected,required TResult Function( _NextMonth value)  nextMonth,required TResult Function( _PreviousMonth value)  previousMonth,}){
final _that = this;
switch (_that) {
case _InitEvent():
return init(_that);case _MonthChanged():
return monthChanged(_that);case _DaySelected():
return daySelected(_that);case _NextMonth():
return nextMonth(_that);case _PreviousMonth():
return previousMonth(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitEvent value)?  init,TResult? Function( _MonthChanged value)?  monthChanged,TResult? Function( _DaySelected value)?  daySelected,TResult? Function( _NextMonth value)?  nextMonth,TResult? Function( _PreviousMonth value)?  previousMonth,}){
final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init(_that);case _MonthChanged() when monthChanged != null:
return monthChanged(_that);case _DaySelected() when daySelected != null:
return daySelected(_that);case _NextMonth() when nextMonth != null:
return nextMonth(_that);case _PreviousMonth() when previousMonth != null:
return previousMonth(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( int monthIndex)?  monthChanged,TResult Function( CalendarDay day)?  daySelected,TResult Function()?  nextMonth,TResult Function()?  previousMonth,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init();case _MonthChanged() when monthChanged != null:
return monthChanged(_that.monthIndex);case _DaySelected() when daySelected != null:
return daySelected(_that.day);case _NextMonth() when nextMonth != null:
return nextMonth();case _PreviousMonth() when previousMonth != null:
return previousMonth();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( int monthIndex)  monthChanged,required TResult Function( CalendarDay day)  daySelected,required TResult Function()  nextMonth,required TResult Function()  previousMonth,}) {final _that = this;
switch (_that) {
case _InitEvent():
return init();case _MonthChanged():
return monthChanged(_that.monthIndex);case _DaySelected():
return daySelected(_that.day);case _NextMonth():
return nextMonth();case _PreviousMonth():
return previousMonth();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( int monthIndex)?  monthChanged,TResult? Function( CalendarDay day)?  daySelected,TResult? Function()?  nextMonth,TResult? Function()?  previousMonth,}) {final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init();case _MonthChanged() when monthChanged != null:
return monthChanged(_that.monthIndex);case _DaySelected() when daySelected != null:
return daySelected(_that.day);case _NextMonth() when nextMonth != null:
return nextMonth();case _PreviousMonth() when previousMonth != null:
return previousMonth();case _:
  return null;

}
}

}

/// @nodoc


class _InitEvent implements CalenderEvent {
  const _InitEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalenderEvent.init()';
}


}




/// @nodoc


class _MonthChanged implements CalenderEvent {
  const _MonthChanged(this.monthIndex);
  

 final  int monthIndex;

/// Create a copy of CalenderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthChangedCopyWith<_MonthChanged> get copyWith => __$MonthChangedCopyWithImpl<_MonthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthChanged&&(identical(other.monthIndex, monthIndex) || other.monthIndex == monthIndex));
}


@override
int get hashCode => Object.hash(runtimeType,monthIndex);

@override
String toString() {
  return 'CalenderEvent.monthChanged(monthIndex: $monthIndex)';
}


}

/// @nodoc
abstract mixin class _$MonthChangedCopyWith<$Res> implements $CalenderEventCopyWith<$Res> {
  factory _$MonthChangedCopyWith(_MonthChanged value, $Res Function(_MonthChanged) _then) = __$MonthChangedCopyWithImpl;
@useResult
$Res call({
 int monthIndex
});




}
/// @nodoc
class __$MonthChangedCopyWithImpl<$Res>
    implements _$MonthChangedCopyWith<$Res> {
  __$MonthChangedCopyWithImpl(this._self, this._then);

  final _MonthChanged _self;
  final $Res Function(_MonthChanged) _then;

/// Create a copy of CalenderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? monthIndex = null,}) {
  return _then(_MonthChanged(
null == monthIndex ? _self.monthIndex : monthIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DaySelected implements CalenderEvent {
  const _DaySelected(this.day);
  

 final  CalendarDay day;

/// Create a copy of CalenderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySelectedCopyWith<_DaySelected> get copyWith => __$DaySelectedCopyWithImpl<_DaySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySelected&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'CalenderEvent.daySelected(day: $day)';
}


}

/// @nodoc
abstract mixin class _$DaySelectedCopyWith<$Res> implements $CalenderEventCopyWith<$Res> {
  factory _$DaySelectedCopyWith(_DaySelected value, $Res Function(_DaySelected) _then) = __$DaySelectedCopyWithImpl;
@useResult
$Res call({
 CalendarDay day
});




}
/// @nodoc
class __$DaySelectedCopyWithImpl<$Res>
    implements _$DaySelectedCopyWith<$Res> {
  __$DaySelectedCopyWithImpl(this._self, this._then);

  final _DaySelected _self;
  final $Res Function(_DaySelected) _then;

/// Create a copy of CalenderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(_DaySelected(
null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as CalendarDay,
  ));
}


}

/// @nodoc


class _NextMonth implements CalenderEvent {
  const _NextMonth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextMonth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalenderEvent.nextMonth()';
}


}




/// @nodoc


class _PreviousMonth implements CalenderEvent {
  const _PreviousMonth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviousMonth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalenderEvent.previousMonth()';
}


}




/// @nodoc
mixin _$CalenderState {

 CalendarStatus get status; List<CalendarDay> get calendarDays; Map<int, List<CalendarDay>> get groupedByMonth; int get currentMonthIndex; List<String> get dayList; CalendarDay? get selectedDay; String? get errorMessage;
/// Create a copy of CalenderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalenderStateCopyWith<CalenderState> get copyWith => _$CalenderStateCopyWithImpl<CalenderState>(this as CalenderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalenderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.calendarDays, calendarDays)&&const DeepCollectionEquality().equals(other.groupedByMonth, groupedByMonth)&&(identical(other.currentMonthIndex, currentMonthIndex) || other.currentMonthIndex == currentMonthIndex)&&const DeepCollectionEquality().equals(other.dayList, dayList)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(calendarDays),const DeepCollectionEquality().hash(groupedByMonth),currentMonthIndex,const DeepCollectionEquality().hash(dayList),selectedDay,errorMessage);

@override
String toString() {
  return 'CalenderState(status: $status, calendarDays: $calendarDays, groupedByMonth: $groupedByMonth, currentMonthIndex: $currentMonthIndex, dayList: $dayList, selectedDay: $selectedDay, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CalenderStateCopyWith<$Res>  {
  factory $CalenderStateCopyWith(CalenderState value, $Res Function(CalenderState) _then) = _$CalenderStateCopyWithImpl;
@useResult
$Res call({
 CalendarStatus status, List<CalendarDay> calendarDays, Map<int, List<CalendarDay>> groupedByMonth, int currentMonthIndex, List<String> dayList, CalendarDay? selectedDay, String? errorMessage
});




}
/// @nodoc
class _$CalenderStateCopyWithImpl<$Res>
    implements $CalenderStateCopyWith<$Res> {
  _$CalenderStateCopyWithImpl(this._self, this._then);

  final CalenderState _self;
  final $Res Function(CalenderState) _then;

/// Create a copy of CalenderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? calendarDays = null,Object? groupedByMonth = null,Object? currentMonthIndex = null,Object? dayList = null,Object? selectedDay = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CalendarStatus,calendarDays: null == calendarDays ? _self.calendarDays : calendarDays // ignore: cast_nullable_to_non_nullable
as List<CalendarDay>,groupedByMonth: null == groupedByMonth ? _self.groupedByMonth : groupedByMonth // ignore: cast_nullable_to_non_nullable
as Map<int, List<CalendarDay>>,currentMonthIndex: null == currentMonthIndex ? _self.currentMonthIndex : currentMonthIndex // ignore: cast_nullable_to_non_nullable
as int,dayList: null == dayList ? _self.dayList : dayList // ignore: cast_nullable_to_non_nullable
as List<String>,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as CalendarDay?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalenderState].
extension CalenderStatePatterns on CalenderState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalenderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalenderState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalenderState value)  $default,){
final _that = this;
switch (_that) {
case _CalenderState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalenderState value)?  $default,){
final _that = this;
switch (_that) {
case _CalenderState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarStatus status,  List<CalendarDay> calendarDays,  Map<int, List<CalendarDay>> groupedByMonth,  int currentMonthIndex,  List<String> dayList,  CalendarDay? selectedDay,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalenderState() when $default != null:
return $default(_that.status,_that.calendarDays,_that.groupedByMonth,_that.currentMonthIndex,_that.dayList,_that.selectedDay,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarStatus status,  List<CalendarDay> calendarDays,  Map<int, List<CalendarDay>> groupedByMonth,  int currentMonthIndex,  List<String> dayList,  CalendarDay? selectedDay,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CalenderState():
return $default(_that.status,_that.calendarDays,_that.groupedByMonth,_that.currentMonthIndex,_that.dayList,_that.selectedDay,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarStatus status,  List<CalendarDay> calendarDays,  Map<int, List<CalendarDay>> groupedByMonth,  int currentMonthIndex,  List<String> dayList,  CalendarDay? selectedDay,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CalenderState() when $default != null:
return $default(_that.status,_that.calendarDays,_that.groupedByMonth,_that.currentMonthIndex,_that.dayList,_that.selectedDay,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CalenderState extends CalenderState {
  const _CalenderState({required this.status, required final  List<CalendarDay> calendarDays, required final  Map<int, List<CalendarDay>> groupedByMonth, required this.currentMonthIndex, required final  List<String> dayList, this.selectedDay, this.errorMessage}): _calendarDays = calendarDays,_groupedByMonth = groupedByMonth,_dayList = dayList,super._();
  

@override final  CalendarStatus status;
 final  List<CalendarDay> _calendarDays;
@override List<CalendarDay> get calendarDays {
  if (_calendarDays is EqualUnmodifiableListView) return _calendarDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calendarDays);
}

 final  Map<int, List<CalendarDay>> _groupedByMonth;
@override Map<int, List<CalendarDay>> get groupedByMonth {
  if (_groupedByMonth is EqualUnmodifiableMapView) return _groupedByMonth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groupedByMonth);
}

@override final  int currentMonthIndex;
 final  List<String> _dayList;
@override List<String> get dayList {
  if (_dayList is EqualUnmodifiableListView) return _dayList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dayList);
}

@override final  CalendarDay? selectedDay;
@override final  String? errorMessage;

/// Create a copy of CalenderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalenderStateCopyWith<_CalenderState> get copyWith => __$CalenderStateCopyWithImpl<_CalenderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalenderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._calendarDays, _calendarDays)&&const DeepCollectionEquality().equals(other._groupedByMonth, _groupedByMonth)&&(identical(other.currentMonthIndex, currentMonthIndex) || other.currentMonthIndex == currentMonthIndex)&&const DeepCollectionEquality().equals(other._dayList, _dayList)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_calendarDays),const DeepCollectionEquality().hash(_groupedByMonth),currentMonthIndex,const DeepCollectionEquality().hash(_dayList),selectedDay,errorMessage);

@override
String toString() {
  return 'CalenderState(status: $status, calendarDays: $calendarDays, groupedByMonth: $groupedByMonth, currentMonthIndex: $currentMonthIndex, dayList: $dayList, selectedDay: $selectedDay, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CalenderStateCopyWith<$Res> implements $CalenderStateCopyWith<$Res> {
  factory _$CalenderStateCopyWith(_CalenderState value, $Res Function(_CalenderState) _then) = __$CalenderStateCopyWithImpl;
@override @useResult
$Res call({
 CalendarStatus status, List<CalendarDay> calendarDays, Map<int, List<CalendarDay>> groupedByMonth, int currentMonthIndex, List<String> dayList, CalendarDay? selectedDay, String? errorMessage
});




}
/// @nodoc
class __$CalenderStateCopyWithImpl<$Res>
    implements _$CalenderStateCopyWith<$Res> {
  __$CalenderStateCopyWithImpl(this._self, this._then);

  final _CalenderState _self;
  final $Res Function(_CalenderState) _then;

/// Create a copy of CalenderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? calendarDays = null,Object? groupedByMonth = null,Object? currentMonthIndex = null,Object? dayList = null,Object? selectedDay = freezed,Object? errorMessage = freezed,}) {
  return _then(_CalenderState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CalendarStatus,calendarDays: null == calendarDays ? _self._calendarDays : calendarDays // ignore: cast_nullable_to_non_nullable
as List<CalendarDay>,groupedByMonth: null == groupedByMonth ? _self._groupedByMonth : groupedByMonth // ignore: cast_nullable_to_non_nullable
as Map<int, List<CalendarDay>>,currentMonthIndex: null == currentMonthIndex ? _self.currentMonthIndex : currentMonthIndex // ignore: cast_nullable_to_non_nullable
as int,dayList: null == dayList ? _self._dayList : dayList // ignore: cast_nullable_to_non_nullable
as List<String>,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as CalendarDay?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
