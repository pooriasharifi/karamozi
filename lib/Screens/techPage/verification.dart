import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:karamozi/module/server.dart';
import '../../constans.dart';

class verificationScreen extends StatefulWidget {
  final id;
  final sign;
  const verificationScreen({Key? key, this.id, this.sign}) : super(key: key);

  @override
  _verificationScreenState createState() => _verificationScreenState();
}

class _verificationScreenState extends State<verificationScreen> {
  @override
  bool loading = true;
  bool known = false;
  List count = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return SafeArea(
      bottom: true,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (loading) {
      return Center(
        child: SpinKitChasingDots(
          color: gr,
          size: 50.0,
        ),
      );
    } else if (known) {
      return Center(
          child: Text(
        'درخواستی وجود ندارد',
        style: Theme.of(context).textTheme.headline1,
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'درخواست های ارسال شده',
          style: Theme.of(context).textTheme.headline1,
        ),
        automaticallyImplyLeading: false,
      ),
      body: new Column(
        children: [
          new Expanded(
              child: ListView.builder(
                  itemCount: count.length,
                  itemBuilder: (BuildContext context, int index) {
                    var naemd = count[index];
                    return new Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: new Material(
                          color: bgDark,
                          elevation: 4,
                          shadowColor: gr,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: gr,
                                  width: 1,
                                ),
                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: new ListTile(
                                  // contentPadding: EdgeInsets.symmetric(
                                  //   horizontal:
                                  //       MediaQuery.of(context).size.width * 0.3,
                                  // ),
                                  title: Row(
                                    children: [
                                      new Text(
                                        'ارسال شده توسط :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      new Text(
                                        '${naemd['name']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            confirm(js: naemd['username']);
                                          },
                                          child: new Icon(Icons.check_box,
                                              color: gr, size: 30)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          remove(js: naemd['username']);
                                        },
                                        child: new Icon(
                                          Icons.cancel,
                                          size: 30,
                                          color: Color(0XFF551F12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  void fetchData() async {
    var url = Uri.parse('$uri/verification/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      print(data['data'][0]);
      // print(data[0]);
      for (var item in data['data']) {
        print(item['name']);
        count.add(item);
        setState(() {
          loading = false;
        });
      }
    } else if (response.statusCode == 500) {
      // Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      // print(data);
      setState(() {
        loading = false;
        known = true;
      });
    } else if (response.statusCode == 404) {
      setState(() {
        loading = false;
        known = true;
      });
    }
  }

  void confirm({js}) async {
    var url = Uri.parse('$uri/ostadTap/$js');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"},
        body: json.encode({'verify': true}));
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    print(jsonResponse);
    setState(() {
      count.clear();
      fetchData();
    });
  }

  void remove({js}) async {
    var url = Uri.parse('$uri/remove/$js');
    var response = await http.post(url,
        headers: {"Content-type": "application/json"},
        body: json.encode(
            {'verify': false, 'sign': 0, 'ostad': 'استاد دیگری انتخاب کنید'}));
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    print(jsonResponse);
    setState(() {
      count.clear();
      fetchData();
    });
  }
}
