import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/filter_model.dart';

final filterProvider = StateNotifierProvider<FilterNotifier, FilterModel>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<FilterModel> {
  FilterNotifier() : super(FilterModel());

  void toggleFilter(String filterKey) {
    switch (filterKey) {
      case 'comDesconto':
        state = state.copyWith(comDesconto: !state.comDesconto);
        break;
      case 'disponiveis':
        state = state.copyWith(disponiveis: !state.disponiveis);
        break;
      case 'hidro':
        state = state.copyWith(hidro: !state.hidro);
        break;
      case 'piscina':
        state = state.copyWith(piscina: !state.piscina);
        break;
      case 'sauna':
        state = state.copyWith(sauna: !state.sauna);
        break;
      case 'ofuro':
        state = state.copyWith(ofuro: !state.ofuro);
        break;
      case 'decoracaoErotica':
        state = state.copyWith(decoracaoErotica: !state.decoracaoErotica);
        break;
      case 'decoracaoTematica':
        state = state.copyWith(decoracaoTematica: !state.decoracaoTematica);
        break;
      case 'cadeiraErotica':
        state = state.copyWith(cadeiraErotica: !state.cadeiraErotica);
        break;
      case 'pistaDanca':
        state = state.copyWith(pistaDanca: !state.pistaDanca);
        break;
      case 'garagemPrivativa':
        state = state.copyWith(garagemPrivativa: !state.garagemPrivativa);
        break;
      case 'frigobar':
        state = state.copyWith(frigobar: !state.frigobar);
        break;
      case 'internetWifi':
        state = state.copyWith(internetWifi: !state.internetWifi);
        break;
      case 'suiteFestas':
        state = state.copyWith(suiteFestas: !state.suiteFestas);
        break;
      case 'suiteAcessibilidade':
        state = state.copyWith(suiteAcessibilidade: !state.suiteAcessibilidade);
        break;
      default:
        break;
    }
  }
}
