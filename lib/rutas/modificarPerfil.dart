import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:the_good_plate/auxiliar/formatos.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ModificarPerfil extends StatefulWidget {
  ModeloUsuario user;
  ModificarPerfil({Key key, @required this.user}) : super(key: key);
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
                  height: 120.0,
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
              label: 'Usuario',
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: widget.user.usuario.toString(),
            ),
            CardSettingsEmail(
              label: 'Correo',
              enabled: true,
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: widget.user.correo.toString(),
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
              initialValue: widget.user.genero,
              onSaved: (value) => widget.user.genero = value,
              onChanged: (value) {
                setState(() {
                  widget.user.genero = value;
                });
              },
              options: <String>['Hombre', 'Mujer', 'No binario', 'Otro'],
            ),
            CardSettingsText(
                label: 'Teléfono',
                labelAlign: TextAlign.left,
                contentAlign: TextAlign.right,
                initialValue: widget.user.telefono,
                keyboardType: keyboardType ??
                    TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  MaskedTextInputFormatter(mask: 'xxx xx xx xx', separator: ' ')
                ],
                onChanged: (value) {
                  setState(() {
                    widget.user.telefono = value;
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
                initialValue: widget.user.tarjetaCredito,
                keyboardType: keyboardType ??
                    TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  MaskedTextInputFormatter(
                      mask: 'xxxx-xxxx-xxxx-xxxx', separator: '-',)
                ],
                onChanged: (value) {
                  setState(() {
                    widget.user.tarjetaCredito = value;
                  });
                }),
            CardSettingsButton(
              label: 'Guardar cambios',
              onPressed: () {
                Fluttertoast.showToast(msg: "No actualiza, no hay BBDD", toastLength: Toast.LENGTH_SHORT);
              },
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
      padding: const EdgeInsets.all(30.0),
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
            return const Text('No ha seleccionado\n ninguna imagen',overflow:TextOverflow.ellipsis,maxLines: 2,
                textAlign: TextAlign.center);
          }
        },
      ),
    );
  }
}
