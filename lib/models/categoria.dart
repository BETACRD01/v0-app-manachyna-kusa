class Categoria {
  final String id;
  final String nombre;
  final String nombreKichwa;
  final String descripcion;
  final String icono;

  Categoria({
    required this.id,
    required this.nombre,
    required this.nombreKichwa,
    required this.descripcion,
    required this.icono,
  });

  // Método para crear una instancia desde un Map (por ejemplo de Firestore)
  factory Categoria.fromMap(Map<String, dynamic> data, String documentId) {
    return Categoria(
      id: documentId,
      nombre: data['nombre'] ?? '',
      nombreKichwa: data['nombreKichwa'] ?? '',
      descripcion: data['descripcion'] ?? '',
      icono: data['icono'] ?? '',
    );
  }

  // Método para convertir la instancia a Map (para guardar o actualizar en Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'nombreKichwa': nombreKichwa,
      'descripcion': descripcion,
      'icono': icono,
    };
  }
}
