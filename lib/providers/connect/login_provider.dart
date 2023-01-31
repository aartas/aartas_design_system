
// class ConnectAuthProvider {
//     PatientData _patientData = PatientData();
//   List<PatientData> _patientList = [];

//   PatientData getData() {
//     return _patientData;
//   }

//   List<PatientData> getList() {
//     return _patientList;
//   }

//   Future<PatientResponse> fetchData(
//     String baseURL,
//     String? phoneNumber,
//   ) async {
//     var _url = Uri.parse("$baseURL/login");
//     final res = await http.post(_url, body: {"phone_number": phoneNumber});
//     String _message = "(${res.statusCode}) $_url";
//     log(_message);

//     if (res.statusCode == 200 && json.decode(res.body)['status']) {
//       var _res = PatientResponse.fromJson(json.decode(res.body));
//       _patientData = _res.data!.first;
//       notifyListeners();
//       return _res;
//     } else {
//       notifyListeners();
//       log(res.body);
//       return PatientResponse(message: json.decode(res.body)['message']);
//     }
//   }

// }