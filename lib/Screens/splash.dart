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
            new Text(
              'پروژه',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            new Text(
              'نرم افزار مدیریت کارآموزی',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 20,
            ),
            new Text(
              'توسط علی مصطفایی',
              style: Theme.of(context).textTheme.headline2,
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
