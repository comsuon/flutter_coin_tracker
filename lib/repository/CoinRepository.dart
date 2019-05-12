import 'package:coin_tracker/models/CoinModel.dart';
import 'package:meta/meta.dart';

import 'CoinApiClient.dart';

class CoinRepository {
  final CoinApiClient apiClient;

  CoinRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<CoinListResponse> fetchCoinList(int start, int limit) async {
    return apiClient.fetchCoinList(start, limit);
  }
}