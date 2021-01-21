import 'package:bingo_app/widgets/balotas_container.dart';
import 'package:bingo_app/widgets/tablero_numeros.dart';
import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  final List<int> balotas;
  final Function canastaOnClick;
  final String letra;

  GameHeader({
    @required this.balotas,
    @required this.canastaOnClick,
    @required this.letra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // parte de la canasta
          Flexible(
            child:
                BalotasContainer(balotas: this.balotas, action: canastaOnClick),
          ),
          // parte del tablero negro y patron
          _tableroNumeros(),
        ],
      ),
    );
  }

  Widget _tableroNumeros() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TableroNumeros(balotas: this.balotas),
        SizedBox(height: 10.0),
        Row(
          children: [
            Text(
              "PATRON",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            SizedBox(width: 10.0),
            Image.asset(this.letra, fit: BoxFit.cover, width: 75.0),
          ],
        ),
      ],
    );
  }
}
