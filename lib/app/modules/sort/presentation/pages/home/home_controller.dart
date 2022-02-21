import '../../../domain/entities/pokemon_info_entity.dart';
import '../../../domain/usecases/pokemon_info.dart';

class HomeController{
  final IPokemonInfo _pokemonInfo;

  HomeController({required IPokemonInfo pokemonInfo}): _pokemonInfo = pokemonInfo;

  Future<PokemonInfoEntity> getPokemonInfo(String idPokemon) async{
    var result =  await _pokemonInfo.call(idPokemon);
    return result;
  }

  Future<List<PokemonInfoEntity>> getPokemonInfoList() async{
    List<PokemonInfoEntity> list = [];
    list.add(await _pokemonInfo.call('1'));
    list.add(await _pokemonInfo.call('2'));
    list.add(await _pokemonInfo.call('3'));
    list.add(await _pokemonInfo.call('4'));
    list.add(await _pokemonInfo.call('5'));
    list.add(await _pokemonInfo.call('6'));
    list.add(await _pokemonInfo.call('7'));
    list.add(await _pokemonInfo.call('8'));
    list.add(await _pokemonInfo.call('9'));    
    list.add(await _pokemonInfo.call('10'));
    return list;
  }
}