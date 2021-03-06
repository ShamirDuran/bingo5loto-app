import 'dart:ui';
import 'package:bingo_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Carton extends StatefulWidget {
  final List<int> balotas;
  final List<List<int>> carton;
  final String idSala;

  Carton({
    @required this.balotas,
    @required this.carton,
    @required this.idSala,
  });

  @override
  _CartonState createState() => _CartonState();
}

class _CartonState extends State<Carton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.0, left: 5.0, right: 7.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey[800].withOpacity(0.8),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.0),
            child: Text(
              widget.idSala,
              style: TextStyle(
                fontFamily: "Josefine",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontSize: 13.5,
              ),
            ),
          ),
          Table(
            border: TableBorder.all(color: Color(0xff302C3C)),
            children: [
              TableRow(children: [
                _letraColumna("B"),
                _letraColumna("I"),
                _letraColumna("N"),
                _letraColumna("G"),
                _letraColumna("O"),
              ]),
              TableRow(children: [
                _card(widget.carton[0][0]),
                _card(widget.carton[1][0]),
                _card(widget.carton[2][0]),
                _card(widget.carton[3][0]),
                _card(widget.carton[4][0]),
              ]),
              TableRow(children: [
                _card(widget.carton[0][1]),
                _card(widget.carton[1][1]),
                _card(widget.carton[2][1]),
                _card(widget.carton[3][1]),
                _card(widget.carton[4][1]),
              ]),
              TableRow(children: [
                _card(widget.carton[0][2]),
                _card(widget.carton[1][2]),
                Text(""),
                _card(widget.carton[3][2]),
                _card(widget.carton[4][2]),
              ]),
              TableRow(children: [
                _card(widget.carton[0][3]),
                _card(widget.carton[1][3]),
                _card(widget.carton[2][3]),
                _card(widget.carton[3][3]),
                _card(widget.carton[4][3]),
              ]),
              TableRow(children: [
                _card(widget.carton[0][4]),
                _card(widget.carton[1][4]),
                _card(widget.carton[2][4]),
                _card(widget.carton[3][4]),
                _card(widget.carton[4][4]),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(int numero) {
    return Container(
      // height: 35.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      // padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        image: widget.balotas.contains(numero)
            ? DecorationImage(
                image: AssetImage("assets/images/star-icon.png"),
                fit: BoxFit.contain,
              )
            : null,
      ),
      child: Text(
        numero.toString(),
        style: TextStyle(
          fontFamily: "Josefine",
          fontWeight: FontWeight.normal,
          fontSize: 19,
          color: colorHeaderCarton,
        ),
      ),
    );
  }

  Widget _letraColumna(String letra) {
    return Container(
      // margin: EdgeInsets.all(2),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 9.0, bottom: 4.5),
      child: Text(
        letra,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Josefine",
          fontWeight: FontWeight.bold,
          fontSize: 19.0,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      decoration: BoxDecoration(
        color: colorHeaderCarton,
      ),
    );
  }
}
