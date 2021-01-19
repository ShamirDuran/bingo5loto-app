import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/widgets/balotas_container.dart';
import 'package:bingo_app/widgets/carton.dart';
import 'package:bingo_app/widgets/tablero_numeros.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<int> balotas = List();
  Bingo bingo = Bingo();
  int numCartones;

  @override
  void initState() {
    super.initState();
  }

  _canastaOnClick() {
    if (balotas.length < 18) {
      int bal = bingo.generarBalota(this.balotas);
      balotas.add(bal);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // numCartones = ModalRoute.of(context).settings.arguments;
    numCartones = 6;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bingo 5 App"),
        centerTitle: true,
        elevation: 1,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        // Parte superior
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalotasContainer(balotas: this.balotas, action: _canastaOnClick),
              TableroNumeros(balotas: this.balotas),
            ],
          ),
        ),
        _cartones(),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _cartones() {
    int divisor = 2;
    num helper = this.numCartones / divisor;
    int numFilas = helper.round();
    int numCol = 2;

    return Table(
      children: [
        for (var i = 0; i < numFilas; i++)
          if (i == numFilas - 1 && (helper % 1).round() == 1)
            TableRow(children: [Carton(balotas: this.balotas), Text("")])
          else
            TableRow(
              children: [
                for (var j = 0; j < numCol; j++) Carton(balotas: this.balotas)
              ],
            ),
      ],
    );
  }
}
