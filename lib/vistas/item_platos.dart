import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_platos.dart';

class ItemPlato extends StatefulWidget {
  final ModeloPlato _plato;
  ItemPlato(this._plato);
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  State<StatefulWidget> createState() {
    Widget build(BuildContext context) {
      return new InkWell(
          //onTap: (),
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
                        //child: Hero(
                        child: Image.network(_plato.imagen),
                        //  tag: _restaurante.imagen,
                        //),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text(
                        _plato.nombre,
                        style: style,
                        softWrap: true,
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        _plato.ingredientes,
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
                            new Icon(Icons.favorite_border,
                                size: 40.0, color: Colors.redAccent),
                          ],
                        ))
                  ],
                ),
              )));
    }
  }
}
