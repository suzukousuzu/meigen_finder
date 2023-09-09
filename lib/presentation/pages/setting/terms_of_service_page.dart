import 'package:flutter/material.dart';
import 'package:meigen_finder/presentation/components/app_bar/mf_sliver_app_bar.dart';
import 'package:meigen_finder/presentation/constant/terms_of_service_text.dart';

import '../../theme/mf_theme.dart';

enum TermsOfServiceTextType {
  sectionTiTle,
  description,
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _AppBar(),
        _Body(),
      ],
    ));
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    return const MfSliverAppBar(
      title: title,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PromptText(),
              ...List.generate(
                14,
                (index) {
                  final sectionTitle = _createTermsOfServiceText(
                      index, TermsOfServiceTextType.sectionTiTle);
                  final description = _createTermsOfServiceText(
                      index, TermsOfServiceTextType.description);
                  return _TermsOfServiceContent(
                      title: sectionTitle, description: description);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, bottom: 36),
                child: Text(
                  enforcementDateText,
                  textAlign: TextAlign.left,
                  style: textTheme.subtext,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _createTermsOfServiceText(
    int index,
    TermsOfServiceTextType termsOfServiceTextType,
  ) {
    switch (index) {
      case 0:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle1
            : termDescription1;
      case 1:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle2
            : termDescription2;
      case 2:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle3
            : termDescription3;
      case 3:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle4
            : termDescription4;
      case 4:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle5
            : termDescription5;
      case 5:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle6
            : termDescription6;
      case 6:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle7
            : termDescription7;
      case 7:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle8
            : termDescription8;
      case 8:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle9
            : termDescription9;
      case 9:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle10
            : termDescription10;
      case 10:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle11
            : termDescription11;
      case 11:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle12
            : termDescription12;
      case 12:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle13
            : termDescription13;
      case 13:
        return termsOfServiceTextType == TermsOfServiceTextType.sectionTiTle
            ? termTitle14
            : termDescription14;
      default:
        throw (ArgumentError('引数エラー'));
    }
  }
}

class _PromptText extends StatelessWidget {
  const _PromptText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        promptText,
        style: textTheme.subtext,
      ),
    );
  }
}

class _TermsOfServiceContent extends StatelessWidget {
  const _TermsOfServiceContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
      child: Column(
        children: [
          Text(
            title,
            style: textTheme.textBold,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            style: textTheme.subtext,
          ),
        ],
      ),
    );
  }
}
