import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return;
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffF4E5CD),
                  Color(0xffF4E5CD),
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25.0, top: 80.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bingo 5 App",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        // Image.asset(
                        //   "assets/images/bingo-logo.png",
                        //   height: 350.0,
                        //   fit: BoxFit.contain,
                        // ),
                        Expanded(child: Text("")),
                        _button("JUGAR",
                            () => Navigator.pushNamed(context, "login")),
                        SizedBox(height: 20.0),
                        _button(
                          "COMO JUGAR",
                          () => Navigator.pushNamed(context, "como-jugar"),
                        ),
                        SizedBox(height: 20.0),
                        _button("ACERDA DE", () {}),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String texto, Function action) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff513921),
            Color(0xff513921),
          ]),
        ),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 25.0),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: action,
        ),
      ),
    );
  }
}
