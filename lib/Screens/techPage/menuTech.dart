import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamozPage/detail.dart';
import 'package:karamozi/Screens/karamozPage/mainKar.dart';
import 'package:karamozi/Screens/techPage/maintech.dart';
import 'package:karamozi/Screens/techPage/verification.dart';
import 'package:karamozi/constans.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class menuTechScreen extends StatefulWidget {
  final id;
  final sign;
  const menuTechScreen({Key? key, this.id, this.sign}) : super(key: key);

  @override
  _menuTechScreenState createState() => _menuTechScreenState();
}

class _menuTechScreenState extends State<menuTechScreen> {
  var _currentIndex = 0;
  List _namedPage = ['Home', 'detail'];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(
                () => _currentIndex = i,
              );
            },
            itemPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'خانه',
                  style: Theme.of(context).textTheme.headline2,
                ),
                selectedColor: gr,
                unselectedColor: gry,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.request_page_outlined),
                title: Text(
                  'درخواست  ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                selectedColor: gr,
                unselectedColor: gry,
              )
            ],
          ),
        ),
        body: buildbody(),
      ),
    );
  }

  buildbody() {
    if (_currentIndex == 0) {
      return mainTechScreen(
        id: widget.id,
      );
    } else {
      return verificationScreen(
        id: widget.id,
        sign: widget.sign,
      );
    }
  }
}
