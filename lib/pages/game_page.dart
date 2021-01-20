import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
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
    print(balotas);
  }

  @override
  Widget build(BuildContext context) {
    // numCartones = ModalRoute.of(context).settings.arguments;
    numCartones = 6;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-game.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              nombreApp,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            centerTitle: true,
            elevation: 2,
            // backgroundColor: colorCremaBeag,
          ),
          body: _body(),
        ),
      ],
    );
  }

  Widget _body() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Parte superior
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: BalotasContainer(
                      balotas: this.balotas, action: _canastaOnClick),
                ),
                Flexible(child: TableroNumeros(balotas: this.balotas)),
              ],
            ),
          ),
          _cartones(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _cartones() {
    int divisor = 2;
    num helper = this.numCartones / divisor;
    int numFilas = helper.round();
    int numCol = 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Table(
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
      ),
    );
  }
}
