import '../entities/pokemon_info_entity.dart';

abstract class IPokemonInfoRepository{
   Future<PokemonInfoEntity> getPokemonInfo(String id);
}