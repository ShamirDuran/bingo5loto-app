import 'package:bingo_app/utils/bingo.dart';
import 'package:flutter/material.dart';
/*
  * Es el tablero de los numeros del 1 al 75
  * Tambien es donde se indica que numeros ya salieron como balota
  */

class TableroNumeros extends StatelessWidget {
  final List<int> balotas;
  final bingo = Bingo();

  TableroNumeros({@required this.balotas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(20.0),
        children: [for (var i = 0; i < 15; i++) _fila(i)],
      ),
    );
  }

  // fila del tablero de numero 1-75
  TableRow _fila(int index) {
    final fila = bingo.generarFila(index + 1);
    return TableRow(
      children: [for (var i = 0; i < 5; i++) _item(fila[i])],
    );
  }

  // Widget de los elementos que contiene el tablero de numeros
  Widget _item(int value) {
    return Container(
      height: 15.0,
      child: Text(
        value.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: balotas.contains(value) ? Colors.white : Colors.grey[600],
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
