import "package:flutter/material.dart";

class RegistrarActivity extends StatefulWidget {
  @override
  _RegistrarActivityState createState() => new _RegistrarActivityState();
}

class _RegistrarActivityState extends State<RegistrarActivity> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static List _edades = [
    "Edad",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentEdad;
  String edadesSpinnerValue = _edades[0];

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentEdad = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String edad in _edades) {
      items.add(new DropdownMenuItem(value: edad, child: new Text(edad)));
    }
    return items;
  }

  Widget build(BuildContext context) {
    final usuarioField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Usuario",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final correoField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Correo",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Contraseña",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final edadField = DropdownButton(
      value: _currentEdad,
      onChanged: changedDropDownItem,
      items: _dropDownMenuItems,
      style: style,
    );
    final registrarBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(60, 190, 200, 100),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Registrar",
            textAlign: TextAlign.center,
            style: style.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0),
                usuarioField,
                SizedBox(height: 25.0),
                correoField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(child: edadField),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: Color.fromRGBO(150, 150, 150, 70)
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0)
                    ),  
                  ),
                ),
                SizedBox(height: 25.0),
                registrarBtn
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedEdad) {
    setState(() {
      _currentEdad = selectedEdad;
    });
  }
}
