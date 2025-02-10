// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  String toJson() => json.encode(toMap());

  factory MotelModels.fromJson(String source) => MotelModels.fromMap(json.decode(source) as Map<String, dynamic>);

  MotelModels copyWith({
    String? fantasy,
    String? logo,
    String? neighborhood,
    int? distance,
    List<MotelRoomModel>? rooms,
  }) {
    return MotelModels(
      fantasy: fantasy ?? this.fantasy,
      logo: logo ?? this.logo,
      neighborhood: neighborhood ?? this.neighborhood,
      distance: distance ?? this.distance,
      rooms: rooms ?? this.rooms,
    );
  }

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
        (map['suites'] as List<dynamic>).map<MotelRoomModel>(
          (x) => MotelRoomModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'MotelModels(fantasia: $fantasy, logo: $logo, bairro: $neighborhood, distancia: $distance, suites: $rooms)';
  }

  @override
  bool operator ==(covariant MotelModels other) {
    if (identical(this, other)) return true;

    return other.fantasy == fantasy &&
        other.logo == logo &&
        other.neighborhood == neighborhood &&
        other.distance == distance &&
        listEquals(other.rooms, rooms);
  }

  @override
  int get hashCode {
    return fantasy.hashCode ^ logo.hashCode ^ neighborhood.hashCode ^ distance.hashCode ^ rooms.hashCode;
  }
}
