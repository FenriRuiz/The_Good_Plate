import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:the_good_plate/auxiliar/formatos.dart';

class ModificarPerfil extends StatefulWidget {
  @override
  _ModificarPerfilState createState() => new _ModificarPerfilState();
}

class _ModificarPerfilState extends State<ModificarPerfil> {
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  String _tarjeta = "2154-3658-1024-2147";
  String _genero = 'No binario';
  String _telefono = "622 57 41 89";

  @override
  Widget build(BuildContext context) {
    var keyboardType;
    return new Scaffold(
      body: Container(
        child: CardSettings(
          children: <Widget>[
            new Row(
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                showImage(),
                CardSettingsButton(
                  label: "Subir avatar",
                  backgroundColor: Color.fromRGBO(36, 167, 200, 100),
                  onPressed: () {
                    pickImageFromGallery(ImageSource.gallery);
                  },
                ),
              ],
            ),
            CardSettingsHeader(
              label: 'Información básica',
            ),
            CardSettingsText(
              label: 'Nombre',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: 'Ana Pantoja',
            ),
            CardSettingsEmail(
              label: 'Correo',
              enabled: true,
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: 'ejemplo@ejemplo.com',
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Es necesario un correo.';
              },
            ),
            CardSettingsDatePicker(
              label: 'Fecha nacimiento',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: DateTime(1997, 01, 01),
            ),
            CardSettingsListPicker(
              label: 'Género',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: _genero,
              onSaved: (value) => _genero = value,
              onChanged: (value) {
                setState(() {
                  _genero = value;
                });
              },
              options: <String>['Hombre', 'Mujer', 'No binario', 'Otro'],
            ),
            CardSettingsText(
                label: 'Teléfono',
                labelAlign: TextAlign.left,
                contentAlign: TextAlign.right,
                initialValue: _telefono,
                keyboardType: keyboardType ??
                    TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  MaskedTextInputFormatter(mask: 'xxx xx xx xx', separator: ' ')
                ],
                onChanged: (value) {
                  setState(() {
                    _telefono = value;
                  });
                }),
            CardSettingsHeader(
              label: 'Seguridad',
            ),
            CardSettingsPassword(
              label: 'Nueva contraseña',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
            ),
            CardSettingsPassword(
              label: 'Repita nueva contraseña',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
            ),
            CardSettingsText(
                label: 'Tarjeta de crédito',
                labelAlign: TextAlign.left,
                contentAlign: TextAlign.right,
                initialValue: _tarjeta,
                keyboardType: keyboardType ??
                    TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  MaskedTextInputFormatter(
                      mask: 'xxxx-xxxx-xxxx-xxxx', separator: '-')
                ],
                onChanged: (value) {
                  setState(() {
                    _tarjeta = value;
                  });
                }),
            CardSettingsButton(
              label: 'Guardar cambios',
              onPressed: () {},
              backgroundColor: Color.fromRGBO(36, 167, 200, 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(borderRadius: new BorderRadius.circular(50.0)),
      child: FutureBuilder<File>(
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
      ),
    );
  }
}
