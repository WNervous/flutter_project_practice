import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_practice/routes/curse_page.dart';
import 'package:flutter_project_practice/routes/game_page.dart';
import 'package:flutter_project_practice/routes/home_page.dart';
import 'package:flutter_project_practice/routes/person_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  HomeTabPage home;
  GamePage game;
  CursePage curse;
  PersonPage person;
  List<Widget> pages;

  int _bottomIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    home = HomeTabPage(key: PageStorageKey("home"),);
    game = GamePage(key: PageStorageKey("game"),);
    curse = CursePage(key: PageStorageKey("curse"),);
    person = PersonPage(key: PageStorageKey("person"),);
    pages = [home, game, curse, person];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( child: Scaffold(
      body: PageStorage(bucket: bucket, child: pages[_bottomIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _bottomIndex == 0
                  ? "imgs/ic_dis.png"
                  : "imgs/ic_dis_unselect.png",
              width: 30,
              height: 30,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _bottomIndex == 1
                  ? "imgs/ic_game.png"
                  : "imgs/ic_game_unselect.png",
              width: 30,
              height: 30,
            ),
            title: Text("Game"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _bottomIndex == 2
                  ? "imgs/ic_game.png"
                  : "imgs/ic_game_unselect.png",
              width: 30,
              height: 30,
            ),
            title: Text("Curse"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _bottomIndex == 3 ? "imgs/ic_me.png" : "imgs/ic_me_unselect.png",
              width: 30,
              height: 30,
            ),
            title: Text("Me"),
          ),
        ],
        onTap: _onBottomTap,
      ),
    ));
  }

  void _onBottomTap(int index) {
    if (_bottomIndex != index) {
      setState(() {
        _bottomIndex = index;
      });
    }
  }
}
