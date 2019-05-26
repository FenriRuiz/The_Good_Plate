class ModeloPedido {
  String _nombre;
  String _ingredientes;
  double _precio;
  String _image;
  int _cantidad;

  ModeloPedido(
      {String nombre, String ingredientes, double precio, String image, int cantidad}) {
    this._nombre = nombre;
    this._ingredientes = ingredientes;
    this._precio = precio;
    this._image = image;
    this._cantidad=cantidad;
  }
  String get nombre => _nombre;
  String get ingredientes => _ingredientes;
  double get precio => _precio;
  String get image => _image;
  int get cantidad => _cantidad;
  set setcantidad (num value) => _cantidad = value;
}

List<ModeloPedido> pedidos = <ModeloPedido>[
  ModeloPedido(
     nombre: "Arroz frito tres delicias",
      ingredientes: "Arroz, canahoria, guisantes, salsa de soja y huevo",
      precio: 5.15,
      cantidad: 1,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Dishes-548x202/Chinese/Arroz-Frito-Tres-Delicias-548x202.jpg?h=202&w=548&bid=3f74b90c586f4a83ab851a0593f72d7d&hash=B034682C01530AB30CB2DFDD9321064A"),
 
  ModeloPedido(
  nombre: "Feijoada",
      ingredientes: "Frijoles, cerdo, arroz, verduras, plátano",
      precio: 10.5,
      cantidad: 2,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Latin-American/6872.jpg?h=363&w=981&bid=2292655a2c4447fdaded99535bbab68b&hash=C22A0E693CA8FD373F59B72ECCE3FAAB"),
  ModeloPedido(
     nombre: "Rico y con fundamento",
      ingredientes: "Arroz, canahoria, guisantes, salsa de soja y huevo",
      precio: 5.15,
      cantidad: 4,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Dishes-548x202/Chinese/Arroz-Frito-Tres-Delicias-548x202.jpg?h=202&w=548&bid=3f74b90c586f4a83ab851a0593f72d7d&hash=B034682C01530AB30CB2DFDD9321064A"),
 ModeloPedido(
  nombre: "Feijoada",
      ingredientes: "Frijoles, cerdo, arroz, verduras, plátano",
      precio: 10.5,
      cantidad: 2,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Latin-American/6872.jpg?h=363&w=981&bid=2292655a2c4447fdaded99535bbab68b&hash=C22A0E693CA8FD373F59B72ECCE3FAAB"),
 ModeloPedido(
  nombre: "Pos eso",
      ingredientes: "Frijoles, cerdo, arroz, verduras, plátano",
      precio: 10.5,
      cantidad: 2,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Latin-American/6872.jpg?h=363&w=981&bid=2292655a2c4447fdaded99535bbab68b&hash=C22A0E693CA8FD373F59B72ECCE3FAAB"),
 ModeloPedido(
  nombre: "Último",
      ingredientes: "Frijoles, cerdo, arroz, verduras, plátano",
      precio: 10.5,
      cantidad: 2,
      image:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Latin-American/6872.jpg?h=363&w=981&bid=2292655a2c4447fdaded99535bbab68b&hash=C22A0E693CA8FD373F59B72ECCE3FAAB"),
];
