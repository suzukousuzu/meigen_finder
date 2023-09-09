import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/controller/setting_page_controller.dart';
import '../../components/loading/execute_while_loading.dart';
import '../../components/tile/setting_list_tile_right_arrow.dart';
import '../../routing/router.dart';

final _opinionToAppUrl = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSdw5TUZdDwBtfdwlapCoqvnKn-ABVvyd7aRV461SjPCDrCG0Q/viewform');

final policyUrl = Uri.parse('https://ringrin.jp/privacy.html');

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;

    final controller = ref.watch(settingPageControllerProvider.notifier);
    final viewState = ref.watch(settingPageControllerProvider);

    useEffect(() {
      executeWhileLoading(ref, () => controller.fetchAppVersion());
      return null;
    }, const []);
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 32.0,
              ),
              SettingListTileRightArrow(
                label: '広告を消す',
                onTap: () => PremiumRoute().go(context),
              ),
              const SizedBox(
                height: 32.0,
              ),
              SettingListTileRightArrow(
                label: 'アプリへのご意見・ご要望',
                onTap: () => _launchUrl(_opinionToAppUrl),
                bottomLeftRadius: 0,
                bottomRightRadius: 0,
              ),
              const _Divider(),
              SettingListTileRightArrow(
                label: 'レビューを書く',
                onTap: () {
                  LaunchReview.launch(
                    androidAppId: "jp.ringrin.meigen_finder",
                    iOSAppId: "6463764141",
                  );
                },
                topLeftRadius: 0,
                topRightRadius: 0,
                bottomRightRadius: 0,
                bottomLeftRadius: 0,
              ),
              // const _Divider(),
              // SettingListTileRightArrow(
              //   label: 'アプリをシェアする',
              //   onTap: () {
              //     // アプリのシェア
              //     Share.share(Platform.isIOS
              //         ? 'https://apps.apple.com/us/app/mode-on/id6449795570'
              //         : 'https://play.google.com/store/apps/details?id=jp.ringrin.mode_on');
              //   },
              //   topRightRadius: 0,
              //   topLeftRadius: 0,
              // ),
              const SizedBox(
                height: 32.0,
              ),
              SettingListTileRightArrow(
                label: '利用規約',
                onTap: () {
                  TermsOfServiceRoute().go(context);
                },
                bottomLeftRadius: 0,
                bottomRightRadius: 0,
              ),
              const _Divider(),
              SettingListTileRightArrow(
                label: 'プライバシーポリシー',
                onTap: () => _launchUrl(policyUrl),
                topRightRadius: 0,
                topLeftRadius: 0,
              ),
              const SizedBox(
                height: 32.0,
              ),
              SettingListTileRightArrow(
                label: 'バージョン情報',
                trailingWidget: Text(viewState.appVersion),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MfTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Divider(
        height: 0,
        thickness: 1,
        color: colorScheme.onBackgroundBottomSheet.withOpacity(0.1),
      ),
    );
  }
}
