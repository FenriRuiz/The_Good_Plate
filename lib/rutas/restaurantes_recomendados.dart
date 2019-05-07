import "package:flutter/material.dart";

class RestaurantesRecomendados extends StatefulWidget{
  @override
  _RestaurantesRecomendadosState createState() => new _RestaurantesRecomendadosState();
}

class _RestaurantesRecomendadosState extends State<RestaurantesRecomendados>{
  Widget build(BuildContext context){
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
            //color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    "images/LogoWhite.png",
                    fit: BoxFit.contain
                    )
                  )
                ],
              )
            )
          
        ) 
      )
    );
  }
}