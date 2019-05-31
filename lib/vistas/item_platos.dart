import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/modelos/modelo_platos.dart';

class ItemPlato extends StatefulWidget {
  ModeloPlato _plato;
  List<ModeloPedido> _listaPedido;
  ItemPlato(this._plato, this._listaPedido);


  @override
  ItemPlatoState createState() => new ItemPlatoState();
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
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
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

  int cantidad = 0;
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
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                    child: Text(
                      widget._plato.ingredientes,
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 17.0),
                      softWrap: true,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FavoriteWidget(),
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (cantidad >= 1) {
                              cantidad = cantidad - 1;
                            }
                          });
                        },
                      ),
                      Text(
                        cantidad.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(Icons.add_circle),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              cantidad = cantidad + 1;
                            });
                          }),
                      IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          color: Colors.white,
                          onPressed: () {
                            anidadirPlato(widget._plato);
                          }),
                    ],
                  ),
                ],
              ),
            )));
  }

  anidadirPlato(ModeloPlato plato) {
    setState(() {
      if (cantidad > 0) {
        ModeloPedido modPed = new ModeloPedido(
            nombre: plato.nombre,
            ingredientes: plato.ingredientes,
            precio: plato.precio,
            cantidad: cantidad,
            image: plato.imagen);
        widget._listaPedido.add(modPed);
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(
              "Añadido, " + widget._plato.nombre + " x" + cantidad.toString()),
        ));
      }
      cantidad = 0;
    });
  }
}
