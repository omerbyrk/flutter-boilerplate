import 'package:connectivity/connectivity.dart';

class ConnectivityUtils {
  final Connectivity connectivity;

  ConnectivityUtils({this.connectivity});

  Future<bool> get isDeviceOnline async =>
      ConnectivityResult.none != await connectivity.checkConnectivity();
}
