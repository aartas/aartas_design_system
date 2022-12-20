import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const CustomChip({
    required this.backgroundColor,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}
