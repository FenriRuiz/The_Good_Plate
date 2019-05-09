import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_platos.dart';

import 'package:the_good_plate/vistas/item_platos.dart';

class ListaPlatos extends StatefulWidget{
  @override
  _ListaPlatosState createState() => _ListaPlatosState();
  
}

class _ListaPlatosState extends State<ListaPlatos>{
  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: platos.length,
      itemBuilder: (context, int item) => new ItemPlato(platos[item])
    );
  }
}