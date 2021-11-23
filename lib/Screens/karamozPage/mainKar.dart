import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:karamozi/Screens/karamoz.dart';
import 'package:karamozi/Screens/karamozPage/menuKar.dart';
import 'package:karamozi/Screens/karamozPage/whosing.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/bloc.dart';
import 'package:karamozi/module/butn.dart';
import 'package:karamozi/module/server.dart';
import 'package:karamozi/module/txtform.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

class mainKarScreen extends StatefulWidget {
  final id;
  const mainKarScreen({Key? key, this.id}) : super(key: key);

  @override
  _mainKarScreenState createState() => _mainKarScreenState();
}

Map<dynamic, dynamic> dataSend = new Map();
Map<dynamic, dynamic> dataFetched = new Map();
Map<dynamic, dynamic> totalTime = new Map();

class JosKeys {
  static final josKeys1 = GlobalKey<FormState>();
  static final josKeys2 = GlobalKey<FormState>();
  static final josKeys3 = GlobalKey<FormState>();
}

class _mainKarScreenState extends State<mainKarScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool loading = true;
  bool known = false;
  bool verify = false;
  bool sign = false;
  List count = [];
  TimeOfDay? _pickedTime;
  DateTime? _pickedDate;
  bool read = false;
  int time = 0;
  Map<dynamic, dynamic> data = new Map();
  bool loading2 = true;
// const List<Entry> data = <Entry>[
  int itemno = 4;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
    fethdata2();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(bottom: false, child: _buildBody());
  }

  _openSheet() async {
    final option = await showGeneralDialog(
        context: context,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        barrierLabel: MaterialLocalizations.of(context).dialogLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, _, __) {
          return SafeArea(
            child: Material(
              color: mat,
              child: new Container(
                // color: Colors.transparent,
                height: MediaQuery.of(context).size.height / 2,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: bgDark),
                child: new Column(
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    new SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: new Container(
                        color: greyTxt,
                        height: 3,
                        width: 46,
                      ),
                    ),
                    new SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // new Expanded(
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 20),
                          //     child: new Form(
                          //         key: JosKeys.josKeys1,
                          //         child: Container(
                          //           child: Directionality(
                          //             textDirection: TextDirection.rtl,
                          //             child: new TextFormField(
                          //                 onSaved: (val) {
                          //                   var date = val;
                          //                   dataSend['date'] = date;
                          //                   // print(date);
                          //                 },
                          //                 keyboardType: TextInputType.datetime,
                          //                 style: TextStyle(color: whiteTxt),
                          //                 textInputAction: TextInputAction.done,
                          //                 textAlign: TextAlign.right,
                          //                 cursorColor: gr.withOpacity(1),
                          //                 decoration: new InputDecoration(
                          //                     enabledBorder: OutlineInputBorder(
                          //                       borderRadius:
                          //                           BorderRadius.circular(17.5),
                          //                       borderSide:
                          //                           BorderSide(color: whiteTxt),
                          //                     ),
                          //                     focusedBorder: OutlineInputBorder(
                          //                       borderRadius:
                          //                           BorderRadius.circular(17.5),
                          //                       borderSide:
                          //                           BorderSide(color: gr),
                          //                     ),
                          //                     alignLabelWithHint: true,
                          //                     fillColor:
                          //                         greyTxt.withOpacity(0.1),
                          //                     border:
                          //                         new OutlineInputBorder())),
                          //           ),
                          //         )),
                          //   ),
                          // ),
                          // new SizedBox(
                          //   width: 10,
                          // ),
                          // new Text(
                          //   ':مورخ ',
                          //   style: Theme.of(context).textTheme.headline2,
                          // ),
                          // new SizedBox(
                          //   width: 10,
                          // ),
                          // new Icon(
                          //   Icons.more_horiz_rounded,
                          //   color: whiteTxt,
                          // ),

                          // RaisedButton(
                          //   child: Text(
                          //     'تعداد ساعات امروز',
                          //     style: Theme.of(context).textTheme.headline3,
                          //   ),
                          //   onPressed: () async {
                          //     // Time picker
                          //     final TimeOfDay? time =
                          //         await showPersianTimePicker(
                          //       context: context,
                          //     );

                          //     setState(() {
                          //       _pickedTime = time;
                          //       print(DateTime.parse(_pickedTime.toString()));
                          //     });

                          //     // Date picker
                          //   },
                          // ),

                          new RaisedButton(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 20),
                                child: Text('تاریخ',
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              onPressed: () async {
                                final DateTime? date =
                                    await showPersianDatePicker(
                                  context: context,
                                  color: Colors.red,
                                );

                                setState(() {
                                  // onSaved:
                                  // (val) {
                                  //   var date = val;
                                  //   print(date);
                                  //   dataSend['date'] =
                                  //       DateTime.parse(_pickedDate.toString())
                                  //           .toPersianDate()
                                  //           .toString();
                                  //   // print(date);
                                  // };
                                  _pickedDate = date;
                                  dataSend['date'] =
                                      DateTime.parse(_pickedDate.toString())
                                          .toPersianDate()
                                          .toString();
                                  print(DateTime.parse(_pickedDate.toString())
                                      .toPersianDate()
                                      .toString());

                                  // DateTime.parse(_pickedDate.toString())
                                  //     .toPersianDate()
                                  //     .toString();
                                });
                              })
                        ],
                      ),
                    ),
                    new Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 25),
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  new Container(
                                    height: MediaQuery.of(context).size.height /
                                        3.7,
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: new Form(
                                        key: JosKeys.josKeys1,
                                        child: Container(
                                          height: 20,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: new TextFormField(
                                                onSaved: (val) {
                                                  var comment = val;
                                                  // print(comment);
                                                  dataSend['comment'] = comment;
                                                },
                                                style:
                                                    TextStyle(color: whiteTxt),
                                                textInputAction:
                                                    TextInputAction.newline,
                                                textAlign: TextAlign.right,
                                                cursorColor: gr.withOpacity(1),
                                                maxLines: 10,
                                                decoration: new InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.5),
                                                      borderSide: BorderSide(
                                                          color: whiteTxt),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.5),
                                                      borderSide:
                                                          BorderSide(color: gr),
                                                    ),
                                                    labelText: 'گزارش',
                                                    labelStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .headline2,
                                                    alignLabelWithHint: true,
                                                    fillColor: whiteTxt,
                                                    border:
                                                        new OutlineInputBorder())),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        new Text(
                                          'تعداد ساعات امروز  ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: Form(
                                              key: JosKeys.josKeys2,
                                              child: new TextFormField(
                                                style: TextStyle(
                                                  color: whiteTxt,
                                                ),
                                                cursorColor: gr.withOpacity(1),
                                                textAlign: TextAlign.center,
                                                obscureText: false,
                                                onSaved: (val) {
                                                  time = int.parse(val!);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  // contentPadding: Edge∂ertical: 20),
                                                  // filled: true,
                                                  labelText: 'از',
                                                  fillColor: gr.withOpacity(1),
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline2,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                    borderSide: BorderSide(
                                                        color: whiteTxt),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                    borderSide:
                                                        BorderSide(color: gr),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        new SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: Form(
                                              key: JosKeys.josKeys3,
                                              child: new TextFormField(
                                                style: TextStyle(
                                                  color: whiteTxt,
                                                ),
                                                cursorColor: gr.withOpacity(1),
                                                textAlign: TextAlign.center,
                                                obscureText: false,
                                                onSaved: (val) {
                                                  time = int.parse(val!) - time;
                                                  dataSend['timer'] = time;
                                                  totalTime['hour'] = time;
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  // contentPadding: Edge∂ertical: 20),
                                                  // filled: true,
                                                  labelText: 'تا',
                                                  fillColor: gr.withOpacity(1),
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline2,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                    borderSide: BorderSide(
                                                        color: whiteTxt),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                    borderSide:
                                                        BorderSide(color: gr),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  new Container(
                                    child: new InkWell(
                                        child: new bottonWidget(
                                          heightContainer: 59,
                                          widthContainer: 353,
                                          hasBorder: false,
                                          customCr: false,
                                          cr: gr,
                                          title: 'ثبت',
                                          txtStyle: false,
                                          txTheme: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        onTap: () {
                                          JosKeys.josKeys1.currentState!.save();
                                          JosKeys.josKeys2.currentState!.save();
                                          JosKeys.josKeys3.currentState!.save();
                                          var hourjs = json.encode(totalTime);
                                          var js = json.encode(dataSend);
                                          // print(js);
                                          // setState(() {});
                                          sendComment(js: js);
                                          sendTime(js: hourjs);
                                        }),
                                  ),
                                ],
                              ),
                              FloatingActionButton(
                                elevation: 0,
                                highlightElevation: 4,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.cancel,
                                  size: 60,
                                ),
                                backgroundColor: bgDark,
                                foregroundColor: Colors.red,
                                isExtended: true,
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (loading && loading2) {
      return Center(
        child: new SpinKitChasingDots(
          color: gr,
          size: 50.0,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'گزارش کارآموزی : ${data['data']['name']}',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        backgroundColor: bgDark,
      ),
      backgroundColor: bgDark,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            read
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => whosing(
                                          id: widget.id,
                                        )));
                          },
                          child: new bottonWidget(
                            heightContainer: 60,
                            widthContainer: MediaQuery.of(context).size.width,
                            hasBorder: false,
                            txtStyle: false,
                            txTheme: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.white),
                            customCr: false,
                            cr: gr.withOpacity(.8),
                            title: '''    هنوز استادی را انتخاب نکرده اید
برای انتخاب استاد اینجا را لمس کنید''',
                          ),
                        ),
                      ),
                    ),
                  )
                : new Container(),
            verify
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => whosing(
                                          id: widget.id,
                                        )));
                          },
                          child: new bottonWidget(
                            heightContainer: 60,
                            widthContainer: MediaQuery.of(context).size.width,
                            hasBorder: false,
                            txtStyle: false,
                            txTheme: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.white),
                            customCr: false,
                            cr: gr.withOpacity(.8),
                            title: '''  استاد به دلایلی شما را رد کرده 
  برای درخواست اینجا را لمس کنید''',
                          ),
                        ),
                      ),
                    ),
                  )
                : new Container(),
            new Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      //  entrItem(data[index])
                      var named = count[index];
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: bgDark,
                            borderRadius: BorderRadius.circular(25),
                            elevation: 10,
                            shadowColor: gr,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: new ExpansionTile(
                                collapsedBackgroundColor: bgDark,
                                collapsedIconColor: whiteTxt,
                                collapsedTextColor: whiteTxt,
                                iconColor: gr,
                                textColor: gr,
                                title: new Text(
                                  '${named['date']}',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                backgroundColor: bgDark,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: new Text(
                                      '${named['comment']}',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: RichText(
                                            text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                                children: [
                                              TextSpan(text: 'تعداد ساعت:'),
                                              TextSpan(
                                                  text: ' ${named['timer']}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3),
                                              TextSpan(text: ' ساعت'),
                                            ]))
                                        //  Text(
                                        //   ' ',
                                        //   textDirection: TextDirection.rtl,
                                        // )

                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: count.length,
                  ),
                )),
            new Container(
              width: MediaQuery.of(context).size.width / 2,
              color: whiteTxt,
              height: 0.5,
            ),
            new SizedBox(
              height: 20,
            ),
            new InkWell(
              child: Icon(
                Icons.add_circle_outline,
                color: whiteTxt,
                size: 40,
              ),
              onTap: () {
                // setState(() {});
                // setState(() {
                //   fetchdata();
                // });
                return _openSheet();
              },
            ),
            new SizedBox(
              height: 5,
            ),
            new Text(
              'اضافه کردن',
              style: Theme.of(context).textTheme.headline3,
            ),
            new SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  void sendComment({js}) async {
    var url = Uri.parse('$uri/whose/${widget.id}');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: js);
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    // print(jsonResponse);
    if (jsonResponse['status'] == 200) {
      // setState(() {
      //   // fetchdata();
      // });
      setState(() {
        count.clear();
        fetchdata();
      });
      Navigator.pop(context);
      showTopSnackBar(context, CustomSnackBar.success(message: "ثبت شد"));
    } else {
      showTopSnackBar(
          context, CustomSnackBar.error(message: "${jsonResponse['message']}"));
    }
    // setState(() {
    //   loading = true;
    //   // fetchdata();
    // });
  }

  void fetchdata() async {
    var url = Uri.parse('$uri/comment/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    // print(response.statusCode);
    if (response.statusCode == 500) {
      setState(() {
        loading = false;
        known = true;
        showTopSnackBar(
            context,
            CustomSnackBar.info(
              message: 'تاکنون گزارشی ارسال نشده',
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: whiteTxt,
                  fontFamily: 'vazir'),
            ));
      });
    } else {
      Map<dynamic, dynamic> jsonResponse =
          json.decode(utf8.decode(response.bodyBytes));
      print(jsonResponse);

      // dataFetched = jsonResponse;
      print(jsonResponse['data'][0]['sign']);
      for (var i in jsonResponse['data']) {
        if (i['comment'] != null) {
          count.add(i);
        }
        // print(i['comment']);

      }

      setState(() {
        if (jsonResponse['data'][0]['sign'] == 0) {
          sign = true;
          if (jsonResponse['data'][0]['verify'] == false) {
            verify = true;
          }
        }
        if (jsonResponse['data'][0]['sign'] == 1) {
          read = true;
        }
        loading = false;
      });
    }
  }

  void sendTime({js}) async {
    var url = Uri.parse('$uri/hour/${widget.id}');
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: js);
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    print(jsonResponse);
  }

  void fethdata2() async {
    var url = Uri.parse('$uri/detail/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    Map<dynamic, dynamic> jsonRespons =
        jsonDecode(utf8.decode(response.bodyBytes));
    data = jsonRespons;
    // print(jsonRespons['data']['name']);
    setState(() {
      loading2 = false;
    });
  }
}
