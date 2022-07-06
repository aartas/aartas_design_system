library aartas_design_system;

import 'package:aartas_design_system/apis/patient_apis.dart';
import 'package:aartas_design_system/models/patient_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AartasApp extends StatefulWidget {
  final Widget child;
  const AartasApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AartasApp> createState() => _AartasAppState();
}

class _AartasAppState extends State<AartasApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PatientApis()),
      ],
      child: widget.child,
    );
  }
}
