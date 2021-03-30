import 'package:bingo_app/utils/bingo.dart';
import 'package:bingo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
* Contenedor de la imagen de la canasta que genera las balotas
* y de la balota generada. 
*/
class BalotasContainer extends StatelessWidget {
  final List<int> balotas;
  final Function action;
  final bingo = Bingo();
  final radius = 28.0;
  final int maxBalotas;
  final bool gano;

  BalotasContainer({
    @required this.balotas,
    @required this.action,
    @required this.maxBalotas,
    @required this.gano,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.gano
                ? "Ganaste!. No olvides reclamar tu premio"
                : "Toca la canasta y saca tu SUERTE",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: this.gano ? FontWeight.bold : FontWeight.normal,
                fontFamily: "Josefine",
                fontSize: 18.0,
                color: this.gano ? Colors.yellow : Colors.white),
          ),
          SizedBox(height: 5.0),
          InputChip(
            onSelected: (value) {},
            backgroundColor: Colors.indigo,
            label: Text(
              '${balotas.length}/${this.maxBalotas}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          _imagenCanasta(),
          SizedBox(height: 15.0),
          if (balotas.length > 0)
            _balota()
          else
            CircleAvatar(
              radius: this.radius,
              backgroundColor: Colors.transparent,
              child: Text(""),
            ),
        ],
      ),
    );
  }

  /// Carga la imagen de la canasta
  Widget _imagenCanasta() {
    return GestureDetector(
      onTap: action,
      child: this.gano
          ? ColorFiltered(
              colorFilter:
                  ColorFilter.mode(Colors.grey[700], BlendMode.modulate),
              child: SvgPicture.asset(
                "assets/images/canasta.svg",
                width: 150.0,
              ),
            )
          : Container(
              child: SvgPicture.asset(
                "assets/images/canasta.svg",
                width: 150.0,
              ),
            ),
    );
  }

  Widget _balota() {
    Color color = Colors.indigo;
    // num = ultima balota que saco el jugador
    final num = balotas.last;

    if (num >= 1 && num <= 15) color = colorCol1;
    if (num >= 16 && num <= 30) color = colorCol2;
    if (num >= 31 && num <= 45) color = colorCol3;
    if (num >= 46 && num <= 60) color = colorCol4;
    if (num >= 61 && num <= 75) color = colorCol5;

    // Texto que va a tener la balota sacada
    String label = "";

    if (num >= 1 && num <= 15) label = "B-$num";
    if (num >= 16 && num <= 30) label = "I-$num";
    if (num >= 31 && num <= 45) label = "N-$num";
    if (num >= 46 && num <= 60) label = "G-$num";
    if (num >= 61 && num <= 75) label = "O-$num";

    return CircleAvatar(
      radius: this.radius,
      backgroundColor: color,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 21.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
