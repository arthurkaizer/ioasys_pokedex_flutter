import 'package:currency_converter/app/modules/sort/domain/repositories/pokemon_info_repository_interface.dart';
import 'package:currency_converter/app/modules/sort/domain/usecases/pokemon_info.dart';
import 'package:currency_converter/app/modules/sort/infra/datasources/pokemon_info_datasource.dart';
import 'package:currency_converter/app/modules/sort/infra/repositories/datasources/pokemon_info_datasource_interface.dart';
import 'package:currency_converter/app/modules/sort/infra/repositories/pokemon_info_repository.dart';
import 'package:currency_converter/app/modules/sort/presentation/pages/pokemon_infos/pokemon_infos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../sort/presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_controller.dart';

class SortModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.factory<IPokemonInfoDataSource>((i) => PokemonInfoDatasource(httpClient: i())),
    Bind.factory<IPokemonInfoRepository>((i) => PokemonInfoRepository(pokemonInfoDataSource: i())),
    Bind.factory<IPokemonInfo>((i) => PokemonInfo(pokemonRepository: i())),
    Bind.factory((i) => HomeController(pokemonInfo: i(),))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/pokemon-infos', child: (context,args) => PokemonInfosPage(pokemonInfoEntity: args.data,)),
  ];
}