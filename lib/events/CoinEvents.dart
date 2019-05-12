import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoinEvent extends Equatable {
  CoinEvent([List props = const []]) : super(props);
}

class FetchCoin extends CoinEvent {
  final int start;
  final int limit;

  FetchCoin({@required this.start, @required this.limit})
      : assert(start != null && limit != null),
        super([start, limit]);
}
