import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/rutas/restaurante.dart';

class ItemRestaurante extends StatefulWidget {
  ItemRestaurante(ModeloRestaurante _restaurante);

  ItemRestauranteState createState() => new ItemRestauranteState();
}
class ItemRestauranteState extends State<ItemRestaurante>{
  ModeloRestaurante _restaurante;
  //ItemRestaurante(this._restaurante);
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//TODO: Falta el body
 @override
    Widget build(BuildContext context) {
      return new InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Restaurante(
                        _restaurante,
                      ))),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Card(
                color: Color.fromRGBO(60, 190, 200, 100),
                child: new Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Hero(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/loading.gif',
                            image: _restaurante.imagen,
                          ),
                          tag: _restaurante.imagen,
                        ),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text(
                        _restaurante.nombre,
                        style: style,
                        softWrap: true,
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        _restaurante.descripcion,
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
                        softWrap: true,
                      ),
                    ),
                    new Padding(
                        padding: new EdgeInsets.all(7.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Icon(Icons.star_border,
                                size: 40.0, color: Colors.amberAccent),
                            new Icon(Icons.favorite_border,
                                size: 40.0, color: Colors.redAccent),
                          ],
                        ))
                  ],
                ),
              )));
    }
  }
