import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';

class ItemRestaurante extends StatelessWidget{
  
  final ModeloRestaurante _restaurante;

  ItemRestaurante(this._restaurante);
  Widget build(BuildContext context){
    return Column(children: <Widget>[
      new ListTile(
        leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(60.0)),
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: obtenerImagen(_restaurante.imagen)
                )
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
            _contacto.mensaje,
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
          padding: const EdgeInsets.only(top: 5.0),
        ),
        onTap: (){
          Route ruta = new MaterialPageRoute(
            builder: (context) => new Chat(
              contacto: _contacto
            )
          );
          Navigator.push(context, ruta);
        },
      ),
      new Divider(
        height: 18.0,
      ),
    ]);
  }

  AssetImage obtenerImagen(String url){

  }
}