import 'package:flutter/material.dart';
import 'package:karamozi/Screens/karamozPage/detail.dart';
import 'package:karamozi/Screens/karamozPage/mainKar.dart';
import 'package:karamozi/constans.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class menuKarScreen extends StatefulWidget {
  final id;
  menuKarScreen({Key? key, this.id}) : super(key: key);

  @override
  _menuKarScreenState createState() => _menuKarScreenState();
}

class _menuKarScreenState extends State<menuKarScreen> {
  var _currentIndex = 0;
  List _namedPage = ['Home', 'detail'];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(_currentIndex);
    // print(widget.id);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(
                () => _currentIndex = i,
              );
            },
            itemPadding: EdgeInsets.all(20),
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
                icon: Icon(Icons.more),
                title: Text(
                  'گزارش',
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
      return detailScreen(
        id: widget.id,
      );
    } else {
      return mainKarScreen(id: widget.id);
    }
  }
}
