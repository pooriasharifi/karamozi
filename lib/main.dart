import 'package:flutter/material.dart';
import 'package:karamozi/Screens/splash.dart';
import 'package:karamozi/constans.dart';

void main() {
  runApp(mainApp());
}

class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  _mainAppState createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: bgDark.withOpacity(1)),
      home: splashScreen(),
    );
  }
}
