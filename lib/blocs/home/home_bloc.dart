import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/blocs/common/bloc_bases.dart';
import 'package:covid19_app/blocs/common/bloc_helpers.dart';
import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/home/index.dart';
import 'package:covid19_app/model/CountryStatistics.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with StateChangerBlocBase {
  HomeBloc() : super(HomeInProgress(
      countryStatisticsList: <CountryStatistics>[],
      selectedCountryStatistics: null));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this).transform(
          StreamTransformer.fromHandlers(
            handleError: BlocHelpers(
              blocOnMessageStateCreator: (message, type) =>
                  HomeOnMessage.fromOldState(state,
                      message: message, type: type),
            ).transformStreamErrors,
          ),
        );
  }

  @override
  void toInProgressState() {
    this.add(
        HomeEvent(toState: HomeInProgress.fromOldState(state)));
  }

  @override
  void toLoaddedState() {
    this.add(HomeEvent(toState: HomeLoadded.fromOldState(state)));
  }

  @override
  void toOnMessageState(BlocOnMessageStateBase onMessageState) {
    this.add(HomeEvent(
        toState: HomeOnMessage.fromOldState(state,
            type: onMessageState.type, message: onMessageState.message)));
  }
}
