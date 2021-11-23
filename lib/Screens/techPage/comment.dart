import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/server.dart';

class commentScreen extends StatefulWidget {
  final name;
  final id;
  const commentScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  _commentScreenState createState() => _commentScreenState();
}

class _commentScreenState extends State<commentScreen> {
  bool loading = true;
  List count = [];
  bool known = false;
  Map<dynamic, dynamic> dataFetched = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.id);
    // print(widget.name);
    return SafeArea(
      bottom: false,
      child: _buldBody(),
    );
  }

  Widget _buldBody() {
    if (loading) {
      return Center(
        child: SpinKitChasingDots(
          color: gr,
          size: 50.0,
        ),
      );
    } else if (known) {
      return new Center(
          child: new Text(
        "گزارشی وجود ندارد",
        style: Theme.of(context).textTheme.headline1,
      ));
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'گزارش کارآموزی : ${widget.name}',
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
            Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: gr),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [
                    Colors.brown.shade50,
                    gr,
                    // Colors.brown.shade100,
                    Colors.brown.shade50,
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: new Text(
                  'جمع ساعت های کارآموز : ${count[0]['hour']} ساعت',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            new Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: count.length == 1
                      ? new Center(
                          child: new Text(
                          "گزارشی وجود ندارد",
                          style: Theme.of(context).textTheme.headline1,
                        ))
                      : ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            //  entrItem(data[index])
                            var named = count[index];
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(25),
                                  color: bgDark,
                                  elevation: 10,
                                  shadowColor: gr,

                                  // return ExpansionTile(
//       // backgroundColor: bgDark,
//       textColor: gr,
//       iconColor: gr,
//       collapsedIconColor: whiteTxt,
//       collapsedTextColor: whiteTxt,
//       title: Text(
//         root.title,
//       ),
//       key: PageStorageKey<Entry>(root),
//       children: [
//         new Column(
//           children: root.childen.map(_buildTiles).toList(),
//         ),

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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      backgroundColor: bgDark,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: new Text(
                                            '${named['comment']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
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
                                                    TextSpan(
                                                        text: 'تعداد ساعت:'),
                                                    TextSpan(
                                                        text:
                                                            ' ${named['timer']}',
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
          ],
        ),
      ),
    );
  }

  void fetchdata() async {
    var url = Uri.parse('$uri/comment/${widget.id}');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 500) {
      setState(() {
        loading = false;
        known = true;
      });
    } else if (response.statusCode == 200) {
      Map<dynamic, dynamic> jsonResponse =
          json.decode(utf8.decode(response.bodyBytes));
      json.decode(utf8.decode(response.bodyBytes));
      dataFetched = jsonResponse;
      print(jsonResponse);
      // print(dataFetched['data'][0]['comment']);
      for (var i in jsonResponse['data']) {
        // print(i['comment']);
        count.add(i);
      }
      // print(count);

      setState(() {
        loading = false;
      });
    } else if (response.statusCode == 208) {
      setState(() {
        loading = false;
        known = true;
      });
    }

    setState(() {
      loading = false;
    });
  }
}
