import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/data/models/country_statistics_model.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/blocs/bases/bloc_state_base.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with StateChangerBlocBase {
  HomeBloc()
      : super(HomeInProgress(
            countryStatisticsList: <CountryStatisticsModel>[],
            selectedCountryStatistics: null));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }

  @override
  void toInProgressState() {
    this.add(HomeEvent(toState: HomeInProgress.fromOldState(state)));
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
