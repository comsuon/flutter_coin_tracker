import 'package:coin_tracker/repository/CoinApiClient.dart';
import 'package:coin_tracker/repository/CoinRepository.dart';
import 'package:coin_tracker/widgets/CoinListWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final CoinRepository coinRepo =
      CoinRepository(apiClient: CoinApiClient(httpClient: http.Client()));
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: CoinList(coinRepo: coinRepo),
      ),
    );
  }

//  @override
//  _MyHomePageState createState() => _MyHomePageState();
}

/*class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      )
    );
  }
}
*/
