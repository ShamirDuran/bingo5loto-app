import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/title_appbar.dart';
import 'package:flutter/material.dart';

class TerminosCondicionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: TitleAppbar(titulo: nombreApp),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text("TERMINOS Y CONDICIONES",
              style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 15.0),
          textItem(
            "1.	La App de BINGO 5 LOTO está disponible las 24 horas, exclusiva para personas mayores de edad, en celulares con sistema operativo ANDROID 5.1 en adelante. Es unipersonal.",
          ),
          textItem(
              "2.	Los cartones y la balotera contienen números generados aleatoriamente del 1 al 75."),
          textItem(
              "3.	Antes de ingresar a Sala el jugador debe de informar vía WhatsApp cuantas tripletas desea adquirir (1-2-3-4-5) y transferir su valor según indicaciones recibidas."),
          textItem(
              "4.	El jugador debe enviar foto de la consignación realizada, agregando el número del documento de identidad, para poder asignarle una contraseña para ingresar a la Sala, una sola vez."),
          textItem(
              "5.	El jugador podrá participar en dos premios: el premio-1 un Patrón de 8 casillas (T X Y L) y el Premio-2 un cartón pleno de 24 casillas."),
          textItem(
              "6.	El Premio-1 se obtendrá cuando se complete un Patrón con máximo 40 balotas jugadas."),
          textItem(
              "7.	El Premio-2 se obtendrá cuando se complete un cartón con máximo 58 balotas jugadas."),
          textItem(
              "8.	Los premios se entregarán una vez verificados los datos correctos del jugador y cartón ganador. El jugador debe enviar la foto del formulario de ingreso y la foto del cartón ganador."),
          textItem(
              "9.	El juego en modalidad progresivo tendrá una sola tripleta, la cual puede ganar el doble, el triple, el cuádruple o el quíntuple de veces el Premio-1 para el bingo Patrón."),
          textItem(
              "10.	Si el jugador abandona la partida o apaga el celular, perderá la opción de seguir jugando."),
          textItem(
              "11.	Si el jugador hace fraude en cualquier modalidad, será bloqueado definitivamente de la App BINGO 5 LOTO y no recibirá el premio obtenido ilegalmente."),
        ],
      ),
    );
  }

  Widget textItem(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        texto,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 15.0,
        ),
      ),
    );
  }
}