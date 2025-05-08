import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';
import '../widgets/before_after_gallery.dart';
import '../widgets/app_drawer.dart';
import 'onboarding_screen.dart';
import 'welcome_screen.dart';
import 'catalog_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      drawer: const AppDrawer(),
      body: favorites.isEmpty
          ? const Center(child: Text('Nenhum item favoritado.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, index) {
                final product = favorites[index];
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

final Map<String, WidgetBuilder> appRoutes = {
  '/onboarding': (context) => const OnboardingScreen(),
  '/': (context) => const WelcomeScreen(),
  '/catalog': (context) => const CatalogScreen(),
  '/favorites': (context) => const FavoritesScreen(),
};