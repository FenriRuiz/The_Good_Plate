import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/restaurantes_recomendados.dart';
import 'package:the_good_plate/rutas/registrar.dart';

class LoginActivity extends StatefulWidget{
  @override
  _LoginActivityState createState() => new _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity>{

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget build(BuildContext context){

    final userField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Usuario",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

    final passwordField = TextField(
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
      color: Color.fromRGBO(100,230,235,100),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context, 
            buildMaterialPageRoute()
            );
          
        },
        child: Text("Iniciar sesión",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontWeight: FontWeight.bold)),
      ),
    );
    
    final registrarButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(60,190,200,100),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context, 
            buildMaterialPageRouteRegistro()
          );
        },
        child: Text("Registrar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
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
                child: Image.asset(
                  "images/LogoWhite.png",
                  fit: BoxFit.contain
                  )
                ), 
                SizedBox(height: 50.0),
                userField,
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 30.0),
                loginButon,
                SizedBox(height: 10.0),
                registrarButon
              ],
            ),
          ),
        ),
      ),
    );
  }

  MaterialPageRoute buildMaterialPageRoute() {
    return MaterialPageRoute(
              builder:(
                (BuildContext context) => RestaurantesRecomendados()
                )
              );
  }
  MaterialPageRoute buildMaterialPageRouteRegistro(){
    return MaterialPageRoute(
      builder:(
        (BuildContext context) => RegistrarActivity()
      )
    );
  }
}