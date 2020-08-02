import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:covid19_app/model/CountryStatistics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class HomeState extends Equatable {
  final List<CountryStatistics> countryStatisticsList;
  final CountryStatistics selectedCountryStatistics;
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
      {List<CountryStatistics> countryStatisticsList,
      CountryStatistics selectedCountryStatistics})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        );
}

class HomeLoadded extends HomeState {
  HomeLoadded.fromOldState(HomeState oldState,
      {List<CountryStatistics> countryStatisticsList,
      CountryStatistics selectedCountryStatistics})
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
      {List<CountryStatistics> countryStatisticsList,
      CountryStatistics selectedCountryStatistics,
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



