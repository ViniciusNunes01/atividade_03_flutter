import 'package:flutter/material.dart';
import '../models/product.dart';

class BeforeAfterGallery extends StatelessWidget {
  final Product product;

  const BeforeAfterGallery({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(product.name, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('Antes'),
                  Image.asset(product.imageBefore),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  const Text('Depois'),
                  Image.asset(product.imageAfter),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
