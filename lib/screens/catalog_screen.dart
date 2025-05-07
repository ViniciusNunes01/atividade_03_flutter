import 'package:flutter/material.dart';
import '../widgets/before_after_gallery.dart';
import '../models/product.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: 'Cadeira Estofada',
        description: 'Cadeira bonita e estofada',
        imageBefore: 'assets/images/cadeira_estofada_before.jpg',
        imageAfter: 'assets/images/cadeira_estofada_after.jpg',
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: BeforeAfterGallery(product: products[index]),
          );
        },
      ),
    );
  }
}
