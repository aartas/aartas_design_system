import 'dart:developer';
import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showCustomBottomSheet(
    BuildContext context, Color? barrierColor, List<Widget> children) {
  HapticFeedback.selectionClick();
  showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(
      minHeight: 100,
      maxHeight: mediaQuery(context).size.height -
          (AppBar().preferredSize.height * 1.2),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    barrierColor: barrierColor,
    isDismissible: false,
    backgroundColor: themeData(context).colorScheme.background,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    builder: (_) => SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ),
  );
}

class _CustomBottomSheet extends StatefulWidget {
  final List<Widget> children;

  const _CustomBottomSheet({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomBottomSheet> createState() => __CustomBottomSheetState();
}

class __CustomBottomSheetState extends State<_CustomBottomSheet> {
  late ScrollController _scrollController;
  final GlobalKey _childKey = GlobalKey();
  double? _height;
  @override
  void initState() {
    _getHeight();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // print("Scroll");
      if (_scrollController.position.pixels == 0) {
        // print("-");
        Future.delayed(const Duration(seconds: 1), () {
          // print("--");
          setState(() {});
        });
        setState(() {});
      } else {
        // print("+");
        setState(() {});
      }
    });

    super.initState();
  }

  void _getHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _height = _childKey.currentContext!.size!.height +
          (AppBar().preferredSize.height);
      setState(() {});
      log("$_height");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Column(
        key: _childKey,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 4,
            width: 48,
            decoration: BoxDecoration(
              // color: textTheme(context).titleMedium!.color!.withOpacity(0.5),

              borderRadius: BorderRadius.circular(16),
            ),
          ),
          ...widget.children
          // ListView(
          //   padding: EdgeInsets.zero,
          //   controller: _scrollController,
          //   physics: _scrollPhysics,
          //   shrinkWrap: true,
          //   primary: false,
          //   children: ,
          // ),
        ],
      ),
    );
  }
}
