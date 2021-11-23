import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/server.dart';
import 'package:http/http.dart' as http;

class detailScreen extends StatefulWidget {
  final id;
  const detailScreen({Key? key, this.id}) : super(key: key);

  @override
  _detailScreenState createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Map<dynamic, dynamic> data = new Map();
  bool loading = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    fethdata();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.id);
    return SafeArea(
      bottom: false,
      child: Buldbody(),
    );
  }

  void fethdata() async {
    var url = Uri.parse('$uri/detail/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    Map<dynamic, dynamic> jsonRespons =
        jsonDecode(utf8.decode(response.bodyBytes));
    data = jsonRespons;
    // print(jsonRespons['data']['name']);
    setState(() {
      loading = false;
    });
  }

  Widget Buldbody() {
    if (loading) {
      return Center(
        child: SpinKitChasingDots(
          color: gr,
          size: 50.0,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('اطلاعات کارآموزی',
            style: Theme.of(context).textTheme.headline1),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
        child: new Column(
          children: [
            new Card(
              elevation: 0,
              color: bgDark,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.7,
                width: double.infinity,
                decoration: new BoxDecoration(
                    border: Border.all(
                      color: gr,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: bgDark),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: new Column(
                      children: [
                        new Row(
                          children: [
                            new Text(
                              'نام کارآموز:',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            new Text(
                              '  ${data['data']['name']}',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        new Row(
                          children: [
                            new Text(
                              'استاد مربوطه:',
                              style: data['data']['verify']
                                  ? Theme.of(context).textTheme.headline2
                                  : Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: 14),
                            ),
                            data['data']['verify']
                                ? (new Text(
                                    '  ${data['data']['ostad']}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ))
                                : (new Text(
                                    '  ${data['data']['ostad']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(fontSize: 10),
                                  )),
                            SizedBox(
                              width: 5,
                            ),
                            data['data']['verify']
                                ? (Icon(
                                    Icons.check_box,
                                    color: gr,
                                  ))
                                : Icon(
                                    Icons.dangerous_outlined,
                                    color: Colors.red,
                                    semanticLabel: 'Danger',
                                  ),
                            new SizedBox(
                              width: 5,
                            ),
                            data['data']['verify']
                                ? (new Text(
                                    'تایید شده',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ))
                                : new Text(
                                    'هنوز تایید نشده',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          fontSize: 10,
                                          color: Colors.red,
                                        ),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        new Row(
                          children: [
                            new Text(
                              'سرپرست کارآموزی:',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            new Text(
                              '  ${data['data']['sarparast']}',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        new Row(
                          children: [
                            new Text(
                              'محل کارآموزی:',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            new Text(
                              '  ${data['data']['kar_location']}',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        new Row(
                          children: [
                            new Text(
                              ' جمع ساعت های کارآموزی:',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            new Text(
                              '  ${data['data']['hour']} ساعت',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 2,
                child: new Image.asset('images/uni.jpg'))
          ],
        ),
      ),
    );
  }
}
