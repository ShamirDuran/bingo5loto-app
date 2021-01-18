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
  Bingo bingo;
  List<List<int>> carton;
  List<int> balotas;

  /*
   * Representa cada elemento del carton. Si el elemento/numero esta dentro
   * del arreglo de "balotas" se marca como true para indicar que este numero 
   * salio.
   * 
   * Esta varaible tambien ayuda al cambio de color de los elementos del carton
   */
  List<List<bool>> control;

  @override
  void initState() {
    super.initState();
    bingo = Bingo();
    carton = bingo.getCarton();
    balotas = List();
    control = bingo.generarControl();
  }

  /// Es la funcion que valida los tap en los elementos del carton
  _handleOnTapCarton(String num, int r, int c) {
    if (balotas.contains(int.parse(num))) {
      print("true");
      control[r][c] = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280.0,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                _parteSuperior(),
                Carton(
                  carton: this.carton,
                  control: this.control,
                  action: _handleOnTapCarton,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        // TODO: Hacer menu
        onPressed: () => print("Menu"),
      ),
      title: Text("Bingo 5 App"),
    );
  }

  // Es la parte superior, donde esta la canasta y la tabla de numeros del 1 al 75
  Widget _parteSuperior() {
    _valotasContainer() {
      if (balotas.length < 18) {
        balotas.add(bingo.generarBalota());
        setState(() {});
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BalotasContainer(
          balotas: this.balotas,
          action: _valotasContainer,
        ),
        TableroNumeros(
          balotas: this.balotas,
        ),
      ],
    );
  }
}
