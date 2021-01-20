import 'package:flutter/material.dart';

// Show simple snackbar
void showSnackBar(String msg, GlobalKey<ScaffoldState> key) {
  final snack = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(msg),
    duration: Duration(milliseconds: 3200),
  );

  key.currentState.showSnackBar(snack);
}

final String nombreApp = "Bingo 5 Loto";
