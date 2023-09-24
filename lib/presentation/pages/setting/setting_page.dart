import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:meigen_finder/util/app_life_cycle_observer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/controller/setting_page_controller.dart';
import '../../../application/state/settig_page_view_state.dart';
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

    final donationPriceString = controller.donationPriceString;

    useEffect(() {
      executeWhileLoading(ref, () => controller.fetch());
      return null;
    }, const []);

    ref.listen(appLifecycleProvider, (previous, next) {
      if (next == AppLifecycleState.resumed) {
        controller.fetchSettingNotification();
      }
    });
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                SettingListTileRightArrow(
                  label: '広告を消す',
                  onTap: () => PremiumRoute().go(context),
                ),
                if (donationPriceString != null) ...{
                  const _Divider(),
                  SettingListTileRightArrow(
                    label: '開発者の支援をする',
                    trailingWidget: Text(donationPriceString),
                    onTap: () {
                      executeWhileLoading(ref, () {
                        return controller.donate();
                      });
                    },
                  ),
                },
                const SizedBox(
                  height: 32.0,
                ),
                SettingListTileRightArrow(
                  label: 'プッシュ通知',
                  trailingWidget: CupertinoSwitch(
                    value: viewState.pushNotificationStatus ==
                        PushNotificationStatus.on,
                    onChanged: (value) {
                      controller.openNotificationSetting();
                    },
                  ),
                  onTap: () {
                    controller.openNotificationSetting();
                  },
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
                const _Divider(),
                SettingListTileRightArrow(
                  label: 'アプリをシェアする',
                  onTap: () {
                    // アプリのシェア
                    Share.share(Platform.isIOS
                        ? 'https://apps.apple.com/us/app/気分e名言/id6463764141'
                        : 'https://play.google.com/store/apps/details?id=jp.ringrin.kibun_e_meigen');
                  },
                  topRightRadius: 0,
                  topLeftRadius: 0,
                ),
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
