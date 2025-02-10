import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gm_project/app/features/motels/data/models/motel_item_category_model.dart';
import 'package:gm_project/app/features/motels/data/models/motel_room_model.dart';
import 'package:gm_project/app/features/motels/data/models/motel_time_model.dart';

void main() {
  group('MotelRoomModel tests', () {
    final motelRoom = MotelRoomModel(
      name: 'Luxo',
      qtd: 5,
      qtdAvailable: true,
      photos: ['photo1.jpg', 'photo2.jpg'],
      items: ['TV', 'Ar-condicionado'],
      itemCategory: [
        MotelItemCategoryModel(
            name: 'Frigobar',
            icon: 'https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png'),
      ],
      timePeriod: [
        MotelTimeModel(timeFormated: '3 horas', value: '88.0', totalValue: '88.0', hasCortesy: true),
      ],
    );

    test('Should create a valid instance:', () {
      expect(motelRoom.name, 'Luxo');
      expect(motelRoom.qtd, 5);
      expect(motelRoom.qtdAvailable, true);
      expect(motelRoom.photos, ['photo1.jpg', 'photo2.jpg']);
      expect(motelRoom.items, ['TV', 'Ar-condicionado']);
      expect(motelRoom.itemCategory.length, 1);
      expect(motelRoom.timePeriod.length, 1);
    });

    test('toMap should return a valid object', () {
      final map = motelRoom.toMap();
      expect(map, {
        'nome': 'Luxo',
        'qtd': 5,
        'exibirQtdDisponiveis': true,
        'fotos': ['photo1.jpg', 'photo2.jpg'],
        'itens': ['TV', 'Ar-condicionado'],
        'categoriaItens': isA<List>(),
        'periodos': isA<List>(),
      });
    });

    test('fromMap should return a valid map', () {
      final map = motelRoom.toMap();
      final result = MotelRoomModel.fromMap(map);
      expect(result.name, motelRoom.name);
      expect(result.qtd, motelRoom.qtd);
      expect(result.qtdAvailable, motelRoom.qtdAvailable);
    });
    test('toJson should convert correctly object to json', () {
      final jsonResult = motelRoom.toJson();
      expect(jsonResult, isA<String>());
      expect(json.decode(jsonResult), isA<Map<String, dynamic>>());
    });

    test('fromJson should convert json to object correctly', () {
      final jsonString = motelRoom.toJson();
      final result = MotelRoomModel.fromJson(jsonString);
      expect(result.name, motelRoom.name);
      expect(result.qtd, motelRoom.qtd);
      expect(result.qtdAvailable, motelRoom.qtdAvailable);
      expect(result.itemCategory, motelRoom.itemCategory);
      expect(result.timePeriod, motelRoom.timePeriod);
    });
  });
}
