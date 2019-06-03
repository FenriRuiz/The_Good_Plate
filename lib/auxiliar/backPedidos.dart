import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/rutas/lista_pedidos.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:the_good_plate/rutas/pedido_proceso.dart';

class TabsPedidos extends StatefulWidget {
  ModeloUsuario user;
  List<ModeloPedido> _listaPedido;
  TabsPedidos(this._listaPedido, {Key key, @required this.user})
      : super(key: key);

  @override
  _TabsPedidosState createState() => _TabsPedidosState();
}

class _TabsPedidosState extends State<TabsPedidos> {
  final feedRefresh = ChangeNotifier();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.shopping_basket,
                      size: 20.0,
                    ),
                    text: "Cesta",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.access_time,
                      size: 20.0,
                    ),
                    text: "Historial",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PedidosActivity(pedidos, user: widget.user),
                PedidoProcesoActivity(),
              ],
            )),
      ),
    );
  }
}
