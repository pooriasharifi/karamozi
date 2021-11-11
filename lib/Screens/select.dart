import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamoz.dart';
import 'package:karamozi/Screens/teacher.dart';
import 'package:karamozi/module/butn.dart';

class selectScreen extends StatefulWidget {
  const selectScreen({Key? key}) : super(key: key);

  @override
  _selectScreenState createState() => _selectScreenState();
}

class _selectScreenState extends State<selectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          new Column(
            children: [
              new Text('lorem Ipsum',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              new SizedBox(
                height: 20,
              ),
              Container(
                decoration: new BoxDecoration(

                    //   boxShadow: [
                    //   BoxShadow(
                    //       color: gr,
                    //       spreadRadius: 0,
                    //       blurRadius: 12,
                    //       offset: Offset(0, 3))
                    // ]
                    ),
                child: new GestureDetector(
                  child: bottonWidget(
                    heightContainer: 59,
                    widthContainer: 353,
                    hasBorder: false,
                    title: 'Log In To Account',
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => teacherScreen()));
                  },
                ),
              ),
              new SizedBox(
                height: 40,
              ),
              new Container(
                child: new GestureDetector(
                  child: new bottonWidget(
                      heightContainer: 46.3,
                      widthContainer: 277,
                      hasBorder: true,
                      title: 'Creat New'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => karamozScreen()));
                  },
                ),
              ),
            ],
          ),
          new SizedBox(
            height: 66.7,
          ),
          new GestureDetector(
              onTap: () {},
              child: new Text(
                'privacy&policy',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      )),
    );
  }
}
