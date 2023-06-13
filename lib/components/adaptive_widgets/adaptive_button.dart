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
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? textColor;
  final String? label;
  final String? buttonType;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? elevation;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final TextDecoration? decoration;
  final bool? isLoading;
  final TextStyle? textStyle;
  const AdaptiveButton({
    Key? key,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.label,
    this.buttonType,
    this.leftIcon,
    this.rightIcon,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.alignment,
    this.decoration,
    this.isLoading,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: alignment != null ? alignment! : Alignment.center,
      minSize: 16,
      borderRadius:
          borderRadius != null ? borderRadius! : BorderRadius.circular(4), // 12
      padding: padding != null
          ? padding!
          : const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // 24 20
      onPressed: onTap,
      color:
          bgColor != null ? bgColor! : textTheme(context).titleMedium!.color!,
      disabledColor: bgColor != null
          ? bgColor!.withOpacity(0.3)
          : textTheme(context).titleMedium!.color!.withOpacity(0.3),

      child: isLoading != null && isLoading!
          ? Center(
              child: SizedBox(
                // padding: const EdgeInsets.symmetric(vertical: 8),
                height: textStyle != null
                    ? textStyle!.fontSize!
                    : textTheme(context).titleLarge!.fontSize!,
                width: textStyle != null
                    ? textStyle!.fontSize!
                    : textTheme(context).titleLarge!.fontSize!,

                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.transparent,
                  color: themeData(context).scaffoldBackgroundColor,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: mainAxisAlignment != null
                  ? mainAxisAlignment!
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize:
                  mainAxisSize != null ? mainAxisSize! : MainAxisSize.max,
              children: [
                leftIcon != null
                    ? buttonIcon(context, leftIcon!)
                    : const SizedBox(),
                label != null
                    ? FittedBox(
                        child: Text(
                          label != null ? label! : "",
                          style: textStyle != null
                              ? textStyle!.copyWith(
                                  color: onTap != null
                                      ? textColor != null
                                          ? textColor!
                                          : themeData(context)
                                              .scaffoldBackgroundColor
                                      : textColor != null
                                          ? textColor!.withOpacity(0.4)
                                          : themeData(context)
                                              .scaffoldBackgroundColor
                                              .withOpacity(0.3))
                              : TextStyle(
                                  fontSize:
                                      textTheme(context).titleMedium!.fontSize,
                                  fontWeight: FontWeight.w600,
                                  decoration:
                                      decoration != null ? decoration! : null,
                                  color: onTap != null
                                      ? textColor != null
                                          ? textColor!
                                          : themeData(context)
                                              .scaffoldBackgroundColor
                                      : textColor != null
                                          ? textColor!.withOpacity(0.4)
                                          : themeData(context)
                                              .scaffoldBackgroundColor
                                              .withOpacity(0.3),
                                ),
                        ),
                      )
                    : const SizedBox(),
                rightIcon != null
                    ? buttonIcon(context, rightIcon!)
                    : const SizedBox(),
              ],
            ),
    );
  }

  Widget buttonIcon(BuildContext context, IconData icon) {
    return Padding(
      padding: label != null
          ? EdgeInsets.only(
              right: ((leftIcon == null)
                      ? 0
                      : padding != null
                          ? padding!.left
                          : 16) /
                  1.2,
              left: ((rightIcon == null)
                      ? 0
                      : padding != null
                          ? padding!.right
                          : 16) /
                  1.2,
            )
          : EdgeInsets.zero,
      child: Icon(
        icon,
        size: textStyle != null
            ? textStyle!.fontSize!
            : textTheme(context).titleLarge!.fontSize!,
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
