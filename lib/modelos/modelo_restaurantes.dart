class ModeloRestaurante {
  String _nombre;
  double _distanciaKm;
  String _estado;
  String _descripcion;
  String _imagen;
  bool _patrocinado;
  bool _meGusta;

  ModeloRestaurante(
      {String nombre,
      double distanciaKm,
      String estado,
      String descripcion,
      String imagen,
      bool patrocinado,
      bool meGusta}) {
    this._nombre = nombre;
    this._distanciaKm = distanciaKm;
    this._estado = estado;
    this._descripcion = descripcion;
    this._imagen = imagen;
    this._patrocinado = patrocinado;
    this._meGusta = meGusta;
  }

  String get nombre => _nombre;
  double get distanciaKm => _distanciaKm;
  String get estado => _estado;
  String get descripcion => _descripcion;
  String get imagen => _imagen;
  bool get patrocinado => _patrocinado;
  bool get meGusta => _meGusta;
}

List<ModeloRestaurante> restaurantes = <ModeloRestaurante>[
  ModeloRestaurante(
      nombre: "Sasha Boom",
      distanciaKm: 2.5,
      estado: "Abierto",
      descripcion: "Explosión de sabor en Ponzano",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2017/02/sasha4.jpg",
      patrocinado: true,
      meGusta: false),
  ModeloRestaurante(
      nombre: "Pink Monkey",
      distanciaKm: 8,
      estado: "Abierto",
      descripcion: "Asia y Perú enamorando a Chamberí",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/06/unspecified-3.jpeg",
      patrocinado: false,
      meGusta: true),
  ModeloRestaurante(
      nombre: "Tampu",
      distanciaKm: 10.0,
      estado: "A punto de cerrar",
      descripcion: "El cielo peruano está en Chueca",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/11/EL-TAMBO-DEL-INCA-2.jpg",
      patrocinado: true,
      meGusta: true),
  ModeloRestaurante(
      nombre: "47 Ronin",
      distanciaKm: 15.0,
      estado: "Cerrado",
      descripcion: "El Japón más glamuroso",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/07/Barra-47Ronin-Experience.jpg",
      patrocinado: false,
      meGusta: false),
  ModeloRestaurante(
      nombre: "Ático",
      distanciaKm: 5.3,
      estado: "Cerrado",
      descripcion: "Cocina sencilla con vistas al cielo",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2017/06/atico-restaurante.jpg",
      patrocinado: false,
      meGusta: true),
  ModeloRestaurante(
      nombre: "Gran Clavel",
      distanciaKm: 2.8,
      estado: "Abierto",
      descripcion: "De vermut y comilona en los años 50",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/02/cocktailweb.jpg",
      patrocinado: true,
      meGusta: false),
  ModeloRestaurante(
      nombre: "Brasserie Antoinette",
      distanciaKm: 34.0,
      estado: "A punto de abrir",
      descripcion: "Bon appétit mademoiselle!",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/05/IMG_4957-1.jpg",
      patrocinado: false,
      meGusta: false),
  ModeloRestaurante(
      nombre: "Fismuler",
      distanciaKm: 5.2,
      estado: "Abierto",
      descripcion: "Ambiente puro, cocina única y música en directo",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2016/11/fismuler.jpg",
      patrocinado: false,
      meGusta: true),
  ModeloRestaurante(
      nombre: "Chow Chow",
      distanciaKm: 7.9,
      estado: "Cerrado",
      descripcion: "El 'street' japo-latino de moda que sí merece la pena",
      imagen: "https://eatandlovemadrid.es/wordpress/wp-content/uploads/2018/05/IMG_7238.jpg",
      patrocinado: false,
      meGusta: false),

];

