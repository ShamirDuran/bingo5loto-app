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
  final radius = 25.0;
  final int maxBalotas;

  BalotasContainer({
    @required this.balotas,
    @required this.action,
    @required this.maxBalotas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Toca la canasta para sacar una balota",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Josefine",
              fontSize: 18.0,
            ),
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

  Widget _imagenCanasta() {
    return GestureDetector(
      onTap: action,
      child: Container(
        child: SvgPicture.asset(
          "assets/images/canasta.svg",
          width: 150.0,
        ),
      ),
    );
  }

  Widget _balota() {
    Color color = Colors.indigo;
    final num = balotas.last;

    if (num >= 1 && num <= 15) color = colorCol1;
    if (num >= 16 && num <= 30) color = colorCol2;
    if (num >= 31 && num <= 45) color = colorCol3;
    if (num >= 46 && num <= 60) color = colorCol4;
    if (num >= 61 && num <= 75) color = colorCol5;

    return CircleAvatar(
      radius: this.radius,
      backgroundColor: color,
      child: Text(
        num.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
