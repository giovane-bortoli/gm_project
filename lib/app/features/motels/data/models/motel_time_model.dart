// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotelTimeModel {
  final String timeFormated;
  final String value;
  final String totalValue;
  final bool hasCortesy;
  final int? discount;

  MotelTimeModel({
    required this.timeFormated,
    required this.value,
    required this.totalValue,
    required this.hasCortesy,
    this.discount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tempoFormatado': timeFormated,
      'valor': value,
      'valorTotal': totalValue,
      'temCortesia': hasCortesy,
      'desconto': discount,
    };
  }

  factory MotelTimeModel.fromMap(Map<String, dynamic> map) {
    return MotelTimeModel(
      timeFormated: map['tempoFormatado'] as String,
      value: map['valor'] as String,
      totalValue: map['valorTotal'] as String,
      hasCortesy: map['temCortesia'] as bool,
      discount: map['desconto'] != null ? map['desconto'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotelTimeModel.fromJson(String source) => MotelTimeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MotelTimeModel copyWith({
    String? timeFormated,
    String? value,
    String? totalValue,
    bool? hasCortesy,
    int? discount,
  }) {
    return MotelTimeModel(
      timeFormated: timeFormated ?? this.timeFormated,
      value: value ?? this.value,
      totalValue: totalValue ?? this.totalValue,
      hasCortesy: hasCortesy ?? this.hasCortesy,
      discount: discount ?? this.discount,
    );
  }

  @override
  String toString() {
    return 'MotelTimeModel(timeFormated: $timeFormated, value: $value, totalValue: $totalValue, hasCortesy: $hasCortesy, discount: $discount)';
  }

  @override
  bool operator ==(covariant MotelTimeModel other) {
    if (identical(this, other)) return true;

    return other.timeFormated == timeFormated &&
        other.value == value &&
        other.totalValue == totalValue &&
        other.hasCortesy == hasCortesy &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return timeFormated.hashCode ^ value.hashCode ^ totalValue.hashCode ^ hasCortesy.hashCode ^ discount.hashCode;
  }
}
