import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/auxiliar/gtypography.dart';

class ItemPedido extends StatelessWidget{
  final ListaPedidos _pedido;
  ItemPedido(this._pedido);

@override
  Widget build(BuildContext context) {
    return Card(
      color:Color.fromRGBO(255,255,255,100),
      elevation: 8.0,
      child: ListTile(
        leading: Container(
            height: 80.0,
            child: Image.asset(
              _pedido.image,
              height: 80.0,
            )),
        title: Container(
          height: 120.0,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new GroceryTitle(text: _pedido.nombre),
              new GrocerySubtitle(text: _pedido.descripcion),
              ],
          ),
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.grey[800],
                onPressed: () {}),
            Text(
              "3",
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.grey[800],
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}