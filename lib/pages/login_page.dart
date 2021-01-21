import 'package:bingo_app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _telefonoController;
  TextEditingController _passwordController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool _checkTelefono, _checkPassword;
  int minPhone, minPwd;

  @override
  void initState() {
    super.initState();
    _telefonoController = TextEditingController();
    _passwordController = TextEditingController();
    _checkPassword = false;
    _checkTelefono = false;
    _telefonoController.addListener(_validarTelefono);
    _passwordController.addListener(_validarPassword);
    minPhone = 10;
    minPwd = 8;
    loadSVG();
  }

  @override
  void dispose() {
    _telefonoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _validarTelefono() {
    if (_telefonoController.text.length > 9) {
      _checkTelefono = true;
    } else {
      _checkTelefono = false;
    }
    setState(() {});
  }

  _validarPassword() {
    if (_passwordController.text.length > 7) {
      _checkPassword = true;
    } else {
      _checkPassword = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, "home", (route) => false),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return;
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _body(size, context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Titulo
        Container(
          margin: EdgeInsets.only(top: 60.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Ingresa los datos que te suministraron",
            style: TextStyle(fontSize: 30.0),
          ),
        ),

        // Telefono
        SizedBox(height: 40.0),
        _inputText(size, "Télefono", _telefonoController, this.minPhone, false,
            TextInputType.text),

        // Contraseña
        SizedBox(height: 20.0),
        _inputText(size, "Código de Compra", _passwordController, this.minPwd,
            false, TextInputType.text),

        // Recordatorio
        SizedBox(height: 20.0),
        Expanded(child: Text("")),
        Container(
          width: size.width * 0.8,
          child: Text(
            "Recuerda tomar una foto de los datos, sera necesario para reclamar los premios",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        // Login button
        Expanded(child: Text("")),
        _loginButon(size, context),
        // DividerExpanded(),
        SizedBox(height: 30.0),
        _comoObtenerCodigo(context),
        SizedBox(height: 5.0),
      ],
    );
  }

  Widget _comoObtenerCodigo(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "como-jugar"),
      child: Text(
        "¿Cómo consigo un código de compra?",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _loginButon(Size size, BuildContext context) {
    _navigation() {
      int codigo = 0;
      String s = _passwordController.text.substring(0, 1);

      try {
        codigo = int.parse(s);
        if (codigo == 0 || codigo > 9) codigo = 0;
      } catch (e) {
        showSnackBar("Código de Compra invalido", scaffoldkey);
      }

      if (codigo > 0) {
        showDialogPer(
            context,
            "Recordatorio",
            "Verifica que hayas tomado la foto de los datos, de otra manera, no podras reclamar los premios",
            () => Navigator.pushNamedAndRemoveUntil(
                context, "pre-game", (route) => false,
                arguments: codigo));
      } else {
        showSnackBar("Código de Compra invalido", scaffoldkey);
      }
    }

    return Container(
      width: size.width * 0.8,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "Continuar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: _checkPassword && _checkTelefono ? _navigation : null,
      ),
    );
  }

  Widget _inputText(Size size, String label, TextEditingController controlador,
      int min, bool obscureStatus, TextInputType type) {
    return Container(
      height: 75.0,
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: TextFormField(
        keyboardType: type,
        controller: controlador,
        obscureText: obscureStatus,
        style: TextStyle(fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          helperText: 'Debe tener al menos $min caracteres',
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.w300),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
