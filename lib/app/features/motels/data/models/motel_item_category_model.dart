// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  MotelItemCategoryModel copyWith({
    String? name,
    String? icon,
  }) {
    return MotelItemCategoryModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  @override
  String toString() => 'MotelItemCategoryModel(nome: $name, icone: $icon)';

  @override
  bool operator ==(covariant MotelItemCategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
