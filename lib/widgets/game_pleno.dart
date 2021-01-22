import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/carton.dart';
import 'package:bingo_app/widgets/game_header.dart';
import 'package:flutter/material.dart';

class GamePleno extends StatefulWidget {
  final String idSala;
  final int numCartones;
  final List<List<List<int>>> cartones;
  final GlobalKey<ScaffoldState> scaffoldKey;

  GamePleno({
    @required this.idSala,
    @required this.numCartones,
    @required this.cartones,
    @required this.scaffoldKey,
  });

  @override
  _GamePlenoState createState() => _GamePlenoState();
}

class _GamePlenoState extends State<GamePleno>
    with AutomaticKeepAliveClientMixin<GamePleno> {
  @override
  bool get wantKeepAlive => true;

  final List<int> balotas = List();
  final String letra = "assets/images/full.png";
  final int maxBalotas = 75;
  final bingo = Bingo();
  bool _gano = false;

  /// Evento de onClick en la canasta
  canastaOnClick() {
    if (this.balotas.length < this.maxBalotas && !this._gano) {
      int bal = bingo.generarBalota(this.balotas);
      this.balotas.add(bal);
      _validarVictoria();
      setState(() {});
    }
    if (this.balotas.length == maxBalotas)
      showSnackBar("No te quedan balotas por jugar", widget.scaffoldKey);
  }

  _validarVictoria() {
    if (validarCartones("full", widget.cartones, this.balotas)) {
      showInfoDialog(
          context, "Ganaste", "BINGOOO GANA PREMIO-2. FELICITACIONES");
      this._gano = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Parte superior
          GameHeader(
            balotas: this.balotas,
            letra: this.letra,
            canastaOnClick: this.canastaOnClick,
            idSala: this.widget.idSala,
            maxBalotas: this.maxBalotas,
            gano: this._gano,
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
    num helper = this.widget.numCartones / divisor;
    int numFilas = helper.round();
    int posIndex = 0;

    TableRow _tableRow() {
      final temp = posIndex;
      posIndex = posIndex + 2;

      return TableRow(children: [
        Carton(
            balotas: this.balotas,
            carton: this.widget.cartones[temp],
            idSala: this.widget.idSala),
        this.widget.cartones.length > temp + 1
            ? Carton(
                idSala: this.widget.idSala,
                balotas: this.balotas,
                carton: this.widget.cartones[temp + 1])
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
