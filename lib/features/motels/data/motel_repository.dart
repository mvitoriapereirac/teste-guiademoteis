import 'package:guia_moteis_go/core/models/motel.dart';
import 'package:guia_moteis_go/core/api/api_service.dart';

class MotelRepository {
  final ApiService apiService;

  MotelRepository({required this.apiService});

  Future<List<Motel>> fetchMoteis() async {
    final data = await apiService.fetchData();
    return (data['data']['moteis'] as List).map((m) => Motel.fromJson(m)).toList();
  }
}
