import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamozPage/detail.dart';
import 'package:karamozi/Screens/karamozPage/menuKar.dart';
import 'package:karamozi/constans.dart';
import 'package:karamozi/module/server.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class whosing extends StatefulWidget {
  final id;
  const whosing({Key? key, this.id}) : super(key: key);

  @override
  _whosingState createState() => _whosingState();
}

class JosKeys {
  static final josKeys1 = GlobalKey<FormState>();
  static final josKeys2 = GlobalKey<FormState>();
}

class _whosingState extends State<whosing> {
  List ostadli = [];
  List name = [];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fethOstadList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildbody(),
    );
  }

  Widget _buildbody() {
    if (loading) {
      return Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            color: gr,
          ),
        ),
      );
    }
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: new Container(
                    height: 62,
                    width: 349,
                    child: Form(
                        key: JosKeys.josKeys1,
                        child: new TextFormField(
                          style: TextStyle(
                            color: whiteTxt,
                          ),
                          cursorColor: gr.withOpacity(1),
                          textAlign: TextAlign.center,
                          obscureText: false,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            // contentPadding: Edge∂ertical: 20),
                            // filled: true,
                            labelText: 'جستجو',
                            fillColor: gr.withOpacity(1),
                            labelStyle: Theme.of(context).textTheme.headline2,
                            suffixIcon: Icon(
                              Icons.search,
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
                          onChanged: (String val) {
                            ostadli.clear();
                            if (val.isEmpty) {
                              ostadli.addAll(name);
                            } else {
                              name.forEach((element) {
                                if (element['name'].toString().contains(val)) {
                                  ostadli.add(element);
                                }
                              });
                            }
                            setState(() {});
                          },
                        ))),
              ),
              new Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: ostadli.length,
                      itemBuilder: (BuildContext context, int index) {
                        var named = ostadli[index];
                        return new Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            elevation: 5,
                            color: bgDark,
                            shadowColor: gr,
                            child: Container(
                              child: new ListTile(
                                onTap: () {
                                  Map data = new Map();
                                  data['sign'] = named['sign'];
                                  data['ostad'] = named['name'];
                                  var js = jsonEncode(data);
                                  sendOstad(js: js);
                                },
                                title: Center(
                                  child: Text(
                                    '${named['name']}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void fethOstadList() async {
    var url = Uri.parse('$uri/fetchOstad/${widget.id}');
    var respons = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (respons.statusCode == 200) {
      Map<dynamic, dynamic> jsonResponse =
          json.decode(utf8.decode(respons.bodyBytes));
      print(jsonResponse);
      for (var i in jsonResponse['data']) {
        ostadli.add(i);
      }
      name.addAll(ostadli);
    }
    name.removeAt(0);
    name.removeAt(0);
    ostadli.removeAt(0);
    ostadli.removeAt(0);
    setState(() {
      loading = false;
    });
  }

  void sendOstad({js}) async {
    var url = Uri.parse('$uri/secondreq/${widget.id}');
    var respons = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: js);
    var jsonrespons = json.decode(utf8.decode(respons.bodyBytes));
    if (jsonrespons['status'] == 200) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => menuKarScreen(
                    id: widget.id,
                  )));
      showTopSnackBar(context,
          CustomSnackBar.success(message: "درخواست با موفقیت ارسال شد"));
    } else {
      showTopSnackBar(
          context, CustomSnackBar.error(message: "${jsonrespons['message']}"));
    }
  }
}
