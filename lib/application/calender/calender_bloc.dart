import 'dart:convert';

import 'package:custom_calender/domain/model/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calender_bloc.freezed.dart';
part 'calender_event.dart';
part 'calender_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  CalenderBloc() : super(CalenderState.init()) {
    on<CalenderEvent>((event, emit) async {
      await event.map(
        init: (value) async {
          try {
            final jsonString = await rootBundle.loadString(
              'assets/calendar_2025.json',
            );
            final List<dynamic> jsonData = jsonDecode(jsonString);
            final days = jsonData.map((e) => CalenderDays.fromJson(e)).toList();

            emit(state.copyWith(calenderDays: days));
          } catch (e) {
            print("Error loading calendar: $e");
          }
        },
        nextPage: (value) {
          state.pageController?.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        previousPage: (value) {
          state.pageController?.previousPage(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        monthlyData: (value) {
          emit(state.copyWith(monthName: value.monthName));
        },
      );
    });
  }
}
