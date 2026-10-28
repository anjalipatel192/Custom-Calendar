import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

/// Row of abbreviated weekday titles (MON, TUE, WED, etc.).
class WeekdayHeader extends StatelessWidget {
  final List<String> weekdays;

  const WeekdayHeader({super.key, this.weekdays = AppConstants.weekdays});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(weekdays.length, (index) {
          final dayName = weekdays[index];
          final shortName = dayName.length >= 3
              ? dayName.substring(0, 3).toUpperCase()
              : dayName.toUpperCase();
          final isWeekend = index >= 5;

          return Expanded(
            child: Center(
              child: Text(
                shortName,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isWeekend
                      ? theme.colorScheme.error.withValues(alpha: 0.8)
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
