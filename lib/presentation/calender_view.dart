import 'package:auto_route/auto_route.dart';
import 'package:custom_calender/domain/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/calender/calender_bloc.dart';

@RoutePage(name: 'CalenderView')
class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalenderBloc()..add(const CalenderEvent.init()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Calendar'), centerTitle: true),
        body: BlocBuilder<CalenderBloc, CalenderState>(
          builder: (context, state) {
            if (state.calenderDays.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            // Group days by month
            final Map<int, List<CalenderDays>> groupedByMonth = {};
            for (var day in state.calenderDays) {
              groupedByMonth.putIfAbsent(day.month ?? 0, () => []).add(day);
            }

            return Column(
              children: [
                // Month Title
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          state.pageController?.previousPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(Icons.keyboard_arrow_left_rounded, size: 48),
                      ),
                      Text(
                        state.monthName ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          state.pageController?.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 48,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Weekday row
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            state.dayList?[index]
                                    .toString()
                                    .replaceRange(
                                      3,
                                      state.dayList?[index].length,
                                      '',
                                    )
                                    .toUpperCase() ??
                                '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: state.pageController,
                    itemCount: groupedByMonth.keys.length,
                    itemBuilder: (context, index) {
                      final month = groupedByMonth.keys.elementAt(index);
                      final days = groupedByMonth[month] ?? [];
                      var monthlyName = monthName(month) ?? '';
                      context.read<CalenderBloc>().add(
                        CalenderEvent.monthlyData(monthName: monthlyName),
                      );

                      // Sort by date to ensure order
                      days.sort((a, b) => (a.date ?? 0).compareTo(b.date ?? 0));
                      // Find weekday index for the first day of this month
                      final firstDay = days.first;
                      final firstWeekday = _weekdayIndex(
                        firstDay.day ?? '',
                      ); // 0-6

                      // Build calendar grid
                      List<Widget> monthlyDay = [];

                      // Add empty cells for alignment
                      for (int i = 0; i < firstWeekday; i++) {
                        monthlyDay.add(const SizedBox.shrink());
                      }

                      // Add actual days
                      for (var day in days) {
                        monthlyDay.add(
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              day.date.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 7,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: monthlyDay,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String monthName(int month) {
    const monthNames = [
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
    return monthNames[month - 1];
  }

  // Convert day string ("Monday") to index (0=Mon)
  int _weekdayIndex(String day) {
    switch (day) {
      case 'Monday':
        return 0;
      case 'Tuesday':
        return 1;
      case 'Wednesday':
        return 2;
      case 'Thursday':
        return 3;
      case 'Friday':
        return 4;
      case 'Saturday':
        return 5;
      case 'Sunday':
        return 6;
      default:
        return 0;
    }
  }
}
