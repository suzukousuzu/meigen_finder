import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:meigen_finder/presentation/components/analytics/event_type.dart';

Future<void> eventLog(EventType eventType) async {
  await FirebaseAnalytics.instance.logEvent(
    name: eventType.name,
  );
}
