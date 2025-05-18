import 'package:flutter/material.dart';
import '../models/categoria.dart';

class CategoryCard extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.categoria,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Image.asset(
                  categoria.icono,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              categoria.nombre,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              categoria.nombreKichwa,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
