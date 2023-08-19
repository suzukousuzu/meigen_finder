import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/application/init/init_app.dart';
import 'package:meigen_finder/presentation/routing/router.dart';
import 'package:meigen_finder/presentation/theme/mf_theme.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
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
      ref.read(initAppProvider).execute();
      return;
    }, const []);
    return MaterialApp.router(
      title: '名言ファインダー',
      theme: theme.data,
      routerConfig: router,
    );
  }
}
