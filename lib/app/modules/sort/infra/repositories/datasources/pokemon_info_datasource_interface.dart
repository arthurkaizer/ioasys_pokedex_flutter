
import '../models/pokemon_info_model.dart';

abstract class IPokemonInfoDataSource{
  Future<PokemonInfoModel> getPokemonInfo(String id);
}