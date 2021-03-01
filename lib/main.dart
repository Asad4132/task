import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/login/view/LoginPage.dart';
import 'package:task/test2/NewEventPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.white,
//        statusBarIconBrightness:
//            Brightness.dark //or set color with: Color(0xFF0000FF)
//        ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Material App',
      home: NewEventPage(),
    );
  }
}
