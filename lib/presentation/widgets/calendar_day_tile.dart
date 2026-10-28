import 'package:flutter/material.dart';

import '../../domain/entities/calendar_day.dart';

/// Interactive tile representing a single day in the calendar grid.
class CalendarDayTile extends StatelessWidget {
  final CalendarDay day;
  final bool isSelected;
  final ValueChanged<CalendarDay> onSelected;

  const CalendarDayTile({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final backgroundColor = isSelected
        ? primaryColor
        : (day.isWeekend
              ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
              : theme.colorScheme.surface);

    final textColor = isSelected
        ? theme.colorScheme.onPrimary
        : (day.isWeekend
              ? theme.colorScheme.error.withValues(alpha: 0.85)
              : theme.colorScheme.onSurface);

    return InkWell(
      onTap: () => onSelected(day),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.date}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
