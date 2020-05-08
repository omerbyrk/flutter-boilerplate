import 'package:covid19_app/blocs/common/bloc_state_bases.dart';
import 'package:covid19_app/blocs/common/enums.dart';
import 'package:covid19_app/model/CountryStatistics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HomeState extends Equatable {
  final List<CountryStatistics> countryStatisticsList;
  final CountryStatistics selectedCountryStatistics;
  const HomeState({this.countryStatisticsList, this.selectedCountryStatistics});

  @override
  List<Object> get props =>
      ([countryStatisticsList, selectedCountryStatistics]);
}

@immutable
class HomeStateInProgress extends HomeState with BlocInProgressStateBase {
  const HomeStateInProgress({countryStatisticsList, selectedCountryStatistics})
      : super(
            countryStatisticsList: countryStatisticsList,
            selectedCountryStatistics: selectedCountryStatistics);

  HomeStateInProgress.fromOldState(HomeState oldState,
      {List<CountryStatistics> countryStatisticsList,
      CountryStatistics selectedCountryStatistics})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        );
}

@immutable
class HomeStateLoadded extends HomeState {
  HomeStateLoadded.fromOldState(HomeState oldState,
      {List<CountryStatistics> countryStatisticsList,
      CountryStatistics selectedCountryStatistics})
      : super(
          countryStatisticsList:
              countryStatisticsList ?? oldState.countryStatisticsList,
          selectedCountryStatistics:
              selectedCountryStatistics ?? oldState.selectedCountryStatistics,
        );
}

@immutable
class HomeStateOnMessage extends HomeState with BlocOnMessageStateBase {
  HomeStateOnMessage.fromOldState(HomeState oldState,
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



