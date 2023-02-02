import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pokedex/services/models/pokemons.dart';
import 'package:flutter_pokedex/theme/theme.dart';

class PokemonItemCard extends StatelessWidget {
  const PokemonItemCard({Key? key, required this.pokemon}) : super(key: key);

  final ResultPokemonListItem pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
            width: 104.0,
            height: 108,
            decoration: BoxDecoration(color: colorCardSurface, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5)),
              BoxShadow(
                  color: Colors.grey.shade900,
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: const Offset(0, 10))
            ]),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '#${pokemon.pokemonNumber}',
                      style: textCaption.copyWith(color: colorCardText),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 36,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadiusDirectional.only(
                              topStart: Radius.circular(8),
                              topEnd: Radius.circular(8)),
                          child: Container(
                            color: colorBodySurface,
                            width: 104,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24, bottom: 4, left: 8, right: 8),
                              child: Text(
                                pokemon.name,
                                style: textBody3.copyWith(color: colorBodyText),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                        child: FadeInImage(
                            placeholder:
                                AssetImage('assets/pokemon_default.png'),
                            image: NetworkImage(pokemon.pokemonSprite),
                            height: 72,
                            width: 72,
                            fit: BoxFit.cover)),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
