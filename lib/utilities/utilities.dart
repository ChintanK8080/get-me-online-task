import 'package:connectivity_plus/connectivity_plus.dart';

class Utilty {
  static Future<bool> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    return false;
  }
}
