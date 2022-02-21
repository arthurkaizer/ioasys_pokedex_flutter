import 'package:currency_converter/app/modules/sort/domain/entities/pokemon_info_entity.dart';
import 'package:currency_converter/app/modules/sort/presentation/pages/pokemon_infos/widgets/base_stats_widget.dart';
import 'package:currency_converter/commonn/maps/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonInfosPage extends StatefulWidget {
  const PokemonInfosPage({Key? key, required this.pokemonInfoEntity})
      : super(key: key);
  final PokemonInfoEntity pokemonInfoEntity;

  @override
  _PokemonInfosPageState createState() => _PokemonInfosPageState();
}

class _PokemonInfosPageState extends State<PokemonInfosPage> {
  String idFormatter() {
    if (widget.pokemonInfoEntity.id.length == 1) {
      return '#00' + widget.pokemonInfoEntity.id;
    } else if (widget.pokemonInfoEntity.id.length == 2) {
      return '#0' + widget.pokemonInfoEntity.id;
    } else {
      return '#' + widget.pokemonInfoEntity.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorPokemon = Color(colorsMap[widget.pokemonInfoEntity.type]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemonInfoEntity.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorPokemon,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 42,
              child: Image.asset('assets/images/pokeball.png'),
            ),
            Positioned(
              top: 223,
              left: 8,
              child: Container(
                width: 376,
                height: 508,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 18.0),
                      child: Icon(
                        Icons.favorite,
                        color: Theme.of(context).colorScheme.primary,
                        size: 27.87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: colorPokemon,
                                    border: Border.all(color: colorPokemon),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Text(
                                    widget.pokemonInfoEntity.type,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/weight_icon.png',
                                        color: const Color(0xFF212121),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${(widget.pokemonInfoEntity.weight / 10)} kg'
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF212121),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFB2B2B2),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/scale_icon.png',
                                        color: const Color(0xFF212121),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${(widget.pokemonInfoEntity.weight / 10)} m'
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF212121),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFB2B2B2),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${(widget.pokemonInfoEntity.moves1)} / ${widget.pokemonInfoEntity.moves2}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF212121),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Text(
                                    'Moves',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFB2B2B2),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Base Stats',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(
                                      colorsMap[widget.pokemonInfoEntity.type]),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'HP'),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'ATK'),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'DEF'),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'SATK'),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'SDEF'),
                          BaseStatsWidget(pokemonInfoEntity: widget.pokemonInfoEntity, colorPokemon: colorPokemon, name: 'SPD'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 72,
              right: 114,
              child: SvgPicture.network(
                widget.pokemonInfoEntity.imageUrl,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
