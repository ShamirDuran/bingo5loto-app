import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/balotas_container.dart';
import 'package:bingo_app/widgets/carton.dart';
import 'package:bingo_app/widgets/game_header.dart';
import 'package:bingo_app/widgets/tablero_numeros.dart';
import 'package:bingo_app/widgets/title_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<int> balotas = List();
  Bingo bingo = Bingo();
  int codigo;
  int numCartones;
  int multiplicador;
  String letra;

  List<Widget> menu;

  @override
  void initState() {
    super.initState();
    letra = letraAleatoria();
    menu = [
      PopupMenuButton(
        icon: Icon(Icons.settings),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: true,
            child: GestureDetector(
              child: Text("Cerrar aplicación"),
              onTap: () => showDialogPer(
                  context,
                  "Cerrar aplicación",
                  "Al cerrar la aplicación perdera por completo los cartones y no habra forma de recuperarlos.",
                  () => SystemNavigator.pop()),
            ),
          ),
          PopupMenuItem(
            enabled: true,
            child: GestureDetector(
              child: Text("Volver a inicio"),
              onTap: () => showDialogPer(
                context,
                "Volver a inicio",
                "Al volver a inicio perdera por completo los cartones y no habra forma de recuperarlos.",
                () => Navigator.pushNamedAndRemoveUntil(
                    context, "home", (route) => false),
              ),
            ),
          ),
        ],
      )
    ];
  }

  _canastaOnClick() {
    if (balotas.length < 30) {
      int bal = bingo.generarBalota(balotas);
      balotas.add(bal);
      setState(() {});
    }
  }

  _calculos() {
    if (codigo > 0 && codigo <= 5) {
      numCartones = codigo * 3;
      multiplicador = 1;
    }
    if (codigo > 5 && codigo <= 9) {
      numCartones = 3;
      switch (codigo) {
        case 6:
          multiplicador = 2;
          break;
        case 7:
          multiplicador = 3;
          break;
        case 8:
          multiplicador = 4;
          break;
        case 9:
          multiplicador = 5;
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Object> args = ModalRoute.of(context).settings.arguments;
    codigo = args[1];
    letra = args[0];
    _calculos();
    // numCartones = 12;

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
          // AppBar
          appBar: _buildAppBar(),
          body: _body(),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 2,
      title: TitleAppbar(titulo: nombreApp),
      centerTitle: true,
      leading: Center(
          child: PopupMenuButton(
        child: CircleAvatar(
          radius: 17.0,
          child: Text(
            'x$multiplicador',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.yellow,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text('Multiplicador de premios x$multiplicador'),
          )
        ],
      )),
      actions: this.menu,
    );
  }

  Widget _body() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.centerRight,
            child: Text(
              "UNICO EN SALA",
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: "Josefine",
                color: Colors.yellow,
              ),
            ),
          ),
          // Parte superior
          GameHeader(
            balotas: this.balotas,
            letra: this.letra,
            canastaOnClick: this._canastaOnClick,
          ),
          // Lista de cartones
          SizedBox(height: 10.0),
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
              TableRow(children: [
                for (var j = 0; j < numCol; j++) Carton(balotas: this.balotas)
              ]),
        ],
      ),
    );
  }
}
