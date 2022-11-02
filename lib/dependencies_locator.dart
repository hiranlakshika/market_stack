import 'package:get_it/get_it.dart';

import 'blocs/market_stack_bloc.dart';
import 'repository/remote_config_repository.dart';
import 'resources/remote_config_provider.dart';

injectDependencies() {
  //Api Provider
  GetIt.I.registerLazySingleton(() => RemoteConfigProvider());

  // Repositories
  GetIt.I.registerLazySingleton(() => RemoteConfigRepository());

  // Singleton Blocs
  GetIt.I.registerLazySingleton(() => MarketStackBloc());
}
