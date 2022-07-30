import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'channel description',
          importance: Importance.max),
    );
  }

  static Future init({bool initScheduled = false}) async {
    const settings = InitializationSettings(
        android: AndroidInitializationSettings('app_icon'));
    await _notification.initialize(settings,
        onSelectNotification: (payload) async {});
  }

  static Future showNotification(
          {required int id,
          String? title,
          String? body,
          String? payload}) async =>
      _notification.show(id, title, body, await _notificationDetails());

  static Future showScheduleNotification(
      {required int id,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduleDate}) async {
    tz.initializeTimeZones();
    return _notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleDate, tz.local),
        await _notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
