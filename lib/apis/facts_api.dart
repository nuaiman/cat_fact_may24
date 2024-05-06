import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class IFactsApi {
  Future<String> getCatFact();
}
// -----------------------------------------------------------------------------

class FactsApi implements IFactsApi {
  @override
  Future<String> getCatFact() async {
    const url = 'https://catfact.ninja/fact';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String catfact = json.decode(response.body)["fact"];
      return catfact;
    } else {
      throw Exception('Failed to load fact details');
    }
  }
}
// -----------------------------------------------------------------------------

final factsApiProvider = Provider<FactsApi>((ref) {
  return FactsApi();
});
