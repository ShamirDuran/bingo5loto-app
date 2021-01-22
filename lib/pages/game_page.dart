import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/carton.dart';
import 'package:bingo_app/widgets/game_header.dart';
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
  int codigo, numCartones, multiplicador, maxBalotas;
  String letra, idSala;
  List<List<List<int>>> cartones = List();
  List<Widget> menu;

  @override
  void initState() {
    super.initState();
    letra = letraAleatoria();
    maxBalotas = 30;
    _initMenu();
  }

  /// Evento de onClick en la canasta
  _canastaOnClick() {
    if (balotas.length < maxBalotas) {
      int bal = bingo.generarBalota(balotas);
      balotas.add(bal);
      setState(() {});
    }
  }

  /// Se crea la lista que sera usada para el menu que se despiega con el boton de la appbar
  _initMenu() {
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

  /// Se calcula el multiplicador, el numero de cartones y se inicializan los cartones
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
    _initCartones();
  }

  _initCartones() {
    for (var i = 0; i < numCartones; i++) {
      cartones.add(this.bingo.generarCarton());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Object> args = ModalRoute.of(context).settings.arguments;
    letra = args[0];
    codigo = args[1];
    idSala = args[2];
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
      leading: multiplicador > 1
          ? Center(
              child: PopupMenuButton(
                child: CircleAvatar(
                  radius: 17.0,
                  child: Text(
                    'x$multiplicador',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Multiplicador de premios x$multiplicador'),
                  )
                ],
              ),
            )
          : null,
      actions: this.menu,
    );
  }

  Widget _body() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Parte superior
          GameHeader(
            balotas: this.balotas,
            letra: this.letra,
            canastaOnClick: this._canastaOnClick,
            idSala: this.idSala,
            maxBalotas: this.maxBalotas,
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
    int posIndex = 0;

    TableRow _tableRow() {
      final temp = posIndex;
      posIndex = posIndex + 2;

      return TableRow(children: [
        Carton(balotas: this.balotas, carton: this.cartones[temp]),
        cartones.length > temp + 1
            ? Carton(balotas: this.balotas, carton: this.cartones[temp + 1])
            : Text(""),
      ]);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Table(
        children: [for (var i = 0; i < numFilas; i++) _tableRow()],
      ),
    );
  }
}
