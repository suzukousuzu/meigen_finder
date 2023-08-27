import 'package:flutter/material.dart';

import 'loading_container.dart';

mixin LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingContainer(child: child));
      } else {
        return LoadingContainer(child: child);
      }
    };
  }
}
