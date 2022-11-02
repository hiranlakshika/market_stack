import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';

import '../repository/remote_config_repository.dart';
import 'bloc_holder.dart';

class MarketStackBloc extends BlocBase {
  /* Repositories */
  final RemoteConfigRepository _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();

  Future<FirebaseRemoteConfig> initRemoteConfig() async => await _remoteConfigRepository.initRemoteConfig();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
