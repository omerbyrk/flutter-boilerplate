import 'dart:convert';

import 'package:covid19_app/model/CountryStatistics.dart';
import 'package:covid19_app/network/network_consts.dart';
import 'package:covid19_app/network/providers/ProviderBase.dart';

class CountryStatisticsProvider extends ProviderBase {
  Future<List<CountryStatistics>> getAll() async {
    return dio.get(NetworkConsts.casesByCountry).then((response) {
      var dataMap = jsonDecode(response.data);
      List listProp = List.of(dataMap["countries_stat"]);
      List<CountryStatistics> countryStatisticsList = List.of(listProp
          .map((countryStatistics) =>
              CountryStatistics.fromJson(countryStatistics))
          .cast<CountryStatistics>()
          .toList());
      return Future.value(countryStatisticsList);
    });
  }
}
