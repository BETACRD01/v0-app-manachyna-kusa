class Servicio {
  final String id;
  final String nombre;
  final String proveedor;
  final double calificacion;
  final int numCalificaciones;
  final double precio;
  final String imagen;

  Servicio({
    required this.id,
    required this.nombre,
    required this.proveedor,
    required this.calificacion,
    required this.numCalificaciones,
    required this.precio,
    required this.imagen,
  });

  /// Crea una instancia de [Servicio] a partir de un Map de Firestore.
  factory Servicio.fromMap(Map<String, dynamic> data, String documentId) {
    return Servicio(
      id: documentId,
      nombre: data['nombre'] ?? '',
      proveedor: data['proveedor'] ?? '',
      calificacion: (data['calificacion'] is num)
          ? (data['calificacion'] as num).toDouble()
          : 0.0,
      numCalificaciones: data['numCalificaciones'] ?? 0,
      precio:
          (data['precio'] is num) ? (data['precio'] as num).toDouble() : 0.0,
      imagen: data['imagen'] ?? '',
    );
  }

  /// Convierte la instancia de [Servicio] en un Map para Firestore.
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'proveedor': proveedor,
      'calificacion': calificacion,
      'numCalificaciones': numCalificaciones,
      'precio': precio,
      'imagen': imagen,
    };
  }
}
