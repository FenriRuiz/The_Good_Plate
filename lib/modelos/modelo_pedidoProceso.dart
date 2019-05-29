class ModeloPedidoProceso {
  String _estado;
  String _id;
  double _precio;
  String _restaurante;

  ModeloPedidoProceso({
    String estado,
    String id,
    double precio,
    String restaurante,
  }) {
    this._estado = estado;
    this._id = id;
    this._precio = precio;
    this._restaurante = restaurante;
  }
  String get estado => _estado;
  String get id => _id;
  double get precio => _precio;
  String get restaurante => _restaurante;
 // set setEstado(String value) => _estado = value;
}

List<ModeloPedidoProceso> modelopedidoProceso = <ModeloPedidoProceso>[
  ModeloPedidoProceso(
    estado: "Pagado",
    id: "256784256",
    precio: 5.15,
    restaurante: "La Josefina",
  ),
  ModeloPedidoProceso(
    estado: "En cocina",
    id: "745842157",
    precio: 22.5,
    restaurante: "La Josefina",
  ),
  ModeloPedidoProceso(
    estado: "En reparto",
    id: "154882001",
    precio: 12.75,
    restaurante: "La Josefina",
  ),
  ModeloPedidoProceso(
    estado: "Finalizado",
    id: "45189547",
    precio: 29.99,
    restaurante: "La Josefina",
  ),
];
