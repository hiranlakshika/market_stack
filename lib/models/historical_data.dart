class HistoricalData {
  final Pagination? pagination;
  final List<Data>? data;

  HistoricalData({
    this.pagination,
    this.data,
  });

  HistoricalData.fromJson(Map<String, dynamic> json)
      : pagination = (json['pagination'] as Map<String, dynamic>?) != null
            ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
            : null,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'pagination': pagination?.toJson(), 'data': data?.map((e) => e.toJson()).toList()};
}

class Pagination {
  final int? limit;
  final int? offset;
  final int? count;
  final int? total;

  Pagination({
    this.limit,
    this.offset,
    this.count,
    this.total,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : limit = json['limit'] as int?,
        offset = json['offset'] as int?,
        count = json['count'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {'limit': limit, 'offset': offset, 'count': count, 'total': total};
}

class Data {
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final int? volume;
  final double? adjHigh;
  final double? adjLow;
  final double? adjClose;
  final double? adjOpen;
  final int? adjVolume;
  final int? splitFactor;
  final int? dividend;
  final String? symbol;
  final String? exchange;
  final String? date;

  Data({
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.adjHigh,
    this.adjLow,
    this.adjClose,
    this.adjOpen,
    this.adjVolume,
    this.splitFactor,
    this.dividend,
    this.symbol,
    this.exchange,
    this.date,
  });

  Data.fromJson(Map<String, dynamic> json)
      : open = json['open'] as double?,
        high = json['high'] as double?,
        low = json['low'] as double?,
        close = json['close'] as double?,
        volume = json['volume'] as int?,
        adjHigh = json['adj_high'] as double?,
        adjLow = json['adj_low'] as double?,
        adjClose = json['adj_close'] as double?,
        adjOpen = json['adj_open'] as double?,
        adjVolume = json['adj_volume'] as int?,
        splitFactor = json['split_factor'] as int?,
        dividend = json['dividend'] as int?,
        symbol = json['symbol'] as String?,
        exchange = json['exchange'] as String?,
        date = json['date'] as String?;

  Map<String, dynamic> toJson() => {
        'open': open,
        'high': high,
        'low': low,
        'close': close,
        'volume': volume,
        'adj_high': adjHigh,
        'adj_low': adjLow,
        'adj_close': adjClose,
        'adj_open': adjOpen,
        'adj_volume': adjVolume,
        'split_factor': splitFactor,
        'dividend': dividend,
        'symbol': symbol,
        'exchange': exchange,
        'date': date
      };
}
