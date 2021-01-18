import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Carton extends StatefulWidget {
  final List<int> balotas;
  Carton({@required this.balotas});

  @override
  _CartonState createState() => _CartonState();
}

class _CartonState extends State<Carton> {
  Bingo bingo;
  List<List<int>> carton;

  @override
  void initState() {
    super.initState();
    bingo = Bingo();
    carton = bingo.generarCarton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      margin: EdgeInsets.only(top: 14.0, left: 5.0, right: 7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Text(
            "#15031515",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12.0,
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                _letraColumna("B", colorCol1),
                _letraColumna("I", colorCol2),
                _letraColumna("N", colorCol3),
                _letraColumna("G", colorCol4),
                _letraColumna("O", colorCol5),
              ]),
              TableRow(children: [
                _card(carton[0][0]),
                _card(carton[1][0]),
                _card(carton[2][0]),
                _card(carton[3][0]),
                _card(carton[4][0]),
              ]),
              TableRow(children: [
                _card(carton[0][1]),
                _card(carton[1][1]),
                _card(carton[2][1]),
                _card(carton[3][1]),
                _card(carton[4][1]),
              ]),
              TableRow(children: [
                _card(carton[0][2]),
                _card(carton[1][2]),
                Text(""),
                _card(carton[3][2]),
                _card(carton[4][2]),
              ]),
              TableRow(children: [
                _card(carton[0][3]),
                _card(carton[1][3]),
                _card(carton[2][3]),
                _card(carton[3][3]),
                _card(carton[4][3]),
              ]),
              TableRow(children: [
                _card(carton[0][4]),
                _card(carton[1][4]),
                _card(carton[2][4]),
                _card(carton[3][4]),
                _card(carton[4][4]),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(int numero) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color:
              widget.balotas.contains(numero) ? Colors.lightBlue : Colors.white,
          borderRadius: BorderRadius.circular(3.0)),
      child: Text(
        numero.toString(),
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _letraColumna(String letra, Color color) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Text(
        letra,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
