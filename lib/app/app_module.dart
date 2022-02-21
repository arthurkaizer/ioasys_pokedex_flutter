import 'package:currency_converter/app/modules/sort/sort_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../commonn/adapters/http_client/dio/dio_adapter.dart';
import '../commonn/adapters/http_client/dio/interceptors/dio_interceptors.dart';
import '../commonn/adapters/http_client/http_client_adapter.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module{
  @override
  final List<Bind> binds = [
    Bind.factory<IHttpClientAdapter>((i) => DioAdapter(
          dio: i(),
          interceptors: [
            i<CustomInterceptors>(),
          ],
        )),
    Bind.factory<CustomInterceptors>((i) => CustomInterceptors()),
    Bind.factory((i) => Dio(i())),
    Bind.factory<BaseOptions>(((i) => BaseOptions(baseUrl:'https://pokeapi.co/api/v2'))),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/sort', module: SortModule()),
  ];
}