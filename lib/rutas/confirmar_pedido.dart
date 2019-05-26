import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';
import 'package:the_good_plate/auxiliar/dialogo_alertaCobro.dart';

class ConfirmarPedido extends StatefulWidget {
  ConfirmarPedidoState createState() => new ConfirmarPedidoState();
}

class ConfirmarPedidoState extends State<ConfirmarPedido> {
  String direccion = "C/ San Miguel, 24, Ciudad Real";
  String telefono = "622 548 103";
  double total = 11.5;
  double entrega = 1;

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, top: 40.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal: "),
                Text("$total €"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Gastos de envío:"),
                Text("$entrega €"),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total", style: Theme.of(context).textTheme.title),
                Text(
                  "${total + entrega} €",
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Color.fromRGBO(60, 190, 200, 100),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text("Direccion de entrega".toUpperCase()),
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  selected: true,
                  value: direccion,
                  groupValue: direccion,
                  title: Text(direccion),
                  onChanged: (value) {},
                ),
                RadioListTile(
                  selected: false,
                  value: "Añadir dirección",
                  groupValue: direccion,
                  title: Text("Elige una nueva dirección de entrega"),
                  onChanged: (value) {},
                ),
                Container(
                  color: Color.fromRGBO(60, 190, 200, 100),
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Text("Teléfono de contacto".toUpperCase()),
                ),
                RadioListTile(
                  selected: true,
                  value: telefono,
                  groupValue: telefono,
                  title: Text(telefono),
                  onChanged: (value) {},
                ),
                RadioListTile(
                  selected: false,
                  value: "Nuevo Teléfono",
                  groupValue: telefono,
                  title: Text("Elija un nuevo número de contacto"),
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Color.fromRGBO(60, 190, 200, 100),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text("Opciones de pago".toUpperCase()),
            ),
            RadioListTile(
              groupValue: true,
              value: true,
              title: Text("Tarjeta de crédito/débito"),
              onChanged: (value) {},
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () => {_alertDialog(context)},
                child: Text(
                  "Confirmar pedido",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(right: 8.0, top: 8.0),
            child: new Stack(
              children: <Widget>[
                _buildBody(context),
                GuillotineMenu(),
              ],
            )));
  }

  _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertaCobro();
      }
    );
  }
}
