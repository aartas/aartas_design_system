/*
  ? Every element is changed according to the input types.
  Input types
  * bg-color
  * color
  * label
  * buttonType - Elevated, Text, Outlined
  * icon
  * elevation
  * shape
  * width
  ? widgets own function
 */

import 'package:aartas_design_system/const.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? textColor;
  final String? label;
  final String? buttonType;
  final IconData? icon;
  final bool? iconRight;
  final double? elevation;
  final String? shape;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final TextDecoration? decoration;
  const AdaptiveButton({
    Key? key,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.label,
    this.buttonType,
    this.icon,
    this.iconRight,
    this.elevation,
    this.shape,
    this.width,
    this.padding,
    this.borderRadius,
    this.alignment,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: alignment != null ? alignment! : Alignment.center,
      minSize: 16,
      borderRadius:
          borderRadius != null ? borderRadius! : BorderRadius.circular(12),
      padding: padding != null
          ? padding!
          : const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      onPressed: onTap,
      color: bgColor != null ? bgColor! : textTheme(context).subtitle1!.color!,
      disabledColor: bgColor != null
          ? bgColor!.withOpacity(0.4)
          : textTheme(context).subtitle1!.color!.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconRight != null && !iconRight! && icon != null
              ? buttonIcon(context)
              : const SizedBox(),
          label != null
              ? FittedBox(
                  child: Text(
                    label != null ? label! : "",
                    style: TextStyle(
                      fontSize: textTheme(context).subtitle1!.fontSize,
                      fontWeight: FontWeight.w600,
                      decoration: decoration != null ? decoration! : null,
                      color: onTap != null
                          ? textColor != null
                              ? textColor!
                              : themeData(context).scaffoldBackgroundColor
                          : textColor != null
                              ? textColor!.withOpacity(0.4)
                              : themeData(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.3),
                    ),
                  ),
                )
              : const SizedBox(),
          iconRight != null && iconRight! && icon != null
              ? buttonIcon(context)
              : const SizedBox(),
        ],
      ),
    );
    // }
    // return ElevatedButton(
    //   style: ButtonStyle(
    //     elevation: bgColor == Colors.transparent
    //         ? MaterialStateProperty.all(0)
    //         : elevation != null
    //             ? MaterialStateProperty.all(elevation)
    //             : null,
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(borderRadius / 4),
    //       ),
    //     ),
    //     padding: MaterialStateProperty.all(
    //       padding != null ? padding! : EdgeInsets.all(defaultPadding / 1.5),
    //     ),
    //     backgroundColor: onTap != null
    //         ? MaterialStateProperty.all<Color?>(
    //             bgColor != null ? bgColor! : brandyColor,
    //           )
    //         : MaterialStateProperty.all<Color?>(
    //             bgColor != null
    //                 ? bgColor!.withOpacity(0.4)
    //                 : brandyColor.withOpacity(0.3),
    //           ),
    //   ),
    //   onPressed: onTap,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       icon != null && label != null
    //           ? Padding(
    //               padding: const EdgeInsets.only(right: 10),
    //               child: Icon(
    //                 icon,
    //                 size: textTheme(context).button!.fontSize! + 2,
    //                 color: onTap != null
    //                     ? textColor != null
    //                         ? textColor!
    //                         : pearlColor
    //                     : textColor != null
    //                         ? textColor!.withOpacity(0.4)
    //                         : pearlColor.withOpacity(0.3),
    //               ),
    //             )
    //           : Container(),
    //       FittedBox(
    //         child: Text(
    //           label != null ? label! : "",
    //           style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.w600,
    //               color: textColor != null ? textColor! : null),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Padding buttonIcon(BuildContext context) {
    return Padding(
      padding: label != null
          ? EdgeInsets.only(
              right: padding != null ? padding!.right / 2 : 16,
            )
          : EdgeInsets.zero,
      child: Icon(
        icon,
        size: textTheme(context).headline6!.fontSize!,
        color: onTap != null
            ? textColor != null
                ? textColor!
                : themeData(context).scaffoldBackgroundColor
            : textColor != null
                ? textColor!.withOpacity(0.4)
                : themeData(context).scaffoldBackgroundColor.withOpacity(0.3),
      ),
    );
  }
}
