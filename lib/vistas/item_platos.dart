import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_platos.dart';

class ItemPlato extends StatefulWidget {
  final ModeloPlato _plato;
  ItemPlato(this._plato);

  @override
  ItemPlatoState createState() => new ItemPlatoState(_plato);
}

class ItemPlatoState extends State<ItemPlato> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool _isFavorite = true;

  _buildCambiarOpinion() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  ItemPlatoState(ModeloPlato _plato);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
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
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/loading.gif',
                        image: widget._plato.imagen,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      widget._plato.nombre,
                      style: style,
                      softWrap: true,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      widget._plato.ingredientes,
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
                          IconButton(
                            icon: (_isFavorite
                                ? Icon(Icons.favorite_border)
                                : Icon(Icons.favorite)),
                            color: Colors.redAccent,
                            onPressed: _buildCambiarOpinion(),
                          )
                        ],
                      ))
                ],
              ),
            )));
  }
}
