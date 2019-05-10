import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/gtypography.dart';

class ListaPedidos extends StatelessWidget {
  
  const ListaPedidos({
    Key key,
    @required this.nombre,
    @required this.descripcion,
    @required this.image,
    this.price,
  }) : super(key: key);

  final String nombre;
  final String descripcion;
  final String image;
  final double price;


  @override
  Widget build(BuildContext context) {
    return Card(
      color:Color.fromRGBO(60, 190, 200, 100),
      elevation: 8.0,
      child: ListTile(
        leading: Container(
            height: 80.0,
            child: Image.asset(
              image,
              height: 80.0,
            )),
        title: Container(
          height: 120.0,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new GroceryTitle(text: nombre),
              new GrocerySubtitle(text: descripcion),
              ],
          ),
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.cyan,
                onPressed: () {}),
            Text(
              "1",
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.cyan,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
