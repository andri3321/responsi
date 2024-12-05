import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/amiibo_provider.dart';
import '../widgets/amiibo_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AmiiboProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: provider.favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                final amiibo = provider.favorites[index];
                return AmiiboListItem(
                  amiibo: amiibo,
                  onFavoriteToggle: () => provider.toggleFavorite(amiibo),
                  isFavorite: true,
                );
              },
            ),
    );
  }
}
