import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'models/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetings_manager/Screens/home.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var initilaizingSettingAndroid = AndroidInitializationSettings('aaaa');
  var initializingSettingIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payLoad) async {});
  var initilializationsetting = InitializationSettings(
      android: initilaizingSettingAndroid, iOS: initializingSettingIOS);
  flutterLocalNotificationsPlugin.initialize(initilializationsetting,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('Notification PayLaod' + payload);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Meeting Manager",
        debugShowCheckedModeBanner: false,
        home: Meeting());
  }
}

class Meeting extends StatefulWidget {
  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Get.to(Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: col,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'MEETINGS \nMANAGER',
                style: TextStyle(
                    color: txtcolor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
