import 'package:coin_tracker/models/CoinModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CoinState extends Equatable {
  CoinState([List props = const []]) : super(props);
}

class CoinInitialState extends CoinState {}

class CoinLoadingState extends CoinState {}

class CoinLoadedState extends CoinState {
  final CoinListResponse coinList;

  CoinLoadedState({@required this.coinList})
      : assert(coinList != null),
        super([coinList]);
}

class CoinErrorState extends CoinState {}