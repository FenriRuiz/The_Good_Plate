import "package:flutter/material.dart";
import 'package:the_good_plate/dialogos/dialogo_salirRestaurante.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/modelos/modelo_platos.dart';
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/vistas/item_platos.dart';

class Restaurante extends StatefulWidget {
  final ModeloRestaurante _restaurante;
  Restaurante(this._restaurante);
  List<ModeloPedido> _listaPedido = <ModeloPedido>[];

  List<ModeloPedido> get listaPedido => _listaPedido;

  set listaPedido(List<ModeloPedido> listaPedido) {
    _listaPedido = listaPedido;
  }


  @override
  _RestauranteState createState() => _RestauranteState();
}

class _RestauranteState extends State<Restaurante> {
  
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle styleDistanicia =
      TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.red);

  var nombreStyle = TextStyle(
      fontFamily: 'Montserrat',
      background: Paint()..color = Color.fromRGBO(97, 97, 97, 100),
      fontSize: 30.0,
      color: Colors.white);

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: new CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              new SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 300.0,
                
                pinned: true,
                flexibleSpace: new FlexibleSpaceBar(
                    title: Text("   " + widget._restaurante.nombre + " ",
                        style: nombreStyle),
                    titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 11),
                    background: GestureDetector(
                      onTap: (){
                        salirRestaurante(widget.listaPedido);
                      },
                      child: new Image.network(widget._restaurante.imagen,
                          fit: BoxFit.cover),
                    )),
              ),
              new SliverToBoxAdapter(
                  child: new Container(
                      color: Colors.grey[800],
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(26, 5, 16, 0),
                                child: Text(
                                  widget._restaurante.descripcion,
                                  style: style,
                                )),
                            Wrap(children: <Widget>[
                              FlatButton.icon(
                                icon: Icon(Icons.location_on),
                                onPressed: null,
                                label: Text("Distancia: " +
                                    widget._restaurante.distanciaKm.toString() +
                                    " Km"),
                                splashColor: Colors.red,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.adjust),
                                onPressed: null,
                                label: Text(widget._restaurante.estado),
                                splashColor: Colors.red,
                              ),
                              FavoriteWidget(),
                            ])
                          ],
                        ),
                      ))),
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                sliver: new SliverFixedExtentList(
                  itemExtent: 305.0,
                  delegate: new SliverChildBuilderDelegate(
                      (builder, item) => new ItemPlato(platos[item], widget.listaPedido),
                      childCount: platos.length),
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 20, 0),
                child: FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  onPressed: () {},
                  child: Icon(Icons.shopping_cart),
                ))),
      ],
    );
  }

   salirRestaurante(List<ModeloPedido> listaPedido){ 
      if(listaPedido.length > 0){
        
        return Navigator.push(context, MaterialPageRoute(builder: (context)=> SalirRestaurante()));
      }
      else{
        return Navigator.of(context).pop();
      }
    }
}
