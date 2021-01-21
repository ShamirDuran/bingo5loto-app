import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Preload svg image in cache
loadSVG() async {
  Future.wait([
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, "assets/images/canasta.svg"),
        null),
  ]);
}

// Show simple snackbar
void showSnackBar(String msg, GlobalKey<ScaffoldState> key) {
  final snack = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(msg),
    duration: Duration(milliseconds: 3200),
  );

  key.currentState.showSnackBar(snack);
}

// Log out account dialog
void showDialogPer(
    BuildContext context, String titulo, String texto, Function action) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(texto),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("Ok"),
          onPressed: () => action(),
        ),
      ],
    ),
  );
}

String letraAleatoria() {
  Random r = Random();
  String asset = "assets/images/T.png";

  switch (r.nextInt(4)) {
    case 0:
      asset = "assets/images/T.png";
      break;
    case 1:
      asset = "assets/images/x.png";
      break;
    case 2:
      asset = "assets/images/+.png";
      break;
    case 3:
      asset = "assets/images/Y.png";
      break;
  }
  return asset;
}

final String nombreApp = "BINGO 5 LOTO";
