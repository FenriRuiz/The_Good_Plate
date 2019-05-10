import 'package:flutter/material.dart';

class ConfirmarPedido extends StatelessWidget{
  final String direccion = "C/ San Miguel, 24, Ciudad Real";
  final String telefono = "622 548 103";
  final double total = 11.5;
  final double entrega = 1;

  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
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
          SizedBox(height: 10.0,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Gastos de envío:"),
            Text("$entrega €"),
          ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Total", style: Theme.of(context).textTheme.title),
              Text("${total+entrega} €", style: Theme.of(context).textTheme.title,),
            ],
          ),
          SizedBox(height: 20.0,),
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
                onChanged: (value){},
              ),
              RadioListTile(
                selected: false,
                value: "Añadir dirección",
                groupValue: direccion,
                title: Text("Elige una nueva dirección de entrega"),
                onChanged: (value){},
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
                onChanged: (value){},              
                ),
                RadioListTile(
                  selected: false,
                  value: "Nuevo Teléfono",
                  groupValue: telefono,
                  title: Text("Eliga un nuevo número de contacto"),
                  onChanged: (value){},
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
                title: Text("Efectivo"),
                onChanged: (value){},
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: ()=>{},
                  child: Text("Confirmar pedido", style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              )
            ],
          ));
  }
}