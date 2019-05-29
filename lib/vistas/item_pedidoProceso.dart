import 'package:flutter/material.dart';
import 'package:the_good_plate/modelos/modelo_pedidoProceso.dart';

class ItemPedidoProceso extends StatefulWidget {
  final ModeloPedidoProceso _pedidoProceso;
  ItemPedidoProceso(this._pedidoProceso);

  @override
  ItemPedidoProcesoState createState() =>
      new ItemPedidoProcesoState(_pedidoProceso);
}

class ItemPedidoProcesoState extends State<ItemPedidoProceso> {
  ItemPedidoProcesoState(ModeloPedidoProceso _pedidoProceso);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Card(
        color: Color.fromRGBO(60, 190, 200, 100),
        elevation: 8.0,
        child: ListTile(
          leading: Icon(
            _asignarIcono(widget._pedidoProceso),
            size: 50.0,
          ),
          title: Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget._pedidoProceso.estado.toString(),
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(widget._pedidoProceso.id.toString()),
                Text(widget._pedidoProceso.precio.toString()),
                Text(widget._pedidoProceso.restaurante.toString())
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  IconData _asignarIcono(pedidoProceso) {
    if (pedidoProceso.estado == "Pagado") {
      return (Icons.attach_money);
    } else if (pedidoProceso.estado == "En cocina") {
      return (Icons.update);
    } else if (pedidoProceso.estado == "En reparto") {
      return (Icons.motorcycle);
    } else if (pedidoProceso.estado == "Finalizado") {
      return (Icons.close);
    }
  }
}
