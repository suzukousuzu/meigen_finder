import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meigen_finder/application/init/init_app.dart';
import 'package:meigen_finder/firebase_options_dev.dart' as dev;
import 'package:meigen_finder/firebase_options_prod.dart' as prod;
import 'package:meigen_finder/presentation/components/loading/execute_while_loading.dart';
import 'package:meigen_finder/presentation/components/loading/loading_screen.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  const flavorName = String.fromEnvironment('flavor');
  // Flavor に応じた FirebaseOptions を準備する
  final firebaseOptions = flavorName == 'prod'
      ? prod.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions.currentPlatform;

  // Firebase の初期化
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);

  //ステータスバーの色の設定
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(mfThemeProvider);
    final router = ref.watch(routerProvider);
    useEffect(() {
      executeWhileLoading(ref, () {
        return ref.watch(initAppProvider).execute();
      });

      return;
    }, const []);
    return MaterialApp.router(
      title: '名言ファインダー',
      debugShowCheckedModeBanner: false,
      theme: theme.data,
      builder: LoadingScreen.init(),
      routerConfig: router,
    );
  }
}
