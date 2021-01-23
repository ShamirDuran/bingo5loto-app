import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/game_patron.dart';
import 'package:bingo_app/widgets/game_pleno.dart';
import 'package:bingo_app/widgets/title_appbar.dart';
import 'package:bingo_app/widgets/whatsapp_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Bingo bingo = Bingo();
  int codigo, numCartones, multiplicador;
  String letra, idSala, nombre;
  List<List<List<int>>> cartones = List();
  List<Widget> menu;
  List<Object> args;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      args = ModalRoute.of(context).settings.arguments;
      letra = args[0];
      codigo = args[1];
      idSala = args[2];
      nombre = args[3];
      _calculos();
    });
    _initMenu();
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
          PopupMenuItem(
            enabled: true,
            child: GestureDetector(
              child: Text("Reportar error"),
              onTap: () => FlutterOpenWhatsapp.sendSingleMessage("573125320126",
                      "Encontre un error en BINGO 5 LOTO, quiero reportarlo")
                  .catchError(() => showSnackBar(
                      "No se pudo abrir WhatsApp", this.scaffoldKey)),
            ),
          ),
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
        DefaultTabController(
          length: 2,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: _buildAppBar(),
            body: TabBarView(
              children: [
                GamePatron(
                  letra: this.letra,
                  idSala: this.idSala,
                  numCartones: this.numCartones,
                  cartones: this.cartones,
                  scaffoldKey: this.scaffoldKey,
                  nombre: this.nombre,
                ),
                GamePleno(
                  idSala: this.idSala,
                  cartones: this.cartones,
                  numCartones: this.numCartones,
                  scaffoldKey: this.scaffoldKey,
                  nombre: this.nombre,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 2,
      title: TitleAppbar(titulo: nombreApp),
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: TabBar(
        indicatorColor: Colors.yellow,
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
                'PATRON ${this.letra.substring(letra.length - 5, letra.length - 4).toUpperCase()}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text("PATRON PLENO"),
          ),
        ],
      ),
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
}
