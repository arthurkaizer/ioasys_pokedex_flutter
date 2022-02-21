import 'package:flutter/material.dart';

import '../../../../domain/entities/pokemon_info_entity.dart';

class BaseStatsWidget extends StatelessWidget {
  final PokemonInfoEntity pokemonInfoEntity;
  final Color colorPokemon;
  final String name;
  const BaseStatsWidget(
      {Key? key,
      required this.pokemonInfoEntity,
      required this.colorPokemon,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = 0;
    switch (name) {
      case 'HP':
        value = pokemonInfoEntity.hp;
        break;
      case 'ATK':
        value = pokemonInfoEntity.atk;
        break;
      case 'DEF':
        value = pokemonInfoEntity.def;
        break;
      case 'SATK':
        value = pokemonInfoEntity.satk;
        break;
      case 'SDEF':
        value = pokemonInfoEntity.sdef;
        break;
      case 'SPD':
        value = pokemonInfoEntity.spd;
        break;
      default:
        value = 0;
    }
    return Row(
      children: [
        Container(
          width: 40,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: colorPokemon,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 27,
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF212121),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Flexible(
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: colorPokemon.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(colorPokemon),
          ),
        ),
      ],
    );
  }
}
