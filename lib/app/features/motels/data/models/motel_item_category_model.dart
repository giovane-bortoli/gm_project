import 'dart:convert';

class MotelItemCategoryModel {
  final String name;
  final String icon;

  MotelItemCategoryModel({
    required this.name,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': name,
      'icone': icon,
    };
  }

  factory MotelItemCategoryModel.fromMap(Map<String, dynamic> map) {
    return MotelItemCategoryModel(
      name: map['nome'] as String,
      icon: map['icone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelItemCategoryModel.fromJson(String source) =>
      MotelItemCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
