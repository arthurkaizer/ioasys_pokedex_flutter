
import '../../domain/repositories/pokemon_info_repository_interface.dart';
import 'datasources/pokemon_info_datasource_interface.dart';
import 'models/pokemon_info_model.dart';

class PokemonInfoRepository extends IPokemonInfoRepository{
  final IPokemonInfoDataSource _pokemonInfoDataSource;

  PokemonInfoRepository({required IPokemonInfoDataSource pokemonInfoDataSource}):_pokemonInfoDataSource = pokemonInfoDataSource;

  @override
  Future<PokemonInfoModel> getPokemonInfo(String id) async{
    final result = await _pokemonInfoDataSource.getPokemonInfo(id);

    return result;
  }

}