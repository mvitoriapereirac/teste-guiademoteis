import 'package:equatable/equatable.dart';

class CategoriaItem extends Equatable {
  final String nome; 
  final String? icone;

  const CategoriaItem({
    required this.nome,
    this.icone,
  });

  factory CategoriaItem.fromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'icone': icone,
    };
  }

  @override
  List<Object?> get props => [nome, icone];

}