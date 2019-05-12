import 'package:flutter/material.dart';

class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  final data = <int>[1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, position) {
        return listItem(position);
      },
      shrinkWrap: true,
    );
  }

  Card listItem(int pos) => Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
            splashColor: Colors.white12,
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                "Item ${pos + 1}",
                style: TextStyle(color: Colors.white),
              ),
            )),
        color: Colors.brown,
        elevation: 4,
      );
}
