import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go/core/models/desconto.dart';

class Periodo extends Equatable {
  final String tempoFormatado;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Desconto? desconto; 

  const Periodo({
    required this.tempoFormatado,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      temCortesia: json['temCortesia'],
      desconto: json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tempoFormatado': tempoFormatado,
      'valor': valor,
      'valorTotal': valorTotal,
      'temCortesia': temCortesia,
      'desconto': desconto?.toJson(),
    };
  }

  @override
  List<Object?> get props => [tempoFormatado, valor, valorTotal, temCortesia];
}
