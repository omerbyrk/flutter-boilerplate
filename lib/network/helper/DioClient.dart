import 'package:covid19_app/network/network_consts.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _homeBlocSingleton = DioClient._internal();
  factory DioClient() {
    return _homeBlocSingleton;
  }
  DioClient._internal();

  Dio _dio;

  Dio get dio {
    if (_dio == null) {
      _dio = Dio();

      dio.options
        ..baseUrl = NetworkConsts.apiURL
        ..connectTimeout = NetworkConsts.apiTimeout //5s
        ..receiveTimeout = NetworkConsts.apiTimeout
        ..headers = {
          "x-rapidapi-host": NetworkConsts.apiHost,
          "x-rapidapi-key": NetworkConsts.apiKey
        };
    }

    return _dio;
  }
}
