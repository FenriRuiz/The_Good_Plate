import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_platos.dart';
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/rutas/lista_platos.dart';
import 'package:the_good_plate/vistas/item_platos.dart';
import 'package:the_good_plate/vistas/item_restaurantes.dart';

class Restaurante extends StatefulWidget {
  final ModeloRestaurante _restaurante;
  Restaurante(this._restaurante);

  @override
  _RestauranteState createState() => _RestauranteState(); 
}

class _RestauranteState extends State<Restaurante> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle styleDistanicia = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,color: Colors.red);

  var nombreStyle = TextStyle(
      fontFamily: 'Montserrat',
      background: Paint()..color = Color.fromRGBO(97, 97, 97, 75),
      fontSize: 20.0,
      color: Colors.white);

  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
                title: Text(widget._restaurante.nombre, style: nombreStyle),
                titlePadding: EdgeInsets.fromLTRB(65, 0, 0, 16),
                background: GestureDetector(
                  child: new Image.network(widget._restaurante.imagen,
                      fit: BoxFit.cover),
                )),
          ),
          new SliverToBoxAdapter(
            child: new Container(
              alignment: Alignment.topLeft,
              color: Colors.grey[800],
              child: Row(children: <Widget>[
                Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                
                Text(widget._restaurante.descripcion, style: style),
                FlatButton.icon(
                 
                  icon: Icon(Icons.location_on),
                  onPressed: null,
                  label:Text("Distancia: "+widget._restaurante.distanciaKm.toString() + " Km"),splashColor: Colors.red, ),

                Text(widget._restaurante.estado),

              ],),
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                
                

              ],)

              ],)
            )
          ),
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            sliver: new SliverFixedExtentList(
              itemExtent: 305.0,
              delegate: new SliverChildBuilderDelegate(
                  (builder, item) => new ItemPlato(platos[item]),
                  childCount: platos.length),
            ),
          ),
          new SliverToBoxAdapter(
              child: new Container(
            alignment: Alignment.center,
            height: 50.0,
            color: Colors.grey[800],
            child: new InkWell(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Ir a pedidos',
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  new Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                    size: 24.0,
                  )
                ],
              ),
              onTap: () {},
            ),
          ))
        ],
      ),
    );
  }
}
