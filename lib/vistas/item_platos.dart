import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_platos.dart';

class ItemPlato extends StatefulWidget {
  final ModeloPlato _plato;
  ItemPlato(this._plato);

  @override
  ItemPlatoState createState() => new ItemPlatoState(_plato);
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteWidget> {
  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            iconSize: 30,
            color: Colors.redAccent,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}

class ItemPlatoState extends State<ItemPlato> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

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
                          FavoriteWidget(),
                        ],
                      ))
                ],
              ),
            )));
  }
}
