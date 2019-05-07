import 'package:flutter/material.dart';
import 'package:the_good_plate/rutas/login.dart';

void main(){
  runApp(new MaterialApp(
    home: new LoginActivity(),
    title: "The Good Plate",
    theme: new ThemeData(
      brightness: Brightness.dark,
        primaryColor: Colors.grey[700],
        backgroundColor: Colors.grey[800],
        canvasColor: Colors.grey[800],
        accentColor: Colors.orangeAccent[500], 
      ),
    debugShowCheckedModeBanner: false,
    ));
}

