import 'package:flutter/material.dart';

class AartasLogo extends StatelessWidget {
  final double? size;
  final Color? color;
  const AartasLogo({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("assets/AartasLogo.png"),
      height: size ?? 20,
      fit: BoxFit.contain,
      color: color,
      alignment: Alignment.bottomCenter,
    );
  }
}

//
