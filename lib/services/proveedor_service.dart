import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/proveedor.dart';

class ProveedorService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todos los proveedores
  Future<List<Proveedor>> getProveedores() async {
    try {
      final snapshot = await _firestore.collection('proveedores').get();
      return snapshot.docs
          .map((doc) => Proveedor.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error al obtener proveedores: $e');
      return [];
    }
  }

  // Obtener proveedores por categoría
  Future<List<Proveedor>> getProveedoresByCategoria(String categoriaId) async {
    try {
      final snapshot = await _firestore
          .collection('proveedores')
          .where('categorias', arrayContains: categoriaId)
          .get();
      return snapshot.docs
          .map((doc) => Proveedor.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error al obtener proveedores por categoría: $e');
      return [];
    }
  }

  // Obtener un proveedor por ID
  Future<Proveedor?> getProveedorById(String proveedorId) async {
    try {
      final doc = await _firestore.collection('proveedores').doc(proveedorId).get();
      if (!doc.exists) {
        return null;
      }
      return Proveedor.fromMap(doc.data()!, doc.id);
    } catch (e) {
      print('Error al obtener proveedor: $e');
      return null;
    }
  }

  // Obtener proveedores cercanos (simulado)
  Future<List<Proveedor>> getProveedoresCercanos(
    double latitud,
    double longitud,
    double radio,
  ) async {
    try {
      // En una implementación real, se usaría una consulta geoespacial
      // Por ahora, simplemente devolvemos todos los proveedores
      final proveedores = await getProveedores();
      return proveedores;
    } catch (e) {
      print('Error al obtener proveedores cercanos: $e');
      return [];
    }
  }
}
