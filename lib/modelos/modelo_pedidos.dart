class ModeloPedido {
  String _nombre;
  String _ingredientes;
  double _precio;
  String _image;
  int _cantidad;

  ModeloPedido(
      {String nombre,
      String ingredientes,
      double precio,
      String image,
      int cantidad}) {
    this._nombre = nombre;
    this._ingredientes = ingredientes;
    this._precio = precio;
    this._image = image;
    this._cantidad = cantidad;
  }
  String get nombre => _nombre;
  String get ingredientes => _ingredientes;
  double get precio => _precio;
  String get image => _image;
  int get cantidad => _cantidad;
  set setcantidad(num value) => _cantidad = value;
}

List<ModeloPedido> pedidos = <ModeloPedido>[];
set setpedidos(List<ModeloPedido> pedido) => pedidos = pedido;
