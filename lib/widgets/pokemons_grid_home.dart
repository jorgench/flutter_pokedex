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
  late ScrollController _controller;

  int _page = 0;
  final int _itemForPage = 20;
  bool _loadingServices = false;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        _callServices();
      }
      ;
    });

    _callServices();
  }

  _callServices() {
    if (!_loadingServices) {
      _loadingServices = true;
      getListOfPokemons(_itemForPage, _page * _itemForPage).then((value) {
        if (value?.results != null) {
          value!.results.forEach((element) {
            pokemons.add(element);
          });
        }
        _loadingServices = false;
        updateList();
      });

      _page++;
    }
  }

  updateList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        controller: _controller,
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
