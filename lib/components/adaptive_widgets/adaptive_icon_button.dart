import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';

class AdaptiveIconButton extends StatelessWidget {
  const AdaptiveIconButton({
    this.icon,
    this.color,
    Key? key,
  }) : super(key: key);
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius / 3),
        color: color != null ? color! : null,
      ),
      padding: EdgeInsets.all(
        defaultPadding / 2,
      ),
      child: icon != null ? icon! : const Text("?"),
    );
  }
}
