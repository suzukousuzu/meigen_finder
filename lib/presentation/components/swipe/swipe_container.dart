import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

typedef ItemBuilder = Widget Function(BuildContext, int);

class SwipeContainer extends StatelessWidget {
  const SwipeContainer({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);
  final ItemBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: itemBuilder,
      loop: true,
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemCount: itemCount,
    );
  }
}
