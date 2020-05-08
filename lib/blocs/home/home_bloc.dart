import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/common/bloc_bases.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';
import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/home/index.dart';
import 'package:covid19_app/model/CountryStatistics.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with StateChangerBlocBase {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  HomeBloc._internal();

  @override
  Future<void> close() async {
    await _homeBlocSingleton.close();
    await super.close();
  }

  @override
  HomeState get initialState => HomeStateInProgress(
      countryStatisticsList: <CountryStatistics>[],
      selectedCountryStatistics: null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  HomeStateOnMessage.fromOldState(state,
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }

  @override
  void toInProgressState() {
    this.add(
        HomeEvent(toState: HomeStateInProgress.fromOldState(state)));
  }

  @override
  void toLoaddedState() {
    this.add(HomeEvent(toState: HomeStateLoadded.fromOldState(state)));
  }

  @override
  void toOnMessageState(BlocOnMessageStateBase onMessageState) {
    this.add(HomeEvent(
        toState: HomeStateOnMessage.fromOldState(state,
            type: onMessageState.type, message: onMessageState.message)));
  }
}
