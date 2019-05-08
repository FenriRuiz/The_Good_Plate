import "package:flutter/material.dart";
import 'package:the_good_plate/rutas/lista_restaurantes.dart';
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';
import 'package:the_good_plate/vistas/item_restaurantes.dart';

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
    values();
  }

  void values() {
    restaurantesrecomendados = <ModeloRestaurante>[
      ModeloRestaurante(
          nombre: "Sasha Boom",
          distanciaKm: 2.5,
          estado: "Abierto",
          descripcion: "Explosión de sabor en Ponzano",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2017/02/sasha4.jpg",
          patrocinado: true,
          meGusta: false),
      ModeloRestaurante(
          nombre: "Pink Monkey",
          distanciaKm: 8,
          estado: "Abierto",
          descripcion: "Asia y Perú enamorando a Chamberí",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/06/unspecified-3.jpeg",
          patrocinado: false,
          meGusta: true),
      ModeloRestaurante(
          nombre: "Tampu",
          distanciaKm: 10.0,
          estado: "A punto de cerrar",
          descripcion: "El cielo peruano está en Chueca",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/11/EL-TAMBO-DEL-INCA-2.jpg",
          patrocinado: true,
          meGusta: true),
      ModeloRestaurante(
          nombre: "47 Ronin",
          distanciaKm: 15.0,
          estado: "Cerrado",
          descripcion: "El Japón más glamuroso",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/07/Barra-47Ronin-Experience.jpg",
          patrocinado: false,
          meGusta: false),
      ModeloRestaurante(
          nombre: "Ático",
          distanciaKm: 5.3,
          estado: "Cerrado",
          descripcion: "Cocina sencilla con vistas al cielo",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2017/06/atico-restaurante.jpg",
          patrocinado: false,
          meGusta: true),
      ModeloRestaurante(
          nombre: "Gran Clavel",
          distanciaKm: 2.8,
          estado: "Abierto",
          descripcion: "De vermut y comilona en los años 50",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/02/cocktailweb.jpg",
          patrocinado: true,
          meGusta: false),
      ModeloRestaurante(
          nombre: "Brasserie Antoinette",
          distanciaKm: 34.0,
          estado: "A punto de abrir",
          descripcion: "Bon appétit mademoiselle!",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/05/IMG_4957-1.jpg",
          patrocinado: false,
          meGusta: false),
      ModeloRestaurante(
          nombre: "Fismuler",
          distanciaKm: 5.2,
          estado: "Abierto",
          descripcion: "Ambiente puro, cocina única y música en directo",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/11/fismuler.jpg",
          patrocinado: false,
          meGusta: true),
      ModeloRestaurante(
          nombre: "Chow Chow",
          distanciaKm: 7.9,
          estado: "Cerrado",
          descripcion: "El 'street' japo-latino de moda que sí merece la pena",
          imagen:
              "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/05/IMG_7238.jpg",
          patrocinado: false,
          meGusta: false),
    ];
  }

  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
 /* RestaurantesRecomendados() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }*/

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
                  controller: _controller,
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 18.0),
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
         child: Scaffold(
           body: ListaRestaurantes()
            
         ))
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
