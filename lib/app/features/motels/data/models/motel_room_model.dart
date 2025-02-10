// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:gm_project/app/features/motels/data/models/motel_item_category_model.dart';
import 'package:gm_project/app/features/motels/data/models/motel_time_model.dart';

class MotelRoomModel {
  final String name;
  final int qtd;
  final bool qtdAvailable;
  final List<String> photos;
  final List<String> items;
  final List<MotelItemCategoryModel> itemCategory;
  final List<MotelTimeModel> timePeriod;
  MotelRoomModel({
    required this.name,
    required this.qtd,
    required this.qtdAvailable,
    required this.photos,
    required this.items,
    required this.itemCategory,
    required this.timePeriod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': name,
      'qtd': qtd,
      'exibirQtdDisponiveis': qtdAvailable,
      'fotos': photos,
      'itens': items,
      'categoriaItens': itemCategory.map((x) => x.toMap()).toList(),
      'periodos': timePeriod.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory MotelRoomModel.fromJson(String source) => MotelRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MotelRoomModel copyWith({
    String? name,
    int? qtd,
    bool? qtdAvailable,
    List<String>? photos,
    List<String>? items,
    List<MotelItemCategoryModel>? itemCategory,
    List<MotelTimeModel>? timePeriod,
  }) {
    return MotelRoomModel(
      name: name ?? this.name,
      qtd: qtd ?? this.qtd,
      qtdAvailable: qtdAvailable ?? this.qtdAvailable,
      photos: photos ?? this.photos,
      items: items ?? this.items,
      itemCategory: itemCategory ?? this.itemCategory,
      timePeriod: timePeriod ?? this.timePeriod,
    );
  }

  factory MotelRoomModel.fromMap(Map<String, dynamic> map) {
    return MotelRoomModel(
      name: map['nome'] as String,
      qtd: map['qtd'] as int,
      qtdAvailable: map['exibirQtdDisponiveis'] as bool,
      photos: List<String>.from(
        (map['fotos'] as List<dynamic>),
      ),
      items: List<String>.from(
        (map['itens'] as List<dynamic>),
      ),
      itemCategory: List<MotelItemCategoryModel>.from(
        (map['categoriaItens'] as List<dynamic>).map<MotelItemCategoryModel>(
          (x) => MotelItemCategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      timePeriod: List<MotelTimeModel>.from(
        (map['periodos'] as List<dynamic>).map<MotelTimeModel>(
          (x) => MotelTimeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'MotelRoomModel(name: $name, qtd: $qtd, exibirQtdDisponiveis: $qtdAvailable, fotos: $photos, itens: $items, categoriaItens: $itemCategory, periodos: $timePeriod)';
  }

  @override
  bool operator ==(covariant MotelRoomModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.qtd == qtd &&
        other.qtdAvailable == qtdAvailable &&
        listEquals(other.photos, photos) &&
        listEquals(other.items, items) &&
        listEquals(other.itemCategory, itemCategory) &&
        listEquals(other.timePeriod, timePeriod);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        qtd.hashCode ^
        qtdAvailable.hashCode ^
        photos.hashCode ^
        items.hashCode ^
        itemCategory.hashCode ^
        timePeriod.hashCode;
  }
}
