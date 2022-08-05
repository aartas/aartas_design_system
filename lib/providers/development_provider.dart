// import 'package:flutter/material.dart';

// enum DevelopmentType { uat, redev, production }

// class DevelopmentProvider extends ChangeNotifier {
//   final String _redevURL =
//       "https://aartas-qaapp-as.azurewebsites.net/aartas_redev/public/api"; // REDEV TESTING URL

//   final String _uatURL =
//       "https://aartas-qaapp-as.azurewebsites.net/aartas_uat/public/api"; // UAT TESTING URL

//   final String _liveURL =
//       "https://aartas.com/v1/public/api"; // LIVE PRODUCTION URL

//   String _baseUrl = '';

//   setDevelopmentType(DevelopmentType _developmentType) async {
//     if (_developmentType == DevelopmentType.uat) {
//       _baseUrl = _uatURL;
//     }
//     if (_developmentType == DevelopmentType.redev) {
//       _baseUrl = _redevURL;
//     }
//     if (_developmentType == DevelopmentType.production) {
//       _baseUrl = _liveURL;
//     }
//     return _baseUrl = _uatURL;
//   }

//   getDevelopmentUrl() {
//     return _baseUrl;
//   }
// }
