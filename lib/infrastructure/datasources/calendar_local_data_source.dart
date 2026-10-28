import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_constants.dart';
import '../../core/errors/failures.dart';
import '../../domain/model/response.dart';

/// Contract for loading calendar raw data from local bundle storage.
abstract class CalendarLocalDataSource {
  Future<List<CalendarDayModel>> loadCalendarData();
}

/// Implementation of [CalendarLocalDataSource] that reads bundled JSON assets.
@LazySingleton(as: CalendarLocalDataSource)
class CalendarLocalDataSourceImpl implements CalendarLocalDataSource {
  final AssetBundle _assetBundle;

  CalendarLocalDataSourceImpl() : _assetBundle = rootBundle;

  /// Visible for testing with custom asset bundles.
  CalendarLocalDataSourceImpl.withBundle(AssetBundle assetBundle)
    : _assetBundle = assetBundle;

  @override
  Future<List<CalendarDayModel>> loadCalendarData() async {
    final String jsonString;
    try {
      jsonString = await _assetBundle.loadString(
        AppConstants.calendar2025AssetPath,
      );
    } catch (e) {
      throw AssetLoadFailure(
        'Failed to read asset from ${AppConstants.calendar2025AssetPath}',
        e,
      );
    }

    try {
      final dynamic decoded = jsonDecode(jsonString);
      if (decoded is! List) {
        throw const DataParsingFailure('Expected root JSON to be a list');
      }

      return decoded
          .whereType<Map<String, dynamic>>()
          .map(CalendarDayModel.fromJson)
          .toList(growable: false);
    } catch (e) {
      if (e is Failure) rethrow;
      throw DataParsingFailure('Failed to parse calendar JSON data', e);
    }
  }
}
