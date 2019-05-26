import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/registrar.dart';
import 'package:the_good_plate/auxiliar/guillotine.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => new _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final controllerUsuario = TextEditingController();
  final controllerPass = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final userField = TextField(
      controller: controllerUsuario,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Usuario",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: controllerPass,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Contraseña",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(100, 230, 235, 100),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (!_autenticar(context, ModeloUsuario())) {
            Fluttertoast.showToast(
                msg: "Datos incorrectos", toastLength: Toast.LENGTH_SHORT);
          }
        },
        child: Text("Iniciar sesión",
            textAlign: TextAlign.center,
            style: style.copyWith(fontWeight: FontWeight.bold)),
      ),
    );

    final registrarButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(60, 190, 200, 100),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context, buildMaterialPageRouteRegistro());
        },
        child: Text("Registrar",
            textAlign: TextAlign.center,
            style: style.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: 640, //Modificar la altura de la ola
          child: RotatedBox(
            quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [
                    Color.fromRGBO(60, 190, 200, 100),
                    Color.fromRGBO(20, 117, 123, 100)
                  ],
                  [Color.fromRGBO(20, 117, 123, 100), Colors.cyan.shade200],
                ],
                durations: [19440, 10800],
                heightPercentages: [0.20, 0.25],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              size: Size(double.infinity, double.infinity),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            //color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 200.0,
                      child: Image.asset("images/LogoWhite.png",
                          fit: BoxFit.contain)),
                  SizedBox(height: 50.0),
                  userField,
                  SizedBox(height: 10.0),
                  passwordField,
                  SizedBox(height: 30.0),
                  loginButon,
                  SizedBox(height: 10.0),
                  registrarButon,
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Image.asset('images/facebook.png'),
                          new Image.asset('images/googleplus.png'),
                          new Image.asset('images/twitter.png')
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  MaterialPageRoute buildMaterialPageRoute() {
    return MaterialPageRoute(builder: ((BuildContext context) => Guillotine()));
  }

  MaterialPageRoute buildMaterialPageRouteRegistro() {
    return MaterialPageRoute(
        builder: ((BuildContext context) => RegistrarActivity()));
  }

  bool _autenticar(BuildContext context, ModeloUsuario modeloUsuario) {
    bool correcto = false;
    for (int i = 0; i < usuarios.length; i++) {
      if (usuarios[i].usuario == controllerUsuario.text) {
        if (usuarios[i].contrasenia == controllerPass.text) {
          print(usuarios[i].usuario);
          print('Controlador' + controllerUsuario.text);
          Navigator.push(context, buildMaterialPageRoute());
          correcto = true;
        }
      }
    }
//TODO: implementar algo que muestre al usuario que se ha equivocado
    return correcto;
  }
}
