import 'package:get_it/get_it.dart';

import 'blocs/market_stack_bloc.dart';
import 'repository/market_stack_repository.dart';
import 'repository/remote_config_repository.dart';
import 'resources/market_stack_api_provider.dart';
import 'resources/remote_config_provider.dart';

injectDependencies() {
  //Api Provider
  GetIt.I.registerLazySingleton(() => RemoteConfigProvider());
  GetIt.I.registerLazySingleton(() => MarketStackApiProvider());

  // Repositories
  GetIt.I.registerLazySingleton(() => RemoteConfigRepository());
  GetIt.I.registerLazySingleton(() => MarketStackRepository());

  // Singleton Blocs
  GetIt.I.registerLazySingleton(() => MarketStackBloc());
}
