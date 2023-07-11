import 'dart:io';

import 'package:flutter/material.dart';

class InternetConnection extends ChangeNotifier {
  bool isConnected = false;

  getConnectionStatus() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException {
      isConnected = false;
    }
  }
}
