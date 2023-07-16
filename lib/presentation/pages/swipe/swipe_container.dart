import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class SwipeContainer extends StatelessWidget {
  const SwipeContainer({
    Key? key,
    required this.child,
    required this.itemCount,
    required this.onChanged,
  }) : super(key: key);
  final ValueChanged<int> onChanged;
  final int itemCount;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        onChanged(index);
        return child;
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemCount: itemCount,
    );
  }
}
