import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamoz.dart';
import 'package:karamozi/Screens/select.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/butn.dart';
import 'package:karamozi/module/server.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class kes {
  static final kes7 = GlobalKey<FormState>();
  static final kes8 = GlobalKey<FormState>();
  static final kes9 = GlobalKey<FormState>();
  static final kes5 = GlobalKey<FormState>();
  static final kes6 = GlobalKey<FormState>();
}

class _signupState extends State<signup> {
  Map data = new Map();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: _buildbody(),
    );
  }

  Widget _buildbody() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: new Column(
                children: [
                  new Container(
                    height: MediaQuery.of(context).size.height / 6,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                        color: gr,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(25))),
                    child: new Text('ساخت حساب',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white)),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  new Container(
                      height: 62,
                      width: 349,
                      child: Form(
                          key: kes.kes6,
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
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
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
                              labelStyle: Theme.of(context).textTheme.headline2,
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
                    height: 20,
                  ),
                  new Container(
                      height: 62,
                      width: 349,
                      child: Form(
                          key: kes.kes7,
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
                            cursorColor: gr.withOpacity(1),
                            textAlign: TextAlign.center,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              var password = value;
                              data['password'] = password;
                            },
                            decoration: InputDecoration(
                              // contentPadding: Edge∂ertical: 20),
                              // filled: true,
                              labelText: 'رمز عبور',
                              fillColor: gr.withOpacity(1),
                              labelStyle: Theme.of(context).textTheme.headline2,
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
                    height: 20,
                  ),
                  new Container(
                      height: 62,
                      width: 349,
                      child: Form(
                          key: kes.kes8,
                          child: new TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "نام و نام خانوادگی خود را وارد کنید";
                              } else if (value.length < 6) {
                                return "نام و نام خانوادگی خود را به درستی وارد کنید";
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
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              var name = value;
                              data['name'] = name;
                            },
                            decoration: InputDecoration(
                              // contentPadding: Edge∂ertical: 20),
                              // filled: true,
                              labelText: 'نام و نام خانوادگی',
                              fillColor: gr.withOpacity(1),
                              labelStyle: Theme.of(context).textTheme.headline2,
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
                    height: 20,
                  ),
                  new Container(
                      height: 62,
                      width: 349,
                      child: Form(
                          key: kes.kes9,
                          child: new TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "نام محل کارآموزی خود را وارد کنید";
                              } else if (value.length < 6) {
                                return "نام محل کارآموزی خود را به درستی وارد کنید";
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
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              var kar_location = value;
                              data['kar_location'] = kar_location;
                            },
                            decoration: InputDecoration(
                              // contentPadding: Edge∂ertical: 20),
                              // filled: true,
                              labelText: 'محل کارآموزی',
                              fillColor: gr.withOpacity(1),
                              labelStyle: Theme.of(context).textTheme.headline2,
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
                    height: 20,
                  ),
                  new Container(
                      height: 62,
                      width: 349,
                      child: Form(
                          key: kes.kes5,
                          child: new TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "نام سرپرست کارآموزی خود را وارد کنید";
                              } else if (value.length < 6) {
                                return "نام سرپرست کارآموزی خود را به درستی وارد کنید";
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
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              var sarparast = value;
                              data['sarparast'] = sarparast;
                            },
                            decoration: InputDecoration(
                              // contentPadding: Edge∂ertical: 20),
                              // filled: true,
                              labelText: 'سرپرست کارآموزی',
                              fillColor: gr.withOpacity(1),
                              labelStyle: Theme.of(context).textTheme.headline2,
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
                ],
              ),
            ),
            new SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (kes.kes6.currentState!.validate() &&
                    kes.kes7.currentState!.validate() &&
                    kes.kes8.currentState!.validate() &&
                    kes.kes9.currentState!.validate() &&
                    kes.kes5.currentState!.validate()) {
                  kes.kes6.currentState!.save();
                  kes.kes7.currentState!.save();
                  kes.kes8.currentState!.save();
                  kes.kes9.currentState!.save();
                  kes.kes5.currentState!.save();
                  var js = json.encode(data);
                  print(js);
                  sendSignup(js: js);
                }
              },
              child: Container(
                child: new bottonWidget(
                  heightContainer: 60,
                  widthContainer: MediaQuery.of(context).size.width / 2,
                  hasBorder: false,
                  title: 'ثبت نام',
                  txtStyle: false,
                  txTheme: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendSignup({js}) async {
    var url = Uri.parse('$uri/signup');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: js);
    var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    if (jsonResponse['status'] == 200) {
      Navigator.pop(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => selectScreen()));
      showTopSnackBar(
          context, CustomSnackBar.success(message: 'ثبت نام موفقیت آمیز'));
    } else {
      showTopSnackBar(context,
          CustomSnackBar.error(message: 'مشکلی رخ داده مجددا تلاش کنید'));
    }
  }
}
