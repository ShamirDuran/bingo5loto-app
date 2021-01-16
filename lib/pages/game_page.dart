import 'package:bingo_app/util/bingo.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carton = Bingo().getCarton();

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
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bolas que salen"),
              SizedBox(width: 30.0),
              Text("Tablero numeros"),
            ],
          ),
          _tablero(carton),
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
