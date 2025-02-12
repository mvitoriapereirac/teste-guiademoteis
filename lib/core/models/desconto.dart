import 'package:equatable/equatable.dart';

class Desconto extends Equatable {
  final double valor;
  
  const Desconto({
    required this.valor,
  });

  factory Desconto.fromJson(Map<String, dynamic> json) {
    return Desconto(
      valor: (json['desconto'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desconto': valor,
    };
  }

  @override
  List<Object?> get props => [valor];
}