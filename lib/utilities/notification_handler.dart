import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:workmanager/workmanager.dart';

void callbackDispatcher(Map<String, dynamic> message) {
  Workmanager.executeTask((task, inputData) {
    NotificationHandler.showNotification(message);
    return Future.value(true);
  });
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print("Arkaplanda gelen data: " + message["data"].toString());
    NotificationHandler.showNotification(message);
  }

/*  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }*/

  // Or do other work.
}

class NotificationHandler {
  FirebaseMessaging _fcm = FirebaseMessaging();



  static final NotificationHandler _singleton = NotificationHandler._internal();

  factory NotificationHandler() => _singleton;

  NotificationHandler._internal();

  BuildContext myContext;

  initializeFCMNotification(BuildContext context) async {
    myContext =
        context; //TODO : eğer bildirime tıklanınca berlirlenen bir sayfaya gönderilecekse gerekli!

    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    _fcm.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _fcm.onIosSettingsRegistered.listen((event) {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _fcm.subscribeToTopic("id");

    String token = await _fcm.getToken();
    print("Token: " + token);

    _fcm.configure(
      //UYGULAMA AÇIK iken bildirime tıklanırsa
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage tetiklendi: $message");
        showNotification(message);
        if (Platform.isIOS) {
          message = _modifyNotificationJson(message);
          _handleNotification(message, true);
        }
        showNotification(message);
      },
      //UYGULAMA KAPALI iken bildirime tıklanırsa
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch tetiklendi: $message");
        showDialog(context: myContext, builder: (context) => Text("$message"));
        if (Platform.isIOS) {
          message = _modifyNotificationJson(message);
          _handleNotification(message, true);
        }
        showNotification(message);
      },
      //UYGULAMA BACKGROUND'da iken bildirime tıklanırsa
      onResume: (Map<String, dynamic> message) async {
        print("onResume tetiklendi: $message");
        showDialog(context: myContext, builder: (context) => Text("$message"));
        if (Platform.isIOS) {
          message = _modifyNotificationJson(message);
          _handleNotification(message, true);
        }
        showNotification(message);
        _handleNotification(message, true);
      },
    );
  }

  unsubscribeTopicHandler(String meterNo, String password) {
    String topic = meterNo + "_" + password;
    _fcm.unsubscribeFromTopic(topic);
  }

  subscribeTopicHandler(String meterNo, String password) {
    String topic = meterNo + "_" + password;
    _fcm.subscribeToTopic(topic);
  }

  /// This method will modify the message format of iOS Notification Data
  Map _modifyNotificationJson(Map<String, dynamic> message) {
    message['data'] = Map.from(message ?? {});
    message['notification'] = message['aps']['alert'];
    return message;
  }

  Future<void> _handleNotification(
      Map<String, dynamic> message, bool dialog) async {
    var data = message['data'] ?? message;
    String expectedAttribute = data['expectedAttribute'];

    /// [...]
    var title = message['data']['title'] ?? message;
    var body = message['data']['body'] ?? message;
    print("Title: " + title + " Body: " + body);
  }

  static void showNotification(Map<String, dynamic> message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, message["data"]["title"],
        message["data"]["message"], platformChannelSpecifics,
        payload: jsonEncode(message));
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint("Notification Pay Load: " + payload);
//TODO: bildirime tıklanıınca yönlendirme yapılacaksa burası kullanılacak
      Map<String, dynamic> gelenNotification = await jsonDecode(payload);
      // Navigator.of(myContext)
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: myContext,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => SecondScreen(payload),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  static void requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}