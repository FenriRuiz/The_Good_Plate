class ModeloPlato {
  String _nombre;
  String _ingredientes;
  double _precio;
  String _imagen;

  ModeloPlato(
      {String nombre, String ingredientes, double precio, String imagen}) {
    this._nombre = nombre;
    this._ingredientes = ingredientes;
    this._precio = precio;
    this._imagen = imagen;
  }
  String get nombre => _nombre;
  String get ingredientes => _ingredientes;
  double get precio => _precio;
  String get imagen => _imagen;
}

List<ModeloPlato> platos = <ModeloPlato>[
  ModeloPlato(
      nombre: "Rollitos de primavera",
      ingredientes: "Col china, zanahoria, cebolla y otros vegetales",
      precio: 4.25,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Dishes-548x202/Chinese/Rollitos-de-Primavera-548x202.jpg?h=202&w=548&bid=fb490bafe46d4b69a8cec389fe02a12f&hash=535D2907531EAA822C620AB6CE0C6CC0"),
  ModeloPlato(
      nombre: "Arroz frito tres delicias",
      ingredientes: "Arroz, canahoria, guisantes, salsa de soja y huevo",
      precio: 5.15,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Dishes-548x202/Chinese/Arroz-Frito-Tres-Delicias-548x202.jpg?h=202&w=548&bid=3f74b90c586f4a83ab851a0593f72d7d&hash=B034682C01530AB30CB2DFDD9321064A"),
  ModeloPlato(
      nombre: "Feijoada",
      ingredientes: "Frijoles, cerdo, arroz, verduras, plátano",
      precio: 10.5,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Latin-American/6872.jpg?h=363&w=981&bid=2292655a2c4447fdaded99535bbab68b&hash=C22A0E693CA8FD373F59B72ECCE3FAAB"),
  ModeloPlato(
      nombre: "Bibimbap",
      ingredientes:
          "Arroz con verduras salteadas, champiñones, ternera, salsa de soja, guindillas y huevo",
      precio: 4.5,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Japanese/155281.jpg?h=363&w=981&bid=c8460c7529d24c03ac67ad83003f377a&hash=687A33CEFBF8D5FE1E933377BF5FA2BE"),
  ModeloPlato(
      nombre: "Kalua Pig",
      ingredientes: "Cerdo ahumado en hojas de plátano",
      precio: 8.0,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Steak/6368.jpg?h=363&w=981&bid=2ea434524a264dbe8548042112d93245&hash=F8277B9E2E1A86BF03D83665C7F6C6D2"),
  ModeloPlato(
      nombre: "Kebab con Queso",
      ingredientes:
          "Queso feta, ternera, cebolla, pimiento, tomate, lechuga, pepino, salsa yogurth",
      precio: 5.5,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Dishes-548x202/Kebabs/Kebab-con-Queso-548x202.jpg?h=202&w=548&bid=3137241b06cd4a9593a3a7c7d9a370e8&hash=4FAD77707E9C51FF7521C6BBB79E7AD2"),
  ModeloPlato(
      nombre: "Bhuna Khichuri",
      ingredientes: "Lentejas, arroz, pollo y cebolla",
      precio: 11.0,
      imagen:
          "https://www.just-eat.es/CmsAssets/media/Images/Cuisines/Editorial-981x363/Indian/MLB_0957.jpg?h=363&w=981&bid=b9f5f9c9c068426bb0543e41fead9f07&hash=AE1624CC1BECF171B9BE3562F6666E5D"),
];
