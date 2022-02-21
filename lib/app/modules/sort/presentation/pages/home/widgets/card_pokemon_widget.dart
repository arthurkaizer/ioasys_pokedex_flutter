import 'package:currency_converter/commonn/maps/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/pokemon_info_entity.dart';

class CardPokemonWidget extends StatelessWidget {
  final PokemonInfoEntity pokemonInfo;
  const CardPokemonWidget({Key? key, required this.pokemonInfo})
      : super(key: key);

  String idFormatter() {
    if (pokemonInfo.id.length == 1) {
      return '#00' + pokemonInfo.id;
    } else if (pokemonInfo.id.length == 2) {
      return '#0' + pokemonInfo.id;
    } else {
      return '#' + pokemonInfo.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = colorsMap[pokemonInfo.type];
    return GestureDetector(
      onTap: (){
        Modular.to.pushNamed('pokemon-infos',arguments: pokemonInfo);
      },
      child: Container(
        width: 104,
        height: 112,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(cardColor),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 88,
              height: 12,
              child: Text(
                idFormatter(),
                style: TextStyle(
                  fontSize: 8,
                  color: Color(cardColor),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.network(
                pokemonInfo.imageUrl,
                width: 72,
                height: 72,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 104,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(cardColor),
                ),
                child: Text(
                  pokemonInfo.name,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
