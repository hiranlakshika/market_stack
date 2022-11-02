import 'package:get_it/get_it.dart';

import '../models/historical_data.dart';
import '../models/intra_day.dart';
import '../resources/market_stack_api_provider.dart';

class MarketStackRepository {
  final _apiProvider = GetIt.I<MarketStackApiProvider>();

  Future<IntraDay?> getIntraDayResult({required final String date, required final String symbol}) =>
      _apiProvider.getIntraDayResult(date: date, symbol: symbol);

  Future<HistoricalData?> getHistoricalData(
          {required final String fromDate, required final String toDate, required final String symbol}) =>
      _apiProvider.getHistoricalData(fromDate: fromDate, toDate: toDate, symbol: symbol);
}
