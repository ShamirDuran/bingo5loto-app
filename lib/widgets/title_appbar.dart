import 'package:flutter/material.dart';

class TitleAppbar extends StatelessWidget {
  final String titulo;

  TitleAppbar({@required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(fontStyle: FontStyle.italic),
    );
  }
}
