import 'dart:async';

import '../../../../core/bloc/base/bloc_event_base.dart';
import '../../../../model/country_statistics.dart';
import '../../../../network/providers/country_statistics_provider.dart';
import 'index.dart';

class HomeEvent extends BlocEventBase<HomeState, HomeBloc> {
  HomeEvent({HomeState toState}) : super(toState: toState);
}

class LoadCountryStatisticsList extends HomeEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgress.fromOldState(currentState);
    var countryStatisticsList = await CountryStatisticsProvider().getAll();
    var selectedCountryStatictics = countryStatisticsList
        .singleWhere((statictics) => statictics.countryName == "Turkey");
    yield HomeLoadded.fromOldState(currentState,
        countryStatisticsList: countryStatisticsList,
        selectedCountryStatistics: selectedCountryStatictics);
  }
}

class SelectCountryStatistics extends HomeEvent {
  final CountryStatistics countryStatistics;
  SelectCountryStatistics(this.countryStatistics);

  @override
  Stream<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgress.fromOldState(currentState);
    await Future.delayed(Duration(milliseconds: 500));
    yield HomeLoadded.fromOldState(currentState,
        selectedCountryStatistics: countryStatistics);
  }
}
