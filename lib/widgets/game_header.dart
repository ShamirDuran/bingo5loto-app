import 'package:bingo_app/widgets/balotas_container.dart';
import 'package:bingo_app/widgets/tablero_numeros.dart';
import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  final List<int> balotas;
  final Function canastaOnClick;
  final String letra;
  final String idSala;
  final int maxBalotas;
  final bool gano;

  GameHeader({
    @required this.balotas,
    @required this.canastaOnClick,
    @required this.letra,
    @required this.idSala,
    @required this.maxBalotas,
    @required this.gano,
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
            child: BalotasContainer(
              balotas: this.balotas,
              action: canastaOnClick,
              maxBalotas: maxBalotas,
              gano: this.gano,
            ),
          ),
          // parte del tablero negro y patron
          _gameInfo(),
        ],
      ),
    );
  }

  Widget _gameInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _descripcionSala(),
            Text(this.idSala),
            //TODO: nombre del jugador
          ],
        ),
        TableroNumeros(balotas: this.balotas),
        SizedBox(height: 10.0),
        _patron(),
      ],
    );
  }

  Widget _patron() {
    return Row(
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
    );
  }

  Widget _descripcionSala() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      alignment: Alignment.centerRight,
      child: Text(
        "UNICO EN SALA",
        style: TextStyle(
          fontSize: 12.0,
          fontFamily: "Josefine",
          color: Colors.yellow,
        ),
      ),
    );
  }
}
