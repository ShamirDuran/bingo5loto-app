import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _telefonoController;
  TextEditingController _passwordController;
  bool _checkTelefono, _checkPassword;

  @override
  void initState() {
    super.initState();
    _telefonoController = TextEditingController();
    _passwordController = TextEditingController();
    _checkPassword = false;
    _checkTelefono = false;
    _telefonoController.addListener(_validarTelefono);
    _passwordController.addListener(_validarPassword);
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
    if (_passwordController.text.length >= 6) {
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
                    top: 150.0,
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ingresa los datos que te suministrarón",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      SizedBox(height: 40.0),
                      _inputText(
                          size, "Télefono", _telefonoController, 9, false),
                      SizedBox(height: 20.0),
                      _inputText(
                          size, "Contraseña", _passwordController, 6, true),
                      SizedBox(height: 60.0),
                      Expanded(child: Text("")),
                      _loginButon(size, context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButon(Size size, BuildContext context) {
    _navigation() {
      int cartones = 0;
      String s = _passwordController.text.substring(0, 1);
      switch (s) {
        case "1":
          cartones = int.parse(s) * 3;
          break;
        case "2":
          cartones = int.parse(s) * 3;
          break;
        case "3":
          cartones = int.parse(s) * 3;
          break;
        case "4":
          cartones = int.parse(s) * 3;
          break;
        case "5":
          cartones = int.parse(s) * 3;
          break;
        case "6":
          cartones = 1;
          break;
        case "7":
          cartones = 1;
          break;
        case "8":
          cartones = 1;
          break;
        case "9":
          cartones = 1;
          break;
        default:
      }
      print(cartones);
      if (cartones > 0) {
        Navigator.pushReplacementNamed(context, "game", arguments: cartones);
      } else {
        print("f, contraseña mala");
      }
    }

    return Container(
      width: size.width * 0.8,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          "Login",
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
      int min, bool obscureStatus) {
    return Container(
      height: 75.0,
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: TextFormField(
        controller: controlador,
        obscureText: obscureStatus,
        style: TextStyle(fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          helperText: 'Debe tener almenos $min caracteres',
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.w300),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
