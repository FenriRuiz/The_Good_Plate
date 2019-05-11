import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/lista_restaurantes.dart';
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';

class RestaurantesRecomendados extends StatefulWidget {
  @override
  _RestaurantesRecomendadosState createState() =>
      new _RestaurantesRecomendadosState();
}

class _RestaurantesRecomendadosState extends State<RestaurantesRecomendados> {
  List<ModeloRestaurante> restaurantesrecomendados;

  final globalKey = new GlobalKey<ScaffoldState>();

  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 80.0),
            Expanded(child: Scaffold(body: ListaRestaurantes()))
          ],
        ));
  }


  void searchOperation(String searchText) {
    searchresult.clear();
    print('SearchOperation funcionando');

    if (_isSearching != null) {
      for (int i = 0; i < restaurantesrecomendados.length; i++) {
        String data = restaurantesrecomendados[i].toString();
        if (data.toLowerCase().contains(_searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
