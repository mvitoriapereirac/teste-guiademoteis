import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_moteis_go/core/api/api_service.dart';
import 'package:guia_moteis_go/core/models/motel.dart';
import 'package:guia_moteis_go/features/motels/data/motel_repository.dart';

final apiService = ApiService();
final motelRepositoryProvider = Provider((ref) => MotelRepository(apiService: apiService));

final motelProvider = FutureProvider<List<Motel>>((ref) async {
  final repository = ref.watch(motelRepositoryProvider);
  return repository.fetchMoteis();
});
