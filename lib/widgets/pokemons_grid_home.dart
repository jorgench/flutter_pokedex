import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pokedex/services/models/pokemons.dart';
import 'package:flutter_pokedex/services/pokemons.dart';
import 'package:flutter_pokedex/widgets/pokemon_item_card.dart';

class PokemonsGridHome extends StatefulWidget {
  PokemonsGridHome({super.key});

  @override
  State<PokemonsGridHome> createState() => _PokemonsGridHomeState();
}

class _PokemonsGridHomeState extends State<PokemonsGridHome> {
  List<ResultPokemonListItem> pokemons = [];

  @override
  void initState() {
    super.initState();

    getListOfPokemons(50, 0).then((value) {
      print(value);
      if (value?.results != null) {
        value!.results.forEach((element) {
          pokemons.add(element);
        });
      }
      updateList();
    });
  }

  updateList() {
    print('update list');
    print('list length ${pokemons.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 3 / 3.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: this.pokemons.length,
        itemBuilder: (BuildContext ctx, index) {
          return Center(
            child: PokemonItemCard(
              pokemon: this.pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
