import 'package:flutter/material.dart';
import 'package:the_good_plate/auxiliar/dialogo_pago.dart';


class AlertaCobro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(75),
              bottomLeft: Radius.circular(75),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.announcement, size: 90.0, color: Colors.red,)
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "¡Atención!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: Text("¿Desea continuar con el pago?",style: TextStyle(color: Colors.grey,)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("No"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Si"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              //_paymentSuccessDialog(context);
                              Navigator.of(_paymentSuccessDialog(context)).pop();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
      _paymentSuccessDialog( BuildContext context ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PaymentSuccessDialog();
      }
    );
  }

}
