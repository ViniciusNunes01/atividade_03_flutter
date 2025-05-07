import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/before_after_gallery.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(product.description, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 20),
            BeforeAfterGallery(product: product),
          ],
        ),
      ),
    );
  }
}
