import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/rutas/lista_platos.dart';
import 'package:the_good_plate/vistas/item_restaurantes.dart';

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
        Container(
          height: 200.0,
            child: GestureDetector(
          child: Hero(
            child: Image.network(widget._restaurante.imagen),
            //child: Image.network(widget._restaurante.imagen),
            tag: widget._restaurante.imagen,
          ),
          onVerticalDragEnd: (DragEndDetails details) {
            Navigator.pop(context, MaterialPageRoute(builder: (_) {
              return ItemRestaurante(widget._restaurante);
            }));
          },
        )),
        Expanded(child: Scaffold(body: ListaPlatos()))
      ],
    ));
  }
}
