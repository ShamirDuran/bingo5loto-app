import 'package:bingo_app/widgets/background.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
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

    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return;
              },
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25.0, top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '''Bingo 
5
Loto
                            ''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 55.0,
                                color: Colors.white,
                                fontFamily: "Monoton",
                                height: 1.2),
                          ),
                          Expanded(child: Text("")),
                          _button("JUGAR",
                              () => Navigator.pushNamed(context, "login")),
                          SizedBox(height: 25.0),
                          _button(
                            "COMO JUGAR",
                            () => Navigator.pushNamed(context, "como-jugar"),
                          ),
                          SizedBox(height: 25.0),
                          _button(
                            "TERMINOS Y CONDICIONES",
                            () => Navigator.pushNamed(context, "terminos"),
                          ),
                          SizedBox(height: 25.0),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _button(String texto, Function action) {
    return Parallelogram(
      cutLength: 10.0,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 25.0),
        color: Colors.white,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: action,
      ),
    );
  }
}
