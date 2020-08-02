import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/bloc/base/bloc_base.dart';
import '../../../../core/bloc/base/bloc_state_base.dart';
import '../../../../core/bloc/utils/bloc_helpers.dart';
import '../../../../model/country_statistics.dart';
import 'index.dart';

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
