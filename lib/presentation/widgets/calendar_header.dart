import 'package:flutter/material.dart';

/// Header widget displaying the current month and year with navigation controls.
class CalendarHeader extends StatelessWidget {
  final String monthName;
  final int year;
  final bool canGoPrevious;
  final bool canGoNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const CalendarHeader({
    super.key,
    required this.monthName,
    required this.year,
    required this.canGoPrevious,
    required this.canGoNext,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filledTonal(
            onPressed: canGoPrevious ? onPrevious : null,
            icon: const Icon(Icons.chevron_left_rounded, size: 28),
            tooltip: 'Previous Month',
            style: IconButton.styleFrom(
              backgroundColor: canGoPrevious
                  ? primaryColor.withValues(alpha: 0.1)
                  : Colors.grey.withValues(alpha: 0.08),
              foregroundColor: canGoPrevious ? primaryColor : Colors.grey,
            ),
          ),
          Column(
            children: [
              Text(
                monthName.isNotEmpty ? monthName : 'Calendar',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$year',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          IconButton.filledTonal(
            onPressed: canGoNext ? onNext : null,
            icon: const Icon(Icons.chevron_right_rounded, size: 28),
            tooltip: 'Next Month',
            style: IconButton.styleFrom(
              backgroundColor: canGoNext
                  ? primaryColor.withValues(alpha: 0.1)
                  : Colors.grey.withValues(alpha: 0.08),
              foregroundColor: canGoNext ? primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
