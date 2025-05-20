class Proveedor {
  final String id;
  final String nombre;
  final String especialidad;
  final double calificacion;
  final int numCalificaciones;
  final double distancia;
  final String foto;

  Proveedor({
    required this.id,
    required this.nombre,
    required this.especialidad,
    required this.calificacion,
    required this.numCalificaciones,
    required this.distancia,
    required this.foto,
  });

  /// Crea una instancia de [Proveedor] a partir de un Map de Firestore.
  factory Proveedor.fromMap(Map<String, dynamic> data, String documentId) {
    return Proveedor(
      id: documentId,
      nombre: data['nombre'] ?? '',
      especialidad: data['especialidad'] ?? '',
      calificacion: (data['calificacion'] is num)
          ? (data['calificacion'] as num).toDouble()
          : 0.0,
      numCalificaciones: data['numCalificaciones'] ?? 0,
      distancia: (data['distancia'] is num)
          ? (data['distancia'] as num).toDouble()
          : 0.0,
      foto: data['foto'] ?? '',
    );
  }

  /// Convierte la instancia de [Proveedor] en un Map para Firestore.
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'especialidad': especialidad,
      'calificacion': calificacion,
      'numCalificaciones': numCalificaciones,
      'distancia': distancia,
      'foto': foto,
    };
  }
}
