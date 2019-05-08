import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/rutas/lista_restaurantes.dart';
import 'package:the_good_plate/vistas/item_restaurantes.dart';


class Restaurante extends StatelessWidget {
  final ModeloRestaurante _restaurante;
  Restaurante(this._restaurante);
  

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          GestureDetector(
            child: Hero(
              child: Image.network(_restaurante.imagen),
              tag: _restaurante.imagen, 
            ),
            onVerticalDragEnd: (DragEndDetails details){
              Navigator.pop(context, MaterialPageRoute(builder: (_){
                return ItemRestaurante(_restaurante);
              }));
            }, 
          )
          
        ],)
      )
    
    );
    
    
  }

}