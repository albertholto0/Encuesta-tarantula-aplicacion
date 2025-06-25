class Formulario {
  String nombre;
  int edad;
  String sexo; // 'F' o 'M'
  String lenguaMaterna;
  String grupoEtnico;
  String fuenteTrabajo;
  String escolaridad;
  String tenenciaTierra; // 'comunal' o 'privada'
  String estadoCivil;
  String lugarOrigen;
  int? numeroHijos; // Opcional

  Formulario({
    required this.nombre,
    required this.edad,
    required this.sexo,
    required this.lenguaMaterna,
    required this.grupoEtnico,
    required this.fuenteTrabajo,
    required this.escolaridad,
    required this.tenenciaTierra,
    required this.estadoCivil,
    required this.lugarOrigen,
    this.numeroHijos,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'edad': edad,
      'sexo': sexo,
      'lenguaMaterna': lenguaMaterna,
      'grupoEtnico': grupoEtnico,
      'fuenteTrabajo': fuenteTrabajo,
      'escolaridad': escolaridad,
      'tenenciaTierra': tenenciaTierra,
      'estadoCivil': estadoCivil,
      'lugarOrigen': lugarOrigen,
      'numeroHijos': numeroHijos,
    };
  }
}
