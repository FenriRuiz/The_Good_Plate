import "package:flutter/material.dart";
import "package:the_good_plate/modelos/modelo_restaurantes.dart";
import 'package:the_good_plate/vistas/item_restaurantes.dart';
class ListaRestaurantes extends StatefulWidget{
  @override
  _ListaRestaurantesState createState() => _ListaRestaurantesState();
}

class _ListaRestaurantesState extends State<ListaRestaurantes>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: restaurantes.length,
      itemBuilder: (context, int item) => new ItemRestaurante(restaurantes[item])
    );
  }
}