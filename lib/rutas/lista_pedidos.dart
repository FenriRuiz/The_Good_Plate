import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/vistas/item_pedido.dart';
import 'package:the_good_plate/auxiliar/custom_clippers.dart';
import 'package:the_good_plate/rutas/confirmar_pedido.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';

class PedidosActivity extends StatefulWidget {
  ModeloUsuario user;
  PedidosActivity({Key key, @required this.user}) : super(key: key);

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
    return Container(
        child: GestureDetector(
            onTap: () {
              //!Solo se actualiza el pedido si se presiona en algun lugar despues de cambiar la cantidad
              setState(() {});
              _total(context, ModeloPedido(), 1);
              _subtotal(context, ModeloPedido());
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: 560,
                  child: _lista(context),
                ),
                Container(
                  child: _buildTotals(context, ModeloPedido()),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            )));
  }

  MaterialPageRoute buildMaterialPageRouteConfirmarPedido() {
    return MaterialPageRoute(
        builder: ((BuildContext context) =>
            ConfirmarPedido(user: widget.user)));
  }

  Widget _lista(BuildContext context) {
    return new ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context, int item) => new ItemPedido(pedidos[item]),
    );
  }

  Widget _buildTotals(BuildContext context, ModeloPedido pedido) {
    double envio = 1;
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
                          ((_subtotal(context, pedido)
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
                      Text(((_total(context, pedido, envio)) + "€"),
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

  double _subtotal(BuildContext context, ModeloPedido pedido) {
    double precio = 0;
    for (int i = 0; i < pedidos.length; i++) {
      precio += (pedidos[i].cantidad * pedidos[i].precio);
    }
    return precio;
  }

  String _total(BuildContext context, ModeloPedido pedido, double envio) {
    double preciofinal = _subtotal(context, pedido) + envio;
    return preciofinal.toStringAsFixed(2).toString();
  }
}