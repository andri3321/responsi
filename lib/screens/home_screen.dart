import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/amiibo_provider.dart';
import '../screens/detail_screen.dart';
import '../widgets/amiibo_list_item.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AmiiboProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Nitendo Amiibo list')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.amiibos.length,
              itemBuilder: (context, index) {
                final amiibo = provider.amiibos[index];
                return AmiiboListItem(
                  amiibo: amiibo,
                  onFavoriteToggle: () => provider.toggleFavorite(amiibo),
                  isFavorite: provider.favorites.contains(amiibo),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(amiibo: amiibo),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoriteScreen()),
            );
          }
        },
      ),
    );
  }
}
