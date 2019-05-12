import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/rutas/lista_platos.dart';
import 'package:the_good_plate/vistas/item_restaurantes.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';

class Restaurante extends StatefulWidget {
  final ModeloRestaurante _restaurante;
  Restaurante(this._restaurante);

  @override
  _RestauranteState createState() => _RestauranteState();
}

class _RestauranteState extends State<Restaurante> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        GestureDetector(
          child: new HeroImage(widget: widget),
          //child: Image.network(widget._restaurante.imagen),

          onVerticalDragEnd: (DragEndDetails details) {
            Navigator.pop(context, MaterialPageRoute(builder: (_) {
              return ItemRestaurante(widget._restaurante);
            }));
          },
        ),
        Expanded(
          child: ListaPlatos(),
        ),
        //GuillotineMenu()
      ],
    ));

    /*Column(children: <Widget>[
      new GuillotineMenu(),
      GestureDetector(
        child: Image.network(widget._restaurante.imagen),
        //child: Image.network(widget._restaurante.imagen),

        onVerticalDragEnd: (DragEndDetails details) {
          Navigator.pop(context, MaterialPageRoute(builder: (_) {
            return ItemRestaurante(widget._restaurante);
          }));
        },
      ),
      Expanded(child: Scaffold(body: ListaPlatos())),
    ]);*/
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Restaurante widget;

  @override
  Widget build(BuildContext context) {
    var nombreStyle = TextStyle(
        fontFamily: 'Montserrat',
        background: Paint()..color = Color.fromRGBO(0, 0, 0, 60),
        fontSize: 40.0,
        color: Colors.white);
    var distanciaStyle = TextStyle(
      fontFamily: 'Montserrat',
      background: Paint()..color = Color.fromRGBO(150, 150, 150, 60),
      fontSize: 40.0,
      color: Colors.white);
    var cuerpoStyle = TextStyle(
      fontFamily: 'Montserrat',
      background: Paint()..color = Color.fromRGBO(0, 0, 0, 60),
      fontSize: 40.0,
      color: Colors.white);
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Image.network(widget._restaurante.imagen),
          Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 150),
                  Padding(padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                  Text(widget._restaurante.nombre + "          ",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: nombreStyle),
                  Text(
                      "Distancia: " +
                          widget._restaurante.distanciaKm.toString() +
                          " Kms",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: distanciaStyle,)
                ],
              ))
        ],
      )
    ]);
  }
}
