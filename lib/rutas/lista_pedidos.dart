import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/vistas/item_pedido.dart';
import 'package:the_good_plate/auxiliar/custom_clippers.dart';
import 'package:the_good_plate/rutas/confirmar_pedido.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';

class PedidosActivity extends StatefulWidget {
  ModeloUsuario user;
  PedidosActivity pedido;
  PedidosActivity({Key key, @required this.user}) : super(key: key);
  double total = 0.0;
  double subtotal=0.0;
  double envio = 0.0;

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
              _total(context, ModeloPedido(), envio, total, subtotal);
              _subtotal(context, ModeloPedido(), subtotal);
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: 560,
                  child: _lista(context),
                ),
                Container(
                  child: _buildTotals(context, ModeloPedido(), total, envio, subtotal),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            )));
  }

  MaterialPageRoute buildMaterialPageRouteConfirmarPedido() {
    return MaterialPageRoute(
        builder: ((BuildContext context) =>
            ConfirmarPedido(user: widget.user, pedido: widget.pedido,)));
  }

  Widget _lista(BuildContext context) {
    return new ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context, int item) => new ItemPedido(pedidos[item]),
    );
  }

  Widget _buildTotals(
      BuildContext context, ModeloPedido pedido, double total, double envio, double subtotal) {
    return ClipOval(
        clipper: OvalTopBorderClipper(),
        child: Material(
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Color.fromRGBO(60, 190, 200, 100),
                    spreadRadius: 80.0),
              ],
              color: Colors.grey[800],
            ),
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Subtotal: ",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                      Text(
                          ((_subtotal(context, pedido, subtotal)
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
                      Text(((_total(context, pedido, envio, total, subtotal)) + "€"),
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Color.fromRGBO(60, 190, 200, 100),
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                        context, buildMaterialPageRouteConfirmarPedido());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Continua para confirmar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  double _subtotal(BuildContext context, ModeloPedido pedido, double subtotal) {
    
    for (int i = 0; i < pedidos.length; i++) {
      subtotal += (pedidos[i].cantidad * pedidos[i].precio);
    }
    return subtotal;
  }

  String _total(
      BuildContext context, ModeloPedido pedido, double envio, double total, double subtotal) {
    total = _subtotal(context, pedido, subtotal) + envio;
    return total.toStringAsFixed(2).toString();
  }
}
