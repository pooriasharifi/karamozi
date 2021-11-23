import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:karamozi/Screens/karamozPage/mainKar.dart';
import 'package:karamozi/Screens/karamozPage/menuKar.dart';
import 'package:karamozi/Screens/karamozPage/signup.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/butn.dart';
import 'package:karamozi/module/server.dart';
import 'package:karamozi/module/txtform.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class karamozScreen extends StatefulWidget {
  const karamozScreen({Key? key}) : super(key: key);

  @override
  _karamozScreenState createState() => _karamozScreenState();
}

class JosKeys {
  static final josKeys1 = GlobalKey<FormState>();
  static final josKeys2 = GlobalKey<FormState>();
}

class _karamozScreenState extends State<karamozScreen> {
  Map data = new Map();
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    new Container(
                        height: 62,
                        width: 349,
                        child: Form(
                            key: JosKeys.josKeys1,
                            child: new TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "شماره دانشجویی خود را وارد کنید";
                                } else if (value.length < 6) {
                                  return "شماره دانشجویی خود را به درستی وارد کنید";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                color: whiteTxt,
                              ),
                              cursorColor: gr.withOpacity(1),
                              textAlign: TextAlign.center,
                              obscureText: false,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onSaved: (value) {
                                var username = int.parse(value!);
                                print(username);
                                data['username'] = username;
                              },
                              decoration: InputDecoration(
                                // contentPadding: Edge∂ertical: 20),
                                // filled: true,
                                labelText: 'شماره دانشجویی',
                                fillColor: gr.withOpacity(1),
                                labelStyle:
                                    Theme.of(context).textTheme.headline2,
                                suffixIcon: Icon(
                                  Icons.card_membership_rounded,
                                  size: 16,
                                  color: whiteTxt,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17.5),
                                  borderSide: BorderSide(color: whiteTxt),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17.5),
                                  borderSide: BorderSide(color: gr),
                                ),
                              ),
                            ))),
                    new SizedBox(
                      height: 11,
                    ),
                    new Container(
                        height: 62,
                        width: 349,
                        child: Form(
                            key: JosKeys.josKeys2,
                            child: new TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "رمز عبور را وارد کنید";
                                } else if (value.length < 6) {
                                  return "رمز عبور را به درستی وارد کنید";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                color: whiteTxt,
                              ),
                              cursorColor: gr,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              onSaved: (value) {
                                var password = value;
                                print(password);
                                data['password'] = password;
                              },
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(
                                //     horizontal: 50, vertical: 20),
                                filled: true,
                                labelText: 'رمز عبور',
                                fillColor: bgDark,
                                labelStyle:
                                    Theme.of(context).textTheme.headline2,
                                suffixIcon: Icon(
                                  Icons.lock_open_outlined,
                                  size: 16,
                                  color: whiteTxt,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17.5),
                                  borderSide: BorderSide(color: whiteTxt),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17.5),
                                  borderSide: BorderSide(color: gr),
                                ),
                              ),
                            ))),
                    new SizedBox(
                      height: 11,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: new Text(
                        ' ساخت حساب کاربری',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: new Container(
                  child: new InkWell(
                      child: new bottonWidget(
                        heightContainer: 59,
                        widthContainer: 353,
                        hasBorder: false,
                        customCr: false,
                        cr: gr,
                        title: 'ورود',
                        txtStyle: false,
                        txTheme: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        // if (JosKeys.josKeys1.currentState!.validate() &&
                        //     JosKeys.josKeys2.currentState!.validate()) {
                        JosKeys.josKeys1.currentState!.save();
                        JosKeys.josKeys2.currentState!.save();
                        var js = json.encode(data);
                        print(js);

                        sendLogin(js: js);
                        // }
                        // JosKeys.josKeys1.currentState!.save();
                        // JosKeys.josKeys2.currentState!.save();
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  void sendLogin({js}) async {
    var url = Uri.parse('$uri/signin');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: js);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print(jsonResponse);
      if (jsonResponse['status'] == 200) {
        user_info(jsonResponse['username']);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => menuKarScreen(
                      id: jsonResponse['username'],
                    )));
        showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: 'ورود موفقیت آمیز',
              // backgroundColor: Colors.amber,
            ));
      } else {
        showTopSnackBar(context,
            CustomSnackBar.error(message: '${jsonResponse['message']}'));
      }
    }

    // if (stcod == 200) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => menuKarScreen()));
    //   showTopSnackBar(
    //       context, CustomSnackBar.success(message: 'ورود موفقیت آمیز'));
    // } else {
    //   showTopSnackBar(
    //       context, CustomSnackBar.error(message: '${jsonResponse['msg']}'));
    // }
    // print(jsonResponse);
  }
}
