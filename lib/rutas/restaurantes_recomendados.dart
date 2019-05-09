import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/lista_restaurantes.dart';
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/auxiliar/guillotine.dart';

class RestaurantesRecomendados extends StatefulWidget {
  @override
  _RestaurantesRecomendadosState createState() =>
      new _RestaurantesRecomendadosState();
}

class _RestaurantesRecomendadosState extends State<RestaurantesRecomendados> {
  List<ModeloRestaurante> restaurantesrecomendados;

  TextEditingController _controller = TextEditingController();
  final globalKey = new GlobalKey<ScaffoldState>();

  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            /*Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                    child: Ink(
                      decoration: ShapeDecoration(
                          color: Color.fromRGBO(100, 230, 235, 100),
                          shape: CircleBorder()),
                      child: IconButton(
                        iconSize: 35,
                        icon: new Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(65, 30, 10, 0),
                  child: TextField(
                      controller: _controller,
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 18.0),
                      decoration: InputDecoration(
                          labelText: "Buscar...",
                          hintText: "Buscar...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))))),
                )
              ],
            ),*/
            SizedBox(height: 60.0),
            Expanded(child: Scaffold(body: ListaRestaurantes()))
          ],
        ));
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
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
