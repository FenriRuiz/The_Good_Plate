import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/gtypography.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';

class ItemPedido extends StatefulWidget {
  final ModeloPedido _pedido;
  ItemPedido(this._pedido);

  @override
  ItemPedidoState createState() => new ItemPedidoState(_pedido);
}

class ItemPedidoState extends State<ItemPedido> {
  ItemPedidoState(ModeloPedido _pedido);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(60, 190, 200, 100),
      elevation: 8.0,
      child: ListTile(
        leading: CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(
              widget._pedido.image,
            )),
        title: Container(
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new GroceryTitle(text: widget._pedido.nombre),
              new GrocerySubtitle(text: widget._pedido.ingredientes),
              new GrocerySubtitle(
                  text: "\nPrecio unidad: " +
                      widget._pedido.precio.toString() +
                      "€"),
            ],
          ),
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.cyan,
                onPressed: () {
                  setState(() {
                    widget._pedido.setcantidad = widget._pedido.cantidad + 1;
                  });
                }),
            Text(
              widget._pedido.cantidad.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.cyan,
              onPressed: () {
                setState(() {
                  if (widget._pedido.cantidad > 1) {
                    widget._pedido.setcantidad= widget._pedido.cantidad - 1;
                    //TODO: implementar una funcion "borrar" del pedido
                  }
                });
              },
            ),
            Text(widget._pedido.precio.toString())
          ],
        ),
      ),
    );
  }
}
