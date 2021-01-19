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
  // TODO: pasar letra por parametros para el full carton
  final String letra = "T";

  BalotasContainer({
    @required this.balotas,
    @required this.action,
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
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 5.0),
          InputChip(
            onSelected: null,
            disabledColor: Colors.grey[200],
            label: Text('${balotas.length}/18'),
          ),
          _imagenCanasta(),
          SizedBox(height: 7.0),
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
    Color color = Colors.blue;
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
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
