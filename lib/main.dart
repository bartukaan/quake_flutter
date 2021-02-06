import 'package:flutter/material.dart';
import 'package:quake_flutter/utilities/notification_handler.dart';
import 'package:workmanager/workmanager.dart';

import 'screens/home_screen.dart';

//void main() => runApp(MyApp());
void main() {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager.initialize(

      // The top level function, aka callbackDispatcher
      callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: false);
  // Periodic task registration
  Workmanager.registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    "simplePeriodicTask",

    // When no frequency is provided
    // the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change
    // your frequency to 15 min
    // if you have configured a lower frequency.
    frequency: Duration(minutes: 15),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Luna Smart Meter',
        theme: ThemeData(
            // fontFamily: 'Genel',
            //  primarySwatch: Colors.teal,
            //  accentColor: Colors.orangeAccent),
            ),
        home: HomeScreen());
  }

  @override
  void initState() {
    super.initState();
    NotificationHandler().initializeFCMNotification(context);
    NotificationHandler.requestPermissions();
  }
}
