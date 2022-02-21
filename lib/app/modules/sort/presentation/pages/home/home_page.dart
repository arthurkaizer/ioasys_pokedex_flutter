import 'package:currency_converter/app/modules/sort/presentation/pages/home/widgets/grid_pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_controller.dart';
import '../../../domain/entities/pokemon_info_entity.dart';
import 'widgets/card_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  bool _switchValue = true;
  final pokemonInfoController = Modular.get<HomeController>();
  List<PokemonInfoEntity> pokemonList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 17,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(48, 50, 32, 51)),
              Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).colorScheme.primary,
                width: 27,
                height: 21,
              ),
              const SizedBox(width: 13),
              const Text(
                'ioasys pokédex',
                style: TextStyle(
                    color: Color(0xFFEC0344),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xFF666666),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Buscar',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: ('Buscar pokemon'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 22.55,),
                Icon(Icons.favorite,color: Theme.of(context).colorScheme.primary,),
              ],
            ),
          ),
          FutureBuilder<List<PokemonInfoEntity>>(
            future: pokemonInfoController.getPokemonInfoList(),
            builder: (context, snapshot) {
            switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return const Center(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 50),child: CircularProgressIndicator(),),
              );
            case ConnectionState.none:
              return const Text('=(');
            default:
            if(snapshot.hasData){
              return GridPokemonWidget(pokemons: snapshot.data as List<PokemonInfoEntity>);
              //return CardPokemonWidget(pokemonInfo: snapshot.data as PokemonInfoEntity);
            }else{
              if(snapshot.error is Exception){
                return const Text('Erro na requisição da API');
              }else{
                return const Text('Outro problema');
              }
            }
          }
          }),
          ],
      ),
    );
  }
}
