class IntraDay {
  final Pagination? pagination;
  final List<Data>? data;

  IntraDay({
    this.pagination,
    this.data,
  });

  IntraDay.fromJson(Map<String, dynamic> json)
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
  final dynamic last;
  final dynamic close;
  final dynamic volume;
  final String? date;
  final String? symbol;
  final String? exchange;

  Data({
    this.open,
    this.high,
    this.low,
    this.last,
    this.close,
    this.volume,
    this.date,
    this.symbol,
    this.exchange,
  });

  Data.fromJson(Map<String, dynamic> json)
      : open = json['open'] as double?,
        high = json['high'] as double?,
        low = json['low'] as double?,
        last = json['last'],
        close = json['close'],
        volume = json['volume'],
        date = json['date'] as String?,
        symbol = json['symbol'] as String?,
        exchange = json['exchange'] as String?;

  Map<String, dynamic> toJson() => {
        'open': open,
        'high': high,
        'low': low,
        'last': last,
        'close': close,
        'volume': volume,
        'date': date,
        'symbol': symbol,
        'exchange': exchange
      };
}
