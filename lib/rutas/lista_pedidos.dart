import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/vistas/item_pedido.dart';
import 'package:the_good_plate/auxiliar/custom_clippers.dart';
import 'package:the_good_plate/rutas/confirmar_pedido.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';

class PedidosActivity extends StatefulWidget {
  ModeloUsuario user;
  List<ModeloPedido> pedido;
  PedidosActivity(this.pedido, {Key key, @required this.user})
      : super(key: key);

  @override
  _PedidosActivityState createState() => _PedidosActivityState();
}

class _PedidosActivityState extends State<PedidosActivity> {
  final feedRefresh = ChangeNotifier();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    double envio = 1.0;
    double subtotal = 0.0;
    return Container(
        child: GestureDetector(
            onTap: () {
              //!Solo se actualiza el pedido si se presiona en algun lugar despues de cambiar la cantidad
              setState(() {});
              _total(context, List<ModeloPedido>(), envio, total, subtotal);
              _subtotal(context, List<ModeloPedido>(), subtotal);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: 475,
                  child: _lista(context),
                ),
                Container(
                  child: _buildTotals(
                      context, List<ModeloPedido>(), total, envio, subtotal),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            )));
  }

  MaterialPageRoute buildMaterialPageRouteConfirmarPedido() {
    return MaterialPageRoute(
        builder: ((BuildContext context) => ConfirmarPedido(
              user: widget.user,
              pedido: widget.pedido,
            )));
  }

  Widget _lista(BuildContext context) {
    //if(widget.pedido.length )
    return new ListView.builder(
      itemCount: widget.pedido.length,
      itemBuilder: (context, int item) => new ItemPedido(widget.pedido[item]),
    );
  }

  Widget _buildTotals(BuildContext context, List<ModeloPedido> pedido,
      double total, double envio, double subtotal) {
    return ClipOval(
        clipper: OvalTopBorderClipper(),
        child: Material(
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 55.0,
                      color: Color.fromRGBO(60, 190, 200, 100),
                      spreadRadius: 80.0),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.0,
                      0.3
                    ],
                    colors: [
                      Color.fromRGBO(17, 53, 56, 100),
                      Colors.grey[800]
                    ]),
                //color: Colors.grey[800],
              ),
              padding: EdgeInsets.only(
                  left: 10.0, right: 20.0, top: 30.0, bottom: 10.0),
              child: Column(children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Subtotal: ",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                      Text(
                          ((_subtotal(context, widget.pedido, subtotal)
                                  .toStringAsFixed(2)
                                  .toString()) +
                              "€"),
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Envío: ",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                      Text(((envio.toStringAsFixed(2).toString()) + "€"),
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total: ",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          ((_total(context, widget.pedido, envio, total,
                                  subtotal)) +
                              "€"),
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Cancelar pedido",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(60, 190, 200, 100),
                      onPressed: () {
                        setState(() {});
                        Navigator.push(
                            context, buildMaterialPageRouteConfirmarPedido());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Confirmar pedido",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ])),
        ));
  }

  double _subtotal(
      BuildContext context, List<ModeloPedido> pedido, double subtotal) {
    for (int i = 0; i < widget.pedido.length; i++) {
      subtotal += (widget.pedido[i].cantidad * widget.pedido[i].precio);
    }
    return subtotal;
  }

  String _total(BuildContext context, List<ModeloPedido> pedido, double envio,
      double total, double subtotal) {
    total = _subtotal(context, widget.pedido, subtotal) + envio;
    return total.toStringAsFixed(2).toString();
  }
}
