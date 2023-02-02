import 'dart:convert';

PokemonsList pokemonsListFromJson(String str) =>
    PokemonsList.fromJson(json.decode(str));

class PokemonsList {
  PokemonsList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  String? next;
  String? previous;
  List<ResultPokemonListItem> results;

  factory PokemonsList.fromJson(Map<String, dynamic> json) => PokemonsList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultPokemonListItem>.from(
            json["results"].map((x) => ResultPokemonListItem.fromJson(x))),
      );
}

class ResultPokemonListItem {
  ResultPokemonListItem({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  String get pokemonNumber {
    var splitPokemon = url.split('/');
    String idPokemon = splitPokemon[splitPokemon.length - 2];
    return idPokemon;
  }

  String get pokemonSprite {
    try {
      return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonNumber.png';
    } catch (e) {
      return '';
    }
  }

  factory ResultPokemonListItem.fromJson(Map<String, dynamic> json) =>
      ResultPokemonListItem(
        name: json["name"],
        url: json["url"],
      );
}
