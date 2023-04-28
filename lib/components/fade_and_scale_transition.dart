import 'dart:async';

import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';

class FadeAndScaleTransition extends StatefulWidget {
  final Widget? child;
  final double? index;
  const FadeAndScaleTransition({
    Key? key,
    this.child,
    this.index,
  }) : super(key: key);

  @override
  State<FadeAndScaleTransition> createState() => _FadeAndScaleTransitionState();
}

class _FadeAndScaleTransitionState extends State<FadeAndScaleTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;
  Timer? timer;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: duration * (widget.index != null ? widget.index! : .5),
    );
    animationOffset = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(0, 0.1),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    timer = Timer(duration * 2, () {
      animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationOffset,
      child: FadeTransition(
        opacity: animationController,
        child: widget.child,
      ),
    );
  }
}
