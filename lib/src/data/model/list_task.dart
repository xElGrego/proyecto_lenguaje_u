// ignore_for_file: non_constant_identifier_names

class ListTask {
  final int calificacion;
  final String descripcion;
  final String nombreMateria;
  final String nombre;
  final String estado;
  final String url_archivo_tarea;

  ListTask({
    required this.calificacion,
    required this.descripcion,
    required this.nombreMateria,
    required this.nombre,
    required this.estado,
    required this.url_archivo_tarea,
  });

  factory ListTask.fromJson(Map<String, dynamic> json) {
    return ListTask(
      calificacion: json["calificacion"],
      descripcion: json["descripcion"],
      nombreMateria: json["nombreMateria"],
      nombre: json["nombre"],
      estado: json["estado"],
      url_archivo_tarea: json["url_archivo_tarea"],
    );
  }
}
