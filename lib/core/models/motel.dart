import 'suite.dart';
import 'package:equatable/equatable.dart';


class Motel extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<Suite> suites;
  final int qtdAvaliacoes;
  final double media;

  const Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  Motel copyWith({
    String? fantasia,
    String? logo,
    String? bairro,
    double? distancia,
    int? qtdFavoritos,
    List<Suite>? suites,
    int? qtdAvaliacoes,
    double? media,
  }) {
    return Motel(
      fantasia: fantasia ?? this.fantasia,
      logo: logo ?? this.logo,
      bairro: bairro ?? this.bairro,
      distancia: distancia ?? this.distancia,
      qtdFavoritos: qtdFavoritos ?? this.qtdFavoritos,
      suites: suites ?? this.suites,
      qtdAvaliacoes: qtdAvaliacoes ?? this.qtdAvaliacoes,
      media: media ?? this.media,
    );
  }
    
  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: (json['distancia'] as num).toDouble(),
      qtdFavoritos: json['qtdFavoritos'],
      suites: (json['suites'] as List).map((s) => Suite.fromJson(s)).toList(),
      qtdAvaliacoes: json['qtdAvaliacoes'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'distancia': distancia,
      'qtdFavoritos': qtdFavoritos,
      'suites': suites.map((s) => s.toJson()).toList(),
      'qtdAvaliacoes': qtdAvaliacoes,
      'media': media,
    };
  }

  @override
  List<Object?> get props => [fantasia, logo, bairro, distancia, qtdFavoritos, suites, qtdAvaliacoes, media];
}
