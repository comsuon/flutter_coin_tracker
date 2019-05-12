import 'package:equatable/equatable.dart';

class CoinListResponse extends Equatable {
  final List<Coin> coinList;

  CoinListResponse({this.coinList}) : super([coinList]);

  static CoinListResponse fromJson(dynamic json) {
    final data = json['data'] as List;

    List<Coin> listCoin = [];

    //loop over each node in data list
    for (final node in data) {
      var coin = Coin.fromJson(node);
      listCoin.add(coin);
    }
    return CoinListResponse(coinList: listCoin);
  }
}

class Coin extends Equatable {
  final int id;
  final String name;
  final String symbol;

  Coin({this.id, this.name, this.symbol}) : super([id]);

  static Coin fromJson(dynamic json) {
    return Coin(
        id: json['id'] as int,
        name: json['name'] as String,
        symbol: json['symbol'] as String);
  }
}
