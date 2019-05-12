import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CogerImagen extends StatefulWidget {
  CogerImagen() : super();

  final String titulo = "Avatar";
  @override
  _CogerImagenState createState() => _CogerImagenState();
}

class _CogerImagenState extends State<CogerImagen> {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(snapshot.data, width: 300, height: 300);
        } else if (snapshot.error != null) {
          return const Text(
            "Error al cargar la foto",
            textAlign: TextAlign.center,
          );
        } else{
          return const Text("No ha seleccionado una imagen",
          textAlign: TextAlign.center);
        }
      },
    );
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage(),
            RaisedButton(
              child: Text("Seleccione una imagen de la galeria"),
              onPressed: (){
                pickImageFromGallery(ImageSource.gallery);
              },
            )
          ],
        ),
      ),
    );
  }
}
