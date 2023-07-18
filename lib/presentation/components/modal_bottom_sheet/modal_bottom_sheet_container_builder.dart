import 'package:flutter/material.dart';

Widget modalBottomSheetContainerBuilder(
  BuildContext context,
  Animation<double> animation,
  Widget child,
) =>
    ModalBottomSheetContainer(child: child);

/// ModalBottomSheet で表示するページの親Widget
///
/// [package:modal_bottom_sheet/src/bottom_sheets/cupertino_bottom_sheet.dart]
/// の _CupertinoBottomSheetContainer を参考に、デザインに合わせて改変
class ModalBottomSheetContainer extends StatelessWidget {
  const ModalBottomSheetContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: 12 + topSafeAreaPadding),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: SizedBox(
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: child,
          ),
        ),
      ),
    );
  }
}
