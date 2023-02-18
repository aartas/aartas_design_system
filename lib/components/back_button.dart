import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';

class BButton extends StatelessWidget {
  final Function? onPressed;
  final Color? backgroundColor;
  const BButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: backgroundColor != null
            ? backgroundColor!
            : themeData(context).colorScheme.background,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back),
          color: textTheme(context).headline6?.color,
          iconSize: 24,
          onPressed: () =>
              onPressed != null ? onPressed! : Navigator.pop(context),
        ),
      ),
    );
  }
}
