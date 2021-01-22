import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/carton.dart';
import 'package:bingo_app/widgets/game_header.dart';
import 'package:flutter/material.dart';

class GamePatron extends StatefulWidget {
  final String letra, idSala;
  final int numCartones;
  final List<List<List<int>>> cartones;
  final GlobalKey<ScaffoldState> scaffoldKey;

  GamePatron({
    @required this.letra,
    @required this.idSala,
    @required this.numCartones,
    @required this.cartones,
    @required this.scaffoldKey,
  });

  @override
  _GamePatronState createState() => _GamePatronState();
}

class _GamePatronState extends State<GamePatron>
    with AutomaticKeepAliveClientMixin<GamePatron> {
  @override
  bool get wantKeepAlive => true;

  final List<int> balotas = List();
  final int maxBalotas = 65;
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
    if (validarCartones(widget.letra, widget.cartones, this.balotas)) {
      showInfoDialog(
          context, "Ganaste", "BINGOOO GANA PREMIO-1. FELICITACIONES");
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
            letra: this.widget.letra,
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
        widget.cartones.length > temp + 1
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
