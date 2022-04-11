// ignore_for_file: non_constant_identifier_names

class ListTask {
  final String descripcion;
  final String nombreMateria;
  final String nombre;
  final String estado;
  final String url_archivo_tarea;
  final double calificacion;

  ListTask({
    required this.descripcion,
    required this.nombreMateria,
    required this.nombre,
    required this.estado,
    required this.url_archivo_tarea,
    required this.calificacion,
  });

  factory ListTask.fromJson(Map<String, dynamic> json) {
    return ListTask(
      descripcion: json["descripcion"],
      nombreMateria: json["nombreMateria"],
      calificacion: json["calificacion"] ,
      nombre: json["nombre"],
      estado: json["estado"],
      url_archivo_tarea: json["url_archivo_tarea"],
   
    );
  }
}
