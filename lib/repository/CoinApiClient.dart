import 'dart:convert';

import 'package:coin_tracker/models/CoinModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CoinApiClient {
  final http.Client httpClient;

  static const CMC_BASE_URL =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/";
  static const API_KEY = "3888227d-f120-430a-8e16-39e6fb841006";

  static const COIN_ICON_BASE_URL =
      "https://s2.coinmarketcap.com/static/img/coins/32x32/";

  CoinApiClient({@required this.httpClient}) : assert(httpClient != null);

  Map<Object, String> _getHeaders() {
    return {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': API_KEY,
    };
  }

  Future<CoinListResponse> fetchCoinList(int start, int limit) async {
    final queryParams = {
      "start": start.toString(),
      "limit": limit.toString(),
      'convert': 'USD,BTC'
    };

    var uri = Uri.http(CMC_BASE_URL, "list/latest", queryParams);

    final response = await httpClient.get(uri, headers: _getHeaders());

    if (response.statusCode != 200) {
      throw Exception('Cannot fetching list');
    }

    final json = jsonDecode(response.body);
    return CoinListResponse.fromJson(json);
  }

}
