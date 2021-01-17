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
    // Relleno
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
                _tablero(carton),
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
      title: Text("Bingo"),
    );
  }

  // Es la parte superior, donde esta la canasta y la tabla de numeros del 1 al 75
  Widget _parteSuperior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _balotasContainer(),
        _tableroNumeros(),
      ],
    );
  }

  // Genera el tablero de cada juego, cada columna tiene un intervalo de +15 por col
  Widget _tablero(List<List<int>> carton) {
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
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          onTap: () {
            if (balotas.contains(int.parse(num))) {
              print("true");
              control[r][c] = true;
              setState(() {});
            }
          },
        ),
      );
    }

    Widget _bingoButton() {
      return Container(
        height: 45.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsets.all(4.0),
        child: null,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(3.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(55),
        children: [
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
            _bingoButton(),
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

  /*
  * Es el tablero de los numeros del 1 al 75
  * Tambien es donde se indica que numeros ya salieron como balota
  */
  Widget _tableroNumeros() {
    // Widget de los elementos que contiene el tablero de numeros
    Widget _item(int value) {
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

    // fila del tablero de numero 1-75
    TableRow _fila(int index) {
      final fila = bingo.generarFila(index + 1);
      return TableRow(
        children: [for (var i = 0; i < 5; i++) _item(fila[i])],
      );
    }

    // tablero del 1-75
    Widget _tablero = Container(
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
    return _tablero;
  }

  /*
   * Contenedor de la imagen de la canasta que genera las balotas
   * y de la balota generada. 
   */
  Widget _balotasContainer() {
    // Imagen de la canasta, tiene el evento de generar
    Widget _imagen = GestureDetector(
      onTap: () {
        if (balotas.length < 20) {
          balotas.add(bingo.generarBalota());
          setState(() {});
        }
      },
      child: Container(
        child: SvgPicture.asset(
          "assets/images/canasta.svg",
          width: 150.0,
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Imagen de la canasta
        _imagen,
        SizedBox(height: 20.0),
        if (balotas.length > 0)
          CircleAvatar(
            child: Text(balotas.last.toString()),
            // TODO: colores de la balotas
          )
        else
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(""),
          ),
      ],
    );
  }
}
