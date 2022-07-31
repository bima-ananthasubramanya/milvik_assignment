import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkService {
  static Connectivity? connectivity;

  Future<bool> isConnected() async {
  //   try {
  //     var connectionResult = await connectivity?.checkConnectivity();
  //     if (connectionResult == ConnectivityResult.mobile ||
  //         connectionResult == ConnectivityResult.wifi) {
  //       return Future.value(true);
  //     }
  //     return Future.value(false);
  //   } on SocketException {
  //     return Future.value(false);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('isConnected: $e');
  //     }
  //     return Future.value(false);
  //   }
    return Future.value(true);
  }

}
