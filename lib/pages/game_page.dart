import 'package:bingo_app/utils/bingo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Bingo bingo;
  List<List<int>> carton;
  List<int> balotas;

  @override
  void initState() {
    super.initState();
    bingo = Bingo();
    carton = bingo.getCarton();
    balotas = List();
    // Relleno
    balotas.add(1);
    balotas.add(15);
    balotas.add(70);
    balotas.add(8);
    balotas.add(9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          // TODO: Hacer menu
          onPressed: () => print("Menu"),
        ),
        title: Text("Bingo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 310.0,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _balotas(),
                    _tableroNumeros(),
                  ],
                ),
                _tablero(carton),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tablero(List<List<int>> carton) {
    return Container(
      padding: EdgeInsets.all(3.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(60),
        children: [
          TableRow(children: [
            _card(carton[0][0].toString()),
            _card(carton[1][0].toString()),
            _card(carton[2][0].toString()),
            _card(carton[3][0].toString()),
            _card(carton[4][0].toString()),
          ]),
          TableRow(children: [
            _card(carton[0][1].toString()),
            _card(carton[1][1].toString()),
            _card(carton[2][1].toString()),
            _card(carton[3][1].toString()),
            _card(carton[4][1].toString()),
          ]),
          TableRow(children: [
            _card(carton[0][2].toString()),
            _card(carton[1][2].toString()),
            _bingoButton(),
            _card(carton[3][2].toString()),
            _card(carton[4][2].toString()),
          ]),
          TableRow(children: [
            _card(carton[0][3].toString()),
            _card(carton[1][3].toString()),
            _card(carton[2][3].toString()),
            _card(carton[3][3].toString()),
            _card(carton[4][3].toString()),
          ]),
          TableRow(children: [
            _card(carton[0][4].toString()),
            _card(carton[1][4].toString()),
            _card(carton[2][4].toString()),
            _card(carton[3][4].toString()),
            _card(carton[4][4].toString()),
          ]),
        ],
      ),
    );
  }

  Widget _tableroNumeros() {
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

  TableRow _fila(int index) {
    final fila = bingo.generarFila(index + 1);
    return TableRow(
      children: [for (var i = 0; i < 5; i++) _itemFila(fila[i])],
    );
  }

  Widget _itemFila(int value) {
    return Container(
      height: 20.0,
      child: Text(
        value.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: balotas.contains(value) ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _balotas() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: SvgPicture.asset(
            "assets/images/canasta.svg",
            width: 150.0,
          ),
        ),
        SizedBox(height: 20.0),
        CircleAvatar(
          child: Text("75"),
        ),
      ],
    );
  }

  Container _bingoButton() {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: EdgeInsets.all(3.0),
      child: null,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }

  Widget _card(String text) {
    return GestureDetector(
      onTap: () => print("tap carton"),
      child: Container(
        height: 50.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsets.all(3.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
