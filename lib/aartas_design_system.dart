library aartas_design_system;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Your Demo is working");
  }
}
