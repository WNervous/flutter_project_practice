import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_practice/routes/curse_page.dart';
import 'package:flutter_project_practice/routes/game_page.dart';
import 'package:flutter_project_practice/routes/home_page.dart';
import 'package:flutter_project_practice/routes/main_page.dart';
import 'package:flutter_project_practice/routes/person_page.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfffb8c00),
        primaryColorDark: Color(0xffc25e00),
        primaryColorLight: Color(0xffffbd45),
        accentColor: Color(0xfffb8c00),
      ),
      routes: {
        "main": (context) => MainPage(),
        "home": (context) => HomeTabPage(),
        "game": (context) => GamePage(),
        "curse": (context) => CursePage(),
        "person": (context) => PersonPage(),
      },
      initialRoute: "main",
    );
  }
}
