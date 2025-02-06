import 'dart:convert';

import 'package:gm_project/app/features/motels/data/models/motel_room_model.dart';

class MotelModels {
  final String fantasy;
  final String logo;
  final String neighborhood;
  final int distance;
  final List<MotelRoomModel> rooms;

  MotelModels({
    required this.fantasy,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.rooms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasia': fantasy,
      'logo': logo,
      'bairro': neighborhood,
      'distancia': distance,
      'suites': rooms.map((x) => x.toMap()).toList(),
    };
  }

  factory MotelModels.fromMap(Map<String, dynamic> map) {
    return MotelModels(
      fantasy: map['fantasia'] as String,
      logo: map['logo'] as String,
      neighborhood: map['bairro'] as String,
      distance: map['distancia'] as int,
      rooms: List<MotelRoomModel>.from(
        (map['suites'] as List<int>).map<MotelRoomModel>(
          (x) => MotelRoomModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelModels.fromJson(String source) => MotelModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
