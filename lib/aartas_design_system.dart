library aartas_design_system;

import 'package:aartas_design_system/apis/authentication_apis.dart';

import 'package:aartas_design_system/providers/appointment_provider.dart';
import 'package:aartas_design_system/providers/authorisation_provider.dart';
import 'package:aartas_design_system/providers/book_appointment_provider.dart';
import 'package:aartas_design_system/providers/category_provider.dart';
import 'package:aartas_design_system/providers/complaint_provider.dart';
import 'package:aartas_design_system/providers/consultation_provider.dart';
import 'package:aartas_design_system/providers/coupons_provider.dart';
import 'package:aartas_design_system/providers/diagnosis_provider.dart';
import 'package:aartas_design_system/providers/doctor_provider.dart';
import 'package:aartas_design_system/providers/family_member_provider.dart';
import 'package:aartas_design_system/providers/follow_up_date_provider.dart';
import 'package:aartas_design_system/providers/health_program_provider.dart';
import 'package:aartas_design_system/providers/home_feed_provider.dart';
import 'package:aartas_design_system/providers/instruction_provider.dart';
import 'package:aartas_design_system/providers/investigation_provider.dart';
import 'package:aartas_design_system/providers/medicine_provider.dart';
import 'package:aartas_design_system/providers/patient_appointment_provider.dart';
import 'package:aartas_design_system/providers/patient_location_provider.dart';
import 'package:aartas_design_system/providers/patient_provider.dart';
import 'package:aartas_design_system/providers/patient_tracker_provider.dart';
import 'package:aartas_design_system/providers/patient_vitals_trend_provider.dart';
import 'package:aartas_design_system/providers/pdf_provider.dart';
import 'package:aartas_design_system/providers/procedure_provider.dart';
import 'package:aartas_design_system/providers/rewards_provider.dart';
import 'package:aartas_design_system/providers/search_provider.dart';
import 'package:aartas_design_system/providers/speciality_provider.dart';
import 'package:aartas_design_system/providers/vitals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AartasApiProvider extends StatefulWidget {
  final Widget child;

  const AartasApiProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AartasApiProvider> createState() => _AartasApiProviderState();
}

class _AartasApiProviderState extends State<AartasApiProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => AuthorisationProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
        ChangeNotifierProvider(create: (_) => VitalsProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ComplaintProvider()),
        ChangeNotifierProvider(create: (_) => DiagnosisProvder()),
        ChangeNotifierProvider(create: (_) => InvestigationProvider()),
        ChangeNotifierProvider(create: (_) => MedicineProvider()),
        ChangeNotifierProvider(create: (_) => ProcedureProvider()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => PDFProvider()),
        ChangeNotifierProvider(create: (_) => FollowUpDateProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => HealthProgramProvider()),
        ChangeNotifierProvider(create: (_) => CouponProvider()),
        ChangeNotifierProvider(create: (_) => SpecialityProvider()),
        ChangeNotifierProvider(create: (_) => HomeFeedProvider()),
        ChangeNotifierProvider(create: (_) => FamilyMembersProvider()),
        ChangeNotifierProvider(create: (_) => BookAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => RewardProvider()),
        ChangeNotifierProvider(create: (_) => PatientAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => PatientLocationProvider()),
        ChangeNotifierProvider(create: (_) => PatientTrackerProvider()),
        ChangeNotifierProvider(create: (_) => ConsultationProvider()),
        ChangeNotifierProvider(create: (_) => PatientVitalsTrendProvider()),
      ],
      builder: (_, child) {
        return widget.child;
      },
    );
  }
}
