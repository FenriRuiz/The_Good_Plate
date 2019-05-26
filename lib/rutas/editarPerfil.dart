import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          
          TextField(
            decoration: InputDecoration(
              labelText: "Usuario",
              filled: true,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Contraseña actual',
              filled: true,
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nueva contraseña',
              filled: true,
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Repita la contraseña',
              filled: true,
            ),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('Siguiente'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(snapshot.data, width: 100, height: 100);
        } else if (snapshot.error != null) {
          return const Text(
            'No ha sido posible añadir su imagen',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text('No ha seleccionado ninguna imagen',
              textAlign: TextAlign.center);
        }
      },
    );
  }
}
