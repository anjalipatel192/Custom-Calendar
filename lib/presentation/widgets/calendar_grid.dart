import 'package:flutter/material.dart';

import '../../domain/entities/calendar_day.dart';
import 'calendar_day_tile.dart';

/// Month day grid calculating weekday offset spacers and rendering daily cells.
class CalendarMonthGrid extends StatelessWidget {
  final List<CalendarDay> days;
  final CalendarDay? selectedDay;
  final ValueChanged<CalendarDay> onDaySelected;

  const CalendarMonthGrid({
    super.key,
    required this.days,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) {
      return const Center(child: Text('No calendar data available'));
    }

    final firstDay = days.first;
    final leadingOffset = firstDay.weekdayIndex; // 0 for Monday .. 6 for Sunday

    final totalCellCount = leadingOffset + days.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalCellCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          if (index < leadingOffset) {
            return const SizedBox.shrink();
          }

          final day = days[index - leadingOffset];
          final isSelected =
              selectedDay != null &&
              selectedDay!.date == day.date &&
              selectedDay!.month == day.month &&
              selectedDay!.year == day.year;

          return CalendarDayTile(
            day: day,
            isSelected: isSelected,
            onSelected: onDaySelected,
          );
        },
      ),
    );
  }
}
