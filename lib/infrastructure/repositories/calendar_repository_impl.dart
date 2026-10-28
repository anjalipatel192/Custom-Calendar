import 'package:injectable/injectable.dart';

import '../../domain/entities/calendar_day.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_local_data_source.dart';

/// Concrete implementation of [CalendarRepository].
///
/// Bridges infrastructure data sources with domain use cases.
@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarLocalDataSource _localDataSource;

  CalendarRepositoryImpl(this._localDataSource);

  @override
  Future<List<CalendarDay>> getCalendarDays() async {
    final models = await _localDataSource.loadCalendarData();
    return models;
  }
}
