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
        title: Text("Bingo 5 App"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 10.0),
            titleText(context, "¿Comó jugar a Bingo 5 App?"),
            SizedBox(height: 10.0),
            bodyText(
                "Para poder jugar debes comprar tripletas (3 cartones) con las que podras jugar y obtener diferentes premios."),
            SizedBox(height: 20.0),
            bodyText(
                "Puedes consultar los precios o realizar compras comunicandote al siguiente número de WhatsApp:"),
            SizedBox(height: 10.0),
            Column(
              children: [
                SizedBox(height: 20.0),
                WhatsappButton(id: _scaffoldKey),
                Text("Click en el botón para ir a WhatsApp",
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
            SizedBox(height: 30.0),
            titleText(context, "¿Comó obtengo una cuenta?"),
            SizedBox(height: 10.0),
            bodyText(
                "Una vez que realices la compra de almenos una tripleta, se te suministrara un usuario (que sera tu teléfono) y una contraseña para que puedas empezar a jugar.")
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
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15.0,
      ));
}
