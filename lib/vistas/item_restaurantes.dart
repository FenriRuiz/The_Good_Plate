import "package:flutter/material.dart";
import 'package:the_good_plate/modelos/modelo_restaurantes.dart';

class ItemRestaurante extends StatelessWidget {
  final ModeloRestaurante _restaurante;
  ItemRestaurante(this._restaurante);
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget build(BuildContext context) {
    // return Column(children: <Widget>[

    //   new ListTile(

    //     leading: Container(
    //       child: Image.network(
    //         _restaurante.imagen,
    //         width: 100.0,
    //         height: 100.0,
    //         fit: BoxFit.cover,
    //       )
    //     ),
    //     title: new Row(
    //       children: <Widget>[
    //         new Text(
    //           _restaurante.nombre,
    //           style: new TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //         new Text(
    //           "Distancia: " + _restaurante.distanciaKm.toString(),
    //           style: new TextStyle(
    //             fontSize: 13.5,
    //             color: Colors.grey,
    //           ),
    //         )
    //       ],
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     ),
    //     subtitle: new Container(
    //       child: new Text(
    //         _restaurante.descripcion,
    //         style: new TextStyle(
    //           fontSize: 15.0,
    //           color: Colors.grey,
    //         ),
    //       ),
    //       padding: const EdgeInsets.only(top: 5.0),
    //     ),
    //     /*onTap: (){
    //       Route ruta = new MaterialPageRoute(
    //         builder: (context) => new Chat(
    //           contacto: _contacto
    //         )
    //       );
    //       Navigator.push(context, ruta);
    //     },*/
    //   ),
    //   new Divider(
    //     height: 18.0,
    //   ),
    // ]);
    return new ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Color.fromRGBO(60,190,200,100),
        // Los hijos dentro de card en columnas, debajo de otro
        child: new Column(
          
          children: <Widget>[
            
            // Agregamos una imagen consumida desde internet
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Padding( 
                padding: const EdgeInsets.fromLTRB(5,5,5,5  ),
                child:Image.network(
                  _restaurante.imagen),
              ),
            ),
            // Agregamos un contenedor para el texto
            new Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5), // Un padding para todo
              child: Text(
                _restaurante.nombre,
                style: style,
                softWrap: true,
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5), // Un padding para todo
              child: Text(
                _restaurante.descripcion,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
                softWrap: true,
              ),
            ),
            new Padding(
                // Esta seccion sera para los botones de acciones
                padding: new EdgeInsets.all(
                    7.0), // Un padding general entre cada elemento
                child: new Row(
                  // mainAxisAlignment permite alinear el contenido dentro de Row
                  // en este caso le digo que use spaceBetwee, esto hara que
                  // cualquier espacio horizontal que no se haya asignado dentro de children
                  // se divida de manera uniforme y se coloca entre los elementos secundarios.
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Agregamos los botones de tipo Flat, un icono, un texto y un evento
                    new FlatButton.icon(
                      icon: Icon(Icons.star_border,
                          size: 40.0, color: Colors.amberAccent),
                      label: const Text(''),
                      onPressed: () {
                        Icon(Icons.star,
                          size: 40.0, color: Colors.amberAccent);
                      },
                    ),
                    new FlatButton.icon(
                      // Un icono puede recibir muchos atributos, aqui solo usaremos icono, tamaño y color                
                      icon: const Icon(Icons.favorite_border,
                          size: 40.0, color: Colors.redAccent),
                      label: const Text(''),
                      // Esto mostrara 'Me encanta' por la terminal
                      onPressed: () {
                        print('Me encanta');
                      },
                    )
                  ],
                ))
          ],
        ),
      )
    );
  }
}
