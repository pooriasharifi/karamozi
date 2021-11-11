import 'package:flutter/material.dart';
import 'package:karamozi/Screens/select.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  initState() {
    super.initState();
    HandleSplashScreen();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new SizedBox(
              height: 500,
            ),
            new Text(
              'Lorem Ipsum',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  void HandleSplashScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => selectScreen()));
  }
}
