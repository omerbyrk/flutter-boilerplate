import 'package:covid19_app/network/helper/dio_client.dart';
import 'package:dio/dio.dart';

abstract class ProviderBase {
  DioClient _dioClient = DioClient();


  Dio get dio {
    return _dioClient.dio;
  }
}
