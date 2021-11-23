import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamoz.dart';
import 'package:karamozi/Screens/teacher.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/butn.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:karamozi/module/server.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
          new Center(
            child: new Column(
              children: [
                new Text(
                  'مدیریت کارآموزی',
                  style: Theme.of(context).textTheme.headline1,
                ),
                new SizedBox(
                  height: 20,
                ),
                Container(
                  child: new GestureDetector(
                    child: bottonWidget(
                      heightContainer: 59,
                      widthContainer: 353,
                      hasBorder: false,
                      title: 'ورود اساتید',
                      txtStyle: false,
                      txTheme: Theme.of(context).textTheme.headline2,
                    ),
                    onTap: () async {
                      try {
                        var url = Uri.parse('$uri');
                        var respons = await http.get(url,
                            headers: {"Content-type": "application/json"});
                        if (respons.statusCode == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => teacherScreen()));
                        } else {
                          showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                  message: 'دستگاه شما به سرور متصل نیست'));
                        }
                      } catch (e) {
                        print(e);
                      }
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
                      title: 'ورود کارآموز',
                      txtStyle: false,
                      txTheme: Theme.of(context).textTheme.headline3,
                    ),
                    onTap: () async {
                      // try {
                      //   final result =
                      //       await InternetAddress.lookup('127.0.0.1 5000');
                      //   if (result.isNotEmpty &&
                      //       result[0].rawAddress.isNotEmpty) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => karamozScreen()));
                      //   } else {
                      //     showTopSnackBar(
                      //         context,
                      //         CustomSnackBar.error(
                      //             message: 'دستگاه شما به سرور متصل نیست'));
                      //   }
                      // } on SocketException catch (_) {
                      //   print('not connected');
                      // }
                      try {
                        var url = Uri.parse('$uri');
                        var respons = await http.get(url,
                            headers: {"Content-type": "application/json"});
                        if (respons.statusCode == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => karamozScreen()));
                        } else {
                          showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                  message: 'دستگاه شما به سرور متصل نیست'));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          new SizedBox(
            height: 66.7,
          ),
          new GestureDetector(
              onTap: () {},
              child: new Text(
                'privacy&policy',
                style: TextStyle(
                  color: whiteTxt,
                ),
              ))
        ],
      )),
    );
  }
}
