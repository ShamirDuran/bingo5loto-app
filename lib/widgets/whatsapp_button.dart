import 'package:bingo_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class WhatsappButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> id;
  final String telefono;

  WhatsappButton({
    this.id,
    this.telefono,
  });

  @override
  Widget build(BuildContext context) {
    return InputChip(
      avatar: Image.asset(
        "assets/images/wsp-icon.png",
        fit: BoxFit.contain,
      ),
      padding: EdgeInsets.symmetric(),
      backgroundColor: Color(0xFF00E676),
      label: Text(
        "+57 ${this.telefono}",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        FlutterOpenWhatsapp.sendSingleMessage(
                this.telefono, "Hola, estoy interesado en jugar Bingo 5 Loto!")
            .catchError(
                () => showSnackBar("No se pudo abrir WhatsApp", this.id));
      },
    );
  }
}
