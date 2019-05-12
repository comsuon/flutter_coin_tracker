import 'package:coin_tracker/models/CoinModel.dart';
import 'package:flutter/material.dart';

const COIN_ICON_BASE_URL =
    "https://s2.coinmarketcap.com/static/img/coins/32x32";

class CoinItemWidget extends StatelessWidget {
  final int pos;
  final Coin coin;

  CoinItemWidget({Key key, @required this.pos, @required this.coin})
      : assert(coin != null && pos != null),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          splashColor: Colors.white12,
          onTap: () {},
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    '$COIN_ICON_BASE_URL/${coin.id}.png',
                    height: 44,
                    width: 44,
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('${coin.name}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Text('Rank #${pos + 1}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white)),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 8),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text('\$${coin.price.toStringAsFixed(3)}',
                          style: TextStyle(color: Colors.white)))
                ],
              )),
        ),
        color: Colors.brown,
        elevation: 4,
      );
}