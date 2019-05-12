import 'package:coin_tracker/blocs/CoinBloc.dart';
import 'package:coin_tracker/events/CoinEvents.dart';
import 'package:coin_tracker/models/CoinModel.dart';
import 'package:coin_tracker/repository/CoinRepository.dart';
import 'package:coin_tracker/states/CoinState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinList extends StatefulWidget {
  final CoinRepository coinRepo;

  CoinList({Key key, @required this.coinRepo})
      : assert(coinRepo != null),
        super(key: key);

  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
//  final data = <int>[1, 2, 3, 4, 5];

  CoinBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CoinBloc(coinRepository: widget.coinRepo);
    _bloc.dispatch(FetchCoin(start: 1, limit: 50));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (_, CoinState state) {
          if (state is CoinInitialState) {
            return Center(child: Text('No coin'));
          }
          if (state is CoinLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CoinLoadedState) {
            final coinList = state.coinList.coinList;
            return ListView.builder(
              itemCount: coinList.length,
              itemBuilder: (context, position) {
                final coin = coinList[position];
                return listItem(coin);
              },
              shrinkWrap: true,
            );
          }
          if (state is CoinErrorState) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          }
        },
      ),
    );
  }

  Card listItem(Coin coin) => Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
            splashColor: Colors.white12,
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                "${coin.name}",
                style: TextStyle(color: Colors.white),
              ),
            )),
        color: Colors.brown,
        elevation: 4,
      );
}
