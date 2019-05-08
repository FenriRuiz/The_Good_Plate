import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';

class ItemRestaurante extends StatelessWidget{
  
  final ModeloRestaurante _restaurante;
  ItemRestaurante(this._restaurante);


  Widget build(BuildContext context){
    return Column(children: <Widget>[
      new ListTile(
      
        leading: Container(
          child: Image.network(
            _restaurante.imagen,
            width: 60.0,
            height: 60.0,
            fit: BoxFit.cover,
          )
        ),
        title: new Row(
          children: <Widget>[
            new Text(
              _restaurante.nombre,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            new Text(
              _restaurante.distanciaKm.toString(),
              style: new TextStyle(
                fontSize: 13.5,
                color: Colors.grey,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Text(
            _restaurante.descripcion,
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
          padding: const EdgeInsets.only(top: 5.0),
        ),
        /*onTap: (){
          Route ruta = new MaterialPageRoute(
            builder: (context) => new Chat(
              contacto: _contacto
            )
          );
          Navigator.push(context, ruta);
        },*/
      ),
      new Divider(
        height: 18.0,
      ),
    ]);
  }
}