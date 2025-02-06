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
}
