import 'package:covid19_app/data/network/network_consts.dart';
import 'package:dio/dio.dart';

import 'common/../dio_client.dart';

abstract class ApiDataSourceBase {
  DioClient _dioClient = DioClient();

  Dio get dio {
    return _dioClient.dio;
  }

  EndPoints get endPoints => NetworkConsts.endPoints;
}
