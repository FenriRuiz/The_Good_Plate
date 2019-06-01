import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:the_good_plate/rutas/restaurante.dart';

class ItemRestaurante extends StatefulWidget {
  final ModeloRestaurante _restaurante;
  ModeloUsuario user;
  ItemRestaurante(this._restaurante, this.user);

  @override
  _ItemRestauranteState createState() => _ItemRestauranteState(_restaurante);
}

class _ItemRestauranteState extends State<ItemRestaurante> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  _ItemRestauranteState(ModeloRestaurante _restaurante);

  bool _meGusta = true;
  bool _promocionado = true;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Restaurante(widget._restaurante, widget.user))),
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
                          image: widget._restaurante.imagen,
                        ),
                        tag: widget._restaurante.imagen,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      widget._restaurante.nombre,
                      style: style,
                      softWrap: true,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5), 
                    child: Text(
                      widget._restaurante.descripcion,
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
                            icon: (widget._restaurante.patrocinado
                                ? Icon(Icons.star_border)
                                : Icon(Icons.star)),
                            color: Colors.red,
                            iconSize: 40,
                            onPressed: _buildCambiarOpinion()),
                          IconButton(
                          icon: (widget._restaurante.meGusta
                              ? Icon(Icons.favorite_border)
                              : Icon(Icons.favorite)),
                          color: Colors.redAccent,
                          iconSize: 40,
                          onPressed: _buildCambiarPromocionado())
                        ],
                      ))
                ],
              ),
            )));
  }
  _buildCambiarOpinion() {
    setState(() {
      if (_meGusta) {
        _meGusta = false;
      } else {
        _meGusta = true;
      }
    });
  }
  _buildCambiarPromocionado() {
    setState(() {
      if (_promocionado) {
        _promocionado = false;
      } else {
        _promocionado = true;
      }
    });
  }
}
