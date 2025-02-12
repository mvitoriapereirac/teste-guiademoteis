class FilterModel {
  final bool comDesconto;
  final bool disponiveis;
  final bool hidro;
  final bool piscina;
  final bool sauna;
  final bool ofuro;
  final bool decoracaoErotica;
  final bool decoracaoTematica;
  final bool cadeiraErotica;
  final bool pistaDanca;
  final bool garagemPrivativa;
  final bool frigobar;
  final bool internetWifi;
  final bool suiteFestas;
  final bool suiteAcessibilidade;

  FilterModel({
    this.comDesconto = false,
    this.disponiveis = false,
    this.hidro = false,
    this.piscina = false,
    this.sauna = false,
    this.ofuro = false,
    this.decoracaoErotica = false,
    this.decoracaoTematica = false,
    this.cadeiraErotica = false,
    this.pistaDanca = false,
    this.garagemPrivativa = false,
    this.frigobar = false,
    this.internetWifi = false,
    this.suiteFestas = false,
    this.suiteAcessibilidade = false,
  });

  // Getter para contar os filtros ativos
  int get activeFiltersCount {
    int count = 0;
    if (comDesconto) count++;
    if (disponiveis) count++;
    if (hidro) count++;
    if (piscina) count++;
    if (sauna) count++;
    if (ofuro) count++;
    if (decoracaoErotica) count++;
    if (decoracaoTematica) count++;
    if (cadeiraErotica) count++;
    if (pistaDanca) count++;
    if (garagemPrivativa) count++;
    if (frigobar) count++;
    if (internetWifi) count++;
    if (suiteFestas) count++;
    if (suiteAcessibilidade) count++;
    return count;
  }

   String mapFilterKeyToField(String key) {
    switch (key) {
      case 'Com desconto': return 'comDesconto';
      case 'Disponíveis': return 'disponiveis';
      case 'Hidro': return 'hidro';
      case 'Piscina': return 'piscina';
      case 'Sauna': return 'sauna';
      case 'Ofurô': return 'ofuro';
      case 'Decoração Erótica': return 'decoracaoErotica';
      case 'Decoração Temática': return 'decoracaoTematica';
      case 'Cadeira Erótica': return 'cadeiraErotica';
      case 'Pista de Dança': return 'pistaDanca';
      case 'Garagem Privativa': return 'garagemPrivativa';
      case 'Frigobar': return 'frigobar';
      case 'Internet Wi-Fi': return 'internetWifi';
      case 'Suíte para Festas': return 'suiteFestas';
      case 'Suíte com Acessibilidade': return 'suiteAcessibilidade';
      default: return '';
    }
  }

  FilterModel copyWith({
    bool? comDesconto,
    bool? disponiveis,
    bool? hidro,
    bool? piscina,
    bool? sauna,
    bool? ofuro,
    bool? decoracaoErotica,
    bool? decoracaoTematica,
    bool? cadeiraErotica,
    bool? pistaDanca,
    bool? garagemPrivativa,
    bool? frigobar,
    bool? internetWifi,
    bool? suiteFestas,
    bool? suiteAcessibilidade,
  }) {
    return FilterModel(
      comDesconto: comDesconto ?? this.comDesconto,
      disponiveis: disponiveis ?? this.disponiveis,
      hidro: hidro ?? this.hidro,
      piscina: piscina ?? this.piscina,
      sauna: sauna ?? this.sauna,
      ofuro: ofuro ?? this.ofuro,
      decoracaoErotica: decoracaoErotica ?? this.decoracaoErotica,
      decoracaoTematica: decoracaoTematica ?? this.decoracaoTematica,
      cadeiraErotica: cadeiraErotica ?? this.cadeiraErotica,
      pistaDanca: pistaDanca ?? this.pistaDanca,
      garagemPrivativa: garagemPrivativa ?? this.garagemPrivativa,
      frigobar: frigobar ?? this.frigobar,
      internetWifi: internetWifi ?? this.internetWifi,
      suiteFestas: suiteFestas ?? this.suiteFestas,
      suiteAcessibilidade: suiteAcessibilidade ?? this.suiteAcessibilidade,
    );
  }
}