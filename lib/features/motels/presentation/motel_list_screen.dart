import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_moteis_go/core/models/motel.dart';
import 'package:guia_moteis_go/core/models/suite.dart';
import 'package:guia_moteis_go/features/motels/models/filter_model.dart';
import 'package:guia_moteis_go/features/motels/provider/filter_provider.dart';
import 'package:guia_moteis_go/features/motels/provider/motel_provider.dart';
import 'package:guia_moteis_go/features/motels/widgets/filter_bar.dart';
import 'package:guia_moteis_go/features/motels/widgets/motel_card.dart';

class MotelListScreen extends ConsumerWidget {
  const MotelListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final motelAsync = ref.watch(motelProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.red),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              surfaceTintColor: Colors.transparent,
              elevation: 0, 
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),

             
            ),
            ),
          Positioned(
            top: size.height * 0.15,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  FilterBar(),
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 0.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  motelAsync.when(
                    data: (moteis) {
                      final filteredMoteis = moteis.map((motel) {
                      final filteredSuites = motel.suites.where((suite) {
                      final categoriaMatch = _checkCategoria(suite, filterState);
                      final descontoMatch = _checkDesconto(suite, filterState);
                      return categoriaMatch && descontoMatch;
                      }).toList();

                      return filteredSuites.isNotEmpty ? motel.copyWith(suites: filteredSuites) : null;
                    }).whereType<Motel>().toList();

                      return Expanded(
                        child: ListView.builder(
                          itemCount: filteredMoteis.length,
                          itemBuilder: (context, index) {
                            final motel = filteredMoteis[index];
                            return MotelCard(motel: motel, width: size.width, height: size.height);
                          },
                        ),
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (error, _) => Center(child: Text("Erro: $error")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _checkCategoria(Suite suite, FilterModel filterState) {
  final categoriasNomes = suite.categoriasNomes;
  if (filterState.hidro && !categoriasNomes.contains('Hidro')) return false;
  if (filterState.piscina && !categoriasNomes.contains('Piscina')) return false;
  if (filterState.sauna && !categoriasNomes.contains('Sauna')) return false;
  if (filterState.ofuro && !categoriasNomes.contains('Ofurô')) return false;
  if (filterState.decoracaoErotica && !categoriasNomes.contains('Decoração Erótica')) return false;
  if (filterState.decoracaoTematica && !categoriasNomes.contains('Decoração Temática')) return false;
  if (filterState.cadeiraErotica && !categoriasNomes.contains('Cadeira Erótica')) return false;
  if (filterState.pistaDanca && !categoriasNomes.contains('Pista de Dança')) return false;
  if (filterState.garagemPrivativa && !categoriasNomes.contains('Garagem Privativa')) return false;
  if (filterState.frigobar && !categoriasNomes.contains('Frigobar')) return false;
  if (filterState.internetWifi && !categoriasNomes.contains('Internet Wi-Fi')) return false;
  if (filterState.suiteFestas && !categoriasNomes.contains('Suíte para Festas')) return false;
  if (filterState.suiteAcessibilidade && !categoriasNomes.contains('Suíte com Acessibilidade')) return false;

  return true;
}

  bool _checkDesconto(Suite suite, FilterModel filterState) {
    if (filterState.comDesconto) {

      final desconto = suite.periodos.any((periodo) => periodo.desconto != null && periodo.desconto!.valor > 0);
      return desconto;
    }
    return true;
  }
}

