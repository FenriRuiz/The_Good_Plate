import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';

class ModificarPerfil extends StatefulWidget {
  @override
  _ModificarPerfilState createState() => new _ModificarPerfilState();
}

class _ModificarPerfilState extends State<ModificarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CardSettings(
          children: <Widget>[
            CardSettingsHeader(label: 'Información básica', color: Color.fromRGBO(36, 167, 200, 100),),
            CardSettingsText(
              label: 'Nombre',
            ),
            CardSettingsEmail(
              label: 'Correo',
              enabled: true,
              labelAlign: TextAlign.left,
              contentAlign: TextAlign.right,
              initialValue: 'ejemplo@ejemplo.com',
              validator: (value){ if(value == null || value.isEmpty) return 'Es necesario un correo.';},
            ),

          ],
        ),
      ),
    );
  }
}
