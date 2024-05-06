import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../apis/facts_api.dart';

class FactsNotifier extends StateNotifier<String> {
  final FactsApi _factApi;

  FactsNotifier({
    required FactsApi factApi,
  })  : _factApi = factApi,
        super('');

  Future<void> getCatFact() async {
    state = '';
    final fact = await _factApi.getCatFact();
    state = fact;
  }
}

// -----------------------------------------------------------------------------

final factsProvider = StateNotifierProvider<FactsNotifier, String>((ref) {
  final factApi = ref.watch(factsApiProvider);
  return FactsNotifier(
    factApi: factApi,
  );
});
