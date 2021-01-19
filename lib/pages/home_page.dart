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
                  margin: EdgeInsets.only(bottom: 25.0, top: 150.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bingo 5 App",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Expanded(child: Text("")),
                      _button("JUGAR", null),
                      SizedBox(height: 20.0),
                      _button("COMO JUGAR",
                          () => Navigator.pushNamed(context, "como-jugar")),
                      SizedBox(height: 20.0),
                      _button("ACERDA DE", null),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String texto, Function action) {
    return Container(
      child: RaisedButton(
        elevation: 10,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        shape: StadiumBorder(),
        color: Theme.of(context).primaryColor,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: action,
      ),
    );
  }
}
