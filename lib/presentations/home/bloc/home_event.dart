import 'dart:async';

import 'package:covid19_app/core/blocs/bases/bloc_event_base.dart';
import 'package:covid19_app/data/models/country_statistics_model.dart';
import 'package:covid19_app/data/network/datasources/country_statistics_datasource.dart';

import 'index.dart';

class HomeEvent extends BlocEventBase<HomeState, HomeBloc> {
  HomeEvent({HomeState toState}) : super(toState: toState);
}

class LoadCountryStatisticsList extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgress.fromOldState(currentState);
    var countryStatisticsList = await CountryStatisticsDataSource().getAll();
    var selectedCountryStatictics = countryStatisticsList
        .singleWhere((statictics) => statictics.countryName == "Turkey");
    yield HomeLoadded.fromOldState(currentState,
        countryStatisticsList: countryStatisticsList,
        selectedCountryStatistics: selectedCountryStatictics);
  }
}

class SelectCountryStatistics extends HomeEvent {
  final CountryStatisticsModel countryStatistics;
  SelectCountryStatistics(this.countryStatistics);

  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield HomeInProgress.fromOldState(currentState);
    await Future.delayed(Duration(milliseconds: 500));
    yield HomeLoadded.fromOldState(currentState,
        selectedCountryStatistics: countryStatistics);
  }
}
