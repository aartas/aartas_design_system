library aartas_design_system;

import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/apis/patient_apis.dart';
import 'package:aartas_design_system/providers/appointment_provider.dart';
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
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
      ],
      builder: (_, child) {
        return widget.child;
      },
    );
  }
}

//// Hello its working.