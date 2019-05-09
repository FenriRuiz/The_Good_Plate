import 'package:flutter/material.dart';
import 'package:the_good_plate/rutas/restaurantes_recomendados.dart';
import 'GuillotinaMenu.dart';
import 'package:the_good_plate/rutas/mapa.dart';


class Guillotine extends StatefulWidget{
  @override
  _GuillotineState createState() => _GuillotineState();
}

class _GuillotineState extends State<Guillotine>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        child: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new RestaurantesRecomendados(),
            new GuillotineMenu(),
          ],
        ),
      ),
    );
  }
}