import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/components.dart';
import 'package:flutter_pokedex/theme/theme.dart';
import 'package:flutter_pokedex/widgets/pokemons_grid_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBodySurface,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: colorMain,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: PokemonsGridHome(),
            ),
          ],
        ));
  }
}
