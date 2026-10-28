import 'dart:convert';
import 'package:custom_calender/core/errors/failures.dart';
import 'package:custom_calender/infrastructure/datasources/calendar_local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestAssetBundle extends AssetBundle {
  final String? content;
  final bool shouldThrow;

  TestAssetBundle({this.content, this.shouldThrow = false});

  @override
  Future<ByteData> load(String key) {
    throw UnimplementedError();
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (shouldThrow) {
      throw Exception('Asset not found');
    }
    return content ?? '[]';
  }
}

void main() {
  group('CalendarLocalDataSource', () {
    test('successfully loads and parses calendar days', () async {
      final sampleJson = jsonEncode([
        {'date': 1, 'day': 'Wednesday', 'month': 1},
        {'date': 2, 'day': 'Thursday', 'month': 1},
      ]);

      final dataSource = CalendarLocalDataSourceImpl.withBundle(
        TestAssetBundle(content: sampleJson),
      );

      final result = await dataSource.loadCalendarData();

      expect(result.length, 2);
      expect(result[0].date, 1);
      expect(result[0].day, 'Wednesday');
      expect(result[1].date, 2);
    });

    test('throws AssetLoadFailure when asset reading fails', () async {
      final dataSource = CalendarLocalDataSourceImpl.withBundle(
        TestAssetBundle(shouldThrow: true),
      );

      expect(
        () => dataSource.loadCalendarData(),
        throwsA(isA<AssetLoadFailure>()),
      );
    });

    test('throws DataParsingFailure when JSON is malformed', () async {
      final dataSource = CalendarLocalDataSourceImpl.withBundle(
        TestAssetBundle(content: 'invalid-json-content'),
      );

      expect(
        () => dataSource.loadCalendarData(),
        throwsA(isA<DataParsingFailure>()),
      );
    });
  });
}
