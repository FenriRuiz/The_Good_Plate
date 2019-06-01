import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';
import 'package:the_good_plate/dialogos/dialogo_alertaCobro.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';

class ConfirmarPedido extends StatefulWidget {
  ModeloUsuario user;
  List<ModeloPedido> pedido;
  ConfirmarPedido({Key key, @required this.user, this.pedido}) : super(key: key);

  ConfirmarPedidoState createState() => new ConfirmarPedidoState();
}

class ConfirmarPedidoState extends State<ConfirmarPedido> {
  String direccion = "C/ San Miguel, 24, Ciudad Real";
  String telefono = "622 548 103";
  double total = 11.5;
  double entrega = 1;

  //ConfirmarPedidoState(ModeloUsuario user, PedidosActivity pedido);

  Widget _buildBody(BuildContext context) {
    double total = 0.0;
    double envio = 1.0;
    double subtotal = 0.0;
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, top: 40.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal: "),
                Text(_subtotal(widget.pedido, subtotal).toString()+" €"),
                //Text(widget.pedido.subtotal.toString()+"€"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Gastos de envío:"),
                Text(envio.toString()+"€"),
                //Text(widget.pedido.envio.toString()+"€"),
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
                  _total(widget.pedido, envio, total, subtotal)+" €",
                  //widget.pedido.total.toString()+"€",
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
                  value: widget.user.direccion.toString(),
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
                  value: widget.user.direccion.toString(),
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
                GuillotineMenu(user: widget.user),
              ],
            )));
  }

  _alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertaCobro(user: widget.user, pedido: widget.pedido,);
        });
  }
  double _subtotal(List<ModeloPedido> pedido, double subtotal) {
    for (int i = 0; i < widget.pedido.length; i++) {
      subtotal += (widget.pedido[i].cantidad * widget.pedido[i].precio);
    }
    return subtotal;
  }

  String _total(List<ModeloPedido> pedido, double envio,
      double total, double subtotal) {
      total = _subtotal(pedido, subtotal) + envio;
    return total.toStringAsFixed(2).toString();
  }
}
