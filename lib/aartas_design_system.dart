library aartas_design_system;

import 'package:flutter/material.dart';

/// A Calculator is a calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class Demoo extends StatelessWidget {
  const Demoo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Your Demo is working");
  }
}
