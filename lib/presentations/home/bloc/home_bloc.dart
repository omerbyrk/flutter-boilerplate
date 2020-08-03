import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/blocs/utils/enums.dart';
import '../../../data/models/country_statistics_model.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with AppBlocBase {
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
  void toOnMessageState(String message, MessageType type) {
    this.add(HomeEvent(
        toState:
            HomeOnMessage.fromOldState(state, type: type, message: message)));
  }
}
