import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/lista_restaurantes.dart';

class RestaurantesRecomendados extends StatefulWidget {
  @override
  _RestaurantesRecomendadosState createState() =>
      new _RestaurantesRecomendadosState();
}

class _RestaurantesRecomendadosState extends State<RestaurantesRecomendados> {
  TextEditingController editingController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Ink(
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(100, 230, 235, 100),
                    shape: CircleBorder()
                  ),
                  child: IconButton(
                    iconSize: 35,
                    icon: new Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(65, 30, 10, 0),
              child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Buscar...",
                      hintText: "Buscar...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))))),
            )
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/Restaurante.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              //child: new ListaRestaurantes()
            ),
          ],
        ))))
      ],
    ));
  }
}
