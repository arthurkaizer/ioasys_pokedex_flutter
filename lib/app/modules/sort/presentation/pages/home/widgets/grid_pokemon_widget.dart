import 'package:currency_converter/app/modules/sort/domain/entities/pokemon_info_entity.dart';
import 'package:currency_converter/app/modules/sort/presentation/pages/home/widgets/card_pokemon_widget.dart';
import 'package:flutter/material.dart';

class GridPokemonWidget extends StatelessWidget {
  final List<PokemonInfoEntity> pokemons;
  const GridPokemonWidget({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: pokemons.length,
        itemBuilder: (BuildContext ctx, index) {
          return CardPokemonWidget(pokemonInfo: pokemons[index]);
        });
  }
}
