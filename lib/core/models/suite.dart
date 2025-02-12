import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go/core/models/categoriaItem.dart';
import 'package:guia_moteis_go/core/models/item.dart';
import 'periodo.dart';

class Suite extends Equatable {
  final String nome;
  final int qtd;
  final List<String> fotos;
  final List<Periodo> periodos;
  final bool exibirQtdDisponiveis;
  final List<Item> itens;
  final List<CategoriaItem> categorias;

  const Suite({
    required this.nome,
    required this.qtd,
    required this.fotos,
    required this.periodos,
    required this.exibirQtdDisponiveis,
    required this.itens,
    required this.categorias,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      fotos: List<String>.from(json['fotos']),
      periodos: (json['periodos'] as List).map((p) => Periodo.fromJson(p)).toList(),
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      itens: (json['itens'] as List).map((i) => Item.fromJson(i)).toList(),
      categorias: (json['categoriaItens'] as List).map((c) => CategoriaItem.fromJson(c)).toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'qtd': qtd,
      'fotos': fotos,
      'periodos': periodos.map((p) => p.toJson()).toList(),
      'exibirQtdDisponiveis': exibirQtdDisponiveis,
      'itens': itens.map((i) => i.toJson()).toList(),
      'categoriaItens': categorias.map((c) => c.toJson()).toList(),
    };
  }

  List<String> get categoriasNomes => categorias.map((c) => c.nome).toList();


  @override
  List<Object?> get props => [nome, qtd, fotos, periodos, exibirQtdDisponiveis, itens, categorias];
}
