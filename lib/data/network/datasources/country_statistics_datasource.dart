import 'dart:convert';

import 'package:covid19_app/data/exceptions/remote_server_exception.dart';
import 'package:covid19_app/core/exceptions/failure.dart';

import '../api_datasource_base.dart';
import '../../models/country_statistics_model.dart';
import '../network_consts.dart';

class CountryStatisticsDataSource extends ApiDataSourceBase {
  Future<List<CountryStatisticsModel>> getAll() async {
    try {
      var response = await dio.get(NetworkConsts.casesByCountry);
      var dataMap = jsonDecode(response.data);
      List listProp = List.of(dataMap["countries_stat"]);
      List<CountryStatisticsModel> countryStatisticsList = List.of(listProp
          .map((countryStatistics) =>
              CountryStatisticsModel.fromJson(countryStatistics))
          .cast<CountryStatisticsModel>()
          .toList());
      return countryStatisticsList;
    } catch (err) {
      throw RemoteServerException(message: err.toString());
    }
  }
}
