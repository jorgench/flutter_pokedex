import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pokedex/theme/theme.dart';

class PokemonItemCard extends StatelessWidget {
  const PokemonItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
          width: 104.0,
          height: 108,
          color: colorCardSurface,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '#999',
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
                              'Pokemón Name',
                              style: textBody3.copyWith(color: colorBodyText),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Center(
                      child: FadeInImage(
                          placeholder: AssetImage('assets/pokemon_default.png'),
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png'),
                          height: 72,
                          width: 72,
                          fit: BoxFit.cover)),
                ],
              )
            ],
          )),
    );
  }
}
