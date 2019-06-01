import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_good_plate/auxiliar/guillotine.dart';
import 'package:the_good_plate/modelos/modelo_pedidos.dart';
import 'package:the_good_plate/modelos/modelo_usuarios.dart';
import 'package:the_good_plate/rutas/lista_pedidos.dart';


class PagoCorrecto extends StatefulWidget {
  ModeloUsuario user;
  List<ModeloPedido> pedido;
  PagoCorrecto({Key key, @required this.user, this.pedido}) : super(key: key);

  final image = 'images/avatar.jpg';

  @override
  _PagoCorrectoState createState() => _PagoCorrectoState();
}

class _PagoCorrectoState extends State<PagoCorrecto> {
  final TextStyle subtitle = TextStyle(fontSize: 14.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 16.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 450,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "¡Gracias!",
                  style: TextStyle(color: Color.fromRGBO(36, 167, 200, 100)),
                ),
                Text(
                  "Tu transacción ha sido completada con éxito",
                  style: label,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "FECHA",
                      style: label,
                    ),
                    Text(
                      "HORA",
                      style: label,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(DateFormat('dd/mm/yyyy')
                        .format(DateTime.now())
                        .toString()),
                    Text(DateFormat('kk:mm').format(DateTime.now()).toString())
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PARA:",
                          style: label,
                        ),
                        Text(widget.user.usuario.toString()),
                        Text(
                          widget.user.correo.toString(),
                          style: subtitle,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(36, 167, 200, 100),
                      backgroundImage: AssetImage(widget.user.avatar.toString()),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "COBRO",
                          style: label,
                        ),
                        Text(widget.pedido.toString()),
                      ],
                    ),
                    Text(
                      "COMPLETADO",
                      style: label,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.account_balance_wallet),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Tarjéta de crédito/débido",
                          ),
                          Text(
                            "Master card ****-2147",
                            style: subtitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                        child: Text("Cerrar"),
                        color: Colors.cyan,
                        colorBrightness: Brightness.dark,
                        onPressed: () {
                          Navigator.of(
                                  _volverRestaurante(context, ModeloUsuario()))
                              .pop(context); //_paymentSuccessDialog(context);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_volverRestaurante(BuildContext context, ModeloUsuario user) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Guillotine(user: user);
      });
}
