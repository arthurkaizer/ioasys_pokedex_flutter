
import '../entities/pokemon_info_entity.dart';
import '../repositories/pokemon_info_repository_interface.dart';

abstract class IPokemonInfo {
  Future call(String value);
}

class PokemonInfo extends IPokemonInfo{
  final IPokemonInfoRepository _pokemonRepository;

  PokemonInfo({required IPokemonInfoRepository pokemonRepository}):_pokemonRepository = pokemonRepository;

  @override
  Future<PokemonInfoEntity> call(String value) async{
    var pokemonInfo = await _pokemonRepository.getPokemonInfo(value);
    return PokemonInfoEntity(id: pokemonInfo.id, name: pokemonInfo.name, imageUrl: pokemonInfo.imageUrl, type: pokemonInfo.type, atk: pokemonInfo.atk, def: pokemonInfo.def, height: pokemonInfo.height, hp: pokemonInfo.hp, moves1: pokemonInfo.moves1, moves2: pokemonInfo.moves2, satk: pokemonInfo.satk, sdef: pokemonInfo.sdef, spd: pokemonInfo.spd, weight: pokemonInfo.weight);
  }
}