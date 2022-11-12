import 'dart:convert';

import 'package:http/http.dart' as http;

class CharacterService {
  CharacterService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String baseUrl = "rickandmortyapi.com";
  final String endPointsCharacters = "/api/character";
  final String endPointsCharactersSearch = "";

  Future<List<String>> GetCharacters() async {
    final uri = Uri.https(baseUrl, endPointsCharacters);
    http.Response response;
    List body;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw Exception();
    }
    try {
      body = jsonDecode(response.body)['results'] as List;
    } on Exception {
      throw Exception();
    }

    return body.map((title) => title.toString()).toList();
  }
}
