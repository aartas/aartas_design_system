import 'dart:async';
import 'package:aartas_design_system/components/adaptive_widgets/adaptive_button.dart';
import 'package:aartas_design_system/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ------------------- Loading -------------------

loading(BuildContext context, String? title) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => Dialog(
      insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
      backgroundColor: themeData(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: LoadingDialog(
        title: title,
      ),
    ),
  );
}

class LoadingDialog extends StatefulWidget {
  final String? title;
  const LoadingDialog({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  late Timer _timer;
  String _showBypassMessage = "";
  @override
  void initState() {
    _initializeTimer();
    super.initState();
  }

  _initializeTimer() {
    _timer = Timer(const Duration(seconds: 10), () {
      _showBypassMessage =
          "Taking more than usual. Please hold to go back and retry.";
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onLongPress:
          _showBypassMessage.isEmpty ? null : () => Navigator.pop(context),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: _showBypassMessage.isNotEmpty
                  ? Text(
                      _showBypassMessage,
                      style: textTheme(context).subtitle1?.apply(
                            color: textTheme(context)
                                .subtitle1!
                                .color!
                                .withOpacity(0.5),
                            fontStyle: FontStyle.italic,
                          ),
                    )
                  : Text(
                      widget.title != null
                          ? "${widget.title}"
                          : "Loading Please wait...",
                      style: textTheme(context)
                          .subtitle1
                          ?.apply(fontWeightDelta: 2),
                    ),
            ),
            const SizedBox(
              width: 16,
            ),
            CupertinoActivityIndicator(
              color: textTheme(context).headline6!.color,
            ),

            // const SizedBox(
            //   height: 16,
            // ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: AartasLogo(
            //     color: textTheme(context).headline6!.color!,
            //     size: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );

    // return Dialog(
    //   child: InkWell(
    //     onLongPress:
    //         _showBypassMessage.isEmpty ? null : () => Navigator.pop(context),
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           widget.icon != null
    //               ? widget.icon!
    //               : const CupertinoActivityIndicator(),
    //           _showBypassMessage.isNotEmpty
    //               ? Text(
    //                   _showBypassMessage,
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     color: brandyColor,
    //                     fontStyle: FontStyle.italic,
    //                   ),
    //                 )
    //               : Text(
    //                   widget.subtitle != null
    //                       ? "${widget.subtitle}"
    //                       : "Loading Please wait...",
    //                   textAlign: TextAlign.center,
    //                   style: textTheme(context).subtitle1,
    //                 )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class SlimLoader extends StatelessWidget {
  const SlimLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 4,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: LinearProgressIndicator(
        backgroundColor: burntUmberColor.withOpacity(0.3),
        valueColor: AlwaysStoppedAnimation<Color>(burntUmberColor),
      ),
    );
  }
}

// class CSDialog extends StatelessWidget {
//   final Widget child;
//   final double? height;
//   final double? width;
//   const CSDialog({
//     Key? key,
//     required this.child,
//     this.height,
//     this.width,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: GlassMorphism(
//         borderRadius: BorderRadius.circular(16),
//         color: pearlColor,
//         child: child,
//       ),
//     );
//   }
// }

// ------------------- Loading -------------------

// ------------------- Modal ---------------------
modal(
  BuildContext context,
  Icon? icon,
  String? title,
  String? discrption,
  String? buttonName,
  Function()? onTap,
) {
  showModalBottomSheet(
    backgroundColor: themeData(context).colorScheme.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    isDismissible: false,
    isScrollControlled: true,
    context: context,
    builder: (_) => ModalLoadingDialog(
      icon: icon,
      title: title,
      discription: discrption,
      onTap: onTap,
      buttonName: buttonName,
    ),
  );
}

class ModalLoadingDialog extends StatefulWidget {
  final Icon? icon;
  final String? title;
  final String? discription;
  final String? buttonName;
  final Function()? onTap;

  const ModalLoadingDialog({
    Key? key,
    this.icon,
    this.title,
    this.discription,
    this.buttonName,
    this.onTap,
  }) : super(key: key);

  @override
  State<ModalLoadingDialog> createState() => _ModalLoadingDialogState();
}

class _ModalLoadingDialogState extends State<ModalLoadingDialog> {
  // late Timer _timer;
  // String _showBypassMessage = "";
  // @override
  // void initState() {
  //   _initializeTimer();
  //   super.initState();
  // }
  // _initializeTimer() {
  //   _timer = Timer(const Duration(seconds: 10), () {
  //     _showBypassMessage =
  //         "Taking more than usual. Please hold to go back and retry.";
  //     setState(() {});
  //   });
  // }
  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(32),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
            32, 16, 32, mediaQuery(context).padding.bottom + 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: widget.icon!,
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Icon(
                      CupertinoIcons.clear_circled,
                      size: 48,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Text(
                widget.title != null
                    ? "${widget.title}"
                    : "Something went wrong.",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text(
                widget.discription != null
                    ? "${widget.discription}"
                    : "Sorry for the inconvenience, look like we got some error here. Please retry.",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: AdaptiveButton(
                label: widget.buttonName != null
                    ? widget.buttonName!
                    : "Ok, Got it!",
                onTap: widget.onTap != null
                    ? () {
                        widget.onTap!();
                      }
                    : () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------- Modal ---------------------

showSnackbar(BuildContext context, String content, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: backgroundColor,
      content: Text(
        content,
        style: textTheme(context)
            .subtitle1
            ?.apply(color: charcoalColor, fontWeightDelta: 2),
      ),
    ),
  );
}
  // showDialog(
  //   // isDismissible: false,
  //   // isScrollControlled: false,
  //   // backgroundColor: Colors.transparent,
  //   context: context,
  //   builder: (_) => GlassMorphism(
  //     color: themeData(context).backgroundColor,
  //     child: Container(
  //       height: mediaQuery(context).size.height / 5,
  //       width: double.infinity,
  //       padding: const EdgeInsets.all(32),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           icon ?? const CupertinoActivityIndicator(),
  //           const SizedBox(
  //             height: 16 / 2,
  //           ),
  //           Text(
  //             text != "" ? text : "Loading. Please wait... :)",
  //             style: textTheme(context)
  //                 .subtitle1
  //                 ?.apply(fontWeightDelta: 2, color: whiteColor),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
// }

// snackBar(context, String text, color) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         text,
//         style: textTheme(context)
//             .subtitle1
//             ?.apply(fontWeightDelta: 2, color: color),
//       ),
//     ),
//   );
// }





// class ShimmerLoading extends StatelessWidget {
//   final int length;
//   final double height, width;
//   final Axis scrollDirection;
//   const ShimmerLoading({
//     required this.length,
//     required this.height,
//     required this.width,
//     required this.scrollDirection,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // width: mediaQuery(context).size.width,
//       child: ListView.builder(
//         primary: false,
//         shrinkWrap: true,
//         scrollDirection: scrollDirection,
//         itemCount: length,
//         itemBuilder: (_, i) => Padding(
//           padding: listPadding(length, i, scrollDirection),
//           child: Shimmer.fromColors(
//             child: Container(
//               width: width,
//               height: height,
//               decoration: BoxDecoration(
//                 color: themeData(context).backgroundColor,
//                 borderRadius: BorderRadius.circular(borderRadius / 2),
//               ),
//             ),
//             baseColor: themeData(context).backgroundColor,
//             highlightColor: themeData(context).scaffoldBackgroundColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
