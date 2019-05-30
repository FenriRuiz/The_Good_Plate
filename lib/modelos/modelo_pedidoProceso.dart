class ModeloPedidoProceso {
  String _estado;
  String _id;
  double _precio;
  String _restaurante;
  DateTime _fechaPedido;

  ModeloPedidoProceso({
    String estado,
    String id,
    double precio,
    String restaurante,
    DateTime fechaPedido,
  }) {
    this._estado = estado;
    this._id = id;
    this._precio = precio;
    this._restaurante = restaurante;
    this._fechaPedido = fechaPedido;
  }
  String get estado => _estado;
  String get id => _id;
  double get precio => _precio;
  String get restaurante => _restaurante;
  DateTime get fechapedido => _fechaPedido;
  // set setEstado(String value) => _estado = value;
}

List<ModeloPedidoProceso> modelopedidoProceso = <ModeloPedidoProceso>[
  ModeloPedidoProceso(
    estado: "Pagado",
    id: "256784256",
    precio: 5.15,
    restaurante: "La Josefina",
    fechaPedido: DateTime(2019, 07, 07),
  ),
  ModeloPedidoProceso(
    estado: "En cocina",
    id: "745842157",
    precio: 22.5,
    restaurante: "La Josefina",
    fechaPedido: DateTime(2019, 04, 07),
  ),
  ModeloPedidoProceso(
    estado: "En reparto",
    id: "154882001",
    precio: 12.75,
    restaurante: "La Josefina",
    fechaPedido: DateTime(2019, 07, 04),
  ),
  ModeloPedidoProceso(
    estado: "Finalizado",
    id: "45189547",
    precio: 29.99,
    restaurante: "La Josefina",
    fechaPedido: DateTime(2018, 09, 10),
  ),
];
