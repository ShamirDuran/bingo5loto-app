import 'package:bingo_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _telefonoController;
  TextEditingController _passwordController;
  TextEditingController _nombreController;
  TextEditingController _cedulaController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool _checkTelefono = false,
      _checkPassword = false,
      _checkNombre = false,
      _checkCedula = false;
  int minPhone = 10, minPwd = 8, minNombre = 7, minCedula = 7;
  var uuid = Uuid();
  Size size;
  String idSala;

  @override
  void initState() {
    super.initState();
    _telefonoController = TextEditingController();
    _passwordController = TextEditingController();
    _nombreController = TextEditingController();
    _cedulaController = TextEditingController();
    _telefonoController.addListener(_validarTelefono);
    _passwordController.addListener(_validarPassword);
    _nombreController.addListener(_validarNombre);
    _cedulaController.addListener(_validarCedula);

    idSala = uuid.v4().toString().substring(0, 13);

    loadSVG();
  }

  @override
  void dispose() {
    _telefonoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _validarNombre() {
    if (_nombreController.text.length >= this.minNombre) {
      _checkNombre = true;
    } else {
      _checkNombre = false;
    }
    setState(() {});
  }

  _validarCedula() {
    if (_cedulaController.text.length >= this.minCedula) {
      _checkCedula = true;
    } else {
      _checkCedula = false;
    }
    setState(() {});
  }

  _validarTelefono() {
    if (_telefonoController.text.length >= this.minPhone) {
      _checkTelefono = true;
    } else {
      _checkTelefono = false;
    }
    setState(() {});
  }

  _validarPassword() {
    if (_passwordController.text.length >= this.minPwd) {
      _checkPassword = true;
    } else {
      _checkPassword = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: Text(idSala),
          )),
        ],
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
          margin: EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Ingresa los datos que te suministraron",
            style: TextStyle(fontSize: 30.0),
          ),
        ),

        // Nombre
        SizedBox(height: 20.0),
        _inputText(size, "Nombre", _nombreController, this.minNombre, false,
            TextInputType.text, 25, TextInputAction.next),

        // Cedula
        SizedBox(height: 20.0),
        _inputText(size, "Cédula", _cedulaController, this.minCedula, false,
            TextInputType.number, 10, TextInputAction.next),

        // Telefono
        SizedBox(height: 20.0),
        _inputText(size, "Celular", _telefonoController, this.minPhone, false,
            TextInputType.text, 25, TextInputAction.next),

        // Contraseña
        SizedBox(height: 20.0),
        _inputText(size, "Contraseña", _passwordController, this.minPwd, false,
            TextInputType.text, 14, TextInputAction.done),

        // Recordatorio
        SizedBox(height: 20.0),
        Expanded(child: Text("")),
        Container(
          width: size.width * 0.8,
          child: Text(
            "Recuerda tomar la foto de estos datos, de otra manera, no podras reclamar los premios.",
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
        "¿Cómo consigo una contraseña para jugar?",
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
        showSnackBar("Contraseña invalida", scaffoldkey);
      }

      if (codigo > 0) {
        showDialogPer(
            context,
            "Recordatorio",
            "Verifica que hayas tomado la foto de estos datos, de otra manera, no podras reclamar los premios",
            () => Navigator.pushNamedAndRemoveUntil(
                context, "pre-game", (route) => false,
                arguments: [codigo, idSala, _nombreController.text]));
      } else {
        showSnackBar("Contraseña invalida", scaffoldkey);
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
        onPressed:
            _checkPassword && _checkTelefono && _checkNombre && _checkCedula
                ? _navigation
                : null,
      ),
    );
  }

  // widget que dibuja los input del form
  Widget _inputText(
    Size size,
    String label,
    TextEditingController controlador,
    int min,
    bool obscureStatus,
    TextInputType type,
    int max,
    TextInputAction inputAction,
  ) {
    return Container(
      height: 75.0,
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: TextFormField(
        keyboardType: type,
        controller: controlador,
        obscureText: obscureStatus,
        maxLength: max,
        textInputAction: inputAction,
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
