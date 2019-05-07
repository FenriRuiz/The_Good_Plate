class ModeloRestaurante{
  String _nombre;
  double _distanciaKm;
  String _estado;
  String _descripcion;
  String _imagen;
  bool _patrocinado;
  bool _meGusta;

  ModeloRestaurante({String nombre, double distanciaKm, String estado,
  String descripcion, String imagen, bool patrocinado, bool meGusta}){
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
List<ModeloRestaurante>