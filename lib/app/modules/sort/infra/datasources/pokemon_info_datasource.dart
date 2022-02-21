
import '../../../../../commonn/adapters/http_client/http_client_adapter.dart';
import '../repositories/datasources/pokemon_info_datasource_interface.dart';
import '../repositories/models/pokemon_info_model.dart';

class PokemonInfoDatasource extends IPokemonInfoDataSource{
  final IHttpClientAdapter _httpClient;

  PokemonInfoDatasource({required httpClient}):_httpClient = httpClient;

  @override
  Future<PokemonInfoModel> getPokemonInfo(String id) async{
    final response = await _httpClient.get('/pokemon/$id');
    var result = PokemonInfoModel.fromJson(response.data);
    return result;
  }

}