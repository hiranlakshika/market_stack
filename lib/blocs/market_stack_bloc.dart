import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../models/historical_data.dart';
import '../models/intra_day.dart';
import '../repository/market_stack_repository.dart';
import '../repository/remote_config_repository.dart';
import '../util/app_configs.dart';
import 'bloc_holder.dart';

class MarketStackBloc extends BlocBase {
  /* Repositories */
  final RemoteConfigRepository _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  final MarketStackRepository _marketStackRepository = GetIt.I<MarketStackRepository>();

  /* Rxdart objects */
  final _intraDaySubject = BehaviorSubject<IntraDay>();
  final _historicalDataSubject = BehaviorSubject<List<HistoricalData>>();

  /* Streams */
  Stream<IntraDay> get intraDayStream => _intraDaySubject.stream;

  Stream<List<HistoricalData>> get historicalDataStream => _historicalDataSubject.stream;

  Future<FirebaseRemoteConfig> initRemoteConfig() async => await _remoteConfigRepository.initRemoteConfig();

  @override
  void dispose() {
    _intraDaySubject.close();
    _historicalDataSubject.close();
  }

  getIntraDayResult({required final String date, required final String symbol}) async {
    final result = await _marketStackRepository.getIntraDayResult(date: date, symbol: symbol);
    if (result != null) {
      _intraDaySubject.sink.add(result);
    }
  }

  fetchHistoricalDataResult({required final String fromDate, required final String toDate}) async {
    List<HistoricalData> historicalDataList = [];
    for (String symbol in availableSymbols) {
      final result = await _marketStackRepository.getHistoricalData(fromDate: fromDate, toDate: toDate, symbol: symbol);
      if (result != null) {
        historicalDataList.add(result);
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }

    if (historicalDataList.isNotEmpty) _historicalDataSubject.sink.add(historicalDataList);
  }
}
