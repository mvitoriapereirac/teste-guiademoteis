import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_moteis_go/features/motels/models/filter_model.dart';
import '../provider/filter_provider.dart';
class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);

    final filters = {
      'Filtros': Icons.filter_list,
      'Com desconto': null,
      'Disponíveis': null,
      'Hidro': null,
      'Piscina': null,
      'Sauna': null,
      'Ofurô': null,
      'Decoração Erótica': null,
      'Decoração Temática': null,
      'Cadeira Erótica': null,
      'Pista de Dança': null,
      'Garagem Privativa': null,
      'Frigobar': null,
      'Internet Wi-Fi': null,
      'Suíte para Festas': null,
      'Suíte com Acessibilidade': null,
    };

    final activeFiltersCount = filterState.activeFiltersCount;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.keys.length,
        itemBuilder: (context, index) {
          String key = filters.keys.elementAt(index);
          bool isActive = _isFilterActive(filterState, key);
      
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Stack(
              children:[
              ChoiceChip(
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                avatar: filters[key] != null
                    ? Icon(filters[key], size: 20, color: isActive ? Colors.white : Colors.black)
                    : null,
                label: Text(key),
                selected: isActive,
                onSelected: (selected) {
                  filterNotifier.toggleFilter(filterState.mapFilterKeyToField(key));
                },
                selectedColor: Colors.red,
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(color: isActive ? Colors.white : Colors.black, fontSize: 12),
              ),
              if (activeFiltersCount > 0 && key == 'Filtros')
                Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '$activeFiltersCount',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ]
            ),
          );
        },
      ),
    );
  }

  bool _isFilterActive(FilterModel filter, String key) {
    switch (filter.mapFilterKeyToField(key)) {
      case 'comDesconto': return filter.comDesconto;
      case 'disponiveis': return filter.disponiveis;
      case 'hidro': return filter.hidro;
      case 'piscina': return filter.piscina;
      case 'sauna': return filter.sauna;
      case 'ofuro': return filter.ofuro;
      case 'decoracaoErotica': return filter.decoracaoErotica;
      case 'decoracaoTematica': return filter.decoracaoTematica;
      case 'cadeiraErotica': return filter.cadeiraErotica;
      case 'pistaDanca': return filter.pistaDanca;
      case 'garagemPrivativa': return filter.garagemPrivativa;
      case 'frigobar': return filter.frigobar;
      case 'internetWifi': return filter.internetWifi;
      case 'suiteFestas': return filter.suiteFestas;
      case 'suiteAcessibilidade': return filter.suiteAcessibilidade;
      default: return false;
    }
  }
}
