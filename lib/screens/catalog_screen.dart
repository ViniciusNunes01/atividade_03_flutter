import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/before_after_gallery.dart';
import '../models/product.dart';
import 'favorites_screen.dart';
import '../widgets/app_drawer.dart';
import '../providers/favorites_provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Product> products = [
    Product(
      name: 'Cadeira Estofada',
      description: 'Cadeira bonita e estofada',
      imageBefore: 'assets/images/cadeira_estofada_before.png',
      imageAfter: 'assets/images/cadeira_estofada_after.png',
    ),
    Product(
      name: 'Relógio Antigo',
      description: 'Relógio restaurado, antes e depois.',
      imageBefore: 'assets/images/relogio_before.png',
      imageAfter: 'assets/images/relogio_after.png',
    ),
    Product(
      name: 'Isqueiro Zippo',
      description: 'Isqueiro Zippo restaurado, veja o antes e depois.',
      imageBefore: 'assets/images/isqueiro_zippo_before.png',
      imageAfter: 'assets/images/isqueiro_zippo_after.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.imageBefore, width: 56, height: 56),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: IconButton(
              icon: Icon(
                context.watch<FavoritesProvider>().isFavorite(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: context.watch<FavoritesProvider>().isFavorite(product)
                    ? Colors.red
                    : null,
              ),
              onPressed: () {
                context.read<FavoritesProvider>().toggleFavorite(product);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: Text(product.name)),
                    body: BeforeAfterGallery(product: product),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
