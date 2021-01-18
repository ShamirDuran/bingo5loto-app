import 'package:bingo_app/utils/colors.dart';
import 'package:bingo_app/widgets/bingo_button.dart';
import 'package:flutter/material.dart';

class Carton extends StatelessWidget {
  final List<List<int>> carton;
  final List<List<bool>> control;
  final Function action;

  Carton({
    @required this.carton,
    @required this.control,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Table(
        children: [
          TableRow(children: [
            _letraColumna("B", colorCol1),
            _letraColumna("I", colorCol2),
            _letraColumna("N", colorCol3),
            _letraColumna("G", colorCol4),
            _letraColumna("O", colorCol5),
          ]),
          TableRow(children: [
            _card(carton[0][0].toString(), 0, 0),
            _card(carton[1][0].toString(), 1, 0),
            _card(carton[2][0].toString(), 2, 0),
            _card(carton[3][0].toString(), 3, 0),
            _card(carton[4][0].toString(), 4, 0),
          ]),
          TableRow(children: [
            _card(carton[0][1].toString(), 0, 1),
            _card(carton[1][1].toString(), 1, 1),
            _card(carton[2][1].toString(), 2, 1),
            _card(carton[3][1].toString(), 3, 1),
            _card(carton[4][1].toString(), 4, 1),
          ]),
          TableRow(children: [
            _card(carton[0][2].toString(), 0, 2),
            _card(carton[1][2].toString(), 1, 2),
            BingoButton(),
            _card(carton[3][2].toString(), 3, 2),
            _card(carton[4][2].toString(), 4, 2),
          ]),
          TableRow(children: [
            _card(carton[0][3].toString(), 0, 3),
            _card(carton[1][3].toString(), 1, 3),
            _card(carton[2][3].toString(), 2, 3),
            _card(carton[3][3].toString(), 3, 3),
            _card(carton[4][3].toString(), 4, 3),
          ]),
          TableRow(children: [
            _card(carton[0][4].toString(), 0, 4),
            _card(carton[1][4].toString(), 1, 4),
            _card(carton[2][4].toString(), 2, 4),
            _card(carton[3][4].toString(), 3, 4),
            _card(carton[4][4].toString(), 4, 4),
          ]),
        ],
      ),
    );
  }

  Widget _card(String num, int r, int c) {
    return Card(
      color: control[r][c] ? Colors.green : Colors.white,
      margin: EdgeInsets.all(2.5),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        onTap: () {
          action(num, r, c);
        },
      ),
    );
  }

  Widget _letraColumna(String letra, Color color) {
    return Container(
      margin: EdgeInsets.all(2.5),
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        letra,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
