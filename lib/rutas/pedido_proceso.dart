import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:the_good_plate/modelos/modelo_pedidoProceso.dart';
import 'package:the_good_plate/vistas/item_pedidoProceso.dart';

class PedidoProcesoActivity extends StatefulWidget {
  ModeloUsuario user;
  PedidoProcesoActivity pedidoProceso;
 // PedidoProcesoActivity({Key key, @required this.user}) : super(key: key);

  @override
  _PedidoProcesoActivityState createState() => _PedidoProcesoActivityState();
}

class _PedidoProcesoActivityState extends State<PedidoProcesoActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
            children: <Widget>[Container(child: _listaProceso(context))]));
  }

  Widget _listaProceso(BuildContext context) {
    return new ListView.builder(
      itemCount: modelopedidoProceso.length,
      itemBuilder: (context, int item) =>
          new ItemPedidoProceso(modelopedidoProceso[item]),
    );
  }
}
