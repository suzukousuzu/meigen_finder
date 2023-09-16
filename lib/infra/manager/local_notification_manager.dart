import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

final localNotificationManagerProvider =
    Provider<LocalNotificationManager>((ref) {
  return LocalNotificationManager();
});

class LocalNotificationManager {
  Future<void> init() async {
    // tz.initializeTimeZones();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // your call back to the UI
      },
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleDaily8PMNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('daily_8pm_channel_id', 'Daily 8PM Channel',
            channelDescription: "CHANNEL_DESCRIPTION 1",
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const iosChannelSpecifics = DarwinNotificationDetails(
        //sound: 'my_sound.aiff',
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosChannelSpecifics,
    );

    // 時間を日本時間の午後8時に設定します
    final tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation('Asia/Tokyo'));
    final tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.getLocation('Asia/Tokyo'), now.year, now.month, now.day, 21, 56);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Scheduled Title',
        'Scheduled Body', scheduledDate, platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }
}
