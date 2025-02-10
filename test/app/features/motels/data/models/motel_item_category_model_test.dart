import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gm_project/app/features/motels/data/models/motel_item_category_model.dart';

void main() {
  group('MotelItemCategoryModel', () {
    final category = MotelItemCategoryModel(
      name: 'Conforto',
      icon: 'sofa_icon.png',
    );

    test('Should createa valid instance', () {
      expect(category.name, 'Conforto');
      expect(category.icon, 'sofa_icon.png');
    });

    test('toMap should return a correct map', () {
      final map = category.toMap();
      expect(map, {
        'nome': 'Conforto',
        'icone': 'sofa_icon.png',
      });
    });

    test('fromMap should retorn a valid object', () {
      final map = category.toMap();
      final result = MotelItemCategoryModel.fromMap(map);
      expect(result.name, category.name);
      expect(result.icon, category.icon);
    });

    test('toJson should convert object to JSON', () {
      final jsonResult = category.toJson();
      expect(jsonResult, isA<String>());
      expect(json.decode(jsonResult), {
        'nome': 'Conforto',
        'icone': 'sofa_icon.png',
      });
    });

    test('fromJson should convert a json to object correctly', () {
      final jsonString = category.toJson();
      final result = MotelItemCategoryModel.fromJson(jsonString);
      expect(result.name, category.name);
      expect(result.icon, category.icon);
    });
  });
}
