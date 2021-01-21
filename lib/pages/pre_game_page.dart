import 'package:bingo_app/utils/utils.dart';
import 'package:flutter/material.dart';

class PreGamePage extends StatefulWidget {
  @override
  _PreGamePageState createState() => _PreGamePageState();
}

class _PreGamePageState extends State<PreGamePage> {
  int codigo;
  String letra;
  Size size;

  @override
  void initState() {
    super.initState();
    letra = letraAleatoria();
  }

  @override
  Widget build(BuildContext context) {
    codigo = ModalRoute.of(context).settings.arguments;
    size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: _body(),
          ),
        ));
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        nombreApp,
        style: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
      centerTitle: true,
      elevation: 2,
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text("")),
          _titulo(),
          SizedBox(height: 30.0),
          Image.asset(this.letra, fit: BoxFit.cover, width: 100.0),
          SizedBox(height: 40.0),
          Image.asset("assets/images/full.png",
              fit: BoxFit.cover, width: 100.0),
          Expanded(child: Text("")),
          _continueButton(),
        ],
      ),
    );
  }

  Container _continueButton() {
    return Container(
      width: size.width * 0.8,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "Continuar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, "game", (route) => false,
            arguments: [letra, codigo]),
      ),
    );
  }

  Widget _titulo() {
    return Container(
      child: Text(
        "Los patrones que jugaras son:",
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
