import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:karamozi/Screens/techPage/comment.dart';
import 'package:karamozi/constans.dart';
import 'package:http/http.dart' as http;
import 'package:karamozi/module/server.dart';

class mainTechScreen extends StatefulWidget {
  final id;
  const mainTechScreen({Key? key, this.id}) : super(key: key);

  @override
  _mainTechScreenState createState() => _mainTechScreenState();
}

class _mainTechScreenState extends State<mainTechScreen> {
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
    return SafeArea(child: _buildbody());
  }

  Widget _buildbody() {
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
        'کارآموزی وجود ندارد',
        style: Theme.of(context).textTheme.headline1,
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'اسامی کارآموزان',
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
                      var named = count[index];
                      return new Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(25),
                        //   border: Border.all(
                        //     color: gr,
                        //     width: 1,
                        //   ),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: new Material(
                            color: bgDark,
                            borderRadius: BorderRadius.circular(25),
                            elevation: 10,
                            borderOnForeground: true,
                            shadowColor: gr,
                            child: Container(
                              child: new ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => commentScreen(
                                                id: named['username'],
                                                name: named['name'],
                                              )));
                                },
                                // contentPadding: EdgeInsets.symmetric(
                                //   horizontal:
                                //       MediaQuery.of(context).size.width * 0.3,
                                // ),
                                title: Center(
                                  child: new Text(
                                    '${named['name']}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                subtitle: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text('${named['hour']} ساعت'),
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
  }

  void fetchData() async {
    var url = Uri.parse('$uri/asami/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(url);
    if (response.statusCode == 500) {
      print(response.body);
      setState(() {
        loading = false;
        known = true;
      });
    } else if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      // print(data['data'][0]['name']);
      for (var item in data['data']) {
        // print(item['name']);
        count.add(item);
      }
      // print(count);
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
        known = true;
      });
    }
  }
}
