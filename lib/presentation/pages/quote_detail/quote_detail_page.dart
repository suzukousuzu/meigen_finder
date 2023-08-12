import 'package:flutter/material.dart';

import '../../../domain/state/quote.dart';
import '../../components/app_bar/mf_sliver_app_bar.dart';

class QuoteDetailPage extends StatelessWidget {
  const QuoteDetailPage({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(
            quote: quote,
          ),
          const _SectionTitle(),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.quote,
  }) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return MfSliverAppBar(
      title: quote.quote,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter();
  }
}
