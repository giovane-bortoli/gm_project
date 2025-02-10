import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gm_project/app/features/motels/data/models/motel_time_model.dart';

void main() {
  group('MotelTimeModel', () {
    final timeModel = MotelTimeModel(
      timeFormated: '2h',
      value: '50.00',
      totalValue: '100.00',
      hasCortesy: true,
      discount: 10,
    );

    test('Should create a valid instance', () {
      expect(timeModel.timeFormated, '2h');
      expect(timeModel.value, '50.00');
      expect(timeModel.totalValue, '100.00');
      expect(timeModel.hasCortesy, true);
      expect(timeModel.discount, 10);
    });

    test('toMap should return a valid Map', () {
      final map = timeModel.toMap();
      expect(map, {
        'tempoFormatado': '2h',
        'valor': '50.00',
        'valorTotal': '100.00',
        'temCortesia': true,
        'desconto': 10,
      });
    });

    test('fromMap should create a valid object', () {
      final map = timeModel.toMap();
      final result = MotelTimeModel.fromMap(map);
      expect(result, timeModel);
    });

    test('toJson should convert object to json correct', () {
      final jsonResult = timeModel.toJson();
      expect(jsonResult, isA<String>());
      expect(json.decode(jsonResult), {
        'tempoFormatado': '2h',
        'valor': '50.00',
        'valorTotal': '100.00',
        'temCortesia': true,
        'desconto': 10,
      });
    });

    test('fromJson should convert json to object', () {
      final jsonString = timeModel.toJson();
      final result = MotelTimeModel.fromJson(jsonString);
      expect(result, timeModel);
    });

    test('copyWith should create a instance with modified values', () {
      final modified = timeModel.copyWith(value: '60.00', discount: 15);
      expect(modified.value, '60.00');
      expect(modified.discount, 15);
      expect(modified.timeFormated, timeModel.timeFormated);
    });

    test('toString should return valid String', () {
      final stringResult = timeModel.toString();
      expect(stringResult,
          'MotelTimeModel(timeFormated: 2h, value: 50.00, totalValue: 100.00, hasCortesy: true, discount: 10)');
    });
  });
}
