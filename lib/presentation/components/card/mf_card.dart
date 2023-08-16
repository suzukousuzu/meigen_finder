import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';

class MfCard extends HookWidget {
  const MfCard({
    Key? key,
    this.child,
    this.padding,
    this.constraints,
    this.onTap,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final animationController = useAnimationController(
      lowerBound: 1.0,
      upperBound: 1.07,
      initialValue: 1.0,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: onTap != null ? (_) => animationController.forward() : null,
      onTapUp: onTap != null
          ? (_) => Timer(const Duration(milliseconds: 100), () {
                animationController.reverse();
                onTap?.call();
              })
          : null,
      onTapCancel: onTap != null ? () => animationController.reset() : null,
      child: Transform.scale(
        scale: animationController.value,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: colorScheme.onBackground.withOpacity(0.25),
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: padding,
          constraints: constraints,
          child: child,
        ),
      ),
    );
  }
}
