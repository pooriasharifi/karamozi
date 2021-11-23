import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karamozi/Screens/techPage/maintech.dart';
import 'package:karamozi/Screens/techPage/menuTech.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/butn.dart';
import 'package:karamozi/module/server.dart';
import 'package:karamozi/module/txtform.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

class teacherScreen extends StatefulWidget {
  const teacherScreen({Key? key}) : super(key: key);

  @override
  _teacherScreenState createState() => _teacherScreenState();
}

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class JosKeys {
  static final josKeys1 = GlobalKey<FormState>();
  static final josKeys2 = GlobalKey<FormState>();
}

class _teacherScreenState extends State<teacherScreen> {
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
                                  return "کد پرسنلی خود را وارد کنید";
                                } else if (value.length < 6) {
                                  return "کد پرسنلی خود را به درستی وارد کنید";
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                color: whiteTxt,
                              ),
                              cursorColor: gr.withOpacity(1),
                              textAlign: TextAlign.center,
                              obscureText: true,
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
                                labelText: 'کد پرسنلی',
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
                            )))
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
                        sendLogin(js: js);
                        // }
                        // JosKeys.josKeys1.currentState!.save();
                        // JosKeys.josKeys2.currentState!.save();
                        // var js = json.encode(data);
                        // print(js);

                        // sendLogin(js: js);
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  void sendLogin({js}) async {
    var url = Uri.parse('$uri/ostad');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: js);
    print(response.statusCode);

    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    print(jsonResponse);

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
    if (jsonResponse['status'] == 200) {
      user_info(jsonResponse['username']);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => menuTechScreen(
                    id: jsonResponse['username'],
                    // sign: jsonResponse[''],
                  )));
      showTopSnackBar(
          context, CustomSnackBar.success(message: 'ورود موفقیت آمیز'));
    } else {
      showTopSnackBar(
          context, CustomSnackBar.error(message: '${jsonResponse['data']}'));
    }
    setState(() {
      loading = false;
    });
  }
}
