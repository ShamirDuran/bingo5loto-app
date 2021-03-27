import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Preload svg image in cache
loadSVG() async {
  Future.wait([
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoder, "assets/images/canasta.svg"), null),
  ]);
}

// Show simple snackbar
void showSnackBar(String msg, GlobalKey<ScaffoldState> key) {
  ScaffoldMessenger.of(key.currentContext).removeCurrentSnackBar();

  final snack = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(msg),
    duration: Duration(milliseconds: 3200),
  );

  ScaffoldMessenger.of(key.currentContext).showSnackBar(snack);
}

// Log out account dialog
void showDialogPer(BuildContext context, String titulo, String texto, Function action) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(texto),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text("Ok"),
          onPressed: () => action(),
        ),
      ],
    ),
  );
}

// Log out account dialog
void showInfoDialog(BuildContext context, String titulo, String texto) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(texto),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
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
      asset = "assets/images/L.png";
      break;
  }
  return asset;
}

final String nombreApp = "BINGO 5 LOTO";

bool validarCartones(String letra, List<List<List<int>>> cartones, List<int> balotas) {
  bool check = true;

  if (letra == "full") {
    for (var carton in cartones) {
      check = true;
      if (!balotas.contains(carton[0][0])) check = false;
      if (!balotas.contains(carton[0][1])) check = false;
      if (!balotas.contains(carton[0][2])) check = false;
      if (!balotas.contains(carton[0][3])) check = false;
      if (!balotas.contains(carton[0][4])) check = false;
      if (!balotas.contains(carton[1][0])) check = false;
      if (!balotas.contains(carton[1][1])) check = false;
      if (!balotas.contains(carton[1][2])) check = false;
      if (!balotas.contains(carton[1][3])) check = false;
      if (!balotas.contains(carton[1][4])) check = false;
      if (!balotas.contains(carton[2][0])) check = false;
      if (!balotas.contains(carton[2][1])) check = false;
      if (!balotas.contains(carton[2][3])) check = false;
      if (!balotas.contains(carton[2][4])) check = false;
      if (!balotas.contains(carton[3][0])) check = false;
      if (!balotas.contains(carton[3][1])) check = false;
      if (!balotas.contains(carton[3][2])) check = false;
      if (!balotas.contains(carton[3][3])) check = false;
      if (!balotas.contains(carton[3][4])) check = false;
      if (!balotas.contains(carton[4][0])) check = false;
      if (!balotas.contains(carton[4][1])) check = false;
      if (!balotas.contains(carton[4][2])) check = false;
      if (!balotas.contains(carton[4][3])) check = false;
      if (!balotas.contains(carton[4][4])) check = false;

      if (check) {
        print(carton);
        print("gano");
        break;
      }
    }
  } else {
    if (letra.substring(letra.length - 5, letra.length - 4) == "T") {
      for (var carton in cartones) {
        check = true;
        if (!balotas.contains(carton[0][0])) check = false;
        if (!balotas.contains(carton[1][0])) check = false;
        if (!balotas.contains(carton[2][0])) check = false;
        if (!balotas.contains(carton[2][1])) check = false;
        if (!balotas.contains(carton[2][3])) check = false;
        if (!balotas.contains(carton[2][4])) check = false;
        if (!balotas.contains(carton[3][0])) check = false;
        if (!balotas.contains(carton[4][0])) check = false;

        if (check) {
          print(carton);
          print("gano");
          break;
        }
      }
    }

    if (letra.substring(letra.length - 5, letra.length - 4) == "+") {
      for (var carton in cartones) {
        check = true;
        if (!balotas.contains(carton[0][2])) check = false;
        if (!balotas.contains(carton[1][2])) check = false;
        if (!balotas.contains(carton[2][0])) check = false;
        if (!balotas.contains(carton[2][1])) check = false;
        if (!balotas.contains(carton[2][3])) check = false;
        if (!balotas.contains(carton[2][4])) check = false;
        if (!balotas.contains(carton[3][2])) check = false;
        if (!balotas.contains(carton[4][2])) check = false;

        if (check) {
          print(carton);
          print("gano");
          break;
        }
      }
    }

    if (letra.substring(letra.length - 5, letra.length - 4) == "x") {
      for (var carton in cartones) {
        check = true;
        if (!balotas.contains(carton[0][0])) check = false;
        if (!balotas.contains(carton[0][4])) check = false;
        if (!balotas.contains(carton[1][1])) check = false;
        if (!balotas.contains(carton[1][2])) check = false;
        if (!balotas.contains(carton[3][1])) check = false;
        if (!balotas.contains(carton[3][3])) check = false;
        if (!balotas.contains(carton[4][0])) check = false;
        if (!balotas.contains(carton[4][4])) check = false;

        if (check) {
          print(carton);
          print("gano");
          break;
        }
      }
    }

    if (letra.substring(letra.length - 5, letra.length - 4) == "L") {
      for (var carton in cartones) {
        check = true;
        if (!balotas.contains(carton[1][0])) check = false;
        if (!balotas.contains(carton[1][1])) check = false;
        if (!balotas.contains(carton[1][2])) check = false;
        if (!balotas.contains(carton[1][3])) check = false;
        if (!balotas.contains(carton[1][4])) check = false;
        if (!balotas.contains(carton[2][4])) check = false;
        if (!balotas.contains(carton[3][4])) check = false;
        if (!balotas.contains(carton[4][4])) check = false;

        if (check) {
          print(carton);
          print("gano");
          break;
        }
      }
    }
  }

  return check;
}
