import 'package:flutter_test/flutter_test.dart';
import 'package:gm_project/app/features/motels/data/models/motel_item_category_model.dart';
import 'package:gm_project/app/features/motels/data/models/motel_models.dart';
import 'package:gm_project/app/features/motels/data/models/motel_room_model.dart';
import 'package:gm_project/app/features/motels/data/models/motel_time_model.dart';

void main() {
  group('MotelModels', () {
    final motelRoomModel = MotelRoomModel(
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

    final motel = MotelModels(
      fantasy: 'Motel Paraíso',
      logo: 'logo.png',
      neighborhood: 'Centro',
      distance: 5,
      rooms: [
        motelRoomModel,
      ],
    );

    test('should create a correct instance', () {
      expect(motel.fantasy, 'Motel Paraíso');
      expect(motel.logo, 'logo.png');
      expect(motel.neighborhood, 'Centro');
      expect(motel.distance, 5);
      expect(motel.rooms.length, 1);
    });

    test('toMap should return a valid map', () {
      final map = motel.toMap();
      expect(map, {
        'fantasia': 'Motel Paraíso',
        'logo': 'logo.png',
        'bairro': 'Centro',
        'distancia': 5,
        'suites': isA<List>(),
      });
    });

    test('fromMap should create a valid instance', () {
      final map = motel.toMap();
      final newMotel = MotelModels.fromMap(map);
      expect(newMotel, equals(motel));
    });

    test('toJson should return a valid json', () {
      final jsonStr = motel.toJson();
      expect(jsonStr, isA<String>());
    });

    test('fromJson should create a valid instance', () {
      final jsonStr = motel.toJson();
      final newMotel = MotelModels.fromJson(jsonStr);
      expect(newMotel, equals(motel));
    });

    test('copyWith should create a copy with changes', () {
      final newMotel = motel.copyWith(fantasy: 'Motel Sonho');
      expect(newMotel.fantasy, 'Motel Sonho');
      expect(newMotel.logo, motel.logo);
    });

    test('toString should return a formated String', () {
      expect(motel.toString(), contains('MotelModels'));
    });

    test('operador == should compare', () {
      final motelClone = MotelModels(
        fantasy: 'Motel Paraíso',
        logo: 'logo.png',
        neighborhood: 'Centro',
        distance: 5,
        rooms: [
          motelRoomModel,
        ],
      );
      expect(motel, equals(motelClone));
    });

    test('hashCode shold be consistent', () {
      final motelClone = motel.copyWith();
      expect(motel.hashCode, equals(motelClone.hashCode));
    });
  });
}
