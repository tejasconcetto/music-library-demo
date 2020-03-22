import 'dart:async';

import 'package:connectivity/connectivity.dart';

///
/// This class checks if device has internet connectivity or not
///
class NetworkManager {
  Connectivity connectivity = Connectivity();

  StreamController<bool> _networkStreamController =
      StreamController.broadcast();

  Stream get networkStream => _networkStreamController.stream;

  void initialiseNetworkManager() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isInternet = false;
    switch (result) {
      case ConnectivityResult.wifi:
        isInternet = true;
        break;
      case ConnectivityResult.mobile:
        isInternet = true;
        break;
      case ConnectivityResult.none:
        isInternet = false;
        break;
      default:
        isInternet = false;
        break;
    }
    _networkStreamController.sink.add(isInternet);
  }

  void disposeStream() => _networkStreamController.close();
}
