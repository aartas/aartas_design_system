import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnection extends ChangeNotifier {
  bool isConnected = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  initializeInternetConnectionListener() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        isConnected = false;
        notifyListeners();
      } else {
        _getConnectionStatus();
      }
    });
  }

  _getConnectionStatus() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        isConnected = true;
        notifyListeners();
      }
    } on SocketException {
      isConnected = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    if (_connectivitySubscription != null) {
      _connectivitySubscription?.cancel();
    }
    super.dispose();
  }
}
