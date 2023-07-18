import 'package:flutter/material.dart';

import '../../theme/mf_theme.dart';

const _appBarPersistentHeight = 63.0;
const _titleFadeDuration = Duration(milliseconds: 150);
const _showLargeTitleThreshold = 10.0;
const _titlePadding = EdgeInsetsDirectional.only(
  start: 20,
  top: 4,
  end: 20,
  bottom: 16,
);

class MfSliverAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  const MfSliverAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final components = _AppBarStaticComponents(
      route: ModalRoute.of(context),
      userLeading: leading,
      userTrailing: trailing,
      userLargeTitle: title,
      userTitle: title,
      mfTheme: MfTheme.of(context),
    );

    final mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1),
      child: SliverPersistentHeader(
        pinned: true,
        delegate: _AppBarDelegate(
          components: components,
          backgroundColor: backgroundColor,
          persistentHeight: _appBarPersistentHeight + mediaQuery.padding.top,
          screenWidth: mediaQuery.size.width,
        ),
      ),
    );
  }
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  _AppBarDelegate({
    required this.components,
    this.backgroundColor,
    required this.persistentHeight,
    required this.screenWidth,
  }) : _textHeight = _getTextHeight(
          components.title,
          screenWidth,
          _titlePadding,
        );

  final _AppBarStaticComponents components;
  final Color? backgroundColor;
  final double persistentHeight;
  final double screenWidth;

  final double _textHeight;

  @override
  double get minExtent => persistentHeight;

  @override
  double get maxExtent => _textHeight == 0
      ? minExtent
      : persistentHeight + _textHeight + _titlePadding.vertical;

  static double _getTextHeight(
    Text text,
    double screenWidth,
    EdgeInsetsGeometry padding,
  ) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      maxLines: text.maxLines,
      textDirection: text.textDirection ?? TextDirection.ltr,
    )..layout(maxWidth: screenWidth - padding.horizontal);
    return (text.data ?? '').isEmpty ? 0 : textPainter.size.height;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final mfTheme = MfTheme.of(context);
    final color = backgroundColor ?? mfTheme.colorScheme.background;
    final showLargeTitle =
        shrinkOffset < maxExtent - minExtent - _showLargeTitleThreshold;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: _PersistentAppBar(
            components: components,
            backgroundColor: showLargeTitle
                ? color.withOpacity(0)
                : mfTheme.colorScheme.background,
            titleVisible: !showLargeTitle,
          ),
        ),
        Positioned(
          top: persistentHeight,
          left: 0,
          right: 0,
          bottom: 0,
          child: OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: _titlePadding,
              child: AnimatedOpacity(
                  opacity: showLargeTitle ? 1 : 0,
                  duration: _titleFadeDuration,
                  child: components.largeTitle),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_AppBarDelegate oldDelegate) {
    return components != oldDelegate.components ||
        backgroundColor != oldDelegate.backgroundColor ||
        persistentHeight != oldDelegate.persistentHeight ||
        screenWidth != oldDelegate.screenWidth;
  }
}

class _PersistentAppBar extends StatelessWidget {
  const _PersistentAppBar({
    Key? key,
    required this.components,
    required this.backgroundColor,
    required this.titleVisible,
  }) : super(key: key);

  final _AppBarStaticComponents components;
  final Color backgroundColor;
  final bool titleVisible;

  @override
  Widget build(BuildContext context) {
    final trailing = components.trailing;
    return AppBar(
      backgroundColor: backgroundColor,
      toolbarHeight: _appBarPersistentHeight,
      leading: components.leading,
      automaticallyImplyLeading: false,
      title: AnimatedOpacity(
        opacity: titleVisible ? 1 : 0,
        duration: _titleFadeDuration,
        child: components.title,
      ),
      actions: trailing != null ? [trailing] : null,
    );
  }
}

@immutable
class _AppBarStaticComponents {
  _AppBarStaticComponents({
    required Widget? userLeading,
    required ModalRoute<dynamic>? route,
    required Widget? userTrailing,
    required String userTitle,
    required String userLargeTitle,
    required MfTheme mfTheme,
  })  : trailing = _createTrailing(
          userTrailing: userTrailing,
          route: route,
          mfTheme: mfTheme,
        ),
        title = _createTitle(
          userTitle: userTitle,
          mfTheme: mfTheme,
        ),
        largeTitle = _createLargeTitle(
          userLargeTitle: userLargeTitle,
          mfTheme: mfTheme,
        ),
        leading = userLeading;

  final Widget? leading;
  final Text title;
  final Text largeTitle;
  final Widget? trailing;

  static Widget? _createTrailing({
    required Widget? userTrailing,
    required ModalRoute<dynamic>? route,
    required MfTheme mfTheme,
  }) {
    Widget? trailingWidget;

    if (userTrailing != null) {
      trailingWidget = userTrailing;
    } else if (route != null && route.canPop) {
      trailingWidget = TextButton(
        onPressed: route.navigator!.maybePop,
        child: Text(
          'キャンセル',
          style: mfTheme.textTheme.textBold.copyWith(
            color: mfTheme.colorScheme.onBackgroundBottomSheet,
          ),
        ),
      );
    }

    return trailingWidget != null
        ? Padding(
            padding: const EdgeInsets.only(right: 20), child: trailingWidget)
        : null;
  }

  static Text _createTitle({
    required String userTitle,
    required MfTheme mfTheme,
  }) {
    return Text(
      userTitle,
      style: mfTheme.textTheme.textBold
          .copyWith(color: mfTheme.colorScheme.onBackgroundBottomSheet),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text _createLargeTitle({
    required String userLargeTitle,
    required MfTheme mfTheme,
  }) {
    return Text(
      userLargeTitle,
      style: mfTheme.textTheme.h2
          .copyWith(color: mfTheme.colorScheme.onBackgroundBottomSheet),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
