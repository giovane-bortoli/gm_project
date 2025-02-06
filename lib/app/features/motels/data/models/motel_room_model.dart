import 'dart:convert';

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

  factory MotelRoomModel.fromMap(Map<String, dynamic> map) {
    return MotelRoomModel(
      name: map['nome'] as String,
      qtd: map['qtd'] as int,
      qtdAvailable: map['exibirQtdDisponiveis'] as bool,
      photos: List<String>.from(
        (map['fotos'] as List<String>),
      ),
      items: List<String>.from(
        (map['itens'] as List<String>),
      ),
      itemCategory: List<MotelItemCategoryModel>.from(
        (map['categoriaItens'] as List<int>).map<MotelItemCategoryModel>(
          (x) => MotelItemCategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      timePeriod: List<MotelTimeModel>.from(
        (map['periodos'] as List<int>).map<MotelTimeModel>(
          (x) => MotelTimeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelRoomModel.fromJson(String source) => MotelRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
