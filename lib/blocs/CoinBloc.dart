import 'package:bloc/bloc.dart';
import 'package:coin_tracker/events/CoinEvents.dart';
import 'package:coin_tracker/models/CoinModel.dart';
import 'package:coin_tracker/repository/CoinRepository.dart';
import 'package:coin_tracker/states/CoinState.dart';
import 'package:meta/meta.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository coinRepository;

  CoinBloc({@required this.coinRepository}) : assert(coinRepository != null);

  @override
  CoinState get initialState => CoinInitialState();

  @override
  Stream<CoinState> mapEventToState(
      CoinState currentState, CoinEvent event) async* {
    if (event is FetchCoin) {
      yield CoinLoadingState();

      try {
        final CoinListResponse response =
            await coinRepository.fetchCoinList(event.start, event.limit);
        final CoinLoadedState newState = CoinLoadedState(coinList: response);
        yield newState;
      } catch (_) {
        print(_.toString());
        yield CoinErrorState();
      }
    }
  }
}
