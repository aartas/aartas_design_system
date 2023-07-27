import 'dart:async';

import 'package:aartas_design_system/const.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomRoundedCircle extends StatefulWidget {
  final List<Color>? colors;
  final double radius;
  final double? startAngle, strokeWidth, currentAngle;
  final int? steps;
  final bool? showThumb;
  final Color? backgroundColor;
  const CustomRoundedCircle(
      {this.colors,
      this.steps,
      this.startAngle,
      this.strokeWidth,
      this.currentAngle,
      this.showThumb,
      this.backgroundColor,
      required this.radius,
      Key? key})
      : super(key: key);

  @override
  State<CustomRoundedCircle> createState() => _CustomRoundedCircleState();
}

class _CustomRoundedCircleState extends State<CustomRoundedCircle> {
  double _currentAngle = 0;
  late Timer _timer;
  @override
  void initState() {
    _animate();
    super.initState();
  }

  _animate() {
    _timer = Timer.periodic(const Duration(milliseconds: 1), (time) {
      if (_currentAngle > widget.currentAngle!) {
        _currentAngle--;
        setState(() {});
      } else if (_currentAngle < widget.currentAngle!) {
        _currentAngle++;
        setState(() {});
      } else if (_currentAngle == widget.currentAngle) {
        // _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomRoundedCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SlidePainter(
        context: context,
        radius: widget.radius,
        colors: widget.colors,
        startAngle: widget.startAngle,
        currentAngle: _currentAngle,
        strokeWidth: widget.strokeWidth,
        steps: widget.steps,
        showThumb: widget.showThumb,
        backgroundColor: widget.backgroundColor,
      ),
      child: Container(),
    );
  }
}

class SlidePainter extends CustomPainter {
  final int? steps;
  final BuildContext context;
  final List<Color>? colors;
  final double radius;
  final double? startAngle, strokeWidth, currentAngle;
  final bool? showThumb;
  final Color? backgroundColor;
  SlidePainter({
    required this.context,
    this.steps,
    this.colors,
    this.startAngle,
    this.strokeWidth,
    this.currentAngle,
    this.showThumb,
    this.backgroundColor,
    required this.radius,
    Key? key,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    var backgroundPaint = Paint()
      ..shader = SweepGradient(
        colors: colors != null
            ? colors!
            : [
                themeData(context).scaffoldBackgroundColor,
                textTheme(context).titleLarge!.color!,
                textTheme(context).titleLarge!.color!,
                themeData(context).scaffoldBackgroundColor,
              ],
        startAngle: 2.9 * math.pi / 2, // 3
        endAngle: 6.9 * math.pi / 2, // 7
        tileMode: TileMode.repeated,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth != null ? strokeWidth! : 16;

    var foregroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth != null ? strokeWidth! : 16
      ..color = backgroundColor != null
          ? backgroundColor!
          : themeData(context).scaffoldBackgroundColor;

    var thumb = Paint()
      ..strokeWidth = strokeWidth! - 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Path path = Path()
    //   ..arcTo(
    //     rect,
    //     ((startAngle != null ? startAngle! : 360) * math.pi) / 360,
    //     ((currentAngle != null ? currentAngle! : 300) * math.pi) / 360,
    //     true,
    //   );

    canvas.drawArc(
      rect,
      ((startAngle != null ? startAngle! : 360) * math.pi) / 360,
      math.pi * 2,
      false,
      foregroundPaint,
    );

    // if (steps != null && steps != 0) {
    //   for (var i = 0; i < steps!; i++) {
    //     canvas.drawArc(
    //       rect,
    //       (((currentAngle! * i) - 180) * math.pi) / 360,
    //       (math.pi) / 360,
    //       false,
    //       thumb
    //         ..color = themeData(context).colorScheme.background.withOpacity(0.1)
    //         ..strokeWidth = strokeWidth! - 8,
    //     );
    //   }
    // }

    canvas.drawArc(
      rect,
      ((startAngle != null ? startAngle! : 300) * math.pi) / 360,
      ((currentAngle != null ? currentAngle! : 300) * math.pi) / 360,
      false,
      backgroundPaint,
    );

    showThumb != null && showThumb!
        ? canvas.drawArc(
            rect,
            ((currentAngle! - 182) * math.pi) / 360,
            (math.pi) / 360,
            false,
            thumb..color = themeData(context).colorScheme.background,
          )
        : null;
    // canvas.drawPath(
    //   path,
    //   _backgroundPaint..maskFilter = const MaskFilter.blur(BlurStyle.outer, 2),
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();
    return true;
  }
}
