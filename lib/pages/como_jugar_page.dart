import 'package:bingo_app/utils/utils.dart';
import 'package:bingo_app/widgets/title_appbar.dart';
import 'package:bingo_app/widgets/whatsapp_button.dart';
import 'package:flutter/material.dart';

class ComoJugarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TitleAppbar(
          titulo: nombreApp,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 10.0),
            titleText(context, '¿Comó jugar a Bingo 5 Loto?'),
            SizedBox(height: 10.0),
            bodyText(
                "Para poder jugar debes comprar tripletas (3 cartones) con las que podras jugar y obtener diferentes premios."),
            SizedBox(height: 20.0),
            bodyText(
                "Puedes consultar los premios comunicandote a los siguientes números de WhatsApp:"),
            SizedBox(height: 10.0),
            Column(
              children: [
                SizedBox(height: 12.0),
                WhatsappButton(id: _scaffoldKey, telefono: "3213863238"),
                WhatsappButton(id: _scaffoldKey, telefono: "3134098315"),
                SizedBox(height: 6.0),
                Text("Click en el botón para ir a WhatsApp",
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
            SizedBox(height: 30.0),
            titleText(context, "¿Cómo obtengo un código de compra?"),
            SizedBox(height: 10.0),
            bodyText(
                "Una vez que realices la compra de al menos una tripleta, se te suministrará un usuario (que será tu teléfono) y un código de compra para que puedas empezar a jugar.")
          ],
        ),
      ),
    );
  }

  Text titleText(BuildContext context, String texto) => Text(
        texto,
        style: Theme.of(context).textTheme.headline6,
      );

  Widget bodyText(String texto) => Text(texto,
      // textAlign: TextAlign.justify,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15.0,
      ));
}
