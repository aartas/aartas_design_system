import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aartas_design_system/models/patient_vaccine_list_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/vaccine_brand_list_model.dart';
import 'package:aartas_design_system/models/vaccine_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class VaccinesProvider extends ChangeNotifier {
  final List<PatientVaccineListData> patientVaccineListData = [];

  Future<VaccineBrandList> getVaccineBrandList(
    String baseURL,
    String id,
  ) async {
    var _url = Uri.parse("$baseURL/get/vaccine/brands/list");
    final res = (await http.post(_url, body: {"vaccine_category_id": id})).body;
    log(res);
    return VaccineBrandList.fromJson(json.decode(res));
  }

  Future<VaccinesDetails> getVaccinesTable(
    String baseURL,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/get/vaccine/list");
    final res = (await http.post(_url)).body;
    return VaccinesDetails.fromJson(json.decode(res));
  }

  Future<PatientVaccineList> getPatientVaccineList(
    String baseURL,
    String patientId,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/patient/vaccine/list");
    final res = (await http.post(_url, body: {"patient_id": patientId})).body;
    return PatientVaccineList.fromJson(json.decode(res));
  }

  Future<ResponseModel> uploadVaccine(
    String baseURL,
    String appointmentId,
    String doctorId,
    String patientId,
    // String vaccineId,
    String vaccineBrandId,
    String inClinic,
    String vaccineCategoryId,
    String date,
    File label,
  ) async {
    // log("$appointmentId | $doctorId | $patientId | $vaccineBrandId | $inClinic | $vaccineCategoryId | $date | ${label.path}");
    var _url = Uri.parse("$baseURL/clinishare/save/appointment/vaccine");
    var request = http.MultipartRequest("POST", _url);
    request.fields['appointment_id'] = appointmentId;
    request.fields['doctor_id'] = doctorId;
    request.fields['patient_id'] = patientId;
    request.fields['vaccine_category_id'] = vaccineCategoryId;
    request.fields['vaccine_brands_id'] = vaccineBrandId;
    request.fields['in_clinic'] = inClinic;
    request.fields['date'] = date;
    var _file = label.existsSync()
        ? await http.MultipartFile.fromPath(
            "label",
            label.path,
            contentType: MediaType("image", "png"),
          )
        : null;

    label.existsSync() ? request.files.add(_file!) : null;

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var res = String.fromCharCodes(responseData);

    // setPatientVaccineListData(
    //   PatientVaccineListData(
    //     label: label.path,
    //     appointmentId: int.parse(appointmentId),
    //     doctorId: int.parse(doctorId),
    //     patientId: int.parse(patientId),
    //     // vaccineId: int.parse(vaccineId),
    //     vaccineBrandsId: int.parse(vaccineBrandId),
    //     inClinic: int.parse(inClinic),
    //     date: date,
    //   ),
    // );
    return ResponseModel.fromJson(json.decode(res));
  }
}
