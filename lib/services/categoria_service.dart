import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/categoria.dart';

class CategoriaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todas las categorías
  Future<List<Categoria>> getCategorias() async {
    try {
      final snapshot = await _firestore.collection('categorias').get();

      if (snapshot.docs.isEmpty) {
        print('No hay categorías disponibles');
        return categoriasEjemplo;
      }

      return snapshot.docs
          .map((doc) => Categoria.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error al obtener categorías: $e');
      return categoriasEjemplo;
    }
  }

  // Obtener una categoría por ID
  Future<Categoria?> getCategoriaById(String categoriaId) async {
    try {
      final doc = await _firestore.collection('categorias').doc(categoriaId).get();

      if (!doc.exists) {
        print('No se encontró la categoría');
        return null;
      }

      return Categoria.fromMap(doc.data()!, doc.id);
    } catch (e) {
      print('Error al obtener categoría: $e');
      return null;
    }
  }
}

// Datos de ejemplo para categorías
final List<Categoria> categoriasEjemplo = [
  Categoria(
    id: 'c1',
    nombre: 'Limpieza',
    nombreKichwa: 'Pichana',
    descripcion: 'Servicios de limpieza para hogares y oficinas',
    icono: 'assets/images/categoria_limpieza.png',
  ),
  Categoria(
    id: 'c2',
    nombre: 'Plomería',
    nombreKichwa: 'Yaku Ruray',
    descripcion: 'Reparación e instalación de sistemas de agua',
    icono: 'assets/images/categoria_plomeria.png',
  ),
  Categoria(
    id: 'c3',
    nombre: 'Electricidad',
    nombreKichwa: 'Achik Ruray',
    descripcion: 'Instalación y reparación de sistemas eléctricos',
    icono: 'assets/images/categoria_electricidad.png',
  ),
  Categoria(
    id: 'c4',
    nombre: 'Carpintería',
    nombreKichwa: 'Kaspi Ruray',
    descripcion: 'Trabajos en madera y muebles',
    icono: 'assets/images/categoria_carpinteria.png',
  ),
  Categoria(
    id: 'c5',
    nombre: 'Jardinería',
    nombreKichwa: 'Pampa Kamay',
    descripcion: 'Mantenimiento de jardines y áreas verdes',
    icono: 'assets/images/categoria_jardineria.png',
  ),
  Categoria(
    id: 'c6',
    nombre: 'Cuidado',
    nombreKichwa: 'Kamana',
    descripcion: 'Cuidado de niños, adultos mayores y mascotas',
    icono: 'assets/images/categoria_cuidado.png',
  ),
];
