class ListaClases {
  final int idSala;
  final String nombre;
  /* final String descripcion; */

  ListaClases({
    required this.nombre,
    required this.idSala,
   /*  required this.descripcion, */
  });

  factory ListaClases.fromJson(Map<String, dynamic> json) {
    return ListaClases(
      nombre: json["nombre"],
      /* descripcion: json["descripcion"], */
      idSala: json["idSala"],

    );
  }
}


/* class ListaClases {
  int? idSala;
  String? nombre;
  Null? personas;
  Materia? materia;
  Curso? curso;

  ListaClases(
      {this.idSala, this.nombre, this.personas, this.materia, this.curso});

  ListaClases.fromJson(Map<String, dynamic> json) {
    idSala = json['idSala'];
    nombre = json['nombre'];
    personas = json['personas'];
    materia =
        json['materia'] != null ? new Materia.fromJson(json['materia']) : null;
    curso = json['curso'] != null ? new Curso.fromJson(json['curso']) : null;
  }

}

class Materia {
  int? id;
  String? nombre;
  String? descripcion;
  List<Tareas>? tareas;
  List<Null>? recursos;

  Materia({this.id, this.nombre, this.descripcion, this.tareas, this.recursos});

  Materia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    if (json['tareas'] != null) {
      tareas = <Tareas>[];
      json['tareas'].forEach((v) {
        tareas!.add(new Tareas.fromJson(v));
      });
    }
   
  }

}

class Tareas {
  int? idTarea;
  String? nombre;
  String? descripcion;
  String? urlArchivoTarea;
  String? estado;
  int? calificacion;
  String? fechaPublicacion;
  Null? fechaEntrega;

  Tareas(
      {this.idTarea,
      this.nombre,
      this.descripcion,
      this.urlArchivoTarea,
      this.estado,
      this.calificacion,
      this.fechaPublicacion,
      this.fechaEntrega});

  Tareas.fromJson(Map<String, dynamic> json) {
    idTarea = json['idTarea'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    urlArchivoTarea = json['urlArchivoTarea'];
    estado = json['estado'];
    calificacion = json['calificacion'];
    fechaPublicacion = json['fechaPublicacion'];
    fechaEntrega = json['fechaEntrega'];
  }


}

class Curso {
  int? id;
  String? nombre;

  Curso({this.id, this.nombre});

  Curso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
  }

} */