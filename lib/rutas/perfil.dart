import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';
import 'package:the_good_plate/rutas/modificarPerfil.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';

class PerfilActivity extends StatefulWidget {
  static const nombreRuta = "/perfil";

  ModeloUsuario user;
  PerfilActivity({Key key, @required this.user}) : super(key: key);
  @override
  _PerfilActivityState createState() => new _PerfilActivityState();
}

class _PerfilActivityState extends State<PerfilActivity> {
  final image = 'images/avatar.jpg';

  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((BuildContext context) => ModificarPerfil())));
          },
          child: Icon(Icons.edit),
          backgroundColor: Color.fromRGBO(157, 107, 232, 100)),
      backgroundColor: Colors.grey.shade700,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 190, 200, 100),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.user.usuario.toString(),
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("285"),
                                      Text("Likes")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("300"),
                                      Text("Reseñas"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("5"),
                                      Text("Favoritos")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                                  NetworkImage((widget.user.avatar).toString()),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 190, 200, 100),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Información de usuario"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text(widget.user.correo.toString()),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Teléfono"),
                          subtitle: Text(widget.user.telefono.toString()),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Se unió"),
                          subtitle: Text("15 febrero 2019"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                        ListTile(
                          title: Text("Informacion"),
                          subtitle: Text(
                             widget.user.informacion.toString()),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new GuillotineMenu(user: widget.user),
          ],
        ),
      ),
    );
  }
}
