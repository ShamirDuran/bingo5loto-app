import 'package:bingo_app/pages/como_jugar_page.dart';
import 'package:bingo_app/pages/game_page.dart';
import 'package:bingo_app/pages/home_page.dart';
import 'package:bingo_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        disabledColor: Colors.blue[200],
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
        ),
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      title: 'Bingo App',
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (_) => HomePage(),
        "como-jugar": (_) => ComoJugarPage(),
        "game": (_) => GamePage(),
        "login": (_) => LoginPage(),
      },
    );
  }
}
