

import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkService {
  static Connectivity? connectivity;

  Future<bool> isConnected() async {
    return Future.value(true);
  }

}
