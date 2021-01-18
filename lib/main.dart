import 'package:bingo_app/pages/game_page.dart';
import 'package:bingo_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo App',
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "game": (_) => GamePage(),
        "login": (_) => LoginPage(),
      },
    );
  }
}
