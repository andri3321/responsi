import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/amiibo.dart';
import '../providers/amiibo_provider.dart';

class DetailScreen extends StatelessWidget {
  final Amiibo amiibo;

  const DetailScreen({super.key, required this.amiibo});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AmiiboProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(amiibo.name),
        actions: [
          IconButton(
            icon: Icon(
              provider.favorites.contains(amiibo)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            onPressed: () {
              provider.toggleFavorite(amiibo);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(amiibo.image),
            ),
            const SizedBox(height: 16),
            Text(
              amiibo.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Game Series: ${amiibo.gameSeries}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Release date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'alooo',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
