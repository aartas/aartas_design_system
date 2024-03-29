// import 'dart:convert';
// import 'dart:developer';

// import 'package:aartas_design_system/models/confirm_appointment_model.dart';
// import 'package:aartas_design_system/models/unconfirmed_appointment_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class BookAppointmentProvider extends ChangeNotifier {
//   Future<UnconfirmedAppointment> unconfirmedAppointment(
//     String baseURL,
//     String? patientId,
//     String? doctorId,
//     String? slotId,
//   ) async {
//     var _url = Uri.parse("$baseURL/book/appointment");
//     log("Unconfirm Appointment: $patientId, $doctorId, $slotId");
//     final res = (await http.post(_url, body: {
//       "doctor_id": doctorId ?? '',
//       "patient_id": patientId ?? '',
//       "timeslot_id": slotId ?? ''
//     }))
//         .body;

//     log("Network:${json.decode(res)['message']}");
//     notifyListeners();
//     return UnconfirmedAppointment.fromJson(json.decode(res));
//   }

//   Future<ConfirmAppointment> confirmedAppointment(
//     String baseURL,
//     String? appointmentId,
//     String? couponId,
//     String? bundleId,
//     String? rewardAmount,
//   ) async {
//     var _url = Uri.parse("$baseURL/confirm/appointment");
//     final res = (await http.post(_url, body: {
//       "appointment_id": appointmentId ?? "",
//       "coupon_id": couponId ?? "",
//       "bundle_id": bundleId ?? "",
//       "reward_points": rewardAmount ?? ""
//     }))
//         .body;

//     log("Network:$res");
//     notifyListeners();
//     return ConfirmAppointment.fromJson(json.decode(res));
//   }

//   Future rescheduleAppointment(
//     String baseURL,
//     String? appointmentId,
//     String? timeslotId,
//   ) async {
//     var _url = Uri.parse("$baseURL/reschedule/appointment");
//     final res = (await http.post(_url, body: {
//       "appointment_id": appointmentId ?? '',
//       "timeslot_id": timeslotId ?? '',
//     }))
//         .body;

//     log("Network:${json.decode(res)['message']}");
//     notifyListeners();
//     return json.decode(res);
//   }

//   Future cancelAppointment(
//     String baseURL,
//     String? appointmentId,
//   ) async {
//     var _url = Uri.parse("$baseURL/cancel/appointment");
//     final res = (await http.post(_url, body: {
//       "appointment_id": appointmentId ?? '',
//     }))
//         .body;

//     log("Network:${json.decode(res)['message']}");
//     notifyListeners();
//     return json.decode(res);
//   }
// }
