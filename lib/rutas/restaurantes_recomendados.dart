import "package:flutter/material.dart";

class RestaurantesRecomendados extends StatefulWidget{
  @override
  _RestaurantesRecomendadosState createState() => new _RestaurantesRecomendadosState();
}

class _RestaurantesRecomendadosState extends State<RestaurantesRecomendados>{

TextEditingController editingController = TextEditingController();
final items = List<String>.generate(10000, (i) => "Item $i");

  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: editingController,
                    decoration: InputDecoration(
                      labelText: "Buscar...",
                      hintText: "Buscar...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      )
                    ),
                  ),
                ),
              ]),
                            
            ],
          ),
        ),
      ) 
    );
  }
}