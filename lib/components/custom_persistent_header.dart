import 'package:flutter/material.dart';

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double? height;
  const CustomPersistentHeader({
    Key? key,
    required this.child,
    this.height,
  });

  @override
  double get maxExtent => height != null ? height! : 16;

  @override
  double get minExtent => height != null ? height! : 16;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(child: child);
  }
}
