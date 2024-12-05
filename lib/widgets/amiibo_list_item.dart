import 'package:flutter/material.dart';
import '../models/amiibo.dart';

class AmiiboListItem extends StatelessWidget {
  final Amiibo amiibo;
  final VoidCallback onFavoriteToggle;
  final VoidCallback? onTap;
  final bool isFavorite;

  const AmiiboListItem({
    super.key,
    required this.amiibo,
    required this.onFavoriteToggle,
    this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(amiibo.image),
      title: Text(amiibo.name),
      subtitle: Text(amiibo.gameSeries),
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: onFavoriteToggle,
      ),
      onTap: onTap,
    );
  }
}
