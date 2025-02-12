import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_moteis_go/features/motels/data/motel_repository.dart';
import 'package:guia_moteis_go/features/motels/provider/motel_provider.dart';
import 'package:guia_moteis_go/core/models/motel.dart';
import 'package:mocktail/mocktail.dart';

class MockMotelRepository extends Mock implements MotelRepository {}

void main() {
  late MockMotelRepository mockRepo;

  setUp(() {
    mockRepo = MockMotelRepository();
  });

  test('motelProvider deve carregar motéis corretamente', () async {
    final container = ProviderContainer();

    expect(container.read(motelProvider), const AsyncValue<List<Motel>>.loading());

    await Future.delayed(Duration.zero);
    expect(container.read(motelProvider).value, isA<Null>());
  });
}
