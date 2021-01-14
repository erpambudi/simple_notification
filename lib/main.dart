import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_notification/ui/detail_page.dart';
import 'package:simple_notification/ui/home_page.dart';
import 'package:simple_notification/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  ///Untuk menjalankan suatu proses difungsi main()
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();

  ///proses inisiasi notifikasi
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  ///proses request permission IOS
  _notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(MaterialApp(
    initialRoute: HomePage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      DetailPage.routeName: (context) => DetailPage(),
    },
  ));
}
