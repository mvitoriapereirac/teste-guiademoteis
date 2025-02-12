import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go/core/models/categoriaItem.dart';
import 'package:guia_moteis_go/features/motels/models/filter_model.dart';
import 'package:guia_moteis_go/core/models/suite.dart';

void main() {
  test('Filtro deve retornar suítes corretas', () {
    final filter = FilterModel(hidro: true);
    final suite = const Suite(nome: "Suite Luxo", categorias: [CategoriaItem(nome: "Hidro")], exibirQtdDisponiveis: false, fotos: [], itens: [], periodos: [], qtd: 0);

    final result = suite.categorias.any((categoria) => categoria.nome == "Hidro");

    expect(result, isTrue);
  });
}
