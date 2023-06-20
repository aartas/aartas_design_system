import 'dart:ui';
import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final BlendMode? blendMode;
  final Color? color;
  final bool? enabled;
  final List<BoxShadow>? boxShadow;
  const GlassMorphism({
    Key? key,
    required this.child,
    this.borderRadius,
    this.blendMode,
    this.color,
    this.enabled,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _borderRadius =
        borderRadius != null ? borderRadius! : BorderRadius.zero;
    // if (enabled != null && !enabled!) {
    //   return child;
    // }
    return Stack(
      // fit: StackFit.expand,
      children: [
        child,
        AnimatedOpacity(
          duration: duration,
          opacity: enabled != null && !enabled! ? 0.1 : 1,
          child: enabled != null && !enabled!
              ? child
              : ClipRRect(
                  borderRadius: _borderRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    blendMode:
                        blendMode != null ? blendMode! : BlendMode.srcOver,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color != null
                            ? color!.withOpacity(0.1)
                            : themeData(context)
                                .colorScheme
                                .background
                                .withOpacity(0.1),
                        borderRadius: _borderRadius,
                        boxShadow: boxShadow != null ? boxShadow! : null,
                        // border: Border.all(
                        //   width: 1.5,
                        //   color: color != null
                        //       ? color!.withOpacity(0.2)
                        //       : const Color(0xFF1F1F1F).withOpacity(0),
                        // ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 50,
                        //     color: color != null
                        //         ? color!.withOpacity(0.1)
                        //         : const Color(0xFF1F1F1F).withOpacity(0.5),
                        //     blurStyle: BlurStyle.solid,
                        //     spreadRadius: 50,
                        //   )
                        // ],
                      ),
                      child: child,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}


  //  return BackdropFilter(
  //     filter: ImageFilter.blur(
  //       sigmaX: 30,
  //       sigmaY: 30,
  //     ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Color(0xff1f1f1f).withOpacity(0.8),
  //             blurRadius: 50,
  //             spreadRadius: 50,
  //             offset: Offset(
  //               0,
  //               0,
  //             ),
  //           )
  //         ],
  //       ),
  //       child: child,
  //     ),
  //   );