import 'dart:convert';

import 'package:flutter_pokedex/services/models/pokemons.dart';
import 'package:http/http.dart' as http;

String _baseURL = 'pokeapi.co';

Future<PokemonsList?> getListOfPokemons(int limit, int offset) async {
  final url = Uri.https(_baseURL, '/api/v2/pokemon',
      {'limit': limit.toString(), 'offset': offset.toString()});

  final response = await http.get(url);
  return PokemonsList.fromJson(json.decode(response.body));
}
