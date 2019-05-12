import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';
import 'package:the_good_plate/auxiliar/animatedFab.dart';

class PerfilActivity extends StatefulWidget {
  static const nombreRuta = "/perfil";

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
                      _buildContenedorSuperior(),
                   
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),   new AnimatedFab(),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildContenedorInferior(),
                ],
              ),
            ),
            new GuillotineMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildContenedorSuperior() {
    return Container(
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
                  "Little Butterfly",
                  style: Theme.of(context).textTheme.title,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Enfermera"),
                  subtitle: Text("Ciudad Real"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[Text("285"), Text("Likes")],
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
                  children: <Widget>[Text("5"), Text("Favoritos")],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContenedorInferior() {
    return Container(
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
            subtitle: Text("Ana.Pantoja@gmail.com"),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text("Teléfono"),
            subtitle: Text("622 547 840"),
            leading: Icon(Icons.phone),
          ),
          ListTile(
            title: Text("Teléfono"),
            subtitle: Text("622 547 840"),
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
                "Me gusta la comida Americana y los bares con buenas tapas"),
            leading: Icon(Icons.calendar_view_day),
          ),
        ],
      ),
    );
  }
}
