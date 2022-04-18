/* class ListaClases {
  final int idSala;
  final String nombre;

  ListaClases({
    required this.nombre,
    required this.idSala,
  });

  factory ListaClases.fromJson(Map<String, dynamic> json) {
    return ListaClases(
      nombre: json["nombre"],
      idSala: json["idSala"],
    );
  }
} */

class ListaClases {
  int? idSala;
  String? nombre;
  List<Personas>? personas;
  Materia? materia;
  Curso? curso;

  ListaClases({this.idSala, this.nombre, this.personas, this.materia, this.curso});

  ListaClases.fromJson(Map<String, dynamic> json) {
    idSala = json['idSala'];
    nombre = json['nombre'];
    if (json['personas'] != null) {
      personas = <Personas>[];
      json['personas'].forEach((v) {
        personas!.add(Personas.fromJson(v));
      });
    }
    materia = json['materia'] != null ? Materia.fromJson(json['materia']) : null;
    curso = json['curso'] != null ? Curso.fromJson(json['curso']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idSala'] = idSala;
    data['nombre'] = nombre;

    if (materia != null) {
      data['materia'] = materia!.toJson();
    }
    if (curso != null) {
      data['curso'] = curso!.toJson();
    }
    return data;
  }
}

class Personas {
  int? id;
  String? nombre;
  String? apellidos;
  String? correo;

  Personas({this.id, this.nombre, this.apellidos, this.correo});

  Personas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    correo = json['correo'];
  }
}

class Materia {
  int? id;
  String? nombre;
  String? descripcion;
  List<Tareas>? tareas;
 

  Materia({this.id, this.nombre, this.descripcion, this.tareas});

  Materia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    if (json['tareas'] != null) {
      tareas = <Tareas>[];
      json['tareas'].forEach((v) {
        tareas!.add(Tareas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    if (tareas != null) {
      data['tareas'] = tareas!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Tareas {
  int? idTarea;
  String? nombre;
  String? descripcion;
  String? urlArchivoTarea;
  String? estado;
  double? calificacion;
  String? fechaPublicacion;
  String? fechaEntrega;

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
    idTarea =json.containsKey('id_tarea') == true  ? json['id_tarea'] : json['idTarea'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    urlArchivoTarea = json.containsKey('url_archivo_tarea') == true ? json['url_archivo_tarea'] : json['urlArchivoTarea'];
    estado = json['estado'];
    calificacion = json['calificacion'];
    fechaPublicacion = json.containsKey('f_p') == true ? json['f_p'] : json['fechaPublicacion'];
    fechaEntrega = json.containsKey('f_p')  == true ? json['f_p'] : json['fechaEntrega']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idTarea'] = idTarea;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['urlArchivoTarea'] = urlArchivoTarea;
    data['estado'] = estado;
    data['calificacion'] = calificacion;
    data['fechaPublicacion'] = fechaPublicacion;
    data['fechaEntrega'] = fechaEntrega;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nombre'] = nombre;
    return data;
  }
}
