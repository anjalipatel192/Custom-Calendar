import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/calender/calender_bloc.dart';
import '../core/constants/app_constants.dart';
import '../domain/entities/calendar_day.dart';
import '../injection.dart';
import 'widgets/calendar_grid.dart';
import 'widgets/calendar_header.dart';
import 'widgets/selected_day_card.dart';
import 'widgets/weekday_header.dart';

/// Main calendar screen routed via AutoRoute.
///
/// Encapsulates page view scrolling, month transitions, and day selection.
@RoutePage(name: 'CalenderView')
class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CalenderBloc>()..add(const CalenderEvent.init()),
      child: const _CalendarPageContent(),
    );
  }
}

class _CalendarPageContent extends StatefulWidget {
  const _CalendarPageContent();

  @override
  State<_CalendarPageContent> createState() => _CalendarPageContentState();
}

class _CalendarPageContentState extends State<_CalendarPageContent> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int targetIndex) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        targetIndex,
        duration: AppConstants.pageTransitionDuration,
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Calendar 2025'),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 2,
      ),
      body: BlocConsumer<CalenderBloc, CalenderState>(
        listenWhen: (previous, current) =>
            previous.currentMonthIndex != current.currentMonthIndex,
        listener: (context, state) {
          if (_pageController.hasClients &&
              _pageController.page?.round() != state.currentMonthIndex) {
            _navigateToPage(state.currentMonthIndex);
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case CalendarStatus.initial:
            case CalendarStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case CalendarStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: theme.colorScheme.error,
                        size: 54,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage ??
                            'An error occurred loading the calendar.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      FilledButton.icon(
                        onPressed: () => context.read<CalenderBloc>().add(
                          const CalenderEvent.init(),
                        ),
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );

            case CalendarStatus.success:
              final monthsCount = state.groupedByMonth.keys.length;

              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                      child: CalendarHeader(
                        monthName: state.currentMonthName,
                        year: 2025,
                        canGoPrevious: state.canNavigatePrevious,
                        canGoNext: state.canNavigateNext,
                        onPrevious: () {
                          if (state.canNavigatePrevious) {
                            _navigateToPage(state.currentMonthIndex - 1);
                          }
                        },
                        onNext: () {
                          if (state.canNavigateNext) {
                            _navigateToPage(state.currentMonthIndex + 1);
                          }
                        },
                      ),
                    ),
                    const WeekdayHeader(),
                    const Divider(height: 1, thickness: 0.5),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: monthsCount > 0 ? monthsCount : 12,
                        onPageChanged: (index) {
                          context.read<CalenderBloc>().add(
                            CalenderEvent.monthChanged(index),
                          );
                        },
                        itemBuilder: (context, index) {
                          final monthNumber = index + 1;
                          final days =
                              state.groupedByMonth[monthNumber] ??
                              const <CalendarDay>[];

                          return CalendarMonthGrid(
                            days: days,
                            selectedDay: state.selectedDay,
                            onDaySelected: (day) {
                              context.read<CalenderBloc>().add(
                                CalenderEvent.daySelected(day),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SelectedDayCard(selectedDay: state.selectedDay),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
