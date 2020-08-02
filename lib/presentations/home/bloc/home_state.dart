import 'package:covid19_app/core/blocs/bases/bloc_state_base.dart';
import 'package:covid19_app/core/blocs/utils/enums.dart';
import 'package:covid19_app/data/models/country_statistics_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


abstract class HomeState extends Equatable {
  final List<CountryStatisticsModel> countryStatisticsList;
  final CountryStatisticsModel selectedCountryStatistics;
  const HomeState({this.countryStatisticsList, this.selectedCountryStatistics});

  @override
  List<Object> get props =>
      ([countryStatisticsList, selectedCountryStatistics]);
}

class HomeInProgress extends HomeState with BlocInProgressStateBase {
  const HomeInProgress({countryStatisticsList, selectedCountryStatistics})
      : super(
            countryStatisticsList: countryStatisticsList,
            selectedCountryStatistics: selectedCountryStatistics);

  HomeInProgress.fromOldState(HomeState oldState,
      {List<CountryStatisticsModel> countryStatisticsList,
      CountryStatisticsModel selectedCountryStatistics})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        );
}

class HomeLoadded extends HomeState {
  HomeLoadded.fromOldState(HomeState oldState,
      {List<CountryStatisticsModel> countryStatisticsList,
      CountryStatisticsModel selectedCountryStatistics})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        );
}

// ignore: must_be_immutable
class HomeOnMessage extends HomeState with BlocOnMessageStateBase {
  HomeOnMessage.fromOldState(HomeState oldState,
      {List<CountryStatisticsModel> countryStatisticsList,
      CountryStatisticsModel selectedCountryStatistics,
      @required String message,
      type = MessageType.INFO})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        ) {
    this.message = message;
    this.type = type;
  }
}



