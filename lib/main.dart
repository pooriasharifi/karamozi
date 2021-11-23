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
      theme: ThemeData(
        scaffoldBackgroundColor: bgDark.withOpacity(1),
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B1017),
                fontFamily: 'vazir'),
            headline2: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B1017),
                fontFamily: 'vazir'),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9F5C49),
                fontFamily: 'vazir')),
        appBarTheme: AppBarTheme(
          color: bgDark.withOpacity(1),
          elevation: 0,
        ),
      ),
      home: splashScreen(),
    );
  }
}
