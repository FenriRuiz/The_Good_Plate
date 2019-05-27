class ModeloUsuario {
  String _usuario;
  String _contrasenia;
  String _correo;
  String _telefono;
  String _informacion;
  DateTime _fechaNacimiento;
  String _genero;
  String _direccion;
  String _tarjetaCredito;
  String _avatar;

  ModeloUsuario(
      {String usuario,
      String contrasenia,
      String correo,
      String telefono,
      String informacion,
      DateTime fechaNacimiento,
      String genero,
      String direccion,
      String tarjetaCredito,
      String avatar}) {
    this._usuario = usuario;
    this._contrasenia = contrasenia;
    this._correo = correo;
    this._telefono = telefono;
    this._informacion = informacion;
    this._fechaNacimiento = fechaNacimiento;
    this._genero = genero;
    this._direccion = direccion;
    this._tarjetaCredito = tarjetaCredito;
    this._avatar = avatar;
  }
  String get usuario => _usuario;
  String get contrasenia => _contrasenia;
  String get correo => _correo;
  String get telefono => _telefono;
  String get informacion => _informacion;
  DateTime get fechaNacimiento => _fechaNacimiento;
  String get genero => _genero;
  String get direccion => _direccion;
  String get tarjetaCredito => _tarjetaCredito;
  String get avatar => _avatar;
  set usuario(value) => value;
}

List<ModeloUsuario> usuarios = <ModeloUsuario>[
  ModeloUsuario(
    usuario: "lucia_agarcia",
    contrasenia: "1234",
    correo: "lucia.alfonso@alu.uclm.es",
    telefono: "622548751",
    informacion: "Estudiante de Ing. Informatica en la ESI CR",
    genero: "Mujer",
    direccion: "C/Clara Campoamor",
    tarjetaCredito: "8547-2354-2356-1245",
    avatar: "https://i.imgur.com/LYZbGqy.png",
  ),
  ModeloUsuario(
    usuario: "fenriruiz",
    contrasenia: "Fenri",
    correo: "Fernando.Ruiz6@alu.uclm.es",
    telefono: "624851144",
    informacion: "Estudiante de Ing. Informatica en la ESI CR",
    genero: "Hombre",
    direccion: "Miguelturra",
    tarjetaCredito: "7455-2330-1448-9650",
    avatar: "https://i.imgur.com/umieV1B.jpg",
  ),
  ModeloUsuario(
    usuario: "admin",
    contrasenia: "admin",
    correo: "admin.admin@alu.uclm.es",
    telefono: "624851144",
    informacion: "Cuenta Administrador",
    genero: "Otro",
    direccion: " ",
    tarjetaCredito: " ",
    avatar: "https://i.imgur.com/umieV1B.jpg",
  ),
  ModeloUsuario(
    usuario: "",
    contrasenia: "",
    avatar: "https://i.imgur.com/LYZbGqy.png",
  ),
];
