import 'package:custom_calender/domain/model/response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalendarDayModel', () {
    test('correctly parses JSON map into CalendarDayModel', () {
      final json = {'date': 1, 'day': 'Wednesday', 'month': 1, 'year': 2025};

      final model = CalendarDayModel.fromJson(json);

      expect(model.date, 1);
      expect(model.day, 'Wednesday');
      expect(model.month, 1);
      expect(model.year, 2025);
    });

    test('serializes CalendarDayModel into expected JSON map', () {
      const model = CalendarDayModel(
        date: 25,
        day: 'Thursday',
        month: 12,
        year: 2025,
      );

      final json = model.toJson();

      expect(json, {'date': 25, 'day': 'Thursday', 'month': 12, 'year': 2025});
    });

    test('handles missing optional fields with safe defaults', () {
      final json = <String, dynamic>{};
      final model = CalendarDayModel.fromJson(json);

      expect(model.date, 1);
      expect(model.day, 'Monday');
      expect(model.month, 1);
      expect(model.year, 2025);
    });
  });
}
